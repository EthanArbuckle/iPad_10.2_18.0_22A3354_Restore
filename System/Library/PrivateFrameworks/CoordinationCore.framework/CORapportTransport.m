@implementation CORapportTransport

- (CORapportTransport)initWithDiscoveryRecord:(id)a3 executionContext:(id)a4
{
  id v7;
  id v8;
  CORapportTransport *v9;
  void *v10;
  uint64_t v11;
  OS_nw_activity *activity;
  uint64_t v13;
  NSMapTable *sinks;
  uint64_t v15;
  COConstituent *remote;
  void (**v17)(void);
  uint64_t v18;
  COCompanionLinkClientProtocol *client;
  uint64_t v20;
  NSMutableDictionary *counters;
  uint64_t v22;
  NSMutableDictionary *commands;
  void *v24;
  void *v25;
  uint64_t v26;
  NSMutableDictionary *registrationCompletions;
  objc_super v29;

  v7 = a3;
  v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)CORapportTransport;
  v9 = -[CORapportTransport init](&v29, sel_init);
  if (v9)
  {
    objc_msgSend(v8, "networkActivityFactory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activityWithLabel:parentActivity:", 1, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    activity = v9->_activity;
    v9->_activity = (OS_nw_activity *)v11;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    sinks = v9->_sinks;
    v9->_sinks = (NSMapTable *)v13;

    objc_storeStrong((id *)&v9->_record, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "constituentForMe");
      v15 = objc_claimAutoreleasedReturnValue();
      remote = v9->_remote;
      v9->_remote = (COConstituent *)v15;

    }
    if (objc_msgSend(v7, "conformsToProtocol:", &unk_254E13B70))
    {
      objc_msgSend(v7, "companionLinkProvider");
      v17 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v17[2]();
      v18 = objc_claimAutoreleasedReturnValue();
      client = v9->_client;
      v9->_client = (COCompanionLinkClientProtocol *)v18;

    }
    objc_storeStrong((id *)&v9->_executionContext, a4);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    counters = v9->_counters;
    v9->_counters = (NSMutableDictionary *)v20;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    commands = v9->_commands;
    v9->_commands = (NSMutableDictionary *)v22;

    objc_msgSend(v8, "objectForKey:", 0x24D4B6858);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_minimumPingInterval = (double)objc_msgSend(v24, "integerValue");

    objc_msgSend(v8, "objectForKey:", 0x24D4B6878);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_maximumPingInterval = (double)objc_msgSend(v25, "integerValue");

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v26 = objc_claimAutoreleasedReturnValue();
    registrationCompletions = v9->_registrationCompletions;
    v9->_registrationCompletions = (NSMutableDictionary *)v26;

    -[CORapportTransport _registerHandlersOnClient](v9, "_registerHandlersOnClient");
    -[CORapportTransport _setUpRegistrationCompletionHandlers](v9, "_setUpRegistrationCompletionHandlers");
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  -[CORapportTransport executionContext](self, "executionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constituentForMe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CORapportTransport remote](self, "remote");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p, %@ -> %@>"), v7, self, v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CORapportTransport executionContext](self, "executionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "meshControllerDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[m:%@] <%@: %p>"), v5, v7, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int)listeningPort
{
  void *v2;
  int v3;

  -[COCompanionLinkClientProtocol localDevice](self->_client, "localDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "listeningPort");

  return v3;
}

- (void)setRecord:(id)a3
{
  objc_storeStrong((id *)&self->_record, a3);
}

- (void)setAsSink:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  COCoreLogForCategory(17);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[CORapportTransport shortDescription](self, "shortDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v6;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ setting sink for transport %@", (uint8_t *)&v13, 0x16u);

  }
  -[CORapportTransport record](self, "record");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CORapportTransport executionContext](self, "executionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assertDispatchQueue");

    objc_msgSend(v4, "record");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "IDSIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CORapportTransport sinks](self, "sinks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v4, v11);

  }
}

- (void)removeAsSink:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  COCoreLogForCategory(17);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[CORapportTransport shortDescription](self, "shortDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v6;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ removing sink for transport %@", (uint8_t *)&v13, 0x16u);

  }
  -[CORapportTransport record](self, "record");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CORapportTransport executionContext](self, "executionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assertDispatchQueue");

    objc_msgSend(v4, "record");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "IDSIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CORapportTransport sinks](self, "sinks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v11);

  }
}

- (BOOL)supportsLeaderElection
{
  void *v2;
  char v3;

  -[CORapportTransport executionContext](self, "executionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "leaderElectionConfigured");

  return v3;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (void)sourceHasBeenActivated
{
  _BOOL4 activated;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[CORapportTransport record](self, "record");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

  }
  else
  {
    activated = self->_activated;

    if (!activated)
    {
      -[CORapportTransport activationHandler](self, "activationHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        COCoreLogForCategory(17);
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          -[CORapportTransport shortDescription](self, "shortDescription");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v10 = v6;
          _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ completing deferred activation", buf, 0xCu);

        }
        -[CORapportTransport activationHandler](self, "activationHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CORapportTransport activateWithCompletion:](self, "activateWithCompletion:", v7);
        -[CORapportTransport setActivationHandler:](self, "setActivationHandler:", 0);

      }
    }
  }
}

- (void)activateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(id, _QWORD);
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  -[CORapportTransport executionContext](self, "executionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDispatchQueue");

  if (self->_activated)
  {
    COCoreLogForCategory(17);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[CORapportTransport shortDescription](self, "shortDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v7;
      _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Rapport Transport is already active", buf, 0xCu);

    }
  }
  else
  {
    -[CORapportTransport record](self, "record");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      self->_activated = 1;
      -[CORapportTransport activity](self, "activity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[CORapportTransport activity](self, "activity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        nw_activity_activate();

      }
      v4[2](v4, 0);
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      -[CORapportTransport sinks](self, "sinks");
      v6 = objc_claimAutoreleasedReturnValue();
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v26 != v13)
              objc_enumerationMutation(v6);
            v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
            -[CORapportTransport sinks](self, "sinks");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKey:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "sourceHasBeenActivated");
          }
          v12 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v12);
      }
    }
    else
    {
      v6 = self->_record;
      -[NSObject sourceTransport](v6, "sourceTransport");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "isActivated") & 1) != 0)
      {
        objc_initWeak((id *)buf, self);
        -[CORapportTransport client](self, "client");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __45__CORapportTransport_activateWithCompletion___block_invoke;
        v22[3] = &unk_24D4B0DD8;
        objc_copyWeak(&v24, (id *)buf);
        v23 = v4;
        objc_msgSend(v19, "activateWithCompletion:", v22);

        objc_destroyWeak(&v24);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        COCoreLogForCategory(17);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          -[CORapportTransport shortDescription](self, "shortDescription");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v31 = v21;
          _os_log_impl(&dword_215E92000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ deferring activation since source transport is not yet active", buf, 0xCu);

        }
        -[CORapportTransport setActivationHandler:](self, "setActivationHandler:", v4);
      }

    }
  }

}

void __45__CORapportTransport_activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "executionContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __45__CORapportTransport_activateWithCompletion___block_invoke_2;
    v7[3] = &unk_24D4B0DB0;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    v8 = v3;
    v9 = v5;
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v6, "dispatchAsync:", v7);

    objc_destroyWeak(&v11);
  }

}

void __45__CORapportTransport_activateWithCompletion___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (!*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 40), "activity");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        objc_msgSend(*(id *)(a1 + 40), "activity");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        nw_activity_activate();

      }
      COCoreLogForCategory(17);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "shortDescription");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "client");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138543618;
        v9 = v6;
        v10 = 2112;
        v11 = v7;
        _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ activated transport with client %@", (uint8_t *)&v8, 0x16u);

      }
      WeakRetained[8] = 1;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(WeakRetained, "_handleOnDemanNodeCreationRequest");
  }

}

- (void)invalidateWithError:(id)a3
{
  void *v4;
  void *v5;
  xpc_object_t v6;
  uint64_t v7;
  uint64_t activation_time;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[CORapportTransport executionContext](self, "executionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertDispatchQueue");

  -[CORapportTransport activity](self, "activity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && nw_activity_is_activated())
  {
    v6 = xpc_dictionary_create(0, 0, 0);
    if (v6)
    {
      v7 = mach_continuous_time();
      activation_time = nw_activity_get_activation_time();
      xpc_dictionary_set_uint64(v6, "lifetime", v7 - activation_time);
      -[CORapportTransport averageRequestTime](self, "averageRequestTime");
      xpc_dictionary_set_double(v6, "rtt", v9);
      xpc_dictionary_set_uint64(v6, "requests", -[CORapportTransport requestCount](self, "requestCount"));
      xpc_dictionary_set_uint64(v6, "transport_type", 1uLL);
      -[CORapportTransport remote](self, "remote");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        xpc_dictionary_set_uint64(v6, "nodeType", objc_msgSend(v10, "type"));
        xpc_dictionary_set_uint64(v6, "nodeFlags", objc_msgSend(v11, "flags"));
      }
      nw_activity_submit_metrics();

    }
    nw_activity_complete_with_reason();

  }
  -[CORapportTransport client](self, "client");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "invalidate");

  -[CORapportTransport delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "transport:didInvalidateWithError:", self, v16);
  -[CORapportTransport record](self, "record");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CORapportTransport removeAsSink:](self, "removeAsSink:", self);
  }
  else
  {
    objc_msgSend(v14, "sourceTransport");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeAsSink:", self);

  }
}

