@implementation ATXDigestOnboardingMetricsLogger

- (ATXDigestOnboardingMetricsLogger)init
{
  void *v3;
  ATXDigestOnboardingMetricsLogger *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXDigestOnboardingMetricsLogger initWithDigestOnboardingLoggingBiomeStream:](self, "initWithDigestOnboardingLoggingBiomeStream:", v3);

  return v4;
}

- (ATXDigestOnboardingMetricsLogger)initWithDigestOnboardingLoggingBiomeStream:(id)a3
{
  id v5;
  ATXDigestOnboardingMetricsLogger *v6;
  ATXDigestOnboardingMetricsLogger *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXDigestOnboardingMetricsLogger;
  v6 = -[ATXDigestOnboardingMetricsLogger init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_digestOnboardingLoggingBiomeStream, a3);

  return v7;
}

- (id)digestOnboardingBookmark
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(MEMORY[0x1E0CF94D8], "bookmarksPathFile:", CFSTR("digestOnboardingBookmark"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initFileURLWithPath:", v3);

  objc_msgSend(MEMORY[0x1E0CF94A0], "bookmarkFromURLPath:maxFileSize:versionNumber:", v4, 1000000, &unk_1E83CD5A0);
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

- (void)logDigestOnboardingMetricsWithXPCActivity:(id)a3
{
  id v4;
  void *v5;
  ATXDigestOnboardingLoggingBiomeStream *digestOnboardingLoggingBiomeStream;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;

  v4 = a3;
  -[ATXDigestOnboardingMetricsLogger digestOnboardingBookmark](self, "digestOnboardingBookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  digestOnboardingLoggingBiomeStream = self->_digestOnboardingLoggingBiomeStream;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[ATXDigestOnboardingLoggingBiomeStream publisherFromStartTime:](digestOnboardingLoggingBiomeStream, "publisherFromStartTime:", v7 + -1209600.0);
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
  v17[2] = __78__ATXDigestOnboardingMetricsLogger_logDigestOnboardingMetricsWithXPCActivity___block_invoke;
  v17[3] = &unk_1E82DC7A8;
  v19 = v20;
  v17[4] = self;
  v11 = v5;
  v18 = v11;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __78__ATXDigestOnboardingMetricsLogger_logDigestOnboardingMetricsWithXPCActivity___block_invoke_16;
  v14[3] = &unk_1E82DBF90;
  v14[4] = self;
  v12 = v4;
  v15 = v12;
  v16 = v20;
  v13 = (id)objc_msgSend(v8, "drivableSinkWithBookmark:completion:shouldContinue:", v9, v17, v14);

  _Block_object_dispose(v20, 8);
}

void __78__ATXDigestOnboardingMetricsLogger_logDigestOnboardingMetricsWithXPCActivity___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

uint64_t __78__ATXDigestOnboardingMetricsLogger_logDigestOnboardingMetricsWithXPCActivity___block_invoke_16(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  void *v25;
  int v26;
  uint64_t v27;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "sessionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSessionUUID:", v6);

  objc_msgSend(v3, "entrySource");
  ATXDigestOnboardingEntrySourceToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEntrySource:", v7);

  objc_msgSend(v3, "digestOnboardingOutcome");
  ATXDigestOnboardingOutcomeToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDigestOnboardingOutcome:", v8);

  objc_msgSend(v3, "finalUIShown");
  ATXDigestOnboardingFinalUIShownToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFinalUIShown:", v9);

  objc_msgSend(v3, "timeTaken");
  objc_msgSend(v4, "setTimeTaken:");
  objc_msgSend(v3, "deliveryTimes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
  {
    v14 = -1;
    goto LABEL_5;
  }
  objc_msgSend(v3, "deliveryTimes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "minutesAfterMidnight:", v12);
    v14 = (uint64_t)v13;
    v10 = (void *)v12;
LABEL_5:

    goto LABEL_7;
  }
  v14 = -1;
LABEL_7:
  objc_msgSend(v4, "setDeliveryTime1:", v14);
  objc_msgSend(v3, "deliveryTimes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v15, "count") < 2)
  {
    v19 = -1;
    goto LABEL_11;
  }
  objc_msgSend(v3, "deliveryTimes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
  v17 = objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(*(id *)(a1 + 32), "minutesAfterMidnight:", v17);
    v19 = (uint64_t)v18;
    v15 = (void *)v17;
LABEL_11:

    goto LABEL_13;
  }
  v19 = -1;
LABEL_13:
  objc_msgSend(v4, "setDeliveryTime2:", v19);
  objc_msgSend(v3, "deliveryTimes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v20, "count") < 3)
  {
    v24 = -1;
    goto LABEL_17;
  }
  objc_msgSend(v3, "deliveryTimes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 2);
  v22 = objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(*(id *)(a1 + 32), "minutesAfterMidnight:", v22);
    v24 = (uint64_t)v23;
    v20 = (void *)v22;
LABEL_17:

    goto LABEL_19;
  }
  v24 = -1;
LABEL_19:
  objc_msgSend(v4, "setDeliveryTime3:", v24);
  objc_msgSend(v3, "deliveryTimes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumScheduledDeliveries:", objc_msgSend(v25, "count"));

  objc_msgSend(v4, "logToCoreAnalytics");
  v26 = objc_msgSend(*(id *)(a1 + 40), "didDefer");
  if (v26)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  v27 = v26 ^ 1u;

  return v27;
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

- (void)logDigestOnboardingMetrics
{
  -[ATXDigestOnboardingMetricsLogger logDigestOnboardingMetricsWithXPCActivity:](self, "logDigestOnboardingMetricsWithXPCActivity:", 0);
}

- (double)minutesAfterMidnight:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "hour");
  v5 = objc_msgSend(v3, "minute");

  return (double)(unint64_t)(v5 + 60 * v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestOnboardingLoggingBiomeStream, 0);
}

@end
