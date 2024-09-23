@implementation HDHealthRecordConstructClinicalRecordsTask

- (HDHealthRecordConstructClinicalRecordsTask)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDHealthRecordConstructClinicalRecordsTask)initWithProcessingContext:(id)a3
{
  id v5;
  HDHealthRecordConstructClinicalRecordsTask *v6;
  HDHealthRecordConstructClinicalRecordsTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDHealthRecordConstructClinicalRecordsTask;
  v6 = -[HDHealthRecordConstructClinicalRecordsTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_processingContext, a3);

  return v7;
}

- (BOOL)processWithError:(id *)a3
{
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  SEL v10;

  -[HDHealthRecordProcessingContext extractionRuleset](self->_processingContext, "extractionRuleset", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__HDHealthRecordConstructClinicalRecordsTask_processWithError___block_invoke;
  v8[3] = &unk_24ECF55E0;
  v9 = v5;
  v10 = a2;
  v8[4] = self;
  v6 = v5;
  +[HDHealthRecordClinicalType enumerateClinicalTypesUsingBlock:](HDHealthRecordClinicalType, "enumerateClinicalTypesUsingBlock:", v8);

  return 1;
}

void __63__HDHealthRecordConstructClinicalRecordsTask_processWithError___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  os_log_t *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  char v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  os_log_t v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  int *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[4];
  int v46;
  _BYTE v47[16];
  uint8_t buf[4];
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(*(id *)(a1[4] + 8), "extractedClinicalItemsForClinicalType:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v42;
    v34 = &v46;
    v7 = (os_log_t *)MEMORY[0x24BDD2FF8];
    v35 = v3;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v42 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v8);
        v10 = (void *)a1[4];
        v40 = 0;
        v11 = objc_msgSend(v10, "_isEligibleClinicalItem:error:", v9, &v40, v34);
        v12 = v40;
        v13 = v12;
        if ((v11 & 1) != 0)
        {
          v14 = v5;
          objc_msgSend(v9, "extractedMedicalRecord");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("HDHealthRecordConstructClinicalRecordsTask.m"), 59, CFSTR("Eligible clinical items for clinical records must have a medical record"));

          }
          v16 = (void *)a1[4];
          v17 = a1[5];
          v39 = v13;
          v18 = objc_msgSend(v16, "_applyReferenceRulesToClinicalItem:ruleset:error:", v9, v17, &v39);
          v19 = v39;

          if ((v18 & 1) != 0)
          {
            objc_msgSend(v9, "APIResource");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              v21 = (void *)a1[4];
              v38 = 0;
              objc_msgSend(v21, "_clinicalRecordWithClinicalItem:resourceObject:error:", v9, v20, &v38);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v38;
              v36 = v23;
              if (v22)
              {
                v24 = *(void **)(a1[4] + 8);
                v37 = 0;
                v25 = objc_msgSend(v24, "didProcessClinicalRecord:forMedicalRecord:error:", v22, v15, &v37);
                v26 = v37;
                if ((v25 & 1) == 0)
                {
                  _HKInitializeLogging();
                  v27 = *MEMORY[0x24BDD2FF8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    v49 = v26;
                    _os_log_error_impl(&dword_224DAC000, v27, OS_LOG_TYPE_ERROR, "[ConstructClinicalRecordsTask] Failed to mark clinical record sample as processed: %{public}@", buf, 0xCu);
                  }
                }

                v3 = v35;
              }
              else if (v23)
              {
                _HKInitializeLogging();
                v32 = *MEMORY[0x24BDD2FF8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v49 = v36;
                  _os_log_error_impl(&dword_224DAC000, v32, OS_LOG_TYPE_ERROR, "[ConstructClinicalRecordsTask] Unable to create clinical record sample: %{public}@", buf, 0xCu);
                }
              }

            }
            else
            {
              _HKInitializeLogging();
              v31 = (void *)*MEMORY[0x24BDD2FF8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEBUG))
                __63__HDHealthRecordConstructClinicalRecordsTask_processWithError___block_invoke_cold_1((uint64_t)v45, v31);
            }

          }
          else
          {
            _HKInitializeLogging();
            v30 = *MEMORY[0x24BDD2FF8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v49 = v19;
              _os_log_error_impl(&dword_224DAC000, v30, OS_LOG_TYPE_ERROR, "[ConstructClinicalRecordsTask] Error applying reference rules to clinical item: %{public}@", buf, 0xCu);
            }
          }

          v5 = v14;
        }
        else
        {
          if (v12)
          {
            _HKInitializeLogging();
            v28 = *v7;
            if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v49 = v13;
              _os_log_error_impl(&dword_224DAC000, v28, OS_LOG_TYPE_ERROR, "[ConstructClinicalRecordsTask] Error getting eligibility info from clinical item: %{public}@", buf, 0xCu);
            }
          }
          _HKInitializeLogging();
          v29 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
            __63__HDHealthRecordConstructClinicalRecordsTask_processWithError___block_invoke_cold_2((uint64_t)v47, v29);
          v19 = v13;
        }

        ++v8;
        v7 = (os_log_t *)MEMORY[0x24BDD2FF8];
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v5);
  }

}

