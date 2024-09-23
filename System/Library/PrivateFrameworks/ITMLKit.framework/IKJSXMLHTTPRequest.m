@implementation IKJSXMLHTTPRequest

+ (id)xhrOperationQueue
{
  if (xhrOperationQueue_onceToken != -1)
    dispatch_once(&xhrOperationQueue_onceToken, &__block_literal_global_32);
  return (id)xhrOperationQueue_sXHROperationQueue;
}

uint64_t __39__IKJSXMLHTTPRequest_xhrOperationQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)xhrOperationQueue_sXHROperationQueue;
  xhrOperationQueue_sXHROperationQueue = (uint64_t)v0;

  return objc_msgSend((id)xhrOperationQueue_sXHROperationQueue, "setMaxConcurrentOperationCount:", 1);
}

- (IKJSXMLHTTPRequest)init
{
  void *v3;
  IKJSXMLHTTPRequest *v4;

  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IKJSXMLHTTPRequest initWithAppContext:jingleRequest:](self, "initWithAppContext:jingleRequest:", v3, 0);

  return v4;
}

- (IKJSXMLHTTPRequest)initWithAppContext:(id)a3 jingleRequest:(BOOL)a4
{
  id v6;
  IKJSXMLHTTPRequest *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSURLSessionConfiguration *urlSessionConfiguration;
  NSMutableArray *v12;
  NSMutableArray *onReadyStateChangeMessageQueue;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  JSManagedValue *managedSelf;
  objc_super v21;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IKJSXMLHTTPRequest;
  v7 = -[IKJSObject initWithAppContext:](&v21, sel_initWithAppContext_, v6);
  if (v7)
  {
    objc_msgSend(v6, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "xhrSessionConfigurationForContext:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      urlSessionConfiguration = v7->_urlSessionConfiguration;
      v7->_urlSessionConfiguration = (NSURLSessionConfiguration *)v10;

    }
    v7->_jingleRequest = a4;
    -[IKJSXMLHTTPRequest setTimeout:](v7, "setTimeout:", 60000);
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    onReadyStateChangeMessageQueue = v7->_onReadyStateChangeMessageQueue;
    v7->_onReadyStateChangeMessageQueue = v12;

    v7->_onReadyStateChangeMessageQueueLock._os_unfair_lock_opaque = 0;
    v7->_primeEnabled = objc_msgSend(v6, "mescalPrimeEnabledForXHRRequests");
    v7->_requestReadyState = 0;
    v7->_requestStatusCode = 0;
    v14 = (void *)MEMORY[0x1E0CBE0F8];
    v15 = (void *)MEMORY[0x1E0CBE108];
    objc_msgSend(v6, "jsContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueWithObject:inContext:", v7, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "managedValueWithValue:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    managedSelf = v7->_managedSelf;
    v7->_managedSelf = (JSManagedValue *)v18;

    -[IKJSXMLHTTPRequest setRequireSystemTrust:](v7, "setRequireSystemTrust:", 1);
    -[IKJSXMLHTTPRequest setReadyState:](v7, "setReadyState:", LODWORD(v7->_requestReadyState));
    -[IKJSXMLHTTPRequest setStatus:](v7, "setStatus:", 0);
    -[IKJSXMLHTTPRequest setStatusText:](v7, "setStatusText:", &stru_1E9F50578);

  }
  return v7;
}

- (void)open:(id)a3 :(id)a4 :(id)a5 :(id)a6 :(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  int v22;
  IKJSXMLHTTPRequest *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  IKNetworkRequestRecord *v27;
  IKNetworkRequestRecord *networkRequestRecord;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  char v33;
  id v34;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E9F8C3E0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uppercaseString");
    v34 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v17, "containsObject:", v34) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XMLHttpRequest.open security exception, invalid method %@"), v34);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v23 = self;
      v24 = v19;
LABEL_13:
      -[IKJSXMLHTTPRequest _setException:](v23, "_setException:", v24);
LABEL_14:

LABEL_16:
      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[IKJSXMLHTTPRequest _setException:](self, "_setException:", CFSTR("XMLHttpRequest.open set with nil url"));
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      -[__CFString scheme](v18, "scheme");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "isEqualToString:", CFSTR("http")) & 1) != 0)
      {
LABEL_8:

LABEL_9:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v22 = objc_msgSend(v14, "BOOLValue");
        else
          v22 = 1;
        if ((objc_msgSend(v15, "isUndefined") & 1) != 0)
        {
          if ((objc_msgSend(v16, "isUndefined") & 1) != 0)
          {
            v32 = v22;
            -[IKJSObject appContext](self, "appContext");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "webInspectorController");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "requestLoader");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "recordForResource:withInitiator:", 1, 1);
            v27 = (IKNetworkRequestRecord *)objc_claimAutoreleasedReturnValue();
            networkRequestRecord = self->_networkRequestRecord;
            self->_networkRequestRecord = v27;

            if (self->_networkRequestRecord)
              -[NSURLSessionConfiguration set_timingDataOptions:](self->_urlSessionConfiguration, "set_timingDataOptions:", 1);
            -[IKJSXMLHTTPRequest _openWithMethod:url:async:user:password:](self, "_openWithMethod:url:async:user:password:", v34, v19, v32, 0, 0);
            if (-[IKJSXMLHTTPRequest requestReadyState](self, "requestReadyState") == 1)
              goto LABEL_14;
            v24 = CFSTR("XMLHttpRequest.open failed");
          }
          else
          {
            v24 = CFSTR("XMLHttpRequest.open does not currently support password parameter");
          }
        }
        else
        {
          v24 = CFSTR("XMLHttpRequest.open does not currently support user parameter");
        }
        v23 = self;
        goto LABEL_13;
      }
      -[__CFString scheme](v19, "scheme");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("https")))
      {

        goto LABEL_8;
      }
      -[__CFString scheme](v19, "scheme");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v31, "isEqualToString:", CFSTR("file"));

      if ((v33 & 1) != 0)
        goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XMLHttpRequest.open set with invalid url %@"), v13);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSXMLHTTPRequest _setException:](self, "_setException:", v29);

    goto LABEL_14;
  }
  -[IKJSXMLHTTPRequest _setException:](self, "_setException:", CFSTR("XMLHttpRequest.open set with nil method"));
  v34 = v12;
LABEL_17:

}

- (void)setRequestHeader:(id)a3 :(id)a4
{
  id v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (-[IKJSXMLHTTPRequest requestReadyState](self, "requestReadyState") != 1)
  {
    v7 = CFSTR("XMLHttpRequest.setRequestHeader must be called in OPEN readyState");
    goto LABEL_5;
  }
  if (self->_inProgress)
  {
    v7 = CFSTR("XMLHttpRequest.setRequestHeader must be called before send");
LABEL_5:
    -[IKJSXMLHTTPRequest _setException:](self, "_setException:", v7);
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (setRequestHeader::_onceToken != -1)
      dispatch_once(&setRequestHeader::_onceToken, &__block_literal_global_106);
    objc_msgSend(v10, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend((id)setRequestHeader::_internalHeaders, "containsObject:", v8) & 1) == 0
      && (objc_msgSend(v8, "hasPrefix:", CFSTR("proxy-")) & 1) == 0
      && (objc_msgSend(v8, "hasPrefix:", CFSTR("sec-")) & 1) == 0)
    {
      -[IKJSXMLHTTPRequest urlRequest](self, "urlRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setValue:forHTTPHeaderField:", v6, v10);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XMLHttpRequest.setRequestHeader contained nil header name or value (%@ = %@)"), v10, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSXMLHTTPRequest _setException:](self, "_setException:", v8);
  }

LABEL_6:
}

void __40__IKJSXMLHTTPRequest_setRequestHeader::__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E9F8C3F8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)setRequestHeader::_internalHeaders;
  setRequestHeader::_internalHeaders = v0;

}

