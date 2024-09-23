@implementation HDHealthRecordFindReferencesTask

- (HDHealthRecordFindReferencesTask)init
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

- (HDHealthRecordFindReferencesTask)initWithRuleset:(id)a3
{
  id v6;
  HDHealthRecordFindReferencesTask *v7;
  HDHealthRecordFindReferencesTask *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHealthRecordFindReferencesTask.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ruleset"));

  }
  v11.receiver = self;
  v11.super_class = (Class)HDHealthRecordFindReferencesTask;
  v7 = -[HDHealthRecordFindReferencesTask init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_ruleset, a3);

  return v8;
}

- (id)processResourcesForReferenceExtractionRequest:(id)a3 error:(id *)a4
{
  id v6;
  HDReferenceExtractionProcessingContext *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  HDReferenceExtractionProcessingContext *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id *p_isa;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  char v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v85;
  void *v86;
  void *v87;
  __int128 v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  void *v94;
  HKHealthRecordsExtractionRouter *v95;
  HDReferenceExtractionProcessingContext *v96;
  HDHealthRecordFindReferencesTask *v97;
  id *v98;
  uint64_t v99;
  id obj;
  id obja;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  id v106;
  id v107;
  id v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  char v114[16];
  uint8_t buf[4];
  void *v116;
  __int16 v117;
  id v118;
  __int16 v119;
  id v120;
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(HDReferenceExtractionProcessingContext);
  v95 = objc_alloc_init(HKHealthRecordsExtractionRouter);
  objc_msgSend(v6, "resources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BDBCEF0]);
    objc_msgSend(v6, "resources");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = (id)objc_msgSend(v9, "initWithArray:", v10);

  }
  else
  {
    v91 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  }
  v96 = v7;
  v97 = self;

  v92 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  objc_msgSend(v6, "serverBaseURL");
  v89 = v6;
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "FHIRResourceData");
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v109, v121, 16);
  v93 = v11;
  if (v12)
  {
    v14 = (id)v12;
    v98 = a4;
    v94 = 0;
    v15 = *(_QWORD *)v110;
    v16 = 0x24BE48000uLL;
    *(_QWORD *)&v13 = 138543618;
    v88 = v13;
    while (1)
    {
      v17 = 0;
      obj = v14;
      do
      {
        if (*(_QWORD *)v110 != v15)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * (_QWORD)v17);
        v19 = *(void **)(v16 + 2408);
        v108 = 0;
        objc_msgSend(v19, "objectWithResourceData:error:", v18, &v108, v88);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v108;
        if (!v20)
        {
          _HKInitializeLogging();
          v43 = (void *)*MEMORY[0x24BDD2FF8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
          {
            v85 = v43;
            -[HDHealthRecordFindReferencesTask debugDescription](v97, "debugDescription");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "debugDescription");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v116 = v86;
            v117 = 2114;
            v118 = v87;
            v119 = 2114;
            v120 = v21;
            _os_log_error_impl(&dword_224DAC000, v85, OS_LOG_TYPE_ERROR, "%{public}@: failed to parse JSON data %{public}@: %{public}@", buf, 0x20u);

          }
          objc_msgSend(MEMORY[0x24BDD1540], "hrs_resourceParsingErrorWithUnderlyingError:", v21);
          v44 = (id)objc_claimAutoreleasedReturnValue();
          v45 = v44;
          v46 = v96;
          if (v44)
          {
            if (v98)
            {
              v45 = objc_retainAutorelease(v44);
              v47 = 0;
              *v98 = v45;
              v48 = v45;
LABEL_58:
              v83 = v93;
              v82 = v94;
              v81 = v93;
              goto LABEL_59;
            }
            _HKLogDroppedError();
          }
          v47 = 0;
          v48 = v45;
          goto LABEL_58;
        }
        objc_msgSend(v20, "detectedResourceType");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("Bundle"));

        if (v23)
        {
          if (v94)
          {
            _HKInitializeLogging();
            v24 = (void *)*MEMORY[0x24BDD2FF8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
              -[HDHealthRecordFindReferencesTask processResourcesForReferenceExtractionRequest:error:].cold.1((uint64_t)v114, v24);
            v25 = v21;
          }
          else
          {
            v107 = v21;
            +[HDFHIRResourceSearchSet searchSetWithFHIRJSONObject:serverBaseURL:error:](HDFHIRResourceSearchSet, "searchSetWithFHIRJSONObject:serverBaseURL:error:", v20, v90, &v107);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v107;

            if (v33)
            {
              v94 = v33;
              objc_msgSend(v33, "entries");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[HDHealthRecordFindReferencesTask _filterResources:](v97, "_filterResources:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v91, "addObjectsFromArray:", v35);
            }
            else
            {
              _HKInitializeLogging();
              v37 = (void *)*MEMORY[0x24BDD2FF8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
              {
                v40 = v37;
                -[HDHealthRecordFindReferencesTask debugDescription](v97, "debugDescription");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v88;
                v116 = v41;
                v117 = 2114;
                v118 = v25;
                _os_log_error_impl(&dword_224DAC000, v40, OS_LOG_TYPE_ERROR, "%{public}@: invalid bundle error: %{public}@", buf, 0x16u);

                v11 = v93;
              }
              v94 = 0;
            }
          }
        }
        else
        {
          v26 = v15;
          v27 = v16;
          v28 = (void *)MEMORY[0x24BE48978];
          objc_msgSend(v20, "JSONObject");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "sourceURL");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "FHIRVersion");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = v21;
          objc_msgSend(v28, "resourceObjectWithJSONObject:sourceURL:FHIRVersion:receivedDate:extractionHints:error:", v29, v30, v31, v92, 0, &v106);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v106;

          if (v32)
          {
            objc_msgSend(v91, "addObject:", v32);
            v11 = v93;
            v16 = v27;
          }
          else
          {
            _HKInitializeLogging();
            v36 = (void *)*MEMORY[0x24BDD2FF8];
            v11 = v93;
            v16 = v27;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
            {
              v38 = v36;
              -[HDHealthRecordFindReferencesTask debugDescription](v97, "debugDescription");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v88;
              v116 = v39;
              v117 = 2114;
              v118 = v25;
              _os_log_error_impl(&dword_224DAC000, v38, OS_LOG_TYPE_ERROR, "%{public}@: invalid resourceObject error: %{public}@", buf, 0x16u);

              v16 = v27;
            }
          }

          v15 = v26;
          v14 = obj;
        }

        v17 = (char *)v17 + 1;
      }
      while (v14 != v17);
      v42 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v109, v121, 16);
      v14 = (id)v42;
      if (!v42)
        goto LABEL_35;
    }
  }
  v94 = 0;
