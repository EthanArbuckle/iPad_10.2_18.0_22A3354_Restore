@implementation CRKTransportPreflightOperation

- (CRKTransportPreflightOperation)initWithTransport:(id)a3 session:(id)a4
{
  id v7;
  id v8;
  CRKTransportPreflightOperation *v9;
  CRKTransportPreflightOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKTransportPreflightOperation;
  v9 = -[CRKTransportPreflightOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transport, a3);
    objc_storeWeak((id *)&v10->_session, v8);
  }

  return v10;
}

- (NSDictionary)stateDictionary
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("transport");
  -[CRKTransportPreflightOperation transport](self, "transport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (void)cancel
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__CRKTransportPreflightOperation_cancel__block_invoke;
  block[3] = &unk_24D9C7020;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __40__CRKTransportPreflightOperation_cancel__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "phase") != 3
    && (objc_msgSend(*(id *)(a1 + 32), "cancellationRequested") & 1) == 0)
  {
    _CRKLogSession_0();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "session");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "session");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "endpoint");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "transport");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v3;
      v12 = 2114;
      v13 = v6;
      v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_218C99000, v2, OS_LOG_TYPE_INFO, "SESSION:%{public}@. IP:%{public}@. Transport preflight cancellation requested for transport %{public}@", (uint8_t *)&v10, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setCancellationRequested:", 1);
    objc_msgSend(*(id *)(a1 + 32), "transport");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(*(id *)(a1 + 32), "invalidateTransport");
  }
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__CRKTransportPreflightOperation_main__block_invoke;
  block[3] = &unk_24D9C7020;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __38__CRKTransportPreflightOperation_main__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "transport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDelegatesOnTransport:", v3);

  v4 = objc_msgSend(*(id *)(a1 + 32), "cancellationRequested");
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "invalidateTransport");
  }
  else
  {
    objc_msgSend(v5, "transport");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resume");

  }
}

- (void)setDelegatesOnTransport:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "setDelegate:", self);
  v7 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v7;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "setRemoteTransportDelegate:", self);
}

- (void)clearDelegatesOnTransport:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "setDelegate:", 0);
  v6 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v6;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "setRemoteTransportDelegate:", 0);
}

- (BOOL)errorIndicatesThatInterruptionWasCausedByDecisionHandler:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CRKTransportPreflightOperation isInsecureConnectionError:](self, "isInsecureConnectionError:", v5);

  return (char)self;
}

- (BOOL)isInsecureConnectionError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE2C4A8]))
    v5 = objc_msgSend(v3, "code") == 106;
  else
    v5 = 0;

  return v5;
}

- (void)invalidateTransport
{
  id v3;

  -[CRKTransportPreflightOperation setInvalidationTriggered:](self, "setInvalidationTriggered:", 1);
  -[CRKTransportPreflightOperation transport](self, "transport");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

}

- (void)finishWithTransport:(id)a3
{
  id v4;
  CRKTransportPreflightResultObject *v5;

  v4 = a3;
  -[CRKTransportPreflightOperation clearDelegatesOnTransport:](self, "clearDelegatesOnTransport:", v4);
  objc_msgSend(v4, "suspend");
  v5 = -[CRKTransportPreflightResultObject initWithTransport:shouldResetBackoff:]([CRKTransportPreflightResultObject alloc], "initWithTransport:shouldResetBackoff:", v4, 0);

  -[CRKTransportPreflightOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v5);
}

- (void)finishWithShouldResetBackoff:(BOOL)a3
{
  CRKTransportPreflightResultObject *v4;

  v4 = -[CRKTransportPreflightResultObject initWithTransport:shouldResetBackoff:]([CRKTransportPreflightResultObject alloc], "initWithTransport:shouldResetBackoff:", 0, a3);
  -[CRKTransportPreflightOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v4);

}

