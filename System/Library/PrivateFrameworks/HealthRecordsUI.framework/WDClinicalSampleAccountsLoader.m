@implementation WDClinicalSampleAccountsLoader

- (WDClinicalSampleAccountsLoader)initWithProfile:(id)a3
{
  id v5;
  WDClinicalSampleAccountsLoader *v6;
  WDClinicalSampleAccountsLoader *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDClinicalSampleAccountsLoader;
  v6 = -[WDClinicalSampleAccountsLoader init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_profile, a3);

  return v7;
}

- (void)loadFirstSampleAccountDataBatchForGatewayWithExternalID:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, uint64_t);
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v6 = (void (**)(id, _QWORD, uint64_t))a4;
  v12 = 0;
  -[WDClinicalSampleAccountsLoader _sampleAccountForGatewayWithExternalID:error:](self, "_sampleAccountForGatewayWithExternalID:error:", a3, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v7)
  {
    objc_msgSend(v7, "batches");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[WDClinicalSampleAccountsLoader _createAccountAndTriggerIngestForDataBatch:account:completion:](self, "_createAccountAndTriggerIngestForDataBatch:account:completion:", v10, v7, v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("There are no sample data batches for this account"));
      v11 = objc_claimAutoreleasedReturnValue();

      v6[2](v6, 0, v11);
      v8 = (id)v11;
    }

  }
  else
  {
    v6[2](v6, 0, (uint64_t)v8);
  }

}

- (id)_sampleAccountForGatewayWithExternalID:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[WDClinicalSampleAccountsLoader cachedAccounts](self, "cachedAccounts");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "provider");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "gateway");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v5, "isEqualToString:", v14);

        if ((v15 & 1) != 0)
        {
          v16 = v11;

          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a4, 3, CFSTR("No matching cached sample account found, please start over"));
  v16 = 0;
LABEL_11:

  return v16;
}

- (void)_createAccountAndTriggerIngestForDataBatch:(id)a3 account:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  id v41;

  v8 = a3;
  v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E0D2EE98];
  v11 = a4;
  v12 = [v10 alloc];
  -[HRProfile healthStore](self->_profile, "healthStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v12, "initWithHealthStore:", v13);

  objc_msgSend(v11, "provider");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "gateway");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "provider");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "gateway");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "properties");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("subtitle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "provider");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "gateway");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "properties");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("description"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "provider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "gateway");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "properties");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("country"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "provider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "gateway");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "FHIRVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "provider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "gateway");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __96__WDClinicalSampleAccountsLoader__createAccountAndTriggerIngestForDataBatch_account_completion___block_invoke;
  v39[3] = &unk_1E74D16A0;
  v40 = v8;
  v41 = v9;
  v39[4] = self;
  v29 = v8;
  v26 = v9;
  objc_msgSend(v38, "createStaticAccountWithTitle:subtitle:description:countryCode:fhirVersion:onlyIfNeededForSimulatedGatewayID:completion:", v14, v24, v22, v15, v18, v21, v39);

}

void __96__WDClinicalSampleAccountsLoader__createAccountAndTriggerIngestForDataBatch_account_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v11 = *(id *)(a1 + 48);
  v9 = v6;
  v10 = *(id *)(a1 + 40);
  v7 = v6;
  v8 = v5;
  HKDispatchAsyncOnGlobalConcurrentQueue();

}

void __96__WDClinicalSampleAccountsLoader__createAccountAndTriggerIngestForDataBatch_account_completion___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v2 = (void *)a1[4];
  if (v2)
  {
    v3 = (void *)a1[6];
    v4 = a1[7];
    objc_msgSend(v2, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    objc_msgSend(v3, "_triggerIngestOfDataBatch:accountIdentifier:error:", v4, v5, &v7);
    v6 = v7;

    (*(void (**)(void))(a1[8] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[8] + 16))();
  }
}

- (id)_createTemporaryFileForDataBatch:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB36D8];
  v19 = CFSTR("resources");
  objc_msgSend(a3, "resourceObjectsByResourceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataWithJSONObject:options:error:", v7, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@_SimulatorSampleData"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathExtension:", CFSTR("json"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    NSTemporaryDirectory();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "writeToURL:options:error:", v16, 1, a4))
      v17 = v16;
    else
      v17 = 0;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)_triggerIngestOfDataBatch:(id)a3 accountIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;

  v8 = a4;
  -[WDClinicalSampleAccountsLoader _createTemporaryFileForDataBatch:error:](self, "_createTemporaryFileForDataBatch:error:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", v9, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;
    if (v10)
    {
      v12 = objc_alloc(MEMORY[0x1E0D2EEB8]);
      -[HRProfile healthStore](self->_profile, "healthStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithHealthStore:", v13);

      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __84__WDClinicalSampleAccountsLoader__triggerIngestOfDataBatch_accountIdentifier_error___block_invoke;
      v16[3] = &unk_1E74D16C8;
      v16[4] = self;
      v17 = v9;
      objc_msgSend(v14, "ingestHealthRecordsWithFHIRDocumentHandle:accountIdentifier:options:completion:", v10, v8, 0, v16);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __84__WDClinicalSampleAccountsLoader__triggerIngestOfDataBatch_accountIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v12;
  NSObject *v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if ((objc_msgSend(v5, "taskSuccess") & 1) == 0)
    {
      _HKInitializeLogging();
      v7 = (void *)*MEMORY[0x1E0CB52D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
        __84__WDClinicalSampleAccountsLoader__triggerIngestOfDataBatch_accountIdentifier_error___block_invoke_cold_3(a1, v7, v5);
    }
  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
      __84__WDClinicalSampleAccountsLoader__triggerIngestOfDataBatch_accountIdentifier_error___block_invoke_cold_2(a1, (uint64_t)v6, v8);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 40);
  v14 = 0;
  v11 = objc_msgSend(v9, "removeItemAtURL:error:", v10, &v14);
  v12 = v14;

  if ((v11 & 1) == 0)
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
      __84__WDClinicalSampleAccountsLoader__triggerIngestOfDataBatch_accountIdentifier_error___block_invoke_cold_1((uint64_t)v12, v13);
  }

}

