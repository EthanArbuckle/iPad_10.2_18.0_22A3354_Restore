@implementation DTSysmonTapLocalDelegate

- (id)_getSessionMetadata
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (DTSysmonTapLocalDelegate)initWithConfig:(id)a3
{
  id v5;
  DTSysmonTapLocalDelegate *v6;
  DTSysmonTapLocalDelegate *v7;
  uint64_t v8;
  NSSet *pidFilter;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *serialQ;
  dispatch_semaphore_t v15;
  OS_dispatch_semaphore *samplesLock;
  uint64_t v17;
  NSMutableArray *samples;
  mach_timebase_info info;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DTSysmonTapLocalDelegate;
  v6 = -[DTSysmonTapLocalDelegate init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    if (!v5)
      sub_222BC7880();
    objc_storeStrong((id *)&v6->_config, a3);
    -[DTSysmonTapConfig pids](v7->_config, "pids");
    v8 = objc_claimAutoreleasedReturnValue();
    pidFilter = v7->_pidFilter;
    v7->_pidFilter = (NSSet *)v8;

    v10 = -[DTTapConfig bufferMode](v7->_config, "bufferMode");
    v7->_isWindowed = v10 == 2;
    if (v10 == 2)
    {
      info = 0;
      mach_timebase_info(&info);
      v11 = -[DTTapConfig windowSize](v7->_config, "windowSize");
      v12 = ((3 * v11) >> 1) * info.denom / info.numer;
      v7->_purgeEveryNTicks = (v11 >> 1) * info.denom / info.numer;
      v7->_effectiveWindowSize = v12;
    }
    v13 = dispatch_queue_create("SysmonTap Process Queue", 0);
    serialQ = v7->_serialQ;
    v7->_serialQ = (OS_dispatch_queue *)v13;

    v15 = dispatch_semaphore_create(1);
    samplesLock = v7->_samplesLock;
    v7->_samplesLock = (OS_dispatch_semaphore *)v15;

    v17 = objc_opt_new();
    samples = v7->_samples;
    v7->_samples = (NSMutableArray *)v17;

  }
  return v7;
}

- (void)dealloc
{
  processor_cpu_load_info *savedTicks;
  NSObject *pollTimer;
  OS_dispatch_source *v5;
  objc_super v6;

  savedTicks = self->_savedTicks;
  if (savedTicks)
  {
    mach_vm_deallocate(*MEMORY[0x24BDAEC58], (mach_vm_address_t)savedTicks, 16 * self->_cpuCount);
    self->_savedTicks = 0;
  }
  pollTimer = self->_pollTimer;
  if (pollTimer)
  {
    dispatch_source_cancel(pollTimer);
    v5 = self->_pollTimer;
    self->_pollTimer = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)DTSysmonTapLocalDelegate;
  -[DTSysmonTapLocalDelegate dealloc](&v6, sel_dealloc);
}

