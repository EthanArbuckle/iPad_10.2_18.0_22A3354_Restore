@implementation MXMSystemProbe

+ (id)probe
{
  return objc_alloc_init((Class)a1);
}

- (MXMSystemProbe)init
{
  MXMSystemProbe *v2;
  MXMSystemProbe *v3;
  NSThread *updateThread;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MXMSystemProbe;
  v2 = -[MXMProbe init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    updateThread = v2->_updateThread;
    v2->_updateThread = 0;

  }
  return v3;
}

- (void)_buildData:(id)a3 timestamp:(unint64_t)a4 processorCount:(unsigned int)a5
{
  uint64_t v5;
  void *v7;
  id v8;
  id v9;

  v5 = *(_QWORD *)&a5;
  v9 = a3;
  +[MXMSystemSampleTag CPUCoresLogical](MXMSystemSampleTag, "CPUCoresLogical");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v9, "appendUnsignedIntValue:tag:timestamp:", v5, v7, a4);

}

- (void)_buildData:(id)a3 timestamp:(unint64_t)a4 cpuLoad:(processor_cpu_load_info *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;

  v19 = a3;
  v7 = a5->cpu_ticks[0];
  v8 = a5->cpu_ticks[1];
  v10 = a5->cpu_ticks[2];
  v9 = a5->cpu_ticks[3];
  +[MXMUtilizationSampleTag CPUTicksIdle](MXMUtilizationSampleTag, "CPUTicksIdle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v19, "appendUnsignedIntValue:tag:timestamp:", v10, v11, a4);

  +[MXMUtilizationSampleTag CPUTicksUser](MXMUtilizationSampleTag, "CPUTicksUser");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v19, "appendUnsignedIntValue:tag:timestamp:", v7, v13, a4);

  +[MXMUtilizationSampleTag CPUTicksSystem](MXMUtilizationSampleTag, "CPUTicksSystem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v19, "appendUnsignedIntValue:tag:timestamp:", v8, v15, a4);

  +[MXMUtilizationSampleTag CPUTicksNice](MXMUtilizationSampleTag, "CPUTicksNice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v19, "appendUnsignedIntValue:tag:timestamp:", v9, v17, a4);

}

- (void)_buildData:(id)a3 timestamp:(unint64_t)a4 loadInfo:(processor_set_load_info *)a5
{
  uint64_t thread_count;
  void *v8;
  id v9;
  uint64_t task_count;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  thread_count = a5->thread_count;
  +[MXMUtilizationSampleTag CPULoadThread](MXMUtilizationSampleTag, "CPULoadThread");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v13, "appendIntValue:tag:timestamp:", thread_count, v8, a4);

  task_count = a5->task_count;
  +[MXMUtilizationSampleTag CPULoadTask](MXMUtilizationSampleTag, "CPULoadTask");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v13, "appendIntValue:tag:timestamp:", task_count, v11, a4);

}

