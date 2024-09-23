@implementation GEOAPUploadPolicies

+ (id)sharedPolicies
{
  if (qword_254316CE8 != -1)
    dispatch_once(&qword_254316CE8, &__block_literal_global_18);
  return (id)qword_254316CE0;
}

void __37__GEOAPUploadPolicies_sharedPolicies__block_invoke()
{
  GEOAPUploadPolicies *v0;
  void *v1;

  v0 = objc_alloc_init(GEOAPUploadPolicies);
  v1 = (void *)qword_254316CE0;
  qword_254316CE0 = (uint64_t)v0;

}

- (GEOAPUploadPolicies)init
{
  GEOAPUploadPolicies *v2;
  uint64_t v3;
  OS_dispatch_queue *isoQueue;
  NSMutableDictionary *v5;
  NSMutableDictionary *policyDict;
  NSObject *v7;
  GEOAPUploadPolicies *v8;
  uint64_t v9;
  NSMutableArray *configListeners;
  NSMutableArray *v11;
  void *v12;
  NSMutableArray *v13;
  void *v14;
  NSMutableArray *v15;
  void *v16;
  NSMutableArray *v17;
  void *v18;
  NSMutableArray *v19;
  void *v20;
  NSMutableArray *v21;
  void *v22;
  NSMutableArray *v23;
  void *v24;
  NSMutableArray *v25;
  void *v26;
  NSMutableArray *v27;
  void *v28;
  NSMutableArray *v29;
  void *v30;
  id v32;
  _QWORD *v33;
  GEOAPUploadPolicies *v34;
  GEOAPUploadPolicies *v35;
  GEOAPUploadPolicies *v36;
  GEOAPUploadPolicies *v37;
  GEOAPUploadPolicies *v38;
  GEOAPUploadPolicies *v39;
  GEOAPUploadPolicies *v40;
  GEOAPUploadPolicies *v41;
  _QWORD block[4];
  GEOAPUploadPolicies *v43;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)GEOAPUploadPolicies;
  v2 = -[GEOAPUploadPolicies init](&v44, sel_init);
  if (v2)
  {
    v3 = geo_dispatch_queue_create();
    isoQueue = v2->_isoQueue;
    v2->_isoQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    policyDict = v2->_policyDict;
    v2->_policyDict = v5;

    v7 = v2->_isoQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __27__GEOAPUploadPolicies_init__block_invoke;
    block[3] = &unk_250DC0660;
    v8 = v2;
    v43 = v8;
    dispatch_async(v7, block);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    configListeners = v8->_configListeners;
    v8->_configListeners = (NSMutableArray *)v9;

    v11 = v8->_configListeners;
    v41 = v8;
    _GEOConfigAddBlockListenerForKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v11, "addObject:", v12);

    v13 = v8->_configListeners;
    v40 = v41;
    _GEOConfigAddBlockListenerForKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v13, "addObject:", v14);

    v15 = v8->_configListeners;
    v39 = v40;
    _GEOConfigAddBlockListenerForKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v15, "addObject:", v16);

    v17 = v8->_configListeners;
    v38 = v39;
    _GEOConfigAddBlockListenerForKey();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v17, "addObject:", v18);

    v19 = v8->_configListeners;
    v37 = v38;
    _GEOConfigAddBlockListenerForKey();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v19, "addObject:", v20);

    v21 = v8->_configListeners;
    v36 = v37;
    _GEOConfigAddBlockListenerForKey();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v21, "addObject:", v22);

    v23 = v8->_configListeners;
    v35 = v36;
    _GEOConfigAddBlockListenerForKey();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v23, "addObject:", v24);

    v25 = v8->_configListeners;
    v34 = v35;
    _GEOConfigAddBlockListenerForKey();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v25, "addObject:", v26);

    v27 = v8->_configListeners;
    v33 = v34;
    _GEOConfigAddBlockListenerForKey();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v27, "addObject:", v28);

    v29 = v8->_configListeners;
    v32 = v33;
    _GEOConfigAddBlockListenerForKey();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v29, "addObject:", v30);

  }
  return v2;
}

uint64_t __27__GEOAPUploadPolicies_init__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 1, GeoAnalyticsUploadPolicyConfig_LOW_COST_7D_config, off_256C1CC48);
  objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 2, GeoAnalyticsUploadPolicyConfig_MED_COST_7D_config, off_256C1CC58);
  objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 3, GeoAnalyticsUploadPolicyConfig_HIGH_COST_7D_config, off_256C1CC38);
  objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 4, GeoAnalyticsUploadPolicyConfig_HIGHEST_COST_7D_config, off_256C1CC28);
  objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 5, GeoAnalyticsUploadPolicyConfig_MED_COST_90D_config, off_256C1CC68);
  objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 6, GeoAnalyticsUploadPolicyConfig_UP_POLICY_00_config, off_256C1CC78);
  objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 7, GeoAnalyticsUploadPolicyConfig_UP_POLICY_01_config, off_256C1CC88);
  objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 8, GeoAnalyticsUploadPolicyConfig_UP_POLICY_02_config, off_256C1CC98);
  objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 9, GeoAnalyticsUploadPolicyConfig_UP_POLICY_03_config, off_256C1CCA8);
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 10, GeoAnalyticsUploadPolicyConfig_POI_BUSYNESS_POLICY_config, off_256C1CFD8);
}

