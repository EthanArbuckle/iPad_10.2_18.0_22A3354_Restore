@implementation SGQuickResponsesInference

- (SGQuickResponsesInference)initWithModel:(id)a3 ranking:(id)a4 personalization:(id)a5 rng:(id)a6 store:(id)a7
{
  id v11;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  SGQuickResponsesInference *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  SGQuickResponsesInference *v30;
  SGQuickResponsesInference *v31;
  SGQuickResponsesStore *v32;
  SGQuickResponsesStore *store;
  void *v35;
  void *v36;
  SEL v37;
  id v38;
  id obj;
  id v40;
  objc_super v41;

  v11 = a3;
  v14 = a3;
  obj = a4;
  v15 = a4;
  v40 = a5;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
LABEL_13:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesInference.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ranking"));

    if (v16)
      goto LABEL_6;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesInference.m"), 192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("model"));

  if (!v15)
    goto LABEL_13;
LABEL_3:
  if (v16)
    goto LABEL_6;
LABEL_4:
  objc_msgSend(v14, "config");
  v37 = a2;
  v19 = v18;
  v20 = v11;
  v21 = v14;
  v22 = self;
  v23 = v17;
  v24 = v16;
  v25 = v15;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "predictionParams");
  v38 = a6;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isPersonalizationDisabled");

  a6 = v38;
  v15 = v25;
  v16 = v24;
  v17 = v23;
  self = v22;
  v14 = v21;
  v11 = v20;
  v18 = v19;
  if ((v28 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", v37, self, CFSTR("SGQuickResponsesInference.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personalization != nil || model.config.predictionParams.isPersonalizationDisabled"));

    a6 = v38;
  }
LABEL_6:
  v41.receiver = self;
  v41.super_class = (Class)SGQuickResponsesInference;
  v30 = -[SGQuickResponsesInference init](&v41, sel_init);
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_model, v11);
    objc_storeStrong((id *)&v31->_ranking, obj);
    objc_storeStrong((id *)&v31->_personalization, v40);
    objc_storeStrong((id *)&v31->_rng, a6);
    if (v18)
    {
      v32 = (SGQuickResponsesStore *)v18;
    }
    else
    {
      +[SGQuickResponsesStore sharedInstance](SGQuickResponsesStore, "sharedInstance");
      v32 = (SGQuickResponsesStore *)objc_claimAutoreleasedReturnValue();
    }
    store = v31->_store;
    v31->_store = v32;

  }
  return v31;
}

- (SGQuickResponsesInference)initWithLanguage:(id)a3 chunkPath:(id)a4 plistPath:(id)a5 espressoBinFilePath:(id)a6 vocabFilePath:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  SGQuickResponsesInference *v28;
  void *v29;
  id v31;
  id v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  +[SGQuickResponsesConfig modelTypeAndSubModelKeyForLanguage:plistPath:vocabPath:warmupBlock:](SGQuickResponsesConfig, "modelTypeAndSubModelKeyForLanguage:plistPath:vocabPath:warmupBlock:", v12, v14, v16, &__block_literal_global_384);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = v13;
    objc_msgSend(v17, "first");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("quickResponsesEspressoClassifierMultiLabel"));

    if (v20)
    {
      v21 = v15;

      v18 = v21;
    }
    +[SGQuickResponsesModel modelForLanguage:mode:chunkPath:plistPath:vocabPath:modelTypeAndSubModelKey:](SGQuickResponsesClassificationModel, "modelForLanguage:mode:chunkPath:plistPath:vocabPath:modelTypeAndSubModelKey:", v12, 1, v18, v14, v16, v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v31 = v15;
      v32 = v13;
      objc_msgSend(v22, "config");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "predictionParams");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isPersonalizationDisabled");

      v27 = (void *)objc_opt_new();
      if (v26)
      {
        self = -[SGQuickResponsesInference initWithModel:ranking:personalization:rng:store:](self, "initWithModel:ranking:personalization:rng:store:", v23, v27, 0, 0, 0);
      }
      else
      {
        v29 = (void *)objc_opt_new();
        self = -[SGQuickResponsesInference initWithModel:ranking:personalization:rng:store:](self, "initWithModel:ranking:personalization:rng:store:", v23, v27, v29, 0, 0);

      }
      v13 = v32;

      v28 = self;
      v15 = v31;
    }
    else
    {
      v28 = 0;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (SGQuickResponsesInference)initWithLanguage:(id)a3 plistPath:(id)a4 espressoBinFilePath:(id)a5 vocabFilePath:(id)a6 storeDirectory:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  SGQuickResponsesInference *v25;
  void *v26;
  void *v28;
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!objc_msgSend(v17, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesInference.m"), 250, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("storeDirectory.length"));

  }
  v18 = -[SGQuickResponsesStore initInDirectory:inMemory:withMigration:]([SGQuickResponsesStore alloc], "initInDirectory:inMemory:withMigration:", v17, 0, 1);
  if (v18)
  {
    +[SGQuickResponsesModel modelForLanguage:mode:chunkPath:plistPath:vocabPath:](SGQuickResponsesClassificationModel, "modelForLanguage:mode:chunkPath:plistPath:vocabPath:", v13, 1, v15, v14, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v29 = v13;
      objc_msgSend(v19, "config");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "predictionParams");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isPersonalizationDisabled");

      v24 = (void *)objc_opt_new();
      if (v23)
      {
        self = -[SGQuickResponsesInference initWithModel:ranking:personalization:rng:store:](self, "initWithModel:ranking:personalization:rng:store:", v20, v24, 0, 0, v18);
      }
      else
      {
        v26 = (void *)objc_opt_new();
        self = -[SGQuickResponsesInference initWithModel:ranking:personalization:rng:store:](self, "initWithModel:ranking:personalization:rng:store:", v20, v24, v26, 0, v18);

      }
      v25 = self;
      v13 = v29;
    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v17;
      _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "QuickResponses: Could not initialize SGQuickResponsesStore in directory - %@", buf, 0xCu);
    }
    v25 = 0;
  }

  return v25;
}

- (id)_getMergedPromptForMessage:(id)a3 conversationTurns:(id)a4
{
  SGQuickResponsesModel *model;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  model = self->_model;
  v6 = a4;
  v7 = a3;
  -[SGQuickResponsesModel config](model, "config");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predictionParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "maxPromptLength");
  objc_msgSend(v9, "maxPromptWindowSeconds");
  v12 = v11;
  objc_msgSend(v9, "promptJoiningString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGConversationTracker getMergedPromptForMessage:conversationTurns:maxPromptLength:maxPromptWindowSeconds:promptJoiningString:](SGConversationTracker, "getMergedPromptForMessage:conversationTurns:maxPromptLength:maxPromptWindowSeconds:promptJoiningString:", v7, v6, v10, v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)signpostedQuickResponsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 conversationHistory:(id)a5 context:(id)a6 time:(id)a7 language:(id)a8 locale:(id)a9 recipients:(id)a10 useContactNames:(BOOL)a11 includeCustomResponses:(BOOL)a12 includeResponsesToRobots:(BOOL)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  os_signpost_id_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v33;
  uint8_t v36[16];
  uint8_t buf[16];

  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a3;
  sgLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = os_signpost_id_generate(v25);

  sgLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ABF4000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "QuickResponsesForMessage", " enableTelemetry=YES ", buf, 2u);
  }

  BYTE2(v33) = a13;
  BYTE1(v33) = a12;
  LOBYTE(v33) = 1;
  -[SGQuickResponsesInference quickResponsesForMessage:maximumResponses:conversationHistory:context:time:language:locale:recipients:useContactNames:includeCustomResponses:includeResponsesToRobots:](self, "quickResponsesForMessage:maximumResponses:conversationHistory:context:time:language:locale:recipients:useContactNames:includeCustomResponses:includeResponsesToRobots:", v24, a4, v23, v22, v21, v20, v19, v18, v33);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  sgLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)v36 = 0;
    _os_signpost_emit_with_name_impl(&dword_21ABF4000, v31, OS_SIGNPOST_INTERVAL_END, v26, "QuickResponsesForMessage", (const char *)&unk_21AC29AE5, v36, 2u);
  }

  return v29;
}

