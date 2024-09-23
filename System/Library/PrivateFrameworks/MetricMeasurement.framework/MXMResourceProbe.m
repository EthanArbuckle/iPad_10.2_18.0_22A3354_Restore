@implementation MXMResourceProbe

+ (int)_processIdentifierWithProcessName:(const char *)a3 error:(id *)a4
{
  const char *v6;
  int v7;
  void *v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  NSObject *v17;
  int v18;
  _DWORD v19[19];

  *(_QWORD *)&v19[17] = *MEMORY[0x24BDAC8D0];
  v6 = getprogname();
  if (strcmp(v6, a3))
  {
    *__error() = 0;
    v7 = proc_listpids(1u, 0, 0, 0);
    v8 = malloc_type_malloc(v7, 0x8D521121uLL);
    v9 = proc_listpids(1u, 0, v8, v7);
    if (*__error() || (v7 >= v9 ? (v10 = v9) : (v10 = v7), v10 < 4))
    {
LABEL_12:
      free(v8);
    }
    else
    {
      v11 = 0;
      v12 = (unint64_t)(int)v10 >> 2;
      if (v12 <= 1)
        v13 = 1;
      else
        v13 = v12;
      while (1)
      {
        v14 = *((_DWORD *)v8 + v11);
        proc_name(v14, &v18, 0x40u);
        if (!strcmp((const char *)&v18, a3))
          break;
        if (v13 == ++v11)
          goto LABEL_12;
      }
      free(v8);
      if ((v14 & 0x80000000) == 0)
      {
        _MXMGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = 67109378;
          v19[0] = v14;
          LOWORD(v19[1]) = 2080;
          *(_QWORD *)((char *)&v19[1] + 2) = a3;
          _os_log_impl(&dword_214474000, v17, OS_LOG_TYPE_INFO, "Found pid (%i) for process name: %s", (uint8_t *)&v18, 0x12u);
        }

        return v14;
      }
    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Failed to find process.."), 1, MEMORY[0x24BDBD1B8]);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    _MXMGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315138;
      *(_QWORD *)v19 = a3;
      _os_log_impl(&dword_214474000, v15, OS_LOG_TYPE_DEFAULT, "Failed to find pid for process name: %s", (uint8_t *)&v18, 0xCu);
    }

    return 0;
  }
  return getpid();
}

+ (id)probe
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "init");
}

- (MXMResourceProbe)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MXMResourceProbe;
  return -[MXMProbe init](&v3, sel_init);
}

- (void)_buildData:(id)a3 timestamp:(unint64_t)a4 rusage:(rusage_info_v6 *)a5
{
  uint64_t i;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  double v17;
  unint64_t v18;
  MXMSampleSet *v19;
  id v20;
  rusage_info_v6 *v21;
  id v22;

  v21 = a5;
  v22 = a3;
  if (_buildData_timestamp_rusage__onceToken != -1)
    dispatch_once(&_buildData_timestamp_rusage__onceToken, &__block_literal_global_0);
  for (i = 0; i != 38; i += 2)
  {
    v8 = *(_QWORD *)&_buildData_timestamp_rusage__infos[i];
    v9 = *(void **)&_buildData_timestamp_rusage__infos[i + 1];
    v10 = *((id *)&_buildData_timestamp_rusage__infos[i + 1] + 1);
    -[MXMProbe filter](self, "filter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "matchesSamplesWithTag:", v10);

    if (!v12)
      goto LABEL_12;
    v13 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_10:
      v18 = *(_QWORD *)&v21->ri_uuid[v8];
      goto LABEL_11;
    }
    +[MXMUtilizationSampleTag CPUQos](MXMUtilizationSampleTag, "CPUQos");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "containsTag:", v10))
    {

    }
    else
    {
      +[MXMUtilizationSampleTag CPUTime](MXMUtilizationSampleTag, "CPUTime");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "containsTag:", v10);

      if (!v16)
        goto LABEL_10;
    }
    +[MXMMachUtils _nanosecondsWithAbsoluteTime:](MXMMachUtils, "_nanosecondsWithAbsoluteTime:", *(_QWORD *)&v21->ri_uuid[v8], v21);
    v18 = (unint64_t)v17;
