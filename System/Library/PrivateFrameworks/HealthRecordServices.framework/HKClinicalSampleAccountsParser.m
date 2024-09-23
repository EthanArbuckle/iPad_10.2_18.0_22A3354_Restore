@implementation HKClinicalSampleAccountsParser

- (id)parseAccountsFromFile:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v6 = a3;
  if (v6
    && (objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v6), (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    -[HKClinicalSampleAccountsParser _parseAccountsFromJSONData:error:](self, "_parseAccountsFromJSONData:error:", v7, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v11 = v9;

  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v6, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hk_assignError:code:format:", a4, 3, CFSTR("Unable to read sample account from «%@»"), v8);
    v10 = 0;
  }

  return v10;
}

- (id)_parseAccountsFromJSONData:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  HKClinicalSampleAccount *v23;
  id v24;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalSampleAccount.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("jsonData"));

  }
  objc_msgSend(MEMORY[0x24BDD1608], "hk_JSONObjectFromFHIRData:options:error:", v7, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "_jsonDictionaryFromJSONObject:subElement:error:", v8, 0, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("providers"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      HKSafeObject();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        obj = v12;
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v32;
          v28 = v10;
          v29 = v7;
          v27 = v12;
          while (2)
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v32 != v16)
                objc_enumerationMutation(obj);
              v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
              -[HKClinicalSampleAccountsParser _parseProviderFromSampleAccountJSONDict:error:](self, "_parseProviderFromSampleAccountJSONDict:error:", v18, a4);
              v19 = objc_claimAutoreleasedReturnValue();
              if (!v19)
                goto LABEL_20;
              v20 = (void *)v19;
              -[HKClinicalSampleAccountsParser _parseBatchesFromSampleAccountJSONDict:error:](self, "_parseBatchesFromSampleAccountJSONDict:error:", v18, a4);
              v21 = objc_claimAutoreleasedReturnValue();
              if (!v21)
              {

LABEL_20:
                v24 = 0;
                v10 = v28;
                v7 = v29;
                v12 = v27;
                goto LABEL_21;
              }
              v22 = (void *)v21;
              v23 = objc_alloc_init(HKClinicalSampleAccount);
              -[HKClinicalSampleAccount setProvider:](v23, "setProvider:", v20);
              -[HKClinicalSampleAccount setBatches:](v23, "setBatches:", v22);
              objc_msgSend(v13, "addObject:", v23);

            }
            v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
            v10 = v28;
            v7 = v29;
            v12 = v27;
            if (v15)
              continue;
            break;
          }
        }

        v24 = v13;
LABEL_21:

      }
      else
      {
        v24 = 0;
      }

    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)_parseProviderFromSampleAccountJSONDict:(id)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HKClinicalSampleAccountProvider *v13;
  void *v14;
  void *v15;
  HKClinicalSampleAccountProvider *v16;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("provider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  HKSafeObject();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    objc_msgSend((id)objc_opt_class(), "_stringOnlyDictionaryFromJSONDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("title"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "length"))
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("minCompatibleAPIVersion"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_alloc_init(HKClinicalSampleAccountProvider);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("SIMULATOR_SAMPLE_PROVIDER_BATCH_PREFIX"), v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKClinicalSampleAccountProvider setIdentifier:](v13, "setIdentifier:", v14);

        -[HKClinicalSampleAccountProvider setTitle:](v13, "setTitle:", v11);
        -[HKClinicalSampleAccountProvider setProperties:](v13, "setProperties:", v9);
        -[HKClinicalSampleAccountProvider setMinCompatibleAPIVersion:](v13, "setMinCompatibleAPIVersion:", objc_msgSend(v12, "integerValue"));
        -[HKClinicalSampleAccountsParser _parseGatewayFromProviderJSONDict:error:](self, "_parseGatewayFromProviderJSONDict:error:", v8, a4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          -[HKClinicalSampleAccountProvider setGateway:](v13, "setGateway:", v15);
          v16 = v13;
        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_parseGatewayFromProviderJSONDict:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HKClinicalSampleAccountProviderGateway *v12;
  void *v13;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_jsonDictionaryFromJSONObject:subElement:error:", v5, CFSTR("gateway"), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "_stringOnlyDictionaryFromJSONDictionary:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("title"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length"))
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("fhirVersion"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "length"))
        {
          objc_msgSend(MEMORY[0x24BDD3BA0], "versionFromVersionString:error:", v10, a4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = objc_alloc_init(HKClinicalSampleAccountProviderGateway);
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("SIMULATOR_SAMPLE_GATEWAY_PREFIX"), v8);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKClinicalSampleAccountProviderGateway setIdentifier:](v12, "setIdentifier:", v13);

            -[HKClinicalSampleAccountProviderGateway setTitle:](v12, "setTitle:", v9);
            -[HKClinicalSampleAccountProviderGateway setProperties:](v12, "setProperties:", v7);
            -[HKClinicalSampleAccountProviderGateway setFHIRVersion:](v12, "setFHIRVersion:", v11);
          }
          else
          {
            v12 = 0;
          }

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_parseBatchesFromSampleAccountJSONDict:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  HKClinicalSampleAccountDataBatch *v15;
  id v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("batches"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  HKSafeObject();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend((id)objc_opt_class(), "_jsonDictionaryFromJSONObject:subElement:error:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12), CFSTR("resources"), a4);
          v13 = objc_claimAutoreleasedReturnValue();
          if (!v13)
          {

            v16 = 0;
            goto LABEL_12;
          }
          v14 = (void *)v13;
          v15 = objc_alloc_init(HKClinicalSampleAccountDataBatch);
          -[HKClinicalSampleAccountDataBatch setResourceObjectsByResourceType:](v15, "setResourceObjectsByResourceType:", v14);
          objc_msgSend(v7, "addObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v10)
          continue;
        break;
      }
    }

    v16 = v7;
LABEL_12:

    v6 = v18;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)_jsonDictionaryFromJSONObject:(id)a3 subElement:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a4;
  v7 = a3;
  objc_opt_class();
  HKSafeObject();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && v6)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    HKSafeObject();
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }

  return v8;
}

+ (id)_stringOnlyDictionaryFromJSONDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "hk_filterKeysWithBlock:", &__block_literal_global);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithValuesForKeys:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __74__HKClinicalSampleAccountsParser__stringOnlyDictionaryFromJSONDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
