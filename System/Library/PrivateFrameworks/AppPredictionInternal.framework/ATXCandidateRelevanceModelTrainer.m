@implementation ATXCandidateRelevanceModelTrainer

- (ATXCandidateRelevanceModelTrainer)initWithConfig:(id)a3
{
  id v5;
  ATXCandidateRelevanceModelTrainer *v6;
  ATXCandidateRelevanceModelTrainer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCandidateRelevanceModelTrainer;
  v6 = -[ATXCandidateRelevanceModelTrainer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_config, a3);

  return v7;
}

- (void)generateAndSaveDatasetWithFilename:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  ATXCandidateRelevanceModelFeaturizationManager *v9;
  void *v10;
  ATXCandidateRelevanceModelFeaturizationManager *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  ATXCandidateRelevanceModelTrainer *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id obj;
  uint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[5];
  id v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ATXCandidateRelevanceModelConfig datasetGenerator](self->_config, "datasetGenerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v7 = MEMORY[0x1E0C809B0];
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __72__ATXCandidateRelevanceModelTrainer_generateAndSaveDatasetWithFilename___block_invoke;
  v57[3] = &unk_1E82E3E50;
  v57[4] = self;
  v8 = v6;
  v58 = v8;
  objc_msgSend(v5, "receiveDataPoint:completion:", v57, &__block_literal_global_112);
  v9 = [ATXCandidateRelevanceModelFeaturizationManager alloc];
  v38 = self;
  -[ATXCandidateRelevanceModelConfig featurizers](self->_config, "featurizers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ATXCandidateRelevanceModelFeaturizationManager initWithFeaturizers:](v9, "initWithFeaturizers:", v10);

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v4;
  objc_msgSend(v12, "stringByAppendingPathComponent:", v4);
  v13 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createFileAtPath:contents:attributes:", v13, 0, 0);

  v42 = (void *)v13;
  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_new();
  -[ATXCandidateRelevanceModelFeaturizationManager featureNames](v11, "featureNames");
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", CFSTR("Candidate"));
  objc_msgSend(v16, "addObject:", CFSTR("CandidateIdentifier"));
  objc_msgSend(v16, "addObject:", CFSTR("CandidateType"));
  objc_msgSend(v16, "addObject:", CFSTR("SessionId"));
  objc_msgSend(v16, "addObject:", CFSTR("Engaged"));
  v40 = (void *)v17;
  objc_msgSend(v16, "addObjectsFromArray:", v17);
  v50 = v15;
  v41 = v16;
  objc_msgSend(v15, "writeCommaSeparatedValues:", v16);
  v55[0] = v7;
  v55[1] = 3221225472;
  v55[2] = __72__ATXCandidateRelevanceModelTrainer_generateAndSaveDatasetWithFilename___block_invoke_3;
  v55[3] = &unk_1E82E3E98;
  v46 = (id)objc_opt_new();
  v56 = v46;
  v47 = v5;
  objc_msgSend(v5, "receiveDatasetSession:completion:", v55, &__block_literal_global_31_2);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v8;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v48)
  {
    v45 = *(_QWORD *)v52;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v52 != v45)
          objc_enumerationMutation(obj);
        v49 = v18;
        v19 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v18);
        objc_msgSend((id)objc_opt_class(), "candidateDataPointsForSessions:candidate:", v46, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXCandidateRelevanceModelFeaturizationManager sparseFeatureMatrixFromDataPoints:](v11, "sparseFeatureMatrixFromDataPoints:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "labelsFromDataPoints:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "numberOfRows");
        if (v23 != objc_msgSend(v22, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, v38, CFSTR("ATXCandidateRelevanceModelTrainer.m"), 102, CFSTR("Feature matrix does not match the size of labels."));

        }
        if (objc_msgSend(v21, "numberOfRows"))
        {
          v24 = 0;
          do
          {
            v25 = (void *)objc_opt_new();
            objc_msgSend(v19, "description");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v26);

            objc_msgSend(v19, "identifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v27);

            objc_msgSend(v19, "type");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v28);

            objc_msgSend(v20, "objectAtIndexedSubscript:", v24);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "contextDefinedSessionId");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "UUIDString");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v31);

            objc_msgSend(v22, "objectAtIndexedSubscript:", v24);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "stringValue");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v33);

            if (objc_msgSend(v21, "numberOfColumns"))
            {
              v34 = 0;
              do
              {
                objc_msgSend(v21, "valueAtRow:column:", v24, v34);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "stringValue");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "addObject:", v36);

                ++v34;
              }
              while (objc_msgSend(v21, "numberOfColumns") > v34);
            }
            objc_msgSend(v50, "writeCommaSeparatedValues:", v25);

            ++v24;
          }
          while (objc_msgSend(v21, "numberOfRows") > v24);
        }

        v18 = v49 + 1;
      }
      while (v49 + 1 != v48);
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v48);
  }

  objc_msgSend(v50, "closeFile");
}