LABEL_11:
    v19 = -[MXMSampleSet initWithTag:unit:attributes:]([MXMSampleSet alloc], "initWithTag:unit:attributes:", v10, v13, 0);
    objc_msgSend(v22, "appendSet:", v19);

    v20 = (id)objc_msgSend(v22, "appendUnsignedIntegerValue:tag:timestamp:", v18, v10, a4);
LABEL_12:

  }
}

double __48__MXMResourceProbe__buildData_timestamp_rusage___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  +[MXMUnitMemory bytes](MXMUnitMemory, "bytes");
  v0 = objc_claimAutoreleasedReturnValue();
  +[MXMUnitCycle cycles](MXMUnitCycle, "cycles");
  v23 = objc_claimAutoreleasedReturnValue();
  +[MXMUnitInstruction baseUnit](MXMUnitInstruction, "baseUnit");
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD18D8], "nanoseconds");
  v1 = objc_claimAutoreleasedReturnValue();
  +[MXMUtilizationSampleTag CPUCycles](MXMUtilizationSampleTag, "CPUCycles");
  v21 = objc_claimAutoreleasedReturnValue();
  +[MXMUtilizationSampleTag CPUInstructions](MXMUtilizationSampleTag, "CPUInstructions");
  v20 = objc_claimAutoreleasedReturnValue();
  +[MXMUtilizationSampleTag CPUTimeUser](MXMUtilizationSampleTag, "CPUTimeUser");
  v19 = objc_claimAutoreleasedReturnValue();
  +[MXMUtilizationSampleTag CPUTimeSystem](MXMUtilizationSampleTag, "CPUTimeSystem");
  v18 = objc_claimAutoreleasedReturnValue();
  +[MXMUtilizationSampleTag CPUQosDefault](MXMUtilizationSampleTag, "CPUQosDefault");
  v17 = objc_claimAutoreleasedReturnValue();
  +[MXMUtilizationSampleTag CPUQosMaintenance](MXMUtilizationSampleTag, "CPUQosMaintenance");
  v16 = objc_claimAutoreleasedReturnValue();
  +[MXMUtilizationSampleTag CPUQosBackground](MXMUtilizationSampleTag, "CPUQosBackground");
  v15 = objc_claimAutoreleasedReturnValue();
  +[MXMUtilizationSampleTag CPUQosUtility](MXMUtilizationSampleTag, "CPUQosUtility");
  v14 = objc_claimAutoreleasedReturnValue();
  +[MXMUtilizationSampleTag CPUQosLegacy](MXMUtilizationSampleTag, "CPUQosLegacy");
  v13 = objc_claimAutoreleasedReturnValue();
  +[MXMUtilizationSampleTag CPUQosUserInitiated](MXMUtilizationSampleTag, "CPUQosUserInitiated");
  v12 = objc_claimAutoreleasedReturnValue();
  +[MXMUtilizationSampleTag CPUQosUserInteractive](MXMUtilizationSampleTag, "CPUQosUserInteractive");
  v11 = objc_claimAutoreleasedReturnValue();
  +[MXMUtilizationSampleTag memoryPhysical](MXMUtilizationSampleTag, "memoryPhysical");
  v2 = objc_claimAutoreleasedReturnValue();
  +[MXMUtilizationSampleTag memoryPeakPhysicalLifetime](MXMUtilizationSampleTag, "memoryPeakPhysicalLifetime");
  v3 = objc_claimAutoreleasedReturnValue();
  +[MXMUtilizationSampleTag memoryPeakPhysicalInterval](MXMUtilizationSampleTag, "memoryPeakPhysicalInterval");
  v4 = objc_claimAutoreleasedReturnValue();
  +[MXMUtilizationSampleTag memoryWired](MXMUtilizationSampleTag, "memoryWired");
  v5 = objc_claimAutoreleasedReturnValue();
  +[MXMUtilizationSampleTag memoryResident](MXMUtilizationSampleTag, "memoryResident");
  v6 = objc_claimAutoreleasedReturnValue();
  +[MXMUtilizationSampleTag IOReads](MXMUtilizationSampleTag, "IOReads");
  v7 = objc_claimAutoreleasedReturnValue();
  +[MXMUtilizationSampleTag IOWrites](MXMUtilizationSampleTag, "IOWrites");
  v8 = objc_claimAutoreleasedReturnValue();
  +[MXMUtilizationSampleTag IOLogicalWrites](MXMUtilizationSampleTag, "IOLogicalWrites");
  v9 = objc_claimAutoreleasedReturnValue();
  _buildData_timestamp_rusage__infos[0] = xmmword_21448F390;
  qword_254D76E00 = v23;
  unk_254D76E08 = v21;
  xmmword_254D76E10 = xmmword_21448F3A0;
  qword_254D76E20 = v22;
  unk_254D76E28 = v20;
  xmmword_254D76E30 = xmmword_21448F3B0;
  qword_254D76E40 = v1;
  unk_254D76E48 = v19;
  xmmword_254D76E50 = xmmword_21448F3C0;
  qword_254D76E60 = v1;
  unk_254D76E68 = v18;
  xmmword_254D76E70 = xmmword_21448F3D0;
  qword_254D76E80 = v1;
  unk_254D76E88 = v17;
  xmmword_254D76E90 = xmmword_21448F3E0;
  qword_254D76EA0 = v1;
  unk_254D76EA8 = v16;
  xmmword_254D76EB0 = xmmword_21448F3F0;
  qword_254D76EC0 = v1;
  unk_254D76EC8 = v15;
  xmmword_254D76ED0 = xmmword_21448F400;
  qword_254D76EE0 = v1;
  unk_254D76EE8 = v14;
  xmmword_254D76EF0 = xmmword_21448F410;
  qword_254D76F00 = v1;
  unk_254D76F08 = v13;
  xmmword_254D76F10 = xmmword_21448F420;
  qword_254D76F20 = v1;
  unk_254D76F28 = v12;
  xmmword_254D76F30 = xmmword_21448F430;
  qword_254D76F40 = v1;
  unk_254D76F48 = v11;
  xmmword_254D76F50 = xmmword_21448F440;
  qword_254D76F60 = v0;
  unk_254D76F68 = v2;
  xmmword_254D76F70 = xmmword_21448F450;
  qword_254D76F80 = v0;
  unk_254D76F88 = v3;
  xmmword_254D76F90 = xmmword_21448F460;
  qword_254D76FA0 = v0;
  unk_254D76FA8 = v4;
  xmmword_254D76FB0 = xmmword_21448F470;
  qword_254D76FC0 = v0;
  unk_254D76FC8 = v5;
  xmmword_254D76FD0 = xmmword_21448F480;
  qword_254D76FE0 = v0;
  unk_254D76FE8 = v6;
  xmmword_254D76FF0 = xmmword_21448F490;
  qword_254D77000 = v0;
  qword_254D77008 = v7;
  xmmword_254D77010 = xmmword_21448F4A0;
  qword_254D77020 = v0;
  qword_254D77028 = v8;
  *(_QWORD *)&result = 232;
  xmmword_254D77030 = xmmword_21448F4B0;
  qword_254D77040 = v0;
  qword_254D77048 = v9;
  return result;
}

