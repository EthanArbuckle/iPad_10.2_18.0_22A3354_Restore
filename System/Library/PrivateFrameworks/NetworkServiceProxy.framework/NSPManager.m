@implementation NSPManager

+ (id)sharedManager
{
  if (qword_1ED062BD8 != -1)
    dispatch_once(&qword_1ED062BD8, &__block_literal_global_13);
  return (id)qword_1ED062BD0;
}

void __27__NSPManager_sharedManager__block_invoke()
{
  NSPManager *v0;
  void *v1;

  v0 = objc_alloc_init(NSPManager);
  v1 = (void *)qword_1ED062BD0;
  qword_1ED062BD0 = (uint64_t)v0;

  _MergedGlobals_37 = 0;
}

- (NSPManager)init
{
  NSPManager *v2;
  uint64_t v3;
  NWPathEvaluator *pathEvaluator;
  id v5;
  uint64_t v6;
  NWPathEvaluator *policyEvaluator;
  NSMutableDictionary *v8;
  NSMutableDictionary *fallbackCounts;
  uint64_t v10;
  NSString *signingIdentifier;
  uint64_t v12;
  NSMutableArray *knownFlows;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NSPManager;
  v2 = -[NSPManager init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CCECB0], "sharedDefaultEvaluator");
    v3 = objc_claimAutoreleasedReturnValue();
    pathEvaluator = v2->_pathEvaluator;
    v2->_pathEvaluator = (NWPathEvaluator *)v3;

    v5 = objc_alloc_init(MEMORY[0x1E0CCECA0]);
    objc_msgSend(v5, "setAccount:", CFSTR("com.apple.NetworkServiceProxy"));
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CCECB0]), "initWithEndpoint:parameters:", 0, v5);
    policyEvaluator = v2->_policyEvaluator;
    v2->_policyEvaluator = (NWPathEvaluator *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    fallbackCounts = v2->_fallbackCounts;
    v2->_fallbackCounts = v8;

    getSigningIdentifier();
    v10 = objc_claimAutoreleasedReturnValue();
    signingIdentifier = v2->_signingIdentifier;
    v2->_signingIdentifier = (NSString *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 11);
    knownFlows = v2->_knownFlows;
    v2->_knownFlows = (NSMutableArray *)v12;

    v2->lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)waitForTunnelsToCancelWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  id pendingCancellationHandler;
  NSObject *v8;
  unsigned int tunnelCount;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(&self->lock);
  if (self->_tunnelCount)
  {
    nplog_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      tunnelCount = self->_tunnelCount;
      v10[0] = 67109120;
      v10[1] = tunnelCount;
      _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "Waiting for %u tunnels to close", (uint8_t *)v10, 8u);
    }

    v6 = (void *)MEMORY[0x1A1AEA9EC](v4);
    pendingCancellationHandler = self->_pendingCancellationHandler;
    self->_pendingCancellationHandler = v6;

    os_unfair_lock_unlock(&self->lock);
  }
  else
  {
    os_unfair_lock_unlock(&self->lock);
    if (v4)
    {
      nplog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v10[0]) = 0;
        _os_log_debug_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEBUG, "No open tunnels, not waiting", (uint8_t *)v10, 2u);
      }

      v4[2](v4);
    }
  }

}

- (void)stopWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  os_unfair_lock_lock(&self->lock);
  if (self->_isObserving)
  {
    self->_isObserving = 0;
    -[NWPathEvaluator removeObserver:forKeyPath:context:](self->_pathEvaluator, "removeObserver:forKeyPath:context:", self, CFSTR("path"), self);
  }
  os_unfair_lock_unlock(&self->lock);
  objc_storeWeak((id *)&self->_delegate, 0);
  -[NSPManager setMatchingAppRule:](self, "setMatchingAppRule:", 0);
  -[NSPManager setConfiguration:](self, "setConfiguration:", 0);
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }

}

- (void)handlePolicyUpdate
{
  NSPManager *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  NSObject *v12;
  NPKeyBag *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NPKeyBag *v28;
  void *v29;
  NPKeyBag *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSPFlowDivert *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSPManager *v54;
  _QWORD v55[5];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  void *v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v2 = self;
  v68 = *MEMORY[0x1E0C80C00];
  -[NWPathEvaluator path](self->_policyEvaluator, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "networkAgentsOfType:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSArray count](v2->_currentAgents, "count") && objc_msgSend(v4, "count"))
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v61;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v61 != v9)
            objc_enumerationMutation(v6);
          v11 = *(id *)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && !-[NSArray containsObject:](v2->_currentAgents, "containsObject:", v11))
          {

            goto LABEL_16;
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
        if (v8)
          continue;
        break;
      }
    }

    nplog_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19E8FE000, v12, OS_LOG_TYPE_DEBUG, "All agents matched, not updating from new agents", buf, 2u);
    }
    v13 = 0;
    v14 = 0;
    v15 = 0;
    goto LABEL_65;
  }
