@implementation DTKPCPUCounterAllocator

- (DTKPCPUCounterAllocator)initWithCPU:(id)a3 error:(id *)a4
{
  id v7;
  DTKPCPUCounterAllocator *v8;
  DTKPCPUCounterAllocator *v9;
  id *p_cpu;
  uint64_t v11;
  NSMutableArray *eventRecords;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *pmiEvent;
  objc_super v31;

  v7 = a3;
  v31.receiver = self;
  v31.super_class = (Class)DTKPCPUCounterAllocator;
  v8 = -[DTKPCPUCounterAllocator init](&v31, sel_init);
  v9 = v8;
  if (v8)
  {
    if (!v7)
      sub_222BC7410();
    p_cpu = (id *)&v8->_cpu;
    objc_storeStrong((id *)&v8->_cpu, a3);
    v11 = objc_opt_new();
    eventRecords = v9->_eventRecords;
    v9->_eventRecords = (NSMutableArray *)v11;

    -[DTKPCPU kpepDB](v9->_cpu, "kpepDB");
    v13 = kpep_config_create();
    if ((_DWORD)v13)
    {
      v14 = v13;
      v15 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*p_cpu, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("Failed to create a kpep config for %@: %d"), v16, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a4, 4294967289, v17);

    }
    else
    {
      v18 = kpep_config_force_counters();
      if ((_DWORD)v18)
      {
        v19 = v18;
        v20 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(*p_cpu, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("Failed to force on all counters for %@: %d"), v21, v19);
      }
      else
      {
        v9->_fixedCounterCount = 0;
        -[DTKPCPU kpepDB](v9->_cpu, "kpepDB");
        v22 = kpep_db_counters_count();
        if ((_DWORD)v22)
        {
          v23 = v22;
          v24 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(*p_cpu, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringWithFormat:", CFSTR("Failed to get fixed counter count for %@: %d"), v21, v23);
        }
        else
        {
          v9->_configurableCounterCount = 0;
          -[DTKPCPU kpepDB](v9->_cpu, "kpepDB");
          v25 = kpep_db_counters_count();
          if (!(_DWORD)v25)
          {
            pmiEvent = v9->_pmiEvent;
            v9->_eventsUniqueIds = 0;
            v9->_pmiEvent = 0;
            goto LABEL_13;
          }
          v26 = v25;
          v27 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(*p_cpu, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringWithFormat:", CFSTR("Failed to get configurable counter count for %@: %d"), v21, v26);
        }
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a4, 4294967289, v28);

      kpep_config_free();
      v9->_kpepConfig = 0;
    }
    pmiEvent = v9;
    v9 = 0;
LABEL_13:

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_kpepConfig)
  {
    kpep_config_free();
    self->_kpepConfig = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)DTKPCPUCounterAllocator;
  -[DTKPCPUCounterAllocator dealloc](&v3, sel_dealloc);
}

- (unint64_t)_hardwareEventCount
{
  return self->_eventsUniqueIds;
}

- (unsigned)_getCurrentClasses:(id *)a3
{
  uint64_t v4;
  void *v5;
  unsigned int v6;

  v4 = kpep_config_kpc_classes();
  if (!(_DWORD)v4)
    return 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to access kpc_classes: %d"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -1;
  DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a3, 0xFFFFFFFFLL, v5);

  return v6;
}

