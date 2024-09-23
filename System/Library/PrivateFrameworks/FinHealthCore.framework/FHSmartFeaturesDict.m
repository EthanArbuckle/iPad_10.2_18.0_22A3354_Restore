@implementation FHSmartFeaturesDict

void __FHSmartFeaturesDict_block_invoke()
{
  FHExperiment *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!_os_feature_enabled_impl())
    goto LABEL_8;
  v0 = -[FHExperiment initWithNamespaceName:]([FHExperiment alloc], "initWithNamespaceName:", CFSTR("WPC_ANALYTICS_FHCONFIGS"));
  -[FHExperiment getFilePathForFactor:](v0, "getFilePathForFactor:", CFSTR("FH_CONFIG_ROLLOUT"));
  v1 = objc_claimAutoreleasedReturnValue();
  if (!v1)
  {

LABEL_8:
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23B4A2000, v5, OS_LOG_TYPE_DEBUG, "Loading features.json data from default resource.", buf, 2u);
    }

    loadConfigurationFromJsonFile(CFSTR("assets_1671/features"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v2 = (void *)v1;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FinHealthLogObject(CFSTR("FinHealthCore"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v2;
    _os_log_impl(&dword_23B4A2000, v4, OS_LOG_TYPE_DEBUG, "Loading path: %@ for features.json data from Turi", buf, 0xCu);
  }

  if (!v3)
    goto LABEL_8;
LABEL_11:
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v3, 1, &v12);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v12;
  v8 = (void *)FHSmartFeaturesDict_fhSmartFeaturesDict;
  FHSmartFeaturesDict_fhSmartFeaturesDict = v6;

  FinHealthLogObject(CFSTR("FinHealthCore"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)FHSmartFeaturesDict_fhSmartFeaturesDict, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v10;
    _os_log_impl(&dword_23B4A2000, v9, OS_LOG_TYPE_DEBUG, "[fhSmartFeaturesDict allKeys]: %@", buf, 0xCu);

  }
  if (!FHSmartFeaturesDict_fhSmartFeaturesDict)
  {
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_23B4A2000, v11, OS_LOG_TYPE_ERROR, "Error parsing JSON: %@", buf, 0xCu);
    }

  }
}

@end
