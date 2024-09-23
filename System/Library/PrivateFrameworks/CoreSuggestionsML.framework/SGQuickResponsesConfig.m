@implementation SGQuickResponsesConfig

- (SGQuickResponsesConfig)initWithLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5 vocabPath:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  SGQuickResponsesConfig *v15;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  +[SGQuickResponsesConfig _dictionaryForPlistPath:mode:](SGQuickResponsesConfig, "_dictionaryForPlistPath:mode:", v11, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGQuickResponsesConfig _vocabForVocabPath:mode:](SGQuickResponsesConfig, "_vocabForVocabPath:mode:", v12, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    self = -[SGQuickResponsesConfig initWithLanguage:mode:dictionary:lazyVocab:](self, "initWithLanguage:mode:dictionary:lazyVocab:", v10, a4, v13, v14);
    v15 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      v17 = 138412290;
      v18 = v11;
      _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "SGQuickResponses: Invalid plist path %@", (uint8_t *)&v17, 0xCu);
    }
    v15 = 0;
  }

  return v15;
}

- (SGQuickResponsesConfig)initWithLanguage:(id)a3 mode:(unint64_t)a4 dictionary:(id)a5 vocab:(id)a6
{
  id v10;
  id v11;
  id v12;
  SGLazyInit *v13;
  id v14;
  SGLazyInit *v15;
  SGQuickResponsesConfig *v16;
  _QWORD v18[4];
  id v19;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = [SGLazyInit alloc];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __65__SGQuickResponsesConfig_initWithLanguage_mode_dictionary_vocab___block_invoke;
  v18[3] = &unk_24DDC3F78;
  v19 = v10;
  v14 = v10;
  v15 = -[SGLazyInit initWithInitializer:destructor:](v13, "initWithInitializer:destructor:", v18, 0);
  v16 = -[SGQuickResponsesConfig initWithLanguage:mode:dictionary:lazyVocab:](self, "initWithLanguage:mode:dictionary:lazyVocab:", v12, a4, v11, v15);

  return v16;
}

