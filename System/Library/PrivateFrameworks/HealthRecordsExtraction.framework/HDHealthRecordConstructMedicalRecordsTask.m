@implementation HDHealthRecordConstructMedicalRecordsTask

- (HDHealthRecordConstructMedicalRecordsTask)initWithProcessingContext:(id)a3
{
  id v5;
  HDHealthRecordConstructMedicalRecordsTask *v6;
  HDHealthRecordConstructMedicalRecordsTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDHealthRecordConstructMedicalRecordsTask;
  v6 = -[HDHealthRecordConstructMedicalRecordsTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_processingContext, a3);

  return v7;
}

- (BOOL)_collectMedicalRecordPropertiesWithError:(id *)a3
{
  void *v5;
  id v6;
  int v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  -[HDHealthRecordProcessingContext extractionRuleset](self->_processingContext, "extractionRuleset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  v20 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __86__HDHealthRecordConstructMedicalRecordsTask__collectMedicalRecordPropertiesWithError___block_invoke;
  v11[3] = &unk_24ECF56C0;
  v11[4] = self;
  v6 = v5;
  v12 = v6;
  v13 = &v15;
  v14 = &v21;
  +[HDHealthRecordClinicalType enumerateClinicalTypesUsingBlock:](HDHealthRecordClinicalType, "enumerateClinicalTypesUsingBlock:", v11);
  v7 = *((unsigned __int8 *)v22 + 24);
  if (!*((_BYTE *)v22 + 24))
  {
    v8 = (id)v16[5];
    v9 = v8;
    if (v8)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v8);
      else
        _HKLogDroppedError();
    }

  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v7 != 0;
}

void __86__HDHealthRecordConstructMedicalRecordsTask__collectMedicalRecordPropertiesWithError___block_invoke(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  id *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v22;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(*(id *)(a1[4] + 8), "extractedClinicalItemsForClinicalType:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v6)
    goto LABEL_20;
  v7 = v6;
  v8 = *(_QWORD *)v26;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v26 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      if (objc_msgSend((id)objc_opt_class(), "_extractKeyPathsWithClinicalItem:ruleset:", v10, a1[5]))
      {
        v11 = (void *)a1[4];
        v12 = a1[5];
        v13 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
        obj = 0;
        objc_msgSend(v11, "_medicalRecordWithClinicalItem:clinicalType:ruleset:error:", v10, a2, v12, &obj);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v13, obj);
        if ((objc_msgSend(v14, "enteredInError") & 1) == 0
          && ((objc_msgSend((id)objc_opt_class(), "_unsupportedModifierExtensionsPresentInClinicalItem:", v10) & 1) != 0
           || objc_msgSend((id)objc_opt_class(), "_unresolvableReferencesPresentInClinicalItem:", v10)))
        {

        }
        else if (v14)
        {
          goto LABEL_13;
        }
      }
      v15 = (void *)a1[4];
      v16 = a1[5];
      v17 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
      v23 = 0;
      objc_msgSend(v15, "_unknownMedicalRecordWithClinicalItem:ruleset:error:", v10, v16, &v23);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v17, v23);
      if (!v14)
      {
        *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
        goto LABEL_19;
      }
LABEL_13:
      objc_msgSend(v10, "assignExtractedMedicalRecord:", v14);
      v18 = *(void **)(a1[4] + 8);
      objc_msgSend(v10, "representedResource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1[6] + 8);
      v22 = *(id *)(v20 + 40);
      LOBYTE(v18) = objc_msgSend(v18, "didProcessMedicalRecord:forResource:error:", v14, v19, &v22);
      objc_storeStrong((id *)(v20 + 40), v22);

      if ((v18 & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;

LABEL_19:
        *a3 = 1;
        goto LABEL_20;
      }

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v7)
      continue;
    break;
  }
LABEL_20:

}