- (void)send:(id)a3
{
  id v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  JSManagedValue *managedSelf;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v4 = a3;
  if (-[IKJSXMLHTTPRequest requestReadyState](self, "requestReadyState") != 1)
  {
    v6 = CFSTR("XMLHttpRequest.send called on request that is not in state OPENED");
    goto LABEL_7;
  }
  if (self->_inProgress)
  {
    ITMLKitGetLogObject(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1D95F2000, v5, OS_LOG_TYPE_INFO, "XMLHttpRequest.send() already called, ignoring additional calls.", v14, 2u);
    }

    goto LABEL_15;
  }
  self->_inProgress = 1;
  if (v4 && (objc_msgSend(v4, "isNull") & 1) == 0 && (objc_msgSend(v4, "isUndefined") & 1) == 0)
  {
    if (objc_msgSend(v4, "isString"))
    {
      objc_msgSend(v4, "toString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v6 = CFSTR("XMLHttpRequest.send called with invalid argument, only string type is allowed");
LABEL_7:
    -[IKJSXMLHTTPRequest _setException:](self, "_setException:", v6);
    goto LABEL_15;
  }
  v7 = 0;
LABEL_12:
  if (self->_async)
  {
    objc_msgSend(MEMORY[0x1E0CBE0F0], "currentContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "virtualMachine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    managedSelf = self->_managedSelf;
    -[IKJSObject appContext](self, "appContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "jsContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("App"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addManagedReference:withOwner:", managedSelf, v13);

  }
  -[IKJSXMLHTTPRequest _sendWithData:](self, "_sendWithData:", v7);

LABEL_15:
}

- (void)abort
{
  void *v3;
  void *v4;
  JSManagedValue *managedSelf;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CBE0F0], "currentArguments");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    -[IKJSXMLHTTPRequest _setException:](self, "_setException:", CFSTR("XMLHttpRequest.abort called with arguments, expected none"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CBE0F0], "currentContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "virtualMachine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    managedSelf = self->_managedSelf;
    -[IKJSObject appContext](self, "appContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "jsContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("App"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeManagedReference:withOwner:", managedSelf, v8);

    -[IKJSXMLHTTPRequest _abort](self, "_abort");
  }

}

- (id)getResponseHeader:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !objc_msgSend(v4, "length")
    || !-[IKJSXMLHTTPRequest requestReadyState](self, "requestReadyState")
    || -[IKJSXMLHTTPRequest requestReadyState](self, "requestReadyState") == 1)
  {
    goto LABEL_7;
  }
  -[IKJSXMLHTTPRequest requestError](self, "requestError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 || !objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("Set-Cookie")))
  {

LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("Set-Cookie2")))
    goto LABEL_7;
  v8 = -[IKJSXMLHTTPRequest jingleRequest](self, "jingleRequest");
  -[IKJSXMLHTTPRequest urlResponse](self, "urlResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "itunes_allHeaderFields");
  else
    objc_msgSend(v9, "allHeaderFields");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v11, "allKeys", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v13 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v12);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v15, "caseInsensitiveCompare:", v4))
        {
          objc_msgSend(v11, "objectForKey:", v15);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_24;
        }
      }
      v6 = (void *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_24:

LABEL_8:
  return v6;
}

- (id)getAllResponseHeaders
{
  void *v3;
  void *v4;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!-[IKJSXMLHTTPRequest requestReadyState](self, "requestReadyState")
    || -[IKJSXMLHTTPRequest requestReadyState](self, "requestReadyState") == 1
    || (-[IKJSXMLHTTPRequest requestError](self, "requestError"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    v4 = 0;
  }
  else
  {
    v6 = -[IKJSXMLHTTPRequest jingleRequest](self, "jingleRequest");
    -[IKJSXMLHTTPRequest urlResponse](self, "urlResponse");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      objc_msgSend(v7, "itunes_allHeaderFields");
    else
      objc_msgSend(v7, "allHeaderFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v9, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v15, "caseInsensitiveCompare:", CFSTR("Set-Cookie"))
            && objc_msgSend(v15, "caseInsensitiveCompare:", CFSTR("Set-Cookie2")))
          {
            objc_msgSend(v9, "objectForKey:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "appendFormat:", CFSTR("%@: %@\r\n"), v15, v16);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

  }
  return v4;
}

- (NSString)responseText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  if (-[IKJSXMLHTTPRequest readyState](self, "readyState") >= 3
    && (-[IKJSXMLHTTPRequest receivedData](self, "receivedData"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[IKJSXMLHTTPRequest performanceMetrics](self, "performanceMetrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("parseStartTime"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = 0;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0C99E08];
      -[IKJSXMLHTTPRequest performanceMetrics](self, "performanceMetrics");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dictionaryWithDictionary:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[IKJSXMLHTTPRequest _timeIntervalSince1970](self, "_timeIntervalSince1970");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("parseStartTime"));

    }
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[IKJSXMLHTTPRequest receivedData](self, "receivedData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (__CFString *)objc_msgSend(v11, "initWithData:encoding:", v12, 4);

    if (v6)
    {
      -[IKJSXMLHTTPRequest _timeIntervalSince1970](self, "_timeIntervalSince1970");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v13, CFSTR("parseEndTime"));

      -[IKJSXMLHTTPRequest setPerformanceMetrics:](self, "setPerformanceMetrics:", v6);
    }

  }
  else
  {
    v7 = &stru_1E9F50578;
  }
  return (NSString *)v7;
}

- (IKDOMDocument)responseXML
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  IKDOMImplementation *v11;
  void *v12;
  IKDOMImplementation *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  if (-[IKJSXMLHTTPRequest readyState](self, "readyState") < 3)
    return (IKDOMDocument *)0;
  -[IKJSXMLHTTPRequest receivedData](self, "receivedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return (IKDOMDocument *)0;
  if (-[IKJSXMLHTTPRequest requestResponseType](self, "requestResponseType")
    && -[IKJSXMLHTTPRequest requestResponseType](self, "requestResponseType") != 3)
  {
    -[IKJSXMLHTTPRequest _setException:](self, "_setException:", CFSTR("InvalidStateError"));
    return (IKDOMDocument *)0;
  }
  -[IKJSXMLHTTPRequest performanceMetrics](self, "performanceMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("parseStartTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99E08];
    -[IKJSXMLHTTPRequest performanceMetrics](self, "performanceMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithDictionary:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[IKJSXMLHTTPRequest _timeIntervalSince1970](self, "_timeIntervalSince1970");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("parseStartTime"));

  }
  v11 = [IKDOMImplementation alloc];
  -[IKJSObject appContext](self, "appContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[IKJSObject initWithAppContext:](v11, "initWithAppContext:", v12);

  -[IKDOMImplementation createLSInput](v13, "createLSInput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSXMLHTTPRequest receivedData](self, "receivedData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setByteStream:", v15);

  -[IKDOMImplementation createLSParser::](v13, "createLSParser::", 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "parse:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKJSXMLHTTPRequest requestURL](self, "requestURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "absoluteString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_setDocumentURI:", v19);

  if (v6)
  {
    -[IKJSXMLHTTPRequest _timeIntervalSince1970](self, "_timeIntervalSince1970");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v20, CFSTR("parseEndTime"));

    -[IKJSXMLHTTPRequest setPerformanceMetrics:](self, "setPerformanceMetrics:", v6);
  }

  return (IKDOMDocument *)v17;
}

- (id)responseJSON
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  if (-[IKJSXMLHTTPRequest readyState](self, "readyState") < 3)
    return 0;
  -[IKJSXMLHTTPRequest receivedData](self, "receivedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  if (-[IKJSXMLHTTPRequest requestResponseType](self, "requestResponseType")
    && -[IKJSXMLHTTPRequest requestResponseType](self, "requestResponseType") != 4)
  {
    -[IKJSXMLHTTPRequest _setException:](self, "_setException:", CFSTR("InvalidStateError"));
    return 0;
  }
  -[IKJSXMLHTTPRequest performanceMetrics](self, "performanceMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("parseStartTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99E08];
    -[IKJSXMLHTTPRequest performanceMetrics](self, "performanceMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithDictionary:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[IKJSXMLHTTPRequest _timeIntervalSince1970](self, "_timeIntervalSince1970");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("parseStartTime"));

  }
  v11 = (void *)MEMORY[0x1E0CB36D8];
  -[IKJSXMLHTTPRequest receivedData](self, "receivedData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v11, "JSONObjectWithData:options:error:", v12, 0, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v17;

  if (v14)
  {
    objc_msgSend(v14, "localizedDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSXMLHTTPRequest _setException:](self, "_setException:", v15);

  }
  if (v6)
  {
    -[IKJSXMLHTTPRequest _timeIntervalSince1970](self, "_timeIntervalSince1970");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v16, CFSTR("parseEndTime"));

    -[IKJSXMLHTTPRequest setPerformanceMetrics:](self, "setPerformanceMetrics:", v6);
  }

  return v13;
}

- (id)responseBlob
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  IKJSBlob *v11;
  void *v12;
  IKJSBlob *v13;
  void *v14;

  if (-[IKJSXMLHTTPRequest readyState](self, "readyState") < 3)
    return 0;
  -[IKJSXMLHTTPRequest receivedData](self, "receivedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  if (-[IKJSXMLHTTPRequest requestResponseType](self, "requestResponseType")
    && -[IKJSXMLHTTPRequest requestResponseType](self, "requestResponseType") != 2)
  {
    -[IKJSXMLHTTPRequest _setException:](self, "_setException:", CFSTR("InvalidStateError"));
    return 0;
  }
  -[IKJSXMLHTTPRequest performanceMetrics](self, "performanceMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("parseStartTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99E08];
    -[IKJSXMLHTTPRequest performanceMetrics](self, "performanceMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithDictionary:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[IKJSXMLHTTPRequest _timeIntervalSince1970](self, "_timeIntervalSince1970");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("parseStartTime"));

  }
  v11 = [IKJSBlob alloc];
  -[IKJSXMLHTTPRequest receivedData](self, "receivedData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[IKJSBlob initWithData:](v11, "initWithData:", v12);

  if (v6)
  {
    -[IKJSXMLHTTPRequest _timeIntervalSince1970](self, "_timeIntervalSince1970");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v14, CFSTR("parseEndTime"));

    -[IKJSXMLHTTPRequest setPerformanceMetrics:](self, "setPerformanceMetrics:", v6);
  }

  return v13;
}

- (id)responseArrayBuffer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (-[IKJSXMLHTTPRequest readyState](self, "readyState") < 3)
    return 0;
  -[IKJSXMLHTTPRequest receivedData](self, "receivedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  if (-[IKJSXMLHTTPRequest requestResponseType](self, "requestResponseType")
    && -[IKJSXMLHTTPRequest requestResponseType](self, "requestResponseType") != 1)
  {
    -[IKJSXMLHTTPRequest _setException:](self, "_setException:", CFSTR("InvalidStateError"));
    return 0;
  }
  -[IKJSXMLHTTPRequest performanceMetrics](self, "performanceMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("parseStartTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99E08];
    -[IKJSXMLHTTPRequest performanceMetrics](self, "performanceMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithDictionary:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[IKJSXMLHTTPRequest _timeIntervalSince1970](self, "_timeIntervalSince1970");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("parseStartTime"));

  }
  -[IKJSObject appContext](self, "appContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayBufferStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKJSXMLHTTPRequest receivedData](self, "receivedData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayBufferForData:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IKJSXMLHTTPRequest _timeIntervalSince1970](self, "_timeIntervalSince1970");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v15, CFSTR("parseEndTime"));

    -[IKJSXMLHTTPRequest setPerformanceMetrics:](self, "setPerformanceMetrics:", v6);
  }

  return v14;
}

