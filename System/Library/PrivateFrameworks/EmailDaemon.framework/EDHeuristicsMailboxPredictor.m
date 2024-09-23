@implementation EDHeuristicsMailboxPredictor

- (EDHeuristicsMailboxPredictor)initWithUserProfileProvider:(id)a3 messagePersistence:(id)a4 mailboxPersistence:(id)a5
{
  id v8;
  EDHeuristicsMailboxPredictor *v9;
  EDHeuristicsMailboxPredictor *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  id v18;
  objc_super v19;
  _QWORD v20[4];
  _QWORD v21[4];
  _QWORD v22[4];
  _QWORD v23[8];
  _QWORD v24[10];

  v24[8] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v8 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EDHeuristicsMailboxPredictor;
  v9 = -[EDHeuristicsMailboxPredictor init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    -[EDHeuristicsMailboxPredictor setUserProfileProvider:](v9, "setUserProfileProvider:", v17);
    -[EDHeuristicsMailboxPredictor setMessagePersistence:](v10, "setMessagePersistence:", v18);
    -[EDHeuristicsMailboxPredictor setMailboxPersistence:](v10, "setMailboxPersistence:", v8);
    v11 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    -[EDHeuristicsMailboxPredictor setMailboxIDCache:](v10, "setMailboxIDCache:", v11);

    v12 = MEMORY[0x1E0C9AAB0];
    v23[0] = CFSTR("mode");
    v23[1] = CFSTR("ignoreUserAddresses");
    v24[0] = CFSTR("ordered");
    v24[1] = MEMORY[0x1E0C9AAB0];
    v23[2] = CFSTR("confusionThreshold");
    v23[3] = CFSTR("orderedThreshold");
    v24[2] = &unk_1E94E5790;
    v24[3] = &unk_1E94E57A0;
    v23[4] = CFSTR("order");
    v22[0] = CFSTR("conversationID");
    v22[1] = CFSTR("recipient");
    v22[2] = CFSTR("listID");
    v22[3] = CFSTR("sender");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[4] = v13;
    v24[5] = &unk_1E94E57A0;
    v23[5] = CFSTR("weightedThreshold");
    v23[6] = CFSTR("weights");
    v20[0] = CFSTR("conversationID");
    v20[1] = CFSTR("listID");
    v21[0] = &unk_1E94E4718;
    v21[1] = &unk_1E94E57B0;
    v20[2] = CFSTR("recipient");
    v20[3] = CFSTR("sender");
    v21[2] = &unk_1E94E57B0;
    v21[3] = &unk_1E94E57C0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[7] = CFSTR("limitToRecentMessages");
    v24[6] = v14;
    v24[7] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDHeuristicsMailboxPredictor setParameters:](v10, "setParameters:", v15);

  }
  return v10;
}

- (EDHeuristicsMailboxPredictor)initWithUserProfileProvider:(id)a3 messagePersistence:(id)a4 mailboxPersistence:(id)a5 parameters:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  EDHeuristicsMailboxPredictor *v14;
  EDHeuristicsMailboxPredictor *v15;
  void *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[EDHeuristicsMailboxPredictor initWithUserProfileProvider:messagePersistence:mailboxPersistence:](self, "initWithUserProfileProvider:messagePersistence:mailboxPersistence:", v10, v11, v12);
  v15 = v14;
  if (v14)
  {
    -[EDHeuristicsMailboxPredictor _mergeDefaultParameters:withParameters:](v14, "_mergeDefaultParameters:withParameters:", v14->_parameters, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDHeuristicsMailboxPredictor setParameters:](v15, "setParameters:", v16);

  }
  return v15;
}