LABEL_16:
  objc_storeStrong((id *)&v2->_currentAgents, v4);
  if (objc_msgSend(v4, "count"))
  {
    v54 = v2;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v53 = v4;
    v16 = v4;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    if (v17)
    {
      v18 = v17;
      v13 = 0;
      v15 = 0;
      v19 = *(_QWORD *)v57;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v57 != v19)
            objc_enumerationMutation(v16);
          v21 = *(id *)(*((_QWORD *)&v56 + 1) + 8 * v20);
          objc_msgSend(v21, "parseAgentData");
          objc_msgSend(v21, "appRule");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            nplog_obj();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v21, "agentUUID");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v65 = v31;
              _os_log_debug_impl(&dword_19E8FE000, v23, OS_LOG_TYPE_DEBUG, "Got config agent with UUID %@", buf, 0xCu);

            }
            objc_msgSend(v21, "appRule");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v24);

            objc_msgSend(v21, "configuration");
            v25 = objc_claimAutoreleasedReturnValue();

            v15 = (void *)v25;
          }
          else
          {
            objc_msgSend(v21, "keybag");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              nplog_obj();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v21, "agentUUID");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v65 = v32;
                _os_log_debug_impl(&dword_19E8FE000, v27, OS_LOG_TYPE_DEBUG, "Got keybag agent with UUID %@", buf, 0xCu);

              }
              v28 = [NPKeyBag alloc];
              objc_msgSend(v21, "keybag");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = -[NPKeyBag initWithData:](v28, "initWithData:", v29);

              if (v30)
              {
                -[NPKeyBag createOnRamps](v30, "createOnRamps");
                -[NPKeyBag logWithMessage:identifier:](v30, "logWithMessage:identifier:", CFSTR("Got a new keybag from the kernel"), &stru_1E4138CF8);
                -[NSPManager setKeybag:](v54, "setKeybag:", v30);
                v13 = v30;
              }
              else
              {
                v13 = 0;
              }
            }
          }

          ++v20;
        }
        while (v18 != v20);
        v33 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
        v18 = v33;
      }
      while (v33);
    }
    else
    {
      v13 = 0;
      v15 = 0;
    }

    v4 = v53;
    v2 = v54;
  }
  else
  {
    v13 = 0;
    v15 = 0;
  }
  objc_msgSend(v15, "setAppRules:", v5);
  -[NSPManager setConfiguration:](v2, "setConfiguration:", v15);
  -[NSPManager createAppRuleMapWithRules:](v2, "createAppRuleMapWithRules:", v5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPManager setAppRules:](v2, "setAppRules:", v34);

  -[NSPManager appRules](v2, "appRules");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", v2->_signingIdentifier);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSPManager matchingAppRule](v2, "matchingAppRule");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15 || !v14)
  {
    if (!v36)
      goto LABEL_61;
    -[NSPManager flowDivert](v2, "flowDivert");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v39)
    {
      -[NSPManager stopWithCompletionHandler:](v2, "stopWithCompletionHandler:", &__block_literal_global_20);
      goto LABEL_61;
    }
    -[NSPManager flowDivert](v2, "flowDivert");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stop");
    goto LABEL_60;
  }
  if (v36)
  {
    -[NSPManager matchingAppRule](v2, "matchingAppRule");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isEqual:", v14) ^ 1;

  }
  else
  {
    v38 = 1;
  }
  -[NSPManager setMatchingAppRule:](v2, "setMatchingAppRule:", v14);
  os_unfair_lock_lock(&v2->lock);
  if (!v2->_isObserving)
  {
    -[NWPathEvaluator addObserver:forKeyPath:options:context:](v2->_pathEvaluator, "addObserver:forKeyPath:options:context:", v2, CFSTR("path"), 0, v2);
    v2->_isObserving = 1;
  }
  os_unfair_lock_unlock(&v2->lock);
  +[NPTunnel initializeProtocol](NPTunnel, "initializeProtocol");
  +[NPDirectFlow initializeProtocol](NPDirectFlow, "initializeProtocol");
  objc_msgSend(v14, "useLocalFlowDivert");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "BOOLValue");

  if (v42)
  {
    -[NSPManager flowDivert](v2, "flowDivert");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v43)
    {
      nplog_obj();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v14, "matchSigningIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v65 = v45;
        _os_log_impl(&dword_19E8FE000, v44, OS_LOG_TYPE_INFO, "Setting up local flow divert for %@", buf, 0xCu);

      }
      v46 = -[NSPFlowDivert initWithDelegate:providerClass:configuration:]([NSPFlowDivert alloc], "initWithDelegate:providerClass:configuration:", v2, objc_opt_class(), v15);
      -[NSPManager setFlowDivert:](v2, "setFlowDivert:", v46);

    }
    -[NSPManager flowDivert](v2, "flowDivert");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      -[NSPManager configuration](v2, "configuration");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSPManager flowDivert](v2, "flowDivert");
      v49 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v49, "setConfiguration:", v48);

      -[NSPManager flowDivert](v2, "flowDivert");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v49) = objc_msgSend(v50, "started");

      if ((v49 & 1) != 0)
      {
        if (!v38)
          goto LABEL_61;
        -[NSPManager flowDivert](v2, "flowDivert");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setShouldResetPolicies:", 1);

        -[NSPManager flowDivert](v2, "flowDivert");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "resetPolicies:", 1);
      }
      else
      {
        -[NSPManager flowDivert](v2, "flowDivert");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __32__NSPManager_handlePolicyUpdate__block_invoke;
        v55[3] = &unk_1E4138008;
        v55[4] = v2;
        objc_msgSend(v40, "startWithOptions:completionHandler:", MEMORY[0x1E0C9AA70], v55);
      }
LABEL_60:

    }
  }
LABEL_61:
  -[NSPManager changeHandler](v2, "changeHandler");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    -[NSPManager changeHandler](v2, "changeHandler");
    v12 = objc_claimAutoreleasedReturnValue();
    if (qword_1ED062BE8 != -1)
      dispatch_once(&qword_1ED062BE8, &__block_literal_global_21);
    dispatch_async((dispatch_queue_t)qword_1ED062BE0, v12);
LABEL_65:

  }
}

void __32__NSPManager_handlePolicyUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  nplog_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_error_impl(&dword_19E8FE000, v4, OS_LOG_TYPE_ERROR, "NSP flow divert stopped (%@)", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "flowDivert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "teardown");

}

void __32__NSPManager_handlePolicyUpdate__block_invoke_2()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("NSPManager change handler queue", 0);
  v1 = (void *)qword_1ED062BE0;
  qword_1ED062BE0 = (uint64_t)v0;

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  objc_super v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(v10, "isEqualToString:", CFSTR("path"));
  if (a6 == self && v13)
  {
    if (*((id *)a6 + 3) == v11)
    {
      os_unfair_lock_lock((os_unfair_lock_t)a6 + 2);
      objc_msgSend(*((id *)a6 + 15), "removeAllObjects");
      os_unfair_lock_unlock((os_unfair_lock_t)a6 + 2);
    }
    else if (*((id *)a6 + 8) == v11)
    {
      objc_msgSend(a6, "handlePolicyUpdate");
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)NSPManager;
    -[NSPManager observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)start
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __19__NSPManager_start__block_invoke;
  block[3] = &unk_1E4137410;
  block[4] = self;
  if (start_onceToken != -1)
    dispatch_once(&start_onceToken, block);
}

uint64_t __19__NSPManager_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("path"), 4, *(_QWORD *)(a1 + 32));
}

- (void)startWithConfiguration:(id)a3 appRules:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  -[NSPManager createAppRuleMapWithRules:](self, "createAppRuleMapWithRules:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPManager setAppRules:](self, "setAppRules:", v10);

  -[NSPManager setConfiguration:](self, "setConfiguration:", v9);
  objc_storeWeak((id *)&self->_delegate, v8);

  +[NPTunnel initializeProtocol](NPTunnel, "initializeProtocol");
  +[NPDirectFlow initializeProtocol](NPDirectFlow, "initializeProtocol");
}

- (id)instantiateFlowWithTunnel:(id)a3 inputProtocol:(nw_protocol *)a4
{
  id v6;
  NSString *v7;
  void (*v8)(nw_protocol *);
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  const void *bytes_ptr;
  void *v15;
  uint64_t effective_bundle_id;
  uint64_t v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  void *v28;
  _DWORD v29[2];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self->_signingIdentifier;
  v8 = (void (*)(nw_protocol *))*((_QWORD *)a4->callbacks + 14);
  if (v8)
  {
    v8(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = nw_parameters_copy_metadata();
      v11 = (void *)v10;
      if (v10 && MEMORY[0x1A1AEADA0](v10) == MEMORY[0x1E0C812E8])
      {
        v13 = objc_alloc(MEMORY[0x1E0C99D50]);
        bytes_ptr = xpc_data_get_bytes_ptr(v11);
        v15 = (void *)objc_msgSend(v13, "initWithBytesNoCopy:length:freeWhenDone:", bytes_ptr, xpc_data_get_length(v11), 0);
        createPropertiesFromMetaData(v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = 0;
      }
      effective_bundle_id = nw_parameters_get_effective_bundle_id();
      if (effective_bundle_id)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", effective_bundle_id);
        v17 = objc_claimAutoreleasedReturnValue();

        v7 = (NSString *)v17;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
  -[NSPManager appRules](self, "appRules");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    nplog_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
LABEL_25:

LABEL_26:
      v22 = 0;
      goto LABEL_27;
    }
    LOWORD(v29[0]) = 0;
    v26 = "Failed to find a matching app rule";
LABEL_32:
    _os_log_error_impl(&dword_19E8FE000, v25, OS_LOG_TYPE_ERROR, v26, (uint8_t *)v29, 2u);
    goto LABEL_25;
  }
  if (!v12)
  {
    nplog_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    LOWORD(v29[0]) = 0;
    v26 = "No flow properties available, failed to create a new flow";
    goto LABEL_32;
  }
  v20 = (objc_class *)objc_opt_class();
  if (objc_msgSend(v12, "dataMode") == 1)
  {
    objc_msgSend(v19, "label");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "isEqualToString:", CFSTR("dns"));

    v20 = (objc_class *)objc_opt_class();
  }
  v22 = (void *)objc_msgSend([v20 alloc], "initWithTunnel:appRule:inputProtocol:extraProperties:", v6, v19, a4, v12);
  nplog_obj();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v29[0]) = 0;
      _os_log_error_impl(&dword_19E8FE000, v24, OS_LOG_TYPE_ERROR, "Failed to create a new flow", (uint8_t *)v29, 2u);
    }

    goto LABEL_26;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v22, "extraFlowProperties");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = 67109120;
    v29[1] = objc_msgSend(v28, "flowIdentifier");
    _os_log_debug_impl(&dword_19E8FE000, v24, OS_LOG_TYPE_DEBUG, "Created new flow %u", (uint8_t *)v29, 8u);

  }
  if (objc_msgSend(v12, "isLoopback"))
  {
    objc_msgSend(v22, "setFallbackDisabled:", 1);
    objc_msgSend(v22, "setShouldComposeIntialData:", 0);
  }