- (SGQuickResponsesConfig)initWithLanguage:(id)a3 mode:(unint64_t)a4 dictionary:(id)a5 lazyVocab:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  SGQuickResponsesClassificationParameters *v29;
  void *v30;
  SGQuickResponsesClassificationParameters *v31;
  void *v32;
  id v33;
  SGQuickResponsesClassificationParameters *classificationParams;
  SGModelHyperparameters *v35;
  void *v36;
  void *v37;
  SGModelHyperparameters *v38;
  SGModelHyperparameters *v39;
  void *v40;
  NSArray *v41;
  NSArray *v42;
  void *v43;
  NSArray *v44;
  NSArray *labels;
  unint64_t v46;
  void *v47;
  NSObject *v48;
  const char *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  SGQuickResponsesPredictionParameters *v57;
  void *v58;
  SGQuickResponsesPredictionParameters *v59;
  SGQuickResponsesPredictionParameters *predictionParams;
  SGModelHyperparameters *v61;
  void *v62;
  void *v63;
  void *v64;
  SGModelHyperparameters *v65;
  SGModelHyperparameters *modelHyperparameters;
  void *v67;
  NSArray *v68;
  NSArray *preprocessingMethods;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  NSDictionary *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i;
  uint64_t v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  SGModelHead *v87;
  SGQuickResponsesReplies *modelHeads;
  NSObject *v89;
  const char *v90;
  SGQuickResponsesConfig *v91;
  void *v93;
  void *v94;
  SGQuickResponsesReplies *v95;
  void *v96;
  SGCustomResponsesParameters *v97;
  void *v98;
  SGCustomResponsesParameters *v99;
  SGCustomResponsesParameters *customResponsesParameters;
  PMLSessionDescriptor *v101;
  PMLSessionDescriptor *sessionDescriptor;
  SGQuickResponsesConfig *v103;
  id v104;
  void *context;
  id v106;
  id v107;
  unint64_t v108;
  id obj;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  objc_super v114;
  uint8_t v115[128];
  uint8_t buf[4];
  id v117;
  uint64_t v118;

  v118 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = v12;
  v15 = v14;
  if (v14)
  {

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v114.receiver = self;
      v114.super_class = (Class)SGQuickResponsesConfig;
      self = -[SGQuickResponsesConfig init](&v114, sel_init);
      if (!self)
      {
LABEL_72:
        self = self;
        v91 = self;
        goto LABEL_46;
      }
      v16 = (void *)MEMORY[0x220753E80]();
      if (a4 == 1)
      {
        v106 = a3;
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PREDICTION_REPLIES"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {

        }
        else
        {
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("MODEL_HEADS"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "objectForKeyedSubscript:", v11);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v51)
          {
LABEL_39:
            if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
              goto LABEL_44;
            *(_DWORD *)buf = 138412290;
            v117 = v11;
            v89 = MEMORY[0x24BDACB70];
            v90 = "SGQuickResponses: no available configuration found to support prediction for language %@";
LABEL_64:
            _os_log_debug_impl(&dword_21ABF4000, v89, OS_LOG_TYPE_DEBUG, v90, buf, 0xCu);
            goto LABEL_44;
          }
        }
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PREDICTION_MODEL_HYPERPARAMETERS"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "objectForKeyedSubscript:", v11);
        v53 = objc_claimAutoreleasedReturnValue();
        if (v53)
        {
          v54 = (void *)v53;
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PREDICTION_PREPROCESSING_METHODS"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "objectForKeyedSubscript:", v11);
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          if (v56)
          {
            v57 = [SGQuickResponsesPredictionParameters alloc];
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PREDICTION_PARAMETERS"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = -[SGQuickResponsesPredictionParameters initWithDictionary:](v57, "initWithDictionary:", v58);

            if (v59)
            {
              predictionParams = self->_predictionParams;
              self->_predictionParams = v59;

              v61 = [SGModelHyperparameters alloc];
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PREDICTION_MODEL_HYPERPARAMETERS"));
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "objectForKeyedSubscript:", v11);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGQuickResponsesPredictionParameters modelTypeName](self->_predictionParams, "modelTypeName");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = -[SGModelHyperparameters initWithDictionary:modelTypeName:](v61, "initWithDictionary:modelTypeName:", v63, v64);

              if (v65)
              {
                modelHyperparameters = self->_modelHyperparameters;
                self->_modelHyperparameters = v65;

                objc_msgSend(v15, "objectAssertedForKey:", CFSTR("PREDICTION_PREPROCESSING_METHODS"));
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "arrayAssertedForKey:", v11);
                v68 = (NSArray *)objc_claimAutoreleasedReturnValue();

                if (v68)
                {
                  v104 = v13;
                  context = v16;
                  preprocessingMethods = self->_preprocessingMethods;
                  self->_preprocessingMethods = v68;

                  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("MODEL_HEADS"));
                  v70 = objc_claimAutoreleasedReturnValue();
                  if (!v70)
                    goto LABEL_55;
                  v71 = (void *)v70;
                  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("MODEL_HEADS"));
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v72, "objectForKeyedSubscript:", v11);
                  v73 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v73)
                  {
                    v103 = self;
                    v74 = (NSDictionary *)objc_opt_new();
                    v110 = 0u;
                    v111 = 0u;
                    v112 = 0u;
                    v113 = 0u;
                    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("MODEL_HEADS"));
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "objectForKeyedSubscript:", v11);
                    v76 = (void *)objc_claimAutoreleasedReturnValue();

                    obj = v76;
                    v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v110, v115, 16);
                    if (v77)
                    {
                      v78 = v77;
                      v79 = *(_QWORD *)v111;
                      do
                      {
                        for (i = 0; i != v78; ++i)
                        {
                          if (*(_QWORD *)v111 != v79)
                            objc_enumerationMutation(obj);
                          v81 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * i);
                          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("MODEL_HEADS"), v103);
                          v82 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v82, "objectForKeyedSubscript:", v11);
                          v83 = v15;
                          v84 = v11;
                          v85 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v85, "objectForKeyedSubscript:", v81);
                          v86 = (void *)objc_claimAutoreleasedReturnValue();

                          v11 = v84;
                          v15 = v83;

                          v87 = -[SGModelHead initWithDictionary:key:]([SGModelHead alloc], "initWithDictionary:key:", v86, v81);
                          -[NSDictionary setObject:forKeyedSubscript:](v74, "setObject:forKeyedSubscript:", v87, v81);

                        }
                        v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v115, 16);
                      }
                      while (v78);
                    }

                    self = v103;
                    modelHeads = (SGQuickResponsesReplies *)v103->_modelHeads;
                    v103->_modelHeads = v74;
                  }
                  else
                  {
LABEL_55:
                    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PREDICTION_REPLIES"));
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v93, "objectForKeyedSubscript:", v11);
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    +[SGQuickResponsesReplies repliesWithArray:](SGQuickResponsesReplies, "repliesWithArray:", v94);
                    v95 = (SGQuickResponsesReplies *)objc_claimAutoreleasedReturnValue();

                    if (!v95)
                    {
                      v13 = v104;
                      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                      {
                        *(_WORD *)buf = 0;
                        v48 = MEMORY[0x24BDACB70];
                        v49 = "[SGQuickResponsesReplies repliesWithArray:dict[PREDICTION_REPLIES][language]]";
                        goto LABEL_81;
                      }
                      goto LABEL_44;
                    }
                    modelHeads = self->_replies;
                    self->_replies = v95;
                  }
                  v13 = v104;

                  v47 = v106;
                  v46 = 1;