- (void)registerRequestForClass:(Class)a3 withCompletion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v6 = (void (**)(_QWORD))a4;
  -[CORapportTransport executionContext](self, "executionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertDispatchQueue");

  -[CORapportTransport _eventIDForClass:](self, "_eventIDForClass:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CORapportTransport commands](self, "commands");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", a3, v8);

  -[CORapportTransport record](self, "record");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
    {
      -[CORapportTransport registrationCompletions](self, "registrationCompletions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x2199F3D40](v6);
      objc_msgSend(v12, "setObject:forKey:", v13, v8);

      objc_initWeak(&location, self);
      -[CORapportTransport client](self, "client");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __61__CORapportTransport_registerRequestForClass_withCompletion___block_invoke;
      v15[3] = &unk_24D4B0E28;
      objc_copyWeak(&v17, &location);
      v16 = v8;
      objc_msgSend(v14, "registerRequestID:options:handler:", v16, 0, v15);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v6[2](v6);
  }

}

void __61__CORapportTransport_registerRequestForClass_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  __uint64_t v10;
  id WeakRetained;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  __uint64_t v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "executionContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __61__CORapportTransport_registerRequestForClass_withCompletion___block_invoke_2;
    v14[3] = &unk_24D4B0E00;
    v15 = v8;
    v16 = v12;
    v17 = *(id *)(a1 + 32);
    v18 = v7;
    v19 = v9;
    v20 = v10;
    objc_msgSend(v13, "dispatchAsync:", v14);

  }
}

void __61__CORapportTransport_registerRequestForClass_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x24BE7CD00]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length")
    && (objc_msgSend(*(id *)(a1 + 40), "sinks"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "objectForKey:", v2),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v4))
  {
    objc_msgSend(v4, "handleRequestIdentifier:rapportRepresentation:options:responseHandler:at:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

  }
  else
  {
    COCoreLogForCategory(17);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __61__CORapportTransport_registerRequestForClass_withCompletion___block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "handleRequestFromUnknownNodeWithIdentifier:rapportRepresentation:options:responseHandler:at:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  }

}

- (void)registerCommandForClass:(Class)a3 withCompletion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v6 = (void (**)(_QWORD))a4;
  -[CORapportTransport executionContext](self, "executionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertDispatchQueue");

  -[CORapportTransport _eventIDForClass:](self, "_eventIDForClass:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CORapportTransport commands](self, "commands");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", a3, v8);

  -[CORapportTransport record](self, "record");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
    {
      -[CORapportTransport registrationCompletions](self, "registrationCompletions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x2199F3D40](v6);
      objc_msgSend(v12, "setObject:forKey:", v13, v8);

      objc_initWeak(&location, self);
      -[CORapportTransport client](self, "client");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __61__CORapportTransport_registerCommandForClass_withCompletion___block_invoke;
      v15[3] = &unk_24D4B0E78;
      objc_copyWeak(&v17, &location);
      v16 = v8;
      objc_msgSend(v14, "registerEventID:options:handler:", v16, 0, v15);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v6[2](v6);
  }

}

void __61__CORapportTransport_registerCommandForClass_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  void *v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "executionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __61__CORapportTransport_registerCommandForClass_withCompletion___block_invoke_2;
    v10[3] = &unk_24D4B0E50;
    v11 = v6;
    v12 = v8;
    v13 = *(id *)(a1 + 32);
    v14 = v5;
    objc_msgSend(v9, "dispatchAsync:", v10);

  }
}

void __61__CORapportTransport_registerCommandForClass_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x24BE7CD00]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length")
    && (objc_msgSend(*(id *)(a1 + 40), "sinks"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "objectForKey:", v2),
        v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        v4))
  {
    -[NSObject handleEventIdentifier:rapportRepresentation:options:](v4, "handleEventIdentifier:rapportRepresentation:options:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
  }
  else
  {
    COCoreLogForCategory(17);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __61__CORapportTransport_registerCommandForClass_withCompletion___block_invoke_2_cold_1(a1, (uint64_t)v2, v4);
  }

}

- (void)deregisterRequestForClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  id v10;

  -[CORapportTransport executionContext](self, "executionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDispatchQueue");

  -[CORapportTransport _eventIDForClass:](self, "_eventIDForClass:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CORapportTransport commands](self, "commands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v10);

  -[CORapportTransport record](self, "record");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    -[CORapportTransport client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deregisterRequestID:", v10);

  }
}

- (void)deregisterCommandForClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  id v10;

  -[CORapportTransport executionContext](self, "executionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDispatchQueue");

  -[CORapportTransport _eventIDForClass:](self, "_eventIDForClass:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CORapportTransport commands](self, "commands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v10);

  -[CORapportTransport record](self, "record");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    -[CORapportTransport client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deregisterEventID:", v10);

  }
}

- (void)_setUpRegistrationCompletionHandlers
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  -[CORapportTransport executionContext](self, "executionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertDispatchQueue");

  objc_initWeak(&location, self);
  -[CORapportTransport client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__CORapportTransport__setUpRegistrationCompletionHandlers__block_invoke;
  v9[3] = &unk_24D4B0EA0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "setRequestIDRegistrationCompletion:", v9);

  -[CORapportTransport client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __58__CORapportTransport__setUpRegistrationCompletionHandlers__block_invoke_89;
  v7[3] = &unk_24D4B0EA0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v6, "setEventIDRegistrationCompletion:", v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __58__CORapportTransport__setUpRegistrationCompletionHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "executionContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __58__CORapportTransport__setUpRegistrationCompletionHandlers__block_invoke_2;
    v7[3] = &unk_24D4B0858;
    v7[4] = v5;
    v8 = v3;
    objc_msgSend(v6, "dispatchAsync:", v7);

  }
}

void __58__CORapportTransport__setUpRegistrationCompletionHandlers__block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD);
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "registrationCompletions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    COCoreLogForCategory(17);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "shortDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      v7 = 138543618;
      v8 = v5;
      v9 = 2114;
      v10 = v6;
      _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully registered request ID %{public}@", (uint8_t *)&v7, 0x16u);

    }
    v3[2](v3);
  }

}

void __58__CORapportTransport__setUpRegistrationCompletionHandlers__block_invoke_89(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "executionContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __58__CORapportTransport__setUpRegistrationCompletionHandlers__block_invoke_2_90;
    v7[3] = &unk_24D4B0858;
    v7[4] = v5;
    v8 = v3;
    objc_msgSend(v6, "dispatchAsync:", v7);

  }
}

void __58__CORapportTransport__setUpRegistrationCompletionHandlers__block_invoke_2_90(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD);
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "registrationCompletions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    COCoreLogForCategory(17);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "shortDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      v7 = 138543618;
      v8 = v5;
      v9 = 2114;
      v10 = v6;
      _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully registered event ID %{public}@", (uint8_t *)&v7, 0x16u);

    }
    v3[2](v3);
  }

}