+ (BOOL)_unsupportedModifierExtensionsPresentInClinicalItem:(id)a3
{
  id v4;
  void *v5;
  HDFHIRExtensionProcessor *v6;
  void *v7;
  HDFHIRExtensionProcessor *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "representedResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [HDFHIRExtensionProcessor alloc];
    objc_msgSend(v4, "representedResource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HDFHIRExtensionProcessor initWithResource:](v6, "initWithResource:", v7);

    v38 = 0;
    -[HDFHIRExtensionProcessor findUnsupportedModifierExtensions:](v8, "findUnsupportedModifierExtensions:", &v38);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v38;
    if (v9)
    {
      if (objc_msgSend(v9, "count"))
      {
        v29 = *MEMORY[0x24BE48828];
        objc_msgSend(v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", *MEMORY[0x24BE48828], objc_opt_class(), 0, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v32 = v4;
        v31 = v10;
        if (v11)
          v13 = v11;
        else
          v13 = objc_alloc_init(MEMORY[0x24BE48980]);
        v17 = v13;

        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v30 = v9;
        obj = v9;
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v35 != v20)
                objc_enumerationMutation(obj);
              v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
              objc_msgSend(v22, "keyPath");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "extensionElement");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "URI");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "stringByAppendingFormat:", CFSTR(".%@"), v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x24BE48988], "extractionFailureRecordWithCode:propertyName:resourceKeyPath:", 2, 0, v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "addFailureRecord:", v27);

            }
            v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          }
          while (v19);
        }

        v4 = v32;
        objc_msgSend(v32, "setMedicalRecordPropertyValue:forKey:", v17, v29);

        v15 = 1;
        v10 = v31;
        v9 = v30;
        goto LABEL_21;
      }
    }
    else
    {
      _HKInitializeLogging();
      v16 = (void *)*MEMORY[0x24BDD2FF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
        +[HDHealthRecordConstructMedicalRecordsTask _unsupportedModifierExtensionsPresentInClinicalItem:].cold.2(v16, a1);
    }
    v15 = 0;
LABEL_21:

    goto LABEL_22;
  }
  _HKInitializeLogging();
  v14 = (void *)*MEMORY[0x24BDD2FF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
    +[HDHealthRecordConstructMedicalRecordsTask _unsupportedModifierExtensionsPresentInClinicalItem:].cold.1(v14, a1);
  v15 = 0;
LABEL_22:

  return v15;
}