- (id)_mergeDefaultParameters:(id)a3 withParameters:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  int v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  char v22;
  void *v23;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v9, "addEntriesFromDictionary:", v8);
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("confusionThreshold"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("confusionThreshold"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        goto LABEL_6;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDHeuristicsMailboxPredictor.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[mergedParams[kConfusionThresholdParameterKey] isKindOfClass:[NSNumber class]] || [mergedParams[kConfusionThresholdParameterKey] isKindOfClass:[NSNull class]]"));
    }

LABEL_6:
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("mode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", CFSTR("ordered"));

    if (v14)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("order"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v16 = objc_opt_isKindOfClass();

      if ((v16 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDHeuristicsMailboxPredictor.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[mergedParams[kOrderParameterKey] isKindOfClass:[NSArray class]]"));
LABEL_14:

      }
    }
    else
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("mode"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqual:", CFSTR("weighted"));

      if (!v20)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("mode"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDHeuristicsMailboxPredictor.m"), 126, CFSTR("Unknown mode: %@"), v23);

        goto LABEL_14;
      }
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("weights"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v22 = objc_opt_isKindOfClass();

      if ((v22 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDHeuristicsMailboxPredictor.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[mergedParams[kWeightsParameterKey] isKindOfClass:[NSDictionary class]]"));
        goto LABEL_14;
      }
    }
    v18 = (id)objc_msgSend(v9, "copy");

    goto LABEL_16;
  }
  v18 = v7;
LABEL_16:

  return v18;
}

- (id)predictMailboxIDsForMessages:(id)a3 limit:(unint64_t)a4
{
  _BOOL4 v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  NSObject *v39;
  void *v40;
  id v42;
  id obj;
  uint64_t v44;
  EDHeuristicsMailboxPredictor *v45;
  unint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t i;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  id v64;
  uint8_t v65[16];
  uint8_t v66[128];
  uint8_t buf[4];
  int v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v46 = a4;
  v6 = a4 > 1 || -[EDHeuristicsMailboxPredictor _modeParameterIs:](self, "_modeParameterIs:", CFSTR("weighted"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = self;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v42;
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
  if (v47)
  {
    v44 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v60 != v44)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v8, "persistentID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDHeuristicsMailboxPredictor _predictionsForMessage:limit:](v45, "_predictionsForMessage:limit:", v8, v46);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = objc_msgSend(v49, "count");
          objc_msgSend(v8, "subject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109634;
          v68 = v10;
          v69 = 2112;
          v70 = v48;
          v71 = 2112;
          v72 = v11;
          _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_INFO, "Got %u predictions for message persistentID=%@, subject=\"%@\", buf, 0x1Cu);

        }
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v12 = v49;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v56;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v56 != v14)
                objc_enumerationMutation(v12);
              v16 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
              objc_msgSend(v16, "object");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v6)
              {
                objc_msgSend(v7, "objectForKeyedSubscript:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (v18)
                {
                  objc_msgSend(v7, "objectForKeyedSubscript:", v17);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "measure");
                  v21 = v20;
                  objc_msgSend(v19, "measure");
                  objc_msgSend(v19, "setMeasure:", v21 + v22);
                }
                else
                {
                  v25 = (void *)MEMORY[0x1E0D1EEF8];
                  objc_msgSend(v16, "measure");
                  objc_msgSend(v25, "object:withMeasure:", v17);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, v17);
                }
              }
              else
              {
                objc_msgSend(v7, "objectForKeyedSubscript:", v17);
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                if (v23)
                {
                  objc_msgSend(v7, "objectForKeyedSubscript:", v17);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "measure");
                  objc_msgSend(v19, "setMeasure:", v24 + 1.0);
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0D1EEF8], "object:withMeasure:", v17, 1.0);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, v17);
                }
              }

            }
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
          }
          while (v13);
        }

      }
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
    }
    while (v47);
  }

  +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    -[EDHeuristicsMailboxPredictor predictMailboxIDsForMessages:limit:].cold.2(objc_msgSend(v7, "count"), v65, v26);

  v27 = (void *)MEMORY[0x1E0D1EEF8];
  if (v46 == 1)
  {
    objc_msgSend(v7, "allValues");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectEnumerator");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "max:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "object");
    v31 = (id)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      v64 = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    objc_msgSend(v7, "allValues");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "reverseSortedObjects:limit:", v33, v46);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v34, "count"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v31 = v34;
    v35 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v52;
      do
      {
        for (k = 0; k != v35; ++k)
        {
          if (*(_QWORD *)v52 != v36)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * k), "object");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v38);

        }
        v35 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
      }
      while (v35);
    }

  }
  +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v32, "firstObject");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDHeuristicsMailboxPredictor predictMailboxIDsForMessages:limit:].cold.1(v40, (uint64_t)buf, v39);
  }

  return v32;
}