- (void)_buildData:(id)a3 timestamp:(unint64_t)a4 taskinfo:(proc_taskinfo *)a5
{
  MXMSampleSet *v7;
  void *v8;
  void *v9;
  MXMSampleSet *v10;
  uint64_t pti_virtual_size;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  v7 = [MXMSampleSet alloc];
  +[MXMUtilizationSampleTag memoryVirtual](MXMUtilizationSampleTag, "memoryVirtual");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MXMUnitMemory bytes](MXMUnitMemory, "bytes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MXMSampleSet initWithTag:unit:attributes:](v7, "initWithTag:unit:attributes:", v8, v9, 0);
  objc_msgSend(v14, "appendSet:", v10);

  pti_virtual_size = a5->pti_virtual_size;
  +[MXMUtilizationSampleTag memoryVirtual](MXMUtilizationSampleTag, "memoryVirtual");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v14, "appendUnsignedIntegerValue:tag:timestamp:", pti_virtual_size, v12, a4);

}

- (void)_buildData:(id)a3 timestamp:(unint64_t)a4 mach_space_basicinfo:(ipc_info_space_basic *)a5
{
  MXMSampleSet *v7;
  void *v8;
  MXMSampleSet *v9;
  uint64_t iisb_table_inuse;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  v7 = [MXMSampleSet alloc];
  +[MXMUtilizationSampleTag machPort](MXMUtilizationSampleTag, "machPort");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MXMSampleSet initWithTag:unit:attributes:](v7, "initWithTag:unit:attributes:", v8, 0, 0);
  objc_msgSend(v13, "appendSet:", v9);

  iisb_table_inuse = a5->iisb_table_inuse;
  +[MXMUtilizationSampleTag machPort](MXMUtilizationSampleTag, "machPort");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v13, "appendUnsignedIntValue:tag:timestamp:", iisb_table_inuse, v11, a4);

}