- (NSString)responseType
{
  unint64_t v2;

  v2 = self->_requestResponseType - 1;
  if (v2 > 4)
    return 0;
  else
    return &off_1E9F4F8D8[v2]->isa;
}

- (void)setResponseType:(id)a3
{
  int64_t requestResponseType;
  int64_t v5;
  int v6;
  id v7;

  v7 = a3;
  if (-[IKJSXMLHTTPRequest requestReadyState](self, "requestReadyState") == 3
    || -[IKJSXMLHTTPRequest requestReadyState](self, "requestReadyState") == 4)
  {
    -[IKJSXMLHTTPRequest _setException:](self, "_setException:", CFSTR("InvalidStateError"));
  }
  else
  {
    requestResponseType = self->_requestResponseType;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("arraybuffer")) & 1) != 0)
    {
      v5 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("blob")) & 1) != 0)
    {
      v5 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("document")) & 1) != 0)
    {
      v5 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("json")) & 1) != 0)
    {
      v5 = 4;
    }
    else
    {
      v6 = objc_msgSend(v7, "isEqualToString:", CFSTR("text"));
      v5 = 5;
      if (!v6)
        v5 = requestResponseType;
    }
    self->_requestResponseType = v5;
  }

}

- (id)response
{
  void *v3;
  void *v4;

  if (-[IKJSXMLHTTPRequest requestResponseType](self, "requestResponseType") == 5
    || !-[IKJSXMLHTTPRequest requestResponseType](self, "requestResponseType"))
  {
    -[IKJSXMLHTTPRequest responseText](self, "responseText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[IKJSXMLHTTPRequest requestReadyState](self, "requestReadyState") == 4
         && (-[IKJSXMLHTTPRequest receivedData](self, "receivedData"),
             v3 = (void *)objc_claimAutoreleasedReturnValue(),
             v3,
             v3))
  {
    switch(-[IKJSXMLHTTPRequest requestResponseType](self, "requestResponseType"))
    {
      case 1:
        -[IKJSXMLHTTPRequest responseArrayBuffer](self, "responseArrayBuffer");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 2:
        -[IKJSXMLHTTPRequest responseBlob](self, "responseBlob");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 3:
        -[IKJSXMLHTTPRequest responseXML](self, "responseXML");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 4:
        -[IKJSXMLHTTPRequest responseJSON](self, "responseJSON");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        -[IKJSXMLHTTPRequest receivedData](self, "receivedData");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_constructProgressEventData
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  -[IKJSXMLHTTPRequest receivedData](self, "receivedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4
    && (-[IKJSXMLHTTPRequest urlResponse](self, "urlResponse"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[IKJSXMLHTTPRequest urlResponse](self, "urlResponse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "expectedContentLength");

    v8 = 1;
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  v14[0] = CFSTR("lengthComputable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v14[1] = CFSTR("loaded");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  v14[2] = CFSTR("total");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_setException:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IKJSObject appContext](self, "appContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setException:withErrorMessage:", 0, v4);

}

- (void)setRequestReadyState:(int64_t)a3
{
  IKOnReadyStateChangeMessage *v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  IKOnReadyStateChangeMessage *v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);
  _QWORD v16[4];
  id v17;
  id location;

  if (self->_requestReadyState != a3)
  {
    self->_requestReadyState = a3;
    v4 = [IKOnReadyStateChangeMessage alloc];
    v5 = -[IKJSXMLHTTPRequest requestReadyState](self, "requestReadyState");
    v6 = -[IKJSXMLHTTPRequest requestStatusCode](self, "requestStatusCode");
    -[IKJSXMLHTTPRequest requestStatusText](self, "requestStatusText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSXMLHTTPRequest requestError](self, "requestError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[IKOnReadyStateChangeMessage initWithReadyState:statusCode:statusText:error:](v4, "initWithReadyState:statusCode:statusText:error:", v5, v6, v7, v8);

    os_unfair_lock_lock(&self->_onReadyStateChangeMessageQueueLock);
    if (self->_shouldSquashOnReadyStateEvents)
    {
      os_unfair_lock_unlock(&self->_onReadyStateChangeMessageQueueLock);
    }
    else
    {
      -[NSMutableArray addObject:](self->_onReadyStateChangeMessageQueue, "addObject:", v9);
      os_unfair_lock_unlock(&self->_onReadyStateChangeMessageQueueLock);
      objc_initWeak(&location, self);
      v10 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __43__IKJSXMLHTTPRequest_setRequestReadyState___block_invoke;
      v16[3] = &unk_1E9F4BCC8;
      objc_copyWeak(&v17, &location);
      v11 = (void (**)(_QWORD))MEMORY[0x1DF092410](v16);
      +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v11[2](v11);
      }
      else
      {
        -[IKJSObject appContext](self, "appContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v10;
        v14[1] = 3221225472;
        v14[2] = __43__IKJSXMLHTTPRequest_setRequestReadyState___block_invoke_2;
        v14[3] = &unk_1E9F4F868;
        v15 = v11;
        objc_msgSend(v13, "evaluate:completionBlock:", v14, 0);

      }
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }

  }
}

void __43__IKJSXMLHTTPRequest_setRequestReadyState___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  id v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v19 = WeakRetained;
    objc_msgSend(WeakRetained, "_dequeueReadyStateChangeMessage");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v19, "setReadyState:", objc_msgSend(v2, "readyState"));
      if (objc_msgSend(v3, "statusCode") == 900)
        v4 = 0;
      else
        v4 = objc_msgSend(v3, "statusCode");
      objc_msgSend(v19, "setStatus:", v4);
      objc_msgSend(v3, "statusText");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      if (v5)
        v7 = (const __CFString *)v5;
      else
        v7 = &stru_1E9F50578;
      objc_msgSend(v19, "setStatusText:", v7);

      v8 = (id)objc_msgSend(v19, "invokeMethod:withArguments:", CFSTR("onreadystatechange"), 0);
      if (objc_msgSend(v3, "readyState"))
        objc_msgSend(v19, "invokeListeners:extraInfo:", CFSTR("readystatechange"), 0);
      if (objc_msgSend(v3, "readyState") == 4)
      {
        if (objc_msgSend(v3, "statusCode") == 408 || objc_msgSend(v3, "statusCode") == 900)
        {
          objc_msgSend(v19, "_constructProgressEventData");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = CFSTR("ontimeout");
          v11 = CFSTR("timeout");
        }
        else if (objc_msgSend(v3, "statusCode") < 0xC8
               || objc_msgSend(v3, "statusCode") > 0x12B)
        {
          objc_msgSend(v19, "_constructProgressEventData");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = CFSTR("onerror");
          v11 = CFSTR("error");
        }
        else
        {
          objc_msgSend(v19, "_constructProgressEventData");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = CFSTR("onload");
          v11 = CFSTR("load");
        }
        objc_msgSend(v19, "invokeMethod:withArguments:thenDispatchEvent:extraInfo:", v10, 0, v11, v9);

        objc_msgSend(v19, "_constructProgressEventData");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "invokeMethod:withArguments:thenDispatchEvent:extraInfo:", CFSTR("onloadend"), 0, CFSTR("loadend"), v12);

        objc_msgSend(MEMORY[0x1E0CBE0F0], "currentContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "virtualMachine");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "managedSelf");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "appContext");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "jsContext");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("App"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeManagedReference:withOwner:", v15, v18);

      }
    }

    WeakRetained = v19;
  }

}

uint64_t __43__IKJSXMLHTTPRequest_setRequestReadyState___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_openWithMethod:(id)a3 url:(id)a4 async:(BOOL)a5 user:(id)a6 password:(id)a7
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v10 = a4;
  self->_shouldSquashOnReadyStateEvents = 0;
  -[IKJSXMLHTTPRequest urlConnection](self, "urlConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "cancel");
  -[IKJSXMLHTTPRequest setUrlConnection:](self, "setUrlConnection:", 0);
  -[IKJSXMLHTTPRequest urlSession](self, "urlSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "invalidateAndCancel");
  -[IKJSXMLHTTPRequest setUrlSession:](self, "setUrlSession:", 0);
  -[IKJSXMLHTTPRequest setUrlRequest:](self, "setUrlRequest:", 0);
  -[IKJSXMLHTTPRequest setRequestId:](self, "setRequestId:", 0);
  if (v17 && v10)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:cachePolicy:timeoutInterval:", v10, +[IKPreference ignoreHTTPCache](IKPreference, "ignoreHTTPCache"), (double)-[IKJSXMLHTTPRequest timeout](self, "timeout") / 1000.0);
    -[IKJSObject appContext](self, "appContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "willPerformXhrRequest:", v15);

    -[IKJSXMLHTTPRequest setUrlRequest:](self, "setUrlRequest:", v15);
    -[IKJSXMLHTTPRequest setRequestURL:](self, "setRequestURL:", v10);
    if (v15)
    {
      objc_msgSend(v15, "setHTTPMethod:", v17);
      self->_async = a5;
      -[IKJSXMLHTTPRequest setRequestReadyState:](self, "setRequestReadyState:", 1);
    }

  }
}

- (void)_sendWithData:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  dispatch_semaphore_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  id obj;
  _QWORD v50[4];
  NSObject *v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;

  v5 = a3;
  self->_shouldSquashOnReadyStateEvents = 0;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSXMLHTTPRequest setRequestId:](self, "setRequestId:", v7);

  -[IKJSXMLHTTPRequest urlRequest](self, "urlRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  objc_msgSend(v8, "HTTPMethod");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("GET")))
  {

  }
  else
  {
    objc_msgSend(v8, "HTTPMethod");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("HEAD"));

    v13 = v9;
    if (!v12)
      goto LABEL_5;
  }

  v13 = 0;
LABEL_5:
  objc_msgSend(v13, "dataUsingEncoding:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHTTPBody:", v14);

  objc_msgSend(v8, "setTimeoutInterval:", (double)-[IKJSXMLHTTPRequest timeout](self, "timeout") / 1000.0);
  -[IKJSXMLHTTPRequest networkRequestRecord](self, "networkRequestRecord");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "willSendRequest:redirectResponse:", v8, 0);
  if (-[IKJSXMLHTTPRequest jingleRequest](self, "jingleRequest"))
  {
    objc_storeStrong((id *)&self->_dataToSend, a3);
    objc_msgSend(MEMORY[0x1E0DAF688], "sharedPrimeSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (self->_primeEnabled && (objc_msgSend(v16, "primed") & 1) == 0)
      -[IKJSXMLHTTPRequest _prime:](self, "_prime:", v17);
    -[IKJSXMLHTTPRequest _createStoreOperation:](self, "_createStoreOperation:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSXMLHTTPRequest setJingleOperation:](self, "setJingleOperation:", v18);
    objc_msgSend(MEMORY[0x1E0DDC190], "mainQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addOperation:", v18);

    -[IKJSXMLHTTPRequest _constructProgressEventData](self, "_constructProgressEventData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSEventListenerObject invokeMethod:withArguments:thenDispatchEvent:extraInfo:](self, "invokeMethod:withArguments:thenDispatchEvent:extraInfo:", CFSTR("onloadstart"), 0, CFSTR("loadstart"), v20);

    goto LABEL_22;
  }
  -[IKJSXMLHTTPRequest urlSessionConfiguration](self, "urlSessionConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[IKPreference ignoreHTTPCache](IKPreference, "ignoreHTTPCache"))
  {
    -[IKJSXMLHTTPRequest setCachedURLResponse:](self, "setCachedURLResponse:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3990], "sharedURLCache");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "cachedResponseForRequest:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "response");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSXMLHTTPRequest setCachedURLResponse:](self, "setCachedURLResponse:", v23);

  }
  if (!self->_async)
  {
    v67 = 0;
    v68 = &v67;
    v69 = 0x3032000000;
    v70 = __Block_byref_object_copy__28;
    v71 = __Block_byref_object_dispose__28;
    v72 = 0;
    v61 = 0;
    v62 = &v61;
    v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__28;
    v65 = __Block_byref_object_dispose__28;
    v66 = 0;
    v55 = 0;
    v56 = &v55;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__28;
    v59 = __Block_byref_object_dispose__28;
    v60 = 0;
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v17, 0, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = dispatch_semaphore_create(0);
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __36__IKJSXMLHTTPRequest__sendWithData___block_invoke;
      v50[3] = &unk_1E9F4F890;
      v52 = &v67;
      v53 = &v61;
      v54 = &v55;
      v32 = v31;
      v51 = v32;
      objc_msgSend(v30, "dataTaskWithRequest:completionHandler:", v8, v50);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "resume");
      dispatch_semaphore_wait(v32, 0xFFFFFFFFFFFFFFFFLL);

    }
    else
    {
      v48 = 0;
      obj = 0;
      objc_msgSend(MEMORY[0x1E0CB39A0], "sendSynchronousRequest:returningResponse:error:", v8, &obj, &v48);
      v38 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong(&v66, obj);
      objc_storeStrong(&v72, v48);
      v30 = (void *)v56[5];
      v56[5] = v38;
    }

    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithData:", v56[5]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSXMLHTTPRequest setReceivedData:](self, "setReceivedData:", v39);

    -[IKJSXMLHTTPRequest setUrlResponse:](self, "setUrlResponse:", v62[5]);
    -[IKJSXMLHTTPRequest urlResponse](self, "urlResponse");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSXMLHTTPRequest setRequestStatusCode:](self, "setRequestStatusCode:", objc_msgSend(v40, "itunes_statusCode"));

    objc_msgSend(MEMORY[0x1E0CB3680], "localizedStringForStatusCode:", -[IKJSXMLHTTPRequest requestStatusCode](self, "requestStatusCode"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSXMLHTTPRequest setRequestStatusText:](self, "setRequestStatusText:", v41);

    objc_msgSend(v15, "didReceiveResponse:timingData:", v62[5], 0);
    if (v56[5])
      objc_msgSend(v15, "didCompleteLoadingWithResponseBody:");
    else
      objc_msgSend(v15, "didFailWithError:", v68[5]);
    self->_requestReadyState = 4;
    -[IKJSXMLHTTPRequest setReadyState:](self, "setReadyState:", 4);
    -[IKJSXMLHTTPRequest urlResponse](self, "urlResponse");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSXMLHTTPRequest setStatus:](self, "setStatus:", objc_msgSend(v42, "itunes_statusCode"));

    objc_msgSend(MEMORY[0x1E0CB3680], "localizedStringForStatusCode:", -[IKJSXMLHTTPRequest requestStatusCode](self, "requestStatusCode"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSXMLHTTPRequest setStatusText:](self, "setStatusText:", v43);

    -[IKJSEventListenerObject invokeMethod:withArguments:thenDispatchEvent:extraInfo:](self, "invokeMethod:withArguments:thenDispatchEvent:extraInfo:", CFSTR("onreadystatechange"), 0, CFSTR("readystatechange"), 0);
    if (-[IKJSXMLHTTPRequest status](self, "status") == 408)
      goto LABEL_32;
    objc_msgSend((id)v68[5], "domain");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v45, "isEqualToString:", *MEMORY[0x1E0CB32E8]) & 1) != 0)
    {
      v46 = objc_msgSend((id)v68[5], "code");

      if (v46 == -1001)
      {
LABEL_32:
        -[IKJSXMLHTTPRequest _constructProgressEventData](self, "_constructProgressEventData");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKJSEventListenerObject invokeMethod:withArguments:thenDispatchEvent:extraInfo:](self, "invokeMethod:withArguments:thenDispatchEvent:extraInfo:", CFSTR("ontimeout"), 0, CFSTR("timeout"), v44);
LABEL_40:

        -[IKJSXMLHTTPRequest _constructProgressEventData](self, "_constructProgressEventData");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKJSEventListenerObject invokeMethod:withArguments:thenDispatchEvent:extraInfo:](self, "invokeMethod:withArguments:thenDispatchEvent:extraInfo:", CFSTR("onloadend"), 0, CFSTR("loadend"), v47);

        _Block_object_dispose(&v55, 8);
        _Block_object_dispose(&v61, 8);

        _Block_object_dispose(&v67, 8);
        goto LABEL_41;
      }
    }
    else
    {

    }
    if (v68[5])
    {
      -[IKJSXMLHTTPRequest _constructProgressEventData](self, "_constructProgressEventData");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKJSEventListenerObject invokeMethod:withArguments:thenDispatchEvent:extraInfo:](self, "invokeMethod:withArguments:thenDispatchEvent:extraInfo:", CFSTR("onerror"), 0, CFSTR("error"), v44);
    }
    else
    {
      -[IKJSXMLHTTPRequest _constructProgressEventData](self, "_constructProgressEventData");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKJSEventListenerObject invokeMethod:withArguments:thenDispatchEvent:extraInfo:](self, "invokeMethod:withArguments:thenDispatchEvent:extraInfo:", CFSTR("onload"), 0, CFSTR("load"), v44);
    }
    goto LABEL_40;
  }
  if (v17)
  {
    v24 = (void *)MEMORY[0x1E0CB39F0];
    objc_msgSend((id)objc_opt_class(), "xhrOperationQueue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sessionWithConfiguration:delegate:delegateQueue:", v17, self, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[IKJSXMLHTTPRequest setUrlSession:](self, "setUrlSession:", v26);
    objc_msgSend(v26, "dataTaskWithRequest:", v8);
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = (void *)v27;
      objc_msgSend(MEMORY[0x1E0C99DF0], "data");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKJSXMLHTTPRequest setReceivedData:](self, "setReceivedData:", v29);

      objc_msgSend(v28, "resume");
LABEL_21:

      -[IKJSXMLHTTPRequest _constructProgressEventData](self, "_constructProgressEventData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKJSEventListenerObject invokeMethod:withArguments:thenDispatchEvent:extraInfo:](self, "invokeMethod:withArguments:thenDispatchEvent:extraInfo:", CFSTR("onloadstart"), 0, CFSTR("loadstart"), v18);
LABEL_22:

      goto LABEL_41;
    }

  }
  else
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39A0]), "initWithRequest:delegate:startImmediately:", v8, self, 0);
    objc_msgSend((id)objc_opt_class(), "xhrOperationQueue");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDelegateQueue:", v34);

    -[IKJSXMLHTTPRequest setUrlConnection:](self, "setUrlConnection:", v26);
    if (v26)
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "data");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKJSXMLHTTPRequest setReceivedData:](self, "setReceivedData:", v35);

      objc_msgSend(v26, "start");
      goto LABEL_21;
    }
  }
  ITMLKitGetLogObject(0);
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    -[IKJSXMLHTTPRequest _sendWithData:].cold.1();

  -[IKJSXMLHTTPRequest setRequestStatusCode:](self, "setRequestStatusCode:", 0);
  -[IKJSXMLHTTPRequest setRequestStatusText:](self, "setRequestStatusText:", 0);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 1, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSXMLHTTPRequest setRequestError:](self, "setRequestError:", v37);

  -[IKJSXMLHTTPRequest setRequestReadyState:](self, "setRequestReadyState:", 4);
