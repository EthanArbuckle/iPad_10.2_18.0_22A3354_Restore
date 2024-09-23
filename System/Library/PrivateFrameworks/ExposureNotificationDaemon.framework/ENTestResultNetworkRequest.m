@implementation ENTestResultNetworkRequest

- (ENTestResultNetworkRequest)initWithRequestURL:(id)a3 URLSession:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  ENTestResultNetworkRequest *v11;
  uint64_t v12;
  NSURL *requestURL;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ENTestResultNetworkRequest;
  v11 = -[ENTestResultNetworkRequest init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    requestURL = v11->_requestURL;
    v11->_requestURL = (NSURL *)v12;

    objc_storeStrong((id *)&v11->_queue, a5);
    objc_storeStrong((id *)&v11->_URLSession, a4);
  }

  return v11;
}

- (void)invalidate
{
  NSURLSessionTask *URLSessionTask;
  id completionHandler;

  -[NSURLSessionTask cancel](self->_URLSessionTask, "cancel");
  URLSessionTask = self->_URLSessionTask;
  self->_URLSessionTask = 0;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

}

- (id)getPaddedBodyJSONAndReturnError:(id *)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  -[ENTestResultNetworkRequest bodyJSON](self, "bodyJSON");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ENTestResultNetworkRequest paddedRequestSize](self, "paddedRequestSize");
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &stru_1E87DD6B8, CFSTR("padding"));
    if ((objc_msgSend(MEMORY[0x1E0CB36E0], "isValidJSONObject:", v5) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB36E0], "dataWithJSONObject:options:error:", v8, 0, a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v18 = 0;
        v19 = &v18;
        v20 = 0x2020000000;
        v21 = 0;
        v21 = objc_msgSend(v9, "length");
        -[ENTestResultNetworkRequest requestHeaders](self, "requestHeaders");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __62__ENTestResultNetworkRequest_getPaddedBodyJSONAndReturnError___block_invoke;
        v17[3] = &unk_1E87DB010;
        v17[4] = &v18;
        objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v17);

        if (v7 <= v19[3])
        {
          if (a3)
          {
            ENErrorF();
            v15 = 0;
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v15 = 0;
          }
        }
        else
        {
          NSRandomData();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "base64EncodedStringWithOptions:", 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("padding"));

            v15 = v8;
          }
          else
          {
            v15 = 0;
          }

        }
        _Block_object_dispose(&v18, 8);
      }
      else
      {
        v15 = 0;
      }

    }
    else if (a3)
    {
      ENErrorF();
      v15 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = v5;
  }

  return v15;
}

void __62__ENTestResultNetworkRequest_getPaddedBodyJSONAndReturnError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;

  v5 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(a2, "length");
  v6 = objc_msgSend(v5, "length");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v6;
}

- (void)resumeWithCompletionHandler:(id)a3
{
  void *v4;
  id completionHandler;
  void *v6;
  id v7;
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  completionHandler = self->_completionHandler;
  self->_completionHandler = v4;

  v8 = 0;
  -[ENTestResultNetworkRequest _createURLRequestWithError:](self, "_createURLRequestWithError:", &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;
  if (v6)
    -[ENTestResultNetworkRequest _performURLRequest:attempt:](self, "_performURLRequest:attempt:", v6, 0);
  else
    -[ENTestResultNetworkRequest _completeWithError:](self, "_completeWithError:", v7);

}

- (void)handleURLResponse:(id)a3 data:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSURLSessionTask *URLSessionTask;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSURLSessionTask cancel](self->_URLSessionTask, "cancel");
  URLSessionTask = self->_URLSessionTask;
  self->_URLSessionTask = 0;

  v12 = v8;
  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v12, "statusCode");
  if (v12)
  {
    v16 = v15;
    if (v9)
    {
      v35 = 0;
      -[ENTestResultNetworkRequest _dictionaryFromData:response:error:](self, "_dictionaryFromData:response:error:", v9, v12, &v35);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v35;
    }
    else
    {
      v17 = 0;
      v18 = 0;
    }
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isSensitiveLoggingAllowed");

    if ((v22 & 1) != 0
      && gLogCategory_ENTestResultNetworkRequest <= 30
      && (gLogCategory_ENTestResultNetworkRequest != -1 || _LogCategory_Initialize()))
    {
      v33 = objc_msgSend(v9, "length");
      v34 = v17;
      v29 = v14;
      v31 = v16;
      LogPrintF_safe();
    }
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", v29, v31, v33, v34);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isSensitiveLoggingAllowed");

    if (v24
      && gLogCategory_ENTestResultNetworkRequest <= 30
      && (gLogCategory_ENTestResultNetworkRequest != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v12, "allHeaderFields");
      v30 = v14;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    if (v16 == 200)
    {
      if (v17)
        goto LABEL_26;
    }
    else
    {
      if (!v18)
      {
        if (v17)
          v25 = v17;
        else
          v25 = (void *)MEMORY[0x1E0C9AA68];
        -[ENTestResultNetworkRequest errorForUnsuccessfulResponse:body:](self, "errorForUnsuccessfulResponse:body:", v12, v25, v30, v32);
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (v17)
      {
LABEL_26:
        if (!v18)
        {
          CFStringGetTypeID();
          CFDictionaryGetTypedValue();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v26 && objc_msgSend(v26, "length"))
          {
            v30 = v27;
            ENTestResultErrorF(6);
            v28 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            -[ENTestResultNetworkRequest handleResponse:body:](self, "handleResponse:body:", v12, v17, v30);
            v28 = objc_claimAutoreleasedReturnValue();
          }
          v18 = (id)v28;

          goto LABEL_38;
        }
      }
    }
    if (v18)
      goto LABEL_38;
LABEL_37:
    ENTestResultErrorF(1);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isSensitiveLoggingAllowed");

  if (v20
    && gLogCategory_ENTestResultNetworkRequest <= 90
    && (gLogCategory_ENTestResultNetworkRequest != -1 || _LogCategory_Initialize()))
  {
    v29 = v10;
    LogPrintF_safe();
  }
  -[ENTestResultNetworkRequest _errorForURLRequestError:](self, "_errorForURLRequestError:", v10, v29);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if (!v18)
    goto LABEL_37;
LABEL_38:
  -[ENTestResultNetworkRequest _completeWithError:](self, "_completeWithError:", v18, v30);

}

