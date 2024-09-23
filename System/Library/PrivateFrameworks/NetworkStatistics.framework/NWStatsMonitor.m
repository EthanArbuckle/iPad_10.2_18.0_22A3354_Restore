@implementation NWStatsMonitor

- (id)bestIdentifierForUUID:(id)a3 EUUID:(id)a4 pid:(int)a5 epid:(int)a6 procname:(char *)a7 derivation:(int *)a8
{
  uint64_t v10;
  uint64_t v11;
  id v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSSet *appendProcNameSet;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSUInteger v27;
  NSSet *useNEHelperSet;
  void *v29;
  uint64_t v30;

  v10 = *(_QWORD *)&a6;
  v11 = *(_QWORD *)&a5;
  v14 = a3;
  v15 = a4;
  v30 = 0;
  -[NWStatsMonitor identifierForUUID:derivation:](self, "identifierForUUID:derivation:", v14, (char *)&v30 + 4);
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v16)
    goto LABEL_16;
  if (self->_useCoalitionIDs)
  {
    if (-[NWStatsEntityMapperCoalitionWatcher noteUUID:forPid:](self->_coalitionUUIDMapper, "noteUUID:forPid:", v14, v11))
    {
      -[NWStatsEntityMapperCoalitionWatcher identifierForUUID:derivation:](self->_coalitionUUIDMapper, "identifierForUUID:derivation:", v14, (char *)&v30 + 4);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v16)
        goto LABEL_16;
    }
  }
  -[NWStatsMonitor noteFailedLookupFor:processName:pid:](self, "noteFailedLookupFor:processName:pid:", v14, a7, v11);
  if (self->_useProcessNames)
  {
    v16 = 0;
    if (!a7)
      goto LABEL_15;
  }
  else
  {
    -[NWStatsEntityMapperProcessWatcher identifierForUUID:derivation:](self->_processWatcherUUIDMapper, "identifierForUUID:derivation:", v14, (char *)&v30 + 4);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!a7)
      goto LABEL_15;
  }
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17 && objc_msgSend(v17, "length"))
    {
      -[NWStatsEntityMapperProcessWatcher noteUUID:forProcessName:](self->_processWatcherUUIDMapper, "noteUUID:forProcessName:", v14, v18);
      -[NWStatsEntityMapperProcessWatcher identifierForUUID:derivation:](self->_processWatcherUUIDMapper, "identifierForUUID:derivation:", v14, (char *)&v30 + 4);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }

  }
LABEL_15:
  if (!v16)
  {
    HIDWORD(v30) = 0;
    v16 = CFSTR("UnknownProcess");
    if (!v15)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_16:
  if (!v15)
    goto LABEL_18;
LABEL_17:
  if ((objc_msgSend(v14, "isEqual:", v15) & 1) != 0)
    goto LABEL_18;
  -[NWStatsMonitor identifierForUUID:derivation:](self, "identifierForUUID:derivation:", v15, &v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    if ((_DWORD)v10 == (_DWORD)v11
      || !(_DWORD)v10
      || !self->_useCoalitionIDs
      || !-[NWStatsEntityMapperCoalitionWatcher noteUUID:forPid:](self->_coalitionUUIDMapper, "noteUUID:forPid:", v15, v10)|| (-[NWStatsEntityMapperCoalitionWatcher identifierForUUID:derivation:](self->_coalitionUUIDMapper, "identifierForUUID:derivation:", v15, &v30), (v20 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v21 = (_DWORD)v10 == (_DWORD)v11 ? 0 : v10;
      -[NWStatsMonitor noteFailedLookupFor:processName:pid:](self, "noteFailedLookupFor:processName:pid:", v14, 0, v21);
      -[NWStatsEntityMapperProcessWatcher identifierForUUID:derivation:](self->_processWatcherUUIDMapper, "identifierForUUID:derivation:", v15, &v30);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        v27 = -[NSSet count](self->_useNEHelperSet, "count");
        if (!a7
          || !v27
          || (useNEHelperSet = self->_useNEHelperSet,
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a7),
              v29 = (void *)objc_claimAutoreleasedReturnValue(),
              LODWORD(useNEHelperSet) = -[NSSet containsObject:](useNEHelperSet, "containsObject:", v29),
              v29,
              !(_DWORD)useNEHelperSet)
          || (-[NWStatsEntityMapperNEHelper identifierForUUID:derivation:](self->_neHelperUUIDMapper, "identifierForUUID:derivation:", v15, &v30), (v20 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
        {
LABEL_18:
          if (a8)
            *a8 = HIDWORD(v30);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_44;
        }
      }
    }
  }
  appendProcNameSet = self->_appendProcNameSet;
  if (appendProcNameSet)
  {
    v23 = -[NSSet count](appendProcNameSet, "count");
    if (a7)
    {
      if (v23)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a7);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24 && -[NSSet containsObject:](self->_appendProcNameSet, "containsObject:", v24))
        {
          objc_msgSend(v24, "stringByAppendingFormat:", CFSTR("/%@"), v20);
          v25 = objc_claimAutoreleasedReturnValue();

          v20 = (void *)v25;
          if (!v25)
            goto LABEL_18;
        }
        else
        {

        }
      }
    }
  }
  if (a8)
    *a8 = v30;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_44:
  return v19;
}

