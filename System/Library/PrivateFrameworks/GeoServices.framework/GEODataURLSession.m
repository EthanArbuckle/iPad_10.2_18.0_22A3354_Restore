@implementation GEODataURLSession

uint64_t __76__GEODataURLSession_Task__configureTask_withRequest_delegate_delegateQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureTask:withRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GEODataURLSession urlSessions](self, "urlSessions");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLSession:didBecomeInvalidWithError:", v7, v6);

}

- (void)replaceBackingTask:(id)a3 withTask:(id)a4 forURLSession:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEODataURLSessionTaskIdentifier *v11;
  void *v12;
  void *v13;
  void *v14;
  GEODataURLSessionTaskIdentifier *v15;
  void *v16;
  uint8_t v17[16];

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = -[GEODataURLSessionTaskIdentifier initWithSession:task:]([GEODataURLSessionTaskIdentifier alloc], "initWithSession:task:", v9, v10);

  -[GEODataURLSession sessionTasks](self, "sessionTasks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[GEODataURLSession sessionTasks](self, "sessionTasks");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", 0, v11);

    v15 = -[GEODataURLSessionTaskIdentifier initWithSession:task:]([GEODataURLSessionTaskIdentifier alloc], "initWithSession:task:", v9, v8);
    -[GEODataURLSession sessionTasks](self, "sessionTasks");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, v15);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: dataTask != ((void *)0)", v17, 2u);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x18D764E2C]();
  -[GEODataURLSession removeTaskForURLSession:task:](self, "removeTaskForURLSession:task:", v13, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "dataURLSession:taskDidCompleteWithError:", self, v9);

  objc_autoreleasePoolPop(v10);
}

- (id)taskWithRequest:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  double v5;

  LODWORD(v5) = *MEMORY[0x1E0CB3338];
  return -[GEODataURLSession taskWithRequest:priority:delegate:delegateQueue:](self, "taskWithRequest:priority:delegate:delegateQueue:", a3, a4, a5, v5);
}

- (id)taskWithRequest:(id)a3 priority:(float)a4 delegate:(id)a5 delegateQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  GEODataURLSessionTask *v13;
  GEODataURLSessionTask *v14;
  uint64_t v15;
  double v16;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "URL");
  v13 = (GEODataURLSessionTask *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = [GEODataURLSessionTask alloc];
    v15 = objc_msgSend(v10, "kind");
    *(float *)&v16 = a4;
    v13 = -[GEODataURLSessionTask initWithSession:delegate:delegateQueue:requestKind:priority:](v14, "initWithSession:delegate:delegateQueue:requestKind:priority:", self, v11, v12, v15, v16);
    -[GEODataURLSession configureTask:withRequest:delegate:delegateQueue:](self, "configureTask:withRequest:delegate:delegateQueue:", v13, v10, v11, v12);
  }

  return v13;
}

- (void)configureTask:(id)a3 withRequest:(id)a4 delegate:(id)a5 delegateQueue:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  dispatch_block_t v13;
  _QWORD block[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  -[GEODataURLSession sessionIsolation](self, "sessionIsolation");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__GEODataURLSession_Task__configureTask_withRequest_delegate_delegateQueue___block_invoke;
  block[3] = &unk_1E1C01790;
  block[4] = self;
  v15 = v8;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);

}