- (void)sendCommand:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  void (**v26)(id, _QWORD);
  id v27;
  _QWORD v28[2];
  _QWORD v29[2];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[CORapportTransport executionContext](self, "executionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertDispatchQueue");

  -[CORapportTransport _eventIDForClass:](self, "_eventIDForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(17);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[CORapportTransport shortDescription](self, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v11;
    v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_215E92000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ sending %@", buf, 0x16u);

  }
  -[CORapportTransport record](self, "record");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CORapportTransport executionContext](self, "executionContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constituentForMe");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CORapportTransport setRemote:](self, "setRemote:", v15);

    -[CORapportTransport delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    COCoreLogForCategory(17);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[CORapportTransport shortDescription](self, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v18;
      v32 = 2114;
      v33 = v6;
      _os_log_impl(&dword_215E92000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Got a command %{public}@", buf, 0x16u);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v16, "transport:didReceiveCommand:", self, v6);
    v7[2](v7, 0);
  }
  else
  {
    -[CORapportTransport _serializedDataForCommand:](self, "_serializedDataForCommand:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CORapportTransport executionContext](self, "executionContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constituentForMe");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v28[0] = CFSTR("source");
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v20, 1, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = CFSTR("command");
    v29[0] = v21;
    v29[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, self);
    -[CORapportTransport client](self, "client");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __56__CORapportTransport_sendCommand_withCompletionHandler___block_invoke;
    v24[3] = &unk_24D4B0EF0;
    objc_copyWeak(&v27, (id *)buf);
    v25 = v9;
    v26 = v7;
    objc_msgSend(v23, "sendEventID:event:options:completion:", v25, v22, 0, v24);

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);

  }
}

void __56__CORapportTransport_sendCommand_withCompletionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "executionContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __56__CORapportTransport_sendCommand_withCompletionHandler___block_invoke_2;
    v7[3] = &unk_24D4B0EC8;
    v7[4] = v5;
    v8 = a1[4];
    v9 = v3;
    v10 = a1[5];
    objc_msgSend(v6, "dispatchAsync:", v7);

  }
}

uint64_t __56__CORapportTransport_sendCommand_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  COCoreLogForCategory(17);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __56__CORapportTransport_sendCommand_withCompletionHandler___block_invoke_2_cold_1(a1, v2);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)sendRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40[2];
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id location;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  double v51;
  _QWORD v52[2];
  _QWORD v53[5];

  v53[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CORapportTransport executionContext](self, "executionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertDispatchQueue");

  objc_initWeak(&location, self);
  -[CORapportTransport record](self, "record");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CORapportTransport executionContext](self, "executionContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constituentForMe");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CORapportTransport setRemote:](self, "setRemote:", v12);

    COCoreLogForCategory(17);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[CORapportTransport shortDescription](self, "shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v14;
      v48 = 2114;
      v49 = v6;
      _os_log_impl(&dword_215E92000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Got a request %{public}@", buf, 0x16u);

    }
    -[CORapportTransport delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __54__CORapportTransport_sendRequest_withResponseHandler___block_invoke;
      v41[3] = &unk_24D4B0F40;
      objc_copyWeak(&v44, &location);
      v43 = v7;
      v42 = v6;
      objc_msgSend(v15, "transport:didReceiveRequest:callback:", self, v42, v41);

      objc_destroyWeak(&v44);
    }
  }
  else
  {
    -[CORapportTransport _serializedDataForCommand:](self, "_serializedDataForCommand:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CORapportTransport executionContext](self, "executionContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constituentForMe");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v52[0] = CFSTR("source");
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v35, 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = CFSTR("command");
    v53[0] = v17;
    v53[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    -[CORapportTransport _eventIDForClass:](self, "_eventIDForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CORapportTransport client](self, "client");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "responseTimeout");
    if (v20 >= 0.0)
      v21 = v20;
    else
      v21 = 0.0;
    if (v21 <= 0.0)
    {
      COCoreLogForCategory(17);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        -[CORapportTransport shortDescription](self, "shortDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v27;
        v48 = 2114;
        v49 = v18;
        _os_log_impl(&dword_215E92000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting %{public}@", buf, 0x16u);

      }
      v24 = 0;
    }
    else
    {
      v22 = (void *)MEMORY[0x24BDBCE70];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "dictionaryWithObject:forKey:", v23, *MEMORY[0x24BE7CD18]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      COCoreLogForCategory(17);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        -[CORapportTransport shortDescription](self, "shortDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v47 = v26;
        v48 = 2114;
        v49 = v18;
        v50 = 2048;
        v51 = v21;
        _os_log_impl(&dword_215E92000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting %{public}@ with timeout of %g", buf, 0x20u);

      }
    }

    objc_msgSend(v6, "activity");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CORapportTransport executionContext](self, "executionContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "networkActivityFactory");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "activityWithLabel:parentActivity:", 2, v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      nw_activity_activate();
    v32 = (void *)clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __54__CORapportTransport_sendRequest_withResponseHandler___block_invoke_99;
    v36[3] = &unk_24D4B0F90;
    objc_copyWeak(v40, &location);
    v33 = v31;
    v37 = v33;
    v38 = v6;
    v39 = v7;
    v40[1] = v32;
    objc_msgSend(v19, "sendRequestID:request:options:responseHandler:", v18, v34, v24, v36);

    objc_destroyWeak(v40);
  }

  objc_destroyWeak(&location);
}

void __54__CORapportTransport_sendRequest_withResponseHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "executionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __54__CORapportTransport_sendRequest_withResponseHandler___block_invoke_2;
    v10[3] = &unk_24D4B0F18;
    v14 = a1[5];
    v11 = a1[4];
    v12 = v5;
    v13 = v6;
    objc_msgSend(v9, "dispatchAsync:", v10);

  }
}

uint64_t __54__CORapportTransport_sendRequest_withResponseHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __54__CORapportTransport_sendRequest_withResponseHandler___block_invoke_99(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "executionContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __54__CORapportTransport_sendRequest_withResponseHandler___block_invoke_2_100;
    v15[3] = &unk_24D4B0F68;
    v16 = *(id *)(a1 + 32);
    v17 = v9;
    v18 = v11;
    v19 = *(id *)(a1 + 40);
    v20 = v7;
    v21 = v8;
    v13 = *(id *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 64);
    v22 = v13;
    v23 = v14;
    objc_msgSend(v12, "dispatchAsync:", v15);

  }
}

uint64_t __54__CORapportTransport_sendRequest_withResponseHandler___block_invoke_2_100(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = xpc_dictionary_create(0, 0, 0);
    v3 = v2;
    if (v2)
    {
      xpc_dictionary_set_uint64(v2, "transport_type", 1uLL);
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();

  }
  return objc_msgSend(*(id *)(a1 + 48), "handleResponseToRequest:rapportRepresentation:options:error:responseHandler:at:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
}

- (void)_handleOnDemanNodeCreationRequest
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[CORapportTransport executionContext](self, "executionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertDispatchQueue");

  -[CORapportTransport record](self, "record");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "unhandledRequest");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      COCoreLogForCategory(17);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[CORapportTransport shortDescription](self, "shortDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v8;
        _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Found an outstanding on demand node creation request", (uint8_t *)&v13, 0xCu);

      }
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "data");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "options");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CORapportTransport handleRequestIdentifier:rapportRepresentation:options:responseHandler:at:](self, "handleRequestIdentifier:rapportRepresentation:options:responseHandler:at:", v9, v10, v11, v12, objc_msgSend(v6, "timestamp"));

    }
  }

}

- (void)_commandForIdentifier:(id)a3 fromData:(id)a4 result:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, id);
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, id))a5;
  -[CORapportTransport executionContext](self, "executionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertDispatchQueue");

  if (!v9)
  {
    COCoreLogForCategory(17);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CORapportTransport _commandForIdentifier:fromData:result:].cold.1(self, v17);

    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = -4000;
    goto LABEL_10;
  }
  -[CORapportTransport commands](self, "commands");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "objectForKey:", v8);

  if (!v13)
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = -4001;
LABEL_10:
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), v19, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    goto LABEL_11;
  }
  v20 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", v13, v9, &v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v20;
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4001, 0);
      v16 = objc_claimAutoreleasedReturnValue();

      v14 = 0;
      v15 = (id)v16;
    }
  }
LABEL_11:
  v10[2](v10, v14, v15);

}