LABEL_41:

}

void __36__IKJSXMLHTTPRequest__sendWithData___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v7 = a2;
  v8 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  v15 = a4;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;
  v11 = v8;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v7;
  v14 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_abort
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[IKJSXMLHTTPRequest urlConnection](self, "urlConnection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[IKJSXMLHTTPRequest urlSession](self, "urlSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSXMLHTTPRequest urlSessionConfiguration](self, "urlSessionConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = v3;
  else
    v5 = v11;
  -[IKJSXMLHTTPRequest jingleOperation](self, "jingleOperation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IKJSXMLHTTPRequest requestReadyState](self, "requestReadyState")
    && -[IKJSXMLHTTPRequest requestReadyState](self, "requestReadyState") != 4
    && (-[IKJSXMLHTTPRequest requestReadyState](self, "requestReadyState") != 1 || v5 || v6))
  {
    -[IKJSXMLHTTPRequest networkRequestRecord](self, "networkRequestRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -999, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didFailWithError:", v8);

    if (v6)
    {
      objc_msgSend(v6, "setDelegate:", 0);
      objc_msgSend(v6, "setCompletionBlock:", 0);
      objc_msgSend(v6, "cancel");
      -[IKJSXMLHTTPRequest setJingleOperation:](self, "setJingleOperation:", 0);
    }
    else
    {
      objc_msgSend(v11, "cancel");
      -[IKJSXMLHTTPRequest setUrlConnection:](self, "setUrlConnection:", 0);
      objc_msgSend(v3, "invalidateAndCancel");
      -[IKJSXMLHTTPRequest setUrlSession:](self, "setUrlSession:", 0);
    }
    -[IKJSXMLHTTPRequest setRequestId:](self, "setRequestId:", 0);
    -[IKJSXMLHTTPRequest setUrlRequest:](self, "setUrlRequest:", 0);
    -[IKJSXMLHTTPRequest setUrlResponse:](self, "setUrlResponse:", 0);
    -[IKJSXMLHTTPRequest setReceivedData:](self, "setReceivedData:", 0);
    -[IKJSXMLHTTPRequest setRequestURL:](self, "setRequestURL:", 0);
    -[IKJSXMLHTTPRequest setRequestStatusCode:](self, "setRequestStatusCode:", 0);
    -[IKJSXMLHTTPRequest setRequestStatusText:](self, "setRequestStatusText:", 0);
    self->_requestReadyState = 4;
    -[IKJSXMLHTTPRequest _clearAllReadyStateChangeMessagesAndSquashFutureOnes](self, "_clearAllReadyStateChangeMessagesAndSquashFutureOnes");
    -[IKJSXMLHTTPRequest setReadyState:](self, "setReadyState:", 4);
    -[IKJSXMLHTTPRequest setDataToSend:](self, "setDataToSend:", 0);
    -[IKJSXMLHTTPRequest setStatus:](self, "setStatus:", 0);
    -[IKJSXMLHTTPRequest setStatusText:](self, "setStatusText:", &stru_1E9F50578);
    -[IKJSEventListenerObject invokeMethod:withArguments:thenDispatchEvent:extraInfo:](self, "invokeMethod:withArguments:thenDispatchEvent:extraInfo:", CFSTR("onreadystatechange"), 0, CFSTR("readystatechange"), 0);
    -[IKJSXMLHTTPRequest _constructProgressEventData](self, "_constructProgressEventData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSEventListenerObject invokeMethod:withArguments:thenDispatchEvent:extraInfo:](self, "invokeMethod:withArguments:thenDispatchEvent:extraInfo:", CFSTR("onabort"), 0, CFSTR("abort"), v9);

    -[IKJSXMLHTTPRequest _constructProgressEventData](self, "_constructProgressEventData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSEventListenerObject invokeMethod:withArguments:thenDispatchEvent:extraInfo:](self, "invokeMethod:withArguments:thenDispatchEvent:extraInfo:", CFSTR("onloadend"), 0, CFSTR("loadend"), v10);

  }
  else
  {
    self->_requestReadyState = 0;
  }

}

- (id)_dequeueReadyStateChangeMessage
{
  os_unfair_lock_s *p_onReadyStateChangeMessageQueueLock;
  void *v4;

  p_onReadyStateChangeMessageQueueLock = &self->_onReadyStateChangeMessageQueueLock;
  os_unfair_lock_lock(&self->_onReadyStateChangeMessageQueueLock);
  if (-[NSMutableArray count](self->_onReadyStateChangeMessageQueue, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_onReadyStateChangeMessageQueue, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_onReadyStateChangeMessageQueue, "removeObjectAtIndex:", 0);
  }
  else
  {
    v4 = 0;
  }
  os_unfair_lock_unlock(p_onReadyStateChangeMessageQueueLock);
  return v4;
}

- (void)_clearAllReadyStateChangeMessagesAndSquashFutureOnes
{
  os_unfair_lock_s *p_onReadyStateChangeMessageQueueLock;

  p_onReadyStateChangeMessageQueueLock = &self->_onReadyStateChangeMessageQueueLock;
  os_unfair_lock_lock(&self->_onReadyStateChangeMessageQueueLock);
  self->_shouldSquashOnReadyStateEvents = 1;
  -[NSMutableArray removeAllObjects](self->_onReadyStateChangeMessageQueue, "removeAllObjects");
  os_unfair_lock_unlock(p_onReadyStateChangeMessageQueueLock);
}

- (BOOL)validateTrust:(__SecTrust *)a3
{
  BOOL v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFErrorRef error;

  error = 0;
  v3 = SecTrustEvaluateWithError(a3, &error);
  if (!v3)
  {
    ITMLKitGetLogObject(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[IKJSXMLHTTPRequest validateTrust:].cold.1((uint64_t)&error, v4, v5, v6, v7, v8, v9, v10);

  }
  return v3;
}

- (BOOL)verifyCertificateIsSystemTrustedWithTrust:(__SecTrust *)a3
{
  void *v5;
  BOOL v6;
  CFArrayRef v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;

  if (!a3)
  {
    ITMLKitGetLogObject(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[IKJSXMLHTTPRequest verifyCertificateIsSystemTrustedWithTrust:].cold.1();
    goto LABEL_14;
  }
  if (!-[IKJSXMLHTTPRequest validateTrust:](self, "validateTrust:"))
  {
    ITMLKitGetLogObject(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[IKJSXMLHTTPRequest verifyCertificateIsSystemTrustedWithTrust:].cold.6();
    goto LABEL_14;
  }
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "canRequireSystemTrustForXHRs"))
  {

    goto LABEL_16;
  }
  v6 = -[IKJSXMLHTTPRequest requireSystemTrust](self, "requireSystemTrust");

  if (!v6)
  {
LABEL_16:
    ITMLKitGetLogObject(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[IKJSXMLHTTPRequest verifyCertificateIsSystemTrustedWithTrust:].cold.5();
    v9 = 1;
    goto LABEL_19;
  }
  v7 = SecTrustCopyCertificateChain(a3);
  v8 = v7;
  if (!v7)
  {
    ITMLKitGetLogObject(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[IKJSXMLHTTPRequest verifyCertificateIsSystemTrustedWithTrust:].cold.2();
    goto LABEL_24;
  }
  if (!-[__CFArray lastObject](v7, "lastObject"))
  {
    ITMLKitGetLogObject(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[IKJSXMLHTTPRequest verifyCertificateIsSystemTrustedWithTrust:].cold.3();
    goto LABEL_24;
  }
  v9 = 1;
  SecTrustStoreForDomain();
  if (!SecTrustStoreContains())
  {
    ITMLKitGetLogObject(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[IKJSXMLHTTPRequest verifyCertificateIsSystemTrustedWithTrust:].cold.4();
LABEL_24:

LABEL_14:
    v9 = 0;
  }
LABEL_19:

  return v9;
}

- (id)connection:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5
{
  return -[IKJSXMLHTTPRequest _loadingWillSendRequest:redirectResponse:](self, "_loadingWillSendRequest:redirectResponse:", a4, a5);
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "_timingData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[IKJSXMLHTTPRequest _loadingDidReceiveResponse:timingData:](self, "_loadingDidReceiveResponse:timingData:", v6, v7);

}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  -[IKJSXMLHTTPRequest _loadingDidReceiveData:](self, "_loadingDidReceiveData:", a4);
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  -[IKJSXMLHTTPRequest _loadingDidFailWithError:](self, "_loadingDidFailWithError:", a4);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  -[IKJSXMLHTTPRequest _loadingDidReceiveData:](self, "_loadingDidReceiveData:", a5, a4);
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, uint64_t, void *);
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;

  v7 = (void (**)(id, uint64_t, void *))a5;
  objc_msgSend(a4, "protectionSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "serverTrust");
  objc_msgSend(v8, "authenticationMethod");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB32C8]);

  if (v11)
  {
    v12 = -[IKJSXMLHTTPRequest verifyCertificateIsSystemTrustedWithTrust:](self, "verifyCertificateIsSystemTrustedWithTrust:", v9);
    ITMLKitGetLogObject(0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[IKJSXMLHTTPRequest URLSession:didReceiveChallenge:completionHandler:].cold.1();

      objc_msgSend(MEMORY[0x1E0CB39A8], "credentialForTrust:", objc_msgSend(v8, "serverTrust"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[IKJSXMLHTTPRequest URLSession:didReceiveChallenge:completionHandler:].cold.2();

      v15 = 0;
      v16 = 2;
    }
  }
  else
  {
    ITMLKitGetLogObject(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[IKJSXMLHTTPRequest URLSession:didReceiveChallenge:completionHandler:].cold.3();

    v15 = 0;
    v16 = 1;
  }
  v7[2](v7, v16, v15);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  if (a5)
    -[IKJSXMLHTTPRequest _loadingDidFailWithError:](self, "_loadingDidFailWithError:", a5, a4);
  else
    -[IKJSXMLHTTPRequest _loadingDidFinish](self, "_loadingDidFinish", a3, a4);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9;
  void *v10;
  void (**v11)(id, uint64_t);

  v11 = (void (**)(id, uint64_t))a6;
  v9 = a5;
  objc_msgSend(a4, "_timingData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSXMLHTTPRequest _loadingDidReceiveResponse:timingData:](self, "_loadingDidReceiveResponse:timingData:", v9, v10);

  v11[2](v11, 1);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;

  v11 = a7;
  -[IKJSXMLHTTPRequest _loadingWillSendRequest:redirectResponse:](self, "_loadingWillSendRequest:redirectResponse:", a6, a5);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a7 + 2))(v11, v12);

}

- (id)_loadingWillSendRequest:(id)a3 redirectResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[IKJSXMLHTTPRequest networkRequestRecord](self, "networkRequestRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "willSendRequest:redirectResponse:", v6, v7);

  }
  v12 = CFSTR("requestStartTime");
  -[IKJSXMLHTTPRequest _timeIntervalSince1970](self, "_timeIntervalSince1970");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKJSXMLHTTPRequest setPerformanceMetrics:](self, "setPerformanceMetrics:", v10);
  return v6;
}

- (void)_loadingDidReceiveResponse:(id)a3 timingData:(id)a4
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
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  IKJSXMLHTTPRequest *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[IKJSXMLHTTPRequest networkRequestRecord](self, "networkRequestRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didReceiveResponse:timingData:", v7, v6);

  v9 = (void *)MEMORY[0x1E0C99E08];
  -[IKJSXMLHTTPRequest performanceMetrics](self, "performanceMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allHeaderFields");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("Date"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKJSXMLHTTPRequest cachedURLResponse](self, "cachedURLResponse");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allHeaderFields");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("Date"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v13, "isEqualToString:", v16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v18, CFSTR("isResponseCached"));

  -[IKJSXMLHTTPRequest _timeIntervalSince1970](self, "_timeIntervalSince1970");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v19, CFSTR("responseStartTime"));

  -[IKJSXMLHTTPRequest setPerformanceMetrics:](self, "setPerformanceMetrics:", v11);
  -[IKJSXMLHTTPRequest setUrlResponse:](self, "setUrlResponse:", v7);
  v20 = objc_msgSend(v7, "itunes_statusCode");

  -[IKJSXMLHTTPRequest setRequestStatusCode:](self, "setRequestStatusCode:", v20);
  objc_msgSend(MEMORY[0x1E0CB3680], "localizedStringForStatusCode:", -[IKJSXMLHTTPRequest requestStatusCode](self, "requestStatusCode"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSXMLHTTPRequest setRequestStatusText:](self, "setRequestStatusText:", v21);

  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSXMLHTTPRequest setReceivedData:](self, "setReceivedData:", v22);

  -[IKJSXMLHTTPRequest setRequestReadyState:](self, "setRequestReadyState:", 2);
  ITMLKitGetLogObject(0);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    -[IKJSXMLHTTPRequest urlRequest](self, "urlRequest");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "URL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138412546;
    v27 = v25;
    v28 = 2048;
    v29 = self;
    _os_log_impl(&dword_1D95F2000, v23, OS_LOG_TYPE_INFO, "Received response for XHR request %@ %p", (uint8_t *)&v26, 0x16u);

  }
}

- (void)_loadingDidReceiveData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[IKJSXMLHTTPRequest networkRequestRecord](self, "networkRequestRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didReceiveData:", v4);

  -[IKJSXMLHTTPRequest receivedData](self, "receivedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v8, "appendData:", v4);
  v7 = (void *)objc_msgSend(v8, "copy");
  -[IKJSXMLHTTPRequest setReceivedData:](self, "setReceivedData:", v7);

  -[IKJSXMLHTTPRequest setRequestReadyState:](self, "setRequestReadyState:", 3);
}

- (void)_loadingDidFailWithError:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v4 = a3;
  ITMLKitGetLogObject(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[IKJSXMLHTTPRequest _loadingDidFailWithError:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  -[IKJSXMLHTTPRequest networkRequestRecord](self, "networkRequestRecord");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "didFailWithError:", v4);

  v13 = (void *)MEMORY[0x1E0C99E08];
  -[IKJSXMLHTTPRequest performanceMetrics](self, "performanceMetrics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryWithDictionary:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKJSXMLHTTPRequest _timeIntervalSince1970](self, "_timeIntervalSince1970");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("responseEndTime"));

  -[IKJSXMLHTTPRequest setPerformanceMetrics:](self, "setPerformanceMetrics:", v15);
  -[IKJSXMLHTTPRequest setUrlConnection:](self, "setUrlConnection:", 0);
  -[IKJSXMLHTTPRequest setUrlSession:](self, "setUrlSession:", 0);
  -[IKJSXMLHTTPRequest setUrlRequest:](self, "setUrlRequest:", 0);
  -[IKJSXMLHTTPRequest setUrlResponse:](self, "setUrlResponse:", 0);
  -[IKJSXMLHTTPRequest setReceivedData:](self, "setReceivedData:", 0);
  -[IKJSXMLHTTPRequest setRequestURL:](self, "setRequestURL:", 0);
  objc_msgSend(v4, "domain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
  {

    goto LABEL_7;
  }
  v18 = objc_msgSend(v4, "code");

  if (v18 != -1001)
  {
LABEL_7:
    -[IKJSXMLHTTPRequest setRequestError:](self, "setRequestError:", v4);
    goto LABEL_8;
  }
  -[IKJSXMLHTTPRequest setRequestStatusCode:](self, "setRequestStatusCode:", 900);
LABEL_8:
  -[IKJSXMLHTTPRequest setRequestReadyState:](self, "setRequestReadyState:", 4);
  self->_inProgress = 0;

}

- (void)_loadingDidFinish
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[IKJSXMLHTTPRequest networkRequestRecord](self, "networkRequestRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSXMLHTTPRequest receivedData](self, "receivedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didCompleteLoadingWithResponseBody:", v4);

  v5 = (void *)MEMORY[0x1E0C99E08];
  -[IKJSXMLHTTPRequest performanceMetrics](self, "performanceMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithDictionary:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[IKJSXMLHTTPRequest _timeIntervalSince1970](self, "_timeIntervalSince1970");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("responseEndTime"));

  -[IKJSXMLHTTPRequest setPerformanceMetrics:](self, "setPerformanceMetrics:", v8);
  -[IKJSXMLHTTPRequest setUrlConnection:](self, "setUrlConnection:", 0);
  -[IKJSXMLHTTPRequest setUrlSession:](self, "setUrlSession:", 0);
  -[IKJSXMLHTTPRequest setUrlRequest:](self, "setUrlRequest:", 0);
  -[IKJSXMLHTTPRequest setRequestReadyState:](self, "setRequestReadyState:", 4);
  self->_inProgress = 0;

}

- (void)operation:(id)a3 didReceiveResponse:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  IKJSXMLHTTPRequest *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[IKJSXMLHTTPRequest networkRequestRecord](self, "networkRequestRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didReceiveResponse:timingData:", v5, 0);

  v7 = (void *)MEMORY[0x1E0C99E08];
  -[IKJSXMLHTTPRequest performanceMetrics](self, "performanceMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "itunes_allHeaderFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("Date"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKJSXMLHTTPRequest cachedURLResponse](self, "cachedURLResponse");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "itunes_allHeaderFields");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("Date"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v11, "isEqualToString:", v14);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v16, CFSTR("isResponseCached"));

  -[IKJSXMLHTTPRequest setPerformanceMetrics:](self, "setPerformanceMetrics:", v9);
  -[IKJSXMLHTTPRequest setUrlResponse:](self, "setUrlResponse:", v5);
  v17 = objc_msgSend(v5, "itunes_statusCode");

  -[IKJSXMLHTTPRequest setRequestStatusCode:](self, "setRequestStatusCode:", v17);
  objc_msgSend(MEMORY[0x1E0CB3680], "localizedStringForStatusCode:", -[IKJSXMLHTTPRequest requestStatusCode](self, "requestStatusCode"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSXMLHTTPRequest setRequestStatusText:](self, "setRequestStatusText:", v18);

  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSXMLHTTPRequest setReceivedData:](self, "setReceivedData:", v19);

  -[IKJSXMLHTTPRequest setRequestReadyState:](self, "setRequestReadyState:", 2);
  ITMLKitGetLogObject(0);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    -[IKJSXMLHTTPRequest urlRequest](self, "urlRequest");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "URL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412546;
    v24 = v22;
    v25 = 2048;
    v26 = self;
    _os_log_impl(&dword_1D95F2000, v20, OS_LOG_TYPE_INFO, "Received response for XHR request %@ %p", (uint8_t *)&v23, 0x16u);

  }
}

- (void)operation:(id)a3 didDiscoverContentLength:(id)a4
{
  -[IKJSXMLHTTPRequest setRequestReadyState:](self, "setRequestReadyState:", 3, a4);
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  IKJSXMLHTTPRequest *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[IKJSXMLHTTPRequest _isPrimeError:output:](self, "_isPrimeError:output:", -[IKJSXMLHTTPRequest requestStatusCode](self, "requestStatusCode"), v7))
  {
    -[IKJSXMLHTTPRequest _reprime:](self, "_reprime:", v6);
  }
  else
  {
    ITMLKitGetLogObject(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[IKJSXMLHTTPRequest urlRequest](self, "urlRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v10;
      v16 = 2048;
      v17 = self;
      _os_log_impl(&dword_1D95F2000, v8, OS_LOG_TYPE_INFO, "Finished loading for XHR request %@ %p", (uint8_t *)&v14, 0x16u);

    }
    -[IKJSXMLHTTPRequest _operationFinished:](self, "_operationFinished:", v6);
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v7, "copy");
        -[IKJSXMLHTTPRequest setReceivedData:](self, "setReceivedData:", v11);

      }
    }
    -[IKJSXMLHTTPRequest networkRequestRecord](self, "networkRequestRecord");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSXMLHTTPRequest receivedData](self, "receivedData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "didCompleteLoadingWithResponseBody:", v13);

    -[IKJSXMLHTTPRequest setRequestReadyState:](self, "setRequestReadyState:", 4);
  }

}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  ITMLKitGetLogObject(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[IKJSXMLHTTPRequest _loadingDidFailWithError:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

  -[IKJSXMLHTTPRequest _operationFinished:](self, "_operationFinished:", v6);
  -[IKJSXMLHTTPRequest setUrlResponse:](self, "setUrlResponse:", 0);
  -[IKJSXMLHTTPRequest setReceivedData:](self, "setReceivedData:", 0);
  -[IKJSXMLHTTPRequest setRequestURL:](self, "setRequestURL:", 0);
  objc_msgSend(v7, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
  {
    v16 = objc_msgSend(v7, "code");

    if (v16 == -1001)
    {
      -[IKJSXMLHTTPRequest setRequestStatusCode:](self, "setRequestStatusCode:", 900);
      goto LABEL_9;
    }
  }
  else
  {

  }
  -[IKJSXMLHTTPRequest setRequestError:](self, "setRequestError:", v7);
  objc_msgSend(v6, "response");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "itunes_statusCode");

  if (v18)
  {
    objc_msgSend(v6, "response");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSXMLHTTPRequest setRequestStatusCode:](self, "setRequestStatusCode:", objc_msgSend(v19, "itunes_statusCode"));

  }
LABEL_9:
  -[IKJSXMLHTTPRequest networkRequestRecord](self, "networkRequestRecord");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "didFailWithError:", v7);

  -[IKJSXMLHTTPRequest setRequestReadyState:](self, "setRequestReadyState:", 4);
}