- (BOOL)_modeParameterIs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[EDHeuristicsMailboxPredictor parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  return v7;
}

- (id)_predictionsForMessage:(id)a3 limit:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a3;
  if (a4 < 2)
  {
    if (-[EDHeuristicsMailboxPredictor _modeParameterIs:](self, "_modeParameterIs:", CFSTR("ordered")))
      -[EDHeuristicsMailboxPredictor _orderedModePredictionForMessage:](self, "_orderedModePredictionForMessage:", v6);
    else
      -[EDHeuristicsMailboxPredictor _weightedModePredictionsForMessage:](self, "_weightedModePredictionsForMessage:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EDHeuristicsMailboxPredictor _summedWeightedPredictionsForMessage:limit:](self, "_summedWeightedPredictionsForMessage:limit:", v6, a4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (id)_orderedModePredictionForMessage:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t i;
  double v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  __CFString *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  __int128 v35;
  id v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint8_t v41;
  char v42[15];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  void *v47;
  uint8_t buf[4];
  double v49;
  __int16 v50;
  double v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[EDHeuristicsMailboxPredictor _orderedModePredictionForMessage:].cold.2(v4, v5, v6);

  -[EDHeuristicsMailboxPredictor parameters](self, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("orderedThreshold"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[EDHeuristicsMailboxPredictor parameters](self, "parameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("order"));
  obj = (id)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
  if (v12)
  {
    v38 = *(_QWORD *)v44;
    v36 = (id)MEMORY[0x1E0C9AA60];
    *(_QWORD *)&v13 = 134218240;
    v35 = v13;
    while (2)
    {
      v39 = v12;
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v44 != v38)
          objc_enumerationMutation(obj);
        v15 = *(double *)(*((_QWORD *)&v43 + 1) + 8 * i);
        -[EDHeuristicsMailboxPredictor _countsForField:message:](self, "_countsForField:message:", *(_QWORD *)&v15, v40, v35);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[EDHeuristicsMailboxPredictor _topHitFromMailboxDictionary:message:](self, "_topHitFromMailboxDictionary:message:", v16, v40);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[__CFString count](v16, "count");
        v19 = CFSTR("{}");
        if (v18)
          v19 = v16;
        *(double *)&v20 = COERCE_DOUBLE(v19);
        +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v49 = v15;
          v50 = 2112;
          v51 = *(double *)&v20;
          _os_log_debug_impl(&dword_1D2F2C000, v21, OS_LOG_TYPE_DEBUG, "Raw counts for %@: %@", buf, 0x16u);
        }

        if (v17)
        {
          +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v17, "measure");
            v31 = v30;
            objc_msgSend(v17, "object");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v49 = v31;
            v50 = 2112;
            v51 = v15;
            v52 = 2112;
            v53 = v32;
            _os_log_debug_impl(&dword_1D2F2C000, v22, OS_LOG_TYPE_DEBUG, "Found %.0lf hit for **%@** in %@", buf, 0x20u);

          }
          objc_msgSend(v17, "object");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "mailbox");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "URL");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "absoluteString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v23, "isEqual:", v26);

          if (v27)
          {
            +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              -[EDHeuristicsMailboxPredictor _orderedModePredictionForMessage:].cold.1(&v41, v42, v28);
          }
          else
          {
            objc_msgSend(v17, "measure");
            if (v29 >= v10)
            {
              v47 = v17;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
              v36 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_27;
            }
            +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v17, "measure");
              *(_DWORD *)buf = v35;
              v49 = v33;
              v50 = 2048;
              v51 = v10;
              _os_log_debug_impl(&dword_1D2F2C000, v28, OS_LOG_TYPE_DEBUG, "Ignoring because count (%.0f) is under threshold (%.0f).", buf, 0x16u);
            }
          }

        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
      if (v12)
        continue;
      break;
    }
  }
  else
  {
    v36 = (id)MEMORY[0x1E0C9AA60];
  }