- (OS_dispatch_queue)sessionIsolation
{
  return self->_sessionIsolation;
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  void (**v10)(id, _QWORD);
  void *v11;
  void *v12;
  id v13;

  v13 = a5;
  v10 = (void (**)(id, _QWORD))a6;
  -[GEODataURLSession taskForURLSession:task:](self, "taskForURLSession:task:", a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "dataURLSession:willSendRequestForEstablishedConnection:completionHandler:", self, v13, v10);
  else
    v10[2](v10, 0);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  os_log_type_t v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  v14 = (void *)MEMORY[0x18D764E2C]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "valueForHTTPHeaderField:", CFSTR("Date"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (qword_1ECDBBFB8 != -1)
      dispatch_once(&qword_1ECDBBFB8, &__block_literal_global_441);
    GEOGetMonotonicTime();
    v17 = v16;
    if (v16 >= *(double *)&qword_1ECDBBFA8)
    {
      objc_msgSend((id)qword_1ECDBBFB0, "dateFromString:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v29 = v14;
        *(double *)&qword_1ECDBBFA8 = v17 + 600.0;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "timeIntervalSinceDate:", v18);
        v21 = v20;
        objc_msgSend(v19, "timeIntervalSinceDate:", v18);
        if (v21 >= 0.0)
          v23 = v22;
        else
          v23 = -v22;
        if (checkSystemClockAgainstHTTPResponse_clockLooksFine == v23 < 120.0)
        {
          v24 = OS_LOG_TYPE_DEBUG;
        }
        else
        {
          if (v23 >= 120.0)
            v24 = OS_LOG_TYPE_FAULT;
          else
            v24 = OS_LOG_TYPE_DEFAULT;
          checkSystemClockAgainstHTTPResponse_clockLooksFine = v23 < 120.0;
        }
        GEOGetDataSessionURLLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, v24))
        {
          v26 = "is NOT";
          if (v23 < 120.0)
            v26 = "is";
          *(_DWORD *)buf = 136315394;
          v31 = v26;
          v32 = 2112;
          v33 = v15;
          _os_log_impl(&dword_1885A9000, v25, v24, "System clock %s in sync with the server (%@)", buf, 0x16u);
        }

        v14 = v29;
      }

    }
  }
  -[GEODataURLSession taskForURLSession:task:](self, "taskForURLSession:task:", v10, v11);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
    objc_msgSend(v27, "dataURLSession:didReceiveResponse:completionHandler:", self, v12, v13);
  else
    v13[2](v13, 0);

  objc_autoreleasePoolPop(v14);
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x18D764E2C]();
  -[GEODataURLSession taskForURLSession:task:](self, "taskForURLSession:task:", v13, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "didCollectMetrics:", v9);

  objc_autoreleasePoolPop(v10);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x18D764E2C]();
  -[GEODataURLSession taskForURLSession:task:](self, "taskForURLSession:task:", v13, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "didReceiveData:", v9);

  objc_autoreleasePoolPop(v10);
}

- (void)_configureTask:(id)a3 withRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  GEODataURLSessionTaskIdentifier *v13;
  void *v14;
  id v15;

  v6 = a4;
  v7 = a3;
  -[GEODataURLSession urlSessionForRequest:](self, "urlSessionForRequest:", v6);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createURLSessionTaskWithSession:request:", v15, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSessionIdentifier:", GEODataURLSessionGetIdentifierFromSession(v15));
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = objc_msgSend(v6, "kind");
  v11 = objc_msgSend(v6, "kind");

  objc_msgSend(v9, "stringWithFormat:", CFSTR("%x.%i"), v10, HIDWORD(v11));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTaskDescription:", v12);

  v13 = -[GEODataURLSessionTaskIdentifier initWithSession:task:]([GEODataURLSessionTaskIdentifier alloc], "initWithSession:task:", v15, v8);
  -[GEODataURLSession sessionTasks](self, "sessionTasks");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v7, v13);

}

- (id)removeTaskForURLSession:(id)a3 task:(id)a4
{
  id v6;
  id v7;
  GEODataURLSessionTaskIdentifier *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = -[GEODataURLSessionTaskIdentifier initWithSession:task:]([GEODataURLSessionTaskIdentifier alloc], "initWithSession:task:", v7, v6);

  -[GEODataURLSession sessionTasks](self, "sessionTasks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEODataURLSession sessionTasks](self, "sessionTasks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v8);

  return v10;
}