- (void)_operationFinished:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  unint64_t v9;
  double v10;
  unint64_t v11;
  double v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  -[IKJSXMLHTTPRequest performanceMetrics](self, "performanceMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithDictionary:", v6);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "performanceMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startTime");
  v9 = (unint64_t)((v8 + 978307200.0) * 1000.0);
  objc_msgSend(v7, "receivedResponseInterval");
  v11 = (unint64_t)((double)v9 + v10 * 1000.0);
  objc_msgSend(v7, "finishInterval");
  v13 = (unint64_t)((double)v9 + v12 * 1000.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v14, CFSTR("requestStartTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v15, CFSTR("responseStartTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v16, CFSTR("responseEndTime"));

  -[IKJSXMLHTTPRequest setPerformanceMetrics:](self, "setPerformanceMetrics:", v17);
  objc_msgSend(v5, "setDelegate:", 0);
  objc_msgSend(v5, "setCompletionBlock:", 0);

  -[IKJSXMLHTTPRequest setJingleOperation:](self, "setJingleOperation:", 0);
  -[IKJSXMLHTTPRequest setUrlRequest:](self, "setUrlRequest:", 0);

}

- (void)operation:(id)a3 willSendRequest:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  IKJSXMLHTTPRequest *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  ITMLKitGetLogObject(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[IKJSXMLHTTPRequest urlRequest](self, "urlRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_1D95F2000, v5, OS_LOG_TYPE_INFO, "Sending XHR request for %@ %p", (uint8_t *)&v8, 0x16u);

  }
}

