@implementation ATXDigestFeedbackProcessingPipeline

- (ATXDigestFeedbackProcessingPipeline)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ATXDigestFeedbackProcessingPipeline *v7;

  objc_msgSend(MEMORY[0x1E0CF94D8], "metricsRootDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("digestLoggingBookmark"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = -[ATXDigestFeedbackProcessingPipeline initWithBookmark:path:trackedDigestStream:digestFeedbackLogger:](self, "initWithBookmark:path:trackedDigestStream:digestFeedbackLogger:", 0, v4, v5, v6);

  return v7;
}

- (ATXDigestFeedbackProcessingPipeline)initWithBookmark:(id)a3 path:(id)a4 trackedDigestStream:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  ATXDigestFeedbackProcessingPipeline *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  v12 = -[ATXDigestFeedbackProcessingPipeline initWithBookmark:path:trackedDigestStream:digestFeedbackLogger:](self, "initWithBookmark:path:trackedDigestStream:digestFeedbackLogger:", v10, v9, v8, v11);

  return v12;
}

- (ATXDigestFeedbackProcessingPipeline)initWithBookmark:(id)a3 path:(id)a4 trackedDigestStream:(id)a5 digestFeedbackLogger:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXDigestFeedbackProcessingPipeline *v15;
  ATXDigestFeedbackProcessingPipeline *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXDigestFeedbackProcessingPipeline;
  v15 = -[ATXDigestFeedbackProcessingPipeline init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bookmark, a3);
    objc_storeStrong((id *)&v16->_path, a4);
    objc_storeStrong((id *)&v16->_trackedDigestStream, a5);
    if (!v16->_bookmark)
      -[ATXDigestFeedbackProcessingPipeline _readBookmarkFromPath](v16, "_readBookmarkFromPath");
    objc_storeStrong((id *)&v16->_feedbackLogger, a6);
  }

  return v16;
}

- (void)logMetricsWithXPCActivity:(id)a3
{
  id v4;
  ATXEngagementTrackedDigestBiomeStream *trackedDigestStream;
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
  trackedDigestStream = self->_trackedDigestStream;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -172800.0);
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  -[ATXEngagementTrackedDigestBiomeStream publisherFromStartTime:](trackedDigestStream, "publisherFromStartTime:");
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
  v15[2] = __65__ATXDigestFeedbackProcessingPipeline_logMetricsWithXPCActivity___block_invoke;
  v15[3] = &unk_1E82DB938;
  v15[4] = self;
  v15[5] = v16;
  v15[6] = v17;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__ATXDigestFeedbackProcessingPipeline_logMetricsWithXPCActivity___block_invoke_12;
  v11[3] = &unk_1E82DB960;
  v11[4] = self;
  v13 = v16;
  v9 = v4;
  v12 = v9;
  v14 = v17;
  v10 = (id)objc_msgSend(v7, "drivableSinkWithBookmark:completion:shouldContinue:", bookmark, v15, v11);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v17, 8);

}

void __65__ATXDigestFeedbackProcessingPipeline_logMetricsWithXPCActivity___block_invoke(uint64_t a1, void *a2, void *a3)
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
      v14 = "[%@] Stopping digest metrics due to XPC deferral.  Logged %lu digests.";
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
      v14 = "[%@] Finished logging digest metrics.  Logged %lu digests.";
    }
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v20, 0x16u);

    goto LABEL_10;
  }
  __atxlog_handle_metrics();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __65__ATXDigestFeedbackProcessingPipeline_logMetricsWithXPCActivity___block_invoke_cold_1(a1, v5, v8);
LABEL_10:

  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(v17 + 8);
  *(_QWORD *)(v17 + 8) = v6;
  v19 = v6;

  objc_msgSend(*(id *)(a1 + 32), "_writeBookmarkToPath");
}

uint64_t __65__ATXDigestFeedbackProcessingPipeline_logMetricsWithXPCActivity___block_invoke_12(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  int v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "logFeedbackForDigest:", v4);
  objc_msgSend(*(id *)(a1 + 32), "logMetricsForDigest:", v4);

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v5 = objc_msgSend(*(id *)(a1 + 40), "didDefer");
  if (v5)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return v5 ^ 1u;
}

- (void)logMetrics
{
  -[ATXDigestFeedbackProcessingPipeline logMetricsWithXPCActivity:](self, "logMetricsWithXPCActivity:", 0);
}

- (void)logFeedbackForDigest:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_notification_management();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v7;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_INFO, "[%@] Logging feedback for digest %@", (uint8_t *)&v15, 0x16u);

  }
  -[ATXNotificationDigestFeedbackLogger logFeedbackForAnnotatedDigest:](self->_feedbackLogger, "logFeedbackForAnnotatedDigest:", v4);
  __atxlog_handle_notification_management();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v12;
    v17 = 2112;
    v18 = v14;
    _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_INFO, "[%@] Finished logging feedback for digest %@", (uint8_t *)&v15, 0x16u);

  }
}

- (void)logMetricsForDigest:(id)a3
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
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_INFO, "[%@] Logging metrics for digest %@", buf, 0x16u);

  }
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "populateMetricsFromDigest:", v3);
  objc_msgSend(v9, "logToCoreAnalytics");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "viewFlattenedGroups", 0);
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
          objc_msgSend(v17, "populateMetricsFromDigestGroup:digestUUID:", v15, v18);

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
  objc_msgSend(MEMORY[0x1E0CF94A0], "bookmarkFromURLPath:maxFileSize:versionNumber:", v6, 2000000, &unk_1E83CBBC0);
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
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "%@ – Error writing notification digest metrics bookmark: %@", (uint8_t *)&v7, 0x16u);

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
  objc_storeStrong((id *)&self->_feedbackLogger, 0);
  objc_storeStrong((id *)&self->_trackedDigestStream, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
}

void __65__ATXDigestFeedbackProcessingPipeline_logMetricsWithXPCActivity___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
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
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "[%@] Error while sinking Biome stream: %@.  Logged %lu digests.", (uint8_t *)&v10, 0x20u);

}

@end