- (void)handleRequestFromUnknownNodeWithIdentifier:(id)a3 rapportRepresentation:(id)a4 options:(id)a5 responseHandler:(id)a6 at:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  COUnhandledRapportRequest *v22;
  COUnhandledRapportRequest *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[6];
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint8_t buf[4];
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[CORapportTransport executionContext](self, "executionContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "assertDispatchQueue");

  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__4;
  v50 = __Block_byref_object_dispose__4;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__4;
  v44 = __Block_byref_object_dispose__4;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__4;
  v38 = __Block_byref_object_dispose__4;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__4;
  v32 = __Block_byref_object_dispose__4;
  v33 = 0;
  v17 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __114__CORapportTransport_handleRequestFromUnknownNodeWithIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke;
  v27[3] = &unk_24D4B0FB8;
  v27[4] = &v28;
  v27[5] = &v34;
  +[CORapportTransport _commandPayloadFromRapportRepresentation:result:](CORapportTransport, "_commandPayloadFromRapportRepresentation:result:", v13, v27);
  v18 = v35[5];
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __114__CORapportTransport_handleRequestFromUnknownNodeWithIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_2;
  v26[3] = &unk_24D4B0FE0;
  v26[4] = &v46;
  v26[5] = &v40;
  -[CORapportTransport _commandForIdentifier:fromData:result:](self, "_commandForIdentifier:fromData:result:", v12, v18, v26);
  if (v29[5])
    objc_msgSend((id)v41[5], "_setSendingConstituent:");
  objc_msgSend((id)v41[5], "_setRapportOptions:", v14);
  if (v47[5])
  {
    (*((void (**)(id, _QWORD, _QWORD))v15 + 2))(v15, 0, 0);
  }
  else
  {
    -[CORapportTransport delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      COCoreLogForCategory(17);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[CORapportTransport shortDescription](self, "shortDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v53 = v21;
        _os_log_impl(&dword_215E92000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ received request for unknown node. Informing delegate", buf, 0xCu);

      }
      v22 = [COUnhandledRapportRequest alloc];
      v23 = -[COUnhandledRapportRequest initWithRequest:identifier:data:options:handler:at:](v22, "initWithRequest:identifier:data:options:handler:at:", v41[5], v12, v13, v14, v15, a7);
      objc_msgSend(v19, "transport:didReceiveUnhandledRequest:", self, v23);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4001, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v47[5];
      v47[5] = v24;

      (*((void (**)(id, _QWORD, _QWORD, uint64_t))v15 + 2))(v15, 0, 0, v47[5]);
    }

  }
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
}

void __114__CORapportTransport_handleRequestFromUnknownNodeWithIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __114__CORapportTransport_handleRequestFromUnknownNodeWithIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

- (void)handleRequestIdentifier:(id)a3 rapportRepresentation:(id)a4 options:(id)a5 responseHandler:(id)a6 at:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32[2];
  _QWORD v33[5];
  id location;
  id *p_location;
  uint64_t v36;
  char v37;
  _QWORD v38[6];
  _QWORD v39[6];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[CORapportTransport executionContext](self, "executionContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "assertDispatchQueue");

  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__4;
  v62 = __Block_byref_object_dispose__4;
  v63 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__4;
  v56 = __Block_byref_object_dispose__4;
  v57 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__4;
  v50 = __Block_byref_object_dispose__4;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__4;
  v44 = __Block_byref_object_dispose__4;
  v45 = 0;
  v17 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke;
  v39[3] = &unk_24D4B0FB8;
  v39[4] = &v40;
  v39[5] = &v46;
  +[CORapportTransport _commandPayloadFromRapportRepresentation:result:](CORapportTransport, "_commandPayloadFromRapportRepresentation:result:", v13, v39);
  v18 = v47[5];
  v38[0] = v17;
  v38[1] = 3221225472;
  v38[2] = __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_2;
  v38[3] = &unk_24D4B0FE0;
  v38[4] = &v58;
  v38[5] = &v52;
  -[CORapportTransport _commandForIdentifier:fromData:result:](self, "_commandForIdentifier:fromData:result:", v12, v18, v38);
  v19 = (void *)v53[5];
  if (!v19)
  {
    (*((void (**)(id, _QWORD, _QWORD, uint64_t))v15 + 2))(v15, 0, 0, v59[5]);
    goto LABEL_21;
  }
  if (v41[5])
  {
    objc_msgSend(v19, "_setSendingConstituent:");
    v19 = (void *)v53[5];
  }
  objc_msgSend(v19, "_setRapportOptions:", v14);
  COCoreLogForCategory(17);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    -[CORapportTransport shortDescription](self, "shortDescription");
    objc_claimAutoreleasedReturnValue();
    -[CORapportTransport handleRequestIdentifier:rapportRepresentation:options:responseHandler:at:].cold.2();
  }

  if (-[CORapportTransport _validateSource:options:](self, "_validateSource:options:", v41[5], v14))
    goto LABEL_16;
  COCoreLogForCategory(17);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    -[CORapportTransport shortDescription](self, "shortDescription");
    objc_claimAutoreleasedReturnValue();
    -[CORapportTransport handleRequestIdentifier:rapportRepresentation:options:responseHandler:at:].cold.1();
  }

  -[CORapportTransport delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  location = 0;
  p_location = &location;
  v36 = 0x2020000000;
  v37 = 0;
  if (v41[5] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CORapportTransport remote](self, "remote");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v41[5];
    v25 = v53[5];
    v33[0] = v17;
    v33[1] = 3221225472;
    v33[2] = __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_113;
    v33[3] = &unk_24D4B1008;
    v33[4] = &location;
    objc_msgSend(v22, "transport:shouldUpdateRemoteConstituent:to:forCommand:completionHandler:", self, v23, v24, v25, v33);

  }
  if (*((_BYTE *)p_location + 24))
  {
    -[CORapportTransport remote](self, "remote");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CORapportTransport setRemote:](self, "setRemote:", v41[5]);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v22, "transport:didUpdateRemoteConstituent:to:", self, v26, v41[5]);

    _Block_object_dispose(&location, 8);
LABEL_16:
    -[CORapportTransport delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v27 = v53[5];
      v30[0] = v17;
      v30[1] = 3221225472;
      v30[2] = __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_2_117;
      v30[3] = &unk_24D4B1058;
      objc_copyWeak(v32, &location);
      v32[1] = (id)a7;
      v31 = v15;
      objc_msgSend(v22, "transport:didReceiveRequest:callback:", self, v27, v30);

      objc_destroyWeak(v32);
    }
    objc_destroyWeak(&location);
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4000, 0);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v59[5];
  v59[5] = v28;

  (*((void (**)(id, _QWORD, _QWORD, uint64_t))v15 + 2))(v15, 0, 0, v59[5]);
  _Block_object_dispose(&location, 8);
LABEL_19:

LABEL_21:
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&v58, 8);
}

void __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

uint64_t __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_113(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_2_117(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "executionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_3;
    v12[3] = &unk_24D4B1030;
    v13 = v6;
    v14 = v8;
    v10 = v5;
    v11 = *(_QWORD *)(a1 + 48);
    v15 = v10;
    v17 = v11;
    v16 = *(id *)(a1 + 32);
    objc_msgSend(v9, "dispatchAsync:", v12);

  }
}