- (void)_buildData:(id)a3 timestamp:(unint64_t)a4 pm_networking_stats:(id *)a5
{
  MXMSampleSet *v7;
  void *v8;
  void *v9;
  MXMSampleSet *v10;
  MXMSampleSet *v11;
  void *v12;
  void *v13;
  MXMSampleSet *v14;
  MXMSampleSet *v15;
  void *v16;
  void *v17;
  MXMSampleSet *v18;
  MXMSampleSet *v19;
  void *v20;
  void *v21;
  MXMSampleSet *v22;
  unint64_t var3;
  void *v24;
  id v25;
  unint64_t var4;
  void *v27;
  id v28;
  unint64_t var1;
  void *v30;
  id v31;
  unint64_t var2;
  void *v33;
  id v34;
  id v35;

  v35 = a3;
  v7 = [MXMSampleSet alloc];
  +[MXMUtilizationSampleTag networkRecievedBytes](MXMUtilizationSampleTag, "networkRecievedBytes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MXMUnitMemory bytes](MXMUnitMemory, "bytes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MXMSampleSet initWithTag:unit:attributes:](v7, "initWithTag:unit:attributes:", v8, v9, 0);
  objc_msgSend(v35, "appendSet:", v10);

  v11 = [MXMSampleSet alloc];
  +[MXMUtilizationSampleTag networkSentBytes](MXMUtilizationSampleTag, "networkSentBytes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MXMUnitMemory bytes](MXMUnitMemory, "bytes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MXMSampleSet initWithTag:unit:attributes:](v11, "initWithTag:unit:attributes:", v12, v13, 0);
  objc_msgSend(v35, "appendSet:", v14);

  v15 = [MXMSampleSet alloc];
  +[MXMUtilizationSampleTag networkRecievedPackets](MXMUtilizationSampleTag, "networkRecievedPackets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MXMUnitPacket baseUnit](MXMUnitPacket, "baseUnit");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MXMSampleSet initWithTag:unit:attributes:](v15, "initWithTag:unit:attributes:", v16, v17, 0);
  objc_msgSend(v35, "appendSet:", v18);

  v19 = [MXMSampleSet alloc];
  +[MXMUtilizationSampleTag networkSentPackets](MXMUtilizationSampleTag, "networkSentPackets");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MXMUnitPacket baseUnit](MXMUnitPacket, "baseUnit");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[MXMSampleSet initWithTag:unit:attributes:](v19, "initWithTag:unit:attributes:", v20, v21, 0);
  objc_msgSend(v35, "appendSet:", v22);

  var3 = a5->var3;
  +[MXMUtilizationSampleTag networkRecievedBytes](MXMUtilizationSampleTag, "networkRecievedBytes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v35, "appendUnsignedIntegerValue:tag:timestamp:", var3, v24, a4);

  var4 = a5->var4;
  +[MXMUtilizationSampleTag networkSentBytes](MXMUtilizationSampleTag, "networkSentBytes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)objc_msgSend(v35, "appendUnsignedIntegerValue:tag:timestamp:", var4, v27, a4);

  var1 = a5->var1;
  +[MXMUtilizationSampleTag networkRecievedPackets](MXMUtilizationSampleTag, "networkRecievedPackets");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (id)objc_msgSend(v35, "appendUnsignedIntegerValue:tag:timestamp:", var1, v30, a4);

  var2 = a5->var2;
  +[MXMUtilizationSampleTag networkSentPackets](MXMUtilizationSampleTag, "networkSentPackets");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (id)objc_msgSend(v35, "appendUnsignedIntegerValue:tag:timestamp:", var2, v33, a4);

}

- (void)_beginUpdates
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MXMResourceProbe;
  -[MXMProbe _beginUpdates](&v12, sel__beginUpdates);
  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x24BDD17F0]);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __33__MXMResourceProbe__beginUpdates__block_invoke;
  v9 = &unk_24D193188;
  objc_copyWeak(&v10, &location);
  v4 = (void *)objc_msgSend(v3, "initWithBlock:", &v6);
  -[MXMResourceProbe setPollingThread:](self, "setPollingThread:", v4, v6, v7, v8, v9);

  -[MXMResourceProbe pollingThread](self, "pollingThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "start");

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __33__MXMResourceProbe__beginUpdates__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  int v3;
  void *v4;
  int v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isCancelled") & 1) != 0 || (v2 = WeakRetained) == 0)
  {
LABEL_5:

  }
  else
  {
    while (1)
    {
      v3 = objc_msgSend(v2, "updating");

      if (!v3)
        break;
      objc_msgSend(WeakRetained, "_pollMainBody");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_handleIncomingData:", v4);

      usleep(0x30D40u);
      objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v1, "isCancelled");
      v2 = WeakRetained;
      if (v5)
        goto LABEL_5;
    }
  }

}