LABEL_27:

  return v22;
}

- (id)instantiateTunnelWithEndpoint:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  const void *bytes_ptr;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t effective_bundle_id;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  __objc2_class **v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSString *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self->_signingIdentifier;
  if (g_recordTimestamps)
  {
    v9 = mach_absolute_time();
    if (v7)
      goto LABEL_3;
LABEL_7:
    v12 = 0;
    goto LABEL_10;
  }
  v9 = 0;
  if (!v7)
    goto LABEL_7;
LABEL_3:
  v10 = nw_parameters_copy_metadata();
  v11 = (void *)v10;
  if (v10 && MEMORY[0x1A1AEADA0](v10) == MEMORY[0x1E0C812E8])
  {
    v13 = objc_alloc(MEMORY[0x1E0C99D50]);
    bytes_ptr = xpc_data_get_bytes_ptr(v11);
    v15 = (void *)objc_msgSend(v13, "initWithBytesNoCopy:length:freeWhenDone:", bytes_ptr, xpc_data_get_length(v11), 0);
    createPropertiesFromMetaData(v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

LABEL_10:
  -[NSPManager matchingAppRule](self, "matchingAppRule");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
  }
  else
  {
    effective_bundle_id = nw_parameters_get_effective_bundle_id();
    if (effective_bundle_id)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", effective_bundle_id);
      v19 = objc_claimAutoreleasedReturnValue();

      v8 = (NSString *)v19;
    }
    -[NSPManager appRules](self, "appRules");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v25 = 0;
      goto LABEL_22;
    }
  }
  -[NSPManager inUseKeybag](self, "inUseKeybag");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "getOnRampForEndpoint:", v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v12, "isLoopback");
  v24 = off_1E41352B0;
  if (!v23)
    v24 = off_1E41352A0;
  v25 = (void *)objc_msgSend(objc_alloc(*v24), "initWithEndpoint:parameters:appRule:flowProperties:onRamp:delegate:", v6, v7, v17, v12, v22, self);
  if (v25)
  {
    os_unfair_lock_lock(&self->lock);
    ++self->_tunnelCount;
    os_unfair_lock_unlock(&self->lock);
    nplog_obj();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v25, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "dayPassUUID");
      v35 = v6;
      v28 = v8;
      v29 = v9;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v37 = v27;
      v38 = 2112;
      v39 = v30;
      _os_log_impl(&dword_19E8FE000, v26, OS_LOG_TYPE_DEFAULT, "Added tunnel %@ using key %@", buf, 0x16u);

      v9 = v29;
      v8 = v28;
      v6 = v35;

    }
  }

LABEL_22:
  v31 = objc_msgSend(v25, "timestamps");
  if (v31)
  {
    if (g_recordTimestamps)
    {
      v32 = v31;
      if (!*(_QWORD *)(v31 + 24))
      {
        if (!v9)
          v9 = mach_absolute_time();
        *(_QWORD *)(v32 + 24) = v9;
      }
    }
  }
  v33 = objc_msgSend(v25, "timestamps");
  if (v33 && g_recordTimestamps && !*(_QWORD *)(v33 + 32))
    *(_QWORD *)(v33 + 32) = mach_absolute_time();
  _MergedGlobals_37 = 1;

  return v25;
}

- (void)tunnelDidCancel:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int tunnelCount;
  NSObject *v12;
  NSObject *v13;
  void (**v14)(_QWORD);
  id pendingCancellationHandler;
  unsigned int v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v6;
    _os_log_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEFAULT, "Removed tunnel %@", (uint8_t *)&v17, 0xCu);

  }
  os_unfair_lock_lock(&self->lock);
  if (self->_currentTunnelEndpoint)
  {
    objc_msgSend(MEMORY[0x1E0CCEC78], "endpointWithCEndpoint:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CCEC78];
    objc_msgSend(v4, "endpoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endpointWithCEndpoint:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isEqual:", v10))
    {

      v7 = 0;
    }

  }
  tunnelCount = self->_tunnelCount;
  if (!tunnelCount)
    goto LABEL_11;
  self->_tunnelCount = tunnelCount - 1;
  nplog_obj();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v16 = self->_tunnelCount;
    v17 = 67109120;
    LODWORD(v18) = v16;
    _os_log_debug_impl(&dword_19E8FE000, v12, OS_LOG_TYPE_DEBUG, "Tunnel count is now %u", (uint8_t *)&v17, 8u);
  }

  if (!self->_tunnelCount && self->_pendingCancellationHandler)
  {
    nplog_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v17) = 0;
      _os_log_debug_impl(&dword_19E8FE000, v13, OS_LOG_TYPE_DEBUG, "All tunnels closed, calling cancellation handler", (uint8_t *)&v17, 2u);
    }

    v14 = (void (**)(_QWORD))MEMORY[0x1A1AEA9EC](self->_pendingCancellationHandler);
    pendingCancellationHandler = self->_pendingCancellationHandler;
    self->_pendingCancellationHandler = 0;

    os_unfair_lock_unlock(&self->lock);
    if (v14)
    {
      v14[2](v14);

    }
  }
  else
  {
LABEL_11:
    os_unfair_lock_unlock(&self->lock);
  }

}

- (void)tunnelDidConnect:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = a3;
  -[NSPManager tunnelConnectedHandler](self, "tunnelConnectedHandler");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[NSPManager setTunnelConnectedHandler:](self, "setTunnelConnectedHandler:", 0);
  if (v4)
    ((void (**)(_QWORD, id))v4)[2](v4, v5);

}

- (void)tunnelIsReady:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  OS_nw_endpoint *v7;
  OS_nw_endpoint *currentTunnelEndpoint;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEFAULT, "Tunnel %@ is ready", (uint8_t *)&v9, 0xCu);

  }
  os_unfair_lock_lock(&self->lock);
  if (!self->_currentTunnelEndpoint)
  {
    objc_msgSend(v4, "endpoint");
    v7 = (OS_nw_endpoint *)objc_claimAutoreleasedReturnValue();
    currentTunnelEndpoint = self->_currentTunnelEndpoint;
    self->_currentTunnelEndpoint = v7;

  }
  os_unfair_lock_unlock(&self->lock);

}

