@implementation MGRemoteQueryClient

+ (MGRemoteQueryClient)clientWithHandler:(id)a3 target:(id)a4 dispatchQueue:(id)a5 delegate:(id)a6 usingSession:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithHandler:target:dispatchQueue:delegate:session:", v16, v15, v14, v13, v12);

  return (MGRemoteQueryClient *)v17;
}

- (id)_initWithHandler:(id)a3 target:(id)a4 dispatchQueue:(id)a5 delegate:(id)a6 session:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  MGRemoteQueryClient *v18;
  MGRemoteQueryClient *v19;
  NSError *error;
  uint64_t v21;
  NSHTTPURLResponse *response;
  uint64_t v23;
  NSMutableData *payload;
  NSObject *v25;
  _QWORD v27[4];
  MGRemoteQueryClient *v28;
  id v29;
  objc_super v30;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v30.receiver = self;
  v30.super_class = (Class)MGRemoteQueryClient;
  v18 = -[MGRemoteQueryClient init](&v30, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_dispatchQueue, a5);
    objc_storeStrong((id *)&v19->_handler, a3);
    objc_storeStrong((id *)&v19->_target, a4);
    objc_storeWeak((id *)&v19->_delegate, v16);
    v19->_invalidated = 0;
    error = v19->_error;
    v19->_error = 0;

    v21 = -[MGRemoteQueryClientTarget protocolVersion](v19->_target, "protocolVersion");
    response = v19->_response;
    v19->_protocolVersion = v21;
    v19->_response = 0;

    v19->_expectedPayloadSize = 0;
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v23 = objc_claimAutoreleasedReturnValue();
    payload = v19->_payload;
    v19->_payload = (NSMutableData *)v23;

    v19->_processedResult = 0;
    -[MGRemoteQueryClient dispatchQueue](v19, "dispatchQueue");
    v25 = objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __78__MGRemoteQueryClient__initWithHandler_target_dispatchQueue_delegate_session___block_invoke;
    v27[3] = &unk_24E0AA5E8;
    v28 = v19;
    v29 = v17;
    dispatch_async(v25, v27);

  }
  return v19;
}

uint64_t __78__MGRemoteQueryClient__initWithHandler_target_dispatchQueue_delegate_session___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareConnection:", *(_QWORD *)(a1 + 40));
}

- (void)dealloc
{
  objc_super v3;

  -[MGRemoteQueryClient _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MGRemoteQueryClient;
  -[MGRemoteQueryClient dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClient task](self, "task");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClient target](self, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClient handler](self, "handler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClient payload](self, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, _task = %@, _target = %@, _handler = %@, payload %lu/%lu>"), v5, self, v6, v7, v8, objc_msgSend(v9, "length"), -[MGRemoteQueryClient expectedPayloadSize](self, "expectedPayloadSize"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)consumeResponse:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MGRemoteQueryClient dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__MGRemoteQueryClient_consumeResponse___block_invoke;
  v7[3] = &unk_24E0AA5E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __39__MGRemoteQueryClient_consumeResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_responseStart:", *(_QWORD *)(a1 + 40));
}

- (void)consumeData:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MGRemoteQueryClient dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__MGRemoteQueryClient_consumeData___block_invoke;
  v7[3] = &unk_24E0AA5E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __35__MGRemoteQueryClient_consumeData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_responseAppend:", *(_QWORD *)(a1 + 40));
}

- (void)completeWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MGRemoteQueryClient *v9;

  v4 = a3;
  -[MGRemoteQueryClient dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__MGRemoteQueryClient_completeWithError___block_invoke;
  v7[3] = &unk_24E0AA5E8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __41__MGRemoteQueryClient_completeWithError___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    goto LABEL_5;
  if ((objc_msgSend(*(id *)(a1 + 40), "processedResult") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "_responseComplete");
  if (*(_QWORD *)(a1 + 32))
LABEL_5:
    objc_msgSend(*(id *)(a1 + 40), "_handleError:");
  return objc_msgSend(*(id *)(a1 + 40), "_invalidated");
}

- (void)_prepareConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  MGRemoteQueryClient *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryClient dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MGRemoteQueryClient task](self, "task");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    MGLogForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[MGRemoteQueryClient task](self, "task");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 134218242;
      v16 = self;
      v17 = 2112;
      v18 = v8;
      _os_log_error_impl(&dword_21CBD2000, v7, OS_LOG_TYPE_ERROR, "%p client already running %@", (uint8_t *)&v15, 0x16u);
