@implementation ATXDigestOnboardingSuggestionMetricsLogger

- (ATXDigestOnboardingSuggestionMetricsLogger)init
{
  void *v3;
  ATXDigestOnboardingSuggestionMetricsLogger *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXDigestOnboardingSuggestionMetricsLogger initWithDigestOnboardingSuggestionLoggingBiomeStream:](self, "initWithDigestOnboardingSuggestionLoggingBiomeStream:", v3);

  return v4;
}

- (ATXDigestOnboardingSuggestionMetricsLogger)initWithDigestOnboardingSuggestionLoggingBiomeStream:(id)a3
{
  id v5;
  ATXDigestOnboardingSuggestionMetricsLogger *v6;
  ATXDigestOnboardingSuggestionMetricsLogger *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXDigestOnboardingSuggestionMetricsLogger;
  v6 = -[ATXDigestOnboardingSuggestionMetricsLogger init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_digestOnboardingSuggestionLoggingBiomeStream, a3);

  return v7;
}

- (id)digestOnboardingSuggestionBookmark
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(MEMORY[0x1E0CF94D8], "bookmarksPathFile:", CFSTR("digestOnboardingSuggestionBookmark"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initFileURLWithPath:", v3);

  objc_msgSend(MEMORY[0x1E0CF94A0], "bookmarkFromURLPath:maxFileSize:versionNumber:", v4, 1000000, &unk_1E83CDE58);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CF94A0]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithURLPath:versionNumber:bookmark:metadata:", v4, v7, 0, 0);

  }
  return v5;
}

- (void)logDigestOnboardingSuggestionMetricsWithXPCActivity:(id)a3
{
  id v4;
  void *v5;
  ATXDigestOnboardingSuggestionLoggingBiomeStream *digestOnboardingSuggestionLoggingBiomeStream;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;

  v4 = a3;
  -[ATXDigestOnboardingSuggestionMetricsLogger digestOnboardingSuggestionBookmark](self, "digestOnboardingSuggestionBookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  digestOnboardingSuggestionLoggingBiomeStream = self->_digestOnboardingSuggestionLoggingBiomeStream;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[ATXDigestOnboardingSuggestionLoggingBiomeStream publisherFromStartTime:](digestOnboardingSuggestionLoggingBiomeStream, "publisherFromStartTime:", v7 + -1209600.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  objc_msgSend(v5, "bookmark");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __98__ATXDigestOnboardingSuggestionMetricsLogger_logDigestOnboardingSuggestionMetricsWithXPCActivity___block_invoke;
  v17[3] = &unk_1E82DC7A8;
  v19 = v20;
  v17[4] = self;
  v11 = v5;
  v18 = v11;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __98__ATXDigestOnboardingSuggestionMetricsLogger_logDigestOnboardingSuggestionMetricsWithXPCActivity___block_invoke_16;
  v14[3] = &unk_1E82DC7D0;
  v12 = v4;
  v15 = v12;
  v16 = v20;
  v13 = (id)objc_msgSend(v8, "drivableSinkWithBookmark:completion:shouldContinue:", v9, v17, v14);

  _Block_object_dispose(v20, 8);
}

void __98__ATXDigestOnboardingSuggestionMetricsLogger_logDigestOnboardingSuggestionMetricsWithXPCActivity___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_INFO, "%@ - XPC Activity deferred, terminating.", (uint8_t *)&v8, 0xCu);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setBookmark:", v4);
  objc_msgSend(*(id *)(a1 + 32), "writeBookmarkToFile:", *(_QWORD *)(a1 + 40));

}

uint64_t __98__ATXDigestOnboardingSuggestionMetricsLogger_logDigestOnboardingSuggestionMetricsWithXPCActivity___block_invoke_16(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "sessionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSessionUUID:", v6);

  objc_msgSend(v3, "outcome");
  ATXDigestOnboardingSuggestionOutcomeToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOutcome:", v7);

  objc_msgSend(v3, "timeToResolution");
  objc_msgSend(v4, "setTimeToResolution:");
  objc_msgSend(v4, "logToCoreAnalytics");
  v8 = objc_msgSend(*(id *)(a1 + 32), "didDefer");
  if (v8)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v9 = v8 ^ 1u;

  return v9;
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
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ATXDigestOnboardingAppSelectionMetricsLogger writeBookmarkToFile:].cold.1((uint64_t)self, (uint64_t)v4, v5);

  }
}

- (void)logDigestOnboardingSuggestionMetrics
{
  -[ATXDigestOnboardingSuggestionMetricsLogger logDigestOnboardingSuggestionMetricsWithXPCActivity:](self, "logDigestOnboardingSuggestionMetricsWithXPCActivity:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestOnboardingSuggestionLoggingBiomeStream, 0);
}

@end
