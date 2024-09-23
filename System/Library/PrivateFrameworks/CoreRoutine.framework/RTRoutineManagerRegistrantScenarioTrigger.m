@implementation RTRoutineManagerRegistrantScenarioTrigger

- (RTRoutineManagerRegistrantScenarioTrigger)init
{
  RTRoutineManagerRegistrantScenarioTrigger *v2;
  uint64_t v3;
  NSMutableDictionary *scenarioTriggerHandlers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTRoutineManagerRegistrantScenarioTrigger;
  v2 = -[RTRoutineManagerRegistrantScenarioTrigger init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    scenarioTriggerHandlers = v2->__scenarioTriggerHandlers;
    v2->__scenarioTriggerHandlers = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (BOOL)registered
{
  return self->_registered;
}

- (id)startMonitoringForScenarioTriggerTypes:(unint64_t)a3 handler:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *scenarioTriggerHandlers;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    while (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3 & -(uint64_t)a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      scenarioTriggerHandlers = self->__scenarioTriggerHandlers;
      v9 = (void *)MEMORY[0x1A85B6C24](v6);
      -[NSMutableDictionary setObject:forKey:](scenarioTriggerHandlers, "setObject:forKey:", v9, v7);

      self->_monitoredScenarioTriggerTypes |= a3 & -(uint64_t)a3;
      a3 &= a3 - 1;

    }
    v12 = 0;
    self->_registered = self->_monitoredScenarioTriggerTypes != 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D50];
    v15[0] = CFSTR("Invalid parameter value for handler.  Requires non-nil value.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("RTErrorDomain"), 7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)stopMonitoringForScenarioTriggerTypes:(unint64_t)a3
{
  unint64_t v4;
  void *v5;

  if (a3)
  {
    v4 = a3;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4 & -(uint64_t)v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](self->__scenarioTriggerHandlers, "removeObjectForKey:", v5);
      self->_monitoredScenarioTriggerTypes &= ~(v4 & -(uint64_t)v4);
      v4 &= v4 - 1;

    }
    while (v4);
  }
  self->_registered = self->_monitoredScenarioTriggerTypes != 0;
  return 0;
}

- (void)onScenarioTriggers:(id)a3 error:(id)a4
{
  id v7;
  unint64_t monitoredScenarioTriggerTypes;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v28 = a4;
  monitoredScenarioTriggerTypes = self->_monitoredScenarioTriggerTypes;
  v9 = (void *)objc_opt_new();
  while (monitoredScenarioTriggerTypes)
  {
    +[RTScenarioTrigger scenarioTriggerTypeToString:](RTScenarioTrigger, "scenarioTriggerTypeToString:", monitoredScenarioTriggerTypes & -(uint64_t)monitoredScenarioTriggerTypes);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v9, "addObject:", v10);
    monitoredScenarioTriggerTypes &= monitoredScenarioTriggerTypes - 1;

  }
  _rt_log_facility_get_os_log(RTLogFacilityFramework);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_registered)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
    v14 = v9;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v35 = v12;
    v36 = 2112;
    v37 = v13;
    v38 = 2112;
    v39 = v15;
    v40 = 2112;
    v41 = v7;
    v42 = 2112;
    v43 = v28;
    _os_log_impl(&dword_1A5E26000, v11, OS_LOG_TYPE_INFO, "%@, registered, %@, monitoredScenarioTriggerTypes, %@, scenarioTriggers, %@, error, %@", buf, 0x34u);

    v9 = v14;
  }

  if (self->_registered)
  {
    v26 = v9;
    v27 = v7;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = v7;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v22 = self->_monitoredScenarioTriggerTypes;
          if ((objc_msgSend(v21, "type") & v22) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "type"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKey:](self->__scenarioTriggerHandlers, "objectForKey:", v23);
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = (void *)v24;
            if (v24)
              (*(void (**)(uint64_t, void *, id))(v24 + 16))(v24, v21, v28);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v18);
    }

    v9 = v26;
    v7 = v27;
  }

}

- (NSDictionary)scenarioTriggerHandlers
{
  return &self->__scenarioTriggerHandlers->super;
}

- (unint64_t)monitoredScenarioTriggerTypes
{
  return self->_monitoredScenarioTriggerTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__scenarioTriggerHandlers, 0);
}

@end