LABEL_58:
                  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CUSTOM_RESPONSES_PARAMETERS"), v103);
                  v96 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v96)
                  {
                    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v117 = v11;
                      _os_log_debug_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGQuickResponses: no available configuration found to support custom responses for language %@", buf, 0xCu);
                    }
                    customResponsesParameters = self->_customResponsesParameters;
                    self->_customResponsesParameters = 0;
                    goto LABEL_70;
                  }
                  v97 = [SGCustomResponsesParameters alloc];
                  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CUSTOM_RESPONSES_PARAMETERS"));
                  v98 = (void *)objc_claimAutoreleasedReturnValue();
                  v99 = -[SGCustomResponsesParameters initWithDictionary:](v97, "initWithDictionary:", v98);

                  if (v99)
                  {
                    customResponsesParameters = self->_customResponsesParameters;
                    self->_customResponsesParameters = v99;
LABEL_70:
                    v16 = context;

                    objc_storeStrong((id *)&self->_language, v47);
                    self->_mode = v46;
                    -[SGModelHyperparameters sessionDescriptorForLanguage:](self->_modelHyperparameters, "sessionDescriptorForLanguage:", v11);
                    v101 = (PMLSessionDescriptor *)objc_claimAutoreleasedReturnValue();
                    sessionDescriptor = self->_sessionDescriptor;
                    self->_sessionDescriptor = v101;

                    if (-[SGQuickResponsesConfig isValidConfigForWordPieceWithLazyVocab:](self, "isValidConfigForWordPieceWithLazyVocab:", v13))
                    {
                      objc_autoreleasePoolPop(context);
                      goto LABEL_72;
                    }
                    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                      goto LABEL_44;
                    *(_WORD *)buf = 0;
                    v48 = MEMORY[0x24BDACB70];
                    v49 = "[self isValidConfigForWordPieceWithLazyVocab:lazyVocab]";
                    goto LABEL_81;
                  }
                  v16 = context;
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)buf = 0;
                    v48 = MEMORY[0x24BDACB70];
                    v49 = "[[SGCustomResponsesParameters alloc] initWithDictionary:dict[CUSTOM_RESPONSES_PARAMETERS]]";
                    goto LABEL_81;
                  }
