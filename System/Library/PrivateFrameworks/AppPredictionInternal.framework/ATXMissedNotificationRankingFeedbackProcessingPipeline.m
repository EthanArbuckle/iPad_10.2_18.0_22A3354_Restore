@implementation ATXMissedNotificationRankingFeedbackProcessingPipeline

- (ATXMissedNotificationRankingFeedbackProcessingPipeline)init
{
  void *v3;
  void *v4;
  void *v5;
  ATXMissedNotificationRankingFeedbackProcessingPipeline *v6;

  objc_msgSend(MEMORY[0x1E0CF94D8], "metricsRootDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("mnrLoggingBookmark"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_new();
  v6 = -[ATXMissedNotificationRankingFeedbackProcessingPipeline initWithBookmark:path:trackedMNRStream:](self, "initWithBookmark:path:trackedMNRStream:", 0, v4, v5);

  return v6;
}

- (ATXMissedNotificationRankingFeedbackProcessingPipeline)initWithBookmark:(id)a3 path:(id)a4 trackedMNRStream:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXMissedNotificationRankingFeedbackProcessingPipeline *v12;
  ATXMissedNotificationRankingFeedbackProcessingPipeline *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXMissedNotificationRankingFeedbackProcessingPipeline;
  v12 = -[ATXMissedNotificationRankingFeedbackProcessingPipeline init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bookmark, a3);
    objc_storeStrong((id *)&v13->_path, a4);
    objc_storeStrong((id *)&v13->_trackedMNRStream, a5);
    if (!v13->_bookmark)
      -[ATXMissedNotificationRankingFeedbackProcessingPipeline _readBookmarkFromPath](v13, "_readBookmarkFromPath");
  }

  return v13;
}

- (void)logMetricsWithXPCActivity:(id)a3
{
  id v4;
  ATXEngagementTrackedMissedNotificationRankingBiomeStream *trackedMNRStream;
  void *v6;
  void *v7;
  BMBookmark *bookmark;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD v15[7];
  _QWORD v16[4];
  _QWORD v17[3];
  char v18;

  v4 = a3;
  trackedMNRStream = self->_trackedMNRStream;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -172800.0);
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  -[ATXEngagementTrackedMissedNotificationRankingBiomeStream publisherFromStartTime:](trackedMNRStream, "publisherFromStartTime:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  bookmark = self->_bookmark;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__ATXMissedNotificationRankingFeedbackProcessingPipeline_logMetricsWithXPCActivity___block_invoke;
  v15[3] = &unk_1E82DB938;
  v15[4] = self;
  v15[5] = v16;
  v15[6] = v17;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__ATXMissedNotificationRankingFeedbackProcessingPipeline_logMetricsWithXPCActivity___block_invoke_11;
  v11[3] = &unk_1E82E2508;
  v11[4] = self;
  v13 = v16;
  v9 = v4;
  v12 = v9;
  v14 = v17;
  v10 = (id)objc_msgSend(v7, "drivableSinkWithBookmark:completion:shouldContinue:", bookmark, v15, v11);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v17, 8);

}

void __84__ATXMissedNotificationRankingFeedbackProcessingPipeline_logMetricsWithXPCActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  _BOOL4 v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  objc_class *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v9 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    __atxlog_handle_metrics();
    v8 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (!v10)
        goto LABEL_10;
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v20 = 138412546;
      v21 = v12;
      v22 = 2048;
      v23 = v13;
      v14 = "[%@] Stopping missed notification ranking metrics due to XPC deferral.  Logged %lu rankings.";
    }
    else
    {
      if (!v10)
        goto LABEL_10;
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v20 = 138412546;
      v21 = v12;
      v22 = 2048;
      v23 = v16;
      v14 = "[%@] Finished logging missed notification ranking metrics.  Logged %lu digests.";
    }
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v20, 0x16u);

    goto LABEL_10;
  }
  __atxlog_handle_metrics();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __84__ATXMissedNotificationRankingFeedbackProcessingPipeline_logMetricsWithXPCActivity___block_invoke_cold_1(a1, v5, v8);
LABEL_10:

  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(v17 + 8);
  *(_QWORD *)(v17 + 8) = v6;
  v19 = v6;

  objc_msgSend(*(id *)(a1 + 32), "_writeBookmarkToPath");
}

uint64_t __84__ATXMissedNotificationRankingFeedbackProcessingPipeline_logMetricsWithXPCActivity___block_invoke_11(uint64_t a1, uint64_t a2)
{
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "logMetricsForRanking:", a2);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v3 = objc_msgSend(*(id *)(a1 + 40), "didDefer");
  if (v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return v3 ^ 1u;
}

- (void)logMetrics
{
  -[ATXMissedNotificationRankingFeedbackProcessingPipeline logMetricsWithXPCActivity:](self, "logMetricsWithXPCActivity:", 0);
}

- (void)logMetricsForRanking:(id)a3
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  __atxlog_handle_metrics();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v6;
    v26 = 2112;
    v27 = v8;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_INFO, "[%@] Logging metrics for missed notification ranking %@", buf, 0x16u);

  }
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "populateMetricsFromRanking:", v3);
  objc_msgSend(v9, "logToCoreAnalytics");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "rankedGroups", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v15, "digestEngagementTrackingMetrics");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = (void *)objc_opt_new();
          objc_msgSend(v3, "uuid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "populateMetricsFromDigestGroup:mnbUUID:", v15, v18);

          objc_msgSend(v17, "logToCoreAnalytics");
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

}

- (void)_readBookmarkFromPath
{
  void *v3;
  BMBookmark *v4;
  BMBookmark *bookmark;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", self->_path);
  objc_msgSend(MEMORY[0x1E0CF94A0], "bookmarkFromURLPath:maxFileSize:versionNumber:", v6, 2000000, &unk_1E83CC940);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bookmark");
  v4 = (BMBookmark *)objc_claimAutoreleasedReturnValue();
  bookmark = self->_bookmark;
  self->_bookmark = v4;

}

- (void)_writeBookmarkToPath
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
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "%@ – Error writing missed notification ranking metrics bookmark: %@", (uint8_t *)&v7, 0x16u);

}

- (BOOL)_fileExistsAtPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedMNRStream, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
}

void __84__ATXMissedNotificationRankingFeedbackProcessingPipeline_logMetricsWithXPCActivity___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v10 = 138412802;
  v11 = v7;
  v12 = 2112;
  v13 = v8;
  v14 = 2048;
  v15 = v9;
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "[%@] Error while sinking Biome stream: %@.  Logged %lu rankings.", (uint8_t *)&v10, 0x20u);

}

@end
