@implementation HDHealthRecordDocumentProcessor

- (HDHealthRecordDocumentProcessor)initWithConfiguration:(id)a3
{
  id v6;
  HDHealthRecordDocumentProcessor *v7;
  HDHealthRecordDocumentProcessor *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHealthRecordDocumentProcessor.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  v11.receiver = self;
  v11.super_class = (Class)HDHealthRecordDocumentProcessor;
  v7 = -[HDHealthRecordDocumentProcessor init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_configuration, a3);

  return v8;
}

- (NSNumber)extractionRulesetVersion
{
  return -[HDHealthRecordDocumentTypeConfiguration extractionRulesetVersion](self->_configuration, "extractionRulesetVersion");
}

- (HRSSupportedFHIRConfiguration)supportedFHIRConfiguration
{
  return -[HDHealthRecordDocumentTypeConfiguration supportedFHIRConfiguration](self->_configuration, "supportedFHIRConfiguration");
}

- (id)processExtractionRequest:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  HKHealthRecordsExtractor *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  objc_class *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t i;
  id obj;
  uint64_t v43;
  uint64_t v44;
  HDHealthRecordProcessingContext *v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  id v54;
  uint64_t v55;
  HDHealthRecordDocumentProcessor *v56;
  NSObject *v57;
  _QWORD *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[4];
  int v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _QWORD v72[5];

  v72[3] = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v72[0] = objc_opt_class();
  v72[1] = objc_opt_class();
  v72[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "resources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHealthRecordDocumentProcessor _resourceObjectsBatchedPerFHIRRelease:](self, "_resourceObjectsBatchedPerFHIRRelease:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(HKHealthRecordsExtractor);
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2810000000;
  v67[3] = "";
  v68 = 0;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v9 = v6;
  v34 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
  v40 = v9;
  if (v34)
  {
    v35 = *(_QWORD *)v64;
    while (2)
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v64 != v35)
          objc_enumerationMutation(v9);
        v36 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "mutableCopy");

        v12 = dispatch_group_create();
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v13 = (void *)objc_msgSend(v11, "copy");
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v60;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v60 != v15)
                objc_enumerationMutation(v13);
              v17 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j);
              dispatch_group_enter(v12);
              v52[0] = MEMORY[0x24BDAC760];
              v52[1] = 3221225472;
              v52[2] = __66__HDHealthRecordDocumentProcessor_processExtractionRequest_error___block_invoke;
              v52[3] = &unk_24ECF5670;
              v58 = v67;
              v53 = v8;
              v54 = v11;
              v55 = v17;
              v56 = self;
              v57 = v12;
              -[HKHealthRecordsExtractor extractResource:completion:](v7, "extractResource:completion:", v17, v52);

            }
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
          }
          while (v14);
        }

        dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
        if (objc_msgSend(v11, "count"))
        {
          -[HDHealthRecordDocumentTypeConfiguration extractionRulesetForRelease:](self->_configuration, "extractionRulesetForRelease:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v37)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 100, CFSTR("HDHealthRecordDocumentProcessor: No extraction ruleset is available for release %@"), v36);
LABEL_36:

            v28 = 0;
            goto LABEL_37;
          }
          v45 = -[HDHealthRecordProcessingContext initWithRuleset:resources:]([HDHealthRecordProcessingContext alloc], "initWithRuleset:resources:", v37, v11);
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          obj = v38;
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v69, 16);
          if (v18)
          {
            v44 = *(_QWORD *)v49;
            while (2)
            {
              v43 = v18;
              for (k = 0; k != v43; ++k)
              {
                if (*(_QWORD *)v49 != v44)
                  objc_enumerationMutation(obj);
                v20 = *(objc_class **)(*((_QWORD *)&v48 + 1) + 8 * k);
                v21 = (void *)MEMORY[0x22768E8BC]();
                v22 = (void *)objc_msgSend([v20 alloc], "initWithProcessingContext:", v45);
                if ((objc_msgSend(v22, "conformsToProtocol:", &unk_2557FF5A8) & 1) == 0)
                {
                  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHealthRecordDocumentProcessor.m"), 105, CFSTR("HDHealthRecordDocumentProcessor: Trying to run invalid task instance, must conform to HDHealthRecordPipelineTask"));

                }
                v47 = 0;
                v23 = objc_msgSend(v22, "processWithError:", &v47);
                v24 = v47;

                objc_autoreleasePoolPop(v21);
                if ((v23 & 1) == 0)
                {
                  v29 = v24;
                  v30 = v29;
                  if (v29)
                  {
                    if (a4)
                      *a4 = objc_retainAutorelease(v29);
                    else
                      _HKLogDroppedError();
                  }

                  goto LABEL_35;
                }

              }
              v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v69, 16);
              if (v18)
                continue;
              break;
            }
          }

          v46 = 0;
          -[HDHealthRecordProcessingContext createExtractionResultWithError:](v45, "createExtractionResultWithError:", &v46);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          obj = v46;
          if (!v26)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("HDHealthRecordDocumentProcessor: Failed to create extraction result for release %@"), v36);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:underlyingError:", a4, 100, v30, obj);
