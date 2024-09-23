@implementation ATXProactiveSuggestionShadowLogger

- (ATXProactiveSuggestionShadowLogger)initWithClientModelIds:(id)a3 shadowEventPublisher:(id)a4 clientModelPublisher:(id)a5 contextPublisher:(id)a6 bookmarkURLPath:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  ATXProactiveSuggestionShadowLogger *v17;
  uint64_t v18;
  NSSet *clientModelIds;
  uint64_t v20;
  NSURL *bookmarkURLPath;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ATXProactiveSuggestionShadowLogger;
  v17 = -[ATXProactiveSuggestionShadowLogger init](&v23, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    clientModelIds = v17->_clientModelIds;
    v17->_clientModelIds = (NSSet *)v18;

    objc_storeStrong((id *)&v17->_shadowEventPublisher, a4);
    objc_storeStrong((id *)&v17->_clientModelPublisher, a5);
    objc_storeStrong((id *)&v17->_contextPublisher, a6);
    v20 = objc_msgSend(v16, "copy");
    bookmarkURLPath = v17->_bookmarkURLPath;
    v17->_bookmarkURLPath = (NSURL *)v20;

  }
  return v17;
}

- (void)enumerateShadowLoggingResultsWithBlock:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v10 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __93__ATXProactiveSuggestionShadowLogger_enumerateShadowLoggingResultsWithBlock_completionBlock___block_invoke;
  v11[3] = &unk_1E82E90B8;
  v12 = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__ATXProactiveSuggestionShadowLogger_enumerateShadowLoggingResultsWithBlock_completionBlock___block_invoke_3;
  v9[3] = &unk_1E82E9120;
  v7 = v10;
  v8 = v6;
  -[ATXProactiveSuggestionShadowLogger enumerateShadowLoggingResultsWithBlock:clientModelCacheUpdatedBlock:completionBlock:](self, "enumerateShadowLoggingResultsWithBlock:clientModelCacheUpdatedBlock:completionBlock:", v11, &__block_literal_global_209, v9);

}

uint64_t __93__ATXProactiveSuggestionShadowLogger_enumerateShadowLoggingResultsWithBlock_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __93__ATXProactiveSuggestionShadowLogger_enumerateShadowLoggingResultsWithBlock_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateShadowLoggingResultsWithBlock:(id)a3 clientModelCacheUpdatedBlock:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSURL *bookmarkURLPath;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  _BYTE *v32;
  uint8_t v33[4];
  void *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  uint64_t v38;
  _BYTE buf[24];
  char v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  bookmarkURLPath = self->_bookmarkURLPath;
  if (bookmarkURLPath)
  {
    objc_msgSend(MEMORY[0x1E0CF94A0], "bookmarkFromURLPath:maxFileSize:versionNumber:", bookmarkURLPath, kATXProactiveSuggestionShadowLoggerMaxOnDiskFileSizeInBytes, &unk_1E83CDD98);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  __atxlog_handle_blending_ecosystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v12;
    _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "%@ - starting enumeration with bookmark: %@", buf, 0x16u);

  }
  -[ATXProactiveSuggestionShadowLogger shadowLoggingPublisher](self, "shadowLoggingPublisher");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v40 = 0;
  objc_msgSend(v12, "bookmark");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __122__ATXProactiveSuggestionShadowLogger_enumerateShadowLoggingResultsWithBlock_clientModelCacheUpdatedBlock_completionBlock___block_invoke;
  v30[3] = &unk_1E82E9148;
  v30[4] = self;
  v19 = v10;
  v31 = v19;
  v32 = buf;
  v27[0] = v18;
  v27[1] = 3221225472;
  v27[2] = __122__ATXProactiveSuggestionShadowLogger_enumerateShadowLoggingResultsWithBlock_clientModelCacheUpdatedBlock_completionBlock___block_invoke_14;
  v27[3] = &unk_1E82E9170;
  v20 = v9;
  v28 = v20;
  v21 = v8;
  v29 = v21;
  v22 = (id)objc_msgSend(v16, "sinkWithBookmark:completion:receiveInput:", v17, v30, v27);

  if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    v23 = (void *)MEMORY[0x1CAA48B6C]();
    __atxlog_handle_blending_ecosystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v33 = 138412802;
      v34 = v26;
      v35 = 1024;
      v36 = 1;
      v37 = 2112;
      v38 = 0;
      _os_log_impl(&dword_1C9A3B000, v24, OS_LOG_TYPE_DEFAULT, "%@ - invoking outside completion handler with success: %u, error: %@", v33, 0x1Cu);

    }
    (*((void (**)(id, uint64_t, _QWORD))v19 + 2))(v19, 1, 0);
    objc_autoreleasePoolPop(v23);
  }

  _Block_object_dispose(buf, 8);
}

