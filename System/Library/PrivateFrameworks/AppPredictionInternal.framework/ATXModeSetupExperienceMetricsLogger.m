@implementation ATXModeSetupExperienceMetricsLogger

- (ATXModeSetupExperienceMetricsLogger)init
{
  ATXModeSetupExperienceMetricsLogger *v2;
  uint64_t v3;
  ATXModeConfigurationUIFlowLoggingBiomeStream *stream;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXModeSetupExperienceMetricsLogger;
  v2 = -[ATXModeSetupExperienceMetricsLogger init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    stream = v2->_stream;
    v2->_stream = (ATXModeConfigurationUIFlowLoggingBiomeStream *)v3;

  }
  return v2;
}

- (id)generateBookmarkURLPath
{
  NSURL *bookmarkURLPath;
  NSURL *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  bookmarkURLPath = self->_bookmarkURLPath;
  if (bookmarkURLPath)
  {
    v3 = bookmarkURLPath;
  }
  else
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF94D8], "metricsRootDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0C99E98]);
    objc_msgSend(v6, "stringByAppendingPathComponent:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (NSURL *)objc_msgSend(v7, "initFileURLWithPath:", v8);

  }
  return v3;
}

- (id)generateBookmark
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CF94A0];
  -[ATXModeSetupExperienceMetricsLogger generateBookmarkURLPath](self, "generateBookmarkURLPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bookmarkFromURLPath:maxFileSize:versionNumber:", v4, 3000000, &unk_1E83CD408);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CF94A0]);
    -[ATXModeSetupExperienceMetricsLogger generateBookmarkURLPath](self, "generateBookmarkURLPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithURLPath:versionNumber:bookmark:metadata:", v7, &unk_1E83CD408, 0, 0);

  }
  return v5;
}

- (void)writeBookmarkToFile:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v6 = 0;
  objc_msgSend(a3, "saveBookmarkWithError:", &v6);
  v4 = v6;
  if (v4)
  {
    __atxlog_handle_modes();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ATXModeSetupExperienceMetricsLogger writeBookmarkToFile:].cold.1((uint64_t)self, (uint64_t)v4, v5);

  }
}

- (void)logMetrics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  ATXModeSetupExperienceMetricsLogger *v16;

  objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupExperienceMetricsLogger generateBookmark](self, "generateBookmark");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupExperienceMetricsLogger stream](self, "stream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publisherFromStartTime:", 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filterWithIsIncluded:", &__block_literal_global_146);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bookmark");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__ATXModeSetupExperienceMetricsLogger_logMetrics__block_invoke_2;
  v14[3] = &unk_1E82E6280;
  v15 = v4;
  v16 = self;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__ATXModeSetupExperienceMetricsLogger_logMetrics__block_invoke_10;
  v12[3] = &unk_1E82DB0C8;
  v9 = v3;
  v10 = v4;
  v11 = (id)objc_msgSend(v7, "sinkWithBookmark:completion:receiveInput:", v8, v14, v12);

}

BOOL __49__ATXModeSetupExperienceMetricsLogger_logMetrics__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "modeConfigurationUI") == 2;

  return v3;
}

void __49__ATXModeSetupExperienceMetricsLogger_logMetrics__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else if (!objc_msgSend(v5, "state"))
  {
    goto LABEL_7;
  }
  __atxlog_handle_modes();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __49__ATXModeSetupExperienceMetricsLogger_logMetrics__block_invoke_2_cold_1(v5, v8);

LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "setBookmark:", v6);
  objc_msgSend(*(id *)(a1 + 40), "writeBookmarkToFile:", *(_QWORD *)(a1 + 32));

}

void __49__ATXModeSetupExperienceMetricsLogger_logMetrics__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v16 = v3;
  objc_msgSend(v3, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dndModeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dndModeForDNDModeWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v7, "semanticType");
    DNDModeSemanticTypeToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setModeSemanticType:", v9);

    objc_msgSend(v16, "eventBody");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "suggestedEntityIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "eventBody");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentEntityIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "differenceFromArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hasChanges");

    objc_msgSend(v8, "setOnboardingOutcome:", v15 ^ 1u);
    objc_msgSend(v8, "sendToCoreAnalytics");

  }
}

- (ATXModeConfigurationUIFlowLoggingBiomeStream)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
  objc_storeStrong((id *)&self->_stream, a3);
}

- (NSURL)bookmarkURLPath
{
  return self->_bookmarkURLPath;
}

- (void)setBookmarkURLPath:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarkURLPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkURLPath, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

- (void)writeBookmarkToFile:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 138412546;
  v7 = (id)objc_opt_class();
  v8 = 2112;
  v9 = a2;
  v5 = v7;
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "%@: Unable to save bookmark due to : %@", (uint8_t *)&v6, 0x16u);

}

void __49__ATXModeSetupExperienceMetricsLogger_logMetrics__block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v5, 0xCu);

}

@end
