@implementation ATXSuggestedPagesHomeScreenModificationsMetricsLogger

- (ATXSuggestedPagesHomeScreenModificationsMetricsLogger)initWithStream:(id)a3 bookmarkURLPath:(id)a4
{
  id v7;
  id v8;
  ATXSuggestedPagesHomeScreenModificationsMetricsLogger *v9;
  ATXSuggestedPagesHomeScreenModificationsMetricsLogger *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[ATXSuggestedPagesHomeScreenModificationsMetricsLogger init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stream, a3);
    objc_storeStrong((id *)&v10->_bookmarkURLPath, a4);
  }

  return v10;
}

- (ATXSuggestedPagesHomeScreenModificationsMetricsLogger)init
{
  ATXSuggestedPagesHomeScreenModificationsMetricsLogger *v2;
  uint64_t v3;
  NSArray *acceptedEventTypes;
  uint64_t v5;
  ATXBMBookmark *atxBookmark;
  objc_super v8;
  _QWORD v9[7];

  v9[6] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)ATXSuggestedPagesHomeScreenModificationsMetricsLogger;
  v2 = -[ATXSuggestedPagesHomeScreenModificationsMetricsLogger init](&v8, sel_init);
  if (v2)
  {
    v9[0] = CFSTR("StackDeleted");
    v9[1] = CFSTR("StackCreated");
    v9[2] = CFSTR("AppRemoved");
    v9[3] = CFSTR("AppAdded");
    v9[4] = CFSTR("PinnedWidgetAdded");
    v9[5] = CFSTR("PinnedWidgetDeleted");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 6);
    v3 = objc_claimAutoreleasedReturnValue();
    acceptedEventTypes = v2->_acceptedEventTypes;
    v2->_acceptedEventTypes = (NSArray *)v3;

    -[ATXSuggestedPagesHomeScreenModificationsMetricsLogger generateBookmark](v2, "generateBookmark");
    v5 = objc_claimAutoreleasedReturnValue();
    atxBookmark = v2->_atxBookmark;
    v2->_atxBookmark = (ATXBMBookmark *)v5;

  }
  return v2;
}

- (ATXUniversalBiomeUIStream)stream
{
  ATXUniversalBiomeUIStream *stream;
  ATXUniversalBiomeUIStream *v4;
  ATXUniversalBiomeUIStream *v5;

  stream = self->_stream;
  if (!stream)
  {
    v4 = (ATXUniversalBiomeUIStream *)objc_alloc_init(MEMORY[0x1E0D81248]);
    v5 = self->_stream;
    self->_stream = v4;

    stream = self->_stream;
  }
  return stream;
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
  -[ATXSuggestedPagesHomeScreenModificationsMetricsLogger generateBookmarkURLPath](self, "generateBookmarkURLPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bookmarkFromURLPath:maxFileSize:versionNumber:", v4, 3000000, &unk_1E83CC1F0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CF94A0]);
    -[ATXSuggestedPagesHomeScreenModificationsMetricsLogger generateBookmarkURLPath](self, "generateBookmarkURLPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithURLPath:versionNumber:bookmark:metadata:", v7, &unk_1E83CC1F0, 0, 0);

  }
  return v5;
}

- (void)writeBookmarkToFile:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;

  v5 = 0;
  objc_msgSend(a3, "saveBookmarkWithError:", &v5);
  v3 = v5;
  if (v3)
  {
    __atxlog_handle_modes();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[ATXSuggestedPagesHomeScreenModificationsMetricsLogger writeBookmarkToFile:].cold.1((uint64_t)v3, v4);

  }
}

