@implementation _SFAuthenticationContext

- (_SFAuthenticationContext)init
{
  _SFAuthenticationContext *v2;
  uint64_t v3;
  NSHashTable *clients;
  uint64_t v5;
  NSMutableOrderedSet *clientsAwaitingAuthentication;
  uint64_t v7;
  NSMapTable *clientsAwaitingAuthenticationToCompletionBlocks;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  _SFAuthenticationContext *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)_SFAuthenticationContext;
  v2 = -[_SFAuthenticationContext init](&v21, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    clients = v2->_clients;
    v2->_clients = (NSHashTable *)v3;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v5 = objc_claimAutoreleasedReturnValue();
    clientsAwaitingAuthentication = v2->_clientsAwaitingAuthentication;
    v2->_clientsAwaitingAuthentication = (NSMutableOrderedSet *)v5;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    clientsAwaitingAuthenticationToCompletionBlocks = v2->_clientsAwaitingAuthenticationToCompletionBlocks;
    v2->_clientsAwaitingAuthenticationToCompletionBlocks = (NSMapTable *)v7;

    v2->_authenticationGracePeriod = 160.0;
    v9 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __32___SFAuthenticationContext_init__block_invoke;
    v18 = &unk_1E4AC5910;
    objc_copyWeak(&v19, &location);
    notify_register_dispatch("com.apple.springboard.lockstate", &v2->_notificationToken, v9, &v15);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v15, v16, v17, v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel_applicationDidEnterBackground, *MEMORY[0x1E0DC4768], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel_applicationWillEnterForeground, *MEMORY[0x1E0DC4860], 0);

    v13 = v2;
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  int notificationToken;
  objc_super v4;

  notificationToken = self->_notificationToken;
  if (notificationToken)
    notify_cancel(notificationToken);
  v4.receiver = self;
  v4.super_class = (Class)_SFAuthenticationContext;
  -[_SFAuthenticationContext dealloc](&v4, sel_dealloc);
}

- (LAContext)authenticatedContext
{
  if (self->_successfullyAuthenticated)
    return self->_context;
  else
    return (LAContext *)0;
}

- (id)_authenticationContext
{
  LAContext *context;
  LAContext *v4;
  LAContext *v5;

  context = self->_context;
  if (!context)
  {
    v4 = (LAContext *)objc_alloc_init(MEMORY[0x1E0CC12A0]);
    v5 = self->_context;
    self->_context = v4;

    context = self->_context;
  }
  return context;
}

- (BOOL)_monotonicTimeIsWithinAuthenticationGracePeriod:(double)a3
{
  double v5;
  timespec v7;

  v7.tv_sec = 0;
  v7.tv_nsec = 0;
  clock_gettime(_CLOCK_MONOTONIC, &v7);
  v5 = (double)v7.tv_nsec / 1000000000.0 + (double)v7.tv_sec - a3;
  return v5 >= 0.0 && v5 < self->_authenticationGracePeriod;
}

- (BOOL)_hasAuthenticationCapability:(id *)a3
{
  void *v4;

  -[_SFAuthenticationContext _authenticationContext](self, "_authenticationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "canEvaluatePolicy:error:", 2, a3);

  return (char)a3;
}

- (BOOL)needsAuthentication
{
  if (!self->_successfullyAuthenticated)
    return 1;
  if (-[NSHashTable count](self->_clients, "count"))
    return 0;
  return !-[_SFAuthenticationContext _monotonicTimeIsWithinAuthenticationGracePeriod:](self, "_monotonicTimeIsWithinAuthenticationGracePeriod:", self->_lastAuthenticatedSessionEndTime);
}

- (BOOL)_contextRequiresSessionBasedAuthentication
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "contextRequiresSessionBasedAuthentication:", self);
  else
    v4 = 1;

  return v4;
}

- (BOOL)_contextShouldAllowPasscodeFallback
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "contextShouldAllowPasscodeFallback:", self);
  else
    v4 = 1;

  return v4;
}