- (void)_stopUpdates
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MXMResourceProbe;
  -[MXMProbe _stopUpdates](&v9, sel__stopUpdates);
  -[MXMResourceProbe pollingThread](self, "pollingThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  usleep(0x61A80u);
  -[MXMResourceProbe pollingThread](self, "pollingThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFinished");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMResourceProbe.m"), 281, CFSTR("Failed to stop polling thread."));

  }
  -[MXMResourceProbe _pollMainBody](self, "_pollMainBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMProbe _handleIncomingData:](self, "_handleIncomingData:", v7);

  -[MXMResourceProbe setPollingThread:](self, "setPollingThread:", 0);
}

- (id)sampleWithTimeout:(double)a3 stopReason:(unint64_t *)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[MXMResourceProbe _pollMainBody](self, "_pollMainBody", a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMProbe filter](self, "filter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataMatchingFilter:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)performPreIterationActions
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  int v19;
  int v20;
  NSObject *v21;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  int v28;
  int v29;
  NSObject *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  int v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  -[MXMProbe filter](self, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "finite");

  if (!v4)
    return 1;
  -[MXMProbe filter](self, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeFilterWithName:", CFSTR("Process Name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MXMProbe filter](self, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributeFilterWithName:", CFSTR("Process Identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "values");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (!v11)
  {
    v14 = 1;
    goto LABEL_18;
  }
  v12 = v11;
  v13 = *(_QWORD *)v37;
  v14 = 1;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v37 != v13)
        objc_enumerationMutation(v10);
      v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      v17 = (void *)objc_opt_class();
      v18 = objc_retainAutorelease(v16);
      v19 = objc_msgSend(v17, "_processIdentifierWithProcessName:error:", objc_msgSend(v18, "UTF8String"), 0);
      if (v19 >= 1)
      {
        v20 = v19;
        if (!proc_reset_footprint_interval())
          continue;
        _MXMGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          v42 = v20;
          v43 = 2112;
          v44 = v18;
          _os_log_impl(&dword_214474000, v21, OS_LOG_TYPE_ERROR, "Unable to reset the peak interval footprint of pid %d (%@)", buf, 0x12u);
        }

      }
      v14 = 0;
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  }
  while (v12);
LABEL_18:

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v23 = v31;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v33 != v26)
          objc_enumerationMutation(v23);
        v28 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "intValue");
        if (v28 >= 1)
        {
          v29 = v28;
          if (proc_reset_footprint_interval())
          {
            _MXMGetLog();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              v42 = v29;
              _os_log_impl(&dword_214474000, v30, OS_LOG_TYPE_ERROR, "Unable to reset the peak interval footprint of pid %d", buf, 8u);
            }

            v14 = 0;
          }
        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v25);
  }

  return v14 & 1;
}