- (id)scoresAndIsConfidentForMessage:(id)a3 language:(id)a4 locale:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  int v36;
  double v37;
  unint64_t v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v49;
  void *v50;
  uint8_t buf[4];
  unint64_t v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SGQuickResponsesModel config](self->_model, "config");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGQuickResponsesModel config](self->_model, "config");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predictionParams");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "maxPromptLength");

  if (objc_msgSend(v8, "length") <= v14)
  {
    -[SGQuickResponsesModel config](self->_model, "config");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "language");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      +[SGLanguageDetection languageForLocaleIdentifier:](SGLanguageDetection, "languageForLocaleIdentifier:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    if (v18)
      v19 = v18;
    else
      v19 = v9;
    v20 = v19;

    if (v20 && (objc_msgSend(v17, "isEqualToString:", v20) & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v52 = (unint64_t)v10;
        v53 = 2112;
        v54 = v17;
        _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Cannot predict for locale %@ using model with language %@", buf, 0x16u);
      }
      v15 = 0;
    }
    else
    {
      v50 = v17;
      sgLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_signpost_id_generate(v21);

      sgLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21ABF4000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "QuickResponsesForMessageFeaturization", " enableTelemetry=YES ", buf, 2u);
      }

      -[SGQuickResponsesModel featuresOf:](self->_model, "featuresOf:", v8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      sgLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21ABF4000, v27, OS_SIGNPOST_INTERVAL_END, v22, "QuickResponsesForMessageFeaturization", (const char *)&unk_21AC29AE5, buf, 2u);
      }

      if (v25)
      {
        sgLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = os_signpost_id_generate(v28);

        sgLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21ABF4000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "QuickResponsesForMessagePrediction", " enableTelemetry=YES ", buf, 2u);
        }

        -[SGQuickResponsesModel predict:](self->_model, "predict:", v25);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        sgLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21ABF4000, v34, OS_SIGNPOST_INTERVAL_END, v29, "QuickResponsesForMessagePrediction", (const char *)&unk_21AC29AE5, buf, 2u);
        }

        if (v32)
        {
          objc_msgSend(v11, "predictionParams");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "hasNegativeClass");

          if (v36)
          {
            v37 = 0.0;
            if ((unint64_t)objc_msgSend(v32, "count") >= 2)
            {
              v38 = 1;
              do
              {
                objc_msgSend(v32, "objectAtIndexedSubscript:", v38);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "doubleValue");
                v37 = v37 + v40;

                ++v38;
              }
              while (objc_msgSend(v32, "count") > v38);
            }
            objc_msgSend(v32, "subarrayWithRange:", 0, objc_msgSend(v32, "count") - 1);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = (void *)objc_msgSend(v41, "mutableCopy");

            objc_msgSend(v42, "setObject:atIndexedSubscript:", &unk_24DDCF738, 0);
            if ((unint64_t)objc_msgSend(v42, "count") >= 2)
            {
              v49 = v25;
              v43 = 1;
              do
              {
                v44 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v42, "objectAtIndexedSubscript:", v43);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "doubleValue");
                objc_msgSend(v44, "numberWithDouble:", v46 / v37);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "setObject:atIndexedSubscript:", v47, v43);

                ++v43;
              }
              while (objc_msgSend(v42, "count") > v43);
              v25 = v49;
            }
          }
          else
          {
            v42 = 0;
          }
          +[SGQuickResponsesScores quickResponsesScoresWithModelScores:normalizedModelScores:](SGQuickResponsesScores, "quickResponsesScoresWithModelScores:normalizedModelScores:", v32, v42);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v52 = (unint64_t)v9;
            _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could not predict score (prediction for language %@ not supported?)", buf, 0xCu);
          }
          v15 = 0;
        }
        v17 = v50;

      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v52 = (unint64_t)v9;
          _os_log_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Could not featurize (prediction for language %@ not supported?)", buf, 0xCu);
        }
        v15 = 0;
      }

    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v52 = v14;
      _os_log_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Returning nil because message length exceeds maximum length %ld)", buf, 0xCu);
    }
    v15 = 0;
  }

  return v15;
}

