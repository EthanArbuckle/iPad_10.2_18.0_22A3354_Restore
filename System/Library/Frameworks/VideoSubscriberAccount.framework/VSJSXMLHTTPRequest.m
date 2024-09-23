@implementation VSJSXMLHTTPRequest

- (VSJSXMLHTTPRequest)init
{
  VSJSXMLHTTPRequest *v2;
  VSJSXMLHTTPRequest *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VSJSXMLHTTPRequest;
  v2 = -[VSJSObject init](&v5, sel_init);
  v3 = v2;
  if (v2)
    commonInit(v2);
  return v3;
}

- (VSJSXMLHTTPRequest)initWithContext:(id)a3
{
  VSJSXMLHTTPRequest *v3;
  VSJSXMLHTTPRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSJSXMLHTTPRequest;
  v3 = -[VSJSEventTargetObject initWithContext:](&v6, sel_initWithContext_, a3);
  v4 = v3;
  if (v3)
    commonInit(v3);
  return v4;
}

- (void)open:(id)a3 :(id)a4 :(id)a5 :(id)a6 :(id)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v11 && (objc_msgSend(v11, "BOOLValue") & 1) == 0)
    {
      -[VSJSObject context](self, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setExceptionWithMessage:", CFSTR("XMLHTTPRequest.open does not support synchronous invocation"), v14);
    }
    else
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v12);
      objc_msgSend(v13, "setHTTPMethod:", v15);
      -[VSJSXMLHTTPRequest _cancelCurrentRequestAndNotify:](self, "_cancelCurrentRequestAndNotify:", 0);
      -[VSJSXMLHTTPRequest setRequest:](self, "setRequest:", v13);
      -[VSJSXMLHTTPRequest setReadyState:](self, "setReadyState:", 1);
    }
  }
  else
  {
    -[VSJSObject context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setExceptionWithMessage:", CFSTR("XMLHTTPRequest.open invoked with invalid URL %@"), v10);
  }

}