- (void)tunnel:(id)a3 flowDidFallbackWithReason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = a3;
  if ((unint64_t)(a4 - 2) < 4 || a4 == 13)
  {
    v12 = v6;
    objc_msgSend(v6, "appRule");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "matchSigningIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      os_unfair_lock_lock(&self->lock);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_fallbackCounts, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "unsignedIntegerValue");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10 + 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fallbackCounts, "setObject:forKeyedSubscript:", v11, v8);

      os_unfair_lock_unlock(&self->lock);
    }

    v6 = v12;
  }

}

- (BOOL)isFirstTunnel
{
  return (_MergedGlobals_37 & 1) == 0;
}

- (void)setConnectionInfo:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *flowInfoMap;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD);
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  flowInfoMap = self->_flowInfoMap;
  if (!flowInfoMap)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = self->_flowInfoMap;
    self->_flowInfoMap = v10;

    flowInfoMap = self->_flowInfoMap;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](flowInfoMap, "objectForKeyedSubscript:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (!objc_msgSend(v6, "fallbackReason"))
    {
      objc_msgSend(v6, "setFallbackReason:", objc_msgSend(v12, "fallbackReason"));
      objc_msgSend(v12, "fallbackDelay");
      objc_msgSend(v6, "setFallbackDelay:");
    }
    if ((objc_msgSend(v6, "TFOSucceeded") & 1) == 0)
      objc_msgSend(v6, "setTFOSucceeded:", objc_msgSend(v12, "TFOSucceeded"));
    if (!objc_msgSend(v6, "tunnelConnectionError"))
      objc_msgSend(v6, "setTunnelConnectionError:", objc_msgSend(v12, "tunnelConnectionError"));
    if ((objc_msgSend(v6, "isTFOProbeSucceeded") & 1) == 0)
      objc_msgSend(v6, "setIsTFOProbeSucceeded:", objc_msgSend(v12, "isTFOProbeSucceeded"));
  }
  else
  {
    -[NSMutableArray addObject:](self->_knownFlows, "addObject:", v7);
    if ((unint64_t)-[NSMutableArray count](self->_knownFlows, "count") >= 0xB)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_knownFlows, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](self->_flowInfoMap, "removeObjectForKey:", v13);
      -[NSMutableArray removeObjectAtIndex:](self->_knownFlows, "removeObjectAtIndex:", 0);

    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_flowInfoMap, "setObject:forKeyedSubscript:", v6, v7);
  if (objc_msgSend(v6, "pathType") == 2)
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v7, "unsignedLongLongValue");
      +[NSPConnectionInfo getFallbackReasonDescription:](NSPConnectionInfo, "getFallbackReasonDescription:", objc_msgSend(v6, "fallbackReason"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 134218242;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_DEFAULT, "Flow %llu fell back with reason: %@", (uint8_t *)&v19, 0x16u);

    }
  }
  -[NSPManager connectionInfoSetHandler](self, "connectionInfoSetHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[NSPManager connectionInfoSetHandler](self, "connectionInfoSetHandler");
    v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v18)[2](v18, v6);

  }
  os_unfair_lock_unlock(p_lock);

}

- (id)getConnectionInfoForIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  NPUsageReport *v7;
  void *v8;
  NPUsageReport *v9;

  p_lock = &self->lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_flowInfoMap, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  if (v6 && objc_msgSend(v6, "pathType") == 3)
  {
    objc_msgSend(v6, "setFallbackReason:", 2);
    objc_msgSend(v6, "setPathType:", 2);
    v7 = [NPUsageReport alloc];
    getSigningIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NPUsageReport initWithSigningIdentifier:fallbackReason:](v7, "initWithSigningIdentifier:fallbackReason:", v8, 2);

    -[NSPManager sendUsageReport:](self, "sendUsageReport:", v9);
  }
  return v6;
}

- (id)getAppRuleMatchingParameters:(id)a3 flowProperties:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSString *v9;
  uint64_t effective_bundle_id;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *account_id;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;

  v6 = a3;
  v7 = a4;
  -[NSPManager matchingAppRule](self, "matchingAppRule");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = self->_signingIdentifier;
    effective_bundle_id = nw_parameters_get_effective_bundle_id();
    if (effective_bundle_id)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", effective_bundle_id);
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = (NSString *)v11;
    }
    -[NSPManager appRules](self, "appRules");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v9);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_11;
  }
  objc_msgSend(v8, "matchAccountIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (!v14)
  {
    objc_msgSend(v8, "enableOptInPerTask");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "BOOLValue"))
    {
      v20 = objc_msgSend(v7, "enableNSP");

      if ((v20 & 1) == 0)
      {
LABEL_11:
        account_id = 0;
        goto LABEL_14;
      }
    }
    else
    {

    }
LABEL_13:
    v8 = v8;
    account_id = v8;
    goto LABEL_14;
  }
  account_id = (void *)nw_parameters_get_account_id();
  if (account_id)
  {
    objc_msgSend(v8, "matchAccountIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", account_id);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "containsObject:", v17);

    if ((v18 & 1) != 0)
      goto LABEL_13;
    goto LABEL_11;
  }
LABEL_14:

  return account_id;
}

- (id)createReplacementEndpointForEndpoint:(id)a3 properties:(id)a4
{
  NSObject *v5;
  id v6;
  NPTunnelTuscanyEndpoint *v7;
  NSObject *v8;
  uint64_t description;
  void *v10;
  uint64_t v11;
  const char *hostname;
  void *v13;
  void *v14;
  char *v15;
  char *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v31;
  NSObject *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "replacementEndpoint");
  v7 = (NPTunnelTuscanyEndpoint *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
LABEL_2:
    nplog_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      description = nw_endpoint_get_description();
      -[NPTunnelTuscanyEndpoint hosts](v7, "hosts");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v38 = description;
      v39 = 2112;
      v40 = v10;
      _os_log_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEFAULT, "Replaced endpoint %s with endpoints %@", buf, 0x16u);

    }
    goto LABEL_32;
  }
  objc_msgSend(v6, "replacementAddressMap");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v7 = 0;
    goto LABEL_33;
  }
  v8 = v11;
  hostname = nw_endpoint_get_hostname(v5);
  if (hostname)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", hostname);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  if (!objc_msgSend(v14, "count"))
  {
LABEL_31:

    v7 = 0;
LABEL_32:

    goto LABEL_33;
  }
  v15 = nw_endpoint_copy_port_string(v5);
  if (!v15)
  {
    nplog_obj();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v29, OS_LOG_TYPE_ERROR, "Failed to get the port string from the endpoint", buf, 2u);
    }

    goto LABEL_31;
  }
  v16 = v15;
  v31 = v8;
  v32 = v5;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v16, 4);
  free(v16);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v19 = v14;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CCEC80], "endpointWithHostname:port:", v24, v18);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_msgSend(v17, "addObject:", v25);
        }
        else
        {
          nplog_obj();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v38 = v24;
            v39 = 2112;
            v40 = v18;
            _os_log_error_impl(&dword_19E8FE000, v26, OS_LOG_TYPE_ERROR, "Failed to create a NWHostEndpoint from address %@ port %@", buf, 0x16u);
          }

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v21);
  }

  if (objc_msgSend(v17, "count"))
  {
    v7 = -[NPTunnelTuscanyEndpoint initWithHosts:]([NPTunnelTuscanyEndpoint alloc], "initWithHosts:", v17);
    v5 = v32;
    v27 = v31;
    if (!v7)
    {
      nplog_obj();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19E8FE000, v28, OS_LOG_TYPE_ERROR, "Failed to create a NPTunnelTuscanyEndpoint from endpoints", buf, 2u);
      }

      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
    v5 = v32;
    v27 = v31;
  }

  if (v7)
    goto LABEL_2;