LABEL_35:

  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  obja = v91;
  v49 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
  v46 = v96;
  p_isa = (id *)&v97->super.isa;
  if (v49)
  {
    v51 = v49;
    v52 = *(_QWORD *)v103;
    do
    {
      v53 = 0;
      v99 = v51;
      do
      {
        if (*(_QWORD *)v103 != v52)
          objc_enumerationMutation(obja);
        v54 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v53);
        if ((objc_msgSend(p_isa, "_canProcessResource:", v54) & 1) != 0)
        {
          objc_msgSend(p_isa[1], "rulesetForFHIRResourceObject:", v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          if (v55)
          {
            objc_msgSend(p_isa, "_processedContainReferencesResourceWithResource:processingContext:rule:allResources:", v54, v46, v55, obja);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(p_isa, "_processedRetrieveReferencesResourceWithResource:processingContext:rule:allResources:", v56, v46, v55, obja);
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            -[HDReferenceExtractionProcessingContext recordProcessedResource:](v46, "recordProcessedResource:", v57);
          }
          else
          {
            objc_msgSend(p_isa[1], "releaseSupport");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "FHIRRelease");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKHealthRecordsExtractionRouter supportedResourceTypesForRelease:](v95, "supportedResourceTypesForRelease:", v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "identifier");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "resourceType");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = objc_msgSend(v63, "containsObject:", v65);

            if (v66)
            {
              _HKInitializeLogging();
              v67 = (void *)*MEMORY[0x24BDD2FF8];
              p_isa = (id *)&v97->super.isa;
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEBUG))
              {
                v72 = v67;
                -[HDHealthRecordFindReferencesTask debugDescription](v97, "debugDescription");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "identifier");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "resourceType");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v116 = v73;
                v117 = 2114;
                v118 = v75;
                _os_log_debug_impl(&dword_224DAC000, v72, OS_LOG_TYPE_DEBUG, "%{public}@ processResourcesForReferenceExtractionRequest: resource type %{public}@. Skipping Reference extraction.", buf, 0x16u);

              }
              v46 = v96;
              -[HDReferenceExtractionProcessingContext recordProcessedResource:](v96, "recordProcessedResource:", v54);
            }
            else
            {
              objc_msgSend(v54, "identifier");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "resourceType");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = objc_msgSend(v69, "isEqualToString:", CFSTR("Medication"));

              v46 = v96;
              p_isa = (id *)&v97->super.isa;
              if ((v70 & 1) == 0)
              {
                _HKInitializeLogging();
                v71 = (void *)*MEMORY[0x24BDD2FF8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
                {
                  v76 = v71;
                  -[HDHealthRecordFindReferencesTask debugDescription](v97, "debugDescription");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "identifier");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v78, "resourceType");
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v116 = v77;
                  v117 = 2114;
                  v118 = v79;
                  _os_log_error_impl(&dword_224DAC000, v76, OS_LOG_TYPE_ERROR, "%{public}@ processResourcesForReferenceExtractionRequest: no extraction rules for resource type %{public}@", buf, 0x16u);

                }
              }
            }
          }

          v51 = v99;
        }
        else
        {
          _HKInitializeLogging();
          v58 = (void *)*MEMORY[0x24BDD2FF8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
          {
            v59 = v58;
            objc_msgSend(p_isa, "debugDescription");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v116 = v60;
            v117 = 2114;
            v118 = v54;
            _os_log_error_impl(&dword_224DAC000, v59, OS_LOG_TYPE_ERROR, "%{public}@ processResourcesForReferenceExtractionRequest: cannot process resource: %{public}@", buf, 0x16u);

          }
        }
        ++v53;
      }
      while (v51 != v53);
      v51 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
    }
    while (v51);
  }

  v80 = objc_alloc(MEMORY[0x24BE489C0]);
  -[HDReferenceExtractionProcessingContext completeResources](v46, "completeResources");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDReferenceExtractionProcessingContext incompleteResources](v46, "incompleteResources");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[HDReferenceExtractionProcessingContext unresolvableReferences](v46, "unresolvableReferences");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v94;
  objc_msgSend(v94, "nextPageURL");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v80, "initWithCompleteResources:incompleteResources:unresolvableReferences:nextSearchResultURL:", v81, v21, v48, v45);
  v83 = v93;