- (void)transportDidConnect:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (-[CRKTransportPreflightOperation isExecuting](self, "isExecuting")
    && !-[CRKTransportPreflightOperation invalidationTriggered](self, "invalidationTriggered"))
  {
    if (-[CRKTransportPreflightOperation isCommonNamePrefixValidForTransport:](self, "isCommonNamePrefixValidForTransport:", v4))
    {
      -[CRKTransportPreflightOperation finishWithTransport:](self, "finishWithTransport:", v4);
    }
    else
    {
      _CRKLogSession_0();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[CRKTransportPreflightOperation transportDidConnect:].cold.1(self, (uint64_t)v4, v5);

      -[CRKTransportPreflightOperation invalidateTransport](self, "invalidateTransport");
    }
  }

}

- (void)transport:(id)a3 didInterruptWithError:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  if (-[CRKTransportPreflightOperation isExecuting](self, "isExecuting")
    && !-[CRKTransportPreflightOperation invalidationTriggered](self, "invalidationTriggered"))
  {
    _CRKLogSession_0();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CRKTransportPreflightOperation transport:didInterruptWithError:].cold.1(self, v5, v6);

    -[CRKTransportPreflightOperation setConnectionInterruptedDueToDecisionHandler:](self, "setConnectionInterruptedDueToDecisionHandler:", -[CRKTransportPreflightOperation errorIndicatesThatInterruptionWasCausedByDecisionHandler:](self, "errorIndicatesThatInterruptionWasCausedByDecisionHandler:", v5));
    -[CRKTransportPreflightOperation invalidateTransport](self, "invalidateTransport");
  }

}

- (void)transportDidInvalidate:(id)a3
{
  _BOOL8 v4;
  id v5;

  if (-[CRKTransportPreflightOperation isExecuting](self, "isExecuting", a3))
  {
    if (-[CRKTransportPreflightOperation cancellationRequested](self, "cancellationRequested"))
    {
      CATErrorWithCodeAndUserInfo();
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[CRKTransportPreflightOperation endOperationWithError:](self, "endOperationWithError:", v5);

    }
    else
    {
      if (-[CRKTransportPreflightOperation decisionHandlerWantsBackoffReset](self, "decisionHandlerWantsBackoffReset"))
        v4 = -[CRKTransportPreflightOperation connectionInterruptedDueToDecisionHandler](self, "connectionInterruptedDueToDecisionHandler");
      else
        v4 = 0;
      -[CRKTransportPreflightOperation finishWithShouldResetBackoff:](self, "finishWithShouldResetBackoff:", v4);
    }
  }
}

- (void)transport:(id)a3 encounteredTrustDecisionWhileTryingToSecure:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14[2];
  id location;

  v7 = a3;
  v8 = a4;
  if (-[CRKTransportPreflightOperation isExecuting](self, "isExecuting")
    && !-[CRKTransportPreflightOperation invalidationTriggered](self, "invalidationTriggered"))
  {
    -[CRKTransportPreflightOperation ASMUserIdentifierFromTrustDecision:](self, "ASMUserIdentifierFromTrustDecision:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKTransportPreflightOperation session](self, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __88__CRKTransportPreflightOperation_transport_encounteredTrustDecisionWhileTryingToSecure___block_invoke;
    v12[3] = &unk_24D9C9CB0;
    v14[1] = (id)a2;
    v12[4] = self;
    objc_copyWeak(v14, &location);
    v13 = v8;
    objc_msgSend(v11, "session:encounteredUntrustedConnectionForASMInstructorIdentifier:decisionHandler:", v10, v9, v12);

    objc_destroyWeak(v14);
    objc_destroyWeak(&location);

  }
}

void __88__CRKTransportPreflightOperation_transport_encounteredTrustDecisionWhileTryingToSecure___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(const char **)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", v5, v6, CFSTR("CRKTransportPreflightOperation.m"), 230, CFSTR("%@ must be called from the main thread"), v7);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "isExecuting")
    && (objc_msgSend(WeakRetained, "invalidationTriggered") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "handleContinuationDecision:forTrustDecision:", a2, *(_QWORD *)(a1 + 40));
  }

}