LABEL_27:

  return v36;
}

- (id)_summedWeightedPredictionsForMessage:(id)a3 limit:(unint64_t)a4
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  __CFString *v23;
  void *v24;
  double v25;
  double v26;
  NSObject *v27;
  double v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  uint64_t v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  id obj;
  uint64_t v54;
  uint64_t v55;
  id v56;
  __CFString *v57;
  uint64_t i;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73[128];
  uint8_t buf[4];
  uint64_t v75;
  __int16 v76;
  __CFString *v77;
  __int16 v78;
  double v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[EDHeuristicsMailboxPredictor _summedWeightedPredictionsForMessage:limit:].cold.1(v4, v5, v6);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  -[EDHeuristicsMailboxPredictor parameters](self, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("weights"));
  obj = (id)objc_claimAutoreleasedReturnValue();

  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
  if (v55)
  {
    v54 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v55; ++i)
      {
        if (*(_QWORD *)v70 != v54)
          objc_enumerationMutation(obj);
        v60 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
        -[EDHeuristicsMailboxPredictor parameters](self, "parameters");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("weights"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v60);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "doubleValue");
        v13 = v12;

        -[EDHeuristicsMailboxPredictor _countsForField:message:](self, "_countsForField:message:", v60, v56);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v15 = -[__CFString count](v14, "count");
        v16 = CFSTR("{}");
        if (v15)
          v16 = v14;
        v57 = v16;
        +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v75 = v60;
          v76 = 2112;
          v77 = v57;
          _os_log_debug_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEBUG, "Raw counts for %@:\n%@", buf, 0x16u);
        }

        -[EDHeuristicsMailboxPredictor _removeSpecialMailboxesInCounts:message:](self, "_removeSpecialMailboxesInCounts:message:", v14, v56);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v66;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v66 != v21)
                objc_enumerationMutation(v19);
              v23 = *(__CFString **)(*((_QWORD *)&v65 + 1) + 8 * j);
              objc_msgSend(v19, "objectForKeyedSubscript:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "doubleValue");
              v26 = v25;

              +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = v13 * v26;
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                v75 = v60;
                v76 = 2112;
                v77 = v23;
                v78 = 2048;
                v79 = v28;
                _os_log_debug_impl(&dword_1D2F2C000, v27, OS_LOG_TYPE_DEBUG, "Found field=%@ in mailbox=%@: weightedHits=%.1lf", buf, 0x20u);
              }

              objc_msgSend(v7, "objectForKeyedSubscript:", v23);
              v29 = objc_claimAutoreleasedReturnValue();
              v30 = (void *)v29;
              if (v29)
                v31 = (void *)v29;
              else
                v31 = &unk_1E94E4730;
              v32 = v31;

              v33 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v32, "doubleValue");
              objc_msgSend(v33, "numberWithDouble:", v28 + v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v7, "setObject:forKeyedSubscript:", v35, v23);
            }
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
          }
          while (v20);
        }

      }
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
    }
    while (v55);
  }

  -[EDHeuristicsMailboxPredictor parameters](self, "parameters");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("weightedThreshold"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "doubleValue");
  v39 = v38;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v41 = v7;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
  if (v42)
  {
    v43 = *(_QWORD *)v62;
    do
    {
      for (k = 0; k != v42; ++k)
      {
        if (*(_QWORD *)v62 != v43)
          objc_enumerationMutation(v41);
        v45 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * k);
        objc_msgSend(v41, "objectForKeyedSubscript:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "doubleValue");
        if (v47 > v39)
        {
          v48 = (void *)MEMORY[0x1E0D1EEF8];
          objc_msgSend(v46, "doubleValue");
          objc_msgSend(v48, "object:withMeasure:", v45);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v49);

        }
      }
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
    }
    while (v42);
  }

  if (objc_msgSend(v40, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D1EEF8], "reverseSortedObjects:limit:", v40, a4);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v50 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v50;
}