- (id)quickResponsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 conversationHistory:(id)a5 context:(id)a6 time:(id)a7 language:(id)a8 locale:(id)a9 recipients:(id)a10 useContactNames:(BOOL)a11 includeCustomResponses:(BOOL)a12 includeResponsesToRobots:(BOOL)a13
{
  id v19;
  id v20;
  void *v21;
  void *v22;
  SGQuickResponsesInference *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  os_signpost_id_t v29;
  NSObject *v30;
  NSObject *v31;
  unint64_t v32;
  void *v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  _BOOL4 v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  int v70;
  NSObject *v71;
  os_signpost_id_t v72;
  NSObject *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  NSObject *v91;
  void *v92;
  NSObject *v93;
  SGQuickResponse *v94;
  void *v95;
  double v96;
  double v97;
  void *v98;
  double v99;
  uint64_t v100;
  NSObject *v101;
  NSObject *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  int v108;
  uint64_t v109;
  unint64_t v110;
  unint64_t v111;
  NSObject *v112;
  NSObject *v113;
  void *v114;
  NSObject *v115;
  os_signpost_id_t v116;
  NSObject *v117;
  NSObject *v118;
  void *v119;
  int v120;
  id v121;
  void *v122;
  void *v123;
  uint64_t v124;
  NSObject *v125;
  NSObject *v126;
  void *v127;
  int v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v134;
  os_signpost_id_t spid;
  unint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  unint64_t v140;
  int v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  id *p_isa;
  void *v148;
  void *v149;
  NSObject *v150;
  void *context;
  id v153;
  id v154;
  id v155;
  id v156;
  void *v157;
  void *v158;
  id v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  _BYTE v164[128];
  uint64_t v165;
  uint8_t buf[4];
  unint64_t v167;
  __int16 v168;
  NSObject *v169;
  uint64_t v170;

  v170 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v156 = a5;
  v154 = a6;
  v153 = a7;
  v155 = a8;
  v20 = a9;
  v159 = a10;
  v21 = (void *)MEMORY[0x220753E80]();
  v158 = v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesInference.m"), 501, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message"));

    v34 = 0;
    v44 = v156;
    v33 = 0;
    v25 = v155;
    v45 = v159;
    goto LABEL_110;
  }
  -[SGQuickResponsesModel config](self->_model, "config");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  context = v21;
  v23 = self;
  if (v20)
  {
    +[SGLanguageDetection languageForLocaleIdentifier:](SGLanguageDetection, "languageForLocaleIdentifier:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
  v25 = v155;
  if (v24)
    v26 = v24;
  else
    v26 = v155;
  v27 = v26;

  sgLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = os_signpost_id_generate(v28);

  sgLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v30;
  v32 = v29 - 1;
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ABF4000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "QuickResponsesForMessageRobo", " enableTelemetry=YES ", buf, 2u);
  }

  if (!a13)
  {
LABEL_17:
    sgLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v32 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ABF4000, v39, OS_SIGNPOST_INTERVAL_END, v29, "QuickResponsesForMessageRobo", (const char *)&unk_21AC29AE5, buf, 2u);
    }

    objc_msgSend(v22, "language");
    v40 = objc_claimAutoreleasedReturnValue();
    v37 = v40;
    v33 = v158;
    if (v27 && (-[NSObject isEqualToString:](v40, "isEqualToString:", v27) & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v167 = (unint64_t)v20;
        v168 = 2112;
        v169 = v37;
        _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Cannot predict for locale %@ using model with language %@", buf, 0x16u);
      }
      v34 = 0;
      goto LABEL_38;
    }
    v150 = v37;
    -[SGQuickResponsesModel config](self->_model, "config");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "predictionParams");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "maxPromptLength");

    if (objc_msgSend(v158, "length") > v43)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v167 = v43;
        _os_log_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Returning nil because message length exceeds maximum length %ld)", buf, 0xCu);
      }
      v34 = 0;
      v44 = v156;
      v45 = v159;
      v37 = v150;
      goto LABEL_109;
    }
    v44 = v156;
    if (!v156)
    {
      +[SGConversationTracker instance](SGConversationTracker, "instance");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE285E0]), "initWithText:senderID:timestamp:", v158, v154, v153);
      objc_msgSend(v46, "addMessage:", v47);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[SGQuickResponsesInference _getMergedPromptForMessage:conversationTurns:](v23, "_getMergedPromptForMessage:conversationTurns:", v158, v44);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGQuickResponsesInference scoresAndIsConfidentForMessage:language:locale:](v23, "scoresAndIsConfidentForMessage:language:locale:");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v150;
    v144 = v48;
    if (!v48)
    {
      v45 = v159;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error obtaining scores for message.", buf, 2u);
      }
      v34 = 0;
      goto LABEL_108;
    }
    v49 = v48;
    p_isa = (id *)&v23->super.isa;
    v157 = v44;
    objc_msgSend(v48, "modelScores");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "normalizedModelScores");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = a4;
    if (!a4)
    {
      objc_msgSend(v22, "predictionParams");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v52, "defaultResponsesToReturn");

    }
    objc_msgSend(v22, "replies");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = v50;
    if (v51 >= objc_msgSend(v53, "maxDistinctReplies"))
    {
      objc_msgSend(v22, "replies");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v54, "maxDistinctReplies");

      v50 = v148;
    }

    objc_msgSend(v22, "predictionParams");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v55, "hasNegativeClass"))
    {
      objc_msgSend(v50, "objectAtIndexedSubscript:", 0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "doubleValue");
      v58 = v57;
      objc_msgSend(v22, "predictionParams");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "negativeClassMaximumToPredict");
      v61 = v58 >= v60;

      v37 = v150;
      v50 = v148;
    }
    else
    {
      v61 = 0;
    }
    v140 = v51;

    if (v145)
      v62 = v145;
    else
      v62 = v50;
    +[SGQuickResponsesScoring sortedWithUnweightedScores:config:](SGQuickResponsesScoring, "sortedWithUnweightedScores:config:", v62, v22);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "objectAtIndexedSubscript:", 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "value");
    v66 = v65;
    objc_msgSend(v22, "predictionParams");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "minToShowThreshold");
    v69 = v68;

    v70 = v66 < v69 || v61;
    v141 = v70;
    sgLogHandle();
    v71 = objc_claimAutoreleasedReturnValue();
    v72 = os_signpost_id_generate(v71);

    sgLogHandle();
    v73 = objc_claimAutoreleasedReturnValue();
    v74 = v73;
    v136 = v72 - 1;
    if (v72 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ABF4000, v74, OS_SIGNPOST_INTERVAL_BEGIN, v72, "QuickResponsesForMessageTriggers", " enableTelemetry=YES ", buf, 2u);
    }
    spid = v72;

    v75 = v63;
    objc_msgSend((id)objc_opt_class(), "dynamicIndicesAndTopIsDynamic:config:", v63, v22);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "predictionParams");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "dynamicLabelsEnabled");

    v33 = v158;
    v139 = v76;
    if (!v78)
      goto LABEL_67;
    objc_msgSend(v76, "second");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v79, "BOOLValue"))
    {
      objc_msgSend(v75, "objectAtIndexedSubscript:", 0);
      v142 = v79;
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "value");
      v82 = v81;
      objc_msgSend(v22, "predictionParams");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "minToShowThreshold");
      v85 = v84;

      if (v82 < v85)
      {
LABEL_67:
        objc_msgSend(v76, "first");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v138 = v104;
        if (objc_msgSend(v104, "count"))
        {
          v87 = v75;
          v105 = (void *)objc_msgSend(v75, "mutableCopy");
          objc_msgSend(v105, "removeObjectsAtIndexes:", v104);
          objc_msgSend(v22, "predictionParams");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "modelTypeName");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = objc_msgSend(v107, "isEqualToString:", CFSTR("quickResponsesEspressoClassifierMultiLabel"));

          if (v108)
          {
            objc_msgSend((id)objc_opt_class(), "normalizeLabelScores:", v105);
            v109 = objc_claimAutoreleasedReturnValue();

            v87 = (void *)v109;
          }
          v110 = v140;
          v111 = v136;

          v37 = v150;
        }
        else
        {
          v87 = v75;
          v110 = v140;
          v111 = v136;
        }
        sgLogHandle();
        v112 = objc_claimAutoreleasedReturnValue();
        v113 = v112;
        if (v111 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v112))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21ABF4000, v113, OS_SIGNPOST_INTERVAL_END, spid, "QuickResponsesForMessageTriggers", (const char *)&unk_21AC29AE5, buf, 2u);
        }

        objc_msgSend(p_isa[3], "resultsForModelScores:responseCount:config:", v87, v110, v22);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(p_isa, "replyPositionsFromSemanticClasses:config:");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(p_isa, "quickResponsesFromReplyPositions:isConfident:config:");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        if (v159 && objc_msgSend(v159, "count") == 1)
        {
          objc_msgSend(v159, "firstObject");
          v149 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v149 = 0;
        }
        sgLogHandle();
        v115 = objc_claimAutoreleasedReturnValue();
        v116 = os_signpost_id_generate(v115);

        sgLogHandle();
        v117 = objc_claimAutoreleasedReturnValue();
        v118 = v117;
        if (v116 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v117))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21ABF4000, v118, OS_SIGNPOST_INTERVAL_BEGIN, v116, "QuickResponsesForMessageCustom", " enableTelemetry=YES ", buf, 2u);
        }

        if (a12)
        {
          objc_msgSend(v22, "customResponsesParameters");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v120 = objc_msgSend(v119, "useNonNegativeClassesOnly");

          if (v120)
          {
            v121 = v145;

            v148 = v121;
          }
          v37 = v150;
          if (v114)
          {
            if (v148)
            {
              objc_msgSend(v22, "customResponsesParameters");
              v122 = (void *)objc_claimAutoreleasedReturnValue();

              if (v122)
              {
                objc_msgSend(v22, "customResponsesParameters");
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(p_isa, "addCustomResponsesToCommonResponses:language:locale:recipient:modelScores:maxResponses:customResponsesParams:", v114, v155, v20, v149, v148, v140, v123);
                v124 = objc_claimAutoreleasedReturnValue();

                v114 = (void *)v124;
                v25 = v155;
              }
            }
          }
        }
        sgLogHandle();
        v125 = objc_claimAutoreleasedReturnValue();
        v126 = v125;
        if (v116 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v125))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21ABF4000, v126, OS_SIGNPOST_INTERVAL_END, v116, "QuickResponsesForMessageCustom", (const char *)&unk_21AC29AE5, buf, 2u);
        }

        v33 = v158;
        if (objc_msgSend(v114, "count") == a4)
        {
          objc_msgSend(v22, "predictionParams");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          v128 = v141 & objc_msgSend(v127, "filterNonConfident");

          if (v128 == 1)
          {
            v162 = 0u;
            v163 = 0u;
            v160 = 0u;
            v161 = 0u;
            v34 = v114;
            v129 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v160, v164, 16);
            if (v129)
            {
              v130 = v129;
              v131 = *(_QWORD *)v161;
LABEL_96:
              v132 = 0;
              while (1)
              {
                if (*(_QWORD *)v161 != v131)
                  objc_enumerationMutation(v34);
                if ((objc_msgSend(*(id *)(*((_QWORD *)&v160 + 1) + 8 * v132), "isCustomResponse") & 1) != 0)
                  break;
                if (v130 == ++v132)
                {
                  v130 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v160, v164, 16);
                  if (v130)
                    goto LABEL_96;
                  goto LABEL_102;
                }
              }
            }
            else
            {
LABEL_102:

              v34 = 0;
            }
            v25 = v155;
            v37 = v150;
          }
          else
          {
            v34 = v114;
            v25 = v155;
          }
        }
        else
        {
          v34 = 0;
        }

        v44 = v157;
        goto LABEL_107;
      }
      v86 = (void *)objc_opt_class();
      v87 = v75;
      objc_msgSend(v75, "objectAtIndexedSubscript:", 0);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "dynamicLabelForScore:config:", v88, v22);
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      if (v79)
      {
        objc_msgSend((id)objc_opt_class(), "proactiveTriggerForDynamicLabel:context:language:useContactNames:", v79, v146, v155, a11);
        v89 = objc_claimAutoreleasedReturnValue();
        if (v89)
        {
          v90 = (void *)v89;
          v143 = v79;
          sgQuicktypeLogHandle();
          v91 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v87, "objectAtIndexedSubscript:", 0);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "value");
            *(_DWORD *)buf = 138412546;
            v167 = (unint64_t)v90;
            v168 = 2048;
            v169 = v93;
            _os_log_impl(&dword_21ABF4000, v91, OS_LOG_TYPE_DEFAULT, "QuickResponses - trigger: %@, score: %f", buf, 0x16u);

          }
          v94 = [SGQuickResponse alloc];
          objc_msgSend(v87, "objectAtIndexedSubscript:", 0);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "value");
          v97 = v96;
          objc_msgSend(v22, "predictionParams");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "minToShowThreshold");
          v138 = v90;
          v100 = -[SGQuickResponse initWithProactiveTrigger:isConfident:](v94, "initWithProactiveTrigger:isConfident:", v90, v97 >= v99);

          sgLogHandle();
          v101 = objc_claimAutoreleasedReturnValue();
          v102 = v101;
          if (v136 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v101))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_21ABF4000, v102, OS_SIGNPOST_INTERVAL_END, spid, "QuickResponsesForMessageTriggers", (const char *)&unk_21AC29AE5, buf, 2u);
          }

          v137 = (void *)v100;
          v165 = v100;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v165, 1);
          v34 = (id)objc_claimAutoreleasedReturnValue();
          v25 = v155;
          v44 = v157;