- (id)taskForURLSession:(id)a3 task:(id)a4
{
  id v6;
  id v7;
  GEODataURLSessionTaskIdentifier *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[GEODataURLSessionTaskIdentifier initWithSession:task:]([GEODataURLSessionTaskIdentifier alloc], "initWithSession:task:", v7, v6);

  -[GEODataURLSession sessionTasks](self, "sessionTasks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSMutableDictionary)sessionTasks
{
  return self->_sessionTasks;
}

- (id)urlSessionForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[GEODataURLSession urlSessions](self, "urlSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "urlSessionForRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[GEODataURLSession urlSessions](self, "urlSessions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEODataURLSession activeSessionIdentifiers](self, "activeSessionIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pruneSessionsNotInIdentifierArray:agressive:", v8, 0);

    -[GEODataURLSession createNewURLSessionWithRequest:](self, "createNewURLSessionWithRequest:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEODataURLSession urlSessions](self, "urlSessions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSession:", v6);

  }
  return v6;
}

- (GEODataURLSessionList)urlSessions
{
  return self->_urlSessions;
}

- (id)activeSessionIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[GEODataURLSession sessionTasks](self, "sessionTasks", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "sessionIdentifier");
        if ((_DWORD)v10)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)createNewURLSessionWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
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
  NSObject *v26;
  void *v27;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "backgroundSessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB39F8];
  if (v5)
  {
    objc_msgSend(v4, "backgroundSessionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backgroundSessionConfigurationWithIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setDiscretionary:", 1);
    objc_msgSend(v8, "setSessionSendsLaunchEvents:", 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[GEOPlatform isRunningInGeod](GEOPlatform, "isRunningInGeod")
      && GEOConfigGetBOOL(GeoServicesConfig_DisableAPWakeOnIdleConnections, (uint64_t)off_1EDF4E1E8))
    {
      GEOGetDataSessionURLLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_INFO, "Disable AP wake on idle connections", buf, 2u);
      }

      objc_msgSend(v8, "set_disableAPWakeOnIdleConnections:", 1);
    }
    objc_msgSend(v8, "setTimeoutIntervalForResource:", GEOConfigGetDouble(GeoServicesConfig_MaximumRequestDuration, (uint64_t)off_1EDF4E268));
  }
  objc_msgSend(v8, "setURLCache:", 0);
  objc_msgSend(v8, "setHTTPCookieStorage:", 0);
  objc_msgSend(v8, "geo_configureWithRequest:", v4);
  v10 = (void *)MEMORY[0x1E0CB39F0];
  -[GEODataURLSession sessionIsolationOperationQueue](self, "sessionIsolationOperationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sessionWithConfiguration:delegate:delegateQueue:", v8, self, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEODataURLSession setNextSessionIdentifier:](self, "setNextSessionIdentifier:", -[GEODataURLSession nextSessionIdentifier](self, "nextSessionIdentifier") + 1);
  v13 = -[GEODataURLSession nextSessionIdentifier](self, "nextSessionIdentifier");
  v14 = (void *)MEMORY[0x1E0C99DE8];
  v15 = v12;
  objc_msgSend(v14, "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "_allowsTLSSessionTickets"))
    objc_msgSend(v16, "addObject:", CFSTR("TLS-Session-Tickets"));
  if (objc_msgSend(v17, "_allowsExpensiveAccess"))
    objc_msgSend(v16, "addObject:", CFSTR("Expensive-Access"));
  if (objc_msgSend(v17, "_requiresPowerPluggedIn"))
    objc_msgSend(v16, "addObject:", CFSTR("Requires-Power"));
  if (objc_msgSend(v17, "multipathServiceType"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("multipath:%llu"), objc_msgSend(v17, "multipathServiceType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v18);

  }
  objc_msgSend(v17, "_sourceApplicationBundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(CFSTR("source:"), "stringByAppendingString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v20);

  }
  objc_msgSend(v17, "_sourceApplicationAuditTokenData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "length"))
  {
    objc_msgSend(v21, "getBytes:length:", buf, 2);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("source:%02x%02x"), (char)buf[0], (char)buf[1]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v22);

  }
  v23 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR(" "));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("[%u] %@"), v13, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setSessionDescription:", v25);
  GEOGetDataSessionURLLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v15, "sessionDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v30 = v15;
    v31 = 2112;
    v32 = v27;
    _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_INFO, "Created new underlying session %p %@", buf, 0x16u);

  }
  return v15;
}

