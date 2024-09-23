@implementation CAXSuggestionProvider

- (id)predictWithPredictionContext:(id)a3 candidateActions:(id)a4 maxSuggestions:(unint64_t)a5
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CAXSuggestion *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  CAXSuggestion *v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)MEMORY[0x24BE79B10];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(v7, "sourceAppName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithOriginatorId:consumerSubType:caxPredictionContext:maxSuggestions:timeout:", v9, 43, v7, a5, 0.5);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79B30]), "initWithConsumerSubType:", 43);
  objc_msgSend(v11, "layoutForRequest:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v12, "allSuggestionsInLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_pas_mappedArrayWithTransform:", &__block_literal_global_1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[CAXSuggestion initWithSuggestedActions:modelVersion:]([CAXSuggestion alloc], "initWithSuggestedActions:modelVersion:", v14, 0);
    objc_msgSend(v12, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAXSuggestion setBlendingCacheUpdateUUID:](v15, "setBlendingCacheUpdateUUID:", v16);

    __atxlog_handle_contextual_actions();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[CAXSuggestion blendingCacheUpdateUUID](v15, "blendingCacheUpdateUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAXSuggestion suggestedActions](v15, "suggestedActions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412546;
      v24 = v18;
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_2196B3000, v17, OS_LOG_TYPE_DEFAULT, "Returning CAXSuggestion with UUID %@ and actions: %@", (uint8_t *)&v23, 0x16u);

    }
  }
  else
  {
    __atxlog_handle_contextual_actions();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[CAXSuggestionProvider predictWithPredictionContext:candidateActions:maxSuggestions:].cold.1((uint64_t)v12, v20);

    v21 = [CAXSuggestion alloc];
    v15 = -[CAXSuggestion initWithSuggestedActions:modelVersion:](v21, "initWithSuggestedActions:modelVersion:", MEMORY[0x24BDBD1A8], 0);
  }

  return v15;
}

id __86__CAXSuggestionProvider_predictWithPredictionContext_candidateActions_maxSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "executableSpecification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executableObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setSuggestionUUID:", v5);
  return v4;
}

- (void)registerModelForRealTimeRequestsWithBlendingLayerServer:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = (void *)MEMORY[0x24BE79B20];
  v5 = a3;
  objc_msgSend(v4, "clientModelIdFromClientModelType:", 43);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerRealTimeSuggestionProviderDelegate:clientModelId:", self, v6);

  __atxlog_handle_contextual_actions();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2196B3000, v7, OS_LOG_TYPE_DEFAULT, "Registered the client model's delegate with the Blending Layer Server", v8, 2u);
  }

}