- (void)setMaxRetryTime:(unint64_t)a3
{
  self->_maxRetryTime = a3;
}

- (id)_dictionaryFromData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "length"))
  {
    v12 = (id)MEMORY[0x1E0C9AA68];
    goto LABEL_21;
  }
  objc_msgSend(v8, "MIMEType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB36E0], "JSONObjectWithData:options:error:", v7, 0, &v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v22;
  if (!v10)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("application/json")))
    {
      if (a5)
      {
        ENNestedTestResultErrorF(v11, 4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:
        v12 = 0;
        *a5 = v19;
        goto LABEL_20;
      }
      goto LABEL_32;
    }
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("text/plain")))
      goto LABEL_18;
    if ((unint64_t)objc_msgSend(v7, "length") > 0x3FF)
    {
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isSensitiveLoggingAllowed");

      if (!v17
        || gLogCategory_ENTestResultNetworkRequest > 50
        || gLogCategory_ENTestResultNetworkRequest == -1 && !_LogCategory_Initialize())
      {
LABEL_18:
        if (objc_msgSend(v8, "statusCode", v20, v21) != 200)
        {
          v12 = (id)MEMORY[0x1E0C9AA68];
          goto LABEL_20;
        }
        if (a5)
          goto LABEL_30;
        goto LABEL_32;
      }
      objc_msgSend(v8, "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v13;
      v21 = objc_msgSend(v7, "length");
      LogPrintF_safe();
    }
    else
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3938]), "initWithData:encoding:", v7, 4);
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isSensitiveLoggingAllowed");

      if (v15
        && gLogCategory_ENTestResultNetworkRequest <= 50
        && (gLogCategory_ENTestResultNetworkRequest != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v8, "URL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (uint64_t)v13;
        LogPrintF_safe();

      }
    }

    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a5)
    {
LABEL_30:
      ENTestResultErrorF(4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
LABEL_32:
    v12 = 0;
    goto LABEL_20;
  }
  v12 = v10;
LABEL_20:

LABEL_21:
  return v12;
}

- (NSDictionary)additionalRequestHeaders
{
  return (NSDictionary *)MEMORY[0x1E0C9AA68];
}

- (NSDictionary)bodyJSON
{
  return (NSDictionary *)MEMORY[0x1E0C9AA68];
}

- (id)handleResponse:(id)a3 body:(id)a4
{
  return 0;
}

