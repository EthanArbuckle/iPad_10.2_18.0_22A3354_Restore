@implementation ATXLinkActionPreprocessor

- (id)preprocessedSuggestionsUpdatingLinkActions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "executableSpecification", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "executableType");

        if (v13 == 10)
        {
          -[ATXLinkActionPreprocessor updatedLinkActionSuggestion:](self, "updatedLinkActionSuggestion:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v5, "addObject:", v14);

        }
        else
        {
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)updatedLinkActionSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v16;

  v4 = a3;
  objc_msgSend(v4, "executableSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executableObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "executableSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "executableObject");
    v9 = objc_claimAutoreleasedReturnValue();

    -[NSObject bundleId](v9, "bundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    +[ATXLinkTranscriptUtil linkTranscriptPublisherForBundleId:fromDate:toDate:maxEvents:reversed:error:](ATXLinkTranscriptUtil, "linkTranscriptPublisherForBundleId:fromDate:toDate:maxEvents:reversed:error:", v10, 0, 0, 0, 1, &v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v16;

    if (v12)
    {
      __atxlog_handle_blending();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ATXLinkActionPreprocessor updatedLinkActionSuggestion:].cold.1(v9, v13);

      v14 = 0;
    }
    else
    {
      -[ATXLinkActionPreprocessor updatedLinkActionSuggestion:actionContainer:basedOnReversedPublisher:](self, "updatedLinkActionSuggestion:actionContainer:basedOnReversedPublisher:", v4, v9, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    __atxlog_handle_blending();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXLinkActionPreprocessor updatedLinkActionSuggestion:].cold.2(v4);
    v14 = 0;
  }

  return v14;
}

- (id)updatedLinkActionSuggestion:(id)a3 actionContainer:(id)a4 basedOnReversedPublisher:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint64_t *v44;
  uint64_t *v45;
  _QWORD v46[4];
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__105;
  v58 = __Block_byref_object_dispose__105;
  v59 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__105;
  v52 = __Block_byref_object_dispose__105;
  v53 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __98__ATXLinkActionPreprocessor_updatedLinkActionSuggestion_actionContainer_basedOnReversedPublisher___block_invoke;
  v46[3] = &unk_1E82DAF68;
  v47 = v7;
  v41[0] = v10;
  v41[1] = 3221225472;
  v41[2] = __98__ATXLinkActionPreprocessor_updatedLinkActionSuggestion_actionContainer_basedOnReversedPublisher___block_invoke_8;
  v41[3] = &unk_1E82EB7C8;
  v44 = &v48;
  v11 = v8;
  v42 = v11;
  v12 = v47;
  v43 = v12;
  v45 = &v54;
  v13 = (id)objc_msgSend(v9, "drivableSinkWithBookmark:completion:shouldContinue:", 0, v46, v41);
  if (v55[5])
  {
    objc_msgSend(v12, "executableSpecification");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0D811A8]);
    v16 = v49[5];
    -[NSObject executableDescription](v14, "executableDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject executableIdentifier](v14, "executableIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v15, "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v16, v17, v18, -[NSObject executableType](v14, "executableType"));
    v35 = v11;
    v36 = v9;

    objc_msgSend(v12, "uiSpecification");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_alloc(MEMORY[0x1E0D811D0]);
    objc_msgSend((id)v55[5], "title");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "atx_efficientLocalizedString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v55[5], "subtitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "atx_efficientLocalizedString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "reason");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "preferredLayoutConfigs");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v19, "allowedOnLockscreen");
    v25 = objc_msgSend(v19, "allowedOnHomeScreen");
    LOBYTE(v16) = objc_msgSend(v19, "allowedOnSpotlight");
    BYTE1(v34) = objc_msgSend(v19, "shouldClearOnEngagement");
    LOBYTE(v34) = v16;
    v26 = (void *)objc_msgSend(v37, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:", v39, v21, v22, v23, v24, v25, v34, objc_msgSend(v19, "predictionReasons"));

    v27 = objc_alloc(MEMORY[0x1E0D81190]);
    objc_msgSend(v12, "clientModelSpecification");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scoreSpecification");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v27, "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v28, v38, v26, v29);

    v11 = v35;
    v9 = v36;
    v31 = v14;
  }
  else
  {
    __atxlog_handle_blending();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[ATXLinkActionPreprocessor updatedLinkActionSuggestion:actionContainer:basedOnReversedPublisher:].cold.1((uint64_t)v12, v31, v32);
    v30 = 0;
  }

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);

  return v30;
}

void __98__ATXLinkActionPreprocessor_updatedLinkActionSuggestion_actionContainer_basedOnReversedPublisher___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_blending();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __98__ATXLinkActionPreprocessor_updatedLinkActionSuggestion_actionContainer_basedOnReversedPublisher___block_invoke_cold_1(v2);

  }
}

BOOL __98__ATXLinkActionPreprocessor_updatedLinkActionSuggestion_actionContainer_basedOnReversedPublisher___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL8 v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CF8F08]);
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "initWithBundleId:action:", v5, v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)))
  {
    objc_msgSend(v3, "predictions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v12 = v11 == 0;
    if (v11)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "displayRepresentation");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "image");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setImage:", v17);
    }
    else
    {
      __atxlog_handle_blending();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 40);
        v20 = 138412290;
        v21 = v18;
        _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "Blending: Skipping matching Link action event that's not predictable in transcript of %@", (uint8_t *)&v20, 0xCu);
      }
    }

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (void)updatedLinkActionSuggestion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, v4, "Blending: Error setting up stream for Link transcript of %@", (uint8_t *)&v5);

}

- (void)updatedLinkActionSuggestion:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a1, "executableSpecification");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "executableClassString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v2, v3, "Blending: Link action suggestion does not have executable type ATXLinkActionContainer: %@, has type: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)updatedLinkActionSuggestion:(uint64_t)a1 actionContainer:(NSObject *)a2 basedOnReversedPublisher:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, a3, "Blending: Unable to find predictable Link suggestion in transcript: %@", (uint8_t *)&v3);
}

void __98__ATXLinkActionPreprocessor_updatedLinkActionSuggestion_actionContainer_basedOnReversedPublisher___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v2, v3, "Blending: Error creating sink for Link transcript %@ for %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

@end
