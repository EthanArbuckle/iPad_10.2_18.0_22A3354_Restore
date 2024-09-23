@implementation ATXAppDirectoryResponse

- (NSArray)recentAppsVisible
{
  NSArray *recentApps;
  unint64_t v3;
  uint64_t v4;

  recentApps = self->_recentApps;
  v3 = -[NSArray count](recentApps, "count");
  if (v3 >= 4)
    v4 = 4;
  else
    v4 = v3;
  return -[NSArray subarrayWithRange:](recentApps, "subarrayWithRange:", 0, v4);
}

- (NSArray)recentApps
{
  return self->_recentApps;
}

- (NSArray)predictedApps
{
  return self->_predictedApps;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionLayout, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_hiddenAppsCategory, 0);
  objc_storeStrong((id *)&self->_recentApps, 0);
  objc_storeStrong((id *)&self->_predictedApps, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_bundleIdToSuggestionMapping, 0);
}

- (ATXAppDirectoryResponse)initWithSuggestionLayout:(id)a3 recentApps:(id)a4 hiddenApps:(id)a5 otherAppsOnScreen:(id)a6 numAppsToPredict:(unint64_t)a7 error:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  ATXAppDirectoryResponse *v19;
  ATXAppDirectoryResponse *v20;
  ATXAppDirectoryCategory *v21;
  ATXAppDirectoryCategory *hiddenAppsCategory;
  uint64_t v23;
  NSMutableDictionary *bundleIdToSuggestionMapping;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char isKindOfClass;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  char v43;
  void *v44;
  NSArray *predictedApps;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  NSArray *v49;
  uint64_t v50;
  void **p_error;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *context;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  NSArray *v69;
  const __CFString *userName;
  ATXAppDirectoryResponse *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  objc_super v76;
  uint8_t buf[4];
  void *v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v76.receiver = self;
  v76.super_class = (Class)ATXAppDirectoryResponse;
  v19 = -[ATXAppDirectoryResponse init](&v76, sel_init);
  v20 = v19;
  if (!v19)
    goto LABEL_30;
  objc_storeStrong((id *)&v19->_suggestionLayout, a3);
  objc_storeStrong((id *)&v20->_recentApps, a4);
  v21 = -[ATXAppDirectoryCategory initWithCategoryID:appBundleIDs:]([ATXAppDirectoryCategory alloc], "initWithCategoryID:appBundleIDs:", 7, v16);
  hiddenAppsCategory = v20->_hiddenAppsCategory;
  v20->_hiddenAppsCategory = v21;

  v23 = objc_opt_new();
  bundleIdToSuggestionMapping = v20->_bundleIdToSuggestionMapping;
  v20->_bundleIdToSuggestionMapping = (NSMutableDictionary *)v23;

  v25 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsAppLibraryEnabled"), CFSTR("com.apple.suggestions"));
  if (v25)
  {
    v26 = v25;
    v27 = objc_msgSend(v25, "BOOLValue");

    if (!v27)
    {
      v50 = objc_opt_new();
      predictedApps = v20->_predictedApps;
      v20->_predictedApps = (NSArray *)v50;
      goto LABEL_24;
    }
  }
  v62 = a8;
  v63 = v18;
  v64 = v17;
  v65 = v16;
  v71 = v20;
  v66 = v15;
  v69 = (NSArray *)objc_opt_new();
  context = (void *)MEMORY[0x1A85A4F90]();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v67 = v14;
  objc_msgSend(v14, "allSuggestionsInLayout");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
  if (!v29)
    goto LABEL_19;
  v30 = v29;
  v31 = *(_QWORD *)v73;
  userName = (const __CFString *)*MEMORY[0x1E0C9B260];
  v32 = (const __CFString *)*MEMORY[0x1E0C9B230];
  do
  {
    for (i = 0; i != v30; ++i)
    {
      if (*(_QWORD *)v73 != v31)
        objc_enumerationMutation(v28);
      v34 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
      objc_msgSend(v34, "executableSpecification");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v35, "executableType") == 1)
      {
        objc_msgSend(v34, "executableSpecification");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "executableObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v34, "executableSpecification");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "executableObject");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          v41 = v40;
          v42 = (void *)CFPreferencesCopyValue(CFSTR("SBSearchSuggestAppDisabled"), CFSTR("com.apple.spotlightui"), userName, v32);
          v43 = objc_msgSend(v42, "containsObject:", v41);

          if ((v43 & 1) == 0)
            -[NSArray addObject:](v69, "addObject:", v41);
          -[NSMutableDictionary setObject:forKey:](v71->_bundleIdToSuggestionMapping, "setObject:forKey:", v34, v41);
          goto LABEL_17;
        }
      }
      else
      {

      }
      __atxlog_handle_app_library();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v34;
        _os_log_fault_impl(&dword_1A49EF000, v41, OS_LOG_TYPE_FAULT, "ATXAppDirectoryResponse received suggestion that was not of type app: %@", buf, 0xCu);
      }