- (id)errorForUnsuccessfulResponse:(id)a3 body:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = a4;
  v6 = a3;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "statusCode");
  if (v9 == 429)
  {
    ENTestResultErrorF(7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(&unk_1E87EE1D8, "objectForKeyedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v13 = objc_msgSend(v11, "integerValue");
    else
      v13 = 6;
    objc_msgSend(v7, "length");
    ENTestResultErrorF(v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_createURLRequestWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  id v18;
  id v19;
  id v20;

  v5 = (void *)MEMORY[0x1D17A7CB8](self, a2);
  v20 = 0;
  -[ENTestResultNetworkRequest getPaddedBodyJSONAndReturnError:](self, "getPaddedBodyJSONAndReturnError:", &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  if (!v6)
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isSensitiveLoggingAllowed");

    if (v9
      && gLogCategory_ENTestResultNetworkRequest <= 90
      && (gLogCategory_ENTestResultNetworkRequest != -1 || _LogCategory_Initialize()))
    {
      v17 = objc_opt_class();
      v18 = v7;
      LogPrintF_safe();
    }
    -[ENTestResultNetworkRequest bodyJSON](self, "bodyJSON", v17, v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(MEMORY[0x1E0CB36E0], "isValidJSONObject:", v6))
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CB36E0], "dataWithJSONObject:options:error:", v6, 0, &v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v19;
  }
  else
  {
    v11 = 0;
    v10 = 0;
  }

  objc_autoreleasePoolPop(v5);
  if (v10)
  {
    v12 = objc_alloc(MEMORY[0x1E0C92C30]);
    -[ENTestResultNetworkRequest requestURL](self, "requestURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithURL:", v13);

    -[ENTestResultNetworkRequest requestHeaders](self, "requestHeaders");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAllHTTPHeaderFields:", v15);

    objc_msgSend(v14, "setHTTPBody:", v10);
    objc_msgSend(v14, "setHTTPMethod:", CFSTR("POST"));
  }
  else if (a3)
  {
    ENNestedTestResultErrorF(v11, 1);
    v14 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSDictionary)requestHeaders
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E00]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_APIKey, CFSTR("X-API-Key"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("application/json"), CFSTR("Content-Type"));
  -[ENTestResultNetworkRequest additionalRequestHeaders](self, "additionalRequestHeaders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  v5 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v5;
}

- (id)_errorForURLRequestError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB32E0]);

  if (!v5 || (v6 = objc_msgSend(v3, "code"), v6 == -1002))
  {
    v7 = v3;
    v8 = 1;
  }
  else if (v6 == -1001)
  {
    v7 = v3;
    v8 = 8;
  }
  else
  {
    v7 = v3;
    v8 = 11;
  }
  ENNestedTestResultErrorF(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_performURLRequest:(id)a3 attempt:(int)a4
{
  id v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  _QWORD v13[3];
  int v14;

  v7 = a3;
  if (self->_URLSessionTask)
  {
    objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENTestResultNetworkRequest.m"), 296, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_URLSessionTask"));

  }
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__ENTestResultNetworkRequest__performURLRequest_attempt___block_invoke;
  v10[3] = &unk_1E87DB038;
  v10[4] = self;
  v12 = v13;
  v8 = v7;
  v11 = v8;
  -[ENTestResultNetworkRequest _dataTaskWithRequest:completionHandler:](self, "_dataTaskWithRequest:completionHandler:", v8, v10);

  _Block_object_dispose(v13, 8);
}

void __57__ENTestResultNetworkRequest__performURLRequest_attempt___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  id *v16;
  uint64_t v17;
  void *v18;
  dispatch_time_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];
  __int128 v30;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(*(id *)(a1 + 32), "retryCheck:retryAttempt:baseMultiplier:", v8, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), 2);
  if (v10)
  {
    v11 = v10;
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isSensitiveLoggingAllowed");

    if (v13
      && gLogCategory_ENTestResultNetworkRequest <= 30
      && (gLogCategory_ENTestResultNetworkRequest != -1 || _LogCategory_Initialize()))
    {
      v23 = v11;
      LogPrintF_safe();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "cancel", v23);
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 32);
    *(_QWORD *)(v17 + 32) = 0;

    v19 = dispatch_time(0, 1000000000 * v11);
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(NSObject **)(v20 + 16);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __57__ENTestResultNetworkRequest__performURLRequest_attempt___block_invoke_2;
    v29[3] = &unk_1E87D9D88;
    v29[4] = v20;
    v16 = (id *)&v30;
    v24 = *(_OWORD *)(a1 + 40);
    v22 = (id)v24;
    v30 = v24;
    dispatch_after(v19, v21, v29);
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(NSObject **)(v14 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__ENTestResultNetworkRequest__performURLRequest_attempt___block_invoke_3;
    block[3] = &unk_1E87DA9C0;
    block[4] = v14;
    v16 = &v26;
    v26 = v8;
    v27 = v7;
    v28 = v9;
    dispatch_async(v15, block);

  }
}