- (int64_t)logMetrics
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int64_t v10;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[ATXSuggestedPagesHomeScreenModificationsMetricsLogger stream](self, "stream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "genericEventPublisherFromStartTime:", 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__ATXSuggestedPagesHomeScreenModificationsMetricsLogger_logMetrics__block_invoke;
  v14[3] = &unk_1E82DF748;
  v14[4] = self;
  objc_msgSend(v4, "filterWithIsIncluded:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSuggestedPagesHomeScreenModificationsMetricsLogger atxBookmark](self, "atxBookmark");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bookmark");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = 3221225472;
  v13[2] = __67__ATXSuggestedPagesHomeScreenModificationsMetricsLogger_logMetrics__block_invoke_2;
  v13[3] = &unk_1E82DAF68;
  v13[4] = self;
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __67__ATXSuggestedPagesHomeScreenModificationsMetricsLogger_logMetrics__block_invoke_15;
  v12[3] = &unk_1E82DC1A0;
  v12[4] = &v15;
  v13[0] = v5;
  v9 = (id)objc_msgSend(v6, "drivableSinkWithBookmark:completion:shouldContinue:", v8, v13, v12);

  v10 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t __67__ATXSuggestedPagesHomeScreenModificationsMetricsLogger_logMetrics__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_7;
  objc_msgSend(v3, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeScreenEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8 || !objc_msgSend(v8, "suggestedPageType"))
  {

    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "acceptedEventTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventTypeString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "containsObject:", v11);

  if ((v12 & 1) == 0)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  v13 = 1;
LABEL_8:

  return v13;
}

void __67__ATXSuggestedPagesHomeScreenModificationsMetricsLogger_logMetrics__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  if (objc_msgSend(a2, "state") == 1)
  {
    __atxlog_handle_modes();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __67__ATXSuggestedPagesHomeScreenModificationsMetricsLogger_logMetrics__block_invoke_2_cold_1(v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "atxBookmark");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBookmark:", v5);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v8, "atxBookmark");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "writeBookmarkToFile:", v9);

}

uint64_t __67__ATXSuggestedPagesHomeScreenModificationsMetricsLogger_logMetrics__block_invoke_15(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeScreenEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widgetsInStack");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIds");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      v41 = v8;
      v42 = v6;
      v43 = v2;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v9 = v6;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v50 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            v15 = (void *)objc_opt_new();
            objc_msgSend(v15, "setSource:", 1);
            objc_msgSend(v4, "metadata");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "suggestedPageType");
            NSStringFromATXSuggestedPageType();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setSuggestedPageType:", v17);

            objc_msgSend(v4, "eventTypeString");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setEventType:", v18);

            objc_msgSend(v4, "widgetBundleId");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setWidgetBundleId:", v19);

            objc_msgSend(v14, "widgetKind");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setWidgetKind:", v20);

            objc_msgSend(v14, "appBundleId");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setAppBundleId:", v21);

            objc_msgSend(v4, "widgetSize");
            ATXStringForStackLayoutSize();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setWidgetSize:", v22);

            objc_msgSend(v15, "setIsSuggestedWidget:", objc_msgSend(v14, "isSuggestedWidget"));
            objc_msgSend(v15, "logToCoreAnalytics");
            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
        }
        while (v11);
      }
    }
    else
    {
      if (!objc_msgSend(v8, "count"))
      {
        v33 = (void *)objc_opt_new();
        objc_msgSend(v33, "setSource:", 1);
        objc_msgSend(v4, "metadata");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "suggestedPageType");
        NSStringFromATXSuggestedPageType();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setSuggestedPageType:", v35);

        objc_msgSend(v4, "eventTypeString");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setEventType:", v36);

        objc_msgSend(v4, "widgetBundleId");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setWidgetBundleId:", v37);

        objc_msgSend(v4, "widgetKind");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setWidgetKind:", v38);

        objc_msgSend(v4, "appBundleId");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setAppBundleId:", v39);

        objc_msgSend(v4, "widgetSize");
        ATXStringForStackLayoutSize();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setWidgetSize:", v40);

        objc_msgSend(v33, "setIsSuggestedWidget:", objc_msgSend(v4, "isSuggestedWidget"));
        objc_msgSend(v33, "logToCoreAnalytics");
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

        goto LABEL_20;
      }
      v42 = v6;
      v43 = v2;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v41 = v8;
      v9 = v8;
      v23 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v46;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v46 != v25)
              objc_enumerationMutation(v9);
            v27 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
            v28 = (void *)objc_opt_new();
            objc_msgSend(v28, "setSource:", 1);
            objc_msgSend(v4, "metadata");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "suggestedPageType");
            NSStringFromATXSuggestedPageType();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setSuggestedPageType:", v30);

            objc_msgSend(v4, "eventTypeString");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setEventType:", v31);

            objc_msgSend(v28, "setAppBundleId:", v27);
            objc_msgSend(v28, "logToCoreAnalytics");
            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

          }
          v24 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        }
        while (v24);
      }
    }

    v6 = v42;
    v2 = v43;
    v8 = v41;
LABEL_20:

  }
  return 1;
}

- (void)setStream:(id)a3
{
  objc_storeStrong((id *)&self->_stream, a3);
}

- (NSArray)acceptedEventTypes
{
  return self->_acceptedEventTypes;
}

- (void)setAcceptedEventTypes:(id)a3
{
  objc_storeStrong((id *)&self->_acceptedEventTypes, a3);
}

- (NSURL)bookmarkURLPath
{
  return self->_bookmarkURLPath;
}

- (void)setBookmarkURLPath:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarkURLPath, a3);
}

- (ATXBMBookmark)atxBookmark
{
  return self->_atxBookmark;
}

- (void)setAtxBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_atxBookmark, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atxBookmark, 0);
  objc_storeStrong((id *)&self->_bookmarkURLPath, 0);
  objc_storeStrong((id *)&self->_acceptedEventTypes, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

- (void)writeBookmarkToFile:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXSuggestedPagesHomeScreenModificationsMetricsLogger: Unable to save bookmark due to : %@", (uint8_t *)&v2, 0xCu);
}

void __67__ATXSuggestedPagesHomeScreenModificationsMetricsLogger_logMetrics__block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXSuggestedPagesHomeScreenModificationsMetricsLogger: Failed to retrieve UI events", v1, 2u);
}

@end
