@implementation _CDSocialInteractionAdvisor

- (_CDSocialInteractionAdvisor)initWithStore:(id)a3
{
  id v5;
  _CDSocialInteractionAdvisor *v6;
  _CDSocialInteractionAdvisor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CDSocialInteractionAdvisor;
  v6 = -[_CDSocialInteractionAdvisor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (id)keyForModelWithSettings:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "interactionPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)rankContacts:(id)a3 withSeedContacts:(id)a4 usingSettings:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _CDPSimpleModel *v23;
  _CDPInteractionStoreDataHarvester *v24;
  dispatch_semaphore_t v25;
  NSObject *v26;
  double v27;
  double v28;
  unsigned int *v29;
  _cdp_prediction_result *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _CDPSimpleModelParameterManager *v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  NSObject *v53;
  int v54;
  uint64_t v55;
  _QWORD v56[5];

  v56[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v55 = 0;
  v54 = 0;
  v49 = -[_CDPSimpleModelParameterManager initWithSettings:]([_CDPSimpleModelParameterManager alloc], "initWithSettings:", v10);
  -[_CDPSimpleModelParameterManager getLambda:w0:threshold:](v49, "getLambda:w0:threshold:", (char *)&v55 + 4, &v55, &v54);
  if (objc_msgSend(v10, "useFuture"))
    v11 = 4;
  else
    v11 = 0;
  objc_msgSend(v10, "interactionDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  LODWORD(v16) = HIDWORD(v55);
  v48 = v15;
  -[_CDSocialInteractionAdvisor recentPredicateForDate:lambda:lookAheadWeeks:](self, "recentPredicateForDate:lambda:lookAheadWeeks:", v15, v11, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  -[_CDSocialInteractionAdvisor inSeedPredicateForSeed:](self, "inSeedPredicateForSeed:", v9);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CB3528];
  v47 = (void *)v17;
  v56[0] = v17;
  objc_msgSend(v10, "interactionPredicate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v20;
  v56[2] = v18;
  v46 = (void *)v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "andPredicateWithSubpredicates:", v21);
  v22 = objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc_init(_CDPSimpleModel);
  -[_CDPSimpleModel setRequireOutgoingInteraction:](v23, "setRequireOutgoingInteraction:", objc_msgSend(v10, "requireOutgoingInteraction"));
  v24 = objc_alloc_init(_CDPInteractionStoreDataHarvester);
  -[_CDPInteractionStoreDataHarvester setStore:](v24, "setStore:", self->_store);
  v45 = (void *)v22;
  -[_CDPInteractionStoreDataHarvester setPredicate:](v24, "setPredicate:", v22);
  -[_CDPSimpleModel setHarvester:](v23, "setHarvester:", v24);
  v25 = dispatch_semaphore_create(0);
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __75___CDSocialInteractionAdvisor_rankContacts_withSeedContacts_usingSettings___block_invoke;
  v52[3] = &unk_1E26E3118;
  v26 = v25;
  v53 = v26;
  -[_CDPSimpleModel loadModel:](v23, "loadModel:", v52);
  v44 = v26;
  dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
  LODWORD(v27) = HIDWORD(v55);
  LODWORD(v28) = v55;
  -[_CDPSimpleModel setLambda:w0:](v23, "setLambda:w0:", v27, v28);
  objc_msgSend(v9, "valueForKey:", CFSTR("identifier"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[_CDPSimpleModel _newIdsForPeople:length:](v23, "_newIdsForPeople:length:");
  v51 = v9;
  v30 = -[_CDPSimpleModel _newPredictionResultWithSeed:seedLength:realSeedLength:maxTrainingEmailID:](v23, "_newPredictionResultWithSeed:seedLength:realSeedLength:maxTrainingEmailID:", v29, 0, objc_msgSend(v9, "count"), 0xFFFFFFFFLL);
  objc_msgSend(v8, "valueForKey:", CFSTR("identifier"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[_CDPSimpleModel _newIdsForPeople:length:](v23, "_newIdsForPeople:length:");
  v32 = malloc_type_calloc(0, 0x10uLL, 0x1000040451B5BE8uLL);
  v41 = (void *)v31;
  v50 = v10;
  free(v30);
  free(v29);
  qsort_b(v32, 0, 0x10uLL, &__block_literal_global_71);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v8, "count"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v35 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v34, "containsObject:", v37);

      if ((v38 & 1) == 0)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v35);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v39);

      }
      ++v35;
    }
    while (objc_msgSend(v8, "count") > v35);
  }
  free(v41);
  free(v32);

  return v33;
}

- (id)adviseInteractionsForDate:(id)a3 andSeedContacts:(id)a4 usingSettings:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  _CDPSimpleModel *v29;
  _CDPInteractionStoreDataHarvester *v30;
  dispatch_semaphore_t v31;
  NSObject *v32;
  double v33;
  double v34;
  unint64_t v35;
  unint64_t v36;
  float *p_var1;
  float v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  int v45;
  _CDAdvisedInteraction *v46;
  unint64_t v47;
  unsigned int *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _CDPSimpleModelParameterManager *v56;
  void *v57;
  _cdp_prediction_result *v58;
  void *v59;
  id v60;
  uint64_t v61;
  _QWORD v62[4];
  NSObject *v63;
  float v64;
  int v65;
  int v66;
  _QWORD v67[3];
  _QWORD v68[4];

  v68[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v66 = 0;
  v64 = 0.0;
  v65 = 0;
  v56 = -[_CDPSimpleModelParameterManager initWithSettings:]([_CDPSimpleModelParameterManager alloc], "initWithSettings:", v10);
  -[_CDPSimpleModelParameterManager getLambda:w0:threshold:](v56, "getLambda:w0:threshold:", &v66, &v65, &v64);
  if (objc_msgSend(v10, "useFuture"))
    v12 = 4;
  else
    v12 = 0;
  LODWORD(v11) = v66;
  v57 = v8;
  -[_CDSocialInteractionAdvisor recentPredicateForDate:lambda:lookAheadWeeks:](self, "recentPredicateForDate:lambda:lookAheadWeeks:", v8, v12, v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v59 = v9;
  -[_CDSocialInteractionAdvisor inSeedPredicateForSeed:](self, "inSeedPredicateForSeed:", v9);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "interactionPredicate");
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "callerBundleId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.mobilemail")))
  {

  }
  else
  {
    objc_msgSend(v10, "callerBundleId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.mail"));

    if (!v18)
      goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(direction == %@)"), &unk_1E272B110);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(v10, "interactionPredicate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v21;
  v68[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
  v22 = (void *)v15;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "andPredicateWithSubpredicates:", v23);
  v24 = objc_claimAutoreleasedReturnValue();

  v15 = v24;