LABEL_59:

  return v47;
}

- (id)_processedContainReferencesResourceWithResource:(id)a3 processingContext:(id)a4 rule:(id)a5 allResources:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v45;
  void *v46;
  id obj;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *log;
  void *v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  char v72[16];
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  id v78;
  __int16 v79;
  id v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v59 = a6;
  objc_msgSend(v10, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resourceType");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "serverBaseURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v10;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v45 = v12;
  objc_msgSend(v12, "containReferences");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v46 = v15;
  v16 = v15;
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
  if (v50)
  {
    v49 = *(_QWORD *)v69;
    v16 = v15;
    v60 = v11;
    v58 = v14;
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v69 != v49)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
        objc_msgSend(v16, "JSONObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = 0;
        +[HDFHIRReferenceProcessor referencesAtKeyPath:resourceDictionary:error:](HDFHIRReferenceProcessor, "referencesAtKeyPath:resourceDictionary:error:", v18, v19, &v67);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v67;

        if (v20)
        {
          v51 = v21;
          v52 = v20;
          v53 = i;
          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          v22 = v20;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v64;
            v14 = v58;
            v61 = v22;
            do
            {
              for (j = 0; j != v24; ++j)
              {
                if (*(_QWORD *)v64 != v25)
                  objc_enumerationMutation(v22);
                v27 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
                if (-[HDHealthRecordFindReferencesTask _isIrretrievableReference:serverBaseURL:](self, "_isIrretrievableReference:serverBaseURL:", v27, v14))
                {
                  objc_msgSend(v11, "recordUnresolvableReference:forResource:hint:", v27, v16, 1);
                }
                else if (-[HDHealthRecordFindReferencesTask _resourceReference:containedInResource:](self, "_resourceReference:containedInResource:", v27, v16))
                {
                  _HKInitializeLogging();
                  v28 = (void *)*MEMORY[0x24BDD2FF8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEBUG))
                    -[HDHealthRecordFindReferencesTask _processedContainReferencesResourceWithResource:processingContext:rule:allResources:].cold.1((uint64_t)v72, v28);
                }
                else if (+[HDFHIRReferenceProcessor referenceRequiresContaining:](HDFHIRReferenceProcessor, "referenceRequiresContaining:", v27)|| (-[HDHealthRecordFindReferencesTask _resourceReference:presentInResources:](self, "_resourceReference:presentInResources:", v27, v59), (v29 = objc_claimAutoreleasedReturnValue()) == 0))
                {
                  _HKInitializeLogging();
                  v35 = (void *)*MEMORY[0x24BDD2FF8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEBUG))
                  {
                    v37 = v35;
                    -[HDHealthRecordFindReferencesTask debugDescription](self, "debugDescription");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v74 = v38;
                    v75 = 2114;
                    v76 = v27;
                    _os_log_debug_impl(&dword_224DAC000, v37, OS_LOG_TYPE_DEBUG, "%{public}@ containReferences: referenced resource not present, marking unresolved: %{public}@", buf, 0x16u);

                    v14 = v58;
                  }
                  objc_msgSend(v11, "recordUnresolvedReference:forResource:", v27, v16);
                  v22 = v61;
                }
                else
                {
                  v30 = (void *)v29;
                  _HKInitializeLogging();
                  v31 = (void *)*MEMORY[0x24BDD2FF8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEBUG))
                  {
                    v39 = v31;
                    -[HDHealthRecordFindReferencesTask debugDescription](self, "debugDescription");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v74 = v40;
                    v75 = 2114;
                    v76 = v30;
                    _os_log_debug_impl(&dword_224DAC000, v39, OS_LOG_TYPE_DEBUG, "%{public}@ containReferences: found resource %{public}@, containing", buf, 0x16u);

                  }
                  v62 = 0;
                  v32 = +[HDFHIRReferenceProcessor newResourceFromResource:containingResource:reference:error:](HDFHIRReferenceProcessor, "newResourceFromResource:containingResource:reference:error:", v16, v30, v27, &v62);
                  v33 = v62;
                  if (v32)
                  {
                    v34 = v32;

                    objc_msgSend(v60, "recordContainedResource:", v30);
                    v16 = v34;
                  }
                  else
                  {
                    _HKInitializeLogging();
                    v36 = (void *)*MEMORY[0x24BDD2FF8];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
                    {
                      log = v36;
                      -[HDHealthRecordFindReferencesTask debugDescription](self, "debugDescription");
                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v30, "identifier");
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v56, "resourceType");
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138544130;
                      v74 = v55;
                      v75 = 2114;
                      v76 = v54;
                      v77 = 2114;
                      v78 = v48;
                      v79 = 2114;
                      v80 = v33;
                      _os_log_error_impl(&dword_224DAC000, log, OS_LOG_TYPE_ERROR, "%{public}@ containReferences: failed to contain resource %{public}@ in resource %{public}@: %{public}@", buf, 0x2Au);

                    }
                    objc_msgSend(v60, "recordUnresolvedReference:forResource:", v27, v16);
                  }

                  v11 = v60;
                  v22 = v61;
                  v14 = v58;
                }
              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
            }
            while (v24);
          }
          else
          {
            v14 = v58;
          }

          v20 = v52;
          i = v53;
          v21 = v51;
        }
        else
        {
          _HKInitializeLogging();
          v41 = (void *)*MEMORY[0x24BDD2FF8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
          {
            v42 = v41;
            -[HDHealthRecordFindReferencesTask debugDescription](self, "debugDescription");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v74 = v43;
            v75 = 2114;
            v76 = v48;
            v77 = 2114;
            v78 = v21;
            _os_log_error_impl(&dword_224DAC000, v42, OS_LOG_TYPE_ERROR, "%{public}@ containReferences: invalid reference on %{public}@ resource: %{public}@", buf, 0x20u);

          }
          objc_msgSend(v11, "recordUnresolvableReference:forResource:hint:", v18, v16, 2);
          v14 = v58;
        }

      }
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
    }
    while (v50);
  }

  return v16;
}