- (unint64_t)_counterIndexForEvent:(id)a3 absolute:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  char v16;
  id v17;
  id v18[2];

  v6 = a4;
  v18[1] = *(id *)MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (!v8)
    sub_222BC7438();
  v9 = v8;
  v10 = objc_msgSend(v8, "hwIdx");
  v11 = (char *)v18
      - ((8 * -[DTKPCPUCounterAllocator _hardwareEventCount](self, "_hardwareEventCount") + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = kpep_config_kpc_map();
  if ((_DWORD)v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to access kpc_map: %d"), v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a5, 0xFFFFFFFFLL, v13);
  }
  else
  {
    v14 = *(_QWORD *)&v11[8 * v10];
    if (!v6)
      goto LABEL_6;
    v18[0] = 0;
    v16 = -[DTKPCPUCounterAllocator _getCurrentClasses:](self, "_getCurrentClasses:", v18);
    v17 = v18[0];
    v13 = v17;
    if (!v17)
    {
      if ((v16 & 1) == 0)
        v14 += self->_fixedCounterCount;
      goto LABEL_5;
    }
    if (a5)
    {
      v13 = objc_retainAutorelease(v17);
      *a5 = v13;
    }
  }
  v14 = -1;
LABEL_5:

LABEL_6:
  return v14;
}

- (id)_counterNameForEvent:(id)a3 error:(id *)a4
{
  unint64_t v5;
  __CFString *v6;

  v5 = -[DTKPCPUCounterAllocator _counterIndexForEvent:absolute:error:](self, "_counterIndexForEvent:absolute:error:", a3, 1, a4);
  if (v5 == -1)
  {
    if (a4 && *a4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_222BC7460(a4);
    v6 = CFSTR("PMC<X>");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PMC%zu"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)_eventExists:(id)a3 eventOut:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSMutableArray *eventRecords;
  BOOL v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  -[DTKPCPU eventFromNameOrAlias:](self->_cpu, "eventFromNameOrAlias:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = sub_222B8C45C;
    v20 = sub_222B8C46C;
    v21 = 0;
    eventRecords = self->_eventRecords;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_222B8C474;
    v12[3] = &unk_24EB2ABB8;
    v13 = v7;
    v14 = &v22;
    v15 = &v16;
    -[NSMutableArray enumerateObjectsUsingBlock:](eventRecords, "enumerateObjectsUsingBlock:", v12);
    if (a4)
      *a4 = objc_retainAutorelease((id)v17[5]);
    v10 = *((_BYTE *)v23 + 24) != 0;

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_matchesPMIEvent:(id)a3
{
  id v4;
  DTKPCPUCounterAllocatorRecord *pmiEvent;
  void *v6;
  char v7;
  void *v8;

  v4 = a3;
  pmiEvent = self->_pmiEvent;
  if (pmiEvent)
  {
    -[DTKPCPUCounterAllocatorRecord eventOrAliasName](pmiEvent, "eventOrAliasName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", v4) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      -[DTKPCPUCounterAllocatorRecord eventName](self->_pmiEvent, "eventName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isEqualToString:", v4);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int)_setErrorFromKpepError:(int)a3 eventName:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = kpep_strerror();
  if (v7)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error for event %@: %s"), v7, v8);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (a5)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD0FC8];
    v16[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("DTKPCPUCounterAllocator"), -1, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  switch(a3)
  {
    case 11:
      v13 = -801;
      break;
    case 12:
      v13 = -804;
      break;
    case 13:
      v13 = -805;
      break;
    case 14:
      v13 = -806;
      break;
    default:
      if (a3 == 1)
        v13 = -4;
      else
        v13 = -1;
      break;
  }

  return v13;
}

- (int)setPMIEventName:(id)a3 pmiThreshold:(unint64_t)a4 error:(id *)a5
{
  id v8;
  DTKPCPUCounterAllocatorRecord *pmiEvent;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  DTKPCPUCounterAllocatorRecord *v25;
  void *v26;
  DTKPCPUCounterAllocatorRecord *v27;
  DTKPCPUCounterAllocatorRecord *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  DTKPCPUCounterAllocator *v35;
  id *v36;
  id v37;

  v8 = a3;
  pmiEvent = self->_pmiEvent;
  if (!pmiEvent)
  {
    v37 = 0;
    v14 = -[DTKPCPUCounterAllocator _eventExists:eventOut:](self, "_eventExists:eventOut:", v8, &v37);
    v15 = v37;
    v16 = v15;
    if (v14)
    {
      objc_msgSend(v15, "hwIdx");
      v17 = kpep_config_remove_event();
      if ((_DWORD)v17)
      {
        v13 = -[DTKPCPUCounterAllocator _setErrorFromKpepError:eventName:error:](self, "_setErrorFromKpepError:eventName:error:", v17, v8, a5);
LABEL_17:

        goto LABEL_18;
      }
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = sub_222B8CAAC;
      v33[3] = &unk_24EB2ABE0;
      v34 = v16;
      v35 = self;
      v36 = a5;
      -[DTKPCPUCounterAllocator enumerateAllocatedPMCs:](self, "enumerateAllocatedPMCs:", v33);
      --self->_eventsUniqueIds;

    }
    -[DTKPCPU eventFromNameOrAlias:](self->_cpu, "eventFromNameOrAlias:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      if (!objc_msgSend(v18, "kpepEvent"))
        sub_222BC74F8();
      v32 = objc_msgSend(v19, "kpepEvent");
      v20 = kpep_config_add_event_trigger();
      if ((_DWORD)v20)
      {
        v21 = v20;
        objc_msgSend(v19, "aliasOrName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[DTKPCPUCounterAllocator _setErrorFromKpepError:eventName:error:](self, "_setErrorFromKpepError:eventName:error:", v21, v22, a5);

      }
      else
      {
        if (kpep_event_name())
          sub_222BC7520();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = [DTKPCPUCounterAllocatorRecord alloc];
        objc_msgSend(v19, "aliasOrName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        ++self->_eventsUniqueIds;
        v27 = -[DTKPCPUCounterAllocatorRecord initWithName:nameOrAlias:counterName:kpepEvent:isPMI:hwIdx:](v25, "initWithName:nameOrAlias:counterName:kpepEvent:isPMI:hwIdx:", v24, v26, CFSTR("TBD"), v32, 1);
        v28 = self->_pmiEvent;
        self->_pmiEvent = v27;

        -[DTKPCPUCounterAllocator _counterNameForEvent:error:](self, "_counterNameForEvent:error:", self->_pmiEvent, a5);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[DTKPCPUCounterAllocatorRecord setCounterName:](self->_pmiEvent, "setCounterName:", v29);

        self->_pmiThreshold = a4;
        if (v14)
        {
          objc_msgSend(v16, "setHwIdx:", -[DTKPCPUCounterAllocatorRecord hwIdx](self->_pmiEvent, "hwIdx"));
          -[DTKPCPUCounterAllocatorRecord counterName](self->_pmiEvent, "counterName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setCounterName:", v30);

          objc_msgSend(v16, "setKpepEvent:", 0);
        }

        v13 = 0;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Event not found: %@'"), v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a5, 4294966495, v23);

    }
    goto LABEL_17;
  }
  v10 = (void *)MEMORY[0x24BDD17C8];
  -[DTKPCPUCounterAllocatorRecord eventOrAliasName](pmiEvent, "eventOrAliasName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("Cannot changed the allocated PMI event from '%@' to '%@'"), v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a5, 4294966493, v12);

LABEL_18:
  return v13;
}

- (int)addPMCEventName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  NSMutableArray *eventRecords;
  DTKPCPUCounterAllocatorRecord *v10;
  void *v11;
  void *v12;
  DTKPCPUCounterAllocatorRecord *v13;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  DTKPCPUCounterAllocatorRecord *v23;
  void *v24;
  DTKPCPUCounterAllocatorRecord *v25;
  void *v26;
  void *v27;
  uint64_t v28;

  v6 = a3;
  if (-[DTKPCPUCounterAllocator _eventExists:eventOut:](self, "_eventExists:eventOut:", v6, 0))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The event named '%@' has already been added."), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = DTKPSetErrorAndOrLogWithFileAndLine(0, (uint64_t)"DTKPCPUCounterAllocator", a4, 4294966494, v7);
  }
  else
  {
    if (-[DTKPCPUCounterAllocator _matchesPMIEvent:](self, "_matchesPMIEvent:", v6))
    {
      eventRecords = self->_eventRecords;
      v10 = [DTKPCPUCounterAllocatorRecord alloc];
      -[DTKPCPUCounterAllocatorRecord eventName](self->_pmiEvent, "eventName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[DTKPCPUCounterAllocatorRecord eventName](self->_pmiEvent, "eventName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[DTKPCPUCounterAllocatorRecord initWithName:nameOrAlias:counterName:kpepEvent:isPMI:hwIdx:](v10, "initWithName:nameOrAlias:counterName:kpepEvent:isPMI:hwIdx:", v11, v6, v12, 0, 0, -[DTKPCPUCounterAllocatorRecord hwIdx](self->_pmiEvent, "hwIdx"));
      -[NSMutableArray addObject:](eventRecords, "addObject:", v13);

      v8 = 0;
      goto LABEL_6;
    }
    -[DTKPCPU eventFromNameOrAlias:](self->_cpu, "eventFromNameOrAlias:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    if (v15)
    {
      if (!objc_msgSend(v15, "kpepEvent"))
        sub_222BC7548();
      v28 = objc_msgSend(v7, "kpepEvent");
      v16 = kpep_config_add_event();
      if ((_DWORD)v16)
      {
        v17 = v16;
        objc_msgSend(v7, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[DTKPCPUCounterAllocator _setErrorFromKpepError:eventName:error:](self, "_setErrorFromKpepError:eventName:error:", v17, v18, a4);

      }
      else
      {
        v20 = kpep_event_name();
        if ((_DWORD)v20)
        {
          v21 = v20;
          objc_msgSend(v7, "name");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = -[DTKPCPUCounterAllocator _setErrorFromKpepError:eventName:error:](self, "_setErrorFromKpepError:eventName:error:", v21, v22, a4);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = [DTKPCPUCounterAllocatorRecord alloc];
          objc_msgSend(v7, "aliasOrName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          ++self->_eventsUniqueIds;
          v25 = -[DTKPCPUCounterAllocatorRecord initWithName:nameOrAlias:counterName:kpepEvent:isPMI:hwIdx:](v23, "initWithName:nameOrAlias:counterName:kpepEvent:isPMI:hwIdx:", v22, v24, CFSTR("TBD"), v28, 0);

          -[NSMutableArray addObject:](self->_eventRecords, "addObject:", v25);
          -[NSMutableArray lastObject](self->_eventRecords, "lastObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[DTKPCPUCounterAllocator _counterNameForEvent:error:](self, "_counterNameForEvent:error:", v26, a4);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[DTKPCPUCounterAllocatorRecord setCounterName:](v25, "setCounterName:", v27);

          v8 = 0;
        }

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Event not found: %@'"), v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a4, 4294966495, v19);

    }
  }

LABEL_6:
  return v8;
}

- (void)_enumerateAllocatedPMCsWithIndex:(id)a3
{
  id v4;
  NSMutableArray *eventRecords;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  eventRecords = self->_eventRecords;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_222B8CEB0;
  v7[3] = &unk_24EB2AC08;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](eventRecords, "enumerateObjectsUsingBlock:", v7);

}

- (void)enumerateAllocatedPMCs:(id)a3
{
  id v4;
  NSMutableArray *eventRecords;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  eventRecords = self->_eventRecords;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_222B8CF38;
  v7[3] = &unk_24EB2AC08;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](eventRecords, "enumerateObjectsUsingBlock:", v7);

}

- (unsigned)kpcClasses
{
  if (kpep_config_kpc_classes())
    return 0;
  else
    return 0;
}

- (unint64_t)pmcEventCount
{
  return -[NSMutableArray count](self->_eventRecords, "count");
}

- (BOOL)pmiEnabled
{
  return self->_pmiEvent != 0;
}

- (unint64_t)recordConfigWordsIntoBuffer:(unint64_t *)a3
{
  unint64_t v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_222B8D038;
  v5[3] = &unk_24EB2AC30;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  -[DTKPCPUCounterAllocator _enumerateAllocatedPMCsWithIndex:](self, "_enumerateAllocatedPMCsWithIndex:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)configureHardwareCounters:(id *)a3
{
  void *v4;
  int v5;

  if (!kpep_config_kpc_classes())
    return 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("configureHardwarePMIPeriods: Failed to get kpc classes: %s."), kpep_strerror());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a3, 4294967288, v4);

  return v5;
}

- (int)configureHardwarePMIPeriods:(id *)a3
{
  id v5;
  int v6;
  id v8;
  void *v9;
  int *v10;
  void *v11;

  if (kpep_config_kpc_classes())
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("configureHardwarePMIPeriods: Failed to get kpc classes: %s."), kpep_strerror());
LABEL_5:
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a3, 4294967288, v5);
    goto LABEL_6;
  }
  -[DTKPCPU kpepDB](self->_cpu, "kpepDB");
  if (kpep_db_counters_count())
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("configureHardwarePMIPeriods: Failed to get kpc period number: %s."), kpep_strerror());
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 0);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "mutableBytes");
  if (kpep_config_kpc_periods())
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("configureHardwarePMIPeriods: Failed to get kpc periods: %s."), kpep_strerror());
  }
  else
  {
    v8 = objc_retainAutorelease(v5);
    objc_msgSend(v8, "mutableBytes");
    if (!kpc_set_period())
    {
      v6 = 0;
      v5 = v8;
      goto LABEL_6;
    }
    v9 = (void *)MEMORY[0x24BDD17C8];
    v10 = __error();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("configureHardwarePMIPeriods: Failed to set kpc PMI period: %s."), strerror(*v10));
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a3, 4294967288, v11);

LABEL_6:
  return v6;
}

- (int)configurePMIActionID:(unsigned int)a3 error:(id *)a4
{
  void *v7;
  int v8;
  uint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  int *v14;
  void *v15;

  if (kpep_config_kpc_classes())
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("configurePMIActionID: Failed to get kpc classes: %s."), kpep_strerror());
LABEL_5:
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a4, 4294967288, v7);
    goto LABEL_6;
  }
  -[DTKPCPU kpepDB](self->_cpu, "kpepDB");
  if (kpep_db_counters_count())
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("configurePMIActionID: Failed to get kpc period number: %s."), kpep_strerror());
    goto LABEL_5;
  }
  -[DTKPCPUCounterAllocator allocatedPMIRecord](self, "allocatedPMIRecord");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    sub_222BC75F8();
  v7 = (void *)v10;
  v11 = -[DTKPCPUCounterAllocator _counterIndexForEvent:absolute:error:](self, "_counterIndexForEvent:absolute:error:", v10, 0, a4);
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 0);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *(_DWORD *)(objc_msgSend(v12, "mutableBytes") + 4 * v11) = a3;
  if (kpc_set_actionid())
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    v14 = __error();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("configurePMIActionID: Failed to set kpc PMI period: %s."), strerror(*v14));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a4, 4294967288, v15);

  }
  else
  {
    v8 = 0;
  }