- (void)_prepareData
{
  MXMMutableSampleData *v3;
  MXMMutableSampleData *data;
  MXMMutableSampleData *v5;
  MXMMutableSampleSet *v6;
  void *v7;
  MXMMutableSampleSet *v8;
  MXMMutableSampleData *v9;
  MXMMutableSampleSet *v10;
  void *v11;
  MXMMutableSampleSet *v12;
  MXMMutableSampleData *v13;
  MXMMutableSampleSet *v14;
  void *v15;
  MXMMutableSampleSet *v16;
  MXMMutableSampleData *v17;
  MXMMutableSampleSet *v18;
  void *v19;
  MXMMutableSampleSet *v20;
  MXMMutableSampleData *v21;
  MXMMutableSampleSet *v22;
  void *v23;
  MXMMutableSampleSet *v24;
  MXMMutableSampleData *v25;
  MXMMutableSampleSet *v26;
  MXMMutableSampleSet *v27;
  id v28;

  v3 = objc_alloc_init(MXMMutableSampleData);
  data = self->_data;
  self->_data = v3;

  v5 = self->_data;
  v6 = [MXMMutableSampleSet alloc];
  +[MXMUtilizationSampleTag CPUTicksIdle](MXMUtilizationSampleTag, "CPUTicksIdle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MXMSampleSet initWithTag:unit:attributes:](v6, "initWithTag:unit:attributes:", v7, 0, 0);
  -[MXMMutableSampleData appendSet:](v5, "appendSet:", v8);

  v9 = self->_data;
  v10 = [MXMMutableSampleSet alloc];
  +[MXMUtilizationSampleTag CPUTicksUser](MXMUtilizationSampleTag, "CPUTicksUser");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MXMSampleSet initWithTag:unit:attributes:](v10, "initWithTag:unit:attributes:", v11, 0, 0);
  -[MXMMutableSampleData appendSet:](v9, "appendSet:", v12);

  v13 = self->_data;
  v14 = [MXMMutableSampleSet alloc];
  +[MXMUtilizationSampleTag CPUTicksSystem](MXMUtilizationSampleTag, "CPUTicksSystem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MXMSampleSet initWithTag:unit:attributes:](v14, "initWithTag:unit:attributes:", v15, 0, 0);
  -[MXMMutableSampleData appendSet:](v13, "appendSet:", v16);

  v17 = self->_data;
  v18 = [MXMMutableSampleSet alloc];
  +[MXMUtilizationSampleTag CPUTicksNice](MXMUtilizationSampleTag, "CPUTicksNice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[MXMSampleSet initWithTag:unit:attributes:](v18, "initWithTag:unit:attributes:", v19, 0, 0);
  -[MXMMutableSampleData appendSet:](v17, "appendSet:", v20);

  v21 = self->_data;
  v22 = [MXMMutableSampleSet alloc];
  +[MXMUtilizationSampleTag CPULoadThread](MXMUtilizationSampleTag, "CPULoadThread");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[MXMSampleSet initWithTag:unit:attributes:](v22, "initWithTag:unit:attributes:", v23, 0, 0);
  -[MXMMutableSampleData appendSet:](v21, "appendSet:", v24);

  v25 = self->_data;
  v26 = [MXMMutableSampleSet alloc];
  +[MXMUtilizationSampleTag CPULoadTask](MXMUtilizationSampleTag, "CPULoadTask");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v27 = -[MXMSampleSet initWithTag:unit:attributes:](v26, "initWithTag:unit:attributes:", v28, 0, 0);
  -[MXMMutableSampleData appendSet:](v25, "appendSet:", v27);

}

- (void)_beginUpdates
{
  NSThread *v3;
  NSThread *updateThread;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MXMSystemProbe;
  -[MXMProbe _beginUpdates](&v5, sel__beginUpdates);
  v3 = (NSThread *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17F0]), "initWithTarget:selector:object:", self, sel__pollSystemLoop, 0);
  updateThread = self->_updateThread;
  self->_updateThread = v3;

  -[MXMSystemProbe _pollSystemLoop](self, "_pollSystemLoop");
  -[MXMSystemProbe _gatherConstantSystemProperties](self, "_gatherConstantSystemProperties");
}

- (void)_stopUpdates
{
  NSThread *updateThread;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MXMSystemProbe;
  -[MXMProbe _stopUpdates](&v4, sel__stopUpdates);
  -[NSThread cancel](self->_updateThread, "cancel");
  updateThread = self->_updateThread;
  self->_updateThread = 0;

}

- (void)_pollSystemLoop
{
  _BOOL4 v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isCancelled") & 1) != 0)
  {
LABEL_4:

  }
  else
  {
    while (1)
    {
      v3 = -[MXMProbe updating](self, "updating");

      if (!v3)
        break;
      -[MXMSystemProbe _pollSystemMainBody](self, "_pollSystemMainBody");
      usleep(0xF4240u);
      -[MXMSystemProbe _pollSystemLoop](self, "_pollSystemLoop");
      objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isCancelled"))
        goto LABEL_4;
    }
  }
}

- (void)_gatherConstantSystemProperties
{
  MXMMutableSampleData *v3;

  v3 = self->_data;
  -[MXMSystemProbe _pollSystemHostProcessorInfoWithData:](self, "_pollSystemHostProcessorInfoWithData:", v3);
  -[MXMProbe _handleIncomingData:](self, "_handleIncomingData:", v3);

}

- (void)_pollSystemMainBody
{
  MXMMutableSampleData *v3;

  v3 = self->_data;
  -[MXMSystemProbe _pollProcessorLoadInformationWithData:](self, "_pollProcessorLoadInformationWithData:", v3);
  -[MXMSystemProbe _pollSystemLoadInformationWithData:](self, "_pollSystemLoadInformationWithData:", v3);
  -[MXMSystemProbe _pollSystemThermalsWithData:](self, "_pollSystemThermalsWithData:", v3);
  -[MXMSystemProbe _pollSystemBatteryWithData:](self, "_pollSystemBatteryWithData:", v3);

}

- (void)_pollSystemHostProcessorInfoWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  processor_flavor_t v12;
  size_t v13;
  processor_info_array_t *v14;
  host_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  processor_info_array_t v20;
  kern_return_t v21;
  NSObject *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  id v26;
  void *v28;
  void *v29;
  void *v30;
  mach_msg_type_number_t out_processor_infoCnt[2];
  uint8_t buf[4];
  kern_return_t v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v34[0] = &unk_24D19CA30;
  v34[1] = &unk_24D19CA60;
  v35[0] = &unk_24D19CA48;
  v35[1] = &unk_24D19CA78;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = 0;
    v28 = v5;
    do
    {
      objc_msgSend(v5, "allKeys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v10;
      v12 = objc_msgSend(v10, "intValue");
      v29 = v11;
      v13 = objc_msgSend(v11, "integerValue");
      v14 = (processor_info_array_t *)malloc_type_malloc(v13, 0x9C141D88uLL);
      *(_QWORD *)out_processor_infoCnt = 0;
      v15 = MEMORY[0x2199CE32C]();
      LODWORD(v10) = host_processor_info(v15, v12, &out_processor_infoCnt[1], v14, out_processor_infoCnt);
      v16 = mach_absolute_time();
      if ((_DWORD)v10)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMSystemProbe.m"), 172, CFSTR("Failed to retrieve mach host information."));

      }
      -[MXMSystemProbe _buildData:timestamp:processorCount:](self, "_buildData:timestamp:processorCount:", v4, v16, out_processor_infoCnt[1]);
      if (out_processor_infoCnt[1])
      {
        if ((v12 - 1) > 1)
        {
          objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("MetricMeasurement"), CFSTR("Invalid Processor Flavor Value"), 0);
          v26 = (id)objc_claimAutoreleasedReturnValue();
          objc_exception_throw(v26);
        }
        v17 = 0;
        v18 = 0;
        v19 = 0;
        do
        {
          v20 = *v14;
          if (v12 == 1)
            -[MXMSystemProbe _buildData:timestamp:cpuInfo:](self, "_buildData:timestamp:cpuInfo:", v4, v16, &v20[v17]);
          else
            -[MXMSystemProbe _buildData:timestamp:cpuLoad:](self, "_buildData:timestamp:cpuLoad:", v4, v16, &v20[v18]);
          ++v19;
          v18 += 4;
          v17 += 5;
        }
        while (v19 < out_processor_infoCnt[1]);
      }
      v21 = mach_vm_deallocate(*MEMORY[0x24BDAEC58], (mach_vm_address_t)*v14, v13);
      _MXMGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        v33 = v21;
        _os_log_impl(&dword_214474000, v22, OS_LOG_TYPE_DEBUG, "Recieved non-success kernel return from mach_vm_deallocate (%i).", buf, 8u);
      }

      free(v14);
      ++v8;
      v5 = v28;
      objc_msgSend(v28, "allKeys");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

    }
    while (v8 < v24);
  }

}

- (void)_pollProcessorLoadInformationWithData:(id)a3
{
  id v5;
  host_t v6;
  kern_return_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  mach_msg_type_number_t info_outCnt;
  processor_set_name_t default_set;
  integer_t info_out[2];
  uint64_t v14;

  v5 = a3;
  *(_QWORD *)info_out = 0;
  v14 = 0;
  info_outCnt = 4;
  default_set = 0;
  v6 = MEMORY[0x2199CE32C]();
  if (processor_set_default(v6, &default_set))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMSystemProbe.m"), 207, CFSTR("Failed to retrieve pset name."));

  }
  v7 = processor_set_statistics(default_set, 4, info_out, &info_outCnt);
  v8 = mach_absolute_time();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMSystemProbe.m"), 212, CFSTR("Failed to retrieve set load info."));

  }
  -[MXMSystemProbe _buildData:timestamp:loadInfo:](self, "_buildData:timestamp:loadInfo:", v5, v8, info_out);

}

- (void)_pollSystemLoadInformationWithData:(id)a3
{
  host_t v5;
  void *v6;
  _OWORD v7[9];
  uint64_t v8;
  mach_msg_type_number_t host_info64_outCnt;

  host_info64_outCnt = 0;
  v8 = 0;
  memset(v7, 0, sizeof(v7));
  v5 = MEMORY[0x2199CE32C](self, a2, a3);
  if (host_statistics64(v5, 4, (host_info64_t)v7, &host_info64_outCnt))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMSystemProbe.m"), 224, CFSTR("Failed to retrieve host statistics."));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateThread, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
