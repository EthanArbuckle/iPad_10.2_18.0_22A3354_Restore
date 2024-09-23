@implementation IMDRelayServiceReachabilityController

+ (id)sharedInstance
{
  if (qword_1ED935EF8 != -1)
    dispatch_once(&qword_1ED935EF8, &unk_1E922F718);
  return (id)qword_1ED936140;
}

- (IMDRelayServiceReachabilityController)init
{
  IMDRelayServiceReachabilityController *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *pendingRequests;
  NSMutableDictionary *v5;
  NSMutableDictionary *signaturesToRequestIDs;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMDRelayServiceReachabilityController;
  v2 = -[IMDRelayServiceReachabilityController init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    signaturesToRequestIDs = v2->_signaturesToRequestIDs;
    v2->_signaturesToRequestIDs = v5;

    +[IMDRelayPushHandler sharedInstance](IMDRelayPushHandler, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addListener:", v2);

  }
  return v2;
}

- (BOOL)_dedupeRequestIfNeeded:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "_signature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_signaturesToRequestIDs, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingRequests, "objectForKeyedSubscript:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = v10 != 0;
    if (v10)
    {
      if (IMOSLoggingEnabled(v10))
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v6, "handleIDs");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "requestID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "requestID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138412802;
          v22 = v14;
          v23 = 2112;
          v24 = v15;
          v25 = 2112;
          v26 = v16;
          _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Asked to calculate reachability for %@ with ID %@, found similar in-progress request with ID %@ - will piggyback off of existing request instead of starting a new one.", (uint8_t *)&v21, 0x20u);

        }
      }
      objc_msgSend(v11, "lastResult");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v11, "lastResult");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "reachabilityRequest:updatedWithResult:", v6, v18);

      }
      objc_msgSend(v11, "responseHandlers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKey:", v7, v6);

    }
    else
    {
      -[NSMutableDictionary removeObjectForKey:](self->_signaturesToRequestIDs, "removeObjectForKey:", v8);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  _IMDRelayPendingServiceReachabilityRequest *v8;
  NSMutableDictionary *pendingRequests;
  void *v10;
  void *v11;
  NSMutableDictionary *signaturesToRequestIDs;
  void *v13;
  IMDRelayServiceReachabilityRequest *v14;
  void *v15;
  void *v16;
  void *v17;
  IMDRelayServiceReachabilityRequest *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableDictionary *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[IMDRelayServiceReachabilityController _dedupeRequestIfNeeded:responseHandler:](self, "_dedupeRequestIfNeeded:responseHandler:", v6, v7))
  {
    v8 = -[_IMDRelayPendingServiceReachabilityRequest initWithRequest:responseHandler:]([_IMDRelayPendingServiceReachabilityRequest alloc], "initWithRequest:responseHandler:", v6, v7);
    pendingRequests = self->_pendingRequests;
    objc_msgSend(v6, "requestID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](pendingRequests, "setObject:forKeyedSubscript:", v8, v10);

    objc_msgSend(v6, "requestID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    signaturesToRequestIDs = self->_signaturesToRequestIDs;
    objc_msgSend(v6, "_signature");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](signaturesToRequestIDs, "setObject:forKeyedSubscript:", v11, v13);

    v14 = [IMDRelayServiceReachabilityRequest alloc];
    objc_msgSend(v6, "handleIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serviceName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[IMDRelayServiceReachabilityRequest initWithHandles:serviceName:context:](v14, "initWithHandles:serviceName:context:", v15, v16, v17);

    if (IMOSLoggingEnabled(v19))
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "requestID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "serviceName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleIDs");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138412802;
        v31 = v21;
        v32 = 2112;
        v33 = v22;
        v34 = 2112;
        v35 = v23;
        _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Sending reachability request with ID %@ for service %@ for handles %@", (uint8_t *)&v30, 0x20u);

      }
    }
    +[IMDRelayServiceController sharedInstance](IMDRelayServiceController, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sendReachabilityRequest:requestID:", v18, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = self->_pendingRequests;
    objc_msgSend(v6, "requestID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSentToDevices:", v26);

    -[IMDRelayServiceReachabilityController _startCleanupTimerIfNeeded](self, "_startCleanupTimerIfNeeded");
  }

}