- (id)_weightedModePredictionsForMessage:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t i;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  __CFString *v21;
  uint64_t v22;
  __CFString *v23;
  __CFString *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  NSObject *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  NSObject *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  NSObject *v44;
  void *v45;
  double v46;
  void *v47;
  BOOL v48;
  void *v49;
  __int128 v51;
  NSObject *v52;
  id obj;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint8_t v57;
  char v58[15];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  NSObject *v63;
  uint8_t buf[4];
  double v65;
  __int16 v66;
  double v67;
  __int16 v68;
  double v69;
  __int16 v70;
  void *v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[EDHeuristicsMailboxPredictor _weightedModePredictionsForMessage:].cold.3(v4, v5, v6);

  -[EDHeuristicsMailboxPredictor parameters](self, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("weightedThreshold"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  -[EDHeuristicsMailboxPredictor parameters](self, "parameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("weights"));
  obj = (id)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
  if (!v12)
  {
    v52 = 0;
    goto LABEL_28;
  }
  v54 = *(_QWORD *)v60;
  v52 = 0;
  *(_QWORD *)&v13 = 134218240;
  v51 = v13;
  do
  {
    v55 = v12;
    for (i = 0; i != v55; ++i)
    {
      if (*(_QWORD *)v60 != v54)
        objc_enumerationMutation(obj);
      v15 = *(double *)(*((_QWORD *)&v59 + 1) + 8 * i);
      -[EDHeuristicsMailboxPredictor parameters](self, "parameters", v51);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("weights"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", *(_QWORD *)&v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v20 = v19;

      -[EDHeuristicsMailboxPredictor _countsForField:message:](self, "_countsForField:message:", *(_QWORD *)&v15, v56);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v22 = -[__CFString count](v21, "count");
      v23 = CFSTR("{}");
      if (v22)
        v23 = v21;
      *(double *)&v24 = COERCE_DOUBLE(v23);
      +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v65 = v15;
        v66 = 2112;
        v67 = *(double *)&v24;
        _os_log_debug_impl(&dword_1D2F2C000, v25, OS_LOG_TYPE_DEBUG, "Raw counts for %@:\n%@", buf, 0x16u);
      }

      -[EDHeuristicsMailboxPredictor _topHitFromMailboxDictionary:message:](self, "_topHitFromMailboxDictionary:message:", v21, v56);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
      {
        objc_msgSend(v26, "measure");
        v29 = v28;
        +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = v20 * v29;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v27, "measure");
          v42 = v41;
          objc_msgSend(v27, "object");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          v65 = v42;
          v66 = 2048;
          v67 = v31;
          v68 = 2112;
          v69 = v15;
          v70 = 2112;
          v71 = v43;
          _os_log_debug_impl(&dword_1D2F2C000, v30, OS_LOG_TYPE_DEBUG, "Found %.0lf (weighted=%.1lf) hits for **%@** in %@", buf, 0x2Au);

        }
        objc_msgSend(v27, "object");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "mailbox");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "URL");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "absoluteString");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v32, "isEqual:", v35);

        if (v36)
        {
          +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            -[EDHeuristicsMailboxPredictor _orderedModePredictionForMessage:].cold.1(&v57, v58, v37);
        }
        else if (v31 >= v10)
        {
          objc_msgSend(v27, "setMeasure:", v31);
          objc_msgSend(v27, "measure");
          v39 = v38;
          -[NSObject measure](v52, "measure");
          if (v39 <= v40)
            goto LABEL_24;
          v37 = v52;
          v52 = v27;
        }
        else
        {
          +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v51;
            v65 = v31;
            v66 = 2048;
            v67 = v10;
            _os_log_debug_impl(&dword_1D2F2C000, v37, OS_LOG_TYPE_DEBUG, "Ignoring because weighted (%.0f) is under threshold (%.0f).", buf, 0x16u);
          }
        }

      }