LABEL_10:

    }
  }
  else
  {
    if (!-[MGRemoteQueryClient invalidated](self, "invalidated"))
    {
      -[MGRemoteQueryClient _prepareURL](self, "_prepareURL");
      v7 = objc_claimAutoreleasedReturnValue();
      -[MGRemoteQueryClient _prepareRequest:](self, "_prepareRequest:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dataTaskWithRequest:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_task, v9);
      -[MGRemoteQueryClient target](self, "target");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "endpoint");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "set_hostOverride:", v11);

      objc_msgSend(v9, "resume");
      MGLogForCategory(6);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        -[MGRemoteQueryClient handler](self, "handler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MGRemoteQueryClient target](self, "target");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 134218754;
        v16 = self;
        v17 = 2112;
        v18 = v9;
        v19 = 2112;
        v20 = v13;
        v21 = 2112;
        v22 = v14;
        _os_log_impl(&dword_21CBD2000, v12, OS_LOG_TYPE_DEFAULT, "%p client using %@ for issuing handler %@ to %@", (uint8_t *)&v15, 0x2Au);

      }
      goto LABEL_10;
    }
    MGLogForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v15 = 134217984;
      v16 = self;
      _os_log_error_impl(&dword_21CBD2000, v7, OS_LOG_TYPE_ERROR, "%p client invalidated, not starting", (uint8_t *)&v15, 0xCu);
    }
  }

}

- (void)_handleError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  MGRemoteQueryClient *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryClient dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!-[MGRemoteQueryClient invalidated](self, "invalidated"))
  {
    -[MGRemoteQueryClient error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      MGLogForCategory(6);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = 134218242;
        v9 = self;
        v10 = 2112;
        v11 = v4;
        _os_log_error_impl(&dword_21CBD2000, v7, OS_LOG_TYPE_ERROR, "%p client failed, error %@", (uint8_t *)&v8, 0x16u);
      }

      -[MGRemoteQueryClient setError:](self, "setError:", v4);
      -[MGRemoteQueryClient _invalidate](self, "_invalidate");
    }
  }

}

- (void)_invalidate
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  MGRemoteQueryClient *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!-[MGRemoteQueryClient invalidated](self, "invalidated"))
  {
    MGLogForCategory(6);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[MGRemoteQueryClient error](self, "error");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 134218242;
      v7 = self;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_21CBD2000, v3, OS_LOG_TYPE_DEFAULT, "%p client invalidating, error %@", (uint8_t *)&v6, 0x16u);

    }
    -[MGRemoteQueryClient setInvalidated:](self, "setInvalidated:", 1);
    -[MGRemoteQueryClient task](self, "task");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancel");

  }
}

- (void)_invalidated
{
  NSObject *v3;
  void *v4;
  id v5;

  -[MGRemoteQueryClient dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MGRemoteQueryClient delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MGRemoteQueryClient error](self, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientInvalidated:withError:", self, v4);

  }
}

- (id)_prepareURL
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[MGRemoteQueryClient dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v4, "setScheme:", CFSTR("https"));
  -[MGRemoteQueryClient target](self, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", nw_endpoint_get_bonjour_fullname());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "URLHostAllowedCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%"), CFSTR("37"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHost:", v10);
  -[MGRemoteQueryClient handler](self, "handler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "prepareURL:", v4);

  objc_msgSend(v4, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_prepareRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MGRemoteQueryClient dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7458]), "initWithURL:", v4);
  objc_msgSend(v6, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v6, "rq_setProtocolVersion:", -[MGRemoteQueryClient protocolVersion](self, "protocolVersion"));
  objc_msgSend(v6, "rq_setTimeout:", 900);
  -[MGRemoteQueryClient handler](self, "handler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "prepareRequest:", v6);

  return v6;
}

- (void)_responseStart:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  MGRemoteQueryClient *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryClient dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[MGRemoteQueryClient invalidated](self, "invalidated"))
  {
    MGLogForCategory(6);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = 134218242;
      v9 = self;
      v10 = 2112;
      v11 = v4;
      _os_log_debug_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_DEBUG, "%p client invalidated, so disregarding new response %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (-[MGRemoteQueryClient _responseValidate:](self, "_responseValidate:", v4))
  {
    -[MGRemoteQueryClient setProcessedResult:](self, "setProcessedResult:", 0);
    -[MGRemoteQueryClient setResponse:](self, "setResponse:", v4);
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v6 = objc_claimAutoreleasedReturnValue();
    -[MGRemoteQueryClient setPayload:](self, "setPayload:", v6);
  }
  else
  {
    MGLogForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 134218242;
      v9 = self;
      v10 = 2112;
      v11 = v4;
      _os_log_error_impl(&dword_21CBD2000, v7, OS_LOG_TYPE_ERROR, "%p client received invalid response %@", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 94, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    -[MGRemoteQueryClient _handleError:](self, "_handleError:", v6);
  }

}

- (BOOL)_responseValidate:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  BOOL v15;

  v4 = a3;
  -[MGRemoteQueryClient dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_msgSend(v4, "statusCode");
  v7 = objc_msgSend(v4, "rq_protocolVersion");
  v9 = -[MGRemoteQueryClient protocolVersion](self, "protocolVersion") == v7 && v6 == 200;
  -[MGRemoteQueryClient handler](self, "handler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 &= objc_msgSend(v10, "validateResponse:", v4);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BDE1220]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForHTTPHeaderField:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_14;
  if ((objc_msgSend(v12, "hasPrefix:", CFSTR("multipart/x-mixed-replace;")) & 1) != 0)
    goto LABEL_16;
  v13 = objc_msgSend(v4, "expectedContentLength");
  if ((v13 & 0x8000000000000000) == 0)
  {
    if (v13 > 0x7D000)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 40, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MGRemoteQueryClient _handleError:](self, "_handleError:", v14);

      goto LABEL_14;
    }
    -[MGRemoteQueryClient setExpectedPayloadSize:](self, "setExpectedPayloadSize:", v13);
LABEL_16:
    v15 = 1;
    goto LABEL_17;
  }
LABEL_14:
  v15 = 0;
LABEL_17:

  return v15;
}