- (void)handler:(id)a3 incomingReachabilityRequest:(id)a4 fromToken:(id)a5 fromIdentifier:(id)a6 toIdentifier:(id)a7 messageGUID:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char v22;
  uint64_t v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _IMDRelayingServiceReachabilityResponseHandler *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v13 = a4;
  v14 = a5;
  v39 = a6;
  v15 = a7;
  v16 = a8;
  +[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "serviceName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "anySessionForServiceName:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    if (!IMOSLoggingEnabled(v20))
      goto LABEL_16;
    OSLogHandleForIMFoundationCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v13, "serviceName", v38);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v41 = v36;
      _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, "Dropping incoming reachability request for unknown service name %@", buf, 0xCu);

    }
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend(v19, "service", v38);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "supportsCapability:", *MEMORY[0x1E0D38E88]);

  v24 = IMOSLoggingEnabled(v23);
  if ((v22 & 1) == 0)
  {
    if (!v24)
      goto LABEL_16;
    OSLogHandleForIMFoundationCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v13, "serviceName");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v41 = v37;
      _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, "Dropping incoming reachability request for service %@ as it does not support relayed reachability", buf, 0xCu);

    }
    goto LABEL_15;
  }
  if (v24)
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v13, "serviceName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handles");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v41 = v26;
      v42 = 2112;
      v43 = v14;
      v44 = 2112;
      v45 = v27;
      _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Kicking off incoming reachability request for service %@ from token %@ for handles %@", buf, 0x20u);

    }
  }
  v28 = objc_alloc(MEMORY[0x1E0D39A48]);
  objc_msgSend(v13, "handles");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "serviceName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "accountID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "context");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v28, "initWithHandleIDs:requestID:serviceName:accountID:context:", v29, v16, v30, v31, v32);

  v34 = -[_IMDRelayingServiceReachabilityResponseHandler initWithRequestID:pushToken:fromIdentifier:toIdentifier:]([_IMDRelayingServiceReachabilityResponseHandler alloc], "initWithRequestID:pushToken:fromIdentifier:toIdentifier:", v16, v14, v39, v15);
  objc_msgSend(v19, "calculateReachabilityWithRequest:responseHandler:", v33, v34);

LABEL_16:
}

- (void)_handleReachabilityResult:(id)a3 messageID:(id)a4 fromToken:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v8 = a4;
  v9 = a5;
  -[IMDRelayServiceReachabilityController pendingRequests](self, "pendingRequests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (v9)
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      objc_msgSend(v11, "sentToDevices");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v30;
        while (2)
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v30 != v15)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v16), "pushToken", v26);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqualToData:", v9);

            if ((v18 & 1) != 0)
            {

              goto LABEL_20;
            }
            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v14)
            continue;
          break;
        }
      }

      if (IMOSLoggingEnabled(v19))
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v9;
          _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Dropping incoming reachability result from unexpected push token %@", buf, 0xCu);
        }

      }
    }
    else
    {
LABEL_20:
      if (IMOSLoggingEnabled(v12))
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v34 = v8;
          v35 = 2112;
          v36 = v26;
          _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Handling reachability result for request ID %@ result %@", buf, 0x16u);
        }

      }
      if (objc_msgSend(v26, "isFinal", v26))
      {
        -[IMDRelayServiceReachabilityController pendingRequests](self, "pendingRequests");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "removeObjectForKey:", v8);

        -[IMDRelayServiceReachabilityController signaturesToRequestIDs](self, "signaturesToRequestIDs");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "removeObjectForKey:", v8);

      }
      objc_msgSend(v11, "setLastResult:", v26);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLastUpdateTime:", v25);

      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = sub_1D15F2AC0;
      v27[3] = &unk_1E922F740;
      v28 = v26;
      objc_msgSend(v11, "enumerateResponseHandlersWithBlock:", v27);
      -[IMDRelayServiceReachabilityController _stopCleanupTimerIfNeeded](self, "_stopCleanupTimerIfNeeded");

    }
  }
  else if (IMOSLoggingEnabled(v12))
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v8;
      _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Dropping incoming reachability result for untracked request ID %@", buf, 0xCu);
    }

  }
}