LABEL_8:
  v25 = (void *)MEMORY[0x1E0CB3528];
  v54 = (void *)v14;
  v55 = (void *)v13;
  v67[0] = v13;
  v67[1] = v15;
  v53 = (void *)v15;
  v67[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "andPredicateWithSubpredicates:", v26);
  v27 = objc_claimAutoreleasedReturnValue();

  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    -[_CDSocialInteractionAdvisor adviseInteractionsForDate:andSeedContacts:usingSettings:].cold.1();

  v29 = objc_alloc_init(_CDPSimpleModel);
  -[_CDPSimpleModel setRequireOutgoingInteraction:](v29, "setRequireOutgoingInteraction:", objc_msgSend(v10, "requireOutgoingInteraction"));
  v30 = objc_alloc_init(_CDPInteractionStoreDataHarvester);
  -[_CDPInteractionStoreDataHarvester setStore:](v30, "setStore:", self->_store);
  v52 = (void *)v27;
  -[_CDPInteractionStoreDataHarvester setPredicate:](v30, "setPredicate:", v27);
  -[_CDPSimpleModel setHarvester:](v29, "setHarvester:", v30);
  v31 = dispatch_semaphore_create(0);
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __87___CDSocialInteractionAdvisor_adviseInteractionsForDate_andSeedContacts_usingSettings___block_invoke;
  v62[3] = &unk_1E26E3118;
  v32 = v31;
  v63 = v32;
  -[_CDPSimpleModel loadModel:](v29, "loadModel:", v62);
  v51 = v32;
  dispatch_semaphore_wait(v32, 0xFFFFFFFFFFFFFFFFLL);
  LODWORD(v33) = v66;
  LODWORD(v34) = v65;
  -[_CDPSimpleModel setLambda:w0:](v29, "setLambda:w0:", v33, v34);
  v61 = 0;
  objc_msgSend(v59, "valueForKey:", CFSTR("identifier"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[_CDPSimpleModel _newIdsForPeople:length:](v29, "_newIdsForPeople:length:", v50, &v61);
  v58 = -[_CDPSimpleModel _newPredictionResultWithSeed:seedLength:realSeedLength:maxTrainingEmailID:](v29, "_newPredictionResultWithSeed:seedLength:realSeedLength:maxTrainingEmailID:", v49, v61, objc_msgSend(v50, "count"), 0xFFFFFFFFLL);
  qsort_b(v58, -[_CDPSimpleModel nPeople](v29, "nPeople"), 0x10uLL, &__block_literal_global_110);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v60 = (id)objc_claimAutoreleasedReturnValue();
  if (-[_CDPSimpleModel nPeople](v29, "nPeople"))
  {
    v35 = 0;
    v36 = 0;
    p_var1 = &v58->var1;
    do
    {
      v38 = *p_var1;
      if (*p_var1 < v64)
        break;
      -[_CDPSimpleModel people](v29, "people");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectAtIndexedSubscript:", *((int *)p_var1 - 1));
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      -[_CDPInteractionStoreDataHarvester contactForIdentifier:](v30, "contactForIdentifier:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "contactPrefix");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "length");

      if (!v43
        || (objc_msgSend(v10, "contactPrefix"),
            v44 = (void *)objc_claimAutoreleasedReturnValue(),
            v45 = objc_msgSend(v41, "mayContainPrefix:", v44),
            v44,
            v45))
      {
        v46 = objc_alloc_init(_CDAdvisedInteraction);
        -[_CDAdvisedInteraction setScore:](v46, "setScore:", v38);
        -[_CDAdvisedInteraction setContact:](v46, "setContact:", v41);
        objc_msgSend(v60, "addObject:", v46);
        ++v36;
        v47 = objc_msgSend(v10, "resultLimit");

        if (v36 >= v47)
        {

          break;
        }
      }

      ++v35;
      p_var1 += 4;
    }
    while (-[_CDPSimpleModel nPeople](v29, "nPeople") > v35);
  }
  free(v58);
  free(v49);

  return v60;
}

- (void)tuneUsingSettings:(id)a3 heartBeatHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _CDPSimpleModel *v9;
  _CDPInteractionStoreDataHarvester *v10;
  dispatch_semaphore_t v11;
  uint64_t v12;
  NSObject *v13;
  _CDPModelTuning *v14;
  void *v15;
  void *v16;
  void *v17;
  CFAbsoluteTime Current;
  _CDPSimpleModelParameterManager *v19;
  id v20;
  _CDPSimpleModelParameterManager *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _CDPSimpleModelParameterManager *v25;
  id v26[3];
  id location;
  _QWORD v28[4];
  NSObject *v29;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "interactionPredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(_CDPSimpleModel);
  -[_CDPSimpleModel setRequireOutgoingInteraction:](v9, "setRequireOutgoingInteraction:", objc_msgSend(v6, "requireOutgoingInteraction"));
  v10 = objc_alloc_init(_CDPInteractionStoreDataHarvester);
  -[_CDPInteractionStoreDataHarvester setStore:](v10, "setStore:", self->_store);
  -[_CDPInteractionStoreDataHarvester setPredicate:](v10, "setPredicate:", v8);
  -[_CDPSimpleModel setHarvester:](v9, "setHarvester:", v10);
  v11 = dispatch_semaphore_create(0);
  v12 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __66___CDSocialInteractionAdvisor_tuneUsingSettings_heartBeatHandler___block_invoke;
  v28[3] = &unk_1E26E3118;
  v13 = v11;
  v29 = v13;
  -[_CDPSimpleModel loadModel:](v9, "loadModel:", v28);
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  v14 = objc_alloc_init(_CDPModelTuning);
  -[_CDPSimpleModel _testingIndices](v9, "_testingIndices");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDPModelTuning setTestIndices:](v14, "setTestIndices:", v15);

  +[_CDPModelTuning f2Score](_CDPModelTuning, "f2Score");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDPModelTuning setScorer:](v14, "setScorer:", v16);

  -[_CDPSimpleModel _testingIndices](v9, "_testingIndices");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDPModelTuning setTestIndices:](v14, "setTestIndices:", v17);

  -[_CDPModelTuning setModel:](v14, "setModel:", v9);
  Current = CFAbsoluteTimeGetCurrent();
  v19 = -[_CDPSimpleModelParameterManager initWithSettings:]([_CDPSimpleModelParameterManager alloc], "initWithSettings:", v6);
  objc_initWeak(&location, v14);
  -[_CDPSimpleModelParameterManager modelTunerWillResume:](v19, "modelTunerWillResume:", v14);
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __66___CDSocialInteractionAdvisor_tuneUsingSettings_heartBeatHandler___block_invoke_113;
  v23[3] = &unk_1E26E68F8;
  v20 = v7;
  v24 = v20;
  v21 = v19;
  v25 = v21;
  objc_copyWeak(v26, &location);
  v26[1] = *(id *)&Current;
  v26[2] = (id)0x402E000000000000;
  -[_CDPModelTuning setHeartBeat:](v14, "setHeartBeat:", v23);
  -[_CDPSimpleModelParameterManager lastTuningState](v21, "lastTuningState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDPModelTuning resumeTuningWithState:](v14, "resumeTuningWithState:", v22);

  -[_CDPSimpleModelParameterManager modelTunerWillStop:](v21, "modelTunerWillStop:", v14);
  objc_destroyWeak(v26);

  objc_destroyWeak(&location);
}