void __122__ATXProactiveSuggestionShadowLogger_enumerateShadowLoggingResultsWithBlock_clientModelCacheUpdatedBlock_completionBlock___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "error");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "state");
  v9 = v8 == 0;
  __atxlog_handle_blending_ecosystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v25 = v12;
    v26 = 1024;
    v27 = v8 == 0;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "%@ - sinkWithBookmark complete with completion success: %u, error: %@", buf, 0x1Cu);

  }
  if (!v8 && !v7)
  {
    v13 = (_QWORD *)a1[4];
    v14 = v13[2];
    if (v14)
    {
      v15 = (void *)objc_msgSend(v13, "newBookmarkWithURLPath:versionNumber:bookmark:metadata:", v14, &unk_1E83CDD98, v6, 0);
      v23 = 0;
      v9 = objc_msgSend(v15, "saveBookmarkWithError:", &v23);
      v7 = v23;
      __atxlog_handle_blending_ecosystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v25 = v18;
        v26 = 1024;
        v27 = v9;
        v28 = 2112;
        v29 = v7;
        _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "%@ - saved new bookmark with success: %u, error: %@", buf, 0x1Cu);

      }
    }
    else
    {
      v7 = 0;
      v9 = 1;
    }
  }
  v19 = (void *)MEMORY[0x1CAA48B6C]();
  __atxlog_handle_blending_ecosystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v25 = v22;
    v26 = 1024;
    v27 = v9;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, "%@ - invoking completion handler with success: %u, error: %@", buf, 0x1Cu);

  }
  (*(void (**)(void))(a1[5] + 16))();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  objc_autoreleasePoolPop(v19);

}

void __122__ATXProactiveSuggestionShadowLogger_enumerateShadowLoggingResultsWithBlock_clientModelCacheUpdatedBlock_completionBlock___block_invoke_14(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x1CAA48B6C]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = a1 + 32;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)v4 + 16))();
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = a1 + 40;
    goto LABEL_5;
  }
LABEL_6:
  objc_autoreleasePoolPop(v3);

}

- (id)shadowLoggingPublisher
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
  void *v12;
  _QWORD v14[5];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  -[ATXProactiveSuggestionShadowLogger clientModelPublisher](self, "clientModelPublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__ATXProactiveSuggestionShadowLogger_shadowLoggingPublisher__block_invoke;
  v14[3] = &unk_1E82DF748;
  v14[4] = self;
  objc_msgSend(v3, "filterWithIsIncluded:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXProactiveSuggestionShadowLogger contextPublisher](self, "contextPublisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  -[ATXProactiveSuggestionShadowLogger shadowEventPublisher](self, "shadowEventPublisher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedMergeWithOthers:comparator:", v7, &__block_literal_global_21_3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  objc_msgSend(v8, "scanWithInitial:nextPartialResult:", v9, &__block_literal_global_25_1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "filterWithIsIncluded:", &__block_literal_global_28_0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "flatMapWithTransform:", &__block_literal_global_30_2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __60__ATXProactiveSuggestionShadowLogger_shadowLoggingPublisher__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(v3, "clientModelId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __60__ATXProactiveSuggestionShadowLogger_shadowLoggingPublisher__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

ATXProactiveSuggestionShadowLoggingContextEventTuple *__60__ATXProactiveSuggestionShadowLogger_shadowLoggingPublisher__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  ATXProactiveSuggestionShadowLoggingContextEventTuple *v8;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "shadowLoggingContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "updateWithClientModelCacheUpdate:", v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v7, "updateWithContext:", v6);
    }
    v8 = -[ATXProactiveSuggestionShadowLoggingContextEventTuple initWithEvent:shadowLoggingContext:]([ATXProactiveSuggestionShadowLoggingContextEventTuple alloc], "initWithEvent:shadowLoggingContext:", v5, v7);

  }
  else
  {
    v8 = (ATXProactiveSuggestionShadowLoggingContextEventTuple *)v4;
  }

  return v8;
}

uint64_t __60__ATXProactiveSuggestionShadowLogger_shadowLoggingPublisher__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a2, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "eventBody");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_opt_class();
      v5 = objc_opt_isKindOfClass() ^ 1;
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5 & 1;
}