LABEL_107:
          v45 = v159;

LABEL_108:
          goto LABEL_109;
        }
      }
      v103 = v139;
    }
    else
    {
      v103 = v76;
    }

    v76 = v103;
    goto LABEL_67;
  }
  v33 = v158;
  +[SGQuickResponsesToRobots repliesToRobot:language:recipients:](SGQuickResponsesToRobots, "repliesToRobot:language:recipients:", v158, v27, v159);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v34, "count"))
  {

    goto LABEL_17;
  }
  sgLogHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v32 > 0xFFFFFFFFFFFFFFFDLL)
  {
    v44 = v156;
    v45 = v159;
    v37 = v35;
    goto LABEL_109;
  }
  v37 = v35;
  if (os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ABF4000, v36, OS_SIGNPOST_INTERVAL_END, v29, "QuickResponsesForMessageRobo", (const char *)&unk_21AC29AE5, buf, 2u);
  }
LABEL_38:
  v44 = v156;
  v45 = v159;
LABEL_109:

  v21 = context;
LABEL_110:
  objc_autoreleasePoolPop(v21);

  return v34;
}

- (id)replyPositionsFromSemanticClasses:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v32;
  void *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  SGQuickResponsesInference *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v33 = v7;
    v8 = (void *)objc_opt_new();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v32 = v6;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v44 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "unsignedIntegerValue") + 1;

          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", v16);
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v11);
    }

    v18 = (void *)objc_opt_new();
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __70__SGQuickResponsesInference_replyPositionsFromSemanticClasses_config___block_invoke;
    v39[3] = &unk_24DDC4338;
    v40 = v33;
    v41 = self;
    v19 = v18;
    v42 = v19;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v39);
    v20 = (void *)objc_opt_new();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v9;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v36 != v23)
            objc_enumerationMutation(obj);
          v25 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
          objc_msgSend(v19, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "unsignedIntegerValue");

          objc_msgSend(v26, "objectAtIndexedSubscript:", objc_msgSend(v26, "count") - v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v29);
          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", v28 - 1);
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v30, v25);

        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      }
      while (v22);
    }

    v6 = v32;
    v7 = v33;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)replyPositionsForSemanticClass:(unint64_t)a3 responseCount:(unint64_t)a4 config:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v38;
  id v39;
  unint64_t v40;
  uint64_t v41;

  v7 = a5;
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "replies");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v7, "replies");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((isKindOfClass & 1) != 0)
  {
    v39 = v7;
    objc_msgSend(v12, "semanticClassStyleGroups");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "styleGroupReplyTexts");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count") <= a4)
      a4 = objc_msgSend(v15, "count");
    objc_msgSend(v13, "semanticClassReplyTexts", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v19, "unsignedIntegerValue");

    if (a4)
    {
      v20 = 0;
      v40 = a4;
      do
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v21, "unsignedIntegerValue"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "firstObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v9;
        v25 = v8;
        v26 = v16;
        v27 = v15;
        v28 = objc_msgSend(v23, "unsignedIntegerValue");

        v29 = objc_alloc(MEMORY[0x24BDD16E0]);
        v30 = v28 - v41;
        v15 = v27;
        v16 = v26;
        v8 = v25;
        v9 = v24;
        v31 = (void *)objc_msgSend(v29, "initWithUnsignedInteger:", v30);
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7A648]), "initWithFirst:second:", v24, v31);
        objc_msgSend(v8, "addObject:", v32);

        ++v20;
      }
      while (v40 != v20);
    }

    v7 = v39;
  }
  else
  {
    if (objc_msgSend(v12, "replyCountForIndex:", a3) <= a4)
    {
      objc_msgSend(v7, "replies");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      a4 = objc_msgSend(v33, "replyCountForIndex:", a3);

    }
    if (a4)
    {
      v34 = 0;
      do
      {
        v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", v34);
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7A648]), "initWithFirst:second:", v9, v35);
        objc_msgSend(v8, "addObject:", v36);

        ++v34;
      }
      while (a4 != v34);
    }
  }

  return v8;
}

- (id)randomizedReplyPositionsForSemanticClass:(unint64_t)a3 responseCount:(unint64_t)a4 config:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  SGQuickResponsesInference *v37;
  id v38;
  id v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replies");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v8, "replies");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((isKindOfClass & 1) != 0)
  {
    v34 = v8;
    objc_msgSend(v13, "semanticClassStyleGroups");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", a3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "styleGroupReplyTexts");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "semanticClassReplyTexts");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedIntegerValue");

    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __91__SGQuickResponsesInference_randomizedReplyPositionsForSemanticClass_responseCount_config___block_invoke;
    v35[3] = &unk_24DDC4360;
    v21 = v16;
    v36 = v21;
    v37 = self;
    v40 = v20;
    v22 = v9;
    v38 = v22;
    v39 = v10;
    objc_msgSend(v33, "enumerateObjectsUsingBlock:", v35);
    +[SGRandomization shuffleMutableArray:withRng:](SGRandomization, "shuffleMutableArray:withRng:", v22, self->_rng);
    if (objc_msgSend(v22, "count") <= a4)
      a4 = objc_msgSend(v22, "count");
    objc_msgSend(v22, "subarrayWithRange:", 0, a4);
    v23 = (id)objc_claimAutoreleasedReturnValue();

    v8 = v34;
  }
  else
  {
    v24 = objc_msgSend(v13, "replyCountForIndex:", a3);

    if (v24 >= a4)
      v25 = a4;
    else
      v25 = v24;
    +[SGRandomization shuffledSamplingWithoutReplacementForK:fromN:withRng:](SGRandomization, "shuffledSamplingWithoutReplacementForK:fromN:withRng:", v25, v24, self->_rng);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v42 != v29)
            objc_enumerationMutation(v26);
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7A648]), "initWithFirst:second:", v10, *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
          objc_msgSend(v9, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v28);
    }
    v23 = v9;

  }
  return v23;
}

- (id)quickResponsesFromReplyPositions:(id)a3 isConfident:(BOOL)a4 config:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  SGQuickResponse *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  SGQuickResponse *v49;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  id obj;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "language");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (id)objc_opt_new();
    objc_msgSend(v9, "replies");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v52 = v9;
      objc_msgSend(v9, "replies");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "replyTextParent");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "styleGroupParent");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "semanticClassParent");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "models");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v12;
      objc_msgSend(v12, "replyTexts");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v53 = v7;
      obj = v7;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v65 != v15)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
            objc_msgSend(v17, "first");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "unsignedIntegerValue");

            objc_msgSend(v17, "second");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "unsignedIntegerValue");

            objc_msgSend(v61, "semanticClassReplyTexts");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectAtIndexedSubscript:", v19);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "firstObject");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "unsignedIntegerValue");

            v26 = v25 + v21;
            objc_msgSend(v60, "objectAtIndexedSubscript:", v25 + v21);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "unsignedIntegerValue");

            objc_msgSend(v59, "objectAtIndexedSubscript:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "unsignedIntegerValue");

            objc_msgSend(v58, "objectAtIndexedSubscript:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "unsignedIntegerValue");

            objc_msgSend(v57, "objectAtIndexedSubscript:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "category");

            objc_msgSend(v56, "objectAtIndexedSubscript:", v26);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            BYTE2(v51) = a4;
            LOWORD(v51) = 0;
            v36 = -[SGQuickResponse initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:]([SGQuickResponse alloc], "initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:", v35, v62, v26, v28, v30, v32, v34, v51);
            objc_msgSend(v63, "addObject:", v36);

          }
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
        }
        while (v14);
      }

      v9 = v52;
      v7 = v53;
    }
    else
    {
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v61 = v7;
      v37 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
      if (v37)
      {
        v38 = v37;
        v54 = v7;
        v39 = *(_QWORD *)v69;
        do
        {
          for (j = 0; j != v38; ++j)
          {
            if (*(_QWORD *)v69 != v39)
              objc_enumerationMutation(v61);
            v41 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
            objc_msgSend(v41, "first");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "unsignedIntegerValue");

            objc_msgSend(v41, "second");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "unsignedIntegerValue");

            objc_msgSend(v9, "replies");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "replyTextsForIndex:", v43);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "objectAtIndexedSubscript:", v45);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            BYTE2(v51) = a4;
            LOWORD(v51) = 0;
            v49 = -[SGQuickResponse initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:]([SGQuickResponse alloc], "initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:", v48, v62, -1, -1, v43, -1, -1, v51);
            objc_msgSend(v63, "addObject:", v49);

          }
          v38 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
        }
        while (v38);
        v7 = v54;
      }
    }

  }
  else
  {
    v63 = 0;
  }

  return v63;
}