- (void)pingWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (void)suggestionsForContextualActionSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  uint64_t v12;
  CAXContextualActionsPredictorDriver *v13;
  void *v14;
  CAXContextualActionsPredictorDriver *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  int v35;
  void *v36;
  float v37;
  double v38;
  uint64_t v39;
  CAXContextualAction *v40;
  void *v41;
  CAXContextualAction *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  objc_class *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  CAXContextualActionsPredictorDriver *v57;
  void *v58;
  void (**v59)(id, void *);
  id v60;
  id v61;
  CAXSuggestionProvider *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[5];
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  uint64_t v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;
  _QWORD v81[3];

  v81[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  objc_msgSend(MEMORY[0x24BE79B20], "clientModelIdFromClientModelType:", 43);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", v11) & 1) != 0)
  {
    v62 = self;
    objc_msgSend(v8, "caxPredictionContext");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = [CAXContextualActionsPredictorDriver alloc];
    +[CAXContextualActionsPredictor defaultConfigFileUrl](CAXContextualActionsPredictor, "defaultConfigFileUrl");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CAXContextualActionsPredictorDriver initWithConfigUrl:](v13, "initWithConfigUrl:", v14);

    v64 = (void *)v12;
    -[CAXContextualActionsPredictorDriver predictWithConfidenceFromContext:numActions:](v15, "predictWithConfidenceFromContext:numActions:", v12, objc_msgSend(v8, "maxSuggestions"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_contextual_actions();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2196B3000, v17, OS_LOG_TYPE_DEFAULT, "Prediction Driver finished with results.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v16;
    if (v16 && objc_msgSend(v16, "count"))
    {
      v57 = v15;
      v59 = v10;
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v16, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v20 = v16;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v73 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * i), "encodedActionIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v25);

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
        }
        while (v22);
      }
      v58 = v11;
      v60 = v9;
      v61 = v8;

      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v26 = v20;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v69;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v69 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
            objc_msgSend(v31, "encodedActionIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v18, "containsObject:", v32);

            if ((v33 & 1) == 0)
            {
              objc_msgSend(v31, "priorTotal");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v34, "intValue");

              if (v35 < 501)
              {
                v39 = 1;
              }
              else
              {
                objc_msgSend(v31, "normalizedFrequency");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "floatValue");
                v38 = v37;

                if (v38 <= 0.1)
                  v39 = 2;
                else
                  v39 = 3;
              }
              v40 = [CAXContextualAction alloc];
              objc_msgSend(v31, "encodedActionIdentifier");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = -[CAXContextualAction initWithActionIdentifier:confidence:parameters:](v40, "initWithActionIdentifier:confidence:parameters:", v41, v39, 0);

              objc_msgSend(v65, "addObject:", v42);
              objc_msgSend(v31, "encodedActionIdentifier");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v43);

            }
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
        }
        while (v28);
      }

      v9 = v60;
      v8 = v61;
      v11 = v58;
      v10 = v59;
      v15 = v57;
    }
    __atxlog_handle_contextual_actions();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = objc_msgSend(v65, "count");
      *(_DWORD *)buf = 134217984;
      v77 = v45;
      _os_log_impl(&dword_2196B3000, v44, OS_LOG_TYPE_DEFAULT, "Converting %lu suggestions into ProactiveSuggestions.", buf, 0xCu);
    }

    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79B28]), "initWithClientModelId:clientModelVersion:", v9, CFSTR("1.0"));
    v66[0] = MEMORY[0x24BDAC760];
    v66[1] = 3221225472;
    v66[2] = __93__CAXSuggestionProvider_suggestionsForContextualActionSuggestionRequest_clientModelId_reply___block_invoke;
    v66[3] = &unk_24DB31088;
    v66[4] = v62;
    v67 = v46;
    v47 = v46;
    objc_msgSend(v65, "_pas_mappedArrayWithTransform:", v66);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79B60]), "initWithSuggestions:feedbackMetadata:originalRequest:responseCode:error:", v48, 0, v8, 2, 0);
    v10[2](v10, v49);

    v50 = v63;
    v51 = v64;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Wrong delegate for request. Expected %@ but found %@."), v9, v11);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)MEMORY[0x24BDD1540];
    v53 = (objc_class *)objc_opt_class();
    NSStringFromClass(v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = *MEMORY[0x24BDD0FC8];
    v81[0] = v51;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v81, &v80, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "errorWithDomain:code:userInfo:", v54, 5, v55);
    v56 = objc_claimAutoreleasedReturnValue();

    v15 = (CAXContextualActionsPredictorDriver *)v56;
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79B60]), "initWithSuggestions:feedbackMetadata:originalRequest:responseCode:error:", 0, 0, v8, 3, v56);
    v10[2](v10, v50);
  }

}

uint64_t __93__CAXSuggestionProvider_suggestionsForContextualActionSuggestionRequest_clientModelId_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "proactiveSuggestionForCaxContextualAction:clientModelSpec:", a2, *(_QWORD *)(a1 + 40));
}

- (id)proactiveSuggestionForCaxContextualAction:(id)a3 clientModelSpec:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "confidence") == 3)
  {
    v7 = 4;
  }
  else if (objc_msgSend(v5, "confidence") == 2)
  {
    v7 = 3;
  }
  else
  {
    v7 = 2;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79B48]), "initWithRawScore:suggestedConfidenceCategory:", v7, 1.0);
  v9 = objc_alloc(MEMORY[0x24BE79B38]);
  objc_msgSend(v5, "jsonRawData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v5, v11, v12, 7);

  v14 = objc_alloc(MEMORY[0x24BE79B50]);
  objc_msgSend(v5, "actionIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE79B40], "layoutConfigurationsForLayoutOptions:", 32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithTitle:subtitle:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:", v15, 0, v16, 0, 0, 0);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79B18]), "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v6, v13, v17, v8);
  return v18;
}

- (void)recordShortcutsEditorEvent:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  __atxlog_handle_blending();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_2196B3000, v4, OS_LOG_TYPE_DEFAULT, "Sending shortcuts editor event to Blending: %@", (uint8_t *)&v7, 0xCu);
  }

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "donateUIInteractionEvent:", v3);

  __atxlog_handle_blending();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_2196B3000, v6, OS_LOG_TYPE_DEFAULT, "Done sending shortcuts editor event to Blending.", (uint8_t *)&v7, 2u);
  }

}

- (void)predictWithPredictionContext:(uint64_t)a1 candidateActions:(NSObject *)a2 maxSuggestions:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_2196B3000, a2, OS_LOG_TYPE_FAULT, "Returned layout was nil or of unknown type: %@", (uint8_t *)&v2, 0xCu);
}

@end