+ (BOOL)_unresolvableReferencesPresentInClinicalItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;

  v4 = a3;
  objc_msgSend(v4, "representedResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _HKInitializeLogging();
    v14 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      +[HDHealthRecordConstructMedicalRecordsTask _unsupportedModifierExtensionsPresentInClinicalItem:].cold.1(v14, a1);
    goto LABEL_8;
  }
  objc_msgSend(v4, "representedResource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "extractionHints");

  if ((v7 & 2) == 0)
  {
    objc_msgSend(v4, "representedResource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "extractionHints");

    if ((v9 & 1) == 0)
    {
LABEL_8:
      v15 = 0;
      goto LABEL_11;
    }
  }
  v10 = *MEMORY[0x24BE48828];
  objc_msgSend(v4, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", *MEMORY[0x24BE48828], objc_opt_class(), 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = objc_alloc_init(MEMORY[0x24BE48980]);
  v16 = v13;

  objc_msgSend(MEMORY[0x24BE48988], "extractionFailureRecordWithCode:propertyName:resourceKeyPath:", 7, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addFailureRecord:", v17);
  objc_msgSend(v4, "setMedicalRecordPropertyValue:forKey:", v16, v10);

  v15 = 1;
LABEL_11:

  return v15;
}

+ (BOOL)_extractKeyPathsWithClinicalItem:(id)a3 ruleset:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  BOOL v27;
  NSObject *v28;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  SEL v50;
  id v51;
  id v52;
  id obj;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  id v59;
  id v60;
  uint64_t v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  void *v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v52 = a4;
  objc_msgSend(v52, "rulesetForClinicalType:", objc_msgSend(v7, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v50 = a2;
    v51 = a1;
    v9 = objc_alloc_init(MEMORY[0x24BE48980]);
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    objc_msgSend(v8, "medicalRecordProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v11;
    v60 = v7;
    v56 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    if (v56)
    {
      v55 = *(_QWORD *)v68;
      v54 = v8;
      do
      {
        for (i = 0; i != v56; ++i)
        {
          if (*(_QWORD *)v68 != v55)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_msgSend(v8, "medicalRecordProperties");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v13;
          objc_msgSend(v14, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v58 = i;
            v16 = v9;
            v59 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            v63 = 0u;
            v64 = 0u;
            v65 = 0u;
            v66 = 0u;
            v57 = v15;
            v17 = v15;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v64;
              do
              {
                for (j = 0; j != v19; ++j)
                {
                  if (*(_QWORD *)v64 != v20)
                    objc_enumerationMutation(v17);
                  v22 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j);
                  v23 = (void *)MEMORY[0x22768E8BC]();
                  v62 = 0;
                  objc_msgSend(v7, "candidateValueForKeyPath:error:", v22, &v62);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = v62;
                  v26 = v25;
                  if (v24)
                    v27 = 1;
                  else
                    v27 = v25 == 0;
                  if (v27)
                  {
                    if (v24)
                      objc_msgSend(v59, "addObject:", v24);
                  }
                  else
                  {
                    _HKInitializeLogging();
                    v28 = *MEMORY[0x24BDD2FF8];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543362;
                      v72 = v26;
                      _os_log_error_impl(&dword_224DAC000, v28, OS_LOG_TYPE_ERROR, "ConstructMedicalRecordsTask keypath extraction error %{public}@", buf, 0xCu);
                    }
                    objc_msgSend(MEMORY[0x24BE48988], "extractionFailureRecordWithCode:propertyName:resourceKeyPath:", 4, v61, v22);
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "addFailureRecord:", v30);

                    v7 = v60;
                  }

                  objc_autoreleasePoolPop(v23);
                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
              }
              while (v19);
            }

            v9 = v16;
            if ((unint64_t)objc_msgSend(v59, "count") >= 2)
            {
              objc_msgSend(MEMORY[0x24BE48988], "extractionFailureRecordWithCode:propertyName:resourceKeyPath:", 5, v61, 0);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "addFailureRecord:", v31);

            }
            objc_msgSend(v16, "failureRecords");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "count");

            v8 = v54;
            if (!v33)
            {
              objc_msgSend(v59, "firstObject");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setMedicalRecordPropertyValue:forKey:", v34, v61);

            }
            v15 = v57;
            i = v58;
          }

        }
        v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
      }
      while (v56);
    }

    objc_msgSend(v9, "failureRecords");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");
    v37 = v36 == 0;

    if (v36)
    {
      v38 = *MEMORY[0x24BE48828];
      objc_msgSend(v7, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", *MEMORY[0x24BE48828], objc_opt_class(), 0, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "debugDescription");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", v38, objc_opt_class(), 0, 0);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", v50, v51, CFSTR("HDHealthRecordConstructMedicalRecordsTask.m"), 206, CFSTR("%@ trying to extract keypaths from a clinical item with existing extraction failures %@"), v48, v49);

        v7 = v60;
      }
      objc_msgSend(v7, "setMedicalRecordPropertyValue:forKey:", v9, v38);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE48988], "extractionFailureRecordWithCode:propertyName:resourceKeyPath:", 3, 0, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = *MEMORY[0x24BE48828];
    objc_msgSend(v7, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", *MEMORY[0x24BE48828], objc_opt_class(), 0, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v42)
      v44 = v42;
    else
      v44 = objc_alloc_init(MEMORY[0x24BE48980]);
    v45 = v44;

    objc_msgSend(v45, "addFailureRecord:", v40);
    objc_msgSend(v7, "setMedicalRecordPropertyValue:forKey:", v45, v41);

    v37 = 0;
  }

  return v37;
}