- (id)ASMUserIdentifierFromTrustDecision:(id)a3
{
  id v3;
  CRKConcreteTrust *v4;
  void *v5;
  CRKConcreteTrust *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = [CRKConcreteTrust alloc];
  objc_msgSend(v3, "trust");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CRKConcreteTrust initWithTrust:](v4, "initWithTrust:", v5);
  -[CRKConcreteTrust leafCertificate](v6, "leafCertificate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKASMCertificateUserIdentifierExtractor userIdentifierFromCertificate:](CRKASMCertificateUserIdentifierExtractor, "userIdentifierFromCertificate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)handleContinuationDecision:(unint64_t)a3 forTrustDecision:(id)a4
{
  id v6;
  NSObject *v7;
  CRKTransportPreflightOperation *v8;
  id v9;
  uint64_t v10;

  v6 = a4;
  if (a3 == 2)
  {
    v8 = self;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    if (a3 == 1)
    {
      -[CRKTransportPreflightOperation setDecisionHandlerWantsBackoffReset:](self, "setDecisionHandlerWantsBackoffReset:", 1);
    }
    else if (a3)
    {
      _CRKLogSession_0();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CRKTransportPreflightOperation handleContinuationDecision:forTrustDecision:].cold.1(self, a3, v7);

    }
    v8 = self;
    v9 = v6;
    v10 = 0;
  }
  -[CRKTransportPreflightOperation respondToTrustDecision:withAllowUntrustedConnections:](v8, "respondToTrustDecision:withAllowUntrustedConnections:", v9, v10);

}

- (void)respondToTrustDecision:(id)a3 withAllowUntrustedConnections:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  CRKConcreteTrust *v8;
  void *v9;
  CRKConcreteTrust *v10;
  NSObject *v11;

  v4 = a4;
  v6 = a3;
  _CRKLogSession_0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[CRKTransportPreflightOperation respondToTrustDecision:withAllowUntrustedConnections:].cold.2(self, v4, v7);

  v8 = [CRKConcreteTrust alloc];
  objc_msgSend(v6, "trust");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CRKConcreteTrust initWithTrust:](v8, "initWithTrust:", v9);

  _CRKLogSession_0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[CRKTransportPreflightOperation respondToTrustDecision:withAllowUntrustedConnections:].cold.1(self, v10, v11);

  objc_msgSend(v6, "respondWithDecisionToAllowUntrustedConnection:", v4);
}

- (BOOL)isCommonNamePrefixValidForTransport:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[CRKTransportPreflightOperation isCommonNamePrefixValidForRemoteTransport:](self, "isCommonNamePrefixValidForRemoteTransport:", v4);
  }
  else
  {
    _CRKLogSession_0();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[CRKTransportPreflightOperation session](self, "session");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKTransportPreflightOperation session](self, "session");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "endpoint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v7;
      v14 = 2114;
      v15 = v10;
      v16 = 2114;
      v17 = v4;
      _os_log_impl(&dword_218C99000, v6, OS_LOG_TYPE_INFO, "SESSION:%{public}@. IP:%{public}@. Not validating common name prefix of certificate because transport %{public}@ is not remote", (uint8_t *)&v12, 0x20u);

    }
    v5 = 1;
  }

  return v5;
}