- (id)identifierForUUID:(id)a3 derivation:(int *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (!self->_useStaticMapping
    || (-[NWStatsEntityMapperStaticAssignment identifierForUUID:derivation:](self->_staticAssignmentUUIDMapper, "identifierForUUID:derivation:", v6, a4), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (!self->_useLaunchServices
      || (-[NWStatsEntityMapperDynamicLaunchServices identifierForUUID:derivation:](self->_dynamicLaunchServicesUUIDMapper, "identifierForUUID:derivation:", v6, a4), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (!self->_useNEHelper
        || (-[NWStatsEntityMapperNEHelper identifierForUUID:derivation:](self->_neHelperUUIDMapper, "identifierForUUID:derivation:", v6, a4), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        if (!self->_useCoalitionIDs
          || (-[NWStatsEntityMapperCoalitionWatcher identifierForUUID:derivation:](self->_coalitionUUIDMapper, "identifierForUUID:derivation:", v6, a4), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          if (self->_useProcessNames)
          {
            -[NWStatsEntityMapperProcessWatcher identifierForUUID:derivation:](self->_processWatcherUUIDMapper, "identifierForUUID:derivation:", v6, a4);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v7 = 0;
          }
        }
      }
    }
  }

  return v7;
}

- (BOOL)debugMode
{
  return self->_debugMode;
}

- (BOOL)currentForegroundStateForProcessWithPid:(int)a3
{
  NWAppStateHandler *appStateHandler;

  appStateHandler = self->_appStateHandler;
  if (appStateHandler)
    LOBYTE(appStateHandler) = -[NWAppStateHandler currentForegroundStateForProcessWithPid:](appStateHandler, "currentForegroundStateForProcessWithPid:", *(_QWORD *)&a3);
  return (char)appStateHandler;
}

- (void)noteFailedLookupFor:(id)a3 processName:(char *)a4 pid:(int)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (v8)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a4);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a5)
        pid_to_process_name(a5);
      else
        -[NWStatsEntityMapperProcessWatcher identifierForUUID:derivation:](self->_processWatcherUUIDMapper, "identifierForUUID:derivation:", v8, 0);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;
    if (!v9
      || (-[NSSet member:](self->_knownDaemonSet, "member:", v9),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          !v11))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_reportedLookupFailures, "objectForKeyedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = v12;
        objc_msgSend(v12, "timeIntervalSinceNow");
        if (v14 >= -900.0)
        {
LABEL_17:

          goto LABEL_18;
        }

      }
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_reportedLookupFailures, "setObject:forKeyedSubscript:", v15, v8);

      -[NWStatsEntityMapperCoalitionWatcher identifierForUUID:derivation:](self->_coalitionUUIDMapper, "identifierForUUID:derivation:", v8, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWStatsEntityMapperNEHelper identifierForUUID:derivation:](self->_neHelperUUIDMapper, "identifierForUUID:derivation:", v8, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NStatGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138544130;
        v20 = v8;
        v21 = 2114;
        v22 = v10;
        v23 = 2114;
        v24 = v16;
        v25 = 2114;
        v26 = v17;
        _os_log_impl(&dword_211429000, v18, OS_LOG_TYPE_DEFAULT, "Can't lookup UUID %{public}@ for procname %{public}@, coalition %{public}@ nehelper %{public}@", (uint8_t *)&v19, 0x2Au);
      }

      v13 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_18:

}