- (unsigned)nextSessionIdentifier
{
  return self->_nextSessionIdentifier;
}

- (void)setNextSessionIdentifier:(unsigned int)a3
{
  self->_nextSessionIdentifier = a3;
}

- (NSOperationQueue)sessionIsolationOperationQueue
{
  return self->_sessionIsolationOperationQueue;
}

+ (GEODataURLSession)sharedDataURLSession
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__GEODataURLSession_sharedDataURLSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECDBBF98 != -1)
    dispatch_once(&qword_1ECDBBF98, block);
  return (GEODataURLSession *)(id)qword_1ECDBBFA0;
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  uint8_t v19[16];

  v8 = a3;
  v9 = a5;
  v10 = (void (**)(id, uint64_t, _QWORD))a6;
  objc_msgSend(v9, "protectionSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "proxyType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 != (void *)*MEMORY[0x1E0CB3328])
    goto LABEL_4;
  objc_msgSend(v9, "protectionSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "authenticationMethod");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14 != (void *)*MEMORY[0x1E0CB32B8])
  {

LABEL_4:
    goto LABEL_5;
  }
  objc_msgSend(v8, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "_requiresSecureHTTPSProxyConnection");

  if (!v17)
    goto LABEL_6;
  GEOGetDataSessionURLLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_DEBUG, "Received a secure proxy challenge", v19, 2u);
  }

  +[GEOMapsAuthServiceHelper sharedAuthHelper](GEOMapsAuthServiceHelper, "sharedAuthHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleSecureProxyChallenge:", v9);
LABEL_5:

LABEL_6:
  v10[2](v10, 1, 0);

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x18D764E2C]();
  -[GEODataURLSession taskForURLSession:task:](self, "taskForURLSession:task:", v13, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "didFinishDownloadingToURL:", v9);

  objc_autoreleasePoolPop(v10);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[GEODataURLSession taskForURLSession:task:](self, "taskForURLSession:task:", v12, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "backingTask:didBecomeDownloadTask:", v8, v9);
    -[GEODataURLSession replaceBackingTask:withTask:forURLSession:](self, "replaceBackingTask:withTask:forURLSession:", v8, v9, v12);
  }

}

- (void)pruneInactiveSessions
{
  void *v3;
  id v4;

  -[GEODataURLSession urlSessions](self, "urlSessions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GEODataURLSession activeSessionIdentifiers](self, "activeSessionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pruneSessionsNotInIdentifierArray:agressive:", v3, 1);

}

- (void)finishTasksAndInvalidateForegroundSessions:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *group;

  v4 = a3;
  group = dispatch_group_create();
  -[GEODataURLSession urlSessions](self, "urlSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishTasksAndInvalidateSessionsMatching:group:", &__block_literal_global_69, group);

  -[GEODataURLSession sessionIsolation](self, "sessionIsolation");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(group, v6, v4);

}

BOOL __76__GEODataURLSession_URLSession__finishTasksAndInvalidateForegroundSessions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  char v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isDiscretionary") & 1) != 0)
  {
    v4 = 0;
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend(v2, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "waitsForConnectivity");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v2, "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7 == 0;

    goto LABEL_6;
  }
  v4 = 0;
LABEL_7:

  return v4;
}

void __41__GEODataURLSession_sharedDataURLSession__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECDBBFA0;
  qword_1ECDBBFA0 = (uint64_t)v1;

}