- (id)validateConfig
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  DTTapStatusMemo *v32;
  void *v33;
  DTTapStatusMemo *v34;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, void *);
  void *v39;
  id v40;
  id v41;
  uint64_t *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;

  v3 = (void *)objc_opt_new();
  -[DTSysmonTapConfig processAttributes](self->_config, "processAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x24BDAC760];
  if (v4)
  {
    +[DTSysmonTapSupportedAttributes localProcessAttributes](DTSysmonTapSupportedAttributes, "localProcessAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    v50 = 0;
    v51 = &v50;
    v52 = 0x2020000000;
    v53 = 0;
    -[DTSysmonTapConfig processAttributes](self->_config, "processAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v5;
    v46[1] = 3221225472;
    v46[2] = sub_222BA2F20;
    v46[3] = &unk_24EB2B230;
    v9 = v6;
    v47 = v9;
    v10 = v7;
    v48 = v10;
    v49 = &v50;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v46);

    if (!*((_BYTE *)v51 + 24))
      objc_msgSend(v3, "addObject:", CFSTR("Missing the 'pid' process attribute."));
    if (objc_msgSend(v10, "count"))
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Unknown process attributes: %@."), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v13);

    }
    _Block_object_dispose(&v50, 8);

  }
  -[DTSysmonTapConfig systemAttributes](self->_config, "systemAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    +[DTSysmonTapSupportedAttributes localSystemAttributes](DTSysmonTapSupportedAttributes, "localSystemAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_opt_new();
    -[DTSysmonTapConfig systemAttributes](self->_config, "systemAttributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v5;
    v43[1] = 3221225472;
    v43[2] = sub_222BA2FA0;
    v43[3] = &unk_24EB2ADC8;
    v18 = v15;
    v44 = v18;
    v19 = v16;
    v45 = v19;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v43);

    if (objc_msgSend(v19, "count"))
    {
      v20 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", "));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("Unknown system attributes: %@."), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v22);

    }
  }
  -[DTSysmonTapConfig coalitionAttributes](self->_config, "coalitionAttributes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    +[DTSysmonTapSupportedAttributes localCoalitionAttributes](DTSysmonTapSupportedAttributes, "localCoalitionAttributes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_opt_new();
    v50 = 0;
    v51 = &v50;
    v52 = 0x2020000000;
    v53 = 0;
    -[DTSysmonTapConfig coalitionAttributes](self->_config, "coalitionAttributes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v5;
    v37 = 3221225472;
    v38 = sub_222BA2FEC;
    v39 = &unk_24EB2B230;
    v27 = v24;
    v40 = v27;
    v28 = v25;
    v41 = v28;
    v42 = &v50;
    objc_msgSend(v26, "enumerateObjectsUsingBlock:", &v36);

    if (!*((_BYTE *)v51 + 24))
      objc_msgSend(v3, "addObject:", CFSTR("Missing the 'cid' coalition attribute."));
    if (objc_msgSend(v28, "count"))
    {
      v29 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR(", "));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("Unknown coalition attributes: %@."), v30, v36, v37, v38, v39, v40);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v31);

    }
    _Block_object_dispose(&v50, 8);

  }
  if (objc_msgSend(v3, "count"))
  {
    v32 = [DTTapStatusMemo alloc];
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[DTTapStatusMemo initWithStatus:notice:](v32, "initWithStatus:notice:", 0x80000000, v33);

  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (void)setTap:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!v4)
    sub_222BC78A8();
  v5 = v4;
  objc_storeWeak((id *)&self->_tap, v4);

}

- (void)_addSample:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_samplesLock, 0xFFFFFFFFFFFFFFFFLL);
  -[NSMutableArray addObject:](self->_samples, "addObject:", v4);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_samplesLock);

}

- (void)_addCPUUsageToSample:(id)a3
{
  id v4;
  host_t v5;
  unint64_t v6;
  double v7;
  double v8;
  uint32x4_t v9;
  unint64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  mach_msg_type_number_t out_processor_infoCnt[2];
  processor_info_array_t out_processor_info;
  _QWORD v31[4];
  _QWORD v32[4];
  _QWORD v33[4];
  _QWORD v34[6];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  *(_QWORD *)out_processor_infoCnt = 0;
  out_processor_info = 0;
  v5 = MEMORY[0x227679A4C]();
  if (!host_processor_info(v5, 2, out_processor_infoCnt, &out_processor_info, &out_processor_infoCnt[1]))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (out_processor_infoCnt[0])
    {
      v6 = 0;
      v28 = 0;
      v7 = 0.0;
      v8 = 0.0;
      do
      {
        v9 = (uint32x4_t)vsubq_s32(*(int32x4_t *)&out_processor_info[4 * v6], (int32x4_t)self->_savedTicks[v6]);
        v10 = vaddlvq_u32(v9);
        if (v10)
        {
          v11 = 100.0 - (double)v9.u32[2] / (double)v10 * 100.0;
          v12 = (double)v9.u32[3] / (double)v10 * 100.0;
          ++v28;
        }
        else
        {
          v11 = 0.0;
          v12 = 0.0;
        }
        v33[0] = CFSTR("CPU_TotalLoad");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v13;
        v33[1] = CFSTR("CPU_UserLoad");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -1.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v34[1] = v14;
        v33[2] = CFSTR("CPU_SystemLoad");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -1.0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v34[2] = v15;
        v33[3] = CFSTR("CPU_NiceLoad");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v34[3] = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "insertObject:atIndex:", v17, 0);

        v7 = v7 + v11;
        v8 = v8 + v12;
        ++v6;
      }
      while (v6 < out_processor_infoCnt[0]);
    }
    else
    {
      v28 = 0;
      v8 = 0.0;
      v7 = 0.0;
    }
    mach_vm_deallocate(*MEMORY[0x24BDAEC58], (mach_vm_address_t)self->_savedTicks->cpu_ticks, 16 * self->_cpuCount);
    self->_savedTicks = (processor_cpu_load_info *)out_processor_info;
    v31[0] = CFSTR("CPU_TotalLoad");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v18;
    v31[1] = CFSTR("CPU_UserLoad");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -1.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v19;
    v31[2] = CFSTR("CPU_SystemLoad");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -1.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v20;
    v31[3] = CFSTR("CPU_NiceLoad");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", out_processor_infoCnt[0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("CPUCount"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v28);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("EnabledCPUs"));

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("PerCPUUsage"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("SystemCPUUsage"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Type"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = objc_msgSend(v25, "unsignedIntValue");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v19 | 0x20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("Type"));

  }
}