id __60__ATXProactiveSuggestionShadowLogger_shadowLoggingPublisher__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(v2, "shadowLoggingContext");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "context");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = objc_alloc(MEMORY[0x1E0C99D68]);
          objc_msgSend(v5, "timestamp");
          v11 = (void *)objc_msgSend(v10, "initWithTimeIntervalSinceReferenceDate:");
          objc_msgSend(v8, "clientModelCacheUpdates");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = MEMORY[0x1E0C809B0];
          v17 = 3221225472;
          v18 = __60__ATXProactiveSuggestionShadowLogger_shadowLoggingPublisher__block_invoke_6;
          v19 = &unk_1E82E9278;
          v20 = v6;
          v21 = v11;
          v22 = v8;
          v13 = v3;
          v23 = v13;
          v14 = v11;
          objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", &v16);

          objc_msgSend(v13, "bpsPublisher", v16, v17, v18, v19);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v3, "bpsPublisher");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_11;
      }
      objc_msgSend(v3, "addObject:", v6);
    }
    objc_msgSend(v3, "bpsPublisher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v3, "bpsPublisher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v7;
}

void __60__ATXProactiveSuggestionShadowLogger_shadowLoggingPublisher__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  ATXProactiveSuggestionShadowLoggingResult *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  ATXProactiveSuggestionShadowLoggingResult *v9;

  v4 = a3;
  v5 = [ATXProactiveSuggestionShadowLoggingResult alloc];
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ATXProactiveSuggestionShadowLoggingResult initWithShadowEvent:shadowEventDate:clientModelCacheUpdate:context:](v5, "initWithShadowEvent:shadowEventDate:clientModelCacheUpdate:context:", v6, v7, v4, v8);

  objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);
}

- (id)newBookmarkWithURLPath:(id)a3 versionNumber:(id)a4 bookmark:(id)a5 metadata:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v9 = (objc_class *)MEMORY[0x1E0CF94A0];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend([v9 alloc], "initWithURLPath:versionNumber:bookmark:metadata:", v13, v12, v11, v10);

  return v14;
}

- (NSSet)clientModelIds
{
  return self->_clientModelIds;
}

- (NSURL)bookmarkURLPath
{
  return self->_bookmarkURLPath;
}

- (BPSPublisher)shadowEventPublisher
{
  return self->_shadowEventPublisher;
}

- (void)setShadowEventPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_shadowEventPublisher, a3);
}

- (BPSPublisher)clientModelPublisher
{
  return self->_clientModelPublisher;
}

- (void)setClientModelPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_clientModelPublisher, a3);
}

- (BPSPublisher)contextPublisher
{
  return self->_contextPublisher;
}

- (void)setContextPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_contextPublisher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextPublisher, 0);
  objc_storeStrong((id *)&self->_clientModelPublisher, 0);
  objc_storeStrong((id *)&self->_shadowEventPublisher, 0);
  objc_storeStrong((id *)&self->_bookmarkURLPath, 0);
  objc_storeStrong((id *)&self->_clientModelIds, 0);
}

@end
