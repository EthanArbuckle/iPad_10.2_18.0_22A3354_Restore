@implementation FedStatsCollectionKeyGenerator

- (FedStatsCollectionKeyGenerator)initWithPrefix:(id)a3 cohortKeys:(id)a4 requiredFields:(id)a5 assetProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FedStatsCollectionKeyGenerator *v14;
  unint64_t v15;
  void *v16;
  char v17;
  NSString *v18;
  NSString *prefix;
  uint64_t v20;
  NSString *namespaceIdentifier;
  uint64_t v22;
  NSString *experimentIdentifier;
  uint64_t v24;
  NSString *deploymentIdentifier;
  uint64_t v26;
  NSString *treatmentIdentifier;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSArray *unifiedFields;
  objc_super v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v34.receiver = self;
  v34.super_class = (Class)FedStatsCollectionKeyGenerator;
  v14 = -[FedStatsCollectionKeyGenerator init](&v34, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "length");
    if (v15 >= objc_msgSend(CFSTR("fedstats:"), "length")
      && (objc_msgSend(v10, "substringToIndex:", objc_msgSend(CFSTR("fedstats:"), "length")),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("fedstats:")),
          v16,
          (v17 & 1) != 0))
    {
      v18 = (NSString *)v10;
    }
    else
    {
      objc_msgSend(CFSTR("fedstats:"), "stringByAppendingString:", v10);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    prefix = v14->_prefix;
    v14->_prefix = v18;

    objc_storeStrong((id *)&v14->_cohortKeys, a4);
    objc_storeStrong((id *)&v14->_requiredFields, a5);
    objc_msgSend(v13, "namespaceIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    namespaceIdentifier = v14->_namespaceIdentifier;
    v14->_namespaceIdentifier = (NSString *)v20;

    objc_msgSend(v13, "experimentIdentifier");
    v22 = objc_claimAutoreleasedReturnValue();
    experimentIdentifier = v14->_experimentIdentifier;
    v14->_experimentIdentifier = (NSString *)v22;

    if (!v14->_experimentIdentifier)
    {
      v14->_experimentIdentifier = (NSString *)CFSTR("N/A");

    }
    objc_msgSend(v13, "deploymentIdentifier");
    v24 = objc_claimAutoreleasedReturnValue();
    deploymentIdentifier = v14->_deploymentIdentifier;
    v14->_deploymentIdentifier = (NSString *)v24;

    if (!v14->_deploymentIdentifier)
    {
      v14->_deploymentIdentifier = (NSString *)CFSTR("N/A");

    }
    objc_msgSend(v13, "treatmentIdentifier");
    v26 = objc_claimAutoreleasedReturnValue();
    treatmentIdentifier = v14->_treatmentIdentifier;
    v14->_treatmentIdentifier = (NSString *)v26;

    if (!v14->_treatmentIdentifier)
    {
      v14->_treatmentIdentifier = (NSString *)CFSTR("N/A");

    }
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v14->_requiredFields);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setByAddingObjectsFromArray:", v14->_cohortKeys);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allObjects");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "sortedArrayUsingSelector:", sel_localizedCompare_);
    v31 = objc_claimAutoreleasedReturnValue();
    unifiedFields = v14->_unifiedFields;
    v14->_unifiedFields = (NSArray *)v31;

  }
  return v14;
}

- (id)generateCollectionKeyForDataPoint:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  FedStatsCollectionKeyGenerator *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  const __CFString *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[FedStatsCollectionKeyGenerator requiredFields](self, "requiredFields");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v39;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v39 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v11);
      objc_msgSend(v6, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsObject:", v12);

      if ((v14 & 1) == 0)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    if (a4)
    {
      v27 = (void *)MEMORY[0x24BE30C80];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The data-point does not contain the required field '%@'"), v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithCode:description:", 401, v17);
      v28 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    v28 = 0;
  }
  else
  {
LABEL_9:

    -[FedStatsCollectionKeyGenerator unifiedFields](self, "unifiedFields");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FedStatsCollectionKeyGenerator namespaceIdentifier](self, "namespaceIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    +[FedStatsDataCohort keysForCohorts:namespaceID:parameters:possibleError:](FedStatsDataCohort, "keysForCohorts:namespaceID:parameters:possibleError:", v15, v16, v6, &v37);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v37;

    if (!v17)
    {
      +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[FedStatsCollectionKeyGenerator generateCollectionKeyForDataPoint:error:].cold.1();

      v17 = (void *)MEMORY[0x24BDBD1A8];
    }
    v19 = 0x24BDBC000uLL;
    if (objc_msgSend(v17, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v17, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "count"))
      {
        v21 = 0;
        do
        {
          -[FedStatsCollectionKeyGenerator unifiedFields](self, "unifiedFields");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectAtIndex:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "objectAtIndex:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@%@"), v23, CFSTR("="), v24);
          v25 = self;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

          self = v25;
          ++v21;
        }
        while (v21 < objc_msgSend(v17, "count"));
        v19 = 0x24BDBC000;
      }
    }
    else
    {
      v43 = CFSTR("N/A");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v29, "mutableCopy");

    }
    -[FedStatsCollectionKeyGenerator prefix](self, "prefix");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v36;
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR("|"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v30;
    -[FedStatsCollectionKeyGenerator experimentIdentifier](self, "experimentIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v31;
    -[FedStatsCollectionKeyGenerator deploymentIdentifier](self, "deploymentIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v32;
    -[FedStatsCollectionKeyGenerator treatmentIdentifier](self, "treatmentIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v42[4] = v33;
    objc_msgSend(*(id *)(v19 + 3632), "arrayWithObjects:count:", v42, 5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "componentsJoinedByString:", CFSTR(":"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
  }

  return v28;
}

+ (id)extractCohortKeyValuesFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(":"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "length") >= 3)
  {
    objc_msgSend(v4, "objectAtIndex:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("|"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count") == 1
      && (objc_msgSend(v7, "firstObject"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isEqual:", CFSTR("N/A")),
          v8,
          (v9 & 1) != 0))
    {
      v5 = (void *)MEMORY[0x24BDBD1B8];
    }
    else
    {
      v20 = v4;
      v21 = v3;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v10 = v7;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v23 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("="));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "count") == 2)
            {
              objc_msgSend(v16, "lastObject");
              v17 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "firstObject");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKey:", v17, v18);

            }
            else
            {
              +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v27 = v15;
                _os_log_error_impl(&dword_23B425000, v17, OS_LOG_TYPE_ERROR, "Cannot separate cohort key and value for '%@'", buf, 0xCu);
              }
            }

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
        }
        while (v12);
      }

      v4 = v20;
      v3 = v21;
    }

  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v5;
}

- (NSString)prefix
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)cohortKeys
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)requiredFields
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)unifiedFields
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)namespaceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)experimentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)treatmentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)deploymentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deploymentIdentifier, 0);
  objc_storeStrong((id *)&self->_treatmentIdentifier, 0);
  objc_storeStrong((id *)&self->_experimentIdentifier, 0);
  objc_storeStrong((id *)&self->_namespaceIdentifier, 0);
  objc_storeStrong((id *)&self->_unifiedFields, 0);
  objc_storeStrong((id *)&self->_requiredFields, 0);
  objc_storeStrong((id *)&self->_cohortKeys, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
}

- (void)generateCollectionKeyForDataPoint:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_23B425000, v0, OS_LOG_TYPE_ERROR, "Cannot validate and retrieve cohort values. Error: %@", v1, 0xCu);
  OUTLINED_FUNCTION_10();
}

@end