- (id)addCustomResponsesToCommonResponses:(id)a3 language:(id)a4 locale:(id)a5 recipient:(id)a6 modelScores:(id)a7 maxResponses:(unint64_t)a8 customResponsesParams:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  SGQuickResponsesStore *store;
  double v26;
  float v27;
  double v28;
  float v29;
  double v30;
  float v31;
  uint64_t v32;
  char v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  SGQuickResponse *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  uint64_t v55;
  uint64_t v56;
  os_signpost_id_t spid;
  unint64_t v58;
  id v59;
  id v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[12];
  int ptr;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  if ((objc_msgSend(v20, "isCustomResponsesEnabled") & 1) != 0)
  {
    v61 = v15;
    sgSignpostHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    ptr = 7;
    v22 = os_signpost_id_make_with_pointer(v21, &ptr);

    sgSignpostHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v58 = v22 - 1;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ABF4000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "AddCustomResponses", "Start", buf, 2u);
    }
    spid = v22;

    store = self->_store;
    objc_msgSend(v20, "distanceThreshold");
    v27 = v26;
    objc_msgSend(v20, "countExponent");
    v29 = v28;
    objc_msgSend(v20, "minDecayedCountForPrediction");
    v31 = v30;
    v32 = objc_msgSend(v20, "compatibilityVersion");
    v33 = objc_msgSend(v20, "allowProfanity");
    objc_msgSend(v20, "minimumTimeIntervalSecs");
    v35 = v34;
    objc_msgSend(v20, "usageSpreadExponent");
    *(float *)&v37 = v36;
    LOBYTE(v55) = v33;
    v59 = v18;
    *(float *)&v36 = v27;
    *(float *)&v38 = v29;
    *(float *)&v39 = v31;
    v60 = v17;
    -[SGQuickResponsesStore nearestCustomResponsesToPromptEmbedding:recipient:limit:withinRadius:responseCountExponent:minimumDecayedCount:compatibilityVersion:language:locale:allowProfanity:minimumTimeInterval:usageSpreadExponent:](store, "nearestCustomResponsesToPromptEmbedding:recipient:limit:withinRadius:responseCountExponent:minimumDecayedCount:compatibilityVersion:language:locale:allowProfanity:minimumTimeInterval:usageSpreadExponent:", v19, v18, a8, v32, v16, v17, v36, v38, v39, v35, v37, v55);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_opt_new();
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v42 = v40;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v63 != v45)
            objc_enumerationMutation(v42);
          BYTE2(v56) = 1;
          LOWORD(v56) = 1;
          v47 = -[SGQuickResponse initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:]([SGQuickResponse alloc], "initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i), v16, -1, -1, -1, -1, -1, v56, spid);
          objc_msgSend(v41, "addObject:", v47);

        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
      }
      while (v44);
    }

    if (objc_msgSend(v41, "count"))
    {
      v15 = v61;
      if (objc_msgSend(v41, "count") < a8 && objc_msgSend(v61, "count"))
      {
        objc_msgSend(v61, "enumerateObjectsUsingBlock:", &__block_literal_global_127);
        objc_msgSend(v41, "arrayByAddingObjectsFromArray:", v61);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        +[SGDeduperML bucketerWithMapping:](SGDeduperML, "bucketerWithMapping:", &__block_literal_global_130);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        +[SGDeduperML dedupe:bucketer:resolver:](SGDeduperML, "dedupe:bucketer:resolver:", v48, v49, &__block_literal_global_132);
        v50 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v50 = (id)objc_msgSend(v41, "copy");
      }
      v18 = v59;
      if (objc_msgSend(v50, "count") > a8)
      {
        objc_msgSend(v50, "subarrayWithRange:", 0, a8);
        v51 = objc_claimAutoreleasedReturnValue();

        v50 = (id)v51;
      }
      v17 = v60;
      sgSignpostHandle();
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = v52;
      if (v58 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21ABF4000, v53, OS_SIGNPOST_INTERVAL_END, spid, "AddCustomResponses", "Completed", buf, 2u);
      }

    }
    else
    {
      v15 = v61;
      v50 = v61;
      v18 = v59;
      v17 = v60;
    }

  }
  else
  {
    v50 = v15;
  }

  return v50;
}

- (id)customResponsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 context:(id)a5 language:(id)a6 locale:(id)a7 recipients:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  SGQuickResponsesStore *store;
  double v34;
  float v35;
  double v36;
  float v37;
  double v38;
  float v39;
  uint64_t v40;
  char v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  void *v59;
  unint64_t v60;
  void *v61;
  id v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  void *v66;
  uint8_t buf[16];

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesInference.m"), 887, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message"));

  }
  -[SGQuickResponsesModel config](self->_model, "config");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v15
    && (objc_msgSend(v20, "customResponsesParameters"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v22,
        v22))
  {
    -[SGQuickResponsesInference scoresAndIsConfidentForMessage:language:locale:](self, "scoresAndIsConfidentForMessage:language:locale:", v15, v17, v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v58 = v17;
      v63 = v19;
      v60 = a4;
      objc_msgSend(v23, "modelScores");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "normalizedModelScores");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "customResponsesParameters");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "useNonNegativeClassesOnly");

      v59 = v26;
      if (v28)
      {
        v29 = v26;

        v25 = v29;
      }
      objc_msgSend(v21, "customResponsesParameters");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v58;
      v61 = v24;
      v62 = v16;
      if (v63 && objc_msgSend(v63, "count") == 1)
      {
        objc_msgSend(v63, "firstObject");
        v31 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = 0;
      }
      store = self->_store;
      objc_msgSend(v30, "distanceThreshold");
      v35 = v34;
      objc_msgSend(v30, "countExponent");
      v37 = v36;
      objc_msgSend(v30, "minDecayedCountForPrediction");
      v39 = v38;
      v40 = objc_msgSend(v30, "compatibilityVersion");
      v41 = objc_msgSend(v30, "allowProfanity");
      objc_msgSend(v30, "minimumTimeIntervalSecs");
      v43 = v42;
      objc_msgSend(v30, "usageSpreadExponent");
      *(float *)&v45 = v44;
      LOBYTE(v56) = v41;
      v57 = v25;
      *(float *)&v44 = v35;
      *(float *)&v46 = v37;
      *(float *)&v47 = v39;
      -[SGQuickResponsesStore nearestCustomResponsesAndScoresToPromptEmbedding:recipient:limit:withinRadius:responseCountExponent:minimumDecayedCount:compatibilityVersion:language:locale:allowProfanity:minimumTimeInterval:usageSpreadExponent:](store, "nearestCustomResponsesAndScoresToPromptEmbedding:recipient:limit:withinRadius:responseCountExponent:minimumDecayedCount:compatibilityVersion:language:locale:allowProfanity:minimumTimeInterval:usageSpreadExponent:", v25, v31, v60, v40, v58, v18, v44, v46, v47, v43, v45, v56);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (void *)objc_opt_new();
      v64[0] = MEMORY[0x24BDAC760];
      v64[1] = 3221225472;
      v64[2] = __107__SGQuickResponsesInference_customResponsesForMessage_maximumResponses_context_language_locale_recipients___block_invoke;
      v64[3] = &unk_24DDC4408;
      v50 = v49;
      v65 = v50;
      v66 = v30;
      v51 = v30;
      objc_msgSend(v48, "enumerateObjectsUsingBlock:", v64);
      v52 = (void *)v31;
      v53 = v66;
      v32 = v50;

      v24 = v61;
      v16 = v62;
      v19 = v63;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error obtaining scores for message.", buf, 2u);
      }
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rng, 0);
  objc_storeStrong((id *)&self->_personalization, 0);
  objc_storeStrong((id *)&self->_ranking, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

void __107__SGQuickResponsesInference_customResponsesForMessage_maximumResponses_context_language_locale_recipients___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  v14[0] = CFSTR("reply");
  v4 = a2;
  objc_msgSend(v4, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v14[1] = CFSTR("distance");
  objc_msgSend(v4, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  v14[2] = CFSTR("confident");
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "second");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "doubleValue");
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 40), "distanceThreshold");
  objc_msgSend(v7, "numberWithInt:", v10 < v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

}