LABEL_17:

    }
    v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
  }
  while (v30);
LABEL_19:

  objc_autoreleasePoolPop(context);
  v20 = v71;
  -[ATXAppDirectoryResponse recentAppsVisible](v71, "recentAppsVisible");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  predictedApps = v69;
  -[NSArray removeObjectsInArray:](v69, "removeObjectsInArray:", v44);

  v17 = v64;
  -[NSArray removeObjectsInArray:](v69, "removeObjectsInArray:", v64);
  v46 = -[NSArray count](v69, "count");
  if (v46 >= a7)
    v47 = a7;
  else
    v47 = v46;
  -[NSArray subarrayWithRange:](v69, "subarrayWithRange:", 0, v47);
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = v71->_predictedApps;
  v71->_predictedApps = (NSArray *)v48;

  v15 = v66;
  v14 = v67;
  v16 = v65;
  a8 = v62;
  v18 = v63;
LABEL_24:

  if (v18)
    objc_storeStrong((id *)&v20->_error, a8);
  p_error = (void **)&v20->_error;
  if (v20->_error)
  {
    __atxlog_handle_app_library();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      -[ATXAppDirectoryResponse initWithSuggestionLayout:recentApps:hiddenApps:otherAppsOnScreen:numAppsToPredict:error:].cold.1((uint64_t)&v20->_error, v52, v53, v54, v55, v56, v57, v58);

    v59 = *p_error;
    *p_error = 0;

  }
LABEL_30:

  return v20;
}

- (ATXAppDirectoryResponse)initWithResponse:(id)a3 recentApps:(id)a4 hiddenApps:(id)a5 otherAppsOnScreen:(id)a6 numAppsToPredict:(unint64_t)a7 error:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  ATXAppDirectoryResponse *v20;
  ATXAppDirectoryResponse *v21;
  ATXAppDirectoryCategory *v22;
  ATXAppDirectoryCategory *hiddenAppsCategory;
  uint64_t v24;
  NSMutableDictionary *bundleIdToSuggestionMapping;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *predictedApps;
  void *v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  NSArray *v36;
  uint64_t v37;
  NSError *v38;
  NSError *error;
  void **p_error;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  objc_super v50;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v50.receiver = self;
  v50.super_class = (Class)ATXAppDirectoryResponse;
  v20 = -[ATXAppDirectoryResponse init](&v50, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_response, a3);
    objc_storeStrong((id *)&v21->_recentApps, a4);
    v22 = -[ATXAppDirectoryCategory initWithCategoryID:appBundleIDs:]([ATXAppDirectoryCategory alloc], "initWithCategoryID:appBundleIDs:", 7, v17);
    hiddenAppsCategory = v21->_hiddenAppsCategory;
    v21->_hiddenAppsCategory = v22;

    v24 = objc_opt_new();
    bundleIdToSuggestionMapping = v21->_bundleIdToSuggestionMapping;
    v21->_bundleIdToSuggestionMapping = (NSMutableDictionary *)v24;

    v26 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsAppLibraryEnabled"), CFSTR("com.apple.suggestions"));
    if (!v26)
      goto LABEL_4;
    v27 = v26;
    v28 = objc_msgSend(v26, "BOOLValue");

    if (!v28)
    {
      v37 = objc_opt_new();
      predictedApps = v21->_predictedApps;
      v21->_predictedApps = (NSArray *)v37;
    }
    else
    {
LABEL_4:
      objc_msgSend(v15, "predictedApps");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "_pas_filteredArrayWithTest:", &__block_literal_global_8);
      predictedApps = (void *)objc_claimAutoreleasedReturnValue();

      v31 = (void *)objc_msgSend(predictedApps, "mutableCopy");
      -[ATXAppDirectoryResponse recentAppsVisible](v21, "recentAppsVisible");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "removeObjectsInArray:", v32);

      objc_msgSend(v31, "removeObjectsInArray:", v18);
      v33 = objc_msgSend(v31, "count");
      v34 = v33 >= a7 ? a7 : v33;
      objc_msgSend(v31, "subarrayWithRange:", 0, v34);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = v21->_predictedApps;
      v21->_predictedApps = (NSArray *)v35;

    }
    if (v19)
    {
      v38 = (NSError *)v19;
    }
    else
    {
      objc_msgSend(v15, "error");
      v38 = (NSError *)objc_claimAutoreleasedReturnValue();
    }
    error = v21->_error;
    v21->_error = v38;

    p_error = (void **)&v21->_error;
    if (v21->_error)
    {
      __atxlog_handle_app_library();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        -[ATXAppDirectoryResponse initWithSuggestionLayout:recentApps:hiddenApps:otherAppsOnScreen:numAppsToPredict:error:].cold.1((uint64_t)&v21->_error, v41, v42, v43, v44, v45, v46, v47);

      v48 = *p_error;
      *p_error = 0;

    }
  }

  return v21;
}

