@implementation _IMDRelayingServiceReachabilityResponseHandler

- (_IMDRelayingServiceReachabilityResponseHandler)initWithRequestID:(id)a3 pushToken:(id)a4 fromIdentifier:(id)a5 toIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _IMDRelayingServiceReachabilityResponseHandler *v15;
  _IMDRelayingServiceReachabilityResponseHandler *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_IMDRelayingServiceReachabilityResponseHandler;
  v15 = -[_IMDRelayingServiceReachabilityResponseHandler init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_requestID, a3);
    objc_storeStrong((id *)&v16->_pushToken, a4);
    objc_storeStrong((id *)&v16->_fromIdentifier, a5);
    objc_storeStrong((id *)&v16->_toIdentifier, a6);
  }

  return v16;
}

- (void)_sendCurrentResult
{
  void *v3;
  uint64_t v4;
  int v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  IMDRelayServiceReachabilityResponse *v12;
  void *v13;
  IMDRelayServiceReachabilityResponse *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[_IMDRelayingServiceReachabilityResponseHandler lastResult](self, "lastResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = IMOSLoggingEnabled(v4);
  if (v3)
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        -[_IMDRelayingServiceReachabilityResponseHandler lastResult](self, "lastResult");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isFinal"))
          v8 = CFSTR("final");
        else
          v8 = CFSTR("intermediate");
        -[_IMDRelayingServiceReachabilityResponseHandler requestID](self, "requestID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[_IMDRelayingServiceReachabilityResponseHandler pushToken](self, "pushToken");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_IMDRelayingServiceReachabilityResponseHandler fromIdentifier](self, "fromIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138413058;
        v22 = v8;
        v23 = 2112;
        v24 = v9;
        v25 = 2112;
        v26 = v10;
        v27 = 2112;
        v28 = v11;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Sending %@ result for request ID %@ to %@/%@", (uint8_t *)&v21, 0x2Au);

      }
    }
    v12 = [IMDRelayServiceReachabilityResponse alloc];
    -[_IMDRelayingServiceReachabilityResponseHandler lastResult](self, "lastResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[IMDRelayServiceReachabilityResponse initWithResult:](v12, "initWithResult:", v13);

    +[IMDRelayServiceController sharedInstance](IMDRelayServiceController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IMDRelayingServiceReachabilityResponseHandler requestID](self, "requestID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IMDRelayingServiceReachabilityResponseHandler pushToken](self, "pushToken");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IMDRelayingServiceReachabilityResponseHandler fromIdentifier](self, "fromIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IMDRelayingServiceReachabilityResponseHandler toIdentifier](self, "toIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sendReachabilityResponse:requestID:toToken:toIdentifier:fromIdentifier:", v14, v16, v17, v18, v19);

  }
  else if (v5)
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Not sending current result, no result cached yet?", (uint8_t *)&v21, 2u);
    }

  }
}

- (void)_deferSendingCurrentResultIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint8_t v8[16];

  -[_IMDRelayingServiceReachabilityResponseHandler lastResult](self, "lastResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__sendCurrentResult, 0);
    -[_IMDRelayingServiceReachabilityResponseHandler lastResult](self, "lastResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isFinal");

    if (v6)
      MEMORY[0x1E0DE7D20](self, sel__sendCurrentResult);
    else
      objc_msgSend(MEMORY[0x1E0DE7910], "performSelector:withObject:afterDelay:", sel__sendCurrentResult, self, 0.5);
  }
  else if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Not sending current result, no result cached yet?", v8, 2u);
    }

  }
}

- (void)reachabilityRequest:(id)a3 updatedWithResult:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "requestID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Received update for request ID %@", (uint8_t *)&v10, 0xCu);

    }
  }
  -[_IMDRelayingServiceReachabilityResponseHandler setLastResult:](self, "setLastResult:", v7);
  -[_IMDRelayingServiceReachabilityResponseHandler _deferSendingCurrentResultIfNeeded](self, "_deferSendingCurrentResultIfNeeded");

}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_requestID, a3);
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_storeStrong((id *)&self->_pushToken, a3);
}

- (NSString)fromIdentifier
{
  return self->_fromIdentifier;
}

- (void)setFromIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_fromIdentifier, a3);
}

- (NSString)toIdentifier
{
  return self->_toIdentifier;
}

- (void)setToIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_toIdentifier, a3);
}

- (IMServiceReachabilityResult)lastResult
{
  return self->_lastResult;
}

- (void)setLastResult:(id)a3
{
  objc_storeStrong((id *)&self->_lastResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastResult, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

@end