LABEL_24:

    }
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
  }
  while (v12);
LABEL_28:

  +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
  {
    -[NSObject object](v52, "object");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject measure](v52, "measure");
    -[EDHeuristicsMailboxPredictor _weightedModePredictionsForMessage:].cold.1(v45, buf, v44, v46);
  }

  if (!v52
    || (-[NSObject object](v52, "object"),
        v47 = (void *)objc_claimAutoreleasedReturnValue(),
        v48 = v47 == 0,
        v47,
        v48))
  {
    v49 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v63 = v52;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v49;
}

- (id)_countsForField:(id)a3 message:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("conversationID")))
  {
    -[EDHeuristicsMailboxPredictor _conversationIDCountsForMessage:](self, "_conversationIDCountsForMessage:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("sender")))
  {
    -[EDHeuristicsMailboxPredictor _senderCountsForMessage:](self, "_senderCountsForMessage:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("recipient")))
  {
    -[EDHeuristicsMailboxPredictor _recipientCountsForMessage:](self, "_recipientCountsForMessage:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("listID")))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDHeuristicsMailboxPredictor.m"), 326, CFSTR("Unknown field: %@"), v7);

      v10 = (void *)MEMORY[0x1E0C9AA70];
      goto LABEL_10;
    }
    -[EDHeuristicsMailboxPredictor _listIDCountsForMessage:](self, "_listIDCountsForMessage:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_10:

  return v10;
}

- (BOOL)_limitToRecents
{
  void *v2;
  void *v3;
  char v4;

  -[EDHeuristicsMailboxPredictor parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("limitToRecentMessages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)_adjustPredicateForRecent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[EDHeuristicsMailboxPredictor _limitToRecents](self, "_limitToRecents"))
  {
    v5 = (void *)MEMORY[0x1E0CB3518];
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", *MEMORY[0x1E0D1DD68]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB35D0];
    objc_msgSend(MEMORY[0x1E0C99D68], "ef_midnightNdaysAgo:", 400);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "expressionForConstantValue:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v6, v9, 0, 2, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3880];
    v15[0] = v4;
    v15[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ef_andCompoundPredicateWithSubpredicates:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = v4;
  }

  return v13;
}

- (id)_countsForPredicate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[EDHeuristicsMailboxPredictor _adjustPredicateForRecent:](self, "_adjustPredicateForRecent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0D1E2C0]);
  v7 = (void *)objc_msgSend(v6, "initWithTargetClass:predicate:sortDescriptors:", objc_opt_class(), v5, MEMORY[0x1E0C9AA60]);
  -[EDHeuristicsMailboxPredictor messagePersistence](self, "messagePersistence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "countOfMessagesMatchingQueryPerMailbox:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_conversationIDCountsForMessage:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = objc_msgSend(a3, "conversationID");
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesInConversation:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDHeuristicsMailboxPredictor _countsForPredicate:](self, "_countsForPredicate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v6;
}

- (id)_senderCountsForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(v4, "from");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ea_uncommentedAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "ea_isLegalEmailAddress"))
  {
    objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesWithSender:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDHeuristicsMailboxPredictor _countsForPredicate:](self, "_countsForPredicate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[EDHeuristicsMailboxPredictor _senderCountsForMessage:].cold.1((uint64_t)v7, v10, v11);

    v9 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v9;
}

- (id)_listIDCountsForMessage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "listIDHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[EDMessageListItemPredicates predicateForMessagesWithListIDHash:](EDMessageListItemPredicates, "predicateForMessagesWithListIDHash:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDHeuristicsMailboxPredictor _countsForPredicate:](self, "_countsForPredicate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v6;
}

- (id)_recipientCountsForMessage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[EDHeuristicsMailboxPredictor _allowedRecipientsForMessage:](self, "_allowedRecipientsForMessage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesWithRecipients:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDHeuristicsMailboxPredictor _countsForPredicate:](self, "_countsForPredicate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v7;
}

- (id)_userCreatedMailboxIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[EDHeuristicsMailboxPredictor mailboxIDCache](self, "mailboxIDCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("MFUserCreatedMailboxIDs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDHeuristicsMailboxPredictor mailboxPersistence](self, "mailboxPersistence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userCreatedMailboxObjectIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v22 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_INFO, "Found %u user mailboxes.", buf, 8u);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "url", (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "absoluteString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    -[EDHeuristicsMailboxPredictor mailboxIDCache](self, "mailboxIDCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v4, CFSTR("MFUserCreatedMailboxIDs"));

  }
  return v4;
}

- (id)_removeSpecialMailboxesInCounts:(id)a3 message:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  objc_msgSend(a4, "mailbox");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v21;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13);
        -[EDHeuristicsMailboxPredictor _userCreatedMailboxIDs](self, "_userCreatedMailboxIDs");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "containsObject:", v14);

        if ((v16 & 1) == 0 || v8 && objc_msgSend(v8, "isEqualToString:", v14))
          objc_msgSend(v9, "addObject:", v14);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v9, "count"))
  {
    +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[EDHeuristicsMailboxPredictor _removeSpecialMailboxesInCounts:message:].cold.1((uint64_t)v9, v17, v18);

    v19 = (id)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v19, "removeObjectsForKeys:", v9);
  }
  else
  {
    v19 = v10;
  }

  return v19;
}