uint64_t __107__ATXAppDirectoryResponse_initWithResponse_recentApps_hiddenApps_otherAppsOnScreen_numAppsToPredict_error___block_invoke(uint64_t a1, void *a2)
{
  const __CFString *v2;
  const __CFString *v3;
  id v4;
  void *v5;

  v2 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v3 = (const __CFString *)*MEMORY[0x1E0C9B230];
  v4 = a2;
  v5 = (void *)CFPreferencesCopyValue(CFSTR("SBSearchSuggestAppDisabled"), CFSTR("com.apple.spotlightui"), v2, v3);
  LODWORD(v3) = objc_msgSend(v5, "containsObject:", v4);

  return v3 ^ 1;
}

- (ATXAppDirectoryResponse)initWithoutDedupingForRecents:(id)a3 predictedApps:(id)a4 hiddenApps:(id)a5 error:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXAppDirectoryResponse *v15;
  ATXAppDirectoryResponse *v16;
  ATXAppDirectoryCategory *v17;
  ATXAppDirectoryCategory *hiddenAppsCategory;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ATXAppDirectoryResponse;
  v15 = -[ATXAppDirectoryResponse init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_recentApps, a3);
    v17 = -[ATXAppDirectoryCategory initWithCategoryID:appBundleIDs:]([ATXAppDirectoryCategory alloc], "initWithCategoryID:appBundleIDs:", 7, v13);
    hiddenAppsCategory = v16->_hiddenAppsCategory;
    v16->_hiddenAppsCategory = v17;

    objc_storeStrong((id *)&v16->_predictedApps, a4);
    objc_storeStrong((id *)&v16->_error, a6);
  }

  return v16;
}

- (id)uuidsForBundleIds:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__ATXAppDirectoryResponse_uuidsForBundleIds___block_invoke;
  v4[3] = &unk_1E4D58028;
  v4[4] = self;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __45__ATXAppDirectoryResponse_uuidsForBundleIds___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)uuidForBundleId:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_bundleIdToSuggestionMapping, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)proactiveSuggestionForBundleId:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_bundleIdToSuggestionMapping, "objectForKey:", a3);
}

- (ATXAppDirectoryCategory)hiddenAppsCategory
{
  return self->_hiddenAppsCategory;
}

- (ATXResponse)response
{
  return self->_response;
}

- (ATXSuggestionLayout)suggestionLayout
{
  return self->_suggestionLayout;
}

- (void)initWithSuggestionLayout:(uint64_t)a3 recentApps:(uint64_t)a4 hiddenApps:(uint64_t)a5 otherAppsOnScreen:(uint64_t)a6 numAppsToPredict:(uint64_t)a7 error:(uint64_t)a8 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a2, a3, "ATXAppDirectoryResponse: Attempt to create a response with error %@. Scrubbing the error from the response to allow display of the error-free parts of the response", a5, a6, a7, a8, 2u);
}

@end