- (id)_processedRetrieveReferencesResourceWithResource:(id)a3 processingContext:(id)a4 rule:(id)a5 allResources:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  uint32_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  void *v50;
  void *v51;
  id obj;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  void *v58;
  NSObject *loga;
  os_log_t log;
  id v61;
  void *v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t v74[128];
  uint8_t buf[4];
  os_log_t v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  id v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v63 = a4;
  v11 = a5;
  v12 = v10;
  v13 = v11;
  v61 = a6;
  objc_msgSend(v10, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resourceType");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "serverBaseURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v50 = v13;
  objc_msgSend(v13, "retrieveReferences");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
  if (v54)
  {
    v53 = *(_QWORD *)v71;
    v62 = v10;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v71 != v53)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v16);
        _HKInitializeLogging();
        v18 = (void *)*MEMORY[0x24BDD2FF8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEBUG))
        {
          v46 = v18;
          -[HDHealthRecordFindReferencesTask debugDescription](self, "debugDescription");
          v47 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v76 = v47;
          v77 = 2114;
          v78 = v17;
          v79 = 2114;
          v80 = v62;
          _os_log_debug_impl(&dword_224DAC000, v46, OS_LOG_TYPE_DEBUG, "%{public}@ retrieveReferences: attempting to retrieve %{public}@ in %{public}@", buf, 0x20u);

        }
        v56 = v16;
        objc_msgSend(v62, "JSONObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = 0;
        +[HDFHIRReferenceProcessor referencesAtKeyPath:resourceDictionary:error:](HDFHIRReferenceProcessor, "referencesAtKeyPath:resourceDictionary:error:", v17, v19, &v69);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v69;

        if (!v20)
        {
          _HKInitializeLogging();
          v28 = (void *)*MEMORY[0x24BDD2FF8];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
            goto LABEL_13;
          v23 = v28;
          -[HDHealthRecordFindReferencesTask debugDescription](self, "debugDescription");
          v24 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v76 = v24;
          v77 = 2114;
          v78 = v17;
          v79 = 2114;
          v80 = v51;
          v81 = 2114;
          v82 = v21;
          v25 = v23;
          v26 = "%{public}@ retrieveReferences: invalid reference at %{public}@ on %{public}@ resource: %{public}@";
          v27 = 42;
          goto LABEL_40;
        }
        v12 = v62;
        if (!objc_msgSend(v20, "count"))
        {
          _HKInitializeLogging();
          v22 = (void *)*MEMORY[0x24BDD2FF8];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
          {
LABEL_13:
            v12 = v62;
            objc_msgSend(v63, "recordUnresolvableReference:forResource:hint:", v17, v62, 2);
            goto LABEL_14;
          }
          v23 = v22;
          -[HDHealthRecordFindReferencesTask debugDescription](self, "debugDescription");
          v24 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v76 = v24;
          v77 = 2114;
          v78 = v17;
          v79 = 2114;
          v80 = v51;
          v25 = v23;
          v26 = "%{public}@ retrieveReferences: reference \"%{public}@\" on %{public}@ not present";
          v27 = 32;
LABEL_40:
          _os_log_error_impl(&dword_224DAC000, v25, OS_LOG_TYPE_ERROR, v26, buf, v27);

          goto LABEL_13;
        }
LABEL_14:
        v55 = v21;
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v29 = v20;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
        if (!v30)
          goto LABEL_37;
        v31 = v30;
        v32 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v66 != v32)
              objc_enumerationMutation(v29);
            v34 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
            if (-[HDHealthRecordFindReferencesTask _isIrretrievableReference:serverBaseURL:](self, "_isIrretrievableReference:serverBaseURL:", v34, v15))
            {
              objc_msgSend(v63, "recordUnresolvableReference:forResource:hint:", v34, v12, 1);
              continue;
            }
            v35 = v15;
            v64 = 0;
            -[HDHealthRecordFindReferencesTask _resourceForReference:containedInResource:error:](self, "_resourceForReference:containedInResource:error:", v34, v12, &v64);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v64;
            if (v36)
            {
              _HKInitializeLogging();
              v38 = (void *)*MEMORY[0x24BDD2FF8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEBUG))
              {
                v43 = v38;
                -[HDHealthRecordFindReferencesTask debugDescription](self, "debugDescription");
                v44 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v76 = v44;
                v77 = 2114;
                v78 = v36;
                _os_log_debug_impl(&dword_224DAC000, v43, OS_LOG_TYPE_DEBUG, "%{public}@ retrieveReferences: resource %{public}@ was contained", buf, 0x16u);

              }
              objc_msgSend(v63, "recordContainedResource:", v36);
            }
            else
            {
              if (+[HDFHIRReferenceProcessor referenceRequiresContaining:](HDFHIRReferenceProcessor, "referenceRequiresContaining:", v34)|| (-[HDHealthRecordFindReferencesTask _resourceReference:presentInResources:](self, "_resourceReference:presentInResources:", v34, v61), (v39 = objc_claimAutoreleasedReturnValue()) == 0))
              {
                _HKInitializeLogging();
                v42 = (void *)*MEMORY[0x24BDD2FF8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEBUG))
                {
                  loga = v42;
                  -[HDHealthRecordFindReferencesTask debugDescription](self, "debugDescription");
                  v57 = objc_claimAutoreleasedReturnValue();
                  HKSensitiveLogItem();
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v76 = v57;
                  v77 = 2114;
                  v78 = v58;
                  _os_log_debug_impl(&dword_224DAC000, loga, OS_LOG_TYPE_DEBUG, "%{public}@ retrieveReferences: referenced resource not present, marking unresolved: %{public}@", buf, 0x16u);

                }
                v12 = v62;
                objc_msgSend(v63, "recordUnresolvedReference:forResource:", v34, v62);
                goto LABEL_34;
              }
              v40 = (void *)v39;
              _HKInitializeLogging();
              v41 = (void *)*MEMORY[0x24BDD2FF8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEBUG))
              {
                v45 = v41;
                -[HDHealthRecordFindReferencesTask debugDescription](self, "debugDescription");
                log = (os_log_t)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v76 = log;
                v77 = 2114;
                v78 = v40;
                _os_log_debug_impl(&dword_224DAC000, v45, OS_LOG_TYPE_DEBUG, "%{public}@ retrieveReferences: found resource %{public}@", buf, 0x16u);

              }
              objc_msgSend(v63, "recordProcessedResource:", v40);

            }
            v12 = v62;