LABEL_6:
  return v8;
}

- (int)forceCounters:(id *)a3
{
  int result;
  void *v5;
  int v6;

  result = kpc_force_all_ctrs_set();
  if (result)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to force all hardware CPU counters: %d."), *__error());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a3, 4294966489, v5);

    return v6;
  }
  return result;
}

- (int)unforceCounters:(id *)a3
{
  int result;
  void *v5;
  int v6;

  result = kpc_force_all_ctrs_set();
  if (result)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to unforce all hardware CPU counters: %d."), *__error());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a3, 4294966487, v5);

    return v6;
  }
  return result;
}

- (int)startHardwareCounters:(id *)a3
{
  int result;
  void *v5;
  int v6;

  -[DTKPCPUCounterAllocator kpcClasses](self, "kpcClasses");
  result = kpc_set_counting();
  if (result)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to start kpc counting: %d."), *__error());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a3, 4294967288, v5);

    return v6;
  }
  return result;
}

- (int)stopHardwareCounters:(id *)a3
{
  int result;
  void *v5;
  int v6;

  result = kpc_set_counting();
  if (result)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to stop kpc counting: %d."), *__error());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPUCounterAllocator", a3, 4294967288, v5);

    return v6;
  }
  return result;
}

- (unint64_t)pmiThreshold
{
  return self->_pmiThreshold;
}

- (DTKPCPUCounterAllocatorRecord)allocatedPMIRecord
{
  return self->_pmiEvent;
}

- (DTKPCPU)cpu
{
  return self->_cpu;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cpu, 0);
  objc_storeStrong((id *)&self->_pmiEvent, 0);
  objc_storeStrong((id *)&self->_eventRecords, 0);
}

@end
