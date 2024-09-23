@implementation HDHealthRecordExtractionUsingRulesTask

- (HDHealthRecordExtractionUsingRulesTask)initWithProcessingContext:(id)a3
{
  id v5;
  HDHealthRecordExtractionUsingRulesTask *v6;
  HDHealthRecordExtractionUsingRulesTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDHealthRecordExtractionUsingRulesTask;
  v6 = -[HDHealthRecordExtractionUsingRulesTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_processingContext, a3);

  return v7;
}

- (BOOL)processWithError:(id *)a3
{
  void *v5;
  HDHealthRecordFindReferencesTask *v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  HDHealthRecordProcessingContext *processingContext;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HDHealthRecordClinicalItem *v21;
  void *v22;
  void *v23;
  HDHealthRecordClinicalItem *v24;
  HDHealthRecordProcessingContext *v25;
  void *v26;
  BOOL v27;
  HDHealthRecordFindReferencesTask *v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  -[HDHealthRecordProcessingContext extractionRuleset](self->_processingContext, "extractionRuleset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDHealthRecordFindReferencesTask initWithRuleset:]([HDHealthRecordFindReferencesTask alloc], "initWithRuleset:", v5);
  if (-[HDHealthRecordFindReferencesTask processContainedResourcesInProcessingContext:error:](v6, "processContainedResourcesInProcessingContext:error:", self->_processingContext, a3))
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[HDHealthRecordProcessingContext resources](self->_processingContext, "resources");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v32)
    {
      v29 = v6;
      v31 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v34 != v31)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v5, "rulesetForFHIRResourceObject:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = v9;
            processingContext = self->_processingContext;
            objc_msgSend(v9, "clinicalType");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDHealthRecordProcessingContext extractedClinicalItemsForClinicalType:](processingContext, "extractedClinicalItemsForClinicalType:", objc_msgSend(v12, "type"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v14 = (void *)objc_msgSend(v13, "mutableCopy");
            v15 = v14;
            if (v14)
              v16 = v14;
            else
              v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            v20 = v16;

            v21 = [HDHealthRecordClinicalItem alloc];
            objc_msgSend(v10, "clinicalType");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "rulesetVersion");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = -[HDHealthRecordClinicalItem initWithRepresentedResource:clinicalType:rulesVersion:](v21, "initWithRepresentedResource:clinicalType:rulesVersion:", v8, v22, v23);

            if (!v24)
            {

              v27 = 0;
              goto LABEL_20;
            }
            objc_msgSend(v20, "addObject:", v24);
            v25 = self->_processingContext;
            objc_msgSend(v10, "clinicalType");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDHealthRecordProcessingContext setExtractedClinicalItems:forClinicalType:](v25, "setExtractedClinicalItems:forClinicalType:", v20, objc_msgSend(v26, "type"));

          }
          else
          {
            _HKInitializeLogging();
            v17 = (void *)*MEMORY[0x24BDD2FF8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
            {
              v18 = v17;
              -[HDHealthRecordExtractionUsingRulesTask debugDescription](self, "debugDescription");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v38 = v19;
              v39 = 2114;
              v40 = v8;
              _os_log_error_impl(&dword_224DAC000, v18, OS_LOG_TYPE_ERROR, "%{public}@: no extraction rules available for %{public}@, skipping", buf, 0x16u);

            }
          }
        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v32)
          continue;
        break;
      }
      v27 = 1;
LABEL_20:
      v6 = v29;
    }
    else
    {
      v27 = 1;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingContext, 0);
}

@end