- (GEODataURLSession)init
{
  id v2;
  GEODataURLSessionList *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  dispatch_source_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint8_t v19[8];
  _QWORD v20[4];
  id v21;
  _QWORD handler[4];
  id v23;
  id location;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)GEODataURLSession;
  v2 = -[GEODataURLSession init](&v25, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(GEODataURLSessionList);
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    geo_dispatch_queue_create_with_workloop_qos();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

    v7 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v8 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v7;

    objc_msgSend(*((id *)v2 + 3), "setName:", CFSTR("GEODataURLSession.sessionIsolation"));
    objc_msgSend(*((id *)v2 + 3), "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(*((id *)v2 + 3), "setUnderlyingQueue:", *((_QWORD *)v2 + 2));
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v9;

    objc_initWeak(&location, v2);
    *((_DWORD *)v2 + 13) = -1;
    v11 = *((_QWORD *)v2 + 2);
    v12 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __25__GEODataURLSession_init__block_invoke;
    handler[3] = &unk_1E1C05280;
    objc_copyWeak(&v23, &location);
    notify_register_dispatch("com.apple.symptoms.hasAlternateAdvice", (int *)v2 + 13, v11, handler);
    v13 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 2uLL, *((dispatch_queue_t *)v2 + 2));
    v14 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v13;

    v15 = *((_QWORD *)v2 + 5);
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __25__GEODataURLSession_init__block_invoke_2;
    v20[3] = &unk_1E1BFF8B0;
    objc_copyWeak(&v21, &location);
    dispatch_source_set_event_handler(v15, v20);
    dispatch_activate(*((dispatch_object_t *)v2 + 5));
    if (+[GEOPlatform isRunningInGeod](GEOPlatform, "isRunningInGeod")
      && GEOConfigGetBOOL(GeoServicesConfig_CloseOpenNetworkConnectionsOnDeviceSleep, (uint64_t)off_1EDF4DF28))
    {
      GEOGetDataSessionURLLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_INFO, "Registering for device sleep notifications", v19, 2u);
      }

      +[GEOSystemMonitor sharedInstance](GEOSystemMonitor, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addSystemSleepObserver:queue:", v2, *((_QWORD *)v2 + 2));

    }
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return (GEODataURLSession *)v2;
}

void __25__GEODataURLSession_init__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  uint64_t state64;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    state64 = 0;
    notify_get_state(a2, &state64);
    if (state64 == 1)
      objc_msgSend(WeakRetained, "_considerRetryingDueToAlternateAdvice");
  }

}

void __25__GEODataURLSession_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didReceiveMemoryPressureWarning");

}

- (void)dealloc
{
  int symptomsAlternateAdviceToken;
  NSObject *memoryNotificationEventSource;
  objc_super v5;

  symptomsAlternateAdviceToken = self->_symptomsAlternateAdviceToken;
  if (symptomsAlternateAdviceToken != -1)
    notify_cancel(symptomsAlternateAdviceToken);
  memoryNotificationEventSource = self->_memoryNotificationEventSource;
  if (memoryNotificationEventSource)
    dispatch_source_cancel(memoryNotificationEventSource);
  v5.receiver = self;
  v5.super_class = (Class)GEODataURLSession;
  -[GEODataURLSession dealloc](&v5, sel_dealloc);
}