LABEL_44:
                  objc_autoreleasePoolPop(v16);
                  goto LABEL_45;
                }
                if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                  goto LABEL_44;
                *(_WORD *)buf = 0;
                v48 = MEMORY[0x24BDACB70];
                v49 = "[[dict objectAssertedForKey:PREDICTION_PREPROCESSING_METHODS] arrayAssertedForKey:language]";
              }
              else
              {
                if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                  goto LABEL_44;
                *(_WORD *)buf = 0;
                v48 = MEMORY[0x24BDACB70];
                v49 = "[[SGModelHyperparameters alloc] initWithDictionary:dict[PREDICTION_MODEL_HYPERPARAMETERS][language"
                      "] modelTypeName:_predictionParams.modelTypeName]";
              }
            }
            else
            {
              if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                goto LABEL_44;
              *(_WORD *)buf = 0;
              v48 = MEMORY[0x24BDACB70];
              v49 = "[[SGQuickResponsesPredictionParameters alloc] initWithDictionary:dict[PREDICTION_PARAMETERS]]";
            }
LABEL_81:
            _os_log_fault_impl(&dword_21ABF4000, v48, OS_LOG_TYPE_FAULT, v49, buf, 2u);
            goto LABEL_44;
          }
        }
        else
        {

        }
        goto LABEL_39;
      }
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CLASSIFICATION_LABELS"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v11);
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        v107 = a3;
        v108 = a4;
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CLASSIFICATION_MODEL_HYPERPARAMETERS"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", v11);
        v25 = objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v26 = (void *)v25;
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CLASSIFICATION_PREPROCESSING_METHODS"));
          context = v16;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKeyedSubscript:", v11);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = context;
          if (v28)
          {
            v29 = [SGQuickResponsesClassificationParameters alloc];
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CLASSIFICATION_PARAMETERS"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = -[SGQuickResponsesClassificationParameters initWithDictionary:language:](v29, "initWithDictionary:language:", v30, v11);

            if (v31)
            {
              v32 = v15;
              v33 = v13;
              classificationParams = self->_classificationParams;
              self->_classificationParams = v31;

              v35 = [SGModelHyperparameters alloc];
              objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("CLASSIFICATION_MODEL_HYPERPARAMETERS"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "objectForKeyedSubscript:", v11);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = -[SGModelHyperparameters initWithDictionary:modelTypeName:](v35, "initWithDictionary:modelTypeName:", v37, CFSTR("quickResponsesEspressoClassifierMultiLabel"));

              if (v38)
              {
                v39 = self->_modelHyperparameters;
                self->_modelHyperparameters = v38;

                objc_msgSend(v32, "objectAssertedForKey:", CFSTR("CLASSIFICATION_PREPROCESSING_METHODS"));
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "arrayAssertedForKey:", v11);
                v41 = (NSArray *)objc_claimAutoreleasedReturnValue();

                v13 = v33;
                if (v41)
                {
                  v42 = self->_preprocessingMethods;
                  self->_preprocessingMethods = v41;

                  objc_msgSend(v32, "objectAssertedForKey:", CFSTR("CLASSIFICATION_LABELS"));
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "arrayAssertedForKey:", v11);
                  v44 = (NSArray *)objc_claimAutoreleasedReturnValue();

                  v15 = v32;
                  if (v44)
                  {
                    labels = self->_labels;
                    self->_labels = v44;

                    v47 = v107;
                    v46 = v108;
                    if (-[NSArray count](self->_labels, "count") <= 0x1000)
                      goto LABEL_58;
                    v16 = context;
                    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                      goto LABEL_44;
                    *(_WORD *)buf = 0;
                    v48 = MEMORY[0x24BDACB70];
                    v49 = "SGQuickResponsesConfig: Training class count exceeds maximum";
                  }
                  else
                  {
                    v16 = context;
                    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                      goto LABEL_44;
                    *(_WORD *)buf = 0;
                    v48 = MEMORY[0x24BDACB70];
                    v49 = "[[dict objectAssertedForKey:CLASSIFICATION_LABELS] arrayAssertedForKey:language]";
                  }
                }
                else
                {
                  v15 = v32;
                  v16 = context;
                  if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                    goto LABEL_44;
                  *(_WORD *)buf = 0;
                  v48 = MEMORY[0x24BDACB70];
                  v49 = "[[dict objectAssertedForKey:CLASSIFICATION_PREPROCESSING_METHODS] arrayAssertedForKey:language]";
                }
              }
              else
              {
                v13 = v33;
                v15 = v32;
                v16 = context;
                if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                  goto LABEL_44;
                *(_WORD *)buf = 0;
                v48 = MEMORY[0x24BDACB70];
                v49 = "[[SGModelHyperparameters alloc] initWithDictionary:dict[CLASSIFICATION_MODEL_HYPERPARAMETERS][lang"
                      "uage] modelTypeName:SG_QUICK_RESPONSES_MULTICLASS_ESPRESSO_CLASSIFIER]";
              }
            }
            else
            {
              v16 = context;
              if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                goto LABEL_44;
              *(_WORD *)buf = 0;
              v48 = MEMORY[0x24BDACB70];
              v49 = "[[SGQuickResponsesClassificationParameters alloc] initWithDictionary:dict[CLASSIFICATION_PARAMETERS]"
                    " language:language]";
            }
            goto LABEL_81;
          }
          goto LABEL_43;
        }

      }