- (id)processNameForUUID:(id)a3
{
  return 0;
}

- (id)processNameForUUIDString:(id)a3
{
  return 0;
}

- (id)allIdentifiersForUUID:(id)a3 EUUID:(id)a4 pid:(int)a5 epid:(int)a6 procname:(char *)a7
{
  uint64_t v8;
  uint64_t v9;
  id v12;
  id v13;
  __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  const __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __CFString *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  _QWORD v38[10];
  _QWORD v39[12];

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v39[10] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  -[NWStatsEntityMapperDynamicLaunchServices identifierForUUID:derivation:](self->_dynamicLaunchServicesUUIDMapper, "identifierForUUID:derivation:", v12, 0);
  v33 = objc_claimAutoreleasedReturnValue();
  -[NWStatsEntityMapperCoalitionWatcher identifierForUUID:derivation:](self->_coalitionUUIDMapper, "identifierForUUID:derivation:", v12, 0);
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[NWStatsEntityMapperProcessWatcher identifierForUUID:derivation:](self->_processWatcherUUIDMapper, "identifierForUUID:derivation:", v12, 0);
  v15 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  -[NWStatsEntityMapperNEHelper identifierForUUID:derivation:](self->_neHelperUUIDMapper, "identifierForUUID:derivation:", v12, 0);
  v32 = objc_claimAutoreleasedReturnValue();
  -[NWStatsEntityMapperStaticAssignment identifierForUUID:derivation:](self->_staticAssignmentUUIDMapper, "identifierForUUID:derivation:", v12, 0);
  v31 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (v14)
      goto LABEL_11;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a7);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
    v15 = (const __CFString *)v16;
  else
    v15 = CFSTR("malformed-proc-name");
  -[NWStatsEntityMapperProcessWatcher noteUUID:forProcessName:](self->_processWatcherUUIDMapper, "noteUUID:forProcessName:", v12, v15);
  if (!v14)
  {
LABEL_8:
    if (-[NWStatsEntityMapperCoalitionWatcher noteUUID:forPid:](self->_coalitionUUIDMapper, "noteUUID:forPid:", v12, v9))
    {
      -[NWStatsEntityMapperCoalitionWatcher identifierForUUID:derivation:](self->_coalitionUUIDMapper, "identifierForUUID:derivation:", v12, 0);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }
LABEL_11:
  v36 = v13;
  v37 = v12;
  v35 = (__CFString *)v15;
  if (v13 && (objc_msgSend(v12, "isEqual:", v13) & 1) == 0)
  {
    v29 = v9;
    -[NWStatsEntityMapperDynamicLaunchServices identifierForUUID:derivation:](self->_dynamicLaunchServicesUUIDMapper, "identifierForUUID:derivation:", v13, 0);
    v30 = objc_claimAutoreleasedReturnValue();
    -[NWStatsEntityMapperCoalitionWatcher identifierForUUID:derivation:](self->_coalitionUUIDMapper, "identifierForUUID:derivation:", v13, 0);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[NWStatsEntityMapperNEHelper identifierForUUID:derivation:](self->_neHelperUUIDMapper, "identifierForUUID:derivation:", v13, 0);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[NWStatsEntityMapperProcessWatcher identifierForUUID:derivation:](self->_processWatcherUUIDMapper, "identifierForUUID:derivation:", v13, 0);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[NWStatsEntityMapperStaticAssignment identifierForUUID:derivation:](self->_staticAssignmentUUIDMapper, "identifierForUUID:derivation:", v13, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v8 && !v18)
    {
      if ((_DWORD)v8 == v29
        || !-[NWStatsEntityMapperCoalitionWatcher noteUUID:forPid:](self->_coalitionUUIDMapper, "noteUUID:forPid:", v13, v8))
      {
        v18 = 0;
      }
      else
      {
        -[NWStatsEntityMapperCoalitionWatcher identifierForUUID:derivation:](self->_coalitionUUIDMapper, "identifierForUUID:derivation:", v13, 0);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    v17 = (__CFString *)v30;
  }
  else
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
  }
  if (v33)
    v22 = (const __CFString *)v33;
  else
    v22 = CFSTR("nil-Core-UUID");
  v34 = (__CFString *)v22;
  if (!v14)
    v14 = CFSTR("nil-Coal-UUID");
  if (v32)
    v23 = (__CFString *)v32;
  else
    v23 = CFSTR("nil-NE-UUID");
  if (v31)
    v24 = (__CFString *)v31;
  else
    v24 = CFSTR("nil-static-UUID");
  v38[0] = CFSTR("kNWStatsLookupUUIDCoreServices");
  v38[1] = CFSTR("kNWStatsLookupUUIDStatic");
  if (v17)
    v25 = v17;
  else
    v25 = CFSTR("nil-Core-EUUID");
  v39[0] = v22;
  v39[1] = v24;
  v38[2] = CFSTR("kNWStatsLookupUUIDNEHelper");
  v38[3] = CFSTR("kNWStatsLookupUUIDCoalitionID");
  v39[2] = v23;
  v39[3] = v14;
  v38[4] = CFSTR("kNWStatsLookupUUIDProcessName");
  v38[5] = CFSTR("kNWStatsLookupEUUIDCoreServices");
  if (!v18)
    v18 = CFSTR("nil-Coal-EUUID");
  v39[4] = v35;
  v39[5] = v25;
  v38[6] = CFSTR("kNWStatsLookupEUUIDStatic");
  v38[7] = CFSTR("kNWStatsLookupEUUIDNEHelper");
  if (!v19)
    v19 = CFSTR("nil-NE-EUUID");
  if (!v20)
    v20 = CFSTR("nil-Proc-EUUID");
  if (v21)
    v26 = (__CFString *)v21;
  else
    v26 = CFSTR("nil-static-EUUID");
  v39[6] = v26;
  v39[7] = v19;
  v38[8] = CFSTR("kNWStatsLookupEUUIDCoalitionID");
  v38[9] = CFSTR("kNWStatsLookupEUUIDProcessName");
  v39[8] = v18;
  v39[9] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)extensionNameForUUID:(id)a3
{
  void *v3;

  if (self->_useLaunchServices)
  {
    -[NWStatsEntityMapperDynamicLaunchServices extensionNameForUUID:](self->_dynamicLaunchServicesUUIDMapper, "extensionNameForUUID:", a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)configure:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  NSSet *v9;
  NSSet *useNEHelperSet;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  NSSet *v15;
  NSObject *p_super;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NWStatsAppEventListener *v33;
  NWStatsAppEventListener *appEventListener;
  NWAppStateHandler *v35;
  NWAppStateHandler *appStateHandler;
  NWAppStateHandler *v37;
  NWStatsAppEventListener *v38;
  NWAppStateHandler *v39;
  uint8_t v40[16];
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterMappingUseNEHelper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    self->_useNEHelper = 1;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterMappingUseNEHelperForSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterMappingUseNEHelperForSet"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterMappingUseNEHelperForSet"));
      v9 = (NSSet *)objc_claimAutoreleasedReturnValue();
      useNEHelperSet = self->_useNEHelperSet;
      self->_useNEHelperSet = v9;

    }
    else
    {
      NStatGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211429000, v11, OS_LOG_TYPE_ERROR, "Configuration Parameters for UseNEHelperForSet not a set", buf, 2u);
      }

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterMappingUseProcessPrefixForSet"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterMappingUseProcessPrefixForSet"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v14 = objc_opt_isKindOfClass();

    if ((v14 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterMappingUseProcessPrefixForSet"));
      v15 = (NSSet *)objc_claimAutoreleasedReturnValue();
      p_super = &self->_appendProcNameSet->super;
      self->_appendProcNameSet = v15;
    }
    else
    {
      NStatGetLog();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v40 = 0;
        _os_log_impl(&dword_211429000, p_super, OS_LOG_TYPE_ERROR, "Configuration Parameters for UseProcessPrefixForSet not a set", v40, 2u);
      }
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterMappingUseCoalitions"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterMappingUseCoalitions"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");
    self->_useCoalitionIDs = v19;
    self->_useProcessNames = v19 ^ 1;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterMappingCheckStaticAssignments"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterMappingCheckStaticAssignments"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    self->_useStaticMapping = objc_msgSend(v21, "BOOLValue");

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterMappingAvoidCoalitions"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterMappingAvoidCoalitions"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLValue");
    self->_useCoalitionIDs = v24 ^ 1;
    self->_useProcessNames = v24;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterMappingAvoidLaunchServices"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterMappingAvoidLaunchServices"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    self->_useLaunchServices = objc_msgSend(v26, "BOOLValue") ^ 1;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterMappingDebugMode"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterMappingDebugMode"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    self->_debugMode = objc_msgSend(v28, "BOOLValue");

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterMappingCanonicalizeProcessNames"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterMappingCanonicalizeProcessNames"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatsEntityMapperProcessWatcher setCanonicalizedNames:](self->_processWatcherUUIDMapper, "setCanonicalizedNames:", objc_msgSend(v30, "BOOLValue"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterMappingAppStateMonitoring"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterMappingAppStateMonitoring"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "BOOLValue"))
    {
      if (!self->_appEventListener)
      {
        v33 = -[NWStatsAppEventListener initWithQueue:]([NWStatsAppEventListener alloc], "initWithQueue:", self->_queue);
        appEventListener = self->_appEventListener;
        self->_appEventListener = v33;

      }
      if (self->_appStateHandler)
        goto LABEL_37;
      v35 = objc_alloc_init(NWAppStateHandler);
      appStateHandler = self->_appStateHandler;
      self->_appStateHandler = v35;

      v37 = self->_appStateHandler;
      if (!v37)
        goto LABEL_37;
      v38 = self->_appEventListener;
      if (!v38)
        goto LABEL_37;
    }
    else
    {
      v39 = self->_appStateHandler;
      self->_appStateHandler = 0;

      v38 = self->_appEventListener;
      v37 = 0;
    }
    -[NWStatsAppEventListener setAppStateDelegate:](v38, "setAppStateDelegate:", v37);
