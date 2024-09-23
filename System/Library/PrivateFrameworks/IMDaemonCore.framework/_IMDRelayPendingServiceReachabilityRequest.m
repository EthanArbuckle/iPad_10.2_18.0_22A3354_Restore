@implementation _IMDRelayPendingServiceReachabilityRequest

- (_IMDRelayPendingServiceReachabilityRequest)initWithRequest:(id)a3 responseHandler:(id)a4
{
  id v7;
  id v8;
  _IMDRelayPendingServiceReachabilityRequest *v9;
  _IMDRelayPendingServiceReachabilityRequest *v10;
  uint64_t v11;
  NSMapTable *responseHandlers;
  uint64_t v13;
  NSDate *lastUpdateTime;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_IMDRelayPendingServiceReachabilityRequest;
  v9 = -[_IMDRelayPendingServiceReachabilityRequest init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originalRequest, a3);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    responseHandlers = v10->_responseHandlers;
    v10->_responseHandlers = (NSMapTable *)v11;

    -[NSMapTable setObject:forKey:](v10->_responseHandlers, "setObject:forKey:", v8, v7);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = objc_claimAutoreleasedReturnValue();
    lastUpdateTime = v10->_lastUpdateTime;
    v10->_lastUpdateTime = (NSDate *)v13;

  }
  return v10;
}

- (NSString)requestID
{
  void *v2;
  void *v3;

  -[_IMDRelayPendingServiceReachabilityRequest originalRequest](self, "originalRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)createIncompleteFinalResult
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[_IMDRelayPendingServiceReachabilityRequest lastResult](self, "lastResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  if (v4)
  {
    objc_msgSend(v4, "setFinal:", 1);
    v5 = v4;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0D39A50];
    -[_IMDRelayPendingServiceReachabilityRequest originalRequest](self, "originalRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serviceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IMDRelayPendingServiceReachabilityRequest originalRequest](self, "originalRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finalResultForService:handleIDs:allAreReachable:checkedServer:error:", v8, v10, 0, 0, 3);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)enumerateResponseHandlersWithBlock:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[_IMDRelayPendingServiceReachabilityRequest responseHandlers](self, "responseHandlers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        -[_IMDRelayPendingServiceReachabilityRequest responseHandlers](self, "responseHandlers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v11, v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (NSMapTable)responseHandlers
{
  return self->_responseHandlers;
}

- (void)setResponseHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_responseHandlers, a3);
}

- (NSArray)sentToDevices
{
  return self->_sentToDevices;
}

- (void)setSentToDevices:(id)a3
{
  objc_storeStrong((id *)&self->_sentToDevices, a3);
}

- (IMServiceReachabilityResult)lastResult
{
  return self->_lastResult;
}

- (void)setLastResult:(id)a3
{
  objc_storeStrong((id *)&self->_lastResult, a3);
}

- (NSDate)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (void)setLastUpdateTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdateTime, a3);
}

- (IMServiceReachabilityRequest)originalRequest
{
  return self->_originalRequest;
}

- (void)setOriginalRequest:(id)a3
{
  objc_storeStrong((id *)&self->_originalRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRequest, 0);
  objc_storeStrong((id *)&self->_lastUpdateTime, 0);
  objc_storeStrong((id *)&self->_lastResult, 0);
  objc_storeStrong((id *)&self->_sentToDevices, 0);
  objc_storeStrong((id *)&self->_responseHandlers, 0);
}

@end