void __72__ATXCandidateRelevanceModelTrainer_generateAndSaveDatasetWithFilename___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "featurizers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_msgSend(v3, "context");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "candidate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "observeContext:candidate:", v10, v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = *(void **)(a1 + 40);
  objc_msgSend(v3, "candidate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

}

uint64_t __72__ATXCandidateRelevanceModelTrainer_generateAndSaveDatasetWithFilename___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)trainWithXPCActivity:(id)a3 disregardDatasetMetadataRequirements:(BOOL)a4
{
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  NSObject *v36;
  objc_class *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  id v44;
  void *v45;
  unint64_t v46;
  int v47;
  unint64_t v48;
  void *v49;
  uint64_t v50;
  ATXCandidateRelevanceModelFeaturizationManager *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  NSObject *v58;
  objc_class *v59;
  void *v60;
  NSObject *v61;
  objc_class *v62;
  void *v63;
  objc_class *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  NSObject *v68;
  objc_class *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  NSObject *v75;
  objc_class *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  objc_class *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  NSObject *v85;
  objc_class *v86;
  void *v87;
  void *v88;
  ATXCandidateRelevanceModelDataStoreTrainingResult *v89;
  void *v90;
  void *v91;
  void *v92;
  ATXCandidateRelevanceModelDataStoreTrainingResult *v93;
  void *v94;
  objc_class *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  id v109;
  NSObject *v110;
  id obj;
  uint64_t v112;
  void *v113;
  ATXCandidateRelevanceModelTrainer *v114;
  uint64_t v115;
  uint64_t v116;
  void *v118;
  uint64_t v119;
  void *v120;
  _QWORD v121[4];
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _QWORD v127[4];
  NSObject *v128;
  ATXCandidateRelevanceModelTrainer *v129;
  BOOL v130;
  _QWORD v131[4];
  NSObject *v132;
  _QWORD v133[5];
  id v134;
  id v135;
  uint8_t v136[128];
  uint8_t buf[4];
  void *v138;
  __int16 v139;
  void *v140;
  __int16 v141;
  void *v142;
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[ATXCandidateRelevanceModelConfig isEnabled](self->_config, "isEnabled"))
  {
    +[ATXCandidateRelevanceModelGlobals sharedInstance](ATXCandidateRelevanceModelGlobals, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isPipelineEnabled");

    if ((v7 & 1) != 0)
    {
      __atxlog_handle_relevance_model();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXCandidateRelevanceModelConfig clientModel](self->_config, "clientModel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "clientModelId");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v138 = v10;
        v139 = 2112;
        v140 = v12;
        _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "%@ - Beginning model training for config with client model name: %@.", buf, 0x16u);

      }
      -[ATXCandidateRelevanceModelConfig datastore](self->_config, "datastore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXCandidateRelevanceModelConfig clientModel](self->_config, "clientModel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "clientModelId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dateByAddingTimeInterval:", -86400.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cachedCandidatesForModelId:earliestDate:", v15, v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v19 = v18;
      -[NSObject candidates](v18, "candidates");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject featurizationManager](v18, "featurizationManager");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXCandidateRelevanceModelConfig datasetGenerator](self->_config, "datasetGenerator");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = v21;
      v114 = self;
      if (v18)
      {
        __atxlog_handle_relevance_model();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v24 = v20;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v138 = v25;
          _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEFAULT, "%@ - Using cached candidates since a deferral must have occurred.", buf, 0xCu);

          v20 = v24;
        }

      }
      else
      {
        v30 = v20;
        v31 = (void *)objc_opt_new();
        v32 = (void *)objc_opt_new();
        v33 = MEMORY[0x1E0C809B0];
        v133[0] = MEMORY[0x1E0C809B0];
        v133[1] = 3221225472;
        v133[2] = __95__ATXCandidateRelevanceModelTrainer_trainWithXPCActivity_disregardDatasetMetadataRequirements___block_invoke;
        v133[3] = &unk_1E82E3EE0;
        v133[4] = self;
        v34 = v32;
        v134 = v34;
        v35 = v31;
        v135 = v35;
        objc_msgSend(v21, "receiveDataPoint:completion:", v133, &__block_literal_global_42);
        objc_msgSend(v34, "currentMetadata");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        __atxlog_handle_relevance_model();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXCandidateRelevanceModelConfig clientModel](self->_config, "clientModel");
          v39 = v5;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "clientModelId");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v138 = v38;
          v139 = 2112;
          v140 = v41;
          v141 = 2112;
          v142 = v118;
          _os_log_impl(&dword_1C9A3B000, v36, OS_LOG_TYPE_DEFAULT, "%@ - Overall dataset metadata for config with client model name %@:\n%@", buf, 0x20u);

          v5 = v39;
          self = v114;

        }
        if (a4
          || -[ATXCandidateRelevanceModelConfig shouldTrainModelWithOverallDatasetMetadata:](self->_config, "shouldTrainModelWithOverallDatasetMetadata:", v118))
        {
          objc_msgSend(v35, "allKeys");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v131[0] = v33;
          v131[1] = 3221225472;
          v131[2] = __95__ATXCandidateRelevanceModelTrainer_trainWithXPCActivity_disregardDatasetMetadataRequirements___block_invoke_43;
          v131[3] = &unk_1E82E3F28;
          v43 = v35;
          v132 = v43;
          objc_msgSend(v42, "sortedArrayUsingComparator:", v131);
          v44 = v5;
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          v46 = objc_msgSend(v45, "count");
          v47 = -[ATXCandidateRelevanceModelConfig maximumNumberOfTrainedCandidates](v114->_config, "maximumNumberOfTrainedCandidates");
          if (v46 >= v47)
            v48 = v47;
          else
            v48 = v46;
          objc_msgSend(v45, "subarrayWithRange:", 0, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          v127[0] = v33;
          v127[1] = 3221225472;
          v127[2] = __95__ATXCandidateRelevanceModelTrainer_trainWithXPCActivity_disregardDatasetMetadataRequirements___block_invoke_2_45;
          v127[3] = &unk_1E82E3F50;
          v128 = v43;
          v129 = v114;
          v130 = a4;
          objc_msgSend(v49, "_pas_filteredArrayWithTest:", v127);
          v50 = objc_claimAutoreleasedReturnValue();

          v51 = [ATXCandidateRelevanceModelFeaturizationManager alloc];
          -[ATXCandidateRelevanceModelConfig featurizers](v114->_config, "featurizers");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = -[ATXCandidateRelevanceModelFeaturizationManager initWithFeaturizers:](v51, "initWithFeaturizers:", v52);

          -[ATXCandidateRelevanceModelConfig datastore](v114->_config, "datastore");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXCandidateRelevanceModelConfig clientModel](v114->_config, "clientModel");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "clientModelId");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)v50;
          objc_msgSend(v54, "cacheSelectedCandidates:featurizationManager:modelId:", v50, v53, v56);

          v57 = 1;
          v58 = v132;
          v120 = (void *)v53;
          v5 = v44;
          self = v114;
        }
        else
        {
          __atxlog_handle_relevance_model();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            v59 = (objc_class *)objc_opt_class();
            NSStringFromClass(v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v138 = v60;
            _os_log_impl(&dword_1C9A3B000, v58, OS_LOG_TYPE_DEFAULT, "%@ - Config specifies we shouldn't begin training yet given the overall dataset metadata. Skipping model training for all candidates.", buf, 0xCu);

          }
          v57 = 0;
        }

        v19 = 0;
        v21 = v113;
        v20 = v30;
        if ((v57 & 1) == 0)
          goto LABEL_56;
      }
      if (v20 && v120)
      {
        if (!objc_msgSend(v5, "didDefer"))
        {
          v109 = v5;
          v112 = objc_opt_new();
          v123 = 0u;
          v124 = 0u;
          v125 = 0u;
          v126 = 0u;
          obj = v20;
          v116 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v136, 16);
          v110 = v19;
          v108 = v20;
          if (v116)
          {
            v119 = 0;
            v115 = *(_QWORD *)v124;
            do
            {
              v65 = 0;
              do
              {
                if (*(_QWORD *)v124 != v115)
                  objc_enumerationMutation(obj);
                v66 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v65);
                v67 = (void *)MEMORY[0x1CAA48B6C]();
                __atxlog_handle_relevance_model();
                v68 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                {
                  v69 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v69);
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "identifier");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v138 = v70;
                  v139 = 2112;
                  v140 = v71;
                  _os_log_impl(&dword_1C9A3B000, v68, OS_LOG_TYPE_DEFAULT, "%@ - Setting up dataset for candidate with identifier: %@", buf, 0x16u);

                }
                v72 = (void *)objc_opt_new();
                v121[0] = MEMORY[0x1E0C809B0];
                v121[1] = 3221225472;
                v121[2] = __95__ATXCandidateRelevanceModelTrainer_trainWithXPCActivity_disregardDatasetMetadataRequirements___block_invoke_48;
                v121[3] = &unk_1E82E3F78;
                v73 = v72;
                v122 = v73;
                objc_msgSend(v21, "receiveCandidateDataPoint:completion:candidate:", v121, &__block_literal_global_50_0, v66);
                +[ATXCandidateRelevanceModelDataStoreDatasetMetadata datasetMetadataForDataPoints:](ATXCandidateRelevanceModelDataStoreDatasetMetadata, "datasetMetadataForDataPoints:", v73);
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                __atxlog_handle_relevance_model();
                v75 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
                {
                  v76 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v76);
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "identifier");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v138 = v77;
                  v139 = 2112;
                  v140 = v78;
                  v141 = 2112;
                  v142 = v74;
                  _os_log_impl(&dword_1C9A3B000, v75, OS_LOG_TYPE_DEFAULT, "%@ - Candidate dataset metadata for candidate identifier %@:\n%@", buf, 0x20u);

                }
                if (a4
                  || -[ATXCandidateRelevanceModelConfig shouldTrainModelWithCandidateDatasetMetadata:](self->_config, "shouldTrainModelWithCandidateDatasetMetadata:", v74))
                {
                  __atxlog_handle_relevance_model();
                  v79 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                  {
                    v80 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v80);
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v66, "identifier");
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v138 = v81;
                    v139 = 2112;
                    v140 = v82;
                    _os_log_impl(&dword_1C9A3B000, v79, OS_LOG_TYPE_DEFAULT, "%@ - Training model for candidate with identifier: %@", buf, 0x16u);

                  }
                  -[ATXCandidateRelevanceModelConfig modelTrainingPlan](self->_config, "modelTrainingPlan");
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v83, "trainModelForDataPoints:candidate:featurizationManager:", v73, v66, v120);
                  v84 = objc_claimAutoreleasedReturnValue();

                  __atxlog_handle_relevance_model();
                  v85 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
                  {
                    v86 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v86);
                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v66, "identifier");
                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v138 = v87;
                    v139 = 2112;
                    v140 = v88;
                    _os_log_impl(&dword_1C9A3B000, v85, OS_LOG_TYPE_DEFAULT, "%@ - Writing model to datastore for candidate with identifier: %@", buf, 0x16u);

                  }
                  v89 = [ATXCandidateRelevanceModelDataStoreTrainingResult alloc];
                  -[ATXCandidateRelevanceModelConfig clientModel](self->_config, "clientModel");
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v90, "clientModelId");
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99D68], "now");
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(v107) = 0;
                  v93 = -[ATXCandidateRelevanceModelDataStoreTrainingResult initWithModel:candidate:featurizationManager:modelUUID:datasetMetadata:clientModelName:trainDate:isVerified:](v89, "initWithModel:candidate:featurizationManager:modelUUID:datasetMetadata:clientModelName:trainDate:isVerified:", v84, v66, v120, v112, v74, v91, v92, v107);

                  self = v114;
                  -[ATXCandidateRelevanceModelConfig datastore](v114->_config, "datastore");
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v94, "writeTrainingResult:", v93);

                  ++v119;
                  v21 = v113;
                }
                else
                {
                  __atxlog_handle_relevance_model();
                  v84 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                  {
                    v95 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v95);
                    v96 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v66, "identifier");
                    v97 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v138 = v96;
                    v139 = 2112;
                    v140 = v97;
                    _os_log_impl(&dword_1C9A3B000, v84, OS_LOG_TYPE_DEFAULT, "%@ - Config specifies we shouldn't train a model given the candidate dataset metadata. Skipping model training for candidate with identifier: %@", buf, 0x16u);

                  }
                }

                objc_autoreleasePoolPop(v67);
                ++v65;
              }
              while (v116 != v65);
              v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v136, 16);
              v116 = v98;
            }
            while (v98);
          }
          else
          {
            v119 = 0;
          }

          -[ATXCandidateRelevanceModelConfig datastore](self->_config, "datastore");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXCandidateRelevanceModelConfig clientModel](self->_config, "clientModel");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "clientModelId");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v112;
          objc_msgSend(v99, "writeVerificationStatusForModelUUID:clientModelName:expectedNumberOfModels:", v112, v101, v119);

          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1209600.0);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXCandidateRelevanceModelConfig datastore](self->_config, "datastore");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXCandidateRelevanceModelConfig clientModel](self->_config, "clientModel");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "clientModelId");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "deleteCachedCandidatesForModelId:", v105);

          v21 = v113;
          -[ATXCandidateRelevanceModelConfig datastore](self->_config, "datastore");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "deleteTrainedModelsWithTrainDateOlderThanDate:", v102);

          v5 = v109;
          v19 = v110;
          v20 = v108;
          goto LABEL_55;
        }
        __atxlog_handle_relevance_model();
        v61 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