- (id)_createStoreOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id location;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF5C8]), "initWithURLRequest:", v4);
  +[IKJSITunesStore setITunesStoreHeaders:](IKJSITunesStore, "setITunesStoreHeaders:", v5);
  if (+[IKPreference ignoreHTTPCache](IKPreference, "ignoreHTTPCache"))
  {
    objc_msgSend(v5, "setCachePolicy:", 1);
    -[IKJSXMLHTTPRequest setCachedURLResponse:](self, "setCachedURLResponse:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3990], "sharedURLCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cachedResponseForRequest:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "response");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSXMLHTTPRequest setCachedURLResponse:](self, "setCachedURLResponse:", v8);

  }
  objc_msgSend(v5, "setAllowedRetryCount:", 0);
  v9 = objc_alloc_init(MEMORY[0x1E0DDC1B0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 401);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 400);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPassThroughErrors:", v12);

  objc_msgSend(v9, "setDelegate:", self);
  objc_msgSend(v9, "setNeedsURLBag:", 0);
  objc_msgSend(v9, "setRequestProperties:", v5);
  objc_msgSend(v9, "setTracksPerformanceMetrics:", 1);
  objc_msgSend(v9, "setUrlKnownToBeTrusted:", 1);
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSXMLHTTPRequest setReceivedData:](self, "setReceivedData:", v13);

  objc_initWeak(&location, v9);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__IKJSXMLHTTPRequest__createStoreOperation___block_invoke;
  v15[3] = &unk_1E9F4C210;
  v15[4] = self;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v9, "setCompletionBlock:", v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v9;
}