- (id)_pollMainBody
{
  MXMMutableSampleData *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  MXMResourceProbe *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  MXMMutableSampleData *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MXMMutableSampleData);
  -[MXMProbe filter](self, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "finite");

  if (v5)
  {
    v36 = v3;
    -[MXMProbe filter](self, "filter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributeFilterWithName:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "values");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[MXMProbe filter](self, "filter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributeFilterWithName:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "values");
    v11 = objc_claimAutoreleasedReturnValue();

    _MXMGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v44 = v8;
      v45 = 2112;
      v46 = v11;
      _os_log_impl(&dword_214474000, v12, OS_LOG_TYPE_INFO, "Polling with the following process names: %@ and pids: %@.", buf, 0x16u);
    }

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    if (v8)
    {
      objc_msgSend(v8, "setByAddingObjectsFromSet:", v11, v11, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "set", v11, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setByAddingObjectsFromSet:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v17 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v39;
      v20 = 0x24D192000uLL;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v39 != v19)
            objc_enumerationMutation(v13);
          v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v23 = objc_msgSend(objc_retainAutorelease(v22), "cStringUsingEncoding:", 4);
            v24 = (void *)objc_opt_class();
            v37 = 0;
            v25 = objc_msgSend(v24, "_processIdentifierWithProcessName:error:", v23, &v37);
            v26 = v37;
            if ((v25 & 0x80000000) != 0)
              goto LABEL_25;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v26 = 0;
              goto LABEL_25;
            }
            v25 = objc_msgSend(v22, "intValue");
            v26 = 0;
            if ((v25 & 0x80000000) != 0)
              goto LABEL_25;
          }
          if (!v26)
          {
            v27 = self;
            -[MXMResourceProbe _pollProcessWithData:pid:](self, "_pollProcessWithData:pid:", v36, v25);
            v28 = v20;
            v29 = *(void **)(v20 + 2464);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v25);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "attributeWithName:numericValue:", CFSTR("Process Identifier"), v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[MXMMutableSampleData appendAttribute:](v36, "appendAttribute:", v31);

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(*(id *)(v28 + 2464), "attributeWithName:stringValue:", CFSTR("Process Name"), v22);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[MXMMutableSampleData appendAttribute:](v36, "appendAttribute:", v32);

            }
            v26 = 0;
            v20 = v28;
            self = v27;
          }
LABEL_25:

        }
        v18 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v18);
    }

    v3 = v36;
  }
  else
  {
    _MXMGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      -[MXMProbe filter](self, "filter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v44 = v15;
      _os_log_impl(&dword_214474000, v14, OS_LOG_TYPE_INFO, "Polling all process's with filter %@.", buf, 0xCu);

    }
    -[MXMResourceProbe _pollAllProcesses:](self, "_pollAllProcesses:", v3);
  }
  return v3;
}

- (void)_pollAllProcesses:(id)a3
{
  id v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  void *v9;
  int *v10;
  int v11;
  void *v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _MXMGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = *__error();
    *(_DWORD *)buf = 67109120;
    v14 = v7;
    _os_log_impl(&dword_214474000, v6, OS_LOG_TYPE_ERROR, "Clearing errno for libproc call (value being cleared: %i).", buf, 8u);
  }

  *__error() = 0;
  v8 = proc_listpids(1u, 0, 0, 0);
  v9 = malloc_type_malloc(4 * v8, 0x100004052888210uLL);
  proc_listpids(1u, 0, v9, 32);
  if (*__error())
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMResourceProbe.m"), 383, CFSTR("Failed to call proc_listpids. Errno (%i)."), *__error());

    if (!(_DWORD)v8)
      goto LABEL_9;
  }
  else if (!(_DWORD)v8)
  {
    goto LABEL_9;
  }
  v10 = (int *)v9;
  do
  {
    v11 = *v10++;
    if ((v11 & 0x80000000) == 0)
      -[MXMResourceProbe _pollProcessWithData:pid:](self, "_pollProcessWithData:pid:", v5);
    --v8;
  }
  while (v8);
LABEL_9:
  free(v9);

}