LABEL_55:

LABEL_56:
          goto LABEL_57;
        }
        v62 = (objc_class *)objc_opt_class();
        NSStringFromClass(v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v138 = v63;
        _os_log_impl(&dword_1C9A3B000, v61, OS_LOG_TYPE_DEFAULT, "%@ - Stopping model training early due to deferral.", buf, 0xCu);
      }
      else
      {
        __atxlog_handle_relevance_model();
        v61 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
          goto LABEL_55;
        v64 = (objc_class *)objc_opt_class();
        NSStringFromClass(v64);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v138 = v63;
        v139 = 2112;
        v140 = v20;
        v141 = 2112;
        v142 = v120;
        _os_log_fault_impl(&dword_1C9A3B000, v61, OS_LOG_TYPE_FAULT, "%@ - Programmer error: Either the candidates list (%@) or featurizationManager is nil (%@).", buf, 0x20u);
      }

      goto LABEL_55;
    }
  }
  __atxlog_handle_relevance_model();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXCandidateRelevanceModelConfig clientModel](self->_config, "clientModel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "clientModelId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v138 = v27;
    v139 = 2112;
    v140 = v29;
    _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_DEFAULT, "%@ - Config with client model name %@ is not enabled or the pipeline is disabled. Skipping training.", buf, 0x16u);

  }