LABEL_34:

            v15 = v35;
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
        }
        while (v31);
LABEL_37:

        v16 = v56 + 1;
      }
      while (v56 + 1 != v54);
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
      v54 = v48;
    }
    while (v48);
  }

  return v12;
}

- (BOOL)processContainedResourcesInProcessingContext:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _UNKNOWN **v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  BOOL v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id obj;
  HDHealthRecordFindReferencesTask *v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t v72[128];
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  id v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v57 = a3;
  objc_msgSend(v57, "resources");
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v69;
    v9 = &off_24ECF4000;
    v49 = v5;
    v56 = self;
    v46 = *(_QWORD *)v69;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v69 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        if (-[HDHealthRecordFindReferencesTask _canProcessResource:](self, "_canProcessResource:", v11))
        {
          -[HDHealthRecordRuleset rulesetForFHIRResourceObject:](self->_ruleset, "rulesetForFHIRResourceObject:", v11);
          v12 = objc_claimAutoreleasedReturnValue();
          if (!v12)
            continue;
          v13 = v12;
          v67 = 0u;
          v65 = 0u;
          v66 = 0u;
          v64 = 0u;
          -[NSObject retrieveReferences](v12, "retrieveReferences");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
          if (v51)
          {
            v53 = *(_QWORD *)v65;
            v45 = v7;
            v47 = i;
            v48 = v13;
            do
            {
              for (j = 0; j != v51; ++j)
              {
                if (*(_QWORD *)v65 != v53)
                  objc_enumerationMutation(obj);
                v15 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
                _HKInitializeLogging();
                v16 = (void *)*MEMORY[0x24BDD2FF8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEBUG))
                {
                  v35 = v16;
                  -[HDHealthRecordFindReferencesTask debugDescription](self, "debugDescription");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v74 = v36;
                  v75 = 2114;
                  v76 = v15;
                  v77 = 2114;
                  v78 = v11;
                  _os_log_debug_impl(&dword_224DAC000, v35, OS_LOG_TYPE_DEBUG, "%{public}@ processContainedResources: looking at %{public}@ in %{public}@", buf, 0x20u);

                }
                v17 = v9[278];
                objc_msgSend(v11, "JSONObject");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = 0;
                objc_msgSend(v17, "referencesAtKeyPath:resourceDictionary:error:", v15, v18, &v63);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = v63;

                if (v19)
                {
                  v52 = v20;
                  v50 = j;
                  v61 = 0u;
                  v62 = 0u;
                  v59 = 0u;
                  v60 = 0u;
                  v21 = v19;
                  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
                  if (v22)
                  {
                    v23 = v22;
                    v24 = *(_QWORD *)v60;
                    while (2)
                    {
                      for (k = 0; k != v23; ++k)
                      {
                        if (*(_QWORD *)v60 != v24)
                          objc_enumerationMutation(v21);
                        v26 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * k);
                        v58 = 0;
                        -[HDHealthRecordFindReferencesTask _resourceForReference:containedInResource:error:](self, "_resourceForReference:containedInResource:error:", v26, v11, &v58);
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        v28 = v58;
                        if (v27)
                        {
                          v29 = (void *)objc_msgSend(v27, "copyWithOriginDataFrom:", v11);
                          _HKInitializeLogging();
                          v30 = (void *)*MEMORY[0x24BDD2FF8];
                          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEBUG))
                          {
                            v32 = v30;
                            -[HDHealthRecordFindReferencesTask debugDescription](v56, "debugDescription");
                            v33 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138543618;
                            v74 = v33;
                            v75 = 2114;
                            v76 = v29;
                            _os_log_debug_impl(&dword_224DAC000, v32, OS_LOG_TYPE_DEBUG, "%{public}@ processContainedResources: found contained resource %{public}@", buf, 0x16u);

                          }
                          v31 = objc_msgSend(v57, "foundResource:parentResource:error:", v29, v11, a4);

                          self = v56;
                          if (!v31)
                          {

                            v43 = 0;
                            v5 = v49;
                            goto LABEL_41;
                          }
                        }

                      }
                      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
                      if (v23)
                        continue;
                      break;
                    }
                  }

                  v9 = &off_24ECF4000;
                  i = v47;
                  j = v50;
                  v20 = v52;
                }
                else
                {
                  _HKInitializeLogging();
                  v34 = (void *)*MEMORY[0x24BDD2FF8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
                  {
                    v37 = v34;
                    -[HDHealthRecordFindReferencesTask debugDescription](self, "debugDescription");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject resourceName](v48, "resourceName");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544130;
                    v74 = v38;
                    v75 = 2114;
                    v76 = v15;
                    v77 = 2114;
                    v78 = v39;
                    v79 = 2114;
                    v80 = v20;
                    _os_log_error_impl(&dword_224DAC000, v37, OS_LOG_TYPE_ERROR, "%{public}@ processContainedResources: invalid reference at %{public}@ on %{public}@ resource: %{public}@", buf, 0x2Au);

                    self = v56;
                  }
                }

              }
              v13 = v48;
              v5 = v49;
              v8 = v46;
              v7 = v45;
              v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
            }
            while (v51);
          }

        }
        else
        {
          _HKInitializeLogging();
          v40 = (void *)*MEMORY[0x24BDD2FF8];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
            continue;
          v13 = v40;
          -[HDHealthRecordFindReferencesTask debugDescription](self, "debugDescription");
          v41 = v7;
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v74 = v42;
          v75 = 2114;
          v76 = v11;
          _os_log_error_impl(&dword_224DAC000, v13, OS_LOG_TYPE_ERROR, "%{public}@ processContainedResources: cannot process resource: %{public}@", buf, 0x16u);

          v7 = v41;
          v8 = v46;
          v5 = v49;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
      v43 = 1;
      if (!v7)
        goto LABEL_41;
    }
  }
  v43 = 1;