- (void)systemCanSleep:(id)a3
{
  void (**v4)(id, uint64_t);
  unint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void (**v9)(id, uint64_t);
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  void (**v13)(id, uint64_t);
  uint8_t *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD *);
  void *v19;
  void (**v20)(id, uint64_t);
  _QWORD *v21;
  uint8_t *v22;
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[3];
  char v30;

  v4 = (void (**)(id, uint64_t))a3;
  if ((GEOConfigGetBOOL(GeoServicesConfig_CloseOpenNetworkConnectionsOnDeviceSleep, (uint64_t)off_1EDF4DF28) & 1) == 0)
  {
LABEL_9:
    v4[2](v4, 1);
    goto LABEL_10;
  }
  v5 = -[GEODataURLSessionList count](self->_urlSessions, "count");
  GEOGetDataSessionURLLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (!v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "System may sleep. No open NSURLSessions, so nothing to do", buf, 2u);
    }

    goto LABEL_9;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "System may sleep. Invalidating open foreground NSURLSessions", buf, 2u);
  }

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 0;
  *(_QWORD *)buf = 0;
  v24 = buf;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__41;
  v27 = __Block_byref_object_dispose__41;
  v28 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __36__GEODataURLSession_systemCanSleep___block_invoke;
  v19 = &unk_1E1C0AF70;
  v21 = v29;
  v9 = v4;
  v20 = v9;
  v22 = buf;
  v10 = geo_dispatch_timer_create_on_queue();
  v11 = (void *)*((_QWORD *)v24 + 5);
  *((_QWORD *)v24 + 5) = v10;

  dispatch_resume(*((dispatch_object_t *)v24 + 5));
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __36__GEODataURLSession_systemCanSleep___block_invoke_15;
  v12[3] = &unk_1E1C0AF98;
  v14 = buf;
  v15 = v29;
  v12[4] = self;
  v13 = v9;
  -[GEODataURLSession finishTasksAndInvalidateForegroundSessions:](self, "finishTasksAndInvalidateForegroundSessions:", v12);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v29, 8);
LABEL_10:

}

void __36__GEODataURLSession_systemCanSleep___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];

  v2 = *(_QWORD *)(a1[5] + 8);
  if (!*(_BYTE *)(v2 + 24))
  {
    *(_BYTE *)(v2 + 24) = 1;
    GEOGetDataSessionURLLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "Timed out waiting for open foreground NSURLSessions to invalidate. Allowing sleep", v6, 2u);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1[6] + 8) + 40));
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

void __36__GEODataURLSession_systemCanSleep___block_invoke_15(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  double Double;
  NSObject *v7;
  _BOOL4 v8;
  dispatch_time_t v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(NSObject **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    GEOGetDataSessionURLLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Finished invalidating open foreground NSURLSessions, but timed out waiting. Sleep was already allowed", buf, 2u);
    }

  }
  else
  {
    Double = GEOConfigGetDouble(GeoServicesConfig_CloseOpenNetworkConnectionsOnDeviceSleepDelay, (uint64_t)off_1EDF4DF38);
    GEOGetDataSessionURLLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if (Double >= 0.000001)
    {
      if (v8)
      {
        *(_DWORD *)buf = 134349056;
        v15 = Double;
        _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Finished invalidating open foreground NSURLSessions. Allowing sleep in %{public}.1f seconds", buf, 0xCu);
      }

      v9 = dispatch_time(0, (uint64_t)(Double * 1000000000.0));
      v10 = (void *)a1[5];
      v11 = *(NSObject **)(a1[4] + 16);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__GEODataURLSession_systemCanSleep___block_invoke_16;
      block[3] = &unk_1E1C01F48;
      v13 = v10;
      dispatch_after(v9, v11, block);

    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Finished invalidating open foreground NSURLSessions. Allowing sleep", buf, 2u);
      }

      (*(void (**)(void))(a1[5] + 16))();
    }
  }
}

uint64_t __36__GEODataURLSession_systemCanSleep___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)systemWillSleep:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (id)downloadTaskWithRequest:(id)a3 priority:(float)a4 delegate:(id)a5 delegateQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  GEODataURLSessionDownloadTask *v13;
  GEODataURLSessionDownloadTask *v14;
  uint64_t v15;
  double v16;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "URL");
  v13 = (GEODataURLSessionDownloadTask *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = [GEODataURLSessionDownloadTask alloc];
    v15 = objc_msgSend(v10, "kind");
    *(float *)&v16 = a4;
    v13 = -[GEODataURLSessionTask initWithSession:delegate:delegateQueue:requestKind:priority:](v14, "initWithSession:delegate:delegateQueue:requestKind:priority:", self, v11, v12, v15, v16);
    -[GEODataURLSession configureTask:withRequest:delegate:delegateQueue:](self, "configureTask:withRequest:delegate:delegateQueue:", v13, v10, v11, v12);
  }

  return v13;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %lu sessions"), -[GEODataURLSessionList count](self->_urlSessions, "count"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" %lu tasks"), -[NSMutableDictionary count](self->_sessionTasks, "count"));
  if (-[NSMutableDictionary count](self->_sessionTasks, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NSMutableDictionary allKeys](self->_sessionTasks, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "description");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "appendString:", CFSTR(" {"));
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v11);

    objc_msgSend(v3, "appendString:", CFSTR("}"));
  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR(" {}"));
  }
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryNotificationEventSource, 0);
  objc_storeStrong((id *)&self->_sessionTasks, 0);
  objc_storeStrong((id *)&self->_sessionIsolationOperationQueue, 0);
  objc_storeStrong((id *)&self->_sessionIsolation, 0);
  objc_storeStrong((id *)&self->_urlSessions, 0);
}

