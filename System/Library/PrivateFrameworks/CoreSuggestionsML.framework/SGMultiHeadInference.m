@implementation SGMultiHeadInference

- (SGMultiHeadInference)initWithLanguage:(id)a3 inputName:(id)a4 plistPath:(id)a5 espressoModelPath:(id)a6 vocabPath:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  SGMultiHeadInference *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  SGMultiHeadInference *v35;
  id *p_isa;
  void *v38;
  id v39;
  id v40;
  id v41;
  SGMultiHeadInference *v42;
  objc_super v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  id v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  +[SGQuickResponsesConfig configWithLanguage:mode:plistPath:vocabPath:](SGQuickResponsesConfig, "configWithLanguage:mode:plistPath:vocabPath:", v12, 1, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v41 = v16;
    v42 = self;
    v38 = v15;
    v39 = v13;
    v40 = v12;
    v18 = (void *)objc_opt_new();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v17, "modelHeads");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v45 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v17, "modelHeads");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v26, "numberOfDimensions"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v27, v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v21);
    }

    v15 = v38;
    if (objc_msgSend(v38, "hasSuffix:", CFSTR(".net")))
    {
      v28 = v38;
    }
    else
    {
      v30 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v17, "predictionParams");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "subModelKeyString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (id)objc_msgSend(v30, "initWithFormat:", CFSTR("%@:%@"), v38, v32);

    }
    v13 = v39;
    v16 = v41;
    +[SGMultiHeadEspressoModelCached classifierWithEspressoModelFile:inputName:headDimensionality:](SGMultiHeadEspressoModelCached, "classifierWithEspressoModelFile:inputName:headDimensionality:", v28, v39, v18);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v40;
    if (v33)
    {
      +[SGQuickResponsesModel transformerInstanceForLanguage:mode:plistPath:vocabPath:](SGQuickResponsesClassificationModel, "transformerInstanceForLanguage:mode:plistPath:vocabPath:", v40, 1, v14, v41);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v43.receiver = v42;
        v43.super_class = (Class)SGMultiHeadInference;
        v35 = -[SGMultiHeadInference init](&v43, sel_init);
        p_isa = (id *)&v35->super.isa;
        if (v35)
        {
          objc_storeStrong((id *)&v35->_config, v17);
          objc_storeStrong(p_isa + 4, v18);
          objc_storeStrong(p_isa + 2, v33);
          objc_storeStrong(p_isa + 3, v34);
        }
        v29 = p_isa;
        v42 = v29;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v50 = v40;
          v51 = 2112;
          v52 = v14;
          _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to initialize transformer prerprocessor for language %@ and plist path %@", buf, 0x16u);
        }
        v29 = 0;
      }

      v16 = v41;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v50 = v40;
        v51 = 2112;
        v52 = v14;
        _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to initialize multi head model for language %@ and plist path %@", buf, 0x16u);
      }
      v29 = 0;
    }

    self = v42;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v50 = v12;
      v51 = 2112;
      v52 = v14;
      _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Config not found for language %@ and plist path %@", buf, 0x16u);
    }
    v29 = 0;
  }

  return v29;
}

- (id)predictForVector:(id)a3 heads:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  os_signpost_id_t spid;
  void *context;
  unint64_t v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v35 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ABF4000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "QuickResponsesForMessagePrediction", " enableTelemetry=YES ", buf, 2u);
  }
  spid = v9;

  v38 = (id)objc_opt_new();
  context = (void *)MEMORY[0x220753E80]();
  v36 = v7;
  v37 = v6;
  -[SGMultiHeadEspressoModel predict:heads:](self->_model, "predict:heads:", v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v42;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v42 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v16);
        -[SGQuickResponsesConfig modelHeads](self->_config, "modelHeads");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "labels");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20
          && (v21 = objc_msgSend(v20, "count"),
              objc_msgSend(v12, "objectForKeyedSubscript:", v17),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              v23 = objc_msgSend(v22, "count"),
              v22,
              v21 != v23))
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
          {
            v26 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v12, "objectForKeyedSubscript:", v17);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v46 = v17;
            v47 = 2112;
            v48 = v28;
            v49 = 2112;
            v50 = v29;
            _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "MultiHead output head %@ has mismatching number of scores (%@) and labels (%@)", buf, 0x20u);

          }
        }
        else
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", v17);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = MEMORY[0x24BDAC760];
          v39[1] = 3221225472;
          v39[2] = __47__SGMultiHeadInference_predictForVector_heads___block_invoke;
          v39[3] = &unk_24DDC4EA0;
          v40 = v20;
          objc_msgSend(v24, "_pas_mappedArrayWithIndexedTransform:", v39);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setObject:forKeyedSubscript:", v25, v17);

        }
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v14);
  }

  objc_autoreleasePoolPop(context);
  sgLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v35 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ABF4000, v31, OS_SIGNPOST_INTERVAL_END, spid, "QuickResponsesForMessagePrediction", (const char *)&unk_21AC29AE5, buf, 2u);
  }

  return v38;
}