uint64_t __57__ENTestResultNetworkRequest__performURLRequest_attempt___block_invoke_2(uint64_t a1)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return objc_msgSend(*(id *)(a1 + 32), "_performURLRequest:attempt:", *(_QWORD *)(a1 + 40));
}

uint64_t __57__ENTestResultNetworkRequest__performURLRequest_attempt___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleURLResponse:data:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_dataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSURLSession *URLSession;
  id v9;
  NSURLSessionTask *v10;
  NSURLSessionTask *URLSessionTask;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;

  v6 = a3;
  v7 = a4;
  URLSession = self->_URLSession;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __69__ENTestResultNetworkRequest__dataTaskWithRequest_completionHandler___block_invoke;
  v22 = &unk_1E87DB060;
  v9 = v7;
  v23 = v9;
  -[NSURLSession dataTaskWithRequest:completionHandler:](URLSession, "dataTaskWithRequest:completionHandler:", v6, &v19);
  v10 = (NSURLSessionTask *)objc_claimAutoreleasedReturnValue();
  URLSessionTask = self->_URLSessionTask;
  self->_URLSessionTask = v10;

  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isSensitiveLoggingAllowed");

  if (v13
    && gLogCategory_ENTestResultNetworkRequest <= 30
    && (gLogCategory_ENTestResultNetworkRequest != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v6, "allHTTPHeaderFields");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "HTTPBody");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v14;
    v18 = objc_msgSend(v15, "length");
    v16 = v6;
    LogPrintF_safe();

  }
  -[NSURLSessionTask resume](self->_URLSessionTask, "resume", v16, v17, v18, v19, v20, v21, v22);

}

uint64_t __69__ENTestResultNetworkRequest__dataTaskWithRequest_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)retryCheck:(id)a3 retryAttempt:(int)a4 baseMultiplier:(int)a5
{
  uint64_t v9;
  uint32x2_t v10;
  int32x2_t v11;
  int32x2_t v12;
  unsigned int v13;
  int64x2_t v14;
  int8x16_t v15;
  uint32x2_t v16;
  uint32x2_t v17;
  int8x16_t v18;
  unint64_t v19;
  unint64_t v20;
  BOOL v22;

  v9 = objc_msgSend(a3, "statusCode");
  if (a4 < 0)
  {
    v19 = 0;
  }
  else
  {
    v10 = (uint32x2_t)vdup_n_s32(a4);
    v11 = vdup_n_s32(a5);
    v12 = (int32x2_t)0x100000000;
    v13 = (a4 & 0xFFFFFFFE) + 2;
    v14 = 0uLL;
    do
    {
      v15 = (int8x16_t)v14;
      v16 = (uint32x2_t)v12;
      v14 = vaddw_s32(v14, (int32x2_t)vshl_u32((uint32x2_t)0x100000001, (uint32x2_t)vmul_s32(v12, v11)));
      v12 = vadd_s32(v12, (int32x2_t)0x200000002);
      v13 -= 2;
    }
    while (v13);
    v17 = vcgt_u32(v16, v10);
    v18.i64[0] = v17.i32[0];
    v18.i64[1] = v17.i32[1];
    v19 = vaddvq_s64((int64x2_t)vbslq_s8(v18, v15, (int8x16_t)v14));
  }
  v20 = 0;
  v22 = v9 != 429 && (unint64_t)(v9 - 600) < 0xFFFFFFFFFFFFFF9CLL;
  if (a3)
  {
    if (v9)
    {
      if (!v22)
      {
        v20 = 1 << (a5 * a4);
        if (v19 >= self->_maxRetryTime)
          return 0;
      }
    }
  }
  return v20;
}

- (void)_completeWithError:(id)a3
{
  NSError *v4;
  NSError *error;
  uint64_t v6;
  void *v7;
  id completionHandler;
  id v9;

  v9 = a3;
  v4 = (NSError *)objc_msgSend(v9, "copy");
  error = self->_error;
  self->_error = v4;

  v6 = MEMORY[0x1D17A7E5C](self->_completionHandler);
  v7 = (void *)v6;
  if (v6)
  {
    (*(void (**)(uint64_t, ENTestResultNetworkRequest *, id))(v6 + 16))(v6, self, v9);
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

  }
}

- (NSURL)requestURL
{
  return self->_requestURL;
}

- (NSString)APIKey
{
  return self->_APIKey;
}

- (void)setAPIKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)paddedRequestSize
{
  return self->_paddedRequestSize;
}

- (void)setPaddedRequestSize:(unint64_t)a3
{
  self->_paddedRequestSize = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_APIKey, 0);
  objc_storeStrong((id *)&self->_requestURL, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_URLSessionTask, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