uint64_t __27__GEOAPUploadPolicies_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 1, GeoAnalyticsUploadPolicyConfig_LOW_COST_7D_config, off_256C1CC48);
}

uint64_t __27__GEOAPUploadPolicies_init__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 2, GeoAnalyticsUploadPolicyConfig_MED_COST_7D_config, off_256C1CC58);
}

uint64_t __27__GEOAPUploadPolicies_init__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 3, GeoAnalyticsUploadPolicyConfig_HIGH_COST_7D_config, off_256C1CC38);
}

uint64_t __27__GEOAPUploadPolicies_init__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 4, GeoAnalyticsUploadPolicyConfig_HIGHEST_COST_7D_config, off_256C1CC28);
}

uint64_t __27__GEOAPUploadPolicies_init__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 5, GeoAnalyticsUploadPolicyConfig_MED_COST_90D_config, off_256C1CC68);
}

uint64_t __27__GEOAPUploadPolicies_init__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 6, GeoAnalyticsUploadPolicyConfig_UP_POLICY_00_config, off_256C1CC78);
}

uint64_t __27__GEOAPUploadPolicies_init__block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 7, GeoAnalyticsUploadPolicyConfig_UP_POLICY_01_config, off_256C1CC88);
}

uint64_t __27__GEOAPUploadPolicies_init__block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 8, GeoAnalyticsUploadPolicyConfig_UP_POLICY_02_config, off_256C1CC98);
}

uint64_t __27__GEOAPUploadPolicies_init__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 9, GeoAnalyticsUploadPolicyConfig_UP_POLICY_03_config, off_256C1CCA8);
}

uint64_t __27__GEOAPUploadPolicies_init__block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyConfigForUploadPolicyConfigType:configKey:", 10, GeoAnalyticsUploadPolicyConfig_POI_BUSYNESS_POLICY_config, off_256C1CFD8);
}

- (void)_updatePolicyConfigForUploadPolicyConfigType:(int)a3 configKey:(id)a4
{
  uint64_t v4;
  GEOAPUploadPolicy *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  char isKindOfClass;
  uint64_t v30;
  void *v31;
  double v32;
  GEOAPUploadStage *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  NSMutableDictionary *policyDict;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v46;
  GEOAPUploadPolicy *v47;
  id v48;
  GEOAPUploadStage *v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v4 = *(_QWORD *)&a3;
  v61 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(GEOAPUploadPolicy);
  v46 = v4;
  -[GEOAPUploadPolicy setType:](v5, "setType:", v4);
  v6 = -[GEOAPUploadPolicy type](v5, "type");
  if (v6 >= 0xC)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = *(&off_250DC63F8 + (int)v6);
  }
  GEOConfigGetDictionary();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ttl"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0x24BDD1000uLL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    GEOGetUploadPoliciesAnalyticsLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v57 = v7;
      _os_log_impl(&dword_23CBB4000, v11, OS_LOG_TYPE_ERROR, "'ttl' not set for %@ upload policy (using default value)", buf, 0xCu);
    }

    v9 = &unk_250DDF970;
  }
  objc_msgSend(v9, "doubleValue");
  -[GEOAPUploadPolicy setTtl:](v5, "setTtl:");
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("immediately"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    GEOGetUploadPoliciesAnalyticsLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v57 = v7;
      _os_log_impl(&dword_23CBB4000, v13, OS_LOG_TYPE_ERROR, "'immediately' not set for %@ upload policy (using default value)", buf, 0xCu);
    }

    v12 = (void *)MEMORY[0x24BDBD1C0];
  }
  -[GEOAPUploadPolicy setSendImmediately:](v5, "setSendImmediately:", objc_msgSend(v12, "BOOLValue"));
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("stages"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v43 = v9;
  v44 = v8;
  v42 = v12;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    GEOGetUploadPoliciesAnalyticsLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v57 = v7;
      _os_log_impl(&dword_23CBB4000, v15, OS_LOG_TYPE_ERROR, "bad upload stages for %@ upload policy (must be an array of dictionaries)", buf, 0xCu);
    }

    v14 = 0;
  }
  v47 = v5;
  v48 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (!v17)
  {
    v49 = 0;
    v51 = 0;
    goto LABEL_56;
  }
  v18 = v17;
  v49 = 0;
  v51 = 0;
  v19 = *(_QWORD *)v53;
  v50 = v7;
  do
  {
    v20 = 0;
    do
    {
      if (*(_QWORD *)v53 != v19)
        objc_enumerationMutation(v16);
      v21 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v20);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ttl"));
        v22 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("type"));
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        if (v22)
          v25 = v23 == 0;
        else
          v25 = 1;
        if (v25)
        {
          GEOGetUploadPoliciesAnalyticsLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v7;
            v27 = v26;
            v28 = "bad upload stage in %@ upload policy (missing \"ttl\" or \"type\" keys)";
            goto LABEL_38;
          }
        }
        else
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          if ((isKindOfClass & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v30 = objc_msgSend(v24, "intValue");
              +[GEOAPURLSessionConfig configForURLSessionConfigType:](GEOAPURLSessionConfig, "configForURLSessionConfigType:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v31, "type"))
              {
                -[NSObject doubleValue](v22, "doubleValue");
                if (v32 <= 0.0)
                {
                  if (v30 >= 7)
                  {
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v30);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v35 = *(&off_250DC6458 + (int)v30);
                  }
                  GEOGetUploadPoliciesAnalyticsLog();
                  v36 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v57 = v35;
                    v58 = 2112;
                    v59 = v50;
                    _os_log_impl(&dword_23CBB4000, v36, OS_LOG_TYPE_ERROR, "bad upload stage %@ in %@ upload policy (ttl is <= 0)", buf, 0x16u);
                  }

                }
                else
                {
                  v33 = -[GEOAPUploadStage initWithURLSessionConfig:ttl:]([GEOAPUploadStage alloc], "initWithURLSessionConfig:ttl:", v31, v32);

                  objc_msgSend(v48, "addObject:", v33);
                  v49 = v33;
                }
              }
              else
              {
                GEOGetUploadPoliciesAnalyticsLog();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v57 = v50;
                  v58 = 1024;
                  LODWORD(v59) = v30;
                  _os_log_impl(&dword_23CBB4000, v34, OS_LOG_TYPE_ERROR, "bad upload stage in %@ upload policy (unknown session config type %d)", buf, 0x12u);
                }

              }
              v51 = v31;
              v7 = v50;
              v10 = 0x24BDD1000;
              goto LABEL_40;
            }
          }
          GEOGetUploadPoliciesAnalyticsLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v7;
            v27 = v26;
            v28 = "bad upload stage in %@ upload policy (ttl and type must be of type NSNumber)";
