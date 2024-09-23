@implementation NSPFlowDivert

- (NSPFlowDivert)initWithDelegate:(id)a3 providerClass:(Class)a4 configuration:(id)a5
{
  id v9;
  NSPFlowDivert *v10;
  NSPFlowDivert *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)NSPFlowDivert;
  v10 = -[NEAppProxyProviderContainer initWithDelegate:providerClass:](&v13, sel_initWithDelegate_providerClass_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_configuration, a5);

  return v11;
}

- (void)startWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  _BOOL4 v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  objc_super v17;
  uint8_t buf[4];
  NSPFlowDivert *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = -[NSPFlowDivert started](self, "started");
  nplog_obj();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      v19 = self;
      _os_log_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_INFO, "%@ NSPFlowDivert is already started, ignoring start request", buf, 0xCu);
    }

  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412546;
      v19 = self;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_INFO, "%@: NSPFlowDivert starting with options: %@", buf, 0x16u);
    }

    -[NSPFlowDivert setStarted:](self, "setStarted:", 1);
    -[NSPFlowDivert flowDivertControlHandle](self, "flowDivertControlHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      -[NSPFlowDivert createFlowDivertSocketHandle](self, "createFlowDivertSocketHandle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSPFlowDivert setFlowDivertControlHandle:](self, "setFlowDivertControlHandle:", v12);

    }
    -[NSPFlowDivert flowDivertControlHandle](self, "flowDivertControlHandle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[NSPFlowDivert flowDivertControlHandle](self, "flowDivertControlHandle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17.receiver = self;
      v17.super_class = (Class)NSPFlowDivert;
      -[NEAppProxyProviderContainer setInitialFlowDivertControlSocket:](&v17, sel_setInitialFlowDivertControlSocket_, v15);

      v16.receiver = self;
      v16.super_class = (Class)NSPFlowDivert;
      -[NEAppProxyProviderContainer startWithOptions:completionHandler:](&v16, sel_startWithOptions_completionHandler_, v6, v7);
      goto LABEL_13;
    }
  }
  if (v7)
    v7[2](v7, 0);
LABEL_13:

}

- (void)stop
{
  objc_super v3;

  -[NSPFlowDivert setStarted:](self, "setStarted:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NSPFlowDivert;
  -[NEAppProxyProviderContainer stop](&v3, sel_stop);
}

- (id)createFlowDivertSocketHandle
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  int v7;
  NSPFlowDivert *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  nplog_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl(&dword_19E8FE000, v3, OS_LOG_TYPE_DEFAULT, "%@ Creating a new flow divert control socket", (uint8_t *)&v7, 0xCu);
  }

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD0808]), "initFlowDivertControlSocketDisableAppMap:", 1);
  if (!v4)
  {
    nplog_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_error_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_ERROR, "%@: NSPFlowDivert: Failed to create a flow divert control socket", (uint8_t *)&v7, 0xCu);
    }

  }
  -[NSPFlowDivert setShouldResetPolicies:](self, "setShouldResetPolicies:", 0);
  return v4;
}

- (void)destroyFlowDivertSocketHandles
{
  -[NSPFlowDivert setFlowDivertControlHandle:](self, "setFlowDivertControlHandle:", 0);
}

- (id)createPolicySession
{
  NSObject *v3;
  id v4;
  void *v5;
  uint8_t v7[16];

  nplog_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19E8FE000, v3, OS_LOG_TYPE_DEFAULT, "Creating a new policy session", v7, 2u);
  }

  v4 = objc_alloc_init(MEMORY[0x1E0CD0860]);
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setPriority:", 100);
  -[NSPFlowDivert setShouldResetPolicies:](self, "setShouldResetPolicies:", 1);
  return v5;
}

- (void)destroyPolicySession
{
  -[NSPFlowDivert setPolicySession:](self, "setPolicySession:", 0);
}

- (void)addPolicy:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSPFlowDivert *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    nplog_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v4;
      _os_log_debug_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEBUG, "%@: NSPFlowDivert: Adding policy: %@", (uint8_t *)&v9, 0x16u);
    }

  }
  -[NSPFlowDivert policySession](self, "policySession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addPolicy:", v4);

}

- (id)getAgentResults:(id)a3
{
  return 0;
}

- (id)getAgentResultsForSelf
{
  return 0;
}