- (void)_responseAppend:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  NSObject *v13;
  int v14;
  MGRemoteQueryClient *v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryClient dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[MGRemoteQueryClient invalidated](self, "invalidated"))
  {
    MGLogForCategory(6);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v14 = 134218242;
      v15 = self;
      v16 = 2112;
      v17 = (unint64_t)v4;
      _os_log_debug_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_DEBUG, "%p client invalidated, so disregarding data %@", (uint8_t *)&v14, 0x16u);
    }
LABEL_11:

    goto LABEL_12;
  }
  -[MGRemoteQueryClient response](self, "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    MGLogForCategory(6);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v14 = 134218242;
      v15 = self;
      v16 = 2112;
      v17 = (unint64_t)v4;
      _os_log_error_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_ERROR, "%p discarding responseless data %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_11;
  }
  -[MGRemoteQueryClient payload](self, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendData:", v4);

  -[MGRemoteQueryClient payload](self, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  v11 = -[MGRemoteQueryClient expectedPayloadSize](self, "expectedPayloadSize");
  if (v11 < v10)
  {
    v12 = v11;
    MGLogForCategory(6);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 134218496;
      v15 = self;
      v16 = 2048;
      v17 = v10;
      v18 = 2048;
      v19 = v12;
      _os_log_error_impl(&dword_21CBD2000, v13, OS_LOG_TYPE_ERROR, "%p client payload %lu exceeds expectations %lu", (uint8_t *)&v14, 0x20u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 27, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    -[MGRemoteQueryClient _handleError:](self, "_handleError:", v6);
    goto LABEL_11;
  }
  if (v11 == v10 && !-[MGRemoteQueryClient processedResult](self, "processedResult"))
    -[MGRemoteQueryClient _responseComplete](self, "_responseComplete");
LABEL_12:

}

- (void)_responseComplete
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  MGRemoteQueryClient *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryClient dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[MGRemoteQueryClient processedResult](self, "processedResult"))
  {
    -[MGRemoteQueryClient setProcessedResult:](self, "setProcessedResult:", 1);
    v4 = (void *)MEMORY[0x24BDD1608];
    -[MGRemoteQueryClient payload](self, "payload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v4, "JSONObjectWithData:options:error:", v5, 0, &v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;

    if (v7)
    {
      MGLogForCategory(6);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v16 = self;
        v17 = 2112;
        v18 = v7;
        _os_log_error_impl(&dword_21CBD2000, v8, OS_LOG_TYPE_ERROR, "%p client encountered decoding error %@", buf, 0x16u);
      }

      -[MGRemoteQueryClient _handleError:](self, "_handleError:", v7);
    }
    else
    {
      -[MGRemoteQueryClient response](self, "response");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 && v6)
      {
        -[MGRemoteQueryClient handler](self, "handler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleCompleteResponse:jsonPayload:", v9, v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        MGLogForCategory(6);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v11)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218498;
            v16 = self;
            v17 = 2048;
            v18 = v10;
            v19 = 2112;
            v20 = v11;
            _os_log_error_impl(&dword_21CBD2000, v13, OS_LOG_TYPE_ERROR, "%p client response handling via %p encountered error %@", buf, 0x20u);
          }

          -[MGRemoteQueryClient _handleError:](self, "_handleError:", v11);
        }
        else
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218240;
            v16 = self;
            v17 = 2048;
            v18 = v10;
            _os_log_debug_impl(&dword_21CBD2000, v13, OS_LOG_TYPE_DEBUG, "%p client response handling via %p succeeded", buf, 0x16u);
          }

        }
      }

    }
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (MGRemoteQueryClientHandlerProtocol)handler
{
  return self->_handler;
}

- (MGRemoteQueryClientTarget)target
{
  return self->_target;
}

- (NSURLSessionDataTask)task
{
  return self->_task;
}

- (MGRemoteQueryClientDelegate)delegate
{
  return (MGRemoteQueryClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(unint64_t)a3
{
  self->_protocolVersion = a3;
}

- (NSHTTPURLResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (unint64_t)expectedPayloadSize
{
  return self->_expectedPayloadSize;
}

- (void)setExpectedPayloadSize:(unint64_t)a3
{
  self->_expectedPayloadSize = a3;
}

- (NSMutableData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (BOOL)processedResult
{
  return self->_processedResult;
}

- (void)setProcessedResult:(BOOL)a3
{
  self->_processedResult = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (id)query
{
  void *v2;
  void *v3;

  -[MGRemoteQueryClient handler](self, "handler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "query");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