LABEL_37:

  }
}

- (id)stateDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NWStatsEntityMapperDynamicLaunchServices stateDictionary](self->_dynamicLaunchServicesUUIDMapper, "stateDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("DynLSMapper"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("DynLSMapper"));

  }
  -[NWStatsEntityMapperProcessWatcher stateDictionary](self->_processWatcherUUIDMapper, "stateDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ProcMapper"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ProcMapper"));

  }
  return v3;
}

- (NWStatsMonitor)initWithQueue:(id)a3
{
  id v5;
  NWStatsMonitor *v6;
  NWStatsEntityMapperStaticAssignment *v7;
  NWStatsEntityMapperStaticAssignment *staticAssignmentUUIDMapper;
  NWStatsEntityMapperNEHelper *v9;
  NWStatsEntityMapperNEHelper *neHelperUUIDMapper;
  NWStatsEntityMapperDynamicLaunchServices *v11;
  NWStatsEntityMapperDynamicLaunchServices *dynamicLaunchServicesUUIDMapper;
  NWStatsEntityMapperProcessWatcher *v13;
  NWStatsEntityMapperProcessWatcher *processWatcherUUIDMapper;
  uint64_t v15;
  NSSet *knownDaemonSet;
  NSMutableDictionary *v17;
  NSMutableDictionary *reportedLookupFailures;
  NWStatsEntityMapperCoalitionWatcher *v19;
  NWStatsEntityMapperCoalitionWatcher *coalitionUUIDMapper;
  uint64_t v21;
  NSSet *useNEHelperSet;
  NSSet *appendProcNameSet;
  NWStatsMonitor *v24;
  NSObject *v25;
  uint8_t buf[16];
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)NWStatsMonitor;
  v6 = -[NWStatsMonitor init](&v28, sel_init);
  if (!v6)
    goto LABEL_7;
  v7 = objc_alloc_init(NWStatsEntityMapperStaticAssignment);
  staticAssignmentUUIDMapper = v6->_staticAssignmentUUIDMapper;
  v6->_staticAssignmentUUIDMapper = v7;

  v9 = objc_alloc_init(NWStatsEntityMapperNEHelper);
  neHelperUUIDMapper = v6->_neHelperUUIDMapper;
  v6->_neHelperUUIDMapper = v9;

  v11 = objc_alloc_init(NWStatsEntityMapperDynamicLaunchServices);
  dynamicLaunchServicesUUIDMapper = v6->_dynamicLaunchServicesUUIDMapper;
  v6->_dynamicLaunchServicesUUIDMapper = v11;

  v13 = objc_alloc_init(NWStatsEntityMapperProcessWatcher);
  processWatcherUUIDMapper = v6->_processWatcherUUIDMapper;
  v6->_processWatcherUUIDMapper = v13;

  if (v6->_staticAssignmentUUIDMapper
    && v6->_neHelperUUIDMapper
    && v6->_dynamicLaunchServicesUUIDMapper
    && v6->_processWatcherUUIDMapper)
  {
    *(_WORD *)&v6->_useCoalitionIDs = 256;
    objc_storeStrong((id *)&v6->_queue, a3);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", &unk_24CBE27E8);
    knownDaemonSet = v6->_knownDaemonSet;
    v6->_knownDaemonSet = (NSSet *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    reportedLookupFailures = v6->_reportedLookupFailures;
    v6->_reportedLookupFailures = v17;

    v19 = objc_alloc_init(NWStatsEntityMapperCoalitionWatcher);
    coalitionUUIDMapper = v6->_coalitionUUIDMapper;
    v6->_coalitionUUIDMapper = v19;

    v6->_useStaticMapping = 1;
    *(_WORD *)&v6->_useNEHelper = 256;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("nsurlsessiond"), 0);
    v21 = objc_claimAutoreleasedReturnValue();
    useNEHelperSet = v6->_useNEHelperSet;
    v6->_useNEHelperSet = (NSSet *)v21;

    appendProcNameSet = v6->_appendProcNameSet;
    v6->_appendProcNameSet = 0;

    v6->_debugMode = 0;
LABEL_7:
    v24 = v6;
    goto LABEL_11;
  }
  NStatGetLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211429000, v25, OS_LOG_TYPE_ERROR, "Cannot initialize all UUID mappers", buf, 2u);
  }

  v24 = 0;
LABEL_11:

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_appStateHandler, 0);
  objc_storeStrong((id *)&self->_appEventListener, 0);
  objc_storeStrong((id *)&self->_reportedLookupFailures, 0);
  objc_storeStrong((id *)&self->_knownDaemonSet, 0);
  objc_storeStrong((id *)&self->_appendProcNameSet, 0);
  objc_storeStrong((id *)&self->_useNEHelperSet, 0);
  objc_storeStrong((id *)&self->_processWatcherUUIDMapper, 0);
  objc_storeStrong((id *)&self->_dynamicLaunchServicesUUIDMapper, 0);
  objc_storeStrong((id *)&self->_neHelperUUIDMapper, 0);
  objc_storeStrong((id *)&self->_staticAssignmentUUIDMapper, 0);
  objc_storeStrong((id *)&self->_coalitionUUIDMapper, 0);
}

@end