LABEL_35:

            goto LABEL_36;
          }
          objc_msgSend(v26, "items");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObjectsFromArray:", v27);

        }
        v9 = v40;
      }
      v34 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
      if (v34)
        continue;
      break;
    }
  }

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE48950]), "initWithItems:", v8);
LABEL_37:

  _Block_object_dispose(v67, 8);
  return v28;
}

void __66__HDHealthRecordDocumentProcessor_processExtractionRequest_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32));
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", *(_QWORD *)(a1 + 48));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32));
  }
  else if (v6)
  {
    if ((objc_msgSend(v6, "hk_isHealthKitErrorWithCode:", 125) & 1) == 0)
    {
      _HKInitializeLogging();
      v8 = (void *)*MEMORY[0x24BDD2FF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
        __66__HDHealthRecordDocumentProcessor_processExtractionRequest_error___block_invoke_cold_1(a1, v8);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

- (id)compareExistingPatientResourceData:(id)a3 incomingPatientResourceData:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  HKHealthRecordsExtractor *v9;
  void *v10;

  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(HKHealthRecordsExtractor);
  -[HKHealthRecordsExtractor comparePatientResourceDataWithExisting:incoming:error:](v9, "comparePatientResourceDataWithExisting:incoming:error:", v8, v7, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)extractAttachmentContentFromFHIRResource:(id)a3 error:(id *)a4
{
  id v5;
  HKFHIRAttachmentContentExtractor *v6;
  void *v7;

  v5 = a3;
  v6 = objc_alloc_init(HKFHIRAttachmentContentExtractor);
  -[HKFHIRAttachmentContentExtractor extractAttachmentContentFromFHIRResource:error:](v6, "extractAttachmentContentFromFHIRResource:error:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)processReferenceExtractionRequest:(id)a3 error:(id *)a4
{
  id v6;
  HDHealthRecordDocumentTypeConfiguration *configuration;
  void *v8;
  void *v9;
  HDHealthRecordFindReferencesTask *v10;
  void *v11;
  void *v12;

  v6 = a3;
  configuration = self->_configuration;
  objc_msgSend(v6, "FHIRRelease");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHealthRecordDocumentTypeConfiguration extractionRulesetForRelease:](configuration, "extractionRulesetForRelease:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = -[HDHealthRecordFindReferencesTask initWithRuleset:]([HDHealthRecordFindReferencesTask alloc], "initWithRuleset:", v9);
    -[HDHealthRecordFindReferencesTask processResourcesForReferenceExtractionRequest:error:](v10, "processResourcesForReferenceExtractionRequest:error:", v6, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v6, "FHIRRelease");
    v10 = (HDHealthRecordFindReferencesTask *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hk_assignError:code:format:", a4, 3, CFSTR("FHIR release %@ is not supported for reference extraction"), v10);
    v11 = 0;
  }

  return v11;
}

- (id)processOptInRequest:(id)a3 redactor:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(_QWORD *, void *);
  void *v21;
  HDHealthRecordDocumentProcessor *v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "resources");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__0;
    v30 = __Block_byref_object_dispose__0;
    v31 = 0;
    objc_msgSend(v8, "resources");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __70__HDHealthRecordDocumentProcessor_processOptInRequest_redactor_error___block_invoke;
    v21 = &unk_24ECF5698;
    v22 = self;
    v23 = v9;
    v24 = &v32;
    v25 = &v26;
    objc_msgSend(v12, "hk_map:", &v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (*((_BYTE *)v33 + 24))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:underlyingError:", a5, 100, CFSTR("Error during redaction"), v27[5], v18, v19, v20, v21, v22);
      v14 = 0;
    }
    else
    {
      v15 = objc_alloc(MEMORY[0x24BE48948]);
      -[HDHealthRecordDocumentProcessor extractionRulesetVersion](self, "extractionRulesetVersion", v18, v19, v20, v21, v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v15, "initWithRedactedResources:rulesVersion:", v13, v16);

    }
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a5, 3, CFSTR("no resources to process"));
    v14 = 0;
  }

  return v14;
}

id __70__HDHealthRecordDocumentProcessor_processOptInRequest_redactor_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;

  v3 = a2;
  objc_msgSend(v3, "FHIRVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "FHIRRelease");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1[4] + 8), "extractionRulesetForRelease:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rulesetForFHIRResourceObject:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "redactionRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v3, "JSONObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = a1[5];
    v27 = 0;
    +[HDHRSDataCollectionScrubber scrubberForResource:redactor:rules:error:](HDHRSDataCollectionScrubber, "scrubberForResource:redactor:rules:error:", v9, v10, v8, &v27);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v27;

    if (v11)
    {
      v24 = v5;
      objc_msgSend(v11, "generateRedactedResource");
      v26 = v12;
      v23 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE489B8], "resourceObjectWithFHIRJSONObject:redactedJSONObject:error:", v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v26;
      v25 = v26;

      if (!v13)
      {
        *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
        _HKInitializeLogging();
        v15 = (void *)*MEMORY[0x24BDD2FF8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
          __70__HDHealthRecordDocumentProcessor_processOptInRequest_redactor_error___block_invoke_cold_2((uint64_t)(a1 + 4), v15);
        v16 = *(_QWORD *)(a1[7] + 8);
        v18 = *(_QWORD *)(v16 + 40);
        v17 = (id *)(v16 + 40);
        if (!v18)
          objc_storeStrong(v17, v14);
      }
      v19 = (void *)v23;
      v5 = v24;
      v12 = v25;
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
      _HKInitializeLogging();
      v20 = (void *)*MEMORY[0x24BDD2FF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
        __70__HDHealthRecordDocumentProcessor_processOptInRequest_redactor_error___block_invoke_cold_1((uint64_t)(a1 + 4), v20);
      v21 = *(_QWORD *)(a1[7] + 8);
      if (*(_QWORD *)(v21 + 40))
      {
        v13 = 0;
        goto LABEL_15;
      }
      v12 = v12;
      v13 = 0;
      v19 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v12;
    }

LABEL_15:
    goto LABEL_16;
  }
  v13 = 0;
LABEL_16:

  return v13;
}

- (id)_resourceObjectsBatchedPerFHIRRelease:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "FHIRVersion", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "FHIRRelease");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "objectForKeyedSubscript:", v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v12);
        }
        objc_msgSend(v13, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(v4, "copy");
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

void __66__HDHealthRecordDocumentProcessor_processExtractionRequest_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a2;
  HKSensitiveLogItem();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_224DAC000, v4, v5, "%{public}@: Extraction 2.0 failed, falling back to Extraction 1.0. Error: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

void __70__HDHealthRecordDocumentProcessor_processOptInRequest_redactor_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = OUTLINED_FUNCTION_3(a1, a2);
  HKSensitiveLogItem();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_224DAC000, v4, v5, "%{public}@: Unable to create scrubber for resource: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

void __70__HDHealthRecordDocumentProcessor_processOptInRequest_redactor_error___block_invoke_cold_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = OUTLINED_FUNCTION_3(a1, a2);
  HKSensitiveLogItem();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_224DAC000, v4, v5, "%{public}@: Unable to convert resource to HDFHIRResourceObject: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

@end