id __138__SGQuickResponsesInference_addCustomResponsesToCommonResponses_language_locale_recipient_modelScores_maxResponses_customResponsesParams___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __138__SGQuickResponsesInference_addCustomResponsesToCommonResponses_language_locale_recipient_modelScores_maxResponses_customResponsesParams___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGQuickResponsesInference normalizeStringForDeduping:](SGQuickResponsesInference, "normalizeStringForDeduping:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __138__SGQuickResponsesInference_addCustomResponsesToCommonResponses_language_locale_recipient_modelScores_maxResponses_customResponsesParams___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsConfident:", 1);
}

void __91__SGQuickResponsesInference_randomizedReplyPositionsForSemanticClass_responseCount_config___block_invoke(uint64_t a1, void *a2)
{
  uint32_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(a2, "unsignedIntegerValue"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v11, "count");
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
  if (v4)
    v5 = objc_msgSend(v4, "next") % (unint64_t)v3;
  else
    v5 = arc4random_uniform(v3);
  objc_msgSend(v11, "objectAtIndexedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", v7 - *(_QWORD *)(a1 + 64));
  v9 = *(void **)(a1 + 48);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7A648]), "initWithFirst:second:", *(_QWORD *)(a1 + 56), v8);
  objc_msgSend(v9, "addObject:", v10);

}

void __70__SGQuickResponsesInference_replyPositionsFromSemanticClasses_config___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v5 = a3;
  v6 = a2;
  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  v8 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(*(id *)(a1 + 32), "predictionParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isPersonalizationDisabled");

  if (!v10)
  {
    v14 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "predictionParams");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isReplyTextRandomized");

  v14 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  if (!v12)
  {
LABEL_5:
    objc_msgSend(v13, "replyPositionsForSemanticClass:responseCount:config:", v7, v8, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v13, "randomizedReplyPositionsForSemanticClass:responseCount:config:", v7, v8, v14);
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v16 = (id)v15;
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v15, v6);

}

void __100__SGQuickResponsesInference_initWithLanguage_chunkPath_plistPath_espressoBinFilePath_vocabFilePath___block_invoke()
{
  +[SGQuickResponsesToRobots warmup](SGQuickResponsesToRobots, "warmup");
  +[SGQuickResponsesStore warmup](SGQuickResponsesStore, "warmup");
  SGPersonalizeEmojisWarmup();
}

+ (id)languageForLocale:(id)a3 withLanguageDetectionForMessage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "QuickResponses: No message was passed in.", buf, 2u);
    }
    goto LABEL_13;
  }
  if (!objc_msgSend(v6, "length"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "QuickResponses: Message length 0 passed in, ignoring.", v14, 2u);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!v5)
  {
    v8 = (void *)MEMORY[0x220753E80]();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v13 = 0;
      _os_log_debug_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "QuickResponses: No locale was passed in.", v13, 2u);
    }
    +[SGLanguageDetection detectLanguageFromText:](SGLanguageDetection, "detectLanguageFromText:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v5 = (id)v9;
      objc_autoreleasePoolPop(v8);
      goto LABEL_8;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v12 = 0;
      _os_log_debug_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "QuickResponses: No language was detected from the message.", v12, 2u);
    }
    objc_autoreleasePoolPop(v8);
LABEL_14:
    v10 = 0;
    goto LABEL_15;
  }
LABEL_8:
  +[SGLanguageDetection languageForLocaleIdentifier:](SGLanguageDetection, "languageForLocaleIdentifier:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v10;
}

+ (id)stringsForQuickResponses:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "text", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)quickResponsesForMessage:(id)a3 context:(id)a4 time:(id)a5 maxResponses:(unint64_t)a6 locale:(id)a7 recipientHandles:(id)a8 chunkPath:(id)a9 plistPath:(id)a10 espressoBinFilePath:(id)a11 vocabFilePath:(id)a12 includeCustomResponses:(BOOL)a13 includeResponsesToRobots:(BOOL)a14
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  SGQuickResponsesInference *v26;
  SGQuickResponsesInference *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  uint64_t v33;
  void *context;
  void *v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v37 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  context = (void *)MEMORY[0x220753E80]();
  _PASRepairString();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGQuickResponsesInference languageForLocale:withLanguageDetectionForMessage:](SGQuickResponsesInference, "languageForLocale:withLanguageDetectionForMessage:", v18, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v20;
  if (v25)
  {
    v26 = -[SGQuickResponsesInference initWithLanguage:chunkPath:plistPath:espressoBinFilePath:vocabFilePath:]([SGQuickResponsesInference alloc], "initWithLanguage:chunkPath:plistPath:espressoBinFilePath:vocabFilePath:", v25, v20, v21, v22, v23);
    v27 = v26;
    if (v26)
    {
      BYTE2(v33) = a14;
      BYTE1(v33) = a13;
      LOBYTE(v33) = 1;
      v28 = v19;
      v32 = v19;
      v29 = v17;
      -[SGQuickResponsesInference signpostedQuickResponsesForMessage:maximumResponses:conversationHistory:context:time:language:locale:recipients:useContactNames:includeCustomResponses:includeResponsesToRobots:](v26, "signpostedQuickResponsesForMessage:maximumResponses:conversationHistory:context:time:language:locale:recipients:useContactNames:includeCustomResponses:includeResponsesToRobots:", v24, a6, 0, v37, v17, v25, v18, v32, v33);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = v19;
      v29 = v17;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v25;
        _os_log_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Could not find inference model (an error occurred, or possibly prediction for language %@ not supported)", buf, 0xCu);
      }
      v30 = 0;
    }

  }
  else
  {
    v28 = v19;
    v29 = v17;
    v30 = 0;
  }

  objc_autoreleasePoolPop(context);
  return v30;
}

+ (id)quickResponsesForMessage:(id)a3 conversationTurns:(id)a4 maxResponses:(unint64_t)a5 localeIdentifier:(id)a6 recipientHandles:(id)a7 chunkPath:(id)a8 plistPath:(id)a9 espressoBinFilePath:(id)a10 vocabFilePath:(id)a11 useContactNames:(BOOL)a12 includeCustomResponses:(BOOL)a13 includeResponsesToRobots:(BOOL)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  SGQuickResponsesInference *v28;
  unint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  SGQuickResponsesInference *v35;
  void *v36;
  uint64_t v38;
  void *context;
  id v40;
  uint8_t buf[16];

  v19 = a3;
  v20 = a4;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  if (objc_msgSend(v23, "length") || objc_msgSend(v25, "length"))
  {
    v40 = v19;
    context = (void *)MEMORY[0x220753E80]();
    +[SGLanguageDetection languageForLocaleIdentifier:](SGLanguageDetection, "languageForLocaleIdentifier:", v21);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[SGQuickResponsesInference initWithLanguage:chunkPath:plistPath:espressoBinFilePath:vocabFilePath:]([SGQuickResponsesInference alloc], "initWithLanguage:chunkPath:plistPath:espressoBinFilePath:vocabFilePath:", v27, v23, v24, v25, v26);
    v29 = a5;
    v30 = v23;
    v31 = v26;
    v32 = v25;
    v33 = v24;
    v34 = v20;
    v35 = v28;
    BYTE2(v38) = a14;
    LOWORD(v38) = __PAIR16__(a13, a12);
    -[SGQuickResponsesInference signpostedQuickResponsesForMessage:maximumResponses:conversationHistory:context:time:language:locale:recipients:useContactNames:includeCustomResponses:includeResponsesToRobots:](v28, "signpostedQuickResponsesForMessage:maximumResponses:conversationHistory:context:time:language:locale:recipients:useContactNames:includeCustomResponses:includeResponsesToRobots:", v40, v29, v34, 0, 0, v27, v21, v22, v38);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v34;
    v24 = v33;
    v25 = v32;
    v26 = v31;
    v23 = v30;

    v19 = v40;
    objc_autoreleasePoolPop(context);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Required model file(s) not specified.", buf, 2u);
    }
    v36 = 0;
  }

  return v36;
}

+ (id)normalizeStringForDeduping:(id)a3
{
  return (id)objc_msgSend(a3, "lowercaseString");
}