LABEL_41:

  return v43;
}

- (BOOL)_canProcessResource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "FHIRVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "FHIRRelease");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDHealthRecordRuleset FHIRRelease](self->_ruleset, "FHIRRelease");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v5 == v6;

  return (char)self;
}

- (id)_filterResources:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "hk_filter:", &__block_literal_global_1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x24BDBD1A8];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  return v6;
}

uint64_t __53__HDHealthRecordFindReferencesTask__filterResources___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("OperationOutcome")) ^ 1;

  return v4;
}

- (BOOL)_isIrretrievableReference:(id)a3 serverBaseURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (v7
    && +[HDFHIRReferenceProcessor referenceIsAbsolute:](HDFHIRReferenceProcessor, "referenceIsAbsolute:", v6))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v6);
    v9 = v8 == 0;
    if (!v8)
    {
      _HKInitializeLogging();
      v10 = (void *)*MEMORY[0x24BDD2FF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
        -[HDHealthRecordFindReferencesTask _isIrretrievableReference:serverBaseURL:].cold.1(v10, self);
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_resourceReference:(id)a3 containedInResource:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  id v11;

  v11 = 0;
  +[HDFHIRReferenceProcessor resourceContainedInResource:reference:error:](HDFHIRReferenceProcessor, "resourceContainedInResource:reference:error:", a4, a3, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  v7 = v6;
  if (v5)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (!v8)
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      -[HDHealthRecordFindReferencesTask _resourceReference:containedInResource:].cold.1(v9, self);
  }

  return v5 != 0;
}

- (id)_resourceReference:(id)a3 presentInResources:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  v8 = (id)v7;
  if (v7)
  {
    v9 = *(_QWORD *)v17;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)MEMORY[0x22768E8BC](v7);
        objc_msgSend(v11, "identifier", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = +[HDFHIRReferenceProcessor reference:matchesIdentifier:](HDFHIRReferenceProcessor, "reference:matchesIdentifier:", v5, v13);

        if (v14)
        {
          v8 = v11;
          objc_autoreleasePoolPop(v12);
          goto LABEL_11;
        }
        objc_autoreleasePoolPop(v12);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v8 = (id)v7;
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)_resourceForReference:(id)a3 containedInResource:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v7 = a3;
  v8 = a4;
  +[HDFHIRReferenceProcessor resourceContainedInResource:reference:error:](HDFHIRReferenceProcessor, "resourceContainedInResource:reference:error:", v8, v7, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    && +[HDFHIRReferenceProcessor referenceRequiresContaining:](HDFHIRReferenceProcessor, "referenceRequiresContaining:", v7))
  {
    objc_msgSend(v9, "JSONObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    +[HDFHIRReferenceProcessor identifierForResource:containedInResource:error:](HDFHIRReferenceProcessor, "identifierForResource:containedInResource:error:", v9, v8, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v12, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("id"));

      v15 = (void *)MEMORY[0x24BE48978];
      objc_msgSend(v9, "FHIRVersion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "receivedDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "resourceObjectWithJSONObject:serverBaseURL:FHIRVersion:receivedDate:error:", v11, 0, v16, v17, a5);
      v18 = objc_claimAutoreleasedReturnValue();

      v9 = v11;
    }
    else
    {
      v18 = 0;
      v13 = v11;
    }

    v9 = (void *)v18;
  }

  return v9;
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = objc_opt_class();
  -[HDHealthRecordRuleset FHIRRelease](self->_ruleset, "FHIRRelease");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ [%@]>"), v4, v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleset, 0);
}