- (id)getExecutableConditions:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "matchEffectiveApplications");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v3, "matchEffectiveApplications"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v5,
        v7))
  {
    v8 = objc_msgSend(v3, "copyMatchEffectiveApplicationConditions");
  }
  else
  {
    v8 = objc_msgSend(v3, "copyExecutableConditions");
  }
  v9 = (void *)v8;

  return v9;
}

- (id)getEffectiveAppRules:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "matchEffectiveApplications");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v3, "matchEffectiveApplications"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v5,
        v7))
  {
    objc_msgSend(v3, "matchEffectiveApplications");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (void)addPoliciesForDivertDNSOnly:(id)a3 domainConditions:(id)a4 divertResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CD0848], "allInterfaces");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD0848], "ipProtocol:", 17);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v8)
  {
    if (!v9)
      goto LABEL_14;
  }
  else
  {
    v29[0] = v11;
    v29[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
LABEL_14:
      v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CD0840]), "initWithOrder:result:conditions:", 481, v10, v8);
      -[NSPFlowDivert addPolicy:](self, "addPolicy:", v14);
      goto LABEL_15;
    }
  }
  if (!objc_msgSend(v9, "count"))
    goto LABEL_14;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v9;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v16 = v15;
    v22 = v13;
    v23 = v9;
    v17 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = (void *)objc_msgSend(v8, "mutableCopy");
        objc_msgSend(v20, "addObject:", v19);
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD0840]), "initWithOrder:result:conditions:", 481, v10, v20);
        -[NSPFlowDivert addPolicy:](self, "addPolicy:", v21);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v16);
    v9 = v23;
    v13 = v22;
  }
LABEL_15:

}

- (void)addPoliciesForAgent:(id)a3 conditions:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[NSPFlowDivert getAgentResults:](self, "getAgentResults:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD0840]), "initWithOrder:result:conditions:", 480, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), v6);
        -[NSPFlowDivert addPolicy:](self, "addPolicy:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (BOOL)resetPolicies:(BOOL)a3
{
  return 0;
}

- (void)didStartWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int v10;
  NSPFlowDivert *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
LABEL_3:

      -[NSPFlowDivert teardown](self, "teardown");
      goto LABEL_9;
    }
    v10 = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v4;
    v7 = "%@: flow divert provider failed to start with error: %@";
    v8 = v6;
    v9 = 22;
LABEL_13:
    _os_log_error_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v10, v9);
    goto LABEL_3;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = self;
    _os_log_impl(&dword_19E8FE000, v6, OS_LOG_TYPE_INFO, "%@: flow divert provider started successfully", (uint8_t *)&v10, 0xCu);
  }

  if (-[NSPFlowDivert shouldResetPolicies](self, "shouldResetPolicies"))
  {
    if (-[NSPFlowDivert resetPolicies:](self, "resetPolicies:", 1))
    {
      -[NSPFlowDivert setShouldResetPolicies:](self, "setShouldResetPolicies:", 0);
      goto LABEL_9;
    }
    nplog_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    v10 = 138412290;
    v11 = self;
    v7 = "%@: NSPFlowDivert: resetPolicies failed";
    v8 = v6;
    v9 = 12;
    goto LABEL_13;
  }
LABEL_9:

}

- (void)didFailWithError:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  NSPFlowDivert *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412546;
    v7 = self;
    v8 = 2112;
    v9 = v4;
    _os_log_error_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_ERROR, "%@: didFailWithError called with: %@", (uint8_t *)&v6, 0x16u);
  }

  -[NSPFlowDivert teardown](self, "teardown");
}

- (BOOL)shouldResetPolicies
{
  return self->_shouldResetPolicies;
}

- (void)setShouldResetPolicies:(BOOL)a3
{
  self->_shouldResetPolicies = a3;
}

- (NSPConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (NEFlowDivertFileHandle)flowDivertControlHandle
{
  return self->_flowDivertControlHandle;
}

- (void)setFlowDivertControlHandle:(id)a3
{
  objc_storeStrong((id *)&self->_flowDivertControlHandle, a3);
}

- (NEPolicySession)policySession
{
  return (NEPolicySession *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPolicySession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policySession, 0);
  objc_storeStrong((id *)&self->_flowDivertControlHandle, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