- (BOOL)_wifiAssistRetryEnabled
{
  return GEOConfigGetBOOL(GeoServicesConfig_SymptomsAlternateAdviceShouldRetry, (uint64_t)off_1EDF4CF68);
}

- (double)_wifiAssistRetryDelay
{
  return GEOConfigGetDouble(GeoServicesConfig_SymptomsAlternateAdviceRetryDelay, (uint64_t)off_1EDF4CF78);
}

- (void)_considerRetryingDueToAlternateAdvice
{
  NSObject *v3;
  double v4;
  double v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  dispatch_time_t v9;
  NSObject *sessionIsolation;
  _QWORD v11[6];
  uint8_t buf[4];
  GEODataURLSession *v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  GEOGetDataSessionURLLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v13 = self;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "%{public}p Symptoms framework told us it has alternate advice.", buf, 0xCu);
  }

  if (-[GEODataURLSession _wifiAssistRetryEnabled](self, "_wifiAssistRetryEnabled"))
  {
    -[GEODataURLSession _wifiAssistRetryDelay](self, "_wifiAssistRetryDelay");
    v5 = v4;
    GEOGetDataSessionURLLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v13 = self;
      v14 = 2048;
      v15 = v5;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_INFO, "%p Symptoms framework has informed us of potential connectivity trouble. Will re-issue requests if our request doesn't complete in %f seconds.", buf, 0x16u);
    }

    GEOMachAbsoluteTimeGetCurrent();
    v8 = v7;
    v9 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    sessionIsolation = self->_sessionIsolation;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70__GEODataURLSession_WiFiAssist___considerRetryingDueToAlternateAdvice__block_invoke;
    v11[3] = &unk_1E1BFF6D0;
    v11[4] = self;
    v11[5] = v8;
    dispatch_after(v9, sessionIsolation, v11);
  }
}

void __70__GEODataURLSession_WiFiAssist___considerRetryingDueToAlternateAdvice__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  double v13;
  double v14;
  int v15;
  void *v16;
  BOOL v17;
  void *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  os_activity_scope_state_s state;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  double v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sessionTasks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v31;
    *(_QWORD *)&v6 = 134218498;
    v28 = v6;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v8);
        objc_msgSend(*(id *)(a1 + 32), "sessionTasks", v28);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        state.opaque[0] = 0;
        state.opaque[1] = 0;
        objc_msgSend(v11, "activity");
        v12 = objc_claimAutoreleasedReturnValue();
        os_activity_scope_enter(v12, &state);

        objc_msgSend(v11, "setReceivedRNFNotification:", 1);
        if (v11
          && (objc_msgSend(v11, "startTime"), v13 != 2.22507386e-308)
          && (objc_msgSend(v11, "startTime"), v14 <= *(double *)(a1 + 40)))
        {
          v15 = objc_msgSend(v11, "finished") ^ 1;
        }
        else
        {
          v15 = 0;
        }
        objc_msgSend(v11, "request");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "multipathServiceType") == 0;

        if (v17)
        {
          if (!v15)
            goto LABEL_18;
        }
        else
        {
          objc_msgSend(v11, "response");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18)
            goto LABEL_18;
          v19 = objc_msgSend(v11, "mptcpNegotiated");

          if ((v15 & (v19 ^ 1) & 1) == 0)
            goto LABEL_18;
        }
        GEOGetDataSessionURLLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v21 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v11, "startTime");
          v23 = v22 - *(double *)(a1 + 40);
          *(_DWORD *)buf = v28;
          v35 = v21;
          v36 = 2112;
          v37 = v11;
          v38 = 2048;
          v39 = v23;
          _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_DEBUG, "%p restarting task %@ that was originally started %fs ago", buf, 0x20u);
        }

        objc_msgSend(*(id *)(a1 + 32), "sessionTasks");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", 0, v9);

        objc_msgSend(v11, "_prepareForRestart");
        v25 = *(void **)(a1 + 32);
        objc_msgSend(v11, "request");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "_configureTask:withRequest:", v11, v26);

        objc_msgSend(v11, "start");