- (void)_pollProcessWithData:(id)a3 pid:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  kern_return_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  uint8_t v14[12];
  mach_port_name_t v15;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v15 = 0;
  -[MXMProbe filter](self, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MXMUtilizationSampleTag machPort](MXMUtilizationSampleTag, "machPort");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "matchesSamplesWithTag:", v8) & 1) != 0)
  {
    v9 = task_for_pid(*MEMORY[0x24BDAEC58], v4, &v15);

    if (!v9)
    {
      -[MXMResourceProbe _pollProcessResourceUsageWithData:pid:](self, "_pollProcessResourceUsageWithData:pid:", v6, v4);
LABEL_12:
      -[MXMResourceProbe _pollTaskMachPortInformation:task:](self, "_pollTaskMachPortInformation:task:", v6, v15);
      -[MXMResourceProbe _pollProcessNetworkingStatsWithData:pid:task:](self, "_pollProcessNetworkingStatsWithData:pid:task:", v6, v4, v15);
      goto LABEL_13;
    }
  }
  else
  {
    -[MXMProbe filter](self, "filter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MXMUtilizationSampleTag network](MXMUtilizationSampleTag, "network");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "matchesSamplesWithTag:", v11))
    {
      v9 = task_for_pid(*MEMORY[0x24BDAEC58], v4, &v15);
      v12 = v9 != 0;
    }
    else
    {
      v12 = 0;
      v9 = -1;
    }

    if (!v12)
      goto LABEL_11;
  }
  _MXMGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_214474000, v13, OS_LOG_TYPE_ERROR, "Failed to grab task port.", v14, 2u);
  }

LABEL_11:
  -[MXMResourceProbe _pollProcessResourceUsageWithData:pid:](self, "_pollProcessResourceUsageWithData:pid:", v6, v4);
  if (!v9)
    goto LABEL_12;
LABEL_13:

}

- (void)_pollProcessNetworkingStatsWithData:(id)a3 pid:(int)a4 task:(unsigned int)a5
{
  id v6;
  uint64_t v7;
  _OWORD v8[16];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  memset(v8, 0, sizeof(v8));
  v6 = a3;
  v7 = mach_absolute_time();
  pm_sample_task_and_pid();
  -[MXMResourceProbe _buildData:timestamp:pm_networking_stats:](self, "_buildData:timestamp:pm_networking_stats:", v6, v7, (char *)v8 + 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    *(_QWORD *)&v8[0]);

}

- (void)_pollProcessResourceUsageWithData:(id)a3 pid:(int)a4
{
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  int *v11;
  char *v12;
  double v13;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  __int16 v17;
  char *v18;
  rusage_info_t buffer[2];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  *(_OWORD *)buffer = 0u;
  *__error() = 0;
  v7 = proc_pid_rusage(a4, 6, buffer);
  v8 = mach_absolute_time();
  if (v7)
  {
    _MXMGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *__error();
      v11 = __error();
      v12 = strerror(*v11);
      v14[0] = 67109634;
      v14[1] = a4;
      v15 = 1024;
      v16 = v10;
      v17 = 2080;
      v18 = v12;
      _os_log_impl(&dword_214474000, v9, OS_LOG_TYPE_INFO, "Failed to retrieve rusage info for pid: %i. errno=%d(%s)", (uint8_t *)v14, 0x18u);
    }

  }
  else
  {
    +[MXMMachUtils _nanosecondsWithAbsoluteTime:](MXMMachUtils, "_nanosecondsWithAbsoluteTime:", v8);
    -[MXMResourceProbe _buildData:timestamp:rusage:](self, "_buildData:timestamp:rusage:", v6, (unint64_t)v13, buffer);
  }

}

- (void)_pollTaskMachPortInformation:(id)a3 task:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[3];

  v4 = *(_QWORD *)&a4;
  v7 = a3;
  memset(v11, 0, sizeof(v11));
  v8 = MEMORY[0x2199CE338](v4, v11);
  v9 = mach_absolute_time();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMResourceProbe.m"), 456, CFSTR("Failed to retrieve port information for task: %i"), v4);

  }
  -[MXMResourceProbe _buildData:timestamp:mach_space_basicinfo:](self, "_buildData:timestamp:mach_space_basicinfo:", v7, v9, v11);

}

- (void)_pollBasicTaskInformation:(id)a3 pid:(int)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  _OWORD buffer[6];

  v4 = *(_QWORD *)&a4;
  memset(buffer, 0, sizeof(buffer));
  v7 = a3;
  if (proc_pidinfo(v4, 4, 0, buffer, 96) != 96)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMResourceProbe.m"), 463, CFSTR("Failed to gather process task information for pid: %i"), v4);

  }
  -[MXMResourceProbe _buildData:timestamp:taskinfo:](self, "_buildData:timestamp:taskinfo:", v7, mach_absolute_time(), buffer);

}

- (NSThread)pollingThread
{
  return (NSThread *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPollingThread:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pollingThread, 0);
}

@end