- (id)recentPredicateForDate:(id)a3 lambda:(float)a4 lookAheadWeeks:(int)a5
{
  double v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v6 = a4 * *(double *)"" * 86400.0;
  v7 = a3;
  objc_msgSend(v7, "dateByAddingTimeInterval:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", (double)a5 * 604800.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v12 = v11;
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  objc_msgSend(v10, "predicateWithFormat:", CFSTR("startDate >= CAST(%f, \"NSDate\") AND startDate <= CAST(%f, \"NSDate\")"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)inSeedPredicateForSeed:(id)a3
{
  void *v3;
  void *v4;
  id v5;
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
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDInteractionAdvisorSettings extractContactIdentifiers:](_CDInteractionAdvisorSettings, "extractContactIdentifiers:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("(sender.identifier IN %@)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDInteractionAdvisorSettings extractContactIdentifiers:](_CDInteractionAdvisorSettings, "extractContactIdentifiers:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("(ANY recipients.identifier IN %@)"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3528];
  v17[0] = v8;
  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "orPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (_CDInteractionStore)store
{
  return (_CDInteractionStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)adviseInteractionsForDate:andSeedContacts:usingSettings:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_18DDBE000, v0, OS_LOG_TYPE_DEBUG, "Final interaction predicate %@", v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

@end
