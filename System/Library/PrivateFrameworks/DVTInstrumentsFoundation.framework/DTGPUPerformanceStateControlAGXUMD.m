@implementation DTGPUPerformanceStateControlAGXUMD

- (DTGPUPerformanceStateControlAGXUMD)initWithDevice:(id)a3
{
  id v4;
  DTGPUPerformanceStateControlAGXUMD *v5;
  id v6;
  uint64_t v7;
  DTGPUPerformanceStateControlAGXUMD *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DTGPUPerformanceStateControlAGXUMD;
  v5 = -[DTGPUPerformanceStateControlAGXUMD init](&v10, sel_init);
  if (v5)
  {
    v6 = v4;
    while ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "baseObject");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v7;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_opt_respondsToSelector() & 1) == 0
      || (objc_opt_respondsToSelector() & 1) == 0
      || (objc_opt_respondsToSelector() & 1) == 0)
    {

      v8 = 0;
      goto LABEL_12;
    }
    objc_storeStrong((id *)&v5->_agxDevice, v6);
    v5->_acceleratorId = objc_msgSend(v6, "registryID");

  }
  v8 = v5;
LABEL_12:

  return v8;
}

- (id)currentState
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[6];
  _QWORD v29[8];

  v29[6] = *MEMORY[0x24BDAC8D0];
  -[AGXConsistentStateDevice getConsistentPerfStateInfoAndReset:](self->_agxDevice, "getConsistentPerfStateInfoAndReset:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AGXConsistentStateDevice getConsistentPerfStateMappingTable](self->_agxDevice, "getConsistentPerfStateMappingTable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("min_pstate"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mid_pstate"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("max_pstate"));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = &unk_24EB4EE58;
      if (v27 && v26 && v6)
      {
        v25 = (void *)v6;
        v9 = objc_msgSend(v27, "unsignedIntValue");
        v10 = objc_msgSend(v26, "unsignedIntValue");
        v11 = objc_msgSend(v25, "unsignedIntValue");
        v8 = (void *)objc_opt_new();
        v28[0] = CFSTR("accelerator-id");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_acceleratorId);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v23;
        v29[1] = MEMORY[0x24BDBD1C8];
        v28[1] = CFSTR("available");
        v28[2] = CFSTR("enabled");
        v12 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("is_enabled"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "numberWithBool:", objc_msgSend(v24, "BOOLValue"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v29[2] = v21;
        v28[3] = CFSTR("sustained");
        v13 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("was_consistent"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "numberWithBool:", objc_msgSend(v22, "BOOLValue"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v29[3] = v14;
        v28[4] = CFSTR("level");
        v15 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v3, "objectForKeyedSubscript:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "numberWithUnsignedInt:", objc_msgSend(v16, "unsignedIntValue"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v29[4] = v17;
        v28[5] = CFSTR("mapping");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (v10 << 16) | (v9 << 24) | (v11 << 8));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v29[5] = v18;
        v7 = v25;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addEntriesFromDictionary:", v19);

      }
    }
    else
    {
      v8 = &unk_24EB4EE30;
    }

  }
  else
  {
    v8 = &unk_24EB4EE08;
  }

  return v8;
}

- (BOOL)enable:(unint64_t)a3
{
  return MEMORY[0x24BEDD108](self->_agxDevice, sel_enableConsistentPerfState_);
}

- (id)disable
{
  void *v3;

  -[DTGPUPerformanceStateControlAGXUMD currentState](self, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AGXConsistentStateDevice disableConsistentPerfState](self->_agxDevice, "disableConsistentPerfState");
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agxDevice, 0);
}

@end