- (BOOL)isCommonNamePrefixValidForRemoteTransport:(id)a3
{
  id v4;
  CRKConcreteTrust *v5;
  uint64_t v6;
  CRKConcreteTrust *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  v5 = [CRKConcreteTrust alloc];
  v6 = objc_msgSend(v4, "peerTrust");

  v7 = -[CRKConcreteTrust initWithTrust:](v5, "initWithTrust:", v6);
  -[CRKConcreteTrust leafCertificate](v7, "leafCertificate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _CRKLogSession_0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[CRKTransportPreflightOperation isCommonNamePrefixValidForRemoteTransport:].cold.1(self, v8, v9);

  objc_msgSend(v8, "commonNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CRKTransportPreflightOperation anyCommonNameInArrayHasLeaderPrefix:](self, "anyCommonNameInArrayHasLeaderPrefix:", v10);

  return v11;
}

- (BOOL)anyCommonNameInArrayHasLeaderPrefix:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (-[CRKTransportPreflightOperation commonNameHasLeaderPrefix:](self, "commonNameHasLeaderPrefix:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)commonNameHasLeaderPrefix:(id)a3
{
  return objc_msgSend(a3, "crk_hasCaseInsensitivePrefix:", CFSTR("leader"));
}

- (CRKSession)session
{
  return (CRKSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (CATTransport)transport
{
  return self->_transport;
}

- (BOOL)decisionHandlerWantsBackoffReset
{
  return self->_decisionHandlerWantsBackoffReset;
}

- (void)setDecisionHandlerWantsBackoffReset:(BOOL)a3
{
  self->_decisionHandlerWantsBackoffReset = a3;
}

- (BOOL)connectionInterruptedDueToDecisionHandler
{
  return self->_connectionInterruptedDueToDecisionHandler;
}

- (void)setConnectionInterruptedDueToDecisionHandler:(BOOL)a3
{
  self->_connectionInterruptedDueToDecisionHandler = a3;
}

- (BOOL)invalidationTriggered
{
  return self->_invalidationTriggered;
}

- (void)setInvalidationTriggered:(BOOL)a3
{
  self->_invalidationTriggered = a3;
}

- (BOOL)cancellationRequested
{
  return self->_cancellationRequested;
}

- (void)setCancellationRequested:(BOOL)a3
{
  self->_cancellationRequested = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
  objc_destroyWeak((id *)&self->_session);
}

- (void)transportDidConnect:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint8_t v12[22];
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  v13 = v10;
  v14 = a2;
  OUTLINED_FUNCTION_2_2(&dword_218C99000, a3, v11, "SESSION:%{public}@. IP:%{public}@. Invaliding transport %{public}@ because its common name prefix is invalid", v12);

  OUTLINED_FUNCTION_0_7();
}

- (void)transport:(NSObject *)a3 didInterruptWithError:.cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "verboseDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 138544130;
  v15 = v6;
  v16 = 2114;
  v17 = v9;
  v18 = 2114;
  v19 = v12;
  v20 = 2114;
  v21 = v13;
  _os_log_error_impl(&dword_218C99000, a3, OS_LOG_TYPE_ERROR, "SESSION:%{public}@. IP:%{public}@. Error connecting to %{public}@: %{public}@", (uint8_t *)&v14, 0x2Au);

}

- (void)handleContinuationDecision:(NSObject *)a3 forTrustDecision:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint8_t v11[22];
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  v12 = 2048;
  v13 = a2;
  OUTLINED_FUNCTION_2_2(&dword_218C99000, a3, v10, "SESSION:%{public}@. IP:%{public}@. Invalid CRKSessionContinuationDecision: %lu", v11);

  OUTLINED_FUNCTION_0_7();
}

- (void)respondToTrustDecision:(NSObject *)a3 withAllowUntrustedConnections:.cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint8_t v13[40];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "leafCertificate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fingerprint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_2(&dword_218C99000, a3, v12, "SESSION:%{public}@. IP:%{public}@. Fingerprint %{public}@", v13);

}

- (void)respondToTrustDecision:(NSObject *)a3 withAllowUntrustedConnections:.cold.2(void *a1, char a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  uint8_t v13[40];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("NO");
  if ((a2 & 1) != 0)
    v10 = CFSTR("YES");
  v11 = v10;
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_2(&dword_218C99000, a3, v12, "SESSION:%{public}@. IP:%{public}@. Responding to user trust decision with: %{public}@", v13);

  OUTLINED_FUNCTION_0_7();
}

- (void)isCommonNamePrefixValidForRemoteTransport:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint8_t v12[40];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "fingerprint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_2(&dword_218C99000, a3, v11, "SESSION:%{public}@. IP:%{public}@. Fingerprint %{public}@", v12);

  OUTLINED_FUNCTION_0_7();
}

@end