LABEL_33:

  return v7;
}

- (id)createTransformsForEndpoint:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NPFlowProperties *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSPManager *v23;
  os_unfair_lock_s *p_lock;
  pid_t v25;
  unsigned int nextFlowID;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  int v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  nw_endpoint_t host;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  NSPManager *v44;
  id v45;
  const void *bytes_ptr;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  NSMutableDictionary *fallbackCounts;
  void *v55;
  void *v56;
  unint64_t v57;
  BOOL v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  unint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  int v79;
  void *v80;
  void *v81;
  char v82;
  NSObject *v83;
  NSPConnectionInfo *v84;
  void *v85;
  void *v86;
  NPUsageReport *v87;
  void *v88;
  NPUsageReport *v89;
  NSPConnectionInfo *v90;
  NSPManager *v91;
  NSPConnectionInfo *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  NPFlowProperties *v100;
  id v101;
  id v102;
  void *v103;
  NSPManager *v104;
  unsigned int v105;
  void *v106;
  uint64_t protocol_parameters;
  void *v108;
  void *v109;
  uint8_t buf[4];
  _DWORD v111[7];

  *(_QWORD *)&v111[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (g_recordTimestamps)
  {
    v9 = mach_absolute_time();
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v9 = 0;
    if (!v7)
    {
LABEL_8:
      v12 = objc_alloc_init(NPFlowProperties);
      goto LABEL_9;
    }
  }
  v10 = nw_parameters_copy_metadata();
  v11 = (void *)v10;
  if (!v10 || MEMORY[0x1A1AEADA0](v10) != MEMORY[0x1E0C812E8])
  {

    goto LABEL_8;
  }
  v45 = objc_alloc(MEMORY[0x1E0C99D50]);
  bytes_ptr = xpc_data_get_bytes_ptr(v11);
  v47 = (void *)objc_msgSend(v45, "initWithBytesNoCopy:length:freeWhenDone:", bytes_ptr, xpc_data_get_length(v11), 0);
  createPropertiesFromMetaData(v47);
  v12 = (NPFlowProperties *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_8;
LABEL_9:
  -[NSPManager createReplacementEndpointForEndpoint:properties:](self, "createReplacementEndpointForEndpoint:properties:", v6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = nw_protocol_transform_create();
    if (v14)
    {
      v15 = (void *)v14;
      v16 = (void *)nw_array_create();
      v17 = (void *)objc_msgSend(v13, "copyCEndpoint");
      nw_protocol_transform_replace_endpoint();

      nw_array_append();
      nw_parameters_set_transform_array();
      v18 = v16;
    }
    else
    {
      nplog_obj();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19E8FE000, v41, OS_LOG_TYPE_ERROR, "Failed to create a nw_protocol_transform", buf, 2u);
      }

      v15 = 0;
      v18 = 0;
    }
    goto LABEL_103;
  }
  v19 = -[NPFlowProperties timestamps](v12, "timestamps");
  if (v19)
  {
    if (g_recordTimestamps)
    {
      v20 = v19;
      if (!*(_QWORD *)(v19 + 8))
      {
        if (!v9)
          v9 = mach_absolute_time();
        *(_QWORD *)(v20 + 8) = v9;
      }
    }
  }
  -[NSPManager getAppRuleMatchingParameters:flowProperties:](self, "getAppRuleMatchingParameters:flowProperties:", v8, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v48 = 0;
    v49 = 0;
LABEL_102:
    v18 = v49;

    goto LABEL_103;
  }
  -[NSPManager configuration](self, "configuration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "getCurrentKeyBagForAppRule:", v15);
  v22 = objc_claimAutoreleasedReturnValue();

  v106 = (void *)v22;
  if (!v22)
  {
    -[NSPManager keybag](self, "keybag");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = self;
  p_lock = &self->lock;
  os_unfair_lock_lock(p_lock);
  v25 = getpid();
  nextFlowID = v23->_nextFlowID;
  v104 = v23;
  v23->_nextFlowID = nextFlowID + 1;
  v27 = nextFlowID + v25;
  os_unfair_lock_unlock(p_lock);
  v105 = v27;
  -[NPFlowProperties setFlowIdentifier:](v12, "setFlowIdentifier:", v27);
  nplog_obj();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v111[0] = v105;
    _os_log_impl(&dword_19E8FE000, v28, OS_LOG_TYPE_DEFAULT, "NSP setting up flow %u", buf, 8u);
  }

  objc_msgSend(v15, "matchSigningIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.nsputil"));

  v109 = v15;
  if (!v30 || (v31 = serviceNameToID(CFSTR("loopback")), v31 != -[NPFlowProperties serviceID](v12, "serviceID")))
  {
    if (-[NPFlowProperties serviceID](v12, "serviceID") == 0xCF65C8DD09564F74)
    {
      v42 = 0;
      v43 = 0;
      v44 = v104;
      goto LABEL_93;
    }
    objc_msgSend(v15, "disableFallback");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v50, "BOOLValue"))
    {

    }
    else
    {
      objc_msgSend(v15, "matchSigningIdentifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
      {
        objc_msgSend(v15, "fallbackCountBeforeImmediateFallback");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "unsignedIntegerValue");

        os_unfair_lock_lock(p_lock);
        if (v53)
        {
          fallbackCounts = v104->_fallbackCounts;
          objc_msgSend(v15, "matchSigningIdentifier");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](fallbackCounts, "objectForKeyedSubscript:", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v56, "unsignedIntegerValue");

          os_unfair_lock_unlock(p_lock);
          v58 = v53 > v57;
          v13 = 0;
          if (!v58)
          {
            nplog_obj();
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)v111 = v53;
              _os_log_impl(&dword_19E8FE000, v59, OS_LOG_TYPE_DEFAULT, "Fallback limit (%lu) exceeded, falling back", buf, 0xCu);
            }
            v42 = 0;
            v43 = 15;
            v44 = v104;
            goto LABEL_92;
          }
        }
        else
        {
          os_unfair_lock_unlock(p_lock);
        }
      }
    }
    if (v106)
    {
      os_unfair_lock_lock(p_lock);
      if (v104->_currentTunnelEndpoint)
      {
        objc_msgSend(v106, "getOnRampForEndpoint:");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (v60)
          v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v60, 0);
        else
          v42 = 0;

        os_unfair_lock_unlock(p_lock);
        if (v42)
          goto LABEL_58;
      }
      else
      {
        os_unfair_lock_unlock(p_lock);
      }
      objc_msgSend(v15, "requireTFO");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)objc_msgSend(v106, "copyUsableOnRamps:requireTFO:", 0, objc_msgSend(v61, "BOOLValue"));

    }
    else
    {
      v42 = 0;
    }