void __44__IKJSXMLHTTPRequest__createStoreOperation___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "operation:failedWithError:", WeakRetained, v2);

}

- (BOOL)_isPrimeError:(int64_t)a3 output:(id)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = 0;
  if (a3 == 401 && self->_primeEnabled)
  {
    if (-[IKJSXMLHTTPRequest primeRetryCount](self, "primeRetryCount") <= 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("status"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7 = objc_msgSend(v9, "isEqualToString:", CFSTR("verificationFailure"));
        else
          v7 = 0;

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)_prime:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  _QWORD v7[5];
  dispatch_semaphore_t v8;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__IKJSXMLHTTPRequest__prime___block_invoke;
  v7[3] = &unk_1E9F4F8B8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v4, "primeSessionWithCompletionBlock:", v7);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __29__IKJSXMLHTTPRequest__prime___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  ITMLKitGetLogObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_1D95F2000, v4, OS_LOG_TYPE_INFO, "Primed mescal with a result of :%d", (uint8_t *)v6, 8u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setPrimeRetryCount:", objc_msgSend(*(id *)(a1 + 32), "primeRetryCount") + 1);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_reprime:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "setDelegate:", 0);
  objc_msgSend(v4, "setCompletionBlock:", 0);
  ITMLKitGetLogObject(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D95F2000, v5, OS_LOG_TYPE_INFO, "Failed with a 401. Re-priming mescal session.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0DAF688], "sharedPrimeSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSXMLHTTPRequest _prime:](self, "_prime:", v6);
  if (objc_msgSend(v6, "primed"))
  {
    -[IKJSXMLHTTPRequest urlRequest](self, "urlRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSXMLHTTPRequest dataToSend](self, "dataToSend");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataUsingEncoding:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHTTPBody:", v9);

    objc_msgSend(v7, "setTimeoutInterval:", (double)-[IKJSXMLHTTPRequest timeout](self, "timeout") / 1000.0);
    -[IKJSXMLHTTPRequest _createStoreOperation:](self, "_createStoreOperation:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSXMLHTTPRequest setJingleOperation:](self, "setJingleOperation:", v10);
    objc_msgSend(MEMORY[0x1E0DDC190], "mainQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addOperation:", v10);

  }
  else
  {
    ITMLKitGetLogObject(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1D95F2000, v12, OS_LOG_TYPE_INFO, "Failed to re-prime sesson.", v14, 2u);
    }

    -[IKJSXMLHTTPRequest setUrlResponse:](self, "setUrlResponse:", 0);
    objc_msgSend(MEMORY[0x1E0CB3680], "localizedStringForStatusCode:", 401);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSXMLHTTPRequest setRequestStatusText:](self, "setRequestStatusText:", v13);

    -[IKJSXMLHTTPRequest setRequestReadyState:](self, "setRequestReadyState:", 2);
    -[IKJSXMLHTTPRequest _operationFinished:](self, "_operationFinished:", v4);
    -[IKJSXMLHTTPRequest setReceivedData:](self, "setReceivedData:", 0);
    -[IKJSXMLHTTPRequest setRequestURL:](self, "setRequestURL:", 0);
    -[IKJSXMLHTTPRequest setRequestReadyState:](self, "setRequestReadyState:", 4);
  }

}