LABEL_18:
        os_activity_scope_leave(&state);

        ++v8;
      }
      while (v5 != v8);
      v27 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      v5 = v27;
    }
    while (v27);
  }

}

+ (id)asynchronousGetURL:(id)a3 kind:(id)a4 auditToken:(id)a5 requestCounterTicket:(id)a6 queue:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a3;
  objc_msgSend(a1, "sharedDataURLSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "asynchronousGetURL:kind:auditToken:requestCounterTicket:queue:completionHandler:", v18, a4, v17, v16, v15, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)asynchronousGetURL:(id)a3 kind:(id)a4 auditToken:(id)a5 requestCounterTicket:(id)a6 queue:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  GEODataRequest *v19;
  GEODataURLSessionWaiter *v20;
  GEODataURLSession *v21;
  GEODataRequest *v22;
  id v23;
  id v24;
  void *v25;
  GEODataURLSessionWaiter *v26;
  GEODataURLSession *v27;
  GEODataURLSession *v28;
  SEL v29;
  uint64_t v30;
  OS_dispatch_queue *sessionIsolation;
  GEODataURLSessionTask *task;
  void *v34;
  objc_super v35;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v18 = a7;
  v34 = v14;
  v19 = -[GEODataRequest initWithKind:URL:auditToken:timeoutInterval:additionalHTTPHeaders:bodyData:userAgent:entityTag:cachedData:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:]([GEODataRequest alloc], "initWithKind:URL:auditToken:timeoutInterval:additionalHTTPHeaders:bodyData:userAgent:entityTag:cachedData:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:", a4, v14, v15, 0, 0, 0, 0.0, 0, 0, v16, 0, 0, 0, 2);
  v20 = [GEODataURLSessionWaiter alloc];
  v21 = self;
  v22 = v19;
  v23 = v18;
  v24 = v17;
  v25 = v24;
  v26 = 0;
  if (v20 && v24 && v23 && v21 && v22)
  {
    v35.receiver = v20;
    v35.super_class = (Class)GEODataURLSessionWaiter;
    v27 = -[GEODataURLSession init](&v35, sel_init);
    v28 = v27;
    if (v27)
    {
      objc_storeStrong((id *)&v27->_urlSessions, self);
      objc_setProperty_nonatomic_copy(v28, v29, v25, 24);
      -[GEODataURLSession taskWithRequest:delegate:delegateQueue:](v21, "taskWithRequest:delegate:delegateQueue:", v22, v28, v23);
      v30 = objc_claimAutoreleasedReturnValue();
      sessionIsolation = v28->_sessionIsolation;
      v28->_sessionIsolation = (OS_dispatch_queue *)v30;

      objc_storeStrong((id *)&v28->_sessionTasks, v28);
    }
    v20 = v28;
    v26 = v20;
  }

  if (v26)
    task = v26->_task;
  else
    task = 0;
  -[GEODataURLSessionTask start](task, "start");

  return v26;
}

@end