- (BOOL)_contextShouldAllowMultipleBiometricFailures
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "contextShouldAllowMultipleBiometricFailures:", self);
  else
    v4 = 1;

  return v4;
}

- (void)_processNextClientAwaitingAuthenticationUserInitiated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (-[NSMutableOrderedSet count](self->_clientsAwaitingAuthentication, "count"))
  {
    -[NSMutableOrderedSet firstObject](self->_clientsAwaitingAuthentication, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet removeObjectAtIndex:](self->_clientsAwaitingAuthentication, "removeObjectAtIndex:", 0);
    -[NSMapTable objectForKey:](self->_clientsAwaitingAuthenticationToCompletionBlocks, "objectForKey:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable removeObjectForKey:](self->_clientsAwaitingAuthenticationToCompletionBlocks, "removeObjectForKey:", v6);
    -[_SFAuthenticationContext authenticateForClient:userInitiated:completion:](self, "authenticateForClient:userInitiated:completion:", v6, v3, v5);

  }
}

- (void)authenticateForClient:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, BOOL, _QWORD);
  BOOL v10;
  id v11;
  void *v12;
  NSMapTable *clientsAwaitingAuthenticationToCompletionBlocks;
  void *v14;
  uint64_t v15;
  void *v16;
  LAContext *context;
  uint64_t v18;
  id v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  void (**v26)(id, BOOL, _QWORD);
  BOOL v27;
  id v28;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, BOOL, _QWORD))a5;
  v28 = 0;
  v10 = -[_SFAuthenticationContext _hasAuthenticationCapability:](self, "_hasAuthenticationCapability:", &v28);
  v11 = v28;
  v12 = v11;
  if (!v10)
  {
    v15 = objc_msgSend(v11, "code");
    if (v15 == -5)
      v16 = 0;
    else
      v16 = v12;
    ((void (**)(id, BOOL, void *))v9)[2](v9, v15 == -5, v16);
LABEL_12:
    -[_SFAuthenticationContext _processNextClientAwaitingAuthenticationUserInitiated:](self, "_processNextClientAwaitingAuthenticationUserInitiated:", v6);
    goto LABEL_13;
  }
  if (!-[_SFAuthenticationContext needsAuthentication](self, "needsAuthentication"))
  {
    if (-[_SFAuthenticationContext _contextRequiresSessionBasedAuthentication](self, "_contextRequiresSessionBasedAuthentication"))
    {
      -[NSHashTable addObject:](self->_clients, "addObject:", v8);
    }
    v9[2](v9, 1, 0);
    goto LABEL_12;
  }
  if (self->_currentClientBeingAuthenticated)
  {
    -[NSMutableOrderedSet addObject:](self->_clientsAwaitingAuthentication, "addObject:", v8);
    clientsAwaitingAuthenticationToCompletionBlocks = self->_clientsAwaitingAuthenticationToCompletionBlocks;
    v14 = (void *)MEMORY[0x1A8598C40](v9);
    -[NSMapTable setObject:forKey:](clientsAwaitingAuthenticationToCompletionBlocks, "setObject:forKey:", v14, v8);

  }
  else
  {
    *(_WORD *)&self->_successfullyAuthenticated = 0;
    self->_ongoingAuthenticationCanceled = 0;
    self->_lastAuthenticatedSessionStartTime = 1.79769313e308;
    context = self->_context;
    self->_context = 0;

    v18 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __75___SFAuthenticationContext_authenticateForClient_userInitiated_completion___block_invoke;
    v24[3] = &unk_1E4AC5938;
    v24[4] = self;
    v19 = v8;
    v25 = v19;
    v26 = v9;
    v27 = v6;
    v20 = (void *)MEMORY[0x1A8598C40](v24);
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__8;
    v22[4] = __Block_byref_object_dispose__8;
    v23 = (id)MEMORY[0x1A8598C40]();
    v21[0] = v18;
    v21[1] = 3221225472;
    v21[2] = __75___SFAuthenticationContext_authenticateForClient_userInitiated_completion___block_invoke_23;
    v21[3] = &unk_1E4AC5988;
    v21[4] = v22;
    -[_SFAuthenticationContext _evaluatePolicyForClient:userInitiated:reply:](self, "_evaluatePolicyForClient:userInitiated:reply:", v19, v6, v21);
    _Block_object_dispose(v22, 8);

  }