- (void)send:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id location;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[VSJSXMLHTTPRequest send:]";
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  if (-[VSJSXMLHTTPRequest readyState](self, "readyState") == 1)
  {
    if (!v4 || (objc_msgSend(v4, "isNull") & 1) != 0 || (objc_msgSend(v4, "isUndefined") & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      if ((objc_msgSend(v4, "isString") & 1) == 0)
      {
        -[VSJSObject context](self, "context");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setExceptionWithMessage:", CFSTR("XMLHTTPRequest.send only supports string data"));
        goto LABEL_14;
      }
      objc_msgSend(v4, "toString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[VSJSXMLHTTPRequest request](self, "request");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dataUsingEncoding:", 4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setHTTPBody:", v14);

      }
    }
    -[VSJSXMLHTTPRequest request](self, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 == 0;

    if (v8)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [self request] parameter must not be nil."));
    -[VSJSXMLHTTPRequest request](self, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    -[VSJSXMLHTTPRequest session](self, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __27__VSJSXMLHTTPRequest_send___block_invoke;
    v15[3] = &unk_1E93A0C70;
    objc_copyWeak(&v16, &location);
    v15[4] = self;
    objc_msgSend(v10, "dataTaskWithRequest:completionHandler:", v9, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[VSJSXMLHTTPRequest setSessionTask:](self, "setSessionTask:", v11);
    objc_msgSend(v11, "resume");
    -[VSJSXMLHTTPRequest setRequestSent:](self, "setRequestSent:", 1);
    -[VSJSXMLHTTPRequest setReadyState:](self, "setReadyState:", 3);
    VSDefaultLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[VSJSXMLHTTPRequest send:]";
      _os_log_impl(&dword_1D2419000, v12, OS_LOG_TYPE_DEFAULT, "Will exit %s", buf, 0xCu);
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
  else
  {
    -[VSJSObject context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setExceptionWithMessage:", CFSTR("XMLHTTPRequest.setRequestHeader invoked in non-open state"));
  }
LABEL_14:

}

void __27__VSJSXMLHTTPRequest_send___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  id v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  VSDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1D2419000, v10, OS_LOG_TYPE_DEFAULT, "Received XHR response: %@ error: %@", (uint8_t *)&v20, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setUrlResponse:", v8);
    objc_msgSend(*(id *)(a1 + 32), "urlResponse");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setStatus:", objc_msgSend(v13, "statusCode"));

    if (!v9)
    {
      if (objc_msgSend(v7, "length"))
      {
        v18 = objc_alloc(MEMORY[0x1E0CB3940]);
        if (!v7)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The taskResponseData parameter must not be nil."));
        v19 = (void *)objc_msgSend(v18, "initWithData:encoding:", v7, 4);
        objc_msgSend(v12, "setResponseText:", v19);

      }
      v16 = CFSTR("onload");
      v17 = CFSTR("load");
      goto LABEL_15;
    }
    objc_msgSend(v9, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqual:", *MEMORY[0x1E0CB32E8]))
    {
      v15 = objc_msgSend(v9, "code");

      if (v15 == -1001)
      {
        v16 = CFSTR("ontimeout");
        v17 = CFSTR("timeout");
LABEL_15:
        objc_msgSend(v12, "_notifyWithFunctionName:eventName:info:", v16, v17, MEMORY[0x1E0C9AA70]);
        objc_msgSend(v12, "setRequest:", 0);
        objc_msgSend(v12, "setRequestSent:", 0);
        objc_msgSend(v12, "setSessionTask:", 0);
        objc_msgSend(v12, "setReadyState:", 4);
        goto LABEL_16;
      }
    }
    else
    {

    }
    v16 = CFSTR("onerror");
    v17 = CFSTR("error");
    goto LABEL_15;
  }
LABEL_16:

}

- (void)abort
{
  -[VSJSXMLHTTPRequest _cancelCurrentRequestAndNotify:](self, "_cancelCurrentRequestAndNotify:", 0);
}

- (id)getAllResponseHeaders
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  if (-[VSJSXMLHTTPRequest readyState](self, "readyState") == 4)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[VSJSXMLHTTPRequest urlResponse](self, "urlResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allHeaderFields");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__VSJSXMLHTTPRequest_getAllResponseHeaders__block_invoke;
    v9[3] = &unk_1E93A0C98;
    v10 = v3;
    v6 = v3;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\r\n"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[VSJSObject context](self, "context");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setExceptionWithMessage:", CFSTR("XMLHTTPRequest.getAllResponseHeaders invoked before request completed"));
    v7 = 0;
  }

  return v7;
}

void __43__VSJSXMLHTTPRequest_getAllResponseHeaders__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(a2, "lowercaseString");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@: %@"), v8, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", v7);
}

- (id)getResponseHeader:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[VSJSXMLHTTPRequest readyState](self, "readyState") == 4)
  {
    -[VSJSXMLHTTPRequest urlResponse](self, "urlResponse");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allHeaderFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[VSJSObject context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExceptionWithMessage:", CFSTR("XMLHTTPRequest.getResponseHeader invoked before request completed"));
    v7 = 0;
  }

  return v7;
}