- (id)_topHitFromMailboxDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D1EEF8], "object:withMeasure:", 0, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__EDHeuristicsMailboxPredictor__topHitFromMailboxDictionary___block_invoke;
  v7[3] = &unk_1E949C410;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __61__EDHeuristicsMailboxPredictor__topHitFromMailboxDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v5, "doubleValue");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "measure");
  if (v7 > v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "setMeasure:", v7);
    objc_msgSend(*(id *)(a1 + 32), "setObject:", v9);
  }

}

- (id)_topHitFromMailboxDictionary:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[EDHeuristicsMailboxPredictor parameters](self, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("confusionThreshold"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDHeuristicsMailboxPredictor _removeSpecialMailboxesInCounts:message:](self, "_removeSpecialMailboxesInCounts:message:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "doubleValue");
    -[EDHeuristicsMailboxPredictor _normalizedTermFrequencyTopHitFromDictionary:withThreshold:](self, "_normalizedTermFrequencyTopHitFromDictionary:withThreshold:", v10);
  }
  else
  {
    -[EDHeuristicsMailboxPredictor _topHitFromMailboxDictionary:](self, "_topHitFromMailboxDictionary:", v10);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_objectWithMeasure:(double)a3 timesHigherThanFollowUpInMeasures:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  v5 = a4;
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v7, "count") - 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "measure");
    v10 = v9;

    objc_msgSend(v7, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "measure");
    v13 = v12;

    if (v13 <= v10 * a3)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v7, "lastObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v6;
}