LABEL_13:

}

- (void)_evaluatePolicyForClient:(id)a3 userInitiated:(BOOL)a4 reply:(id)a5
{
  _BOOL4 v6;
  id v9;
  void *v10;
  __CFString *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  _QWORD v31[5];
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v6 = a4;
  v9 = a3;
  v29 = a5;
  objc_storeStrong((id *)&self->_currentClientBeingAuthenticated, a3);
  -[_SFAuthenticationContext _authenticationContext](self, "_authenticationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "authenticationMessageForContext:", self);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(MEMORY[0x1E0D8A8F8], "isDTOMitigationEnabled");
  v13 = -[_SFAuthenticationContext _contextShouldAllowPasscodeFallback](self, "_contextShouldAllowPasscodeFallback") | v6;
  if ((_DWORD)v13)
    v14 = 2;
  else
    v14 = 4;
  if (v12)
    v14 = WBSAuthenticationPolicyForPasswordManager();
  objc_msgSend(v9, "authenticationCustomUIProgressObserverForContext:", self, v29);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v10, "setUiDelegate:", self);
    *(_WORD *)&self->_matchFound = 0;
    self->_numberOfBiometricAuthenticationFailures = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C9AA70];
    objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA70], &unk_1E4B25E88);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, &unk_1E4B25EA0);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, &unk_1E4B25EB8);
    objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1E4B25ED0, &unk_1E4B25E58);
    objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1E4B275B0, &unk_1E4B25EE8);
    if (v11)
      v19 = v11;
    else
      v19 = &stru_1E4AC8470;
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, &unk_1E4B25E28);
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, &unk_1E4B25DE0);

    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedInfoDictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("CFBundleDisplayName"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, &unk_1E4B25F00);
    }
    else
    {
      _WBSLocalizedString();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v26, &unk_1E4B25F00);

    }
    v27 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke_50;
    v32[3] = &unk_1E4AC5A28;
    v32[4] = self;
    v33 = v30;
    v28 = (void *)MEMORY[0x1A8598C40](v32);
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__8;
    v39 = __Block_byref_object_dispose__8;
    v40 = (id)MEMORY[0x1A8598C40]();
    v31[0] = v27;
    v31[1] = 3221225472;
    v31[2] = __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke_3;
    v31[3] = &unk_1E4AC59D8;
    v31[4] = &v35;
    objc_msgSend(v10, "evaluatePolicy:options:reply:", v14, v18, v31);
    _Block_object_dispose(&v35, 8);

  }
  else
  {
    objc_msgSend(v10, "setUiDelegate:", 0);
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    if ((v12 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v24, &unk_1E4B25DE0);

    }
    if (objc_msgSend(v9, "displayMessageAsTitleForContext:", self))
    {
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, &unk_1E4B25DF8);
      objc_msgSend(v9, "passcodePromptForContext:", self);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, &unk_1E4B25E10);

    }
    else
    {
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, &unk_1E4B25E28);
    }
    if (!-[_SFAuthenticationContext _contextShouldAllowMultipleBiometricFailures](self, "_contextShouldAllowMultipleBiometricFailures")&& !v6)
    {
      objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E4B25E40, &unk_1E4B25E58);
    }
    if (!v6)
      objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], &unk_1E4B25E70);
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__8;
    v39 = __Block_byref_object_dispose__8;
    v40 = (id)MEMORY[0x1A8598C40](v30);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke;
    v34[3] = &unk_1E4AC59D8;
    v34[4] = &v35;
    objc_msgSend(v10, "evaluatePolicy:options:reply:", v14, v16, v34);
    _Block_object_dispose(&v35, 8);

  }
}

