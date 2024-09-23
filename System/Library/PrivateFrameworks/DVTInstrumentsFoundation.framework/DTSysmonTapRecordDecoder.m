@implementation DTSysmonTapRecordDecoder

- (unint64_t)enumerateRecordsFromSample:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  DTSysmonCPUUsageEntry *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  DTSysmonCPUUsageEntry *v52;
  void *v53;
  void *v54;
  id v55;
  unint64_t mostRecentEpoch;
  void *v58;
  void (**v59)(id, void *);
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRecordType:", objc_msgSend(v9, "unsignedIntValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("StartMachAbsTime"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("StartMachAbsTime"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedLongLongValue");

    objc_msgSend(v8, "setStartTimestamp:", v12);
    self->_mostRecentEpoch = v12;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EndMachAbsTime"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EndMachAbsTime"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedLongLongValue");

    objc_msgSend(v8, "setEndTimestamp:", v15);
    self->_mostRecentEpoch = v15;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ProcessesAttributes"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16 && (objc_msgSend(v16, "isEqual:", self->_processAttributes) & 1) == 0)
    objc_storeStrong((id *)&self->_processAttributes, v17);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SystemAttributes"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 && (objc_msgSend(v18, "isEqual:", self->_systemAttributes) & 1) == 0)
    objc_storeStrong((id *)&self->_systemAttributes, v18);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CoalitionAttributes"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19 && (objc_msgSend(v19, "isEqual:", self->_coalitionAttributes) & 1) == 0)
    objc_storeStrong((id *)&self->_coalitionAttributes, v19);
  objc_msgSend(v8, "setProcessAttributes:", self->_processAttributes);
  objc_msgSend(v8, "setSystemAttributes:", self->_systemAttributes);
  objc_msgSend(v8, "setCoalitionAttributes:", self->_coalitionAttributes);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Processes"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = MEMORY[0x24BDAC760];
  if (v20)
  {
    v22 = (void *)objc_opt_new();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Processes"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v21;
    v64[1] = 3221225472;
    v64[2] = sub_222B7A284;
    v64[3] = &unk_24EB2A3C0;
    v65 = v22;
    v24 = v22;
    objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v64);

    objc_msgSend(v8, "setChangedProcesses:", v24);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("System"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = (void *)objc_opt_new();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("System"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAttributes:", v27);

    objc_msgSend(v8, "setSystem:", v26);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Coalitions"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = (void *)objc_opt_new();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Coalitions"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v21;
    v62[1] = 3221225472;
    v62[2] = sub_222B7A314;
    v62[3] = &unk_24EB2A3C0;
    v63 = v29;
    v31 = v29;
    objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v62);

    objc_msgSend(v8, "setCoalitions:", v31);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DeadProcesses"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DeadProcesses"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDeadProcesses:", v33);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DeadCoalitions"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DeadCoalitions"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDeadCoalitions:", v35);

  }
  if ((objc_msgSend(v8, "recordType") & 0x20) != 0)
  {
    v36 = (void *)objc_opt_new();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CPUCount"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setCpuCount:", objc_msgSend(v37, "unsignedIntValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EnabledCPUs"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setEnabledCPUs:", objc_msgSend(v38, "unsignedIntValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SystemCPUUsage"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = [DTSysmonCPUUsageEntry alloc];
    objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("CPU_TotalLoad"));
    v59 = v7;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "doubleValue");
    v43 = v42;
    objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("CPU_UserLoad"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "doubleValue");
    v46 = v45;
    objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("CPU_SystemLoad"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "doubleValue");
    v49 = v48;
    objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("CPU_NiceLoad"));
    v58 = v19;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "doubleValue");
    v52 = -[DTSysmonCPUUsageEntry initWithTotal:user:system:nice:](v40, "initWithTotal:user:system:nice:", v43, v46, v49, v51);
    objc_msgSend(v36, "setAverageCPUUsage:", v52);

    v7 = v59;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PerCPUUsage"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_opt_new();
    v60[0] = MEMORY[0x24BDAC760];
    v60[1] = 3221225472;
    v60[2] = sub_222B7A3A4;
    v60[3] = &unk_24EB2A3E8;
    v61 = v54;
    v55 = v54;
    objc_msgSend(v53, "enumerateObjectsUsingBlock:", v60);
    objc_msgSend(v36, "setPerCPUUsage:", v55);
    objc_msgSend(v8, "setCpuUsage:", v36);

    v19 = v58;
  }
  v7[2](v7, v8);
  mostRecentEpoch = self->_mostRecentEpoch;

  return mostRecentEpoch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalitionAttributes, 0);
  objc_storeStrong((id *)&self->_systemAttributes, 0);
  objc_storeStrong((id *)&self->_processAttributes, 0);
}

@end