- (id)_unknownMedicalRecordWithClinicalItem:(id)a3 ruleset:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", *MEMORY[0x24BE48828], objc_opt_class(), 0, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v39 = v7;
  objc_msgSend(v7, "rulesetForClinicalType:", objc_msgSend(v6, "type"));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "displayNameKeyPaths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v46;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v46 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v13);
        v44 = 0;
        objc_msgSend(v6, "candidateValueForKeyPath:error:", v14, &v44);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v44;
        v17 = v16;
        if (v15)
          v18 = 1;
        else
          v18 = v16 == 0;
        if (v18)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {

            if (v15)
              objc_msgSend(v6, "setMedicalRecordPropertyValue:forKey:", v15, CFSTR("displayName"));
            goto LABEL_23;
          }
        }
        else
        {
          _HKInitializeLogging();
          v19 = *MEMORY[0x24BDD2FF8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v50 = v17;
            _os_log_error_impl(&dword_224DAC000, v19, OS_LOG_TYPE_ERROR, "ConstructMedicalRecordsTask unknown medical record display name extraction error %{public}@", buf, 0xCu);
          }
          objc_msgSend(MEMORY[0x24BE48988], "extractionFailureRecordWithCode:propertyName:resourceKeyPath:", 4, CFSTR("displayName"), v14);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v8)
            v8 = objc_alloc_init(MEMORY[0x24BE48980]);
          objc_msgSend(v8, "addFailureRecord:", v21);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      if (v11)
        continue;
      break;
    }
  }

  v15 = 0;