- (void)preemptOngoingAuthenticationWithPasccodeAuthentication
{
  void *v3;
  _QWORD v4[5];

  if (self->_currentClientBeingAuthenticated)
  {
    -[_SFAuthenticationContext _authenticationContext](self, "_authenticationContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __82___SFAuthenticationContext_preemptOngoingAuthenticationWithPasccodeAuthentication__block_invoke;
    v4[3] = &unk_1E4AC3AF0;
    v4[4] = self;
    objc_msgSend(v3, "failProcessedEvent:failureError:reply:", 1, 0, v4);

  }
}

- (void)invalidateClient:(id)a3
{
  _SFAuthenticationClient *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  timespec v6;

  v4 = (_SFAuthenticationClient *)a3;
  if (-[NSMutableOrderedSet containsObject:](self->_clientsAwaitingAuthentication, "containsObject:", v4))
  {
    -[NSMapTable objectForKey:](self->_clientsAwaitingAuthenticationToCompletionBlocks, "objectForKey:", v4);
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet removeObject:](self->_clientsAwaitingAuthentication, "removeObject:", v4);
    -[NSMapTable removeObjectForKey:](self->_clientsAwaitingAuthenticationToCompletionBlocks, "removeObjectForKey:", v4);
    if (v5)
      v5[2](v5, 0, 0);

  }
  else if (self->_currentClientBeingAuthenticated == v4)
  {
    -[_SFAuthenticationContext _cancelOngoingAuthentication](self, "_cancelOngoingAuthentication");
  }
  else if (-[NSHashTable containsObject:](self->_clients, "containsObject:", v4))
  {
    -[NSHashTable removeObject:](self->_clients, "removeObject:", v4);
    if (!-[NSHashTable count](self->_clients, "count"))
    {
      v6.tv_sec = 0;
      v6.tv_nsec = 0;
      clock_gettime(_CLOCK_MONOTONIC, &v6);
      self->_lastAuthenticatedSessionEndTime = (double)v6.tv_nsec / 1000000000.0 + (double)v6.tv_sec;
    }
  }

}

- (void)applicationDidEnterBackground
{
  timespec v3;

  v3.tv_sec = 0;
  v3.tv_nsec = 0;
  clock_gettime(_CLOCK_MONOTONIC, &v3);
  self->_lastApplicationBackgroundTime = (double)v3.tv_nsec / 1000000000.0 + (double)v3.tv_sec;
}

- (void)applicationWillEnterForeground
{
  double v3;
  double lastApplicationBackgroundTime;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "invalidationTimeoutIfApplicationEntersBackgroundDuringAuthenticationForContext:", self);
  else
    v3 = 2.22507386e-308;
  if (self->_currentClientBeingAuthenticated
    || (lastApplicationBackgroundTime = self->_lastApplicationBackgroundTime, lastApplicationBackgroundTime != 0.0)
    && v3 >= 0.0
    && (v3 = v3 + self->_lastAuthenticatedSessionStartTime, v3 > lastApplicationBackgroundTime)
    || lastApplicationBackgroundTime != 0.0
    && !-[_SFAuthenticationContext _monotonicTimeIsWithinAuthenticationGracePeriod:](self, "_monotonicTimeIsWithinAuthenticationGracePeriod:", self->_lastApplicationBackgroundTime))
  {
    -[_SFAuthenticationContext _invalidateAuthentication](self, "_invalidateAuthentication", v3);
  }

}

- (BOOL)_canInvalidateAuthentication
{
  if (self->_currentClientBeingAuthenticated
    || self->_successfullyAuthenticated
    || -[NSHashTable count](self->_clients, "count")
    || -[NSMutableOrderedSet count](self->_clientsAwaitingAuthentication, "count"))
  {
    return 1;
  }
  else
  {
    return !-[_SFAuthenticationContext _contextRequiresSessionBasedAuthentication](self, "_contextRequiresSessionBasedAuthentication");
  }
}