void __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    COCoreLogForCategory(17);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_3_cold_2();
    v3 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_serializedDataForCommand:", *(_QWORD *)(a1 + 48));
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_eventIDForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "executionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constituentForMe");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    COCoreLogForCategory(17);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_3_cold_1();

    v10[0] = CFSTR("source");
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    v11[1] = v2;
    v10[1] = CFSTR("command");
    v10[2] = CFSTR("response");
    v11[2] = v4;
    v10[3] = CFSTR("overhead");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - *(_QWORD *)(a1 + 64)));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)handleResponseToRequest:(id)a3 rapportRepresentation:(id)a4 options:(id)a5 error:(id)a6 responseHandler:(id)a7 at:(unint64_t)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void (**v21)(_QWORD);
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  __uint64_t v47;
  id v49;
  id v50;
  void *v51;
  id v52;
  _QWORD v53[7];
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _QWORD v64[5];
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  uint64_t *v69;
  id v70;
  id location;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint64_t v78;
  id v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  id v83;
  __int16 v84;
  id v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v50 = a5;
  v15 = a6;
  v16 = a7;
  v47 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__4;
  v76 = __Block_byref_object_dispose__4;
  v49 = v15;
  v77 = v49;
  -[CORapportTransport executionContext](self, "executionContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "assertDispatchQueue");

  objc_msgSend(v14, "objectForKey:", CFSTR("response"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v18 = MEMORY[0x24BDAC760];
  v66[0] = MEMORY[0x24BDAC760];
  v66[1] = 3221225472;
  v66[2] = __101__CORapportTransport_handleResponseToRequest_rapportRepresentation_options_error_responseHandler_at___block_invoke;
  v66[3] = &unk_24D4B1080;
  objc_copyWeak(&v70, &location);
  v69 = &v72;
  v19 = v13;
  v67 = v19;
  v20 = v16;
  v68 = v20;
  v21 = (void (**)(_QWORD))MEMORY[0x2199F3D40](v66);
  if (!v73[5])
  {
    objc_msgSend((id)objc_opt_class(), "acceptableResponses");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v18;
    v64[1] = 3221225472;
    v64[2] = __101__CORapportTransport_handleResponseToRequest_rapportRepresentation_options_error_responseHandler_at___block_invoke_118;
    v64[3] = &unk_24D4B10A8;
    v64[4] = self;
    v65 = v51;
    v46 = v23;
    objc_msgSend(v23, "objectsPassingTest:", v64);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "anyObject");

    if (!v25)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4001, 0);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v73[5];
      v73[5] = v33;

      v21[2](v21);
LABEL_36:

      goto LABEL_37;
    }
    v86 = 0;
    v87 = &v86;
    v88 = 0x3032000000;
    v89 = __Block_byref_object_copy__4;
    v90 = __Block_byref_object_dispose__4;
    v91 = 0;
    v58 = 0;
    v59 = &v58;
    v60 = 0x3032000000;
    v61 = __Block_byref_object_copy__4;
    v62 = __Block_byref_object_dispose__4;
    v63 = 0;
    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v57 = 0;
    v53[0] = v18;
    v53[1] = 3221225472;
    v53[2] = __101__CORapportTransport_handleResponseToRequest_rapportRepresentation_options_error_responseHandler_at___block_invoke_2;
    v53[3] = &unk_24D4B10D0;
    v53[4] = &v86;
    v53[5] = &v58;
    v53[6] = &v54;
    -[CORapportTransport _commandPayloadFromRapportRepresentationWithValidation:result:](self, "_commandPayloadFromRapportRepresentationWithValidation:result:", v14, v53);
    if (v59[5])
    {
      v26 = v87[5];
      if (v26)
      {
        v52 = 0;
        objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", v25, v26, &v52);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v52;
        if (v27)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (!*((_BYTE *)v55 + 24))
            {
              COCoreLogForCategory(17);
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                -[CORapportTransport shortDescription](self, "shortDescription");
                objc_claimAutoreleasedReturnValue();
                -[CORapportTransport handleResponseToRequest:rapportRepresentation:options:error:responseHandler:at:].cold.3();
              }

              -[CORapportTransport delegate](self, "delegate");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                -[CORapportTransport remote](self, "remote");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "transport:willUpdateRemoteConstituent:to:", self, v31, v59[5]);

              }
              -[CORapportTransport setRemote:](self, "setRemote:", v59[5]);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                -[CORapportTransport remote](self, "remote");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "transport:didUpdateRemoteConstituent:to:", self, v32, v59[5]);

              }
            }
            -[CORapportTransport _updateRequestTimesFromRapportRepresentation:start:end:](self, "_updateRequestTimesFromRapportRepresentation:start:end:", v14, a8, v47);
            objc_msgSend(v27, "_setRapportOptions:", v50);
            (*((void (**)(id, id, void *, _QWORD))v20 + 2))(v20, v19, v27, 0);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4001, 0);
            v41 = objc_claimAutoreleasedReturnValue();
            v42 = (void *)v73[5];
            v73[5] = v41;

            v21[2](v21);
          }
        }
        else
        {
          COCoreLogForCategory(17);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            -[CORapportTransport shortDescription](self, "shortDescription");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v81 = v45;
            v82 = 2114;
            v83 = v19;
            v84 = 2114;
            v85 = v28;
            _os_log_error_impl(&dword_215E92000, v39, OS_LOG_TYPE_ERROR, "%{public}@ failed to unarchive response for request %{public}@ with error = %{public}@", buf, 0x20u);

          }
          if (v28)
          {
            v78 = *MEMORY[0x24BDD1398];
            v79 = v28;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v40 = 0;
          }
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4001, v40);
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = (void *)v73[5];
          v73[5] = v43;

          v21[2](v21);
        }

        goto LABEL_35;
      }
      COCoreLogForCategory(17);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        -[CORapportTransport shortDescription](self, "shortDescription");
        objc_claimAutoreleasedReturnValue();
        -[CORapportTransport handleResponseToRequest:rapportRepresentation:options:error:responseHandler:at:].cold.2();
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4001, 0);
      v36 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      COCoreLogForCategory(17);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        -[CORapportTransport shortDescription](self, "shortDescription");
        objc_claimAutoreleasedReturnValue();
        -[CORapportTransport handleResponseToRequest:rapportRepresentation:options:error:responseHandler:at:].cold.1();
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4000, 0);
      v36 = objc_claimAutoreleasedReturnValue();
    }
    v38 = (void *)v73[5];
    v73[5] = v36;

    v21[2](v21);
LABEL_35:
    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v58, 8);

    _Block_object_dispose(&v86, 8);
    goto LABEL_36;
  }
  COCoreLogForCategory(17);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    -[CORapportTransport shortDescription](self, "shortDescription");
    objc_claimAutoreleasedReturnValue();
    -[CORapportTransport handleResponseToRequest:rapportRepresentation:options:error:responseHandler:at:].cold.4();
  }

  v21[2](v21);
LABEL_37:

  objc_destroyWeak(&v70);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v72, 8);
}

void __101__CORapportTransport_handleResponseToRequest_rapportRepresentation_options_error_responseHandler_at___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "remote");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 || objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "code") != -6714)
    {

    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "domain");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE7CC90]);

      if ((v6 & 1) != 0)
      {
LABEL_10:
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        goto LABEL_11;
      }
    }
    COCoreLogForCategory(17);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __101__CORapportTransport_handleResponseToRequest_rapportRepresentation_options_error_responseHandler_at___block_invoke_cold_1();

    goto LABEL_10;
  }
LABEL_11:

}

uint64_t __101__CORapportTransport_handleResponseToRequest_rapportRepresentation_options_error_responseHandler_at___block_invoke_118(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "_eventIDForClass:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 40));
  *a3 = v6;

  return v6;
}

void __101__CORapportTransport_handleResponseToRequest_rapportRepresentation_options_error_responseHandler_at___block_invoke_2(_QWORD *a1, void *a2, void *a3, char a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v7 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a3);
  v11 = a3;
  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;
  v10 = v7;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a4;
}

- (void)_updateRequestTimesFromRapportRepresentation:(id)a3 start:(unint64_t)a4 end:(unint64_t)a5
{
  void *v8;
  unint64_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id *v16;
  void (*v17)(_QWORD *, __CFString *, _QWORD *);
  id v18;
  NSObject *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void (*v28)(_QWORD *, __CFString *, _QWORD *);
  _QWORD v29[4];
  _QWORD v30[3];
  _QWORD v31[4];
  _QWORD v32[3];

  objc_msgSend(a3, "objectForKey:", CFSTR("overhead"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "BOOLValue"))
  {
    v9 = -[CORapportTransport requestCount](self, "requestCount") + 1;
    -[CORapportTransport executionContext](self, "executionContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "analyticsRecorder");
    v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (v9 < 0x3E9)
    {
      objc_msgSend(v8, "doubleValue");
      v21 = ((double)(a5 - a4) - v20) / 1000000.0;
      -[CORapportTransport averageRequestTime](self, "averageRequestTime");
      v23 = v22 * 1000.0;
      if (v21 <= v23)
        v21 = v23 + (v21 - v23) / (double)v9;
      else
        v9 = 1;
      -[CORapportTransport setRequestCount:](self, "setRequestCount:", v9);
      v24 = v21 / 1000.0;
      -[CORapportTransport setAverageRequestTime:](self, "setAverageRequestTime:", v24);
      HIDWORD(v25) = -1030792151 * (unsigned __int16)v9;
      LODWORD(v25) = HIDWORD(v25);
      if ((v25 >> 2) > 0x28F5C28)
        goto LABEL_12;
      -[CORapportTransport executionContext](self, "executionContext");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "label");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __77__CORapportTransport__updateRequestTimesFromRapportRepresentation_start_end___block_invoke_125;
      v29[3] = &unk_24D4B10F8;
      *(double *)&v30[1] = v24;
      v30[2] = v9;
      v16 = (id *)v30;
      v30[0] = v27;
      v28 = (void (*)(_QWORD *, __CFString *, _QWORD *))v11[2];
      v18 = v27;
      v28(v11, CFSTR("com.apple.CoordinationCore.MeshNodeLatency"), v29);
    }
    else
    {
      -[CORapportTransport averageRequestTime](self, "averageRequestTime");
      v13 = v12;
      -[CORapportTransport executionContext](self, "executionContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "label");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __77__CORapportTransport__updateRequestTimesFromRapportRepresentation_start_end___block_invoke;
      v31[3] = &unk_24D4B10F8;
      v32[1] = v13;
      v32[2] = v9;
      v16 = (id *)v32;
      v32[0] = v15;
      v17 = (void (*)(_QWORD *, __CFString *, _QWORD *))v11[2];
      v18 = v15;
      v17(v11, CFSTR("com.apple.CoordinationCore.MeshNodeLatency"), v31);
      -[CORapportTransport setRequestCount:](self, "setRequestCount:", 0);
      -[CORapportTransport setAverageRequestTime:](self, "setAverageRequestTime:", 0.0);
      COCoreLogForCategory(17);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[CORapportTransport _updateRequestTimesFromRapportRepresentation:start:end:].cold.1(self);

    }
LABEL_12:

  }
}

id __77__CORapportTransport__updateRequestTimesFromRapportRepresentation_start_end___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = 0x24D4B5638;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = 0x24D4B5618;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = 0x24D4B5418;
  v4 = *(_QWORD *)(a1 + 32);
  v8[1] = v3;
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __77__CORapportTransport__updateRequestTimesFromRapportRepresentation_start_end___block_invoke_125(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = 0x24D4B5638;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = 0x24D4B5618;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = 0x24D4B5418;
  v4 = *(_QWORD *)(a1 + 32);
  v8[1] = v3;
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)handleEventIdentifier:(id)a3 rapportRepresentation:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CORapportTransport executionContext](self, "executionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertDispatchQueue");

  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__4;
  v34 = __Block_byref_object_dispose__4;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4;
  v28 = __Block_byref_object_dispose__4;
  v29 = 0;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __74__CORapportTransport_handleEventIdentifier_rapportRepresentation_options___block_invoke;
  v23[3] = &unk_24D4B0FB8;
  v23[4] = &v24;
  v23[5] = &v30;
  +[CORapportTransport _commandPayloadFromRapportRepresentation:result:](CORapportTransport, "_commandPayloadFromRapportRepresentation:result:", v9, v23);
  if (v31[5])
  {
    -[CORapportTransport commands](self, "commands");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "objectForKey:", v8);

    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", v13, v31[5], 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4001, 0);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    COCoreLogForCategory(17);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[CORapportTransport shortDescription](self, "shortDescription");
      objc_claimAutoreleasedReturnValue();
      -[CORapportTransport handleEventIdentifier:rapportRepresentation:options:].cold.5();
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4000, 0);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v17;
  v14 = 0;