- (id)_timeIntervalSince1970
{
  timeval v3;

  v3.tv_sec = 0;
  *(_QWORD *)&v3.tv_usec = 0;
  gettimeofday(&v3, 0);
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)(((double)v3.tv_sec + (double)v3.tv_usec * 0.000001) * 1000.0));
}

- (unint64_t)timeout
{
  return self->timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->timeout = a3;
}

- (BOOL)requireSystemTrust
{
  return self->requireSystemTrust;
}

- (void)setRequireSystemTrust:(BOOL)a3
{
  self->requireSystemTrust = a3;
}

- (NSURL)requestURL
{
  return self->_requestURL;
}

- (void)setRequestURL:(id)a3
{
  objc_storeStrong((id *)&self->_requestURL, a3);
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (IKNetworkRequestRecord)networkRequestRecord
{
  return self->_networkRequestRecord;
}

- (NSString)dataToSend
{
  return self->_dataToSend;
}

- (void)setDataToSend:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)jingleRequest
{
  return self->_jingleRequest;
}

- (void)setJingleRequest:(BOOL)a3
{
  self->_jingleRequest = a3;
}

- (ISURLOperation)jingleOperation
{
  return (ISURLOperation *)objc_loadWeakRetained((id *)&self->_jingleOperation);
}

- (void)setJingleOperation:(id)a3
{
  objc_storeWeak((id *)&self->_jingleOperation, a3);
}

- (NSMutableArray)onReadyStateChangeMessageQueue
{
  return self->_onReadyStateChangeMessageQueue;
}

- (void)setOnReadyStateChangeMessageQueue:(id)a3
{
  objc_storeStrong((id *)&self->_onReadyStateChangeMessageQueue, a3);
}

- (NSMutableURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (void)setUrlRequest:(id)a3
{
  objc_storeStrong((id *)&self->_urlRequest, a3);
}

- (NSURLSessionConfiguration)urlSessionConfiguration
{
  return self->_urlSessionConfiguration;
}

- (void)setUrlSessionConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
  objc_storeStrong((id *)&self->_urlSession, a3);
}

- (NSURLConnection)urlConnection
{
  return self->_urlConnection;
}

- (void)setUrlConnection:(id)a3
{
  objc_storeStrong((id *)&self->_urlConnection, a3);
}

- (NSString)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
  objc_storeStrong((id *)&self->_user, a3);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (int64_t)primeRetryCount
{
  return self->_primeRetryCount;
}

- (void)setPrimeRetryCount:(int64_t)a3
{
  self->_primeRetryCount = a3;
}

- (BOOL)primeEnabled
{
  return self->_primeEnabled;
}

- (NSHTTPURLResponse)urlResponse
{
  return self->_urlResponse;
}

- (void)setUrlResponse:(id)a3
{
  objc_storeStrong((id *)&self->_urlResponse, a3);
}

- (NSData)receivedData
{
  return (NSData *)objc_getProperty(self, a2, 184, 1);
}

- (void)setReceivedData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (int64_t)reprimingResponseStatus
{
  return self->_reprimingResponseStatus;
}

- (int64_t)requestReadyState
{
  return self->_requestReadyState;
}

- (unsigned)requestStatusCode
{
  return self->_requestStatusCode;
}

- (void)setRequestStatusCode:(unsigned int)a3
{
  self->_requestStatusCode = a3;
}

- (NSString)requestStatusText
{
  return self->_requestStatusText;
}

- (void)setRequestStatusText:(id)a3
{
  objc_storeStrong((id *)&self->_requestStatusText, a3);
}

- (int64_t)requestResponseType
{
  return self->_requestResponseType;
}

- (void)setRequestResponseType:(int64_t)a3
{
  self->_requestResponseType = a3;
}

- (NSError)requestError
{
  return self->_requestError;
}

- (void)setRequestError:(id)a3
{
  objc_storeStrong((id *)&self->_requestError, a3);
}

- (unsigned)readyState
{
  return self->_readyState;
}

- (void)setReadyState:(unsigned int)a3
{
  self->_readyState = a3;
}

- (unsigned)status
{
  return self->_status;
}

- (void)setStatus:(unsigned int)a3
{
  self->_status = a3;
}

- (NSString)statusText
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setStatusText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSDictionary)performanceMetrics
{
  return (NSDictionary *)objc_getProperty(self, a2, 240, 1);
}

- (void)setPerformanceMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSHTTPURLResponse)cachedURLResponse
{
  return (NSHTTPURLResponse *)objc_getProperty(self, a2, 248, 1);
}

- (void)setCachedURLResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (JSManagedValue)managedSelf
{
  return self->_managedSelf;
}

- (void)setManagedSelf:(id)a3
{
  objc_storeStrong((id *)&self->_managedSelf, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedSelf, 0);
  objc_storeStrong((id *)&self->_cachedURLResponse, 0);
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong((id *)&self->_requestError, 0);
  objc_storeStrong((id *)&self->_requestStatusText, 0);
  objc_storeStrong((id *)&self->_receivedData, 0);
  objc_storeStrong((id *)&self->_urlResponse, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_urlConnection, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_urlSessionConfiguration, 0);
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong((id *)&self->_onReadyStateChangeMessageQueue, 0);
  objc_destroyWeak((id *)&self->_jingleOperation);
  objc_storeStrong((id *)&self->_dataToSend, 0);
  objc_storeStrong((id *)&self->_networkRequestRecord, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_requestURL, 0);
}

- (void)_sendWithData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_1D95F2000, v0, v1, "XHR failure: NSURLConnection is nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)validateTrust:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D95F2000, a2, a3, "Error validating certificate trust: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)verifyCertificateIsSystemTrustedWithTrust:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_1D95F2000, v0, v1, "Invalid trust provided for system trust verification.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)verifyCertificateIsSystemTrustedWithTrust:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_1D95F2000, v0, v1, "No certificate chain, failing system trust validation.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)verifyCertificateIsSystemTrustedWithTrust:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_1D95F2000, v0, v1, "No root certificate, failing system trust validation.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)verifyCertificateIsSystemTrustedWithTrust:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_1D95F2000, v0, v1, "Root certificate is not system trusted, failing validation.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)verifyCertificateIsSystemTrustedWithTrust:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_12(&dword_1D95F2000, v0, v1, "Skipping system trust requirement due to default override.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)verifyCertificateIsSystemTrustedWithTrust:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_1D95F2000, v0, v1, "Certificate is not trusted.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)URLSession:didReceiveChallenge:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_12(&dword_1D95F2000, v0, v1, "System trust verified.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)URLSession:didReceiveChallenge:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_1D95F2000, v0, v1, "System trust verification failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)URLSession:didReceiveChallenge:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_12(&dword_1D95F2000, v0, v1, "Challenge was not server trust.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)_loadingDidFailWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D95F2000, a2, a3, "XHR connection failed: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