- (void)_invalidateAuthentication
{
  id v3;

  if (-[_SFAuthenticationContext _hasAuthenticationCapability:](self, "_hasAuthenticationCapability:", 0))
  {
    if (-[_SFAuthenticationContext _canInvalidateAuthentication](self, "_canInvalidateAuthentication"))
    {
      self->_authenticationInvalidated = 1;
      -[_SFAuthenticationContext _cancelOngoingAndPendingAuthentications](self, "_cancelOngoingAndPendingAuthentications");
      self->_successfullyAuthenticated = 0;
      self->_lastApplicationBackgroundTime = 0.0;
      -[NSHashTable removeAllObjects](self->_clients, "removeAllObjects");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "postNotificationName:object:", CFSTR("AuthenticationContextDidInvalidateNotification"), self);

    }
  }
}

- (void)_cancelOngoingAndPendingAuthentications
{
  NSMutableOrderedSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_clientsAwaitingAuthentication;
  v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        -[NSMapTable objectForKey:](self->_clientsAwaitingAuthenticationToCompletionBlocks, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), (_QWORD)v10);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        if (v8)
          (*(void (**)(uint64_t, _QWORD, _QWORD))(v8 + 16))(v8, 0, 0);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[NSMutableOrderedSet removeAllObjects](self->_clientsAwaitingAuthentication, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_clientsAwaitingAuthenticationToCompletionBlocks, "removeAllObjects");
  -[_SFAuthenticationContext _cancelOngoingAuthentication](self, "_cancelOngoingAuthentication");
}

- (void)_cancelOngoingAuthentication
{
  void *v3;
  LAContext *context;
  id v5;

  self->_ongoingAuthenticationCanceled = 1;
  -[_SFAuthenticationClient authenticationCustomUIProgressObserverForContext:](self->_currentClientBeingAuthenticated, "authenticationCustomUIProgressObserverForContext:", self);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "authenticationDidCancel:completion:", self, 0);
  -[_SFAuthenticationContext _authenticationContext](self, "_authenticationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  context = self->_context;
  self->_context = 0;

}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v7 = a4;
  v8 = v7;
  if (a3 == 1)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47___SFAuthenticationContext_event_params_reply___block_invoke;
    v9[3] = &unk_1E4ABFB20;
    v9[4] = self;
    v10 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
}

- (void)_handleTouchIDEventWithParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;

  v4 = a3;
  if (!self->_matchFound)
  {
    v11 = v4;
    -[_SFAuthenticationClient authenticationCustomUIProgressObserverForContext:](self->_currentClientBeingAuthenticated, "authenticationCustomUIProgressObserverForContext:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E4B25E88);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && (objc_msgSend(v6, "BOOLValue") & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "authenticationDidFallbackToPasscode:", self);
    objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E4B25F18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      switch(objc_msgSend(v8, "integerValue"))
      {
        case 0:
          if (self->_fingerDetectRequired && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v5, "authenticationDidEncounterFingerOn:", self);
          break;
        case 1:
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v5, "authenticationDidEncounterFingerOff:", self);
          break;
        case 2:
          self->_matchFound = 1;
          self->_numberOfBiometricAuthenticationFailures = 0;
          break;
        case 3:
          self->_matchFound = 0;
          v10 = self->_numberOfBiometricAuthenticationFailures + 1;
          self->_numberOfBiometricAuthenticationFailures = v10;
          if (v10 == 2 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v5, "authenticationShowOptionForPasscodeFallback:", self);
          break;
        case 4:
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v5, "authenticationDidEncounterMatchMiss:completion:", self, 0);
          break;
        case 5:
          self->_fingerDetectRequired = 1;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v5, "authenticationDidBeginFingerDetection:", self);
          break;
        default:
          break;
      }
    }

    v4 = v11;
  }

}

- (NSData)externalizedContext
{
  return (NSData *)-[LAContext externalizedContext](self->_context, "externalizedContext");
}

- (_SFAuthenticationContextDelegate)delegate
{
  return (_SFAuthenticationContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientsAwaitingAuthenticationToCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_clientsAwaitingAuthentication, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_currentClientBeingAuthenticated, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