- (id)predictForMessage:(id)a3 heads:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ABF4000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "QuickResponsesForMessageFeaturization", " enableTelemetry=YES ", buf, 2u);
  }

  -[SGQuickResponsesTransformerInstance featurizer](self->_transformer, "featurizer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGQuickResponsesTransformerInstance source](self->_transformer, "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGQuickResponsesModel featuresOf:withFeaturizer:source:](SGQuickResponsesModel, "featuresOf:withFeaturizer:source:", v7, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  sgLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v21 = 0;
    _os_signpost_emit_with_name_impl(&dword_21ABF4000, v16, OS_SIGNPOST_INTERVAL_END, v9, "QuickResponsesForMessageFeaturization", (const char *)&unk_21AC29AE5, v21, 2u);
  }

  if (v14)
  {
    objc_msgSend(v14, "vector");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMultiHeadInference predictForVector:heads:](self, "predictForVector:heads:", v17, v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Could not featurize", v20, 2u);
    }
    v18 = 0;
  }

  return v18;
}

- (id)_getMergedPromptForMessage:(id)a3 conversationTurns:(id)a4
{
  SGQuickResponsesConfig *config;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  config = self->_config;
  v6 = a4;
  v7 = a3;
  -[SGQuickResponsesConfig predictionParams](config, "predictionParams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "maxPromptLength");
  objc_msgSend(v8, "maxPromptWindowSeconds");
  v11 = v10;
  objc_msgSend(v8, "promptJoiningString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGConversationTracker getMergedPromptForMessage:conversationTurns:maxPromptLength:maxPromptWindowSeconds:promptJoiningString:](SGConversationTracker, "getMergedPromptForMessage:conversationTurns:maxPromptLength:maxPromptWindowSeconds:promptJoiningString:", v7, v6, v9, v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)predictForMessage:(id)a3 conversationTurns:(id)a4 language:(id)a5 heads:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  int v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  -[SGQuickResponsesConfig predictionParams](self->_config, "predictionParams");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "maxPromptLength");

  if (objc_msgSend(v9, "length") <= v13)
  {
    -[SGMultiHeadInference _getMergedPromptForMessage:conversationTurns:](self, "_getMergedPromptForMessage:conversationTurns:", v9, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length") <= v13)
    {
      -[SGMultiHeadInference predictForMessage:heads:](self, "predictForMessage:heads:", v15, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        v17 = 134217984;
        v18 = v13;
        _os_log_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Returning nil because merged message length exceeds maximum length %ld", (uint8_t *)&v17, 0xCu);
      }
      v14 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v17 = 134217984;
      v18 = v13;
      _os_log_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Returning nil because message length exceeds maximum length %ld", (uint8_t *)&v17, 0xCu);
    }
    v14 = 0;
  }

  return v14;
}

- (id)quickResponsesForMessage:(id)a3 conversationTurns:(id)a4 maxResponses:(unint64_t)a5 language:(id)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  _QWORD v34[4];
  id v35;
  void *v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  _QWORD v41[3];

  v41[2] = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v41[0] = CFSTR("outputLabels");
  v41[1] = CFSTR("PREDICTION_REPLIES");
  v11 = (void *)MEMORY[0x24BDBCE30];
  v12 = a4;
  v13 = a3;
  objc_msgSend(v11, "arrayWithObjects:count:", v41, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMultiHeadInference predictForMessage:conversationTurns:language:heads:](self, "predictForMessage:conversationTurns:language:heads:", v13, v12, v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[SGQuickResponsesConfig modelHeads](self->_config, "modelHeads");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("outputLabels"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      v18 = CFSTR("outputLabels");
    else
      v18 = CFSTR("PREDICTION_REPLIES");
    v19 = v18;

    -[SGQuickResponsesConfig modelHeads](self->_config, "modelHeads");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "labels");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "objectForKeyedSubscript:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");
    v25 = objc_msgSend(v22, "count");

    if (v24 == v25)
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("score"), 0);
      objc_msgSend(v15, "objectForKeyedSubscript:", v19);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v26;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "sortedArrayUsingDescriptors:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "subarrayWithRange:", 0, a5);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __89__SGMultiHeadInference_quickResponsesForMessage_conversationTurns_maxResponses_language___block_invoke;
      v34[3] = &unk_24DDC4EC8;
      v35 = v10;
      objc_msgSend(v30, "_pas_mappedArrayWithTransform:", v34);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", v19);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218240;
        v38 = objc_msgSend(v33, "count");
        v39 = 2048;
        v40 = objc_msgSend(v22, "count");
        _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Predicted output space does not match number of labels for output space %lu != %lu", buf, 0x16u);

      }
      v31 = 0;
    }

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headDimensionality, 0);
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

SGQuickResponse *__89__SGMultiHeadInference_quickResponsesForMessage_conversationTurns_maxResponses_language___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SGQuickResponse *v4;
  void *v5;
  SGQuickResponse *v6;
  uint64_t v8;

  v3 = a2;
  v4 = [SGQuickResponse alloc];
  objc_msgSend(v3, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  BYTE2(v8) = 0;
  LOWORD(v8) = 0;
  v6 = -[SGQuickResponse initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:](v4, "initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:", v5, *(_QWORD *)(a1 + 32), 0, 0, 0, 0, 0, v8);

  return v6;
}