- (void)handler:(id)a3 incomingReachabilityResponse:(id)a4 fromToken:(id)a5 messageGUID:(id)a6
{
  id v9;
  id v10;
  id v11;

  v9 = a6;
  v10 = a5;
  objc_msgSend(a4, "result");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDRelayServiceReachabilityController _handleReachabilityResult:messageID:fromToken:](self, "_handleReachabilityResult:messageID:fromToken:", v11, v9, v10);

}

- (NSTimer)cleanupTimer
{
  return self->_cleanupTimer;
}

- (void)setCleanupTimer:(id)a3
{
  objc_storeStrong((id *)&self->_cleanupTimer, a3);
}

- (NSMutableDictionary)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setPendingRequests:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequests, a3);
}

- (NSMutableDictionary)signaturesToRequestIDs
{
  return self->_signaturesToRequestIDs;
}

- (void)setSignaturesToRequestIDs:(id)a3
{
  objc_storeStrong((id *)&self->_signaturesToRequestIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signaturesToRequestIDs, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_cleanupTimer, 0);
}

- (void)_startCleanupTimerIfNeeded
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[IMDRelayServiceReachabilityController pendingRequests](self, "pendingRequests");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    -[IMDRelayServiceReachabilityController cleanupTimer](self, "cleanupTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      IMLogHandleForCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        sub_1D166D0C4(v4, v5, v6, v7, v8, v9, v10, v11);

      objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__timeoutPendingRequests, 0, 1, 60.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDRelayServiceReachabilityController setCleanupTimer:](self, "setCleanupTimer:", v12);

      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDRelayServiceReachabilityController cleanupTimer](self, "cleanupTimer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addTimer:forMode:", v14, *MEMORY[0x1E0C99860]);

    }
  }
  else
  {

  }
}

- (void)_stopCleanupTimerIfNeeded
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  -[IMDRelayServiceReachabilityController pendingRequests](self, "pendingRequests");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {

  }
  else
  {
    -[IMDRelayServiceReachabilityController cleanupTimer](self, "cleanupTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      IMLogHandleForCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        sub_1D166D0F8(v4, v5, v6, v7, v8, v9, v10, v11);

      -[IMDRelayServiceReachabilityController cleanupTimer](self, "cleanupTimer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "invalidate");

      -[IMDRelayServiceReachabilityController setCleanupTimer:](self, "setCleanupTimer:", 0);
    }
  }
}

- (void)_timeoutPendingRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "createIncompleteFinalResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "requestID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Timing out pending reachability request with ID %@", (uint8_t *)&v9, 0xCu);

    }
  }
  objc_msgSend(v4, "requestID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDRelayServiceReachabilityController _handleReachabilityResult:messageID:fromToken:](self, "_handleReachabilityResult:messageID:fromToken:", v5, v8, 0);

}

- (id)_expiredRequests
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  double v10;
  _BOOL4 v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[IMDRelayServiceReachabilityController pendingRequests](self, "pendingRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v8, "lastUpdateTime");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceNow");
        v11 = v10 >= 0.0;
        objc_msgSend(v8, "lastUpdateTime");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceNow");
        v14 = v13;

        if (!v11)
        {
          if (v14 >= -60.0)
            continue;
LABEL_10:
          objc_msgSend(v20, "addObject:", v8);
          continue;
        }
        if (v14 > 60.0)
          goto LABEL_10;
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v5);
  }

  v15 = objc_msgSend(v20, "count");
  if (v15 && IMOSLoggingEnabled(v15))
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = objc_msgSend(v20, "count");
      *(_DWORD *)buf = 134217984;
      v26 = v17;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Found %ld expired reachability requests", buf, 0xCu);
    }

  }
  v18 = (void *)objc_msgSend(v20, "copy");

  return v18;
}

- (void)_timeoutPendingRequests
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[IMDRelayServiceReachabilityController _expiredRequests](self, "_expiredRequests", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[IMDRelayServiceReachabilityController _timeoutPendingRequest:](self, "_timeoutPendingRequest:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

@end