- (id)_normalizedTermFrequencyTopHitFromDictionary:(id)a3 withThreshold:(double)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  -[EDHeuristicsMailboxPredictor _topHitFromMailboxDictionary:](self, "_topHitFromMailboxDictionary:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "measure");
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v11 = v26;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "doubleValue");
          v18 = v17;

          objc_msgSend(MEMORY[0x1E0D1EEF8], "object:withMeasure:", v15, v18 / v9);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v19);

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v12);
    }

    -[EDHeuristicsMailboxPredictor _objectWithMeasure:timesHigherThanFollowUpInMeasures:](self, "_objectWithMeasure:timesHigherThanFollowUpInMeasures:", v10, a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "object");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      objc_msgSend(v21, "setMeasure:");

      v24 = v21;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)_isAllowedRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  if ((objc_msgSend(v4, "ea_isLegalEmailAddress") & 1) != 0)
  {
    -[EDHeuristicsMailboxPredictor parameters](self, "parameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ignoreUserAddresses"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if (v7)
    {
      -[EDHeuristicsMailboxPredictor userProfileProvider](self, "userProfileProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "allEmailAddresses");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(self) = objc_msgSend(v9, "containsObject:", v4) ^ 1;

    }
    else
    {
      LOBYTE(self) = 1;
    }
  }
  else
  {
    +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
    self = (EDHeuristicsMailboxPredictor *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_DEBUG))
      -[EDHeuristicsMailboxPredictor _isAllowedRecipient:].cold.1((uint64_t)v4, &self->super, v10);

    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (id)_allowedRecipientsForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v4, "to");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v9), "ea_uncommentedAddress");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lowercaseString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 && -[EDHeuristicsMailboxPredictor _isAllowedRecipient:](self, "_isAllowedRecipient:", v11))
          objc_msgSend(v5, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v4, "cc", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v15), "ea_uncommentedAddress");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lowercaseString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17 && -[EDHeuristicsMailboxPredictor _isAllowedRecipient:](self, "_isAllowedRecipient:", v17))
          objc_msgSend(v5, "addObject:", v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v5, "count"))
    v18 = v5;
  else
    v18 = 0;

  return v18;
}

- (EMUserProfileProvider)userProfileProvider
{
  return self->_userProfileProvider;
}

- (void)setUserProfileProvider:(id)a3
{
  objc_storeStrong((id *)&self->_userProfileProvider, a3);
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (void)setMessagePersistence:(id)a3
{
  objc_storeStrong((id *)&self->_messagePersistence, a3);
}

- (EDMailboxPersistence)mailboxPersistence
{
  return self->_mailboxPersistence;
}

- (void)setMailboxPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxPersistence, a3);
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (NSCache)mailboxIDCache
{
  return self->_mailboxIDCache;
}

- (void)setMailboxIDCache:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxIDCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxIDCache, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_mailboxPersistence, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_userProfileProvider, 0);
}

- (void)predictMailboxIDsForMessages:(NSObject *)a3 limit:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_3(&dword_1D2F2C000, a3, (uint64_t)a3, "Best mailbox: %@", (uint8_t *)a2);

}

- (void)predictMailboxIDsForMessages:(os_log_t)log limit:.cold.2(int a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a1;
  _os_log_debug_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_DEBUG, "Aggregated %u mailboxes.", buf, 8u);
}

- (void)_orderedModePredictionForMessage:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_5(&dword_1D2F2C000, a3, (uint64_t)a3, "Ignoring because it is the message's current mailbox.", a1);
}

- (void)_orderedModePredictionForMessage:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_5(&dword_1D2F2C000, a1, a3, "Using Ordered Mode.", v3);
  OUTLINED_FUNCTION_1();
}

- (void)_summedWeightedPredictionsForMessage:(uint64_t)a3 limit:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_5(&dword_1D2F2C000, a1, a3, "Using Summed Weighted Mode:", v3);
  OUTLINED_FUNCTION_1();
}

- (void)_weightedModePredictionsForMessage:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log, double a4)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(double *)(buf + 14) = a4;
  _os_log_debug_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_DEBUG, "Winner: %@ (weighted=%.1lf)", buf, 0x16u);

}

- (void)_weightedModePredictionsForMessage:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_5(&dword_1D2F2C000, a1, a3, "Using Weighted Mode:", v3);
  OUTLINED_FUNCTION_1();
}

- (void)_senderCountsForMessage:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_3(&dword_1D2F2C000, a2, a3, "Not a legal sender address: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)_removeSpecialMailboxesInCounts:(uint64_t)a3 message:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_3(&dword_1D2F2C000, a2, a3, "Ignoring mailboxes: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)_isAllowedRecipient:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_3(&dword_1D2F2C000, a2, a3, "Not a legal recipient address: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

@end