LABEL_9:
  if (v25[5])
  {
    if (!v15)
      goto LABEL_15;
  }
  else
  {
    COCoreLogForCategory(17);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[CORapportTransport shortDescription](self, "shortDescription");
      objc_claimAutoreleasedReturnValue();
      -[CORapportTransport handleEventIdentifier:rapportRepresentation:options:].cold.4();
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4000, 0);
    v19 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v19;
    if (!v19)
    {
LABEL_15:
      if (v14)
      {
        if (v25[5])
          objc_msgSend(v14, "_setSendingConstituent:");
        objc_msgSend(v14, "_setRapportOptions:", v10);
      }
      COCoreLogForCategory(17);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        -[CORapportTransport shortDescription](self, "shortDescription");
        objc_claimAutoreleasedReturnValue();
        -[CORapportTransport handleEventIdentifier:rapportRepresentation:options:].cold.3();
      }

      if (-[CORapportTransport _validateSource:options:](self, "_validateSource:options:", v25[5], v10))
      {
        -[CORapportTransport delegate](self, "delegate");
        v21 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            -[NSObject transport:didReceiveCommand:](v21, "transport:didReceiveCommand:", self, v14);
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          COCoreLogForCategory(17);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            -[CORapportTransport shortDescription](self, "shortDescription");
            objc_claimAutoreleasedReturnValue();
            -[CORapportTransport handleEventIdentifier:rapportRepresentation:options:].cold.1();
          }

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4000, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject transport:didReceiveError:forCommand:](v21, "transport:didReceiveError:forCommand:", self, v15, 0);
          goto LABEL_32;
        }
      }
      else
      {
        COCoreLogForCategory(17);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          -[CORapportTransport shortDescription](self, "shortDescription");
          objc_claimAutoreleasedReturnValue();
          -[CORapportTransport handleEventIdentifier:rapportRepresentation:options:].cold.2();
        }
      }
      v15 = 0;
LABEL_32:

    }
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

}

void __74__CORapportTransport_handleEventIdentifier_rapportRepresentation_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CORapportTransport record](self, "record");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "record");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CORapportTransport record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (double)currentPingTimeout
{
  double v3;
  double v4;
  double v5;
  double result;

  -[CORapportTransport averageRequestTime](self, "averageRequestTime");
  v4 = ceil(v3 + v3);
  -[CORapportTransport minimumPingInterval](self, "minimumPingInterval");
  if (v4 < v5)
    v4 = v5;
  -[CORapportTransport maximumPingInterval](self, "maximumPingInterval");
  if (v4 < result)
    return v4;
  return result;
}

- (void)_commandPayloadFromRapportRepresentationWithValidation:(id)a3 result:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t, _QWORD);
  void *v8;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t, _QWORD))a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v8 = (void *)objc_opt_class();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __84__CORapportTransport__commandPayloadFromRapportRepresentationWithValidation_result___block_invoke;
  v9[3] = &unk_24D4B1120;
  v9[6] = &v20;
  v9[7] = &v10;
  v9[4] = self;
  v9[5] = &v14;
  objc_msgSend(v8, "_commandPayloadFromRapportRepresentation:result:", v6, v9);
  v7[2](v7, v15[5], v21[5], *((unsigned __int8 *)v11 + 24));
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
}

void __84__CORapportTransport__commandPayloadFromRapportRepresentationWithValidation_result___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_validateSource:options:", v12, 0);
}