- (void)_handleSysmonProcessTable:(id)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSDictionary *processesFromLastSample;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *processesAtWindowBeginning;
  _QWORD v24[4];
  id v25;
  id v26;
  DTSysmonTapLocalDelegate *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *);
  void *v31;
  DTSysmonTapLocalDelegate *v32;
  id v33;

  v8 = a3;
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_24EB4ECD8, CFSTR("Type"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("Processes"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("StartMachAbsTime"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("EndMachAbsTime"));

  v13 = MEMORY[0x24BDAC760];
  v28 = MEMORY[0x24BDAC760];
  v29 = 3221225472;
  v30 = sub_222BA37F0;
  v31 = &unk_24EB2B280;
  v32 = self;
  v14 = v10;
  v33 = v14;
  sysmon_table_apply();

  v15 = (void *)objc_msgSend(v14, "copy");
  processesFromLastSample = self->_processesFromLastSample;
  if (processesFromLastSample)
  {
    -[NSDictionary allKeys](processesFromLastSample, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    objc_msgSend(v14, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = sub_222BA3EB4;
    v24[3] = &unk_24EB2B2A8;
    v20 = v18;
    v25 = v20;
    v26 = v14;
    v27 = self;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", v24);

    if (objc_msgSend(v20, "count"))
    {
      objc_msgSend(v20, "allObjects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("DeadProcesses"));

    }
  }
  objc_storeStrong((id *)&self->_processesFromLastSample, v15);
  if (self->_isWindowed && !self->_processesAtWindowBeginning)
  {
    v22 = (NSMutableDictionary *)objc_msgSend(v9, "mutableCopy");
    processesAtWindowBeginning = self->_processesAtWindowBeginning;
    self->_processesAtWindowBeginning = v22;

  }
  else
  {
    -[DTSysmonTapLocalDelegate _addSample:](self, "_addSample:", v9);
  }
  if (self->_isWindowed && self->_purgeEveryNTicks + self->_lastWindowPurgeTime < a5)
    -[DTSysmonTapLocalDelegate _purgeOldSamplesForCurrentTime:](self, "_purgeOldSamplesForCurrentTime:", a5);

}

- (void)_handleSysmonSystemTable:(id)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *systemAtWindowBeginning;
  uint64_t v16;

  v8 = a3;
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_24EB4ECF0, CFSTR("Type"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("StartMachAbsTime"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("EndMachAbsTime"));

  v16 = MEMORY[0x24BDAC760];
  v13 = v10;
  sysmon_table_apply();

  if (objc_msgSend(v13, "count", v16, 3221225472, sub_222BA412C, &unk_24EB2B280, self))
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("System"));
  if (-[DTSysmonTapConfig sampleCPUUsage](self->_config, "sampleCPUUsage"))
    -[DTSysmonTapLocalDelegate _addCPUUsageToSample:](self, "_addCPUUsageToSample:", v9);
  if (self->_isWindowed && !self->_systemAtWindowBeginning)
  {
    v14 = (NSMutableDictionary *)objc_msgSend(v9, "mutableCopy");
    systemAtWindowBeginning = self->_systemAtWindowBeginning;
    self->_systemAtWindowBeginning = v14;

  }
  else
  {
    -[DTSysmonTapLocalDelegate _addSample:](self, "_addSample:", v9);
  }
  if (self->_isWindowed && self->_purgeEveryNTicks + self->_lastWindowPurgeTime < a5)
    -[DTSysmonTapLocalDelegate _purgeOldSamplesForCurrentTime:](self, "_purgeOldSamplesForCurrentTime:", a5);

}

- (void)_handleSysmonCoalitionTable:(id)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSDictionary *coalitionsFromLastSample;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *coalitionsAtWindowBeginning;
  _QWORD v24[4];
  id v25;
  DTSysmonTapLocalDelegate *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *);
  void *v31;
  DTSysmonTapLocalDelegate *v32;
  id v33;

  v8 = a3;
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_24EB4ED08, CFSTR("Type"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("Coalitions"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("StartMachAbsTime"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("EndMachAbsTime"));

  v13 = MEMORY[0x24BDAC760];
  v28 = MEMORY[0x24BDAC760];
  v29 = 3221225472;
  v30 = sub_222BA45FC;
  v31 = &unk_24EB2B280;
  v32 = self;
  v14 = v10;
  v33 = v14;
  sysmon_table_apply();

  v15 = (void *)objc_msgSend(v14, "copy");
  coalitionsFromLastSample = self->_coalitionsFromLastSample;
  if (coalitionsFromLastSample)
  {
    -[NSDictionary allKeys](coalitionsFromLastSample, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    objc_msgSend(v14, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = sub_222BA4804;
    v24[3] = &unk_24EB2B2A8;
    v20 = v18;
    v25 = v20;
    v26 = self;
    v27 = v14;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", v24);

    if (objc_msgSend(v20, "count"))
    {
      objc_msgSend(v20, "allObjects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("DeadCoalitions"));

    }
  }
  objc_storeStrong((id *)&self->_coalitionsFromLastSample, v15);
  if (self->_isWindowed && !self->_coalitionsAtWindowBeginning)
  {
    v22 = (NSMutableDictionary *)objc_msgSend(v9, "mutableCopy");
    coalitionsAtWindowBeginning = self->_coalitionsAtWindowBeginning;
    self->_coalitionsAtWindowBeginning = v22;

  }
  else
  {
    -[DTSysmonTapLocalDelegate _addSample:](self, "_addSample:", v9);
  }
  if (self->_isWindowed && self->_purgeEveryNTicks + self->_lastWindowPurgeTime < a5)
    -[DTSysmonTapLocalDelegate _purgeOldSamplesForCurrentTime:](self, "_purgeOldSamplesForCurrentTime:", a5);

}

- (void)_createAttributesSample
{
  NSMutableDictionary *v3;
  NSMutableDictionary *newAttributesSample;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (NSMutableDictionary *)objc_opt_new();
  newAttributesSample = self->_newAttributesSample;
  self->_newAttributesSample = v3;

  -[DTSysmonTapConfig processAttributes](self->_config, "processAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DTSysmonTapConfig processAttributes](self->_config, "processAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_newAttributesSample, "setObject:forKeyedSubscript:", v6, CFSTR("ProcessesAttributes"));

  }
  -[DTSysmonTapConfig systemAttributes](self->_config, "systemAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DTSysmonTapConfig systemAttributes](self->_config, "systemAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_newAttributesSample, "setObject:forKeyedSubscript:", v8, CFSTR("SystemAttributes"));

  }
  -[DTSysmonTapConfig coalitionAttributes](self->_config, "coalitionAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[DTSysmonTapConfig coalitionAttributes](self->_config, "coalitionAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_newAttributesSample, "setObject:forKeyedSubscript:", v10, CFSTR("CoalitionAttributes"));

  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_newAttributesSample, "setObject:forKeyedSubscript:", &unk_24EB4ED20, CFSTR("Type"));
}

- (void)_purgeOldSamplesForCurrentTime:(unint64_t)a3
{
  unint64_t effectiveWindowSize;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  char v15;
  NSMutableDictionary *v16;
  void *systemAtWindowBeginning;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[6];

  effectiveWindowSize = self->_effectiveWindowSize;
  v6 = -[NSMutableArray count](self->_samples, "count");
  if (!v6)
    goto LABEL_17;
  v7 = v6;
  v8 = 0;
  v27 = a3;
  v28 = a3 - effectiveWindowSize;
  while (1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_samples, "objectAtIndexedSubscript:", v8, v27);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("StartMachAbsTime"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedLongLongValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("EndMachAbsTime"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedLongLongValue");

    if (v13 >= v28)
      break;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Type"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedLongLongValue");

    if ((v15 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_processesAtWindowBeginning, "setObject:forKeyedSubscript:", v18, CFSTR("StartMachAbsTime"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_processesAtWindowBeginning, "setObject:forKeyedSubscript:", v19, CFSTR("EndMachAbsTime"));

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Processes"));
      systemAtWindowBeginning = (void *)objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x24BDAC760];
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = sub_222BA4D24;
      v32[3] = &unk_24EB2B2F8;
      v32[4] = self;
      objc_msgSend(systemAtWindowBeginning, "enumerateKeysAndObjectsUsingBlock:", v32);
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DeadProcesses"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v31[0] = v20;
      v31[1] = 3221225472;
      v31[2] = sub_222BA4D34;
      v31[3] = &unk_24EB2AD80;
      v31[4] = self;
      v23 = v31;
LABEL_8:
      objc_msgSend(v21, "enumerateObjectsUsingBlock:", v23);

      goto LABEL_9;
    }
    if ((v15 & 0x28) == 0)
    {
      if ((v15 & 0x10) == 0)
        goto LABEL_10;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v11);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_coalitionsAtWindowBeginning, "setObject:forKeyedSubscript:", v24, CFSTR("StartMachAbsTime"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v13);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_coalitionsAtWindowBeginning, "setObject:forKeyedSubscript:", v25, CFSTR("EndMachAbsTime"));

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Coalitions"));
      systemAtWindowBeginning = (void *)objc_claimAutoreleasedReturnValue();
      v26 = MEMORY[0x24BDAC760];
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = sub_222BA4D44;
      v30[3] = &unk_24EB2B2F8;
      v30[4] = self;
      objc_msgSend(systemAtWindowBeginning, "enumerateKeysAndObjectsUsingBlock:", v30);
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DeadCoalitions"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v29[0] = v26;
      v29[1] = 3221225472;
      v29[2] = sub_222BA4D54;
      v29[3] = &unk_24EB2AD80;
      v29[4] = self;
      v23 = v29;
      goto LABEL_8;
    }
    v16 = v9;
    systemAtWindowBeginning = self->_systemAtWindowBeginning;
    self->_systemAtWindowBeginning = v16;
LABEL_9:

LABEL_10:
    if (v7 == ++v8)
    {
      v8 = v7;
      goto LABEL_15;
    }
  }

LABEL_15:
  a3 = v27;
  if (v8)
    -[NSMutableArray removeObjectsInRange:](self->_samples, "removeObjectsInRange:", 0, v8);
LABEL_17:
  self->_lastWindowPurgeTime = a3;
}

- (void)start
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  id v9;
  NSArray *processAttributes;
  NSArray *v11;
  OS_sysmon_request *v12;
  OS_sysmon_request *processRequest;
  NSArray *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *v20;
  id v21;
  NSArray *systemAttributes;
  NSArray *v23;
  OS_sysmon_request *v24;
  OS_sysmon_request *systemRequest;
  NSArray *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSArray *v32;
  id v33;
  NSArray *coalitionAttributes;
  NSArray *v35;
  OS_sysmon_request *v36;
  OS_sysmon_request *coalitionRequest;
  NSArray *v38;
  host_t v39;
  uint64_t v40;
  uint64_t v41;
  DTTapStatusMemo *v42;
  void *v43;
  DTTapStatusMemo *v44;
  uint64_t v45;
  host_t v46;
  uint64_t v47;
  uint64_t v48;
  DTTapStatusMemo *v49;
  void *v50;
  id WeakRetained;
  unint64_t v52;
  OS_dispatch_source *v53;
  OS_dispatch_source *pollTimer;
  NSObject *v55;
  NSObject *v56;
  dispatch_time_t v57;
  uint64_t v58;
  _QWORD handler[5];
  mach_msg_type_number_t out_processor_infoCnt;
  processor_info_array_t out_processor_info;
  _QWORD v62[10];
  _QWORD v63[4];
  id v64;
  NSArray *v65;
  _QWORD v66[10];
  _QWORD v67[4];
  id v68;
  NSArray *v69;
  _QWORD v70[10];
  _QWORD v71[4];
  id v72;
  NSArray *v73;

  -[DTSysmonTapConfig processAttributes](self->_config, "processAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = MEMORY[0x24BDAC760];
  if (v3)
  {
    v5 = (void *)objc_opt_new();
    +[DTSysmonTapSupportedAttributes localProcessAttributesMap](DTSysmonTapSupportedAttributes, "localProcessAttributesMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DTSysmonTapConfig processAttributes](self->_config, "processAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v4;
    v71[1] = 3221225472;
    v71[2] = sub_222BA5384;
    v71[3] = &unk_24EB2ADC8;
    v72 = v6;
    v8 = v5;
    v73 = v8;
    v9 = v6;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v71);

    processAttributes = self->_processAttributes;
    self->_processAttributes = v8;
    v11 = v8;

    v70[5] = v4;
    v70[6] = 3221225472;
    v70[7] = sub_222BA53E0;
    v70[8] = &unk_24EB2B320;
    v70[9] = self;
    v12 = (OS_sysmon_request *)sysmon_request_create();
    processRequest = self->_processRequest;
    self->_processRequest = v12;

    v14 = self->_processAttributes;
    v70[0] = v4;
    v70[1] = 3221225472;
    v70[2] = sub_222BA54A8;
    v70[3] = &unk_24EB2B348;
    v70[4] = self;
    -[NSArray enumerateObjectsUsingBlock:](v14, "enumerateObjectsUsingBlock:", v70);
    -[DTSysmonTapConfig sampleInterval](self->_config, "sampleInterval");
    sysmon_request_set_interval();

  }
  -[DTSysmonTapConfig systemAttributes](self->_config, "systemAttributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)objc_opt_new();
    +[DTSysmonTapSupportedAttributes localSystemAttributesMap](DTSysmonTapSupportedAttributes, "localSystemAttributesMap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DTSysmonTapConfig systemAttributes](self->_config, "systemAttributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDAC760];
    v67[0] = MEMORY[0x24BDAC760];
    v67[1] = 3221225472;
    v67[2] = sub_222BA54FC;
    v67[3] = &unk_24EB2ADC8;
    v68 = v17;
    v20 = v16;
    v69 = v20;
    v21 = v17;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v67);

    systemAttributes = self->_systemAttributes;
    self->_systemAttributes = v20;
    v23 = v20;

    v66[5] = v19;
    v66[6] = 3221225472;
    v66[7] = sub_222BA5558;
    v66[8] = &unk_24EB2B320;
    v66[9] = self;
    v24 = (OS_sysmon_request *)sysmon_request_create();
    systemRequest = self->_systemRequest;
    self->_systemRequest = v24;

    v26 = self->_systemAttributes;
    v66[0] = v19;
    v66[1] = 3221225472;
    v66[2] = sub_222BA5620;
    v66[3] = &unk_24EB2B348;
    v66[4] = self;
    -[NSArray enumerateObjectsUsingBlock:](v26, "enumerateObjectsUsingBlock:", v66);
    -[DTSysmonTapConfig sampleInterval](self->_config, "sampleInterval");
    sysmon_request_set_interval();

  }
  -[DTSysmonTapConfig coalitionAttributes](self->_config, "coalitionAttributes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = MEMORY[0x24BDAC760];
  if (v27)
  {
    v29 = (void *)objc_opt_new();
    +[DTSysmonTapSupportedAttributes localCoalitionAttributesMap](DTSysmonTapSupportedAttributes, "localCoalitionAttributesMap");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[DTSysmonTapConfig coalitionAttributes](self->_config, "coalitionAttributes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v28;
    v63[1] = 3221225472;
    v63[2] = sub_222BA5674;
    v63[3] = &unk_24EB2ADC8;
    v64 = v30;
    v32 = v29;
    v65 = v32;
    v33 = v30;
    objc_msgSend(v31, "enumerateObjectsUsingBlock:", v63);

    coalitionAttributes = self->_coalitionAttributes;
    self->_coalitionAttributes = v32;
    v35 = v32;

    v62[5] = v28;
    v62[6] = 3221225472;
    v62[7] = sub_222BA56D0;
    v62[8] = &unk_24EB2B320;
    v62[9] = self;
    v36 = (OS_sysmon_request *)sysmon_request_create();
    coalitionRequest = self->_coalitionRequest;
    self->_coalitionRequest = v36;

    v38 = self->_coalitionAttributes;
    v62[0] = v28;
    v62[1] = 3221225472;
    v62[2] = sub_222BA5798;
    v62[3] = &unk_24EB2B348;
    v62[4] = self;
    -[NSArray enumerateObjectsUsingBlock:](v38, "enumerateObjectsUsingBlock:", v62);
    -[DTSysmonTapConfig sampleInterval](self->_config, "sampleInterval");
    sysmon_request_set_interval();

  }
  -[DTSysmonTapLocalDelegate _createAttributesSample](self, "_createAttributesSample");
  if (-[DTSysmonTapConfig sampleCPUUsage](self->_config, "sampleCPUUsage"))
  {
    out_processor_info = 0;
    out_processor_infoCnt = 0;
    v39 = MEMORY[0x227679A4C]();
    v40 = host_processor_info(v39, 1, &self->_cpuCount, &out_processor_info, &out_processor_infoCnt);
    if ((_DWORD)v40)
    {
      v41 = v40;
      v42 = [DTTapStatusMemo alloc];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to sample host processor basic info: %d"), v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = -[DTTapStatusMemo initWithStatus:notice:](v42, "initWithStatus:notice:", 0x80000000, v43);

    }
    else
    {
      v45 = mach_vm_deallocate(*MEMORY[0x24BDAEC58], (mach_vm_address_t)out_processor_info, 4 * out_processor_infoCnt);
      v46 = MEMORY[0x227679A4C](v45);
      v47 = host_processor_info(v46, 2, &self->_cpuCount, (processor_info_array_t *)&self->_savedTicks, &out_processor_infoCnt);
      if (!(_DWORD)v47)
        goto LABEL_13;
      v48 = v47;
      v49 = [DTTapStatusMemo alloc];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to sample host processor cpu usage: %d"), v48);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = -[DTTapStatusMemo initWithStatus:notice:](v49, "initWithStatus:notice:", 0x80000000, v50);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
    objc_msgSend(WeakRetained, "_handleStatusMemo:", v44);

LABEL_13:
    self->_lastWindowPurgeTime = mach_absolute_time();
    if (!self->_systemRequest)
    {
      v52 = -[DTSysmonTapConfig sampleInterval](self->_config, "sampleInterval");
      v53 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_serialQ);
      pollTimer = self->_pollTimer;
      self->_pollTimer = v53;

      v55 = self->_pollTimer;
      handler[0] = v28;
      handler[1] = 3221225472;
      handler[2] = sub_222BA57EC;
      handler[3] = &unk_24EB27E30;
      handler[4] = self;
      dispatch_source_set_event_handler(v55, handler);
      v56 = self->_pollTimer;
      v57 = dispatch_time(0, v52);
      dispatch_source_set_timer(v56, v57, v52, 0x989680uLL);
      dispatch_resume((dispatch_object_t)self->_pollTimer);
    }
  }
  v58 = mach_absolute_time();
  self->_systemLastSampleTime = v58;
  self->_coalitionLastSampleTime = v58;
  self->_processLastSampleTime = v58;
  if (self->_processRequest)
    sysmon_request_execute();
  if (self->_systemRequest)
    sysmon_request_execute();
  if (self->_coalitionRequest)
    sysmon_request_execute();
}

- (void)stop
{
  OS_sysmon_request *coalitionRequest;
  OS_sysmon_request *systemRequest;
  OS_sysmon_request *processRequest;
  NSObject *pollTimer;
  OS_dispatch_source *v7;

  self->_stopWasCalled = 1;
  if (self->_coalitionRequest)
  {
    sysmon_request_cancel();
    coalitionRequest = self->_coalitionRequest;
    self->_coalitionRequest = 0;

  }
  if (self->_systemRequest)
  {
    sysmon_request_cancel();
    systemRequest = self->_systemRequest;
    self->_systemRequest = 0;

  }
  if (self->_processRequest)
  {
    sysmon_request_cancel();
    processRequest = self->_processRequest;
    self->_processRequest = 0;

  }
  pollTimer = self->_pollTimer;
  if (pollTimer)
  {
    dispatch_source_cancel(pollTimer);
    v7 = self->_pollTimer;
    self->_pollTimer = 0;

  }
}

- (BOOL)canFetchWhileArchiving
{
  return 0;
}

- (void)fetchDataForReason:(unint64_t)a3 block:(id)a4
{
  void *v6;
  void *v7;
  NSMutableDictionary *processesAtWindowBeginning;
  NSMutableDictionary *systemAtWindowBeginning;
  NSMutableDictionary *coalitionsAtWindowBeginning;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  NSMutableDictionary *newAttributesSample;
  DTTapHeartbeatMemo *v17;
  _BOOL8 v19;
  void (**v20)(id, DTTapHeartbeatMemo *, uint64_t);
  _QWORD v21[5];

  v20 = (void (**)(id, DTTapHeartbeatMemo *, uint64_t))a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_samplesLock, 0xFFFFFFFFFFFFFFFFLL);
  if (-[NSMutableArray count](self->_samples, "count"))
  {
    if (self->_isWindowed)
    {
      -[DTSysmonTapLocalDelegate _purgeOldSamplesForCurrentTime:](self, "_purgeOldSamplesForCurrentTime:", mach_absolute_time());
      v6 = (void *)objc_opt_new();
      v7 = v6;
      if (self->_processesAtWindowBeginning)
        objc_msgSend(v6, "addObject:");
      if (self->_systemAtWindowBeginning)
        objc_msgSend(v7, "addObject:");
      if (self->_coalitionsAtWindowBeginning)
        objc_msgSend(v7, "addObject:");
      objc_msgSend(v7, "sortUsingComparator:", &unk_24EB27A70, v20);
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = sub_222BA5CF4;
      v21[3] = &unk_24EB2B390;
      v21[4] = self;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v21);
      processesAtWindowBeginning = self->_processesAtWindowBeginning;
      self->_processesAtWindowBeginning = 0;

      systemAtWindowBeginning = self->_systemAtWindowBeginning;
      self->_systemAtWindowBeginning = 0;

      coalitionsAtWindowBeginning = self->_coalitionsAtWindowBeginning;
      self->_coalitionsAtWindowBeginning = 0;

    }
    if (self->_newAttributesSample)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_samples, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_newAttributesSample, "objectForKeyedSubscript:", CFSTR("Type"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedIntValue");

      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Type"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = objc_msgSend(v14, "unsignedIntValue");

      objc_msgSend(v11, "addEntriesFromDictionary:", self->_newAttributesSample);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v12 | v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("Type"));

      newAttributesSample = self->_newAttributesSample;
      self->_newAttributesSample = 0;

    }
    v17 = (DTTapHeartbeatMemo *)objc_opt_new();
    -[DTTapMemo setTapVersion:](v17, "setTapVersion:", 0x10000);
    -[DTTapHeartbeatMemo setSamples:](v17, "setSamples:", self->_samples);
    -[DTTapHeartbeatMemo setSupportsPeek:](v17, "setSupportsPeek:", 1);
    v19 = a3 == 1 && self->_stopWasCalled;
    -[DTTapHeartbeatMemo setFinalMemo:](v17, "setFinalMemo:", v19, v20);
    v20[2](v20, v17, 1);
    -[NSMutableArray removeAllObjects](self->_samples, "removeAllObjects");
  }
  else
  {
    v17 = -[DTTapHeartbeatMemo initWithTimestamp:]([DTTapHeartbeatMemo alloc], "initWithTimestamp:", mach_absolute_time());
    v20[2](v20, v17, 1);
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_samplesLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalitionRequest, 0);
  objc_storeStrong((id *)&self->_systemRequest, 0);
  objc_storeStrong((id *)&self->_processRequest, 0);
  objc_storeStrong((id *)&self->_coalitionAttributes, 0);
  objc_storeStrong((id *)&self->_systemAttributes, 0);
  objc_storeStrong((id *)&self->_processAttributes, 0);
  objc_storeStrong((id *)&self->_coalitionsAtWindowBeginning, 0);
  objc_storeStrong((id *)&self->_systemAtWindowBeginning, 0);
  objc_storeStrong((id *)&self->_processesAtWindowBeginning, 0);
  objc_storeStrong((id *)&self->_coalitionsFromLastSample, 0);
  objc_storeStrong((id *)&self->_processesFromLastSample, 0);
  objc_storeStrong((id *)&self->_newAttributesSample, 0);
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_samplesLock, 0);
  objc_storeStrong((id *)&self->_serialQ, 0);
  objc_storeStrong((id *)&self->_pollTimer, 0);
  objc_storeStrong((id *)&self->_pidFilter, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_destroyWeak((id *)&self->_tap);
}

@end