+ (id)dynamicIndicesAndTopIsDynamic:(id)a3 config:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v5 = a3;
  v6 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__397;
  v32 = __Block_byref_object_dispose__398;
  v33 = 0;
  v33 = (id)objc_opt_new();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__397;
  v26 = __Block_byref_object_dispose__398;
  v27 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v6, "replies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "replies");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __66__SGQuickResponsesInference_dynamicIndicesAndTopIsDynamic_config___block_invoke_2;
    v13[3] = &unk_24DDC4458;
    v14 = v6;
    v10 = v9;
    v15 = v10;
    v16 = &v28;
    v17 = &v22;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v13);
    objc_msgSend(MEMORY[0x24BE7A648], "tupleWithFirst:second:", v29[5], v23[5]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __66__SGQuickResponsesInference_dynamicIndicesAndTopIsDynamic_config___block_invoke;
    v18[3] = &unk_24DDC4430;
    v19 = v6;
    v20 = &v28;
    v21 = &v22;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v18);
    objc_msgSend(MEMORY[0x24BE7A648], "tupleWithFirst:second:", v29[5], v23[5]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v19;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v11;
}

+ (id)normalizeLabelScores:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  double v6;
  void *v7;
  double v8;
  unint64_t v9;
  SGQuickResponsesClassScore *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  SGQuickResponsesClassScore *v15;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    v6 = 0.0;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "value");
      v6 = v6 + v8;

      ++v5;
    }
    while (v5 < objc_msgSend(v3, "count"));
  }
  else
  {
    v6 = 0.0;
  }
  if (objc_msgSend(v3, "count"))
  {
    v9 = 0;
    do
    {
      v10 = [SGQuickResponsesClassScore alloc];
      objc_msgSend(v3, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "value");
      v13 = v12 / v6;
      objc_msgSend(v3, "objectAtIndexedSubscript:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[SGQuickResponsesClassScore initWithValue:index:](v10, "initWithValue:index:", objc_msgSend(v14, "index"), v13);
      objc_msgSend(v4, "setObject:atIndexedSubscript:", v15, v9);

      ++v9;
    }
    while (v9 < objc_msgSend(v3, "count"));
  }

  return v4;
}

+ (id)proactiveTriggerForDynamicLabel:(id)a3 context:(id)a4 language:(id)a5
{
  return +[SGQuickResponsesInference proactiveTriggerForDynamicLabel:context:language:useContactNames:](SGQuickResponsesInference, "proactiveTriggerForDynamicLabel:context:language:useContactNames:", a3, a4, a5, 1);
}

+ (id)proactiveTriggerForDynamicLabel:(id)a3 context:(id)a4 language:(id)a5 useContactNames:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  __CFString *v39;
  uint8_t buf[16];
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (proactiveTriggerForDynamicLabel_context_language_useContactNames__onceToken != -1)
    dispatch_once(&proactiveTriggerForDynamicLabel_context_language_useContactNames__onceToken, &__block_literal_global_145);
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__397;
  v38 = __Block_byref_object_dispose__398;
  v39 = &stru_24DDC5810;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__397;
  v32 = __Block_byref_object_dispose__398;
  v33 = 0;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __94__SGQuickResponsesInference_proactiveTriggerForDynamicLabel_context_language_useContactNames___block_invoke_2;
  v22[3] = &unk_24DDC44A0;
  v25 = &v28;
  v26 = &v34;
  v27 = a6;
  v12 = v11;
  v23 = v12;
  v13 = v10;
  v24 = v13;
  v14 = (void (**)(_QWORD))MEMORY[0x22075400C](v22);
  objc_msgSend((id)proactiveTriggerForDynamicLabel_context_language_useContactNames__triggerForLabel, "objectForKeyedSubscript:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    sgQuicktypeLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v9;
      _os_log_fault_impl(&dword_21ABF4000, v20, OS_LOG_TYPE_FAULT, "SGQuickResponses: Could not find trigger for dynamic label %@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("thirdPartyPhoneUEhPTkUuM3AK")) & 1) == 0
    && (objc_msgSend(v9, "isEqualToString:", CFSTR("thirdPartyEmailRU1BSUwuMXAK")) & 1) == 0
    && !objc_msgSend(v9, "isEqualToString:", CFSTR("thirdPartyPostalUE9TVEFMLjFwCg")))
  {
    v18 = v15;
    goto LABEL_15;
  }
  v14[2](v14);
  v16 = (void *)v29[5];
  if (v16 == (void *)v35[5])
  {
    sgQuicktypeLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v9;
      _os_log_impl(&dword_21ABF4000, v20, OS_LOG_TYPE_DEFAULT, "SGQuickResponses: No name found for thirdparty dynamic label: %@", buf, 0xCu);
    }
LABEL_14:

    v18 = 0;
    goto LABEL_15;
  }
  v17 = v16;
  v18 = (id)objc_msgSend(v15, "mutableCopy");
  v41[0] = proactiveTriggerForDynamicLabel_context_language_useContactNames__givenNameQualifier;
  *(_QWORD *)buf = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v41, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v19, proactiveTriggerForDynamicLabel_context_language_useContactNames__qualifiersKey);

LABEL_15:
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v18;
}

+ (id)dynamicLabelForScore:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  void *v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "replies");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "replies");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predictionParams");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isPerCategory");

    if (v13)
    {
      objc_msgSend(v11, "categorySemanticClasses");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v7, "index"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "count") != 1)
      {
        sgQuicktypeLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134218240;
          v31 = objc_msgSend(v7, "index");
          v32 = 2048;
          v33 = objc_msgSend(v15, "count");
          v27 = "SGQuickResponses: dynamic label (score index %tu) should have one semantic class (count - %tu)!";
          goto LABEL_17;
        }
LABEL_14:

        v21 = 0;
        goto LABEL_15;
      }
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedIntegerValue");

    }
    else
    {
      v17 = objc_msgSend(v7, "index");
    }
    objc_msgSend(v11, "semanticClassReplyTexts");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "count") == 1)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "unsignedIntegerValue");

      objc_msgSend(v11, "replyTexts");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", v24);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    sgQuicktypeLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218240;
      v31 = objc_msgSend(v7, "index");
      v32 = 2048;
      v33 = objc_msgSend(v15, "count");
      v27 = "SGQuickResponses: dynamic label (score index %tu) should have one reply text per semantic class (count - %tu)!";
LABEL_17:
      _os_log_fault_impl(&dword_21ABF4000, v26, OS_LOG_TYPE_FAULT, v27, buf, 0x16u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  v18 = objc_msgSend(v7, "index");
  objc_msgSend(v8, "replies");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "replyCountForIndex:", v18);

  if (v20 != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGQuickResponsesInference.m"), 1125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[config.replies replyCountForIndex:semanticClassIndex] == 1"));

  }
  objc_msgSend(v8, "replies");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "replyTextsForIndex:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v21;
}

+ (void)registerDisplayedQuickResponses:(id)a3 plistPath:(id)a4 vocabPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x220753E80]();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lang");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      +[SGQuickResponsesModel configForLanguage:mode:plistPath:vocabPath:](SGQuickResponsesClassificationModel, "configForLanguage:mode:plistPath:vocabPath:", v13, 1, v9, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "predictionParams");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isPersonalizationDisabled");

        if (v17)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
          {
            LOWORD(v20) = 0;
            _os_log_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "SGQuickResponses: attempted to register displayed responses but personalization is disabled.", (uint8_t *)&v20, 2u);
          }
        }
        else
        {
          objc_msgSend(a1, "stringsForQuickResponses:", v8);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "count"))
          {
            v19 = (void *)objc_opt_new();
            objc_msgSend(v19, "registerDisplayedResponses:config:", v18, v15);

          }
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        v20 = 138412290;
        v21 = v13;
        _os_log_debug_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGQuickResponses: attempted to register displayed responses but config is nil (language %@ not supported?).", (uint8_t *)&v20, 0xCu);
      }

    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v20) = 0;
      _os_log_debug_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGQuickResponses: attempted to register displayed responses but language is nil.", (uint8_t *)&v20, 2u);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v20) = 0;
    _os_log_debug_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGQuickResponses: attempted to register displayed responses with 0 responses.", (uint8_t *)&v20, 2u);
  }
  objc_autoreleasePoolPop(v11);

}

