@implementation ATXModeCorrelatedAppsDataSource

- (ATXModeCorrelatedAppsDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXModeCorrelatedAppsDataSource *v6;
  ATXModeCorrelatedAppsDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXModeCorrelatedAppsDataSource;
  v6 = -[ATXModeCorrelatedAppsDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (void)modeCorrelatedAppsInCurrentModeWithCallback:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D80E48], "currentModeEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "atx_dndModeSemanticType");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", DNDModeSemanticTypeToATXActivityType());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v5, "timestamp");
    v9 = (void *)objc_msgSend(v8, "initWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v9 = 0;
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D80E50], "currentModeEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v10, "timestamp");
    v12 = (void *)objc_msgSend(v11, "initWithTimeIntervalSinceReferenceDate:");
    v13 = v12;
    if (v9)
    {
      objc_msgSend(v12, "timeIntervalSinceDate:", v9);
      if (v14 <= 0.0)
      {
LABEL_13:

        goto LABEL_14;
      }
      v15 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "eventBody");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "modeType");
      objc_msgSend(v15, "numberWithUnsignedInteger:", BMUserFocusInferredModeTypeToActivity());
      v17 = objc_claimAutoreleasedReturnValue();

      v18 = v13;
      __atxlog_handle_heuristic();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v20 = "ATXModeCorrelatedAppsDataSource: using more recent mode event from inferred stream instead";
LABEL_11:
        _os_log_impl(&dword_1C99DF000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
      }
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "eventBody");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "modeType");
      objc_msgSend(v21, "numberWithUnsignedInteger:", BMUserFocusInferredModeTypeToActivity());
      v17 = objc_claimAutoreleasedReturnValue();

      v23 = v13;
      __atxlog_handle_heuristic();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v20 = "ATXModeCorrelatedAppsDataSource: using latest mode event from inferred stream";
        goto LABEL_11;
      }
    }

    v9 = v13;
    v7 = (void *)v17;
    goto LABEL_13;
  }
LABEL_14:
  if (!v7)
  {
    __atxlog_handle_heuristic();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = 0;
      _os_log_impl(&dword_1C99DF000, v27, OS_LOG_TYPE_DEFAULT, "ATXModeCorrelatedAppsDataSource: user not currently in a mode: %@", buf, 0xCu);
    }

    goto LABEL_22;
  }
  objc_msgSend(v7, "integerValue");
  v24 = ATXModeFromActivityType();
  __atxlog_handle_heuristic();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (v24 == 12)
  {
    if (v26)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v25, OS_LOG_TYPE_DEFAULT, "ATXModeCorrelatedAppsDataSource: user currently in custom mode, returning no apps", buf, 2u);
    }

LABEL_22:
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v3 + 2))(v3, 0, 0, 0);
    goto LABEL_29;
  }
  if (v26)
  {
    ATXModeToString();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v39 = v28;
    _os_log_impl(&dword_1C99DF000, v25, OS_LOG_TYPE_DEFAULT, "ATXModeCorrelatedAppsDataSource: user currently in %@ mode", buf, 0xCu);

  }
  v29 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v30 = (void *)objc_msgSend(v29, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v30, "objectForKey:", CFSTR("ATXModeRelevanceScoreThresholdOverride"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v30, "doubleForKey:", CFSTR("ATXModeRelevanceScoreThresholdOverride"));
    v33 = v32;
  }
  else
  {
    v33 = 0x3FE4CCCCCCCCCCCDLL;
  }
  v34 = (void *)objc_opt_new();
  objc_msgSend(v34, "rankedAppsForMode:", v24);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __79__ATXModeCorrelatedAppsDataSource_modeCorrelatedAppsInCurrentModeWithCallback___block_invoke;
  v37[3] = &__block_descriptor_40_e36___NSString_16__0__ATXAppModeEntity_8l;
  v37[4] = v33;
  objc_msgSend(v35, "_pas_mappedArrayWithTransform:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  (*((void (**)(id, void *, void *, _QWORD))v3 + 2))(v3, v36, v9, 0);
LABEL_29:

}

id __79__ATXModeCorrelatedAppsDataSource_modeCorrelatedAppsInCurrentModeWithCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "scoreMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "score");
  v6 = v5;
  v7 = *(double *)(a1 + 32);

  if (v6 <= v7)
  {
    v12 = 0;
  }
  else
  {
    __atxlog_handle_heuristic();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "bundleId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "scoreMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "score");
      v14 = 138412546;
      v15 = v9;
      v16 = 2048;
      v17 = v11;
      _os_log_impl(&dword_1C99DF000, v8, OS_LOG_TYPE_DEFAULT, "ATXModeCorrelatedAppsDataSource: %@ passes threshold with score: %f", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(v3, "bundleId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
