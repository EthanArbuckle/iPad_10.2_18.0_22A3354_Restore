@implementation FedStatsPluginTelemetry

+ (void)reportPluginSucceedForAssetProvider:(id)a3
{
  +[FedStatsPluginTelemetry reportPluginForAssetProvider:withError:](FedStatsPluginTelemetry, "reportPluginForAssetProvider:withError:", a3, 0);
}

+ (void)reportPluginForAssetProvider:(id)a3 withError:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;

  v5 = (void *)MEMORY[0x24BE5F6F8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BE5F708]);
  objc_msgSend(v7, "experimentIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deploymentIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "intValue");
  objc_msgSend(v7, "treatmentIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v9, "initWithExperimentID:deploymentID:treatmentID:", v10, v12, v13);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE5F700]), "initWithPerformTrialTaskStatus:error:usePrivateUpload:", v6 == 0, v6, 1);

  v19 = 0;
  LODWORD(v10) = objc_msgSend(v8, "addLighthousePluginEvent:identifiers:error:", v15, v14, &v19);
  v16 = v19;
  v17 = v16;
  if ((_DWORD)v10 && v16)
  {
    +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[FedStatsPluginTelemetry reportPluginForAssetProvider:withError:].cold.1((uint64_t)v17, v18);

  }
}

+ (void)reportPluginForAssetProvider:(uint64_t)a1 withError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_23B425000, a2, OS_LOG_TYPE_ERROR, "Bitacora donation error: %@", (uint8_t *)&v2, 0xCu);
}

@end