LABEL_58:
    v108 = v42;
    if (objc_msgSend(v42, "count"))
    {
      -[NPFlowProperties setDataMode:](v12, "setDataMode:", nw_parameters_get_data_mode());
      objc_msgSend(MEMORY[0x1E0CCEC78], "endpointWithCEndpoint:", v6);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPFlowProperties setDirectEndpoint:](v12, "setDirectEndpoint:", v62);

      nw_parameters_set_no_delay();
      if (!-[NPFlowProperties serviceID](v12, "serviceID"))
      {
        objc_msgSend(v15, "serviceID");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPFlowProperties setServiceID:](v12, "setServiceID:", objc_msgSend(v63, "unsignedLongLongValue"));

      }
      nplog_obj();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        v65 = -[NPFlowProperties serviceID](v12, "serviceID");
        *(_DWORD *)buf = 67109376;
        v111[0] = v105;
        LOWORD(v111[1]) = 2048;
        *(_QWORD *)((char *)&v111[1] + 2) = v65;
        _os_log_impl(&dword_19E8FE000, v64, OS_LOG_TYPE_DEFAULT, "Flow %u using service ID %llu", buf, 0x12u);
      }

      -[NPFlowProperties setDisableIdleTimeout:](v12, "setDisableIdleTimeout:", -[NSPManager disableIdleTimeout](v104, "disableIdleTimeout"));
      np_tunnel_protocol_get_id();
      protocol_parameters = nw_parameters_create_protocol_parameters();
      if (!objc_msgSend(v42, "count"))
      {
        v49 = 0;
LABEL_89:
        v84 = objc_alloc_init(NSPConnectionInfo);
        -[NSPConnectionInfo setPathType:](v84, "setPathType:", 3);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v105);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSPManager setConnectionInfo:forIdentifier:](v104, "setConnectionInfo:forIdentifier:", v84, v85);

        -[NSPManager setInUseKeybag:](v104, "setInUseKeybag:", v106);
        v86 = (void *)protocol_parameters;
        v42 = v108;
        goto LABEL_97;
      }
      v101 = v6;
      v103 = v13;
      v100 = v12;
      v49 = 0;
      v66 = 0;
      v67 = 0;
      while (1)
      {
        v68 = v8;
        v69 = v67;
        objc_msgSend(v42, "objectAtIndexedSubscript:", v66);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = (void *)nw_protocol_transform_create();
        objc_msgSend(v70, "tuscanyEndpoint");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "hosts");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "objectAtIndexedSubscript:", 0);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = (void *)objc_msgSend(v74, "copyCEndpoint");

        nw_protocol_transform_replace_endpoint();
        v75 = v109;
        objc_msgSend(v109, "enableTFO");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v76, "BOOLValue"))
          break;
        v77 = objc_msgSend(v70, "TFOStatus");

        v75 = v109;
        v8 = v68;
        if (v77 == 3)
          goto LABEL_70;
        nw_protocol_transform_set_tfo();
        objc_msgSend(v109, "enableNoTFOCookie");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend(v78, "BOOLValue");

        v75 = v109;
        if (v79)
          nw_protocol_transform_set_tfo_no_cookie();
LABEL_71:
        objc_msgSend(v75, "enableMultipath");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "BOOLValue");

        nw_protocol_transform_set_multipath_service();
        nw_protocol_transform_set_no_proxy();
        nw_protocol_transform_set_no_path_fallback();
        nw_protocol_transform_append_protocol();
        if (nw_parameters_get_tls())
        {
          nw_protocol_boringssl_identifier();
          nw_protocol_transform_disable_protocol();
        }
        v42 = v108;
        if (v66 >= objc_msgSend(v108, "count") - 1)
        {
          objc_msgSend(v109, "disableFallback");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = objc_msgSend(v81, "BOOLValue");

          if ((v82 & 1) != 0)
            nw_protocol_transform_set_prohibit_direct();
          else
            nw_protocol_transform_set_fallback_mode();
          v42 = v108;
          if (v49)
            goto LABEL_81;
LABEL_80:
          v49 = (void *)nw_array_create();
          goto LABEL_81;
        }
        nw_protocol_transform_set_fallback_mode();
        if (!v49)
          goto LABEL_80;
LABEL_81:
        nw_array_append();

        if (++v66 >= objc_msgSend(v42, "count"))
        {

          v12 = v100;
          v6 = v101;
          v13 = v103;
          goto LABEL_89;
        }
      }

      v8 = v68;
LABEL_70:
      nw_parameters_set_tfo();
      goto LABEL_71;
    }
    nplog_obj();
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v111[0] = v105;
      _os_log_impl(&dword_19E8FE000, v83, OS_LOG_TYPE_DEFAULT, "Flow %u no usable Day Pass available, falling back", buf, 8u);
    }

    if (v106)
    {
      v43 = objc_msgSend(v106, "fallbackReason");
      if (v43 == 24)
      {
        v44 = v104;
        goto LABEL_93;
      }
    }
    else
    {
      v43 = 14;
    }
    v87 = [NPUsageReport alloc];
    objc_msgSend(v15, "matchSigningIdentifier");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v87;
    v42 = v108;
    v59 = -[NPUsageReport initWithSigningIdentifier:fallbackReason:](v89, "initWithSigningIdentifier:fallbackReason:", v88, v43);

    v44 = v104;
    -[NSPManager sendUsageReport:](v104, "sendUsageReport:", v59);
LABEL_92:

LABEL_93:
    v90 = objc_alloc_init(NSPConnectionInfo);
    -[NSPConnectionInfo setPathType:](v90, "setPathType:", 2);
    -[NSPConnectionInfo setFallbackReason:](v90, "setFallbackReason:", v43);
    v91 = v44;
    -[NWPathEvaluator path](v44->_pathEvaluator, "path");
    v92 = (NSPConnectionInfo *)objc_claimAutoreleasedReturnValue();
    v84 = v92;
    if (v92)
    {
      -[NSPConnectionInfo interface](v92, "interface");
      v93 = (void *)objc_claimAutoreleasedReturnValue();

      if (v93)
      {
        -[NSPConnectionInfo interface](v84, "interface");
        v102 = v6;
        v94 = v42;
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSPConnectionInfo setInterfaceType:](v90, "setInterfaceType:", +[NPUtilities interfaceTypeOfNWInterface:](NPUtilities, "interfaceTypeOfNWInterface:", v95));

        v42 = v94;
        v6 = v102;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v105);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPManager setConnectionInfo:forIdentifier:](v91, "setConnectionInfo:forIdentifier:", v90, v96);

    v86 = v90;
    v49 = 0;
LABEL_97:

    v97 = -[NPFlowProperties timestamps](v12, "timestamps");
    if (v97 && g_recordTimestamps && !*(_QWORD *)(v97 + 16))
      *(_QWORD *)(v97 + 16) = mach_absolute_time();
    createMetadataFromProperties(v12);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)_CFXPCCreateXPCObjectFromCFObject();

    nw_parameters_set_metadata();
    v15 = v109;
    goto LABEL_102;
  }
  nplog_obj();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E8FE000, v32, OS_LOG_TYPE_DEFAULT, "Setting up loopback transform", buf, 2u);
  }

  -[NPFlowProperties setIsLoopback:](v12, "setIsLoopback:", 1);
  -[NPFlowProperties setDisableIdleTimeout:](v12, "setDisableIdleTimeout:", 1);
  np_tunnel_protocol_get_id();
  v33 = (void *)nw_parameters_create_protocol_parameters();
  np_loopback_protocol_get_id();
  v34 = (void *)nw_parameters_create_protocol_parameters();
  v35 = (void *)nw_protocol_transform_create();
  nw_protocol_transform_set_no_proxy();
  nw_protocol_transform_append_protocol();
  nw_protocol_transform_append_protocol();
  host = nw_endpoint_create_host("127.0.0.1", "5223");
  nw_protocol_transform_replace_endpoint();
  nw_protocol_transform_set_fallback_mode();
  nw_protocol_transform_set_prohibit_direct();
  v37 = (void *)nw_array_create();
  nw_array_append();
  v38 = -[NPFlowProperties timestamps](v12, "timestamps");
  if (v38 && g_recordTimestamps && !*(_QWORD *)(v38 + 16))
    *(_QWORD *)(v38 + 16) = mach_absolute_time();
  createMetadataFromProperties(v12);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  nw_parameters_set_metadata();
  v18 = v37;

  v13 = 0;
  v15 = v109;