SGMultiHeadPredictionItem *__47__SGMultiHeadInference_predictForVector_heads___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  SGMultiHeadPredictionItem *v7;
  SGMultiHeadPredictionItem *v8;
  uint64_t v9;
  SGMultiHeadPredictionItem *v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  v7 = [SGMultiHeadPredictionItem alloc];
  v8 = v7;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = -[SGMultiHeadPredictionItem initWithScore:label:](v8, "initWithScore:label:", v6, v9);

    v6 = (id)v9;
  }
  else
  {
    v10 = -[SGMultiHeadPredictionItem initWithScore:label:](v7, "initWithScore:label:", v6, 0);
  }

  return v10;
}

+ (id)quickResponsesForMessage:(id)a3 conversationTurns:(id)a4 maxResponses:(unint64_t)a5 localeIdentifier:(id)a6 plistPath:(id)a7 espressoModelPath:(id)a8 vocabPath:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  SGMultiHeadInference *v21;
  SGMultiHeadInference *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint8_t *v26;
  __int16 v28;
  __int16 v29;
  __int16 v30;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  if (!objc_msgSend(v17, "length"))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v30 = 0;
    v24 = MEMORY[0x24BDACB70];
    v25 = "Plist path not specified";
    v26 = (uint8_t *)&v30;
LABEL_12:
    _os_log_error_impl(&dword_21ABF4000, v24, OS_LOG_TYPE_ERROR, v25, v26, 2u);
    goto LABEL_13;
  }
  if (!objc_msgSend(v18, "length"))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v29 = 0;
    v24 = MEMORY[0x24BDACB70];
    v25 = "Espresso model path not specified";
    v26 = (uint8_t *)&v29;
    goto LABEL_12;
  }
  if (!objc_msgSend(v14, "length"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v28 = 0;
      v24 = MEMORY[0x24BDACB70];
      v25 = "Message has no content to predict on";
      v26 = (uint8_t *)&v28;
      goto LABEL_12;
    }
LABEL_13:
    v23 = 0;
    goto LABEL_16;
  }
  +[SGLanguageDetection languageForLocaleIdentifier:](SGLanguageDetection, "languageForLocaleIdentifier:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[SGMultiHeadInference initWithLanguage:inputName:plistPath:espressoModelPath:vocabPath:]([SGMultiHeadInference alloc], "initWithLanguage:inputName:plistPath:espressoModelPath:vocabPath:", v20, CFSTR("inputSequence"), v17, v18, v19);
  v22 = v21;
  if (v21)
  {
    -[SGMultiHeadInference quickResponsesForMessage:conversationTurns:maxResponses:language:](v21, "quickResponsesForMessage:conversationTurns:maxResponses:language:", v14, v15, a5, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }

LABEL_16:
  return v23;
}

+ (id)predictForMessage:(id)a3 conversationTurns:(id)a4 localeIdentifier:(id)a5 plistPath:(id)a6 espressoBinPath:(id)a7 vocabPath:(id)a8 heads:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  SGMultiHeadInference *v22;
  SGMultiHeadInference *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  uint8_t *v27;
  __int16 v29;
  __int16 v30;
  __int16 v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (!objc_msgSend(v17, "length"))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v31 = 0;
    v25 = MEMORY[0x24BDACB70];
    v26 = "Plist path not specified";
    v27 = (uint8_t *)&v31;
LABEL_12:
    _os_log_error_impl(&dword_21ABF4000, v25, OS_LOG_TYPE_ERROR, v26, v27, 2u);
    goto LABEL_13;
  }
  if (!objc_msgSend(v18, "length"))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v30 = 0;
    v25 = MEMORY[0x24BDACB70];
    v26 = "Espresso model path not specified";
    v27 = (uint8_t *)&v30;
    goto LABEL_12;
  }
  if (!objc_msgSend(v14, "length"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v29 = 0;
      v25 = MEMORY[0x24BDACB70];
      v26 = "Message has no content to predict on";
      v27 = (uint8_t *)&v29;
      goto LABEL_12;
    }
LABEL_13:
    v24 = 0;
    goto LABEL_16;
  }
  +[SGLanguageDetection languageForLocaleIdentifier:](SGLanguageDetection, "languageForLocaleIdentifier:", v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[SGMultiHeadInference initWithLanguage:inputName:plistPath:espressoBinPath:vocabPath:]([SGMultiHeadInference alloc], "initWithLanguage:inputName:plistPath:espressoBinPath:vocabPath:", v21, CFSTR("inputSequence"), v17, v18, v19);
  v23 = v22;
  if (v22)
  {
    -[SGMultiHeadInference predictForMessage:conversationTurns:language:heads:](v22, "predictForMessage:conversationTurns:language:heads:", v14, v15, v21, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

LABEL_16:
  return v24;
}

@end