- (void)processResourcesForReferenceExtractionRequest:(uint64_t)a1 error:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  uint8_t *v4;
  NSObject *v5;
  void *v6;

  v5 = OUTLINED_FUNCTION_1_0(a1, a2);
  objc_msgSend(v3, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138543362;
  *v2 = v6;
  _os_log_error_impl(&dword_224DAC000, v5, OS_LOG_TYPE_ERROR, "%{public}@: can only process one Bundle per call, but received multiple; dropping",
    v4,
    0xCu);

  OUTLINED_FUNCTION_2();
}

- (void)_processedContainReferencesResourceWithResource:(uint64_t)a1 processingContext:(void *)a2 rule:allResources:.cold.1(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  uint8_t *v4;
  NSObject *v5;
  void *v6;

  v5 = OUTLINED_FUNCTION_1_0(a1, a2);
  objc_msgSend(v3, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138543362;
  *v2 = v6;
  _os_log_debug_impl(&dword_224DAC000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ containReferences: already contained", v4, 0xCu);

  OUTLINED_FUNCTION_2();
}

- (void)_isIrretrievableReference:(void *)a1 serverBaseURL:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a1;
  objc_msgSend(a2, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_224DAC000, v5, v6, "%{public}@ irretrievable reference, not a valid URL: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)_resourceReference:(void *)a1 containedInResource:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_224DAC000, v5, v6, "%{public}@: error instantiating contained resource: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end