LABEL_103:

  return v18;
}

- (void)sendUsageReport:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v4 = a3;
  -[NSPManager inUseKeybag](self, "inUseKeybag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NSPManager keybag](self, "keybag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setEdgeIndex:", objc_msgSend(v5, "index"));
  objc_msgSend(v4, "setKeybagGeneration:", objc_msgSend(v5, "generation"));
  if (+[NSPConnectionInfo shouldMoveToNextEdgeForFallbackReason:](NSPConnectionInfo, "shouldMoveToNextEdgeForFallbackReason:", objc_msgSend(v4, "fallbackReason")))
  {
    -[NSPManager inUseKeybag](self, "inUseKeybag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "moveToNextOnRamp");
  }
  else
  {
    if (objc_msgSend(v4, "fallbackReason"))
      goto LABEL_8;
    -[NSPManager inUseKeybag](self, "inUseKeybag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dayPassUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "moveToOnRamp:", v7);

  }
LABEL_8:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    objc_msgSend(v4, "signingIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "handleUsageReport:fromClient:", v4, v9);
  }
  else
  {
    nplog_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_INFO, "Sending usage data", buf, 2u);
    }

    getServerConnection();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v4, "signingIdentifier");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reportUsage:fromClient:", v4, v11);
    }
    else
    {
      nplog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_error_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_ERROR, "Failed to create the XPC connection to the server", v12, 2u);
      }
    }

  }
}

- (void)fetchStateForClient:(id)a3 withPeerEndpoint:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSPManagerDelegate **p_delegate;
  void (**v11)(id, void *, void *, void *);
  id WeakRetained;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  p_delegate = &self->_delegate;
  v11 = (void (**)(id, void *, void *, void *))a5;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v13 = WeakRetained;
  if (WeakRetained)
  {
    v18 = 0;
    v14 = (void *)objc_msgSend(WeakRetained, "copyStateForClient:withPeerEndpoint:outWaldoInfo:", v8, v9, &v18);
    v15 = v18;
    objc_msgSend(v15, "telemetryService");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "telemetryURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v11[2](v11, v14, v16, v17);
  }
  else
  {
    getServerConnection();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchStateForClient:withPeerEndpoint:completionHandler:", v8, v9, v11);

  }
}

- (BOOL)isEnabled
{
  void *v2;
  char v3;

  -[NWPathEvaluator path](self->_policyEvaluator, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesNetworkAgentType:", objc_opt_class());

  return v3;
}

- (BOOL)currentNetworkHasProxies
{
  void *v2;
  void *v3;
  BOOL v4;

  -[NWPathEvaluator path](self->_pathEvaluator, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proxySettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)createAppRuleMapWithRules:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v9, "matchSigningIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, v10);

        objc_msgSend(v9, "matchEffectiveApplications");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v12)
        {
          v24 = 0u;
          v25 = 0u;
          v22 = 0u;
          v23 = 0u;
          objc_msgSend(v9, "matchEffectiveApplications");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v23;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v23 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "matchSigningIdentifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, v18);

              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            }
            while (v15);
          }

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v6);
  }

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v4);
  return v19;
}

- (BOOL)shouldSetConfigurationToAppRule:(id)a3 edgeSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  NSObject *v19;
  BOOL v20;
  uint8_t v22[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  -[NSPManager matchingAppRule](self, "matchingAppRule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enabled");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if ((v8 == 0) == v10)
    goto LABEL_15;
  objc_msgSend(v6, "enabled");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (!v12)
  {
    nplog_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_19E8FE000, v13, OS_LOG_TYPE_DEFAULT, "NSP is currently disabled and the new app rule does not enable it, not updating the configuration", v22, 2u);
    }
    goto LABEL_13;
  }
  objc_msgSend(v8, "updateHash");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateHash");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (!v13
    || !v14
    || (v16 = -[NSObject isEqualToData:](v13, "isEqualToData:", v14), !v7)
    || !v16
    || (-[NSPManager keybag](self, "keybag"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "updateHashMatchesEdgeSet:", v7),
        v17,
        !v18))
  {

LABEL_15:
    v20 = 1;
    goto LABEL_16;
  }
  nplog_obj();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E8FE000, v19, OS_LOG_TYPE_DEFAULT, "The new NSP configuration does not differ from the current configuration, not updating the configuration", buf, 2u);
  }

LABEL_13:
  v20 = 0;
LABEL_16:

  return v20;
}

- (id)buildTestLatencyMap:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NPEdgeLatency *v15;
  void *v16;
  id v17;
  void *v19;
  id v20;
  id obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("latencyMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v3;
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = v3;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v4)
    {
      v5 = v4;
      v22 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v24 != v22)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("addressFamily"), v19);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ProbeTFO"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TFONoCookie"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TFOStatus"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("rtts"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("probeAddress"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[NPUtilities endpointFromString:defaultPortString:](NPUtilities, "endpointFromString:defaultPortString:", v13, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v15 = -[NPEdgeLatency initWithProbeEndpoint:probeTFO:]([NPEdgeLatency alloc], "initWithProbeEndpoint:probeTFO:", v14, objc_msgSend(v9, "BOOLValue"));
                -[NPEdgeLatency addRoundTripSamples:](v15, "addRoundTripSamples:", v12);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  -[NPEdgeLatency setProbeNoTFOCookie:](v15, "setProbeNoTFOCookie:", objc_msgSend(v10, "BOOLValue"));
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  -[NPEdgeLatency setTFOStatus:](v15, "setTFOStatus:", objc_msgSend(v11, "integerValue"));
                objc_msgSend(v20, "addObject:", v15);

              }
            }
          }

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v5);
    }

    if (objc_msgSend(v20, "count"))
      v16 = v20;
    else
      v16 = 0;
    v17 = v16;

    v3 = v19;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)ingestTestLatencyMap:(id)a3 local:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, uint64_t);
  NSArray *v10;
  NSArray *testLatencyMap;
  NSArray *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSArray *v19;
  const __CFString *v20;
  _QWORD v21[4];
  void (**v22)(id, uint64_t);
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, uint64_t))a5;
  if (v6)
  {
    -[NSPManager buildTestLatencyMap:](self, "buildTestLatencyMap:", v8);
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    testLatencyMap = self->_testLatencyMap;
    self->_testLatencyMap = v10;

    v12 = self->_testLatencyMap;
    nplog_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v19 = self->_testLatencyMap;
        *(_DWORD *)buf = 138412290;
        v24 = v19;
        _os_log_debug_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_DEBUG, "Using test latency map data for locally: %@", buf, 0xCu);
      }

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("fetchDaypass"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
        LOBYTE(v15) = objc_msgSend(v15, "BOOLValue");
      self->_testFetchDaypass = (char)v15;
      nplog_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        if (self->_testFetchDaypass)
          v20 = CFSTR("Will");
        else
          v20 = CFSTR("Will not");
        *(_DWORD *)buf = 138412290;
        v24 = (void *)v20;
        _os_log_debug_impl(&dword_19E8FE000, v17, OS_LOG_TYPE_DEBUG, "%@ fetch day pass from network", buf, 0xCu);
      }

      v9[2](v9, 1);
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_INFO, "Cleared test latency map", buf, 2u);
      }

      v9[2](v9, 1);
    }
  }
  else
  {
    getServerConnection();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __59__NSPManager_ingestTestLatencyMap_local_completionHandler___block_invoke;
    v21[3] = &unk_1E41389D8;
    v22 = v9;
    objc_msgSend(v18, "setTestLatencyMap:completionHandler:", v8, v21);

  }
}