- (id)providerForSampleDataSearchResultWithExternalID:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[WDClinicalSampleAccountsLoader cachedAccounts](self, "cachedAccounts");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "provider", (_QWORD)v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v6, "isEqualToString:", v14);

        if ((v15 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB63A8], "localDevelopmentSampleBrand");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "asClinicalProviderWithBrand:", v17);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a4, 3, CFSTR("No matching cached sample account found, please start over"));
  v16 = 0;
LABEL_11:

  return v16;
}

- (id)sampleAccountsAsSearchResults
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[WDClinicalSampleAccountsLoader cachedAccounts](self, "cachedAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v2;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v17)
  {
    v15 = *(_QWORD *)v30;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v3);
        v5 = objc_alloc(MEMORY[0x1E0D2EED8]);
        objc_msgSend(v4, "provider");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "UUIDString");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "provider");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "title");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "provider");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "properties");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("subtitle"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "provider");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "properties");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("location"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "provider");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "properties");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("country"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB63A8], "localDevelopmentSampleBrand");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "provider");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v5, "initWithExternalID:batchID:title:subtitle:location:supported:countryCode:brand:minCompatibleAPIVersion:", v28, v6, v20, v18, v7, 1, v10, v11, objc_msgSend(v12, "minCompatibleAPIVersion"));

        objc_msgSend(v16, "addObject:", v19);
        ++v3;
      }
      while (v17 != v3);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v17);
  }

  return v16;
}

- (NSArray)cachedAccounts
{
  NSArray *cachedAccounts;
  void *v4;

  cachedAccounts = self->_cachedAccounts;
  if (!cachedAccounts)
  {
    -[WDClinicalSampleAccountsLoader _parseAccounts](self, "_parseAccounts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDClinicalSampleAccountsLoader setCachedAccounts:](self, "setCachedAccounts:", v4);

    cachedAccounts = self->_cachedAccounts;
  }
  return cachedAccounts;
}

- (id)_parseAccounts
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id obj;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownAccountFiles");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v20;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v20 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v5);
        v7 = objc_alloc_init(MEMORY[0x1E0D2EEF0]);
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "URLForResource:withExtension:", v6, CFSTR("json"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        objc_msgSend(v7, "parseAccountsFromFile:error:", v9, &v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v18;
        if (v10)
        {
          objc_msgSend(v17, "addObjectsFromArray:", v10);
        }
        else
        {
          _HKInitializeLogging();
          v12 = *MEMORY[0x1E0CB5378];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v24 = v11;
            _os_log_error_impl(&dword_1BC30A000, v12, OS_LOG_TYPE_ERROR, "Error parsing Simulator sample accounts: %{public}@", buf, 0xCu);
          }
        }

        if (!v10)
        {

          v14 = (id)MEMORY[0x1E0C9AA60];
          v13 = v17;
          goto LABEL_15;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v3)
        continue;
      break;
    }
  }

  v13 = v17;
  v14 = v17;
LABEL_15:

  return v14;
}

+ (id)knownAccountFiles
{
  return &unk_1E7513098;
}

- (HRProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (NSArray)accountDataBatches
{
  return self->_accountDataBatches;
}

- (void)setAccountDataBatches:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setCachedAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAccounts, 0);
  objc_storeStrong((id *)&self->_accountDataBatches, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

void __84__WDClinicalSampleAccountsLoader__triggerIngestOfDataBatch_accountIdentifier_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1BC30A000, a2, OS_LOG_TYPE_ERROR, "Failed to delete Simulator sample data: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __84__WDClinicalSampleAccountsLoader__triggerIngestOfDataBatch_accountIdentifier_error___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  OUTLINED_FUNCTION_9(&dword_1BC30A000, a3, (uint64_t)a3, "%{public}@ XPC error triggering ingestion for Simulator sample account: %{public}@", (uint8_t *)&v4);
}

void __84__WDClinicalSampleAccountsLoader__triggerIngestOfDataBatch_accountIdentifier_error___block_invoke_cold_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "taskError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v4;
  v10 = 2114;
  v11 = v6;
  OUTLINED_FUNCTION_9(&dword_1BC30A000, v5, v7, "%{public}@ error triggering ingestion for Simulator sample account: %{public}@", (uint8_t *)&v8);

}

@end
