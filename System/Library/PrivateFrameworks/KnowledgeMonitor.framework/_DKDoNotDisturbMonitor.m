@implementation _DKDoNotDisturbMonitor

+ (id)eventStream
{
  return CFSTR("DoNotDisturb");
}

+ (id)_eventWithState:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
    objc_msgSend(MEMORY[0x24BE1B048], "yes");
  else
    objc_msgSend(MEMORY[0x24BE1B048], "no");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BE1B080];
  objc_msgSend(MEMORY[0x24BE1B130], "doNotDisturbStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventWithStream:startDate:endDate:value:", v5, v6, v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[3];
  _QWORD v48[3];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v42 = v4;
  objc_msgSend(v4, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeModeAssertionMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  v9 = 0x24BE1B000uLL;
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v44 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        v14 = (void *)objc_opt_new();
        objc_msgSend(v13, "modeIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v13, "modeIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v9 + 384), "modeIdentifier");
          v17 = v9;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v16, v18);

          v9 = v17;
        }
        objc_msgSend(v13, "activeDateInterval");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v13, "activeDateInterval");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v9 + 384), "activeDateInterval");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v20, v21);

        }
        objc_msgSend(v5, "addObject:", v14);

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(v9 + 384), "doNotDisturbState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v22;
  v23 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v42, "state");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "numberWithBool:", objc_msgSend(v24, "isActive"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v25;
  objc_msgSend(*(id *)(v9 + 384), "doNotDisturbUpdateReason");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v26;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v42, "reason"));
  v27 = v9;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v28;
  objc_msgSend(*(id *)(v27 + 384), "doNotDisturbStateMetadataArray");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v29;
  v48[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v27 + 384), "keyPathForDoNotDisturbStatusDataDictionary");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, v32);

  v33 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v42, "state");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "numberWithBool:", objc_msgSend(v34, "isActive"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v27 + 384), "keyPathForDoNotDisturbStatus");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v35, v37);

  v38 = (void *)objc_opt_class();
  objc_msgSend(v42, "state");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "_eventWithState:", objc_msgSend(v39, "isActive"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKMonitor setCurrentEvent:inferHistoricalState:](self, "setCurrentEvent:inferHistoricalState:", v40, 1);

}

- (void)start
{
  DNDStateService *v3;
  DNDStateService *dndStateService;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_DKDoNotDisturbMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v5, sel_instantMonitorNeedsActivation))
  {
    objc_msgSend(MEMORY[0x24BE2D738], "serviceForClientIdentifier:", CFSTR("com.apple.duet.knowledge"));
    v3 = (DNDStateService *)objc_claimAutoreleasedReturnValue();
    dndStateService = self->_dndStateService;
    self->_dndStateService = v3;

    -[DNDStateService addStateUpdateListener:withCompletionHandler:](self->_dndStateService, "addStateUpdateListener:withCompletionHandler:", self, &__block_literal_global_2);
  }
}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKDoNotDisturbMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
    -[DNDStateService removeStateUpdateListener:](self->_dndStateService, "removeStateUpdateListener:", self);
}

- (DNDStateService)dndStateService
{
  return self->_dndStateService;
}

- (void)setDndStateService:(id)a3
{
  objc_storeStrong((id *)&self->_dndStateService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dndStateService, 0);
}

@end