+ (void)registerResponse:(id)a3 position:(id)a4 isCanned:(BOOL)a5 isUsingQuickResponses:(BOOL)a6 locale:(id)a7 plistPath:(id)a8 vocabPath:(id)a9
{
  _BOOL4 v12;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  BOOL v28;
  void *v29;
  int v30;
  NSObject *v31;
  const char *v32;
  uint32_t v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v12 = a5;
  v42 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = (void *)MEMORY[0x220753E80]();
  if (v12 && !a6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "SGQuickResponses: attempted to register a canned response but not using QuickResponses.", buf, 2u);
    }
    v20 = v14;
    goto LABEL_27;
  }
  +[SGConversationTracker instance](SGConversationTracker, "instance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "clear");

  _PASRepairString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    +[SGLanguageDetection languageForLocaleIdentifier:](SGLanguageDetection, "languageForLocaleIdentifier:", v16);
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      +[SGQuickResponsesModel configForLanguage:mode:plistPath:vocabPath:](SGQuickResponsesClassificationModel, "configForLanguage:mode:plistPath:vocabPath:", v22, 1, v17, v18);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      if (!v24)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v39 = v17;
          v40 = 2112;
          v41 = v23;
          _os_log_debug_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGQuickResponses: attempted to register a response but config at %@ is nil (language %@ not supported?).", buf, 0x16u);
        }
        goto LABEL_26;
      }
      v37 = (void *)v24;
      if (v15
        && v12
        && (v36 = objc_msgSend(v15, "unsignedIntegerValue"),
            objc_msgSend(v25, "predictionParams"),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            v27 = objc_msgSend(v26, "defaultResponsesToReturn"),
            v26,
            v28 = v36 >= v27,
            v25 = v37,
            v28))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v15;
          v31 = MEMORY[0x24BDACB70];
          v32 = "SGQuickResponses: attempted to register a canned response at position %@ that is not likely to have come"
                " from QuickResponses.";
          v33 = 12;
          goto LABEL_23;
        }
      }
      else
      {
        objc_msgSend(v25, "predictionParams");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isPersonalizationDisabled");

        if (!v30)
        {
          v34 = (void *)objc_opt_new();
          v35 = v34;
          v25 = v37;
          if (v12)
            objc_msgSend(v34, "registerSelectedResponse:config:", v20, v37);
          else
            objc_msgSend(v34, "registerWrittenResponse:config:", v20, v37);

          goto LABEL_26;
        }
        v25 = v37;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v31 = MEMORY[0x24BDACB70];
          v32 = "SGQuickResponses: attempted to register displayed responses but personalization is disabled.";
          v33 = 2;
LABEL_23:
          _os_log_impl(&dword_21ABF4000, v31, OS_LOG_TYPE_INFO, v32, buf, v33);
        }
      }
LABEL_26:

      goto LABEL_27;
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGQuickResponses: attempted to register a response but language is nil.", buf, 2u);
  }
LABEL_27:
  objc_autoreleasePoolPop(v19);

}

void __94__SGQuickResponsesInference_proactiveTriggerForDynamicLabel_context_language_useContactNames___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  uint64_t v4;
  _BOOL4 v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(_QWORD *)(v2 + 40);
  v3 = (id *)(v2 + 40);
  if (!v4)
  {
    objc_storeStrong(v3, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v5 = *(_BYTE *)(a1 + 64) == 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v6 = (void *)getSGNameDetectorClass_softClass_402;
    v21 = getSGNameDetectorClass_softClass_402;
    if (!getSGNameDetectorClass_softClass_402)
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __getSGNameDetectorClass_block_invoke_403;
      v17[3] = &unk_24DDC44C8;
      v17[4] = &v18;
      __getSGNameDetectorClass_block_invoke_403((uint64_t)v17);
      v6 = (void *)v19[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v18, 8);
    v8 = (void *)objc_msgSend([v7 alloc], "initWithLanguage:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v8, "detectNames:algorithm:", *(_QWORD *)(a1 + 40), 2 * v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count") == 1)
    {
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 40);
      v12 = objc_msgSend(v10, "range");
      objc_msgSend(v11, "substringWithRange:", v12, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

    }
  }
}

void __94__SGQuickResponsesInference_proactiveTriggerForDynamicLabel_context_language_useContactNames___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  const __CFString *v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[8];
  _QWORD v52[10];

  v52[8] = *MEMORY[0x24BDAC8D0];
  v31 = (void *)*MEMORY[0x24BE5EE00];
  v30 = (void *)*MEMORY[0x24BE5EE30];
  v0 = (void *)*MEMORY[0x24BE5EE08];
  v1 = (void *)*MEMORY[0x24BE5EDF0];
  v2 = (void *)*MEMORY[0x24BE5EE58];
  v3 = (void *)*MEMORY[0x24BE5EE28];
  v4 = (void *)*MEMORY[0x24BE5EE20];
  v5 = (void *)*MEMORY[0x24BE5EE48];
  v6 = (void *)*MEMORY[0x24BE5EE10];
  v7 = (void *)*MEMORY[0x24BE5EE50];
  v8 = (void *)*MEMORY[0x24BE5EDF8];
  v9 = (id)*MEMORY[0x24BE5EE38];
  v10 = (void *)proactiveTriggerForDynamicLabel_context_language_useContactNames__qualifiersKey;
  proactiveTriggerForDynamicLabel_context_language_useContactNames__qualifiersKey = (uint64_t)v9;
  v34 = v8;
  v33 = v7;
  v29 = v6;
  v11 = v5;
  v28 = v4;
  v12 = v3;
  v13 = v2;
  v14 = v1;
  v15 = v0;
  v16 = v30;
  v17 = v31;

  objc_storeStrong((id *)&proactiveTriggerForDynamicLabel_context_language_useContactNames__givenNameQualifier, (id)*MEMORY[0x24BE5EE18]);
  v50[2] = v29;
  v51[0] = CFSTR("firstPartyPhoneUEhPTkUuMXAK");
  v49[0] = v17;
  v49[1] = v13;
  v50[0] = v16;
  v50[1] = v12;
  v49[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v32;
  v51[1] = CFSTR("firstPartyEmailRU1BSUwuMXAK");
  v47[0] = v17;
  v47[1] = v13;
  v48[0] = v15;
  v48[1] = v12;
  v26 = v15;
  v47[2] = v11;
  v48[2] = v29;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v27;
  v51[2] = CFSTR("firstPartyPostalUE9TVEFMLjFwCg");
  v45[0] = v17;
  v45[1] = v13;
  v46[0] = v14;
  v46[1] = v12;
  v45[2] = v11;
  v46[2] = v29;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v25;
  v51[3] = CFSTR("thirdPartyPhoneUEhPTkUuM3AK");
  v43[0] = v17;
  v43[1] = v13;
  v44[0] = v16;
  v44[1] = v12;
  v43[2] = v11;
  v44[2] = v33;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v24;
  v51[4] = CFSTR("thirdPartyEmailRU1BSUwuMXAK");
  v41[0] = v17;
  v41[1] = v13;
  v42[0] = v15;
  v42[1] = v12;
  v41[2] = v11;
  v42[2] = v33;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v18;
  v51[5] = CFSTR("thirdPartyPostalUE9TVEFMLjFwCg");
  v39[0] = v17;
  v39[1] = v13;
  v40[0] = v14;
  v40[1] = v12;
  v39[2] = v11;
  v40[2] = v33;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v19;
  v51[6] = CFSTR("firstPartyLocTE9DLjFwCg");
  v37[0] = v13;
  v37[1] = v11;
  v38[0] = v28;
  v38[1] = v34;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v52[6] = v20;
  v51[7] = CFSTR("photoSharingUEhPVE8K");
  v35 = v13;
  v36 = CFSTR("photosharing");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v52[7] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 8);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)proactiveTriggerForDynamicLabel_context_language_useContactNames__triggerForLabel;
  proactiveTriggerForDynamicLabel_context_language_useContactNames__triggerForLabel = v22;

}

void __66__SGQuickResponsesInference_dynamicIndicesAndTopIsDynamic_config___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = (void *)a1[4];
  v6 = a2;
  objc_msgSend(v5, "replies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "index");

  objc_msgSend(v7, "replyTextForIndex:position:", v8, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (+[SGQuickResponsesDynamicLabelSet isDynamicLabel:](SGQuickResponsesDynamicLabelSet, "isDynamicLabel:", v11))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addIndex:", a3);
    if (!a3)
    {
      v9 = *(_QWORD *)(a1[6] + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = MEMORY[0x24BDBD1C8];

    }
  }

}

void __66__SGQuickResponsesInference_dynamicIndicesAndTopIsDynamic_config___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  id v19;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "predictionParams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPerCategory");

  v9 = *(void **)(a1 + 40);
  if (v8)
  {
    objc_msgSend(v9, "categoryModels");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "index");

    objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v9, "semanticClassParent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v6, "index");

    objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(*(id *)(a1 + 40), "models");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v19, "unsignedIntegerValue"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "dynamicLabel");

  if (v16)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addIndex:", a3);
    if (!a3)
    {
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = MEMORY[0x24BDBD1C8];

    }
  }

}

@end