LABEL_43:
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        goto LABEL_44;
      *(_DWORD *)buf = 138412290;
      v117 = v11;
      v89 = MEMORY[0x24BDACB70];
      v90 = "SGQuickResponses: no available configuration found to support training for language %@";
      goto LABEL_64;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v19 = MEMORY[0x24BDACB70];
      v20 = "[dict isKindOfClass:NSDictionary.class]";
      goto LABEL_11;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    v19 = MEMORY[0x24BDACB70];
    v20 = "dict";
LABEL_11:
    _os_log_fault_impl(&dword_21ABF4000, v19, OS_LOG_TYPE_FAULT, v20, buf, 2u);
  }
LABEL_45:
  v91 = 0;
LABEL_46:

  return v91;
}

- (BOOL)isValidConfigForWordPieceWithLazyVocab:(id)a3
{
  id v5;
  PMLWordPieceVocabProtocol *v6;
  PMLWordPieceVocabProtocol *vocab;
  void *v8;
  int v9;
  int v10;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (-[SGModelHyperparameters vectorizerStrategy](self->_modelHyperparameters, "vectorizerStrategy") == 6)
  {
    objc_msgSend(v5, "getObject");
    v6 = (PMLWordPieceVocabProtocol *)objc_claimAutoreleasedReturnValue();
    vocab = self->_vocab;
    self->_vocab = v6;

    if (self->_vocab)
    {
      if (-[NSArray count](self->_preprocessingMethods, "count") <= 1)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesConfig.m"), 1165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_preprocessingMethods.count >= 2"));

      }
      -[NSArray objectAtIndexedSubscript:](self->_preprocessingMethods, "objectAtIndexedSubscript:", -[NSArray count](self->_preprocessingMethods, "count") - 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("finalizeForWordPieceCaseInsensitive"));
      v10 = v9 | objc_msgSend(v8, "isEqualToString:", CFSTR("finalizeForWordPieceCaseSensitive"));
      if ((v10 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v14 = v8;
        v15 = 2112;
        v16 = CFSTR("finalizeForWordPieceCaseInsensitive");
        v17 = 2112;
        v18 = CFSTR("finalizeForWordPieceCaseSensitive");
        _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "SGQuickResponsesConfig: final preprocessing step %@ is not %@ or %@", buf, 0x20u);
      }

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "SGQuickResponsesConfig: Strategy PMLHashingVectorizerStrategyWordPiece used but no vocab present", buf, 2u);
      }
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (SGModelHyperparameters)modelHyperparameters
{
  return self->_modelHyperparameters;
}