LABEL_38:
            _os_log_impl(&dword_23CBB4000, v27, OS_LOG_TYPE_ERROR, v28, buf, 0xCu);
          }
        }

LABEL_40:
        goto LABEL_41;
      }
      GEOGetUploadPoliciesAnalyticsLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v7;
        _os_log_impl(&dword_23CBB4000, v22, OS_LOG_TYPE_ERROR, "bad upload stage in %@ upload policy (stage must be a dictionary)", buf, 0xCu);
      }
LABEL_41:

      ++v20;
    }
    while (v18 != v20);
    v37 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    v18 = v37;
  }
  while (v37);
LABEL_56:

  if (!objc_msgSend(v48, "count"))
  {
    if (qword_254316CF0 != -1)
      dispatch_once(&qword_254316CF0, &__block_literal_global_98);
    objc_msgSend(v48, "addObject:", qword_254316CF8);
    GEOGetUploadPoliciesAnalyticsLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v57 = v7;
      _os_log_impl(&dword_23CBB4000, v38, OS_LOG_TYPE_ERROR, "no upload stages declared for %@ upload policy; applying default upload stage",
        buf,
        0xCu);
    }

  }
  v39 = (void *)objc_msgSend(v48, "copy");
  -[GEOAPUploadPolicy setUploadStages:](v47, "setUploadStages:", v39);

  policyDict = self->_policyDict;
  objc_msgSend(*(id *)(v10 + 1760), "numberWithInt:", v46);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](policyDict, "setObject:forKeyedSubscript:", v47, v41);

}

void __78__GEOAPUploadPolicies__updatePolicyConfigForUploadPolicyConfigType_configKey___block_invoke()
{
  GEOAPUploadStage *v0;
  void *v1;
  id v2;

  +[GEOAPURLSessionConfig configForURLSessionConfigType:](GEOAPURLSessionConfig, "configForURLSessionConfigType:", 5);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[GEOAPUploadStage initWithURLSessionConfig:ttl:]([GEOAPUploadStage alloc], "initWithURLSessionConfig:ttl:", v2, 604800.0);
  v1 = (void *)qword_254316CF8;
  qword_254316CF8 = (uint64_t)v0;

}

- (double)ttlForUploadPolicyType:(int)a3
{
  void *v3;
  double v4;
  double v5;

  -[GEOAPUploadPolicies uploadPolicyForUploadPolicyType:](self, "uploadPolicyForUploadPolicyType:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ttl");
  v5 = v4;

  return v5;
}

- (id)uploadPolicyForUploadPolicyType:(int)a3
{
  NSObject *isoQueue;
  id v4;
  _QWORD block[6];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  v13 = 0;
  isoQueue = self->_isoQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__GEOAPUploadPolicies_uploadPolicyForUploadPolicyType___block_invoke;
  block[3] = &unk_250DC63B8;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(isoQueue, block);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __55__GEOAPUploadPolicies_uploadPolicyForUploadPolicyType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configListeners, 0);
  objc_storeStrong((id *)&self->_policyDict, 0);
  objc_storeStrong((id *)&self->_isoQueue, 0);
}

@end