- (BOOL)_isEligibleClinicalItem:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  char v9;
  void *v10;
  BOOL v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "extractedMedicalRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      -[HDHealthRecordConstructClinicalRecordsTask _isEligibleClinicalItem:error:].cold.1(v12);
    goto LABEL_7;
  }
  objc_msgSend(v4, "extractedMedicalRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    || (objc_msgSend(v4, "extractedMedicalRecord"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "enteredInError"),
        v8,
        (v9 & 1) != 0))
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v4, "extractedMedicalRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "state") != 1;

LABEL_8:
  return v11;
}

- (BOOL)_applyReferenceRulesToClinicalItem:(id)a3 ruleset:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  int v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  BOOL v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v53;
  id *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id obj;
  uint64_t v60;
  id v61;
  uint64_t v62;
  id v63;
  void *v64;
  uint64_t v65;
  id v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  id v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[4];
  id v88;
  void *v89;
  _BYTE v90[128];
  uint8_t v91[128];
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  void *v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v57 = a4;
  objc_msgSend(v57, "rulesetForClinicalType:", objc_msgSend(v7, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v8;
  if (v8)
  {
    objc_msgSend(v8, "APIReferenceRules");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    objc_msgSend(v7, "representedResource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      +[HDFHIRReferenceProcessor resourcesContainedInResource:error:](HDFHIRReferenceProcessor, "resourcesContainedInResource:error:", v11, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v12;
      if (v13)
      {
        v54 = a5;
        v55 = v7;
        v87[0] = MEMORY[0x24BDAC760];
        v87[1] = 3221225472;
        v87[2] = __95__HDHealthRecordConstructClinicalRecordsTask__applyReferenceRulesToClinicalItem_ruleset_error___block_invoke;
        v87[3] = &unk_24ECF5608;
        v61 = v12;
        v88 = v61;
        v53 = v13;
        objc_msgSend(v13, "hk_map:", v87);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        v72 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        v86 = 0u;
        objc_msgSend(v58, "APIReferenceRules");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
        if (v62)
        {
          v60 = *(_QWORD *)v84;
          do
          {
            for (i = 0; i != v62; ++i)
            {
              if (*(_QWORD *)v84 != v60)
                objc_enumerationMutation(obj);
              v15 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
              objc_msgSend(v15, "appliesTo");
              v73 = v15;
              objc_msgSend(v15, "keyPath");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "JSONObject");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v82 = 0;
              +[HDFHIRReferenceProcessor referencesAtKeyPath:resourceDictionary:error:](HDFHIRReferenceProcessor, "referencesAtKeyPath:resourceDictionary:error:", v16, v17, &v82);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v82;

              if (v18)
              {
                v63 = v19;
                v64 = v18;
                v65 = i;
                v80 = 0u;
                v81 = 0u;
                v78 = 0u;
                v79 = 0u;
                v66 = v18;
                v69 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
                if (v69)
                {
                  v68 = *(_QWORD *)v79;
                  do
                  {
                    v20 = 0;
                    do
                    {
                      if (*(_QWORD *)v79 != v68)
                        objc_enumerationMutation(v66);
                      v70 = v20;
                      v21 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * v20);
                      v74 = 0u;
                      v75 = 0u;
                      v76 = 0u;
                      v77 = 0u;
                      v22 = v67;
                      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
                      if (v23)
                      {
                        v24 = v23;
                        v25 = *(_QWORD *)v75;
                        do
                        {
                          for (j = 0; j != v24; ++j)
                          {
                            if (*(_QWORD *)v75 != v25)
                              objc_enumerationMutation(v22);
                            v27 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
                            objc_msgSend(v27, "identifier");
                            v28 = (void *)objc_claimAutoreleasedReturnValue();
                            if (+[HDFHIRReferenceProcessor reference:matchesIdentifier:](HDFHIRReferenceProcessor, "reference:matchesIdentifier:", v21, v28))
                            {
                              objc_msgSend(v73, "disallowedResourceTypes");
                              v29 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v28, "resourceType");
                              v30 = (void *)objc_claimAutoreleasedReturnValue();
                              v31 = objc_msgSend(v29, "containsObject:", v30);

                              v32 = v72;
                              if ((v31 & 1) != 0)
                                goto LABEL_24;
                              objc_msgSend(v73, "allowedResourceTypes");
                              v33 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v28, "resourceType");
                              v34 = (void *)objc_claimAutoreleasedReturnValue();
                              v35 = objc_msgSend(v33, "containsObject:", v34);

                              v32 = v71;
                              if ((v35 & 1) != 0
                                || (objc_msgSend(v73, "allowedResourceTypes"),
                                    v36 = (void *)objc_claimAutoreleasedReturnValue(),
                                    v37 = objc_msgSend(v36, "containsObject:", CFSTR("Any")),
                                    v36,
                                    v32 = v71,
                                    v37))
                              {
LABEL_24:
                                objc_msgSend(v32, "addObject:", v27);
                              }
                            }

                          }
                          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
                        }
                        while (v24);
                      }

                      v20 = v70 + 1;
                    }
                    while (v70 + 1 != v69);
                    v69 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
                  }
                  while (v69);
                }

                v18 = v64;
                i = v65;
                v19 = v63;
              }
              else
              {
                _HKInitializeLogging();
                v38 = (void *)*MEMORY[0x24BDD2FF8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
                {
                  v39 = v38;
                  objc_msgSend(v15, "keyPath");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  HKSensitiveLogItem();
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v93 = v40;
                  v94 = 2114;
                  v95 = v41;
                  _os_log_error_impl(&dword_224DAC000, v39, OS_LOG_TYPE_ERROR, "[ConstructClinicalRecordsTask] Error parsing reference(s) at «%{public}@»: %{public}@. Skipping.", buf, 0x16u);

                }
              }

            }
            v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
          }
          while (v62);
        }

        objc_msgSend(v71, "minusSet:", v72);
        objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("identifier.stringValue"), 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = v42;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v89, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "sortedArrayUsingDescriptors:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "hk_map:", &__block_literal_global_0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v46 = +[HDFHIRReferenceProcessor newResourceFromResource:containingOnlyResources:error:](HDFHIRReferenceProcessor, "newResourceFromResource:containingOnlyResources:error:", v61, v45, v54);
        v47 = v46 != 0;
        if (v46)
          objc_msgSend(v55, "setAPIResource:", v46);

        v7 = v55;
        v13 = v53;
      }
      else
      {
        v47 = 0;
      }

    }
    else
    {
      v50 = v11;
      v51 = (void *)objc_msgSend(v11, "copy");
      objc_msgSend(v7, "setAPIResource:", v51);

      v47 = 1;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE48988], "extractionFailureRecordWithCode:propertyName:resourceKeyPath:", 3, 0, 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_alloc_init(MEMORY[0x24BE48980]);
    objc_msgSend(v49, "addFailureRecord:", v48);
    objc_msgSend(v7, "setMedicalRecordPropertyValue:forKey:", v49, *MEMORY[0x24BE48828]);

    v47 = 0;
  }

  return v47;
}