- (void)setRequestHeader:(id)a3 :(id)a4
{
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (-[VSJSXMLHTTPRequest readyState](self, "readyState") != 1)
  {
    -[VSJSObject context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("XMLHTTPRequest.setRequestHeader invoked in non-open state");
    goto LABEL_11;
  }
  if (-[VSJSXMLHTTPRequest requestSent](self, "requestSent"))
  {
    -[VSJSObject context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("XMLHTTPRequest.setRequestHeader invoked after send");
LABEL_11:
    objc_msgSend(v7, "setExceptionWithMessage:", v9);
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    -[VSJSObject context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("XMLHTTPRequest.setRequestHeader invoked with invalid header or value");
    goto LABEL_11;
  }
  -[VSJSXMLHTTPRequest request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The request parameter must not be nil."));
  -[VSJSXMLHTTPRequest request](self, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forHTTPHeaderField:", v6, v11);

LABEL_12:
}

- (void)setReadyState:(unint64_t)a3
{
  if (self->_readyState != a3)
  {
    self->_readyState = a3;
    -[VSJSXMLHTTPRequest _notifyWithFunctionName:eventName:info:](self, "_notifyWithFunctionName:eventName:info:", CFSTR("onreadystatechange"), CFSTR("readystatechange"), MEMORY[0x1E0C9AA70]);
  }
}

- (void)_cancelCurrentRequestAndNotify:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v3 = a3;
  -[VSJSXMLHTTPRequest sessionTask](self, "sessionTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "cancel");
    -[VSJSXMLHTTPRequest setRequest:](self, "setRequest:", 0);
    -[VSJSXMLHTTPRequest setRequestSent:](self, "setRequestSent:", 0);
    -[VSJSXMLHTTPRequest setSessionTask:](self, "setSessionTask:", 0);
    if (v3)
    {
      objc_initWeak(&location, self);
      -[VSJSObject context](self, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x1E0C809B0];
      v9 = 3221225472;
      v10 = __53__VSJSXMLHTTPRequest__cancelCurrentRequestAndNotify___block_invoke;
      v11 = &unk_1E93A0CC0;
      objc_copyWeak(&v12, &location);
      objc_msgSend(v7, "evaluateWithBlock:", &v8);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    -[VSJSXMLHTTPRequest setReadyState:](self, "setReadyState:", 0, v8, v9, v10, v11);
  }

}

void __53__VSJSXMLHTTPRequest__cancelCurrentRequestAndNotify___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_notifyWithFunctionName:eventName:info:", CFSTR("onerror"), CFSTR("error"), MEMORY[0x1E0C9AA70]);
    WeakRetained = v2;
  }

}

- (void)_notifyWithFunctionName:(id)a3 eventName:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  VSDefaultLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[VSJSXMLHTTPRequest _notifyWithFunctionName:eventName:info:]";
    _os_log_impl(&dword_1D2419000, v11, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[VSJSObject context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__VSJSXMLHTTPRequest__notifyWithFunctionName_eventName_info___block_invoke;
  v16[3] = &unk_1E93A0CE8;
  objc_copyWeak(&v20, (id *)buf);
  v13 = v9;
  v17 = v13;
  v14 = v10;
  v18 = v14;
  v15 = v8;
  v19 = v15;
  objc_msgSend(v12, "evaluateWithBlock:", v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

}

void __61__VSJSXMLHTTPRequest__notifyWithFunctionName_eventName_info___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dispatchEvent:withInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v6 = (void *)MEMORY[0x1E0CBE108];
    objc_msgSend(v3, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueWithObject:inContext:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The thisValue parameter must not be nil."));
    VSDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 48);
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_1D2419000, v9, OS_LOG_TYPE_DEFAULT, "Will invoke method %@ for event with name %@", buf, 0x16u);
    }

    objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && (objc_msgSend(v12, "isNull") & 1) == 0 && (objc_msgSend(v13, "isUndefined") & 1) == 0)
    {
      v14 = *(_QWORD *)(a1 + 48);
      v17 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v8, "invokeMethod:withArguments:", v14, v15);

    }
  }

}

- (unint64_t)readyState
{
  return self->_readyState;
}

- (id)response
{
  return self->response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong(&self->response, a3);
}

- (NSString)responseText
{
  return self->responseText;
}

- (void)setResponseText:(id)a3
{
  objc_storeStrong((id *)&self->responseText, a3);
}

- (unint64_t)status
{
  return self->status;
}

- (void)setStatus:(unint64_t)a3
{
  self->status = a3;
}

- (NSString)statusText
{
  return self->statusText;
}

- (void)setStatusText:(id)a3
{
  objc_storeStrong((id *)&self->statusText, a3);
}

- (unint64_t)timeout
{
  return self->timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->timeout = a3;
}

- (NSString)responseType
{
  return self->responseType;
}

- (void)setResponseType:(id)a3
{
  objc_storeStrong((id *)&self->responseType, a3);
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSURLSessionTask)sessionTask
{
  return self->_sessionTask;
}

- (void)setSessionTask:(id)a3
{
  objc_storeStrong((id *)&self->_sessionTask, a3);
}

- (NSMutableURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSURLResponse)urlResponse
{
  return self->_urlResponse;
}

- (void)setUrlResponse:(id)a3
{
  objc_storeStrong((id *)&self->_urlResponse, a3);
}

- (BOOL)requestSent
{
  return self->_requestSent;
}

- (void)setRequestSent:(BOOL)a3
{
  self->_requestSent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlResponse, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_sessionTask, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->responseType, 0);
  objc_storeStrong((id *)&self->statusText, 0);
  objc_storeStrong((id *)&self->responseText, 0);
  objc_storeStrong(&self->response, 0);
}

@end