- (NSArray)preprocessingMethods
{
  return self->_preprocessingMethods;
}

- (NSArray)labels
{
  return self->_labels;
}

- (SGQuickResponsesReplies)replies
{
  return self->_replies;
}

- (NSDictionary)modelHeads
{
  return self->_modelHeads;
}

- (SGQuickResponsesClassificationParameters)classificationParams
{
  return self->_classificationParams;
}

- (SGQuickResponsesPredictionParameters)predictionParams
{
  return self->_predictionParams;
}

- (SGCustomResponsesParameters)customResponsesParameters
{
  return self->_customResponsesParameters;
}

- (NSString)language
{
  return self->_language;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (PMLSessionDescriptor)sessionDescriptor
{
  return self->_sessionDescriptor;
}

- (PMLWordPieceVocabProtocol)vocab
{
  return self->_vocab;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocab, 0);
  objc_storeStrong((id *)&self->_sessionDescriptor, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_customResponsesParameters, 0);
  objc_storeStrong((id *)&self->_predictionParams, 0);
  objc_storeStrong((id *)&self->_classificationParams, 0);
  objc_storeStrong((id *)&self->_modelHeads, 0);
  objc_storeStrong((id *)&self->_replies, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_preprocessingMethods, 0);
  objc_storeStrong((id *)&self->_modelHyperparameters, 0);
}

id __65__SGQuickResponsesConfig_initWithLanguage_mode_dictionary_vocab___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)_cacheKeyForLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5 vocabPath:(id)a6
{
  objc_class *v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  id v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;

  v9 = (objc_class *)MEMORY[0x24BDD17C8];
  v10 = (__CFString *)a6;
  v11 = (__CFString *)a5;
  v12 = a3;
  v13 = [v9 alloc];
  v14 = &stru_24DDC5810;
  if (v11)
    v15 = v11;
  else
    v15 = &stru_24DDC5810;
  if (v10)
    v14 = v10;
  v16 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@-%lu-%@-%@"), v12, a4, v15, v14);

  return v16;
}

+ (id)_sharedCache
{
  if (_sharedCache__pasOnceToken123 != -1)
    dispatch_once(&_sharedCache__pasOnceToken123, &__block_literal_global_610);
  return (id)objc_msgSend((id)_sharedCache__pasExprOnceResult, "result");
}

+ (void)_addModelAssetUpdateHandler
{
  if (_addModelAssetUpdateHandler_onceToken != -1)
    dispatch_once(&_addModelAssetUpdateHandler_onceToken, &__block_literal_global_615);
}

+ (id)_dictionaryForPlistPath:(id)a3 mode:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    +[SGDefaultAssets dictionaryWithPlistAssetPath:](SGDefaultAssets, "dictionaryWithPlistAssetPath:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    +[SGDefaultAssets quickResponsesPrediction](SGDefaultAssets, "quickResponsesPrediction");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = (void *)v6;
    if (v6)
      goto LABEL_9;
    goto LABEL_6;
  }
  +[SGModelAsset quickResponses](SGModelAsset, "quickResponses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGQuickResponsesConfig _addModelAssetUpdateHandler](SGQuickResponsesConfig, "_addModelAssetUpdateHandler");
  if (v7)
    goto LABEL_9;
LABEL_6:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "SGQuickResponses: Invalid plist path %@", (uint8_t *)&v9, 0xCu);
  }
LABEL_9:

  return v7;
}