LABEL_57:

}

void __95__ATXCandidateRelevanceModelTrainer_trainWithXPCActivity_disregardDatasetMetadataRequirements___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "featurizers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        objc_msgSend(v3, "context");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "candidate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "observeContext:candidate:", v10, v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 40), "observeDataPoint:", v3);
  v12 = *(void **)(a1 + 48);
  objc_msgSend(v3, "candidate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = (void *)objc_opt_new();
    v16 = *(void **)(a1 + 48);
    objc_msgSend(v3, "candidate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

  }
  v18 = *(void **)(a1 + 48);
  objc_msgSend(v3, "candidate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "observeDataPoint:", v3);

}

uint64_t __95__ATXCandidateRelevanceModelTrainer_trainWithXPCActivity_disregardDatasetMetadataRequirements___block_invoke_43(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "currentMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "compare:", v8);
  return v11;
}

uint64_t __95__ATXCandidateRelevanceModelTrainer_trainWithXPCActivity_disregardDatasetMetadataRequirements___block_invoke_2_45(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_relevance_model();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "%@ - Candidate dataset metadata (positive only) for candidate identifier %@:\n%@", (uint8_t *)&v16, 0x20u);

  }
  if (*(_BYTE *)(a1 + 48)
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "shouldTrainModelWithPositiveCandidateDatasetMetadata:", v5) & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    __atxlog_handle_relevance_model();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "%@ - Config specifies we shouldn't train a model given the candidate dataset metadata (positive only). Skipping model training for candidate with identifier: %@", (uint8_t *)&v16, 0x16u);

    }
    v10 = 0;
  }

  return v10;
}

uint64_t __95__ATXCandidateRelevanceModelTrainer_trainWithXPCActivity_disregardDatasetMetadataRequirements___block_invoke_48(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
}

@end