+ (void)_commandPayloadFromRapportRepresentation:(id)a3 result:(id)a4
{
  void (**v5)(id, void *, id);
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v5 = (void (**)(id, void *, id))a4;
  objc_msgSend(v10, "objectForKey:", CFSTR("source"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("command"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      v6 = v9;
    }
    else
    {
      v9 = 0;
      v6 = v8;
    }
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v5[2](v5, v7, v9);

}

- (id)_serializedDataForCommand:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  COMeshNodeMessageCounter *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  id *v22;
  id *v23;
  void (*v24)(_QWORD *, __CFString *, _QWORD *);
  id v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void (*v31)(_QWORD *, __CFString *, _QWORD *);
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[3];
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];

  v4 = a3;
  -[CORapportTransport executionContext](self, "executionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDispatchQueue");

  v6 = (objc_class *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (class_getMethodImplementation(v6, sel_supportsSecureCoding)
      && class_getMethodImplementation(v6, sel_encodeWithCoder_))
    {
      COCoreLogForCategory(17);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[CORapportTransport _serializedDataForCommand:].cold.2();
    }
    else
    {
      COCoreLogForCategory(17);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[CORapportTransport _serializedDataForCommand:].cold.1(v6, v8);
    }

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDD0E18], 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  -[CORapportTransport counters](self, "counters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (COMeshNodeMessageCounter *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = objc_alloc_init(COMeshNodeMessageCounter);
    objc_msgSend(v10, "setObject:forKey:", v12, v11);
  }
  v13 = -[COMeshNodeMessageCounter count](v12, "count") + 1;
  v14 = objc_msgSend(v7, "length");
  -[CORapportTransport executionContext](self, "executionContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "analyticsRecorder");
  v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  v17 = -[COMeshNodeMessageCounter size](v12, "size");
  if (v13 > 0x3E7)
  {
    v33 = v4;
    v26 = (double)v17;
    -[CORapportTransport executionContext](self, "executionContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "label");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __48__CORapportTransport__serializedDataForCommand___block_invoke_2;
    v34[3] = &unk_24D4B1148;
    *(double *)&v36[1] = v26;
    v36[2] = v13;
    v23 = (id *)v36;
    v35 = v11;
    v36[0] = v28;
    v29 = v10;
    v30 = v7;
    v31 = (void (*)(_QWORD *, __CFString *, _QWORD *))v16[2];
    v25 = v28;
    v31(v16, CFSTR("com.apple.CoordinationCore.MeshNodeMessageSize"), v34);
    v7 = v30;
    v10 = v29;
    v22 = &v35;
    -[COMeshNodeMessageCounter setCount:](v12, "setCount:", 0);
    -[COMeshNodeMessageCounter setSize:](v12, "setSize:", 0);
    goto LABEL_15;
  }
  v18 = v14 / v13 + v17 - v17 / v13;
  -[COMeshNodeMessageCounter setCount:](v12, "setCount:", v13);
  -[COMeshNodeMessageCounter setSize:](v12, "setSize:", v18);
  HIDWORD(v19) = -1030792151 * (unsigned __int16)v13;
  LODWORD(v19) = HIDWORD(v19);
  if ((v19 >> 2) <= 0x28F5C28)
  {
    v33 = v4;
    -[CORapportTransport executionContext](self, "executionContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "label");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __48__CORapportTransport__serializedDataForCommand___block_invoke;
    v37[3] = &unk_24D4B1148;
    v39[1] = v18;
    v39[2] = v13;
    v22 = &v38;
    v23 = (id *)v39;
    v38 = v11;
    v39[0] = v21;
    v24 = (void (*)(_QWORD *, __CFString *, _QWORD *))v16[2];
    v25 = v21;
    v24(v16, CFSTR("com.apple.CoordinationCore.MeshNodeMessageSize"), v37);
LABEL_15:

    v4 = v33;
  }

  return v7;
}

id __48__CORapportTransport__serializedDataForCommand___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  v8[0] = 0x24D4B5658;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = 0x24D4B5618;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1[7]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1[4];
  v5 = a1[5];
  v9[1] = v3;
  v9[2] = v4;
  v8[2] = 0x24D4B5678;
  v8[3] = 0x24D4B5418;
  v9[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __48__CORapportTransport__serializedDataForCommand___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  v8[0] = 0x24D4B5658;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = 0x24D4B5618;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[1] = v3;
  v9[2] = v4;
  v8[2] = 0x24D4B5678;
  v8[3] = 0x24D4B5418;
  v9[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_eventIDForClass:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CORapportTransport executionContext](self, "executionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "meshName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromClass(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(".%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_validateSource:(id)a3 options:(id)a4
{
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  BOOL v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  NSObject *v23;
  __int16 v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CORapportTransport remote](self, "remote");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_5;
  -[CORapportTransport record](self, "record");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "IDSIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE7CD00]);
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    COCoreLogForCategory(17);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CORapportTransport _validateSource:options:].cold.1(self, v14);
    goto LABEL_15;
  }
  if ((-[NSObject isEqualToString:](v10, "isEqualToString:", v11) & 1) == 0)
  {
    COCoreLogForCategory(17);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[CORapportTransport shortDescription](self, "shortDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v19;
      v22 = 2112;
      v23 = v11;
      v24 = 2112;
      v25 = v10;
      _os_log_error_impl(&dword_215E92000, v14, OS_LOG_TYPE_ERROR, "%{public}@ validation failed. IDS ID received %@ does not match record %@", (uint8_t *)&v20, 0x20u);

    }
LABEL_15:

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", 0x24D4B5978, -5002, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CORapportTransport invalidateWithError:](self, "invalidateWithError:", v15);

LABEL_16:
    v12 = 0;
LABEL_17:

    goto LABEL_18;
  }

LABEL_5:
  if (!v6)
    goto LABEL_9;
  if (!v8)
  {
    COCoreLogForCategory(17);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[CORapportTransport shortDescription](self, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v18;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_215E92000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting remote %@", (uint8_t *)&v20, 0x16u);

    }
    -[CORapportTransport delegate](self, "delegate");
    v10 = objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NSObject transport:willUpdateRemoteConstituent:to:](v10, "transport:willUpdateRemoteConstituent:to:", self, 0, v6);
    -[CORapportTransport setRemote:](self, "setRemote:", v6);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NSObject transport:didUpdateRemoteConstituent:to:](v10, "transport:didUpdateRemoteConstituent:to:", self, 0, v6);
    v12 = 1;
    goto LABEL_17;
  }
  if ((-[NSObject isEqual:](v8, "isEqual:", v6) & 1) == 0)
  {
LABEL_9:
    COCoreLogForCategory(17);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[CORapportTransport shortDescription](self, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v13;
      v22 = 2114;
      v23 = v8;
      v24 = 2114;
      v25 = v6;
      _os_log_error_impl(&dword_215E92000, v10, OS_LOG_TYPE_ERROR, "%{public}@ validation failed. Remote = %{public}@ and source = %{public}@", (uint8_t *)&v20, 0x20u);

    }
    goto LABEL_16;
  }
  v12 = 1;
LABEL_18:

  return v12;
}

- (void)_registerHandlersOnClient
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  -[CORapportTransport client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __47__CORapportTransport__registerHandlersOnClient__block_invoke;
  v13[3] = &unk_24D4B0CD8;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v13);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __47__CORapportTransport__registerHandlersOnClient__block_invoke_138;
  v11[3] = &unk_24D4B0CD8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v11);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __47__CORapportTransport__registerHandlersOnClient__block_invoke_140;
  v9[3] = &unk_24D4B0CD8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setStateUpdatedHandler:", v9);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __47__CORapportTransport__registerHandlersOnClient__block_invoke_2_142;
  v7[3] = &unk_24D4B0CD8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setErrorFlagsChangedHandler:", v7);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __47__CORapportTransport__registerHandlersOnClient__block_invoke_2_144;
  v5[3] = &unk_24D4B0CD8;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "setDisconnectHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __47__CORapportTransport__registerHandlersOnClient__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "executionContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __47__CORapportTransport__registerHandlersOnClient__block_invoke_2;
    v4[3] = &unk_24D4B0C80;
    v4[4] = v2;
    objc_msgSend(v3, "dispatchAsync:", v4);

  }
}

void __47__CORapportTransport__registerHandlersOnClient__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  COCoreLogForCategory(17);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "shortDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ invalidated connection", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", 0x24D4B5978, -5003, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transport:didInvalidateWithError:", v5, v6);

  }
}

void __47__CORapportTransport__registerHandlersOnClient__block_invoke_138(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "executionContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __47__CORapportTransport__registerHandlersOnClient__block_invoke_2_139;
    v4[3] = &unk_24D4B0C80;
    v4[4] = v2;
    objc_msgSend(v3, "dispatchAsync:", v4);

  }
}

void __47__CORapportTransport__registerHandlersOnClient__block_invoke_2_139(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  COCoreLogForCategory(17);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "shortDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ interrupted connection", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", 0x24D4B5978, -5003, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transport:didInvalidateWithError:", v5, v6);

  }
}

void __47__CORapportTransport__registerHandlersOnClient__block_invoke_140(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    COCoreLogForCategory(17);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __47__CORapportTransport__registerHandlersOnClient__block_invoke_140_cold_1(WeakRetained);

    objc_msgSend(WeakRetained, "executionContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __47__CORapportTransport__registerHandlersOnClient__block_invoke_141;
    v4[3] = &unk_24D4B0C80;
    v4[4] = WeakRetained;
    objc_msgSend(v3, "dispatchAsync:", v4);

  }
}

uint64_t __47__CORapportTransport__registerHandlersOnClient__block_invoke_141(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRPStateUpdate");
}

void __47__CORapportTransport__registerHandlersOnClient__block_invoke_2_142(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    COCoreLogForCategory(17);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __47__CORapportTransport__registerHandlersOnClient__block_invoke_2_142_cold_1(WeakRetained);

    objc_msgSend(WeakRetained, "executionContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __47__CORapportTransport__registerHandlersOnClient__block_invoke_143;
    v4[3] = &unk_24D4B0C80;
    v4[4] = WeakRetained;
    objc_msgSend(v3, "dispatchAsync:", v4);

  }
}

uint64_t __47__CORapportTransport__registerHandlersOnClient__block_invoke_143(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRPErrorFlagsUpdate");
}

void __47__CORapportTransport__registerHandlersOnClient__block_invoke_2_144(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    COCoreLogForCategory(17);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __47__CORapportTransport__registerHandlersOnClient__block_invoke_2_144_cold_1(WeakRetained, v2);

    objc_msgSend(WeakRetained, "executionContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __47__CORapportTransport__registerHandlersOnClient__block_invoke_145;
    v4[3] = &unk_24D4B0C80;
    v4[4] = WeakRetained;
    objc_msgSend(v3, "dispatchAsync:", v4);

  }
}

uint64_t __47__CORapportTransport__registerHandlersOnClient__block_invoke_145(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDisconnect");
}

- (void)_handleRPStateUpdate
{
  void *v3;
  void *v4;
  int v5;

  -[CORapportTransport executionContext](self, "executionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertDispatchQueue");

  -[CORapportTransport client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "usingOnDemandConnection");

  if (v5)
    -[CORapportTransport _handleRPIsUsingOnDemandConnection](self, "_handleRPIsUsingOnDemandConnection");
}

- (void)_handleRPIsUsingOnDemandConnection
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[CORapportTransport executionContext](self, "executionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertDispatchQueue");

  COCoreLogForCategory(17);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[CORapportTransport shortDescription](self, "shortDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ link (IP) connected", (uint8_t *)&v8, 0xCu);

  }
  -[CORapportTransport clientIsUsingOnDemandConnection](self, "clientIsUsingOnDemandConnection");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    (*(void (**)(uint64_t))(v6 + 16))(v6);

}

- (void)_handleRPErrorFlagsUpdate
{
  void *v3;
  void *v4;
  __int16 v5;

  -[CORapportTransport executionContext](self, "executionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertDispatchQueue");

  -[CORapportTransport client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "errorFlags");

  if ((v5 & 0x200) != 0)
    -[CORapportTransport _handleDisconnect](self, "_handleDisconnect");
}

- (void)_handleDisconnect
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_215E92000, a2, v4, "%{public}@ link (IP) disconnected, triggering invalidation", v5);

  OUTLINED_FUNCTION_2();
}