LABEL_23:
  v43 = 0;
  objc_msgSend(v6, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", CFSTR("enteredInError"), objc_opt_class(), 0, &v43);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v43;
  v24 = v23;
  if (!v22)
  {
    if (v23)
    {
      _HKInitializeLogging();
      v25 = *MEMORY[0x24BDD2FF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
        -[HDHealthRecordConstructMedicalRecordsTask _unknownMedicalRecordWithClinicalItem:ruleset:error:].cold.3((uint64_t)v24, v25, v26);
    }
    objc_msgSend(v6, "representedResource");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "JSONObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = v24;
    +[HDHealthRecordsExtractionUtilities wasEnteredInError:error:](HDHealthRecordsExtractionUtilities, "wasEnteredInError:error:", v28, &v42);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v42;

    if (!v29)
    {
      _HKInitializeLogging();
      v31 = (void *)*MEMORY[0x24BDD2FF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
        -[HDHealthRecordConstructMedicalRecordsTask _unknownMedicalRecordWithClinicalItem:ruleset:error:].cold.2(v31);
      v29 = &unk_24ED0FD68;
    }
    objc_msgSend(v6, "setMedicalRecordPropertyValue:forKey:", v29, CFSTR("enteredInError"));

    v24 = v30;
  }
  v32 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (v8)
  {
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v8, "encodeWithCoder:", v33);
    objc_msgSend(v33, "encodedData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v34, *MEMORY[0x24BDD4398]);

  }
  if (objc_msgSend(v32, "count"))
    v35 = v32;
  else
    v35 = 0;
  objc_msgSend(v6, "assignMedicalRecordMetadata:", v35);
  _HKInitializeLogging();
  v36 = (void *)*MEMORY[0x24BDD2FF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
    -[HDHealthRecordConstructMedicalRecordsTask _unknownMedicalRecordWithClinicalItem:ruleset:error:].cold.1(v36, v6);
  objc_msgSend(MEMORY[0x24BDD4058], "medicalRecordFromClinicalItem:error:", v6, a5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (id)_medicalRecordWithClinicalItem:(id)a3 clinicalType:(int64_t)a4 ruleset:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  int v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v35;
  id v36;
  HDHealthRecordConstructMedicalRecordsTask *v37;
  id *v38;
  id v39;
  void *v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v46 = 0;
  objc_msgSend((id)objc_msgSend(v9, "medicalRecordClass"), "medicalRecordFromClinicalItem:error:", v9, &v46);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v46;
  if (!v11)
  {
    v39 = v10;
    v35 = *MEMORY[0x24BE48828];
    objc_msgSend(v9, "medicalRecordPropertyValueForKey:expectedClass:isArray:error:", *MEMORY[0x24BE48828], objc_opt_class(), 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v40 = v9;
    v37 = self;
    v38 = a6;
    if (v14)
      v16 = v14;
    else
      v16 = objc_alloc_init(MEMORY[0x24BE48980]);
    v17 = v16;

    v36 = v12;
    objc_msgSend(v12, "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("conversionErrors"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = v19;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    if (!v20)
    {
LABEL_25:

      v9 = v40;
      objc_msgSend(v40, "setMedicalRecordPropertyValue:forKey:", v17, v35);
      v10 = v39;
      -[HDHealthRecordConstructMedicalRecordsTask _unknownMedicalRecordWithClinicalItem:ruleset:error:](v37, "_unknownMedicalRecordWithClinicalItem:ruleset:error:", v40, v39, v38);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      v12 = v36;
      v11 = 0;
      goto LABEL_26;
    }
    v21 = v20;
    v22 = *(_QWORD *)v43;
LABEL_8:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v43 != v22)
        objc_enumerationMutation(obj);
      v24 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v23);
      objc_msgSend(v24, "userInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("propertyName"));
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v27 = CFSTR("UnknownPropertyName");
      if (v26)
        v27 = v26;
      v28 = v27;

      objc_msgSend(v24, "domain");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("HDHealthRecordsServiceErrorDomain"));

      if (!v30)
        goto LABEL_22;
      if (objc_msgSend(v24, "code") == 204)
      {
        v31 = 6;
      }
      else if (objc_msgSend(v24, "code") == 202)
      {
        v31 = 8;
      }
      else
      {
        if (objc_msgSend(v24, "code") != 203)
        {
          _HKInitializeLogging();
          v32 = *MEMORY[0x24BDD2FF8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v48 = v24;
            _os_log_error_impl(&dword_224DAC000, v32, OS_LOG_TYPE_ERROR, "ConstructMedicalRecordsTask medical record creation, unexpected error %{public}@", buf, 0xCu);
          }
LABEL_22:
          v31 = 1;
          goto LABEL_23;
        }
        v31 = 9;
      }
LABEL_23:
      objc_msgSend(MEMORY[0x24BE48988], "extractionFailureRecordWithCode:propertyName:resourceKeyPath:", v31, v28, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addFailureRecord:", v33);

      if (v21 == ++v23)
      {
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
        if (!v21)
          goto LABEL_25;
        goto LABEL_8;
      }
    }
  }
  v13 = v11;
LABEL_26:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingContext, 0);
}

+ (void)_unsupportedModifierExtensionsPresentInClinicalItem:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend(a2, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_2_1(&dword_224DAC000, v3, v5, "%{public}@ no represented resource present on clinical item", (uint8_t *)&v6);

  OUTLINED_FUNCTION_5();
}

+ (void)_unsupportedModifierExtensionsPresentInClinicalItem:(void *)a1 .cold.2(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend(a2, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_224DAC000, v5, v6, "%{public}@ failed to find modifier extensions: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

- (void)_unknownMedicalRecordWithClinicalItem:(void *)a1 ruleset:(void *)a2 error:.cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend(a2, "representedResource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_224DAC000, v5, v6, "Failed extraction of %{public}@: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

- (void)_unknownMedicalRecordWithClinicalItem:(void *)a1 ruleset:error:.cold.2(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v1 = OUTLINED_FUNCTION_3_0(a1);
  v2 = (id)objc_opt_class();
  HKSensitiveLogItem();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_224DAC000, v3, v4, "%{public}@ failed to determine entered-in-error status on resource %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)_unknownMedicalRecordWithClinicalItem:(uint64_t)a1 ruleset:(NSObject *)a2 error:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_2_1(&dword_224DAC000, a2, a3, "Entered in error status missing from clinical item: %@", (uint8_t *)&v3);
}

@end