id __95__HDHealthRecordConstructClinicalRecordsTask__applyReferenceRulesToClinicalItem_ruleset_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v13;

  v2 = (void *)MEMORY[0x24BE48978];
  v3 = (id *)(a1 + 32);
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "FHIRVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v3, "receivedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v2, "resourceObjectWithJSONObject:sourceURL:FHIRVersion:receivedDate:extractionHints:error:", v5, 0, v6, v7, 0, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v13;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      __95__HDHealthRecordConstructClinicalRecordsTask__applyReferenceRulesToClinicalItem_ruleset_error___block_invoke_cold_1((uint64_t *)v3, v11);
  }

  return v8;
}

uint64_t __95__HDHealthRecordConstructClinicalRecordsTask__applyReferenceRulesToClinicalItem_ruleset_error___block_invoke_203(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "JSONObject");
}

- (id)_clinicalRecordWithClinicalItem:(id)a3 resourceObject:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
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
  void *v27;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "correspondingClinicalTypeWithError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x24BDD3B98]);
    objc_msgSend(v10, "resourceType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "FHIRVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "data");
    v27 = v7;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sourceURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "receivedDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v11, "initWithResourceType:identifier:FHIRVersion:data:sourceURL:lastUpdatedDate:", v12, v13, v14, v15, v16, v17);

    objc_msgSend(v8, "receivedDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BDD39D8];
    objc_msgSend(MEMORY[0x24BDD3AF8], "localDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "clinicalRecordWithType:startDate:endDate:device:metadata:displayName:FHIRResource:", v9, v19, v19, v21, 0, v22, v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v27;
    objc_msgSend(v27, "representedResource");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstSeenDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_setCreationDate:", v25);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingContext, 0);
}

void __63__HDHealthRecordConstructClinicalRecordsTask_processWithError___block_invoke_cold_1(uint64_t a1, void *a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = OUTLINED_FUNCTION_1_0(a1, a2);
  HKSensitiveLogItem();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v5;
  OUTLINED_FUNCTION_0_0(&dword_224DAC000, v6, v7, "[ConstructClinicalRecordsTask] No APIResource on clinical item %@, not creating clinical record");

  OUTLINED_FUNCTION_2();
}

void __63__HDHealthRecordConstructClinicalRecordsTask_processWithError___block_invoke_cold_2(uint64_t a1, void *a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = OUTLINED_FUNCTION_1_0(a1, a2);
  HKSensitiveLogItem();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v5;
  OUTLINED_FUNCTION_0_0(&dword_224DAC000, v6, v7, "[ConstructClinicalRecordsTask] Item is not eligible for clinical record creation: %@");

  OUTLINED_FUNCTION_2();
}

- (void)_isEligibleClinicalItem:(void *)a1 error:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  HKSensitiveLogItem();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_224DAC000, v1, OS_LOG_TYPE_ERROR, "Clinical item %@ did not produce a medical record, not eligible for clinical record creation", (uint8_t *)&v3, 0xCu);

}

void __95__HDHealthRecordConstructClinicalRecordsTask__applyReferenceRulesToClinicalItem_ruleset_error___block_invoke_cold_1(uint64_t *a1, void *a2)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = a2;
  HKSensitiveLogItem();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543618;
  v6 = v2;
  v7 = 2114;
  v8 = v4;
  _os_log_error_impl(&dword_224DAC000, v3, OS_LOG_TYPE_ERROR, "[ConstructClinicalRecordsTask] Failed to create object from resource contained in %{public}@: %{public}@", (uint8_t *)&v5, 0x16u);

}

@end