- (void)pingWithCallback:(id)a3
{
  id v4;
  double v5;
  double v6;
  _COMeshControllerPing *v7;
  NSObject *v8;

  v4 = a3;
  -[CORapportTransport currentPingTimeout](self, "currentPingTimeout");
  v6 = v5;
  v7 = -[_COMeshControllerPing initWithTimeout:]([_COMeshControllerPing alloc], "initWithTimeout:", v5);
  COCoreLogForCategory(17);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CORapportTransport pingWithCallback:].cold.1(self, v8, v6);

  -[CORapportTransport sendRequest:withResponseHandler:](self, "sendRequest:withResponseHandler:", v7, v4);
}

- (COTransportDelegate)delegate
{
  return (COTransportDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSError)error
{
  return self->_error;
}

- (COExecutionContext)executionContext
{
  return self->_executionContext;
}

- (CODiscoveryRecordProtocol)record
{
  return self->_record;
}

- (double)minimumPingInterval
{
  return self->_minimumPingInterval;
}

- (void)setMinimumPingInterval:(double)a3
{
  self->_minimumPingInterval = a3;
}

- (double)maximumPingInterval
{
  return self->_maximumPingInterval;
}

- (void)setMaximumPingInterval:(double)a3
{
  self->_maximumPingInterval = a3;
}

- (COConstituent)remote
{
  return self->_remote;
}

- (void)setRemote:(id)a3
{
  objc_storeStrong((id *)&self->_remote, a3);
}

- (COCompanionLinkClientProtocol)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (unint64_t)requestCount
{
  return self->_requestCount;
}

- (void)setRequestCount:(unint64_t)a3
{
  self->_requestCount = a3;
}

- (double)averageRequestTime
{
  return self->_averageRequestTime;
}

- (void)setAverageRequestTime:(double)a3
{
  self->_averageRequestTime = a3;
}

- (id)clientIsUsingOnDemandConnection
{
  return self->_clientIsUsingOnDemandConnection;
}

- (void)setClientIsUsingOnDemandConnection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (OS_nw_activity)activity
{
  return self->_activity;
}

- (NSMutableDictionary)counters
{
  return self->_counters;
}

- (NSMapTable)sinks
{
  return self->_sinks;
}

- (NSMutableDictionary)commands
{
  return self->_commands;
}

- (NSMutableDictionary)registrationCompletions
{
  return self->_registrationCompletions;
}

- (id)activationHandler
{
  return self->_activationHandler;
}

- (void)setActivationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activationHandler, 0);
  objc_storeStrong((id *)&self->_registrationCompletions, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_sinks, 0);
  objc_storeStrong((id *)&self->_counters, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong(&self->_clientIsUsingOnDemandConnection, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_remote, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_executionContext, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __61__CORapportTransport_registerRequestForClass_withCompletion___block_invoke_2_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(*(id *)(v0 + 40), "sinks");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_10(&dword_215E92000, v2, v3, "%p request from unknown node with IDS %@. My sinks = %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

void __61__CORapportTransport_registerCommandForClass_withCompletion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 134218242;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_4(&dword_215E92000, a3, (uint64_t)a3, "%p command from unknown node with IDS %@", (uint8_t *)&v4);
}

void __56__CORapportTransport_sendCommand_withCompletionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  _os_log_debug_impl(&dword_215E92000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ sent %@ (%@)", v6, 0x20u);

  OUTLINED_FUNCTION_8();
}

- (void)_commandForIdentifier:(void *)a1 fromData:(NSObject *)a2 result:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_215E92000, a2, v4, "%{public}@ no request payload", v5);

  OUTLINED_FUNCTION_2();
}

- (void)handleRequestIdentifier:rapportRepresentation:options:responseHandler:at:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_215E92000, v3, (uint64_t)v3, "%{public}@ request failed source validation", v4);

  OUTLINED_FUNCTION_5_0();
}

- (void)handleRequestIdentifier:rapportRepresentation:options:responseHandler:at:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_9(&dword_215E92000, v6, v4, "%{public}@ received request %@", v5);

  OUTLINED_FUNCTION_5_0();
}

void __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  id *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_14();
  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*v2, "shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  v6 = 2112;
  v7 = v1;
  OUTLINED_FUNCTION_9(&dword_215E92000, v0, v4, "%{public}@ responding with %@", v5);

  OUTLINED_FUNCTION_11();
}

void __95__CORapportTransport_handleRequestIdentifier_rapportRepresentation_options_responseHandler_at___block_invoke_3_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_14();
  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(v1 + 40), "shortDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_4(&dword_215E92000, v0, v4, "%{public}@ response error (%@)", v5);

  OUTLINED_FUNCTION_11();
}

- (void)handleResponseToRequest:rapportRepresentation:options:error:responseHandler:at:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_4(&dword_215E92000, v6, v4, "%{public}@ missing source on request %@", v5);

  OUTLINED_FUNCTION_5_0();
}

- (void)handleResponseToRequest:rapportRepresentation:options:error:responseHandler:at:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_4(&dword_215E92000, v6, v4, "%{public}@ missing payload on request %@", v5);

  OUTLINED_FUNCTION_5_0();
}

- (void)handleResponseToRequest:rapportRepresentation:options:error:responseHandler:at:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_6_2();
  *(_DWORD *)v1 = 138543618;
  *(_QWORD *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2114;
  *(_QWORD *)(v1 + 14) = v3;
  OUTLINED_FUNCTION_4(&dword_215E92000, v5, v1, "%{public}@ response validation for request %{public}@ failed. Changing constituent", v4);

  OUTLINED_FUNCTION_5_0();
}

- (void)handleResponseToRequest:rapportRepresentation:options:error:responseHandler:at:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_4(&dword_215E92000, v6, v4, "%{public}@ bad response ID (%@)", v5);

  OUTLINED_FUNCTION_5_0();
}

void __101__CORapportTransport_handleResponseToRequest_rapportRepresentation_options_error_responseHandler_at___block_invoke_cold_1()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  OUTLINED_FUNCTION_16();
  v3 = v2;
  OUTLINED_FUNCTION_10(&dword_215E92000, v4, v5, "%{public}@ received %@ for %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_8();
}

- (void)_updateRequestTimesFromRapportRepresentation:(void *)a1 start:end:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_0(&dword_215E92000, v2, v3, "%{public}@ received (reset timings)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)handleEventIdentifier:rapportRepresentation:options:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_215E92000, v3, (uint64_t)v3, "%{public}@ did not produce command", v4);

  OUTLINED_FUNCTION_5_0();
}

- (void)handleEventIdentifier:rapportRepresentation:options:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_215E92000, v3, (uint64_t)v3, "%{public}@ command failed source validation", v4);

  OUTLINED_FUNCTION_5_0();
}

- (void)handleEventIdentifier:rapportRepresentation:options:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_9(&dword_215E92000, v6, v4, "%{public}@ received %@", v5);

  OUTLINED_FUNCTION_5_0();
}

- (void)handleEventIdentifier:rapportRepresentation:options:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_215E92000, v3, (uint64_t)v3, "%{public}@ missing source", v4);

  OUTLINED_FUNCTION_5_0();
}

- (void)handleEventIdentifier:rapportRepresentation:options:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_215E92000, v3, (uint64_t)v3, "%{public}@ no event payload", v4);

  OUTLINED_FUNCTION_5_0();
}

- (void)_serializedDataForCommand:(objc_class *)a1 .cold.1(objc_class *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  NSStringFromClass(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_15(&dword_215E92000, a2, v4, "%{public}@ does not appear to properly support secure coding which is required for all commands!", v5);

  OUTLINED_FUNCTION_2();
}

- (void)_serializedDataForCommand:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_15(&dword_215E92000, v0, v1, "Failed to properly archive for sending: %{public}@", v2);
}

- (void)_validateSource:(void *)a1 options:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_215E92000, a2, v4, "%{public}@ validation failed since we didn't receive a remote IDS ID", v5);

  OUTLINED_FUNCTION_2();
}

void __47__CORapportTransport__registerHandlersOnClient__block_invoke_140_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_0(&dword_215E92000, v2, v3, "%{public}@ link state updated", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __47__CORapportTransport__registerHandlersOnClient__block_invoke_2_142_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_0(&dword_215E92000, v2, v3, "%{public}@ link error flags updated", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __47__CORapportTransport__registerHandlersOnClient__block_invoke_2_144_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_215E92000, a2, v4, "%{public}@ link (IP) disconnected", v5);

  OUTLINED_FUNCTION_2();
}

- (void)pingWithCallback:(double)a3 .cold.1(void *a1, NSObject *a2, double a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  v8 = 2048;
  v9 = a3;
  OUTLINED_FUNCTION_9(&dword_215E92000, a2, v6, "%{public}@ sending ping (%g)", v7);

}

@end
