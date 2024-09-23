@implementation HDLab

+ (HDLab)defaultLab
{
  if (defaultLab_onceToken != -1)
    dispatch_once(&defaultLab_onceToken, &__block_literal_global);
  return (HDLab *)(id)defaultLab_lab;
}

void __19__HDLab_defaultLab__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)defaultLab_lab;
  defaultLab_lab = v0;

}

- (HDLab)init
{
  HDLab *v2;
  uint64_t v3;
  NSMutableDictionary *experiments;
  uint64_t v5;
  NSMutableDictionary *analyses;
  uint64_t v7;
  NSMutableDictionary *diagnostics;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HDLab;
  v2 = -[HDLab init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    experiments = v2->_experiments;
    v2->_experiments = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    analyses = v2->_analyses;
    v2->_analyses = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    diagnostics = v2->_diagnostics;
    v2->_diagnostics = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (void)addExperimentWithName:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  HDLab *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[NSMutableDictionary objectForKeyedSubscript:](v8->_experiments, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    HDDefaultLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v6;
      v11 = "Will replace already existing experiment for name %@";
LABEL_6:
      _os_log_impl(&dword_2295BF000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    HDDefaultLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v6;
      v11 = "Adding experiment with name %@";
      goto LABEL_6;
    }
  }

  v12 = (void *)MEMORY[0x22E2CC10C](v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_experiments, "setObject:forKeyedSubscript:", v12, v6);

  objc_sync_exit(v8);
}

- (void)addAnalysisWithName:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  HDLab *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[NSMutableDictionary objectForKeyedSubscript:](v8->_analyses, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    HDDefaultLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v6;
      v11 = "Will replace already existing analysis for name %@";
LABEL_6:
      _os_log_impl(&dword_2295BF000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    HDDefaultLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v6;
      v11 = "Adding analysis with name %@";
      goto LABEL_6;
    }
  }

  v12 = (void *)MEMORY[0x22E2CC10C](v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_analyses, "setObject:forKeyedSubscript:", v12, v6);

  objc_sync_exit(v8);
}

- (void)addDiagnosticWithName:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  HDLab *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[NSMutableDictionary objectForKeyedSubscript:](v8->_diagnostics, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    HDDefaultLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v6;
      v11 = "Will replace already existing diagnostic for name %@";
LABEL_6:
      _os_log_impl(&dword_2295BF000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    HDDefaultLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v6;
      v11 = "Adding diagnostic with name %@";
      goto LABEL_6;
    }
  }

  v12 = (void *)MEMORY[0x22E2CC10C](v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_diagnostics, "setObject:forKeyedSubscript:", v12, v6);

  objc_sync_exit(v8);
}

- (void)addDiagnosticWithName:(id)a3 summary:(id)a4 experimentName:(id)a5 analysisName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v10 = a4;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __67__HDLab_addDiagnosticWithName_summary_experimentName_analysisName___block_invoke;
  v16[3] = &unk_24F252EF0;
  v17 = v10;
  v11 = v10;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = (void *)MEMORY[0x22E2CC10C](v16);
  -[HDLab addDiagnosticWithName:experimentName:analysisName:block:](self, "addDiagnosticWithName:experimentName:analysisName:block:", v14, v13, v12, v15);

}

HDSimpleDiagnostic *__67__HDLab_addDiagnosticWithName_summary_experimentName_analysisName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  HDSimpleDiagnostic *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[HDSimpleDiagnostic initWithExperiment:analysis:]([HDSimpleDiagnostic alloc], "initWithExperiment:analysis:", v6, v5);

  -[HDSimpleDiagnostic setSummary:](v7, "setSummary:", *(_QWORD *)(a1 + 32));
  return v7;
}

- (void)addDiagnosticWithName:(id)a3 experimentName:(id)a4 analysisName:(id)a5 block:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __65__HDLab_addDiagnosticWithName_experimentName_analysisName_block___block_invoke;
  v22 = &unk_24F252F18;
  objc_copyWeak(&v27, &location);
  v14 = v11;
  v23 = v14;
  v15 = v10;
  v24 = v15;
  v16 = v12;
  v25 = v16;
  v17 = v13;
  v26 = v17;
  v18 = (void *)MEMORY[0x22E2CC10C](&v19);
  -[HDLab addDiagnosticWithName:block:](self, "addDiagnosticWithName:block:", v15, v18, v19, v20, v21, v22);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

id __65__HDLab_addDiagnosticWithName_experimentName_analysisName_block___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "experimentWithName:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    HDDefaultLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __65__HDLab_addDiagnosticWithName_experimentName_analysisName_block___block_invoke_cold_1();
    goto LABEL_9;
  }
  objc_msgSend(WeakRetained, "analysisWithName:", *(_QWORD *)(a1 + 48));
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    HDDefaultLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __65__HDLab_addDiagnosticWithName_experimentName_analysisName_block___block_invoke_cold_2();

LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v5;
}

- (id)experimentWithName:(id)a3
{
  id v4;
  HDLab *v5;
  void (**v6)(_QWORD);
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_experiments, "objectForKeyedSubscript:", v4);
  v6 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  if (v6)
  {
    v6[2](v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)analysisWithName:(id)a3
{
  id v4;
  HDLab *v5;
  void (**v6)(_QWORD);
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_analyses, "objectForKeyedSubscript:", v4);
  v6 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  if (v6)
  {
    v6[2](v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)diagnosticWithName:(id)a3
{
  id v4;
  HDLab *v5;
  void (**v6)(_QWORD);
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_diagnostics, "objectForKeyedSubscript:", v4);
  v6 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  if (v6)
  {
    v6[2](v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSDictionary)availableExperiments
{
  HDLab *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableDictionary copy](v2->_experiments, "copy");
  objc_sync_exit(v2);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __29__HDLab_availableExperiments__block_invoke;
  v7[3] = &unk_24F252F40;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  return (NSDictionary *)v5;
}

void __29__HDLab_availableExperiments__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void (*v5)(uint64_t);
  id v6;
  id v7;

  v5 = *(void (**)(uint64_t))(a3 + 16);
  v6 = a2;
  v5(a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

- (NSDictionary)availableAnalyses
{
  HDLab *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableDictionary copy](v2->_analyses, "copy");
  objc_sync_exit(v2);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __26__HDLab_availableAnalyses__block_invoke;
  v7[3] = &unk_24F252F68;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  return (NSDictionary *)v5;
}

void __26__HDLab_availableAnalyses__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void (*v5)(uint64_t);
  id v6;
  id v7;

  v5 = *(void (**)(uint64_t))(a3 + 16);
  v6 = a2;
  v5(a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

- (NSDictionary)availableDiagnostics
{
  HDLab *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableDictionary copy](v2->_diagnostics, "copy");
  objc_sync_exit(v2);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __29__HDLab_availableDiagnostics__block_invoke;
  v7[3] = &unk_24F252F90;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  return (NSDictionary *)v5;
}

void __29__HDLab_availableDiagnostics__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  (*(void (**)(uint64_t))(a3 + 16))(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_analyses, 0);
  objc_storeStrong((id *)&self->_experiments, 0);
}

void __65__HDLab_addDiagnosticWithName_experimentName_analysisName_block___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2295BF000, v0, v1, "Cannot find experiment %@ for creating diagnostic %@");
}

void __65__HDLab_addDiagnosticWithName_experimentName_analysisName_block___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2295BF000, v0, v1, "Cannot find analysis %@ for creating diagnostic %@");
}

@end