+ (id)_vocabForVocabPath:(id)a3 mode:(unint64_t)a4
{
  id v5;
  SGLazyInit *v6;
  SGLazyInit *v7;
  SGLazyInit *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  if (v5)
  {
    v6 = [SGLazyInit alloc];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __50__SGQuickResponsesConfig__vocabForVocabPath_mode___block_invoke;
    v10[3] = &unk_24DDC3F78;
    v11 = v5;
    v7 = -[SGLazyInit initWithInitializer:destructor:](v6, "initWithInitializer:destructor:", v10, 0);

  }
  else
  {
    v8 = [SGLazyInit alloc];
    if (a4 == 1)
    {
      v7 = -[SGLazyInit initWithInitializer:destructor:](v8, "initWithInitializer:destructor:", &__block_literal_global_620, 0);
    }
    else
    {
      v7 = -[SGLazyInit initWithInitializer:destructor:](v8, "initWithInitializer:destructor:", &__block_literal_global_621, 0);
      +[SGQuickResponsesConfig _addModelAssetUpdateHandler](SGQuickResponsesConfig, "_addModelAssetUpdateHandler");
    }
  }

  return v7;
}

+ (id)modelTypeAndSubModelKeyForLanguage:(id)a3 plistPath:(id)a4 vocabPath:(id)a5 warmupBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  dispatch_block_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD block[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGQuickResponsesConfig.m"), 1008, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("language.length"));

  }
  v15 = (void *)MEMORY[0x220753E80]();
  +[SGQuickResponsesConfig _cacheKeyForLanguage:mode:plistPath:vocabPath:](SGQuickResponsesConfig, "_cacheKeyForLanguage:mode:plistPath:vocabPath:", v11, 1, v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGQuickResponsesConfig _sharedCache](SGQuickResponsesConfig, "_sharedCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = v12;
  v39 = v13;
  v37 = v14;
  if (v18)
  {
    v19 = objc_alloc(MEMORY[0x24BE7A648]);
    objc_msgSend(v18, "predictionParams");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "modelTypeName");
    v21 = v15;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "predictionParams");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "subModelKeyString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v19, "initWithFirst:second:", v22, v24);

    v15 = v21;
  }
  else
  {
    +[SGQuickResponsesConfig _dictionaryForPlistPath:mode:](SGQuickResponsesConfig, "_dictionaryForPlistPath:mode:", v12, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v36 = v15;
      if (modelTypeAndSubModelKeyForLanguage_plistPath_vocabPath_warmupBlock___pasOnceToken125 != -1)
        dispatch_once(&modelTypeAndSubModelKeyForLanguage_plistPath_vocabPath_warmupBlock___pasOnceToken125, &__block_literal_global_625);
      v27 = (void *)modelTypeAndSubModelKeyForLanguage_plistPath_vocabPath_warmupBlock___pasExprOnceResult;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __93__SGQuickResponsesConfig_modelTypeAndSubModelKeyForLanguage_plistPath_vocabPath_warmupBlock___block_invoke_2;
      block[3] = &unk_24DDC3ED0;
      v41 = v16;
      v42 = v13;
      v46 = 1;
      v43 = v11;
      v28 = v26;
      v44 = v28;
      v45 = v14;
      v29 = v27;
      v30 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_async(v29, v30);

      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("PREDICTION_PARAMETERS"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[SGQuickResponsesPredictionParameters _modelTypeNameForDictionary:](SGQuickResponsesPredictionParameters, "_modelTypeNameForDictionary:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[SGQuickResponsesPredictionParameters _subModelKeyStringForDictionary:](SGQuickResponsesPredictionParameters, "_subModelKeyStringForDictionary:", v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7A648]), "initWithFirst:second:", v32, v33);

      v15 = v36;
    }
    else
    {
      v25 = 0;
    }

  }
  objc_autoreleasePoolPop(v15);

  return v25;
}

+ (id)configWithLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5 vocabPath:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SGQuickResponsesConfig *v18;
  void *v19;
  void *v21;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGQuickResponsesConfig.m"), 1047, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("language.length"));

  }
  v14 = (void *)MEMORY[0x220753E80]();
  +[SGQuickResponsesConfig _cacheKeyForLanguage:mode:plistPath:vocabPath:](SGQuickResponsesConfig, "_cacheKeyForLanguage:mode:plistPath:vocabPath:", v11, a4, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGQuickResponsesConfig _sharedCache](SGQuickResponsesConfig, "_sharedCache");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = v17;
  }
  else
  {
    v18 = -[SGQuickResponsesConfig initWithLanguage:mode:plistPath:vocabPath:]([SGQuickResponsesConfig alloc], "initWithLanguage:mode:plistPath:vocabPath:", v11, a4, v12, v13);
    if (v18)
    {
      +[SGQuickResponsesConfig _sharedCache](SGQuickResponsesConfig, "_sharedCache");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKey:", v18, v15);

    }
  }

  objc_autoreleasePoolPop(v14);
  return v18;
}

