@implementation ATXFallbackActionsFeedback

- (id)clientModelIds
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_4 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_4, &__block_literal_global_37);
  return (id)sharedInstance__pasExprOnceResult_5;
}

void __44__ATXFallbackActionsFeedback_sharedInstance__block_invoke()
{
  void *v0;
  ATXFallbackActionsFeedback *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_alloc_init(ATXFallbackActionsFeedback);
  v2 = (void *)sharedInstance__pasExprOnceResult_5;
  sharedInstance__pasExprOnceResult_5 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

- (void)receiveUIFeedbackResult:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXFallbackActionsFeedback receiveUIFeedbackResult:histogramManager:](self, "receiveUIFeedbackResult:histogramManager:", v4, v5);

}

- (void)receiveUIFeedbackResult:(id)a3 histogramManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  double v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  double v44;
  NSObject *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
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
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "histogramForLaunchType:", 90);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v7;
  objc_msgSend(v7, "histogramForLaunchType:", 91);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10
    && (v11 = (void *)v10,
        objc_msgSend(v6, "context"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v12,
        v11,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v6, "context");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject timeContext](v14, "timeContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)objc_opt_new();
    __atxlog_handle_feedback();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[ATXFallbackActionsFeedback receiveUIFeedbackResult:histogramManager:].cold.1((uint64_t)self, (uint64_t)v6, v14);
  }

  objc_msgSend(v6, "shownSuggestions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils atxActionsFromProactiveSuggestions:](_ATXActionUtils, "atxActionsFromProactiveSuggestions:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  v49 = v6;
  objc_msgSend(v6, "engagedSuggestions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils atxActionsFromProactiveSuggestions:](_ATXActionUtils, "atxActionsFromProactiveSuggestions:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v22 = v21;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v59;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v59 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * v26), "actionKey");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v28) = 1.0;
        objc_msgSend(v8, "addLaunchWithBundleId:date:timeZone:weight:", v27, v16, 0, v28);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
    }
    while (v24);
  }

  objc_msgSend(v19, "removeObjectsInArray:", v22);
  objc_msgSend(v49, "rejectedSuggestions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils atxActionsFromProactiveSuggestions:](_ATXActionUtils, "atxActionsFromProactiveSuggestions:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v31 = v30;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, v71, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v55;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v55 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v35), "actionKey");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v37) = 3.0;
        objc_msgSend(v9, "addLaunchWithBundleId:date:timeZone:weight:", v36, v16, 0, v37);

        ++v35;
      }
      while (v33 != v35);
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, v71, 16);
    }
    while (v33);
  }

  objc_msgSend(v19, "removeObjectsInArray:", v31);
  v38 = v19;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v70, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v51;
    do
    {
      v42 = 0;
      do
      {
        if (*(_QWORD *)v51 != v41)
          objc_enumerationMutation(v38);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v42), "actionKey");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v44) = 1.0;
        objc_msgSend(v9, "addLaunchWithBundleId:date:timeZone:weight:", v43, v16, 0, v44);

        ++v42;
      }
      while (v40 != v42);
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v70, 16);
    }
    while (v40);
  }
  __atxlog_handle_feedback();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    v46 = (objc_class *)objc_opt_class();
    NSStringFromClass(v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v63 = v47;
    v64 = 2112;
    v65 = v22;
    v66 = 2112;
    v67 = v31;
    v68 = 2112;
    v69 = v38;
    _os_log_impl(&dword_1C9A3B000, v45, OS_LOG_TYPE_DEFAULT, "%@ - feedback for fallback actions processed - Engaged: %@\nExpl Rejected: %@\n Impl Rejected: %@", buf, 0x2Au);

  }
}

- (void)receiveUIFeedbackResult:(NSObject *)a3 histogramManager:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_fault_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_FAULT, "%@ - could not find time context in result: %@", (uint8_t *)&v7, 0x16u);

}

@end