uint64_t __59__NSPManager_ingestTestLatencyMap_local_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unint64_t)getTestLatencyRTT:(id)a3 parameters:(networkParameters *)a4
{
  id v6;
  NSArray *testLatencyMap;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  testLatencyMap = self->_testLatencyMap;
  if (testLatencyMap)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = testLatencyMap;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      v12 = 0xFFFFFFFFLL;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v14, "isMatched:parameters:", v6, a4, (_QWORD)v16) & 1) != 0)
          {
            v12 = objc_msgSend(v14, "getRoundTripSample:", self->_testLatencyMapIndex);
            goto LABEL_14;
          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v12 = 0xFFFFFFFFLL;
    }
LABEL_14:

  }
  else
  {
    v12 = 0xFFFFFFFFLL;
  }

  return v12;
}

- (BOOL)useTestLatencyMap
{
  return self->_testLatencyMap != 0;
}

- (BOOL)useTestDaypass
{
  return self->_testLatencyMap && !self->_testFetchDaypass;
}

- (void)resetTestLatencyMapIndex:(unint64_t)a3
{
  self->_testLatencyMapIndex = a3;
}

- (double)timeIntervalSinceLastUsage
{
  void *v2;
  double v3;
  double v4;

  -[NSPManager inUseKeybag](self, "inUseKeybag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeSinceLastUsed");
  v4 = v3;

  return v4;
}

- (void)container:(id)a3 didStartWithError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  nplog_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_19E8FE000, v6, OS_LOG_TYPE_INFO, "didStartWithError called with: %@", (uint8_t *)&v8, 0xCu);
  }

  -[NSPManager flowDivert](self, "flowDivert");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didStartWithError:", v5);

}

- (void)container:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  nplog_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_19E8FE000, v6, OS_LOG_TYPE_INFO, "didFailWithError with error: %@", (uint8_t *)&v8, 0xCu);
  }

  -[NSPManager flowDivert](self, "flowDivert");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didFailWithError:", v5);

}

- (void)container:(id)a3 didRequestFlowDivertControlSocketWithCompletionHandler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)container:(id)a3 didSetTunnelConfiguration:(id)a4 completionHandler:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (NWPathEvaluator)pathEvaluator
{
  return self->_pathEvaluator;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)connectionInfoSetHandler
{
  return self->_connectionInfoSetHandler;
}

- (void)setConnectionInfoSetHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)tunnelConnectedHandler
{
  return self->_tunnelConnectedHandler;
}

- (void)setTunnelConnectedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NPKeyBag)keybag
{
  return (NPKeyBag *)objc_getProperty(self, a2, 56, 1);
}

- (void)setKeybag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)disableIdleTimeout
{
  return self->_disableIdleTimeout;
}

- (void)setDisableIdleTimeout:(BOOL)a3
{
  self->_disableIdleTimeout = a3;
}

- (NWPathEvaluator)policyEvaluator
{
  return self->_policyEvaluator;
}

- (NSDictionary)appRules
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAppRules:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NPKeyBag)inUseKeybag
{
  return (NPKeyBag *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInUseKeybag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSPConfiguration)configuration
{
  return (NSPConfiguration *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSPFlowDivert)flowDivert
{
  return (NSPFlowDivert *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFlowDivert:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableDictionary)flowInfoMap
{
  return self->_flowInfoMap;
}

- (void)setFlowInfoMap:(id)a3
{
  objc_storeStrong((id *)&self->_flowInfoMap, a3);
}

- (BOOL)isObserving
{
  return self->_isObserving;
}

- (void)setIsObserving:(BOOL)a3
{
  self->_isObserving = a3;
}

- (NSArray)currentAgents
{
  return self->_currentAgents;
}

- (void)setCurrentAgents:(id)a3
{
  objc_storeStrong((id *)&self->_currentAgents, a3);
}

- (NSMutableDictionary)fallbackCounts
{
  return self->_fallbackCounts;
}

- (NSPManagerDelegate)delegate
{
  return (NSPManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)signingIdentifier
{
  return self->_signingIdentifier;
}

- (NSPAppRule)matchingAppRule
{
  return (NSPAppRule *)objc_getProperty(self, a2, 144, 1);
}

- (void)setMatchingAppRule:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSMutableArray)knownFlows
{
  return self->_knownFlows;
}

- (id)pendingCancellationHandler
{
  return self->_pendingCancellationHandler;
}

- (void)setPendingCancellationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSArray)testLatencyMap
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTestLatencyMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (BOOL)testFetchDaypass
{
  return self->_testFetchDaypass;
}

- (void)setTestFetchDaypass:(BOOL)a3
{
  self->_testFetchDaypass = a3;
}

- (unint64_t)testLatencyMapIndex
{
  return self->_testLatencyMapIndex;
}

- (void)setTestLatencyMapIndex:(unint64_t)a3
{
  self->_testLatencyMapIndex = a3;
}

- (unsigned)nextFlowID
{
  return self->_nextFlowID;
}

- (void)setNextFlowID:(unsigned int)a3
{
  self->_nextFlowID = a3;
}

- (unsigned)tunnelCount
{
  return self->_tunnelCount;
}

- (void)setTunnelCount:(unsigned int)a3
{
  self->_tunnelCount = a3;
}

- (OS_nw_endpoint)currentTunnelEndpoint
{
  return self->_currentTunnelEndpoint;
}

- (void)setCurrentTunnelEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_currentTunnelEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTunnelEndpoint, 0);
  objc_storeStrong((id *)&self->_testLatencyMap, 0);
  objc_storeStrong(&self->_pendingCancellationHandler, 0);
  objc_storeStrong((id *)&self->_knownFlows, 0);
  objc_storeStrong((id *)&self->_matchingAppRule, 0);
  objc_storeStrong((id *)&self->_signingIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fallbackCounts, 0);
  objc_storeStrong((id *)&self->_currentAgents, 0);
  objc_storeStrong((id *)&self->_flowInfoMap, 0);
  objc_storeStrong((id *)&self->_flowDivert, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_inUseKeybag, 0);
  objc_storeStrong((id *)&self->_appRules, 0);
  objc_storeStrong((id *)&self->_policyEvaluator, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong(&self->_tunnelConnectedHandler, 0);
  objc_storeStrong(&self->_connectionInfoSetHandler, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
}

@end