void __93__SGQuickResponsesConfig_modelTypeAndSubModelKeyForLanguage_plistPath_vocabPath_warmupBlock___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  SGQuickResponsesConfig *v4;
  void *v5;
  uint64_t v6;
  id v7;

  +[SGQuickResponsesConfig _sharedCache](SGQuickResponsesConfig, "_sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", a1[4]);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    +[SGQuickResponsesConfig _vocabForVocabPath:mode:](SGQuickResponsesConfig, "_vocabForVocabPath:mode:", a1[5], a1[9]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[SGQuickResponsesConfig initWithLanguage:mode:dictionary:lazyVocab:]([SGQuickResponsesConfig alloc], "initWithLanguage:mode:dictionary:lazyVocab:", a1[6], a1[9], a1[7], v3);
    if (v4)
    {
      +[SGQuickResponsesConfig _sharedCache](SGQuickResponsesConfig, "_sharedCache");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v4, a1[4]);

    }
  }
  v6 = a1[8];
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

void __93__SGQuickResponsesConfig_modelTypeAndSubModelKeyForLanguage_plistPath_vocabPath_warmupBlock___block_invoke()
{
  void *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x220753E80]();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("com.apple.suggestions.quickResponsesConfigWarmup", v1);
  v3 = (void *)modelTypeAndSubModelKeyForLanguage_plistPath_vocabPath_warmupBlock___pasExprOnceResult;
  modelTypeAndSubModelKeyForLanguage_plistPath_vocabPath_warmupBlock___pasExprOnceResult = (uint64_t)v2;

  objc_autoreleasePoolPop(v0);
}

id __50__SGQuickResponsesConfig__vocabForVocabPath_mode___block_invoke(uint64_t a1)
{
  return +[SGDefaultAssets vocabWithTrieAssetPath:](SGDefaultAssets, "vocabWithTrieAssetPath:", *(_QWORD *)(a1 + 32));
}

id __50__SGQuickResponsesConfig__vocabForVocabPath_mode___block_invoke_3()
{
  return +[SGModelAsset quickResponsesVocab](SGModelAsset, "quickResponsesVocab");
}

id __50__SGQuickResponsesConfig__vocabForVocabPath_mode___block_invoke_2()
{
  return +[SGDefaultAssets quickResponsesPredictionVocab](SGDefaultAssets, "quickResponsesPredictionVocab");
}

uint64_t __53__SGQuickResponsesConfig__addModelAssetUpdateHandler__block_invoke()
{
  return +[SGModelAsset registerOnUpdateBlock:](SGModelAsset, "registerOnUpdateBlock:", &__block_literal_global_617);
}

void __53__SGQuickResponsesConfig__addModelAssetUpdateHandler__block_invoke_2()
{
  id v0;

  +[SGQuickResponsesConfig _sharedCache](SGQuickResponsesConfig, "_sharedCache");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeAllObjects");

}

void __38__SGQuickResponsesConfig__sharedCache__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x220753E80]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BE7A600]), "initWithBlock:idleTimeout:", &__block_literal_global_613, 600.0);
  v2 = (void *)_sharedCache__pasExprOnceResult;
  _sharedCache__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

id __38__SGQuickResponsesConfig__sharedCache__block_invoke_2()
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE7A5F0]), "initWithCountLimit:", 6);
}

@end
