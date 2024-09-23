@implementation ATXFaceSuggestionClient

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6, &__block_literal_global_0);
  return (id)sharedInstance__pasExprOnceResult;
}

void __41__ATXFaceSuggestionClient_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A85A4F90]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXFaceSuggestionClient)init
{
  ATXFaceSuggestionClient *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  void *v5;
  uint64_t v6;
  ATXFaceGalleryBiomeStream *stream;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *loggingQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ATXFaceSuggestionClient;
  v2 = -[ATXFaceSuggestionClient init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.proactive.FaceSuggestions.xpc"), 0);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    ATXFaceSuggestionClientXPCInterface();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection setExportedObject:](v2->_connection, "setExportedObject:", v2);
    -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", &__block_literal_global_15);
    -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", &__block_literal_global_17);
    -[NSXPCConnection resume](v2->_connection, "resume");
    v6 = objc_opt_new();
    stream = v2->_stream;
    v2->_stream = (ATXFaceGalleryBiomeStream *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.proactive.ATXFaceSuggestionClient.logging", v8);
    loggingQueue = v2->_loggingQueue;
    v2->_loggingQueue = (OS_dispatch_queue *)v9;

  }
  return v2;
}

void __31__ATXFaceSuggestionClient_init__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_lock_screen();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __31__ATXFaceSuggestionClient_init__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __31__ATXFaceSuggestionClient_init__block_invoke_16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_lock_screen();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __31__ATXFaceSuggestionClient_init__block_invoke_16_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (void)regenerateFaceGalleryConfigurationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSXPCConnection *connection;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[5];
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_lock_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[ATXFaceSuggestionClient regenerateFaceGalleryConfigurationWithCompletion:]";
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  __atxlog_handle_lock_screen();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  __atxlog_handle_lock_screen();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A49EF000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "RegenerateLockScreenGalleryConfiguration", " enableTelemetry=YES ", buf, 2u);
  }

  v10 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __76__ATXFaceSuggestionClient_regenerateFaceGalleryConfigurationWithCompletion___block_invoke;
  v24[3] = &__block_descriptor_40_e5_v8__0l;
  v24[4] = v7;
  v11 = (void *)MEMORY[0x1A85A511C](v24);
  connection = self->_connection;
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __76__ATXFaceSuggestionClient_regenerateFaceGalleryConfigurationWithCompletion___block_invoke_20;
  v21[3] = &unk_1E4D57190;
  v13 = v11;
  v22 = v13;
  v14 = v4;
  v23 = v14;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __76__ATXFaceSuggestionClient_regenerateFaceGalleryConfigurationWithCompletion___block_invoke_22;
  v18[3] = &unk_1E4D571B8;
  v19 = v13;
  v20 = v14;
  v16 = v14;
  v17 = v13;
  objc_msgSend(v15, "regenerateFaceGalleryConfigurationWithCompletion:", v18);

}

void __76__ATXFaceSuggestionClient_regenerateFaceGalleryConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  __atxlog_handle_lock_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A49EF000, v3, OS_SIGNPOST_INTERVAL_END, v4, "RegenerateLockScreenGalleryConfiguration", " enableTelemetry=YES ", v5, 2u);
  }

}

void __76__ATXFaceSuggestionClient_regenerateFaceGalleryConfigurationWithCompletion___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionClient regenerateFaceGalleryConfigurationWithCompletion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __76__ATXFaceSuggestionClient_regenerateFaceGalleryConfigurationWithCompletion___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t);
  id v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void (**)(uint64_t))(v5 + 16);
  v7 = a3;
  v8 = a2;
  v6(v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)reloadLockScreenSuggestionsWithCompletion:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadLockScreenSuggestionsWithCompletion:", v4);

}

- (void)fetchFaceGalleryConfigurationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSXPCConnection *connection;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[5];
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_lock_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[ATXFaceSuggestionClient fetchFaceGalleryConfigurationWithCompletion:]";
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  __atxlog_handle_lock_screen();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  __atxlog_handle_lock_screen();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A49EF000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchLockScreenGalleryConfiguration", " enableTelemetry=YES ", buf, 2u);
  }

  v10 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __71__ATXFaceSuggestionClient_fetchFaceGalleryConfigurationWithCompletion___block_invoke;
  v24[3] = &__block_descriptor_40_e5_v8__0l;
  v24[4] = v7;
  v11 = (void *)MEMORY[0x1A85A511C](v24);
  connection = self->_connection;
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __71__ATXFaceSuggestionClient_fetchFaceGalleryConfigurationWithCompletion___block_invoke_24;
  v21[3] = &unk_1E4D57190;
  v13 = v11;
  v22 = v13;
  v14 = v4;
  v23 = v14;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __71__ATXFaceSuggestionClient_fetchFaceGalleryConfigurationWithCompletion___block_invoke_25;
  v18[3] = &unk_1E4D571B8;
  v19 = v13;
  v20 = v14;
  v16 = v14;
  v17 = v13;
  objc_msgSend(v15, "fetchFaceGalleryConfigurationWithCompletion:", v18);

}

void __71__ATXFaceSuggestionClient_fetchFaceGalleryConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  __atxlog_handle_lock_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A49EF000, v3, OS_SIGNPOST_INTERVAL_END, v4, "FetchLockScreenGalleryConfiguration", " enableTelemetry=YES ", v5, 2u);
  }

}

void __71__ATXFaceSuggestionClient_fetchFaceGalleryConfigurationWithCompletion___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionClient fetchFaceGalleryConfigurationWithCompletion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __71__ATXFaceSuggestionClient_fetchFaceGalleryConfigurationWithCompletion___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t);
  id v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void (**)(uint64_t))(v5 + 16);
  v7 = a3;
  v8 = a2;
  v6(v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchFaceSuggestionsForFocusMode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  ATXFaceSuggestionClient *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  __atxlog_handle_lock_screen();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[ATXFaceSuggestionClient fetchFaceSuggestionsForFocusMode:completion:]";
    _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  dispatch_get_global_queue(25, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__ATXFaceSuggestionClient_fetchFaceSuggestionsForFocusMode_completion___block_invoke;
  block[3] = &unk_1E4D57230;
  v14 = self;
  v15 = v7;
  v13 = v6;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __71__ATXFaceSuggestionClient_fetchFaceSuggestionsForFocusMode_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  NSObject *v6;
  ATXModeFaceSuggestionsCache *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  NSObject *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (!v3)
  {
    __atxlog_handle_lock_screen();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[ATXFaceSuggestionClient fetchFaceSuggestionsForFocusMode:completion:]_block_invoke";
      _os_log_impl(&dword_1A49EF000, v6, OS_LOG_TYPE_DEFAULT, "%s: no UUID, can't do a cache lookup; doing full query",
        buf,
        0xCu);
    }
    goto LABEL_11;
  }
  v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "initWithUUIDString:", v5);

  v7 = objc_alloc_init(ATXModeFaceSuggestionsCache);
  -[ATXModeFaceSuggestionsCache cachedSuggestedFacesForModeUUID:](v7, "cachedSuggestedFacesForModeUUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
  {
    __atxlog_handle_lock_screen();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[ATXFaceSuggestionClient fetchFaceSuggestionsForFocusMode:completion:]_block_invoke";
      v22 = 2114;
      v23 = v6;
      _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "%s: no cached items for %{public}@; doing fully query",
        buf,
        0x16u);
    }

LABEL_11:
    v11 = *(void **)(a1 + 48);
    v12 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    v13 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __71__ATXFaceSuggestionClient_fetchFaceSuggestionsForFocusMode_completion___block_invoke_28;
    v18[3] = &unk_1E4D571E0;
    v19 = v11;
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __71__ATXFaceSuggestionClient_fetchFaceSuggestionsForFocusMode_completion___block_invoke_29;
    v16[3] = &unk_1E4D57208;
    v17 = *(id *)(a1 + 48);
    objc_msgSend(v14, "fetchFaceSuggestionsForFocusMode:completion:", v15, v16);

    v6 = v19;
    goto LABEL_12;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  __atxlog_handle_lock_screen();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[ATXFaceSuggestionClient fetchFaceSuggestionsForFocusMode:completion:]_block_invoke";
    v22 = 2114;
    v23 = v6;
    _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "%s: using cached items for: %{public}@", buf, 0x16u);
  }

LABEL_12:
}

void __71__ATXFaceSuggestionClient_fetchFaceSuggestionsForFocusMode_completion___block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionClient fetchFaceSuggestionsForFocusMode:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__ATXFaceSuggestionClient_fetchFaceSuggestionsForFocusMode_completion___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  __atxlog_handle_lock_screen();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ATXFaceSuggestionClient fetchFaceSuggestionsForFocusMode:completion:]_block_invoke";
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "%s: finished", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPosterDescriptorsAndSuggestionDataWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSXPCConnection *connection;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_lock_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[ATXFaceSuggestionClient fetchPosterDescriptorsAndSuggestionDataWithCompletion:]";
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__ATXFaceSuggestionClient_fetchPosterDescriptorsAndSuggestionDataWithCompletion___block_invoke;
  v9[3] = &unk_1E4D571E0;
  v10 = v4;
  v7 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchPosterDescriptorsAndSuggestionDataWithCompletion:", v7);

}

void __81__ATXFaceSuggestionClient_fetchPosterDescriptorsAndSuggestionDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionClient fetchPosterDescriptorsAndSuggestionDataWithCompletion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchRankedPosterDescriptors:(id)a3
{
  id v4;
  NSObject *v5;
  NSXPCConnection *connection;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_lock_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[ATXFaceSuggestionClient fetchRankedPosterDescriptors:]";
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__ATXFaceSuggestionClient_fetchRankedPosterDescriptors___block_invoke;
  v9[3] = &unk_1E4D571E0;
  v10 = v4;
  v7 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRankedPosterDescriptors:", v7);

}

void __56__ATXFaceSuggestionClient_fetchRankedPosterDescriptors___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionClient fetchRankedPosterDescriptors:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPosterConfigurationsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSXPCConnection *connection;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_lock_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[ATXFaceSuggestionClient fetchPosterConfigurationsWithCompletion:]";
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__ATXFaceSuggestionClient_fetchPosterConfigurationsWithCompletion___block_invoke;
  v9[3] = &unk_1E4D571E0;
  v10 = v4;
  v7 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchPosterConfigurationsWithCompletion:", v7);

}

void __67__ATXFaceSuggestionClient_fetchPosterConfigurationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionClient fetchPosterConfigurationsWithCompletion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchComplicationSetsForFaceGalleryItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSXPCConnection *connection;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  __atxlog_handle_lock_screen();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[ATXFaceSuggestionClient fetchComplicationSetsForFaceGalleryItem:completion:]";
    _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__ATXFaceSuggestionClient_fetchComplicationSetsForFaceGalleryItem_completion___block_invoke;
  v12[3] = &unk_1E4D571E0;
  v13 = v6;
  v10 = v6;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchComplicationSetsForFaceGalleryItem:completion:", v7, v10);

}

void __78__ATXFaceSuggestionClient_fetchComplicationSetsForFaceGalleryItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionClient fetchComplicationSetsForFaceGalleryItem:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchLandscapeComplicationSetsForFaceGalleryItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSXPCConnection *connection;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  __atxlog_handle_lock_screen();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[ATXFaceSuggestionClient fetchLandscapeComplicationSetsForFaceGalleryItem:completion:]";
    _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__ATXFaceSuggestionClient_fetchLandscapeComplicationSetsForFaceGalleryItem_completion___block_invoke;
  v12[3] = &unk_1E4D571E0;
  v13 = v6;
  v10 = v6;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchLandscapeComplicationSetsForFaceGalleryItem:completion:", v7, v10);

}

void __87__ATXFaceSuggestionClient_fetchLandscapeComplicationSetsForFaceGalleryItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionClient fetchLandscapeComplicationSetsForFaceGalleryItem:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)posterBoardDidUpdateDescriptors:(id)a3 completion:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  connection = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__ATXFaceSuggestionClient_posterBoardDidUpdateDescriptors_completion___block_invoke;
  v11[3] = &unk_1E4D571E0;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "posterBoardDidUpdateDescriptors:completion:", v9, v8);

}

void __70__ATXFaceSuggestionClient_posterBoardDidUpdateDescriptors_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionClient posterBoardDidUpdateDescriptors:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)posterBoardDidUpdateConfigurations:(id)a3 completion:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  connection = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__ATXFaceSuggestionClient_posterBoardDidUpdateConfigurations_completion___block_invoke;
  v11[3] = &unk_1E4D571E0;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "posterBoardDidUpdateConfigurations:completion:", v9, v8);

}

void __73__ATXFaceSuggestionClient_posterBoardDidUpdateConfigurations_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionClient posterBoardDidUpdateConfigurations:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)inputDescriptionForComplicationSuggestionSignal:(id)a3 completion:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  connection = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__ATXFaceSuggestionClient_inputDescriptionForComplicationSuggestionSignal_completion___block_invoke;
  v11[3] = &unk_1E4D571E0;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputDescriptionForComplicationSuggestionSignal:completion:", v9, v8);

}

void __86__ATXFaceSuggestionClient_inputDescriptionForComplicationSuggestionSignal_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionClient inputDescriptionForComplicationSuggestionSignal:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchComplicationSuggestionsModelDescriptionWithCompletion:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  connection = self->_connection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__ATXFaceSuggestionClient_fetchComplicationSuggestionsModelDescriptionWithCompletion___block_invoke;
  v8[3] = &unk_1E4D571E0;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchComplicationSuggestionsModelDescriptionWithCompletion:", v6);

}

void __86__ATXFaceSuggestionClient_fetchComplicationSuggestionsModelDescriptionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionClient fetchComplicationSuggestionsModelDescriptionWithCompletion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchInlineComplicationSetForFaceGalleryItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSXPCConnection *connection;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  __atxlog_handle_lock_screen();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[ATXFaceSuggestionClient fetchInlineComplicationSetForFaceGalleryItem:completion:]";
    _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__ATXFaceSuggestionClient_fetchInlineComplicationSetForFaceGalleryItem_completion___block_invoke;
  v12[3] = &unk_1E4D571E0;
  v13 = v6;
  v10 = v6;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchInlineComplicationSetForFaceGalleryItem:completion:", v7, v10);

}

void __83__ATXFaceSuggestionClient_fetchInlineComplicationSetForFaceGalleryItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionClient fetchInlineComplicationSetForFaceGalleryItem:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)refreshComplicationsCacheWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSXPCConnection *connection;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_lock_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[ATXFaceSuggestionClient refreshComplicationsCacheWithCompletion:]";
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__ATXFaceSuggestionClient_refreshComplicationsCacheWithCompletion___block_invoke;
  v9[3] = &unk_1E4D571E0;
  v10 = v4;
  v7 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "refreshComplicationsCacheWithCompletion:", v7);

}

void __67__ATXFaceSuggestionClient_refreshComplicationsCacheWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionClient refreshComplicationsCacheWithCompletion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchScoredComplicationDescriptionWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSXPCConnection *connection;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_lock_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[ATXFaceSuggestionClient fetchScoredComplicationDescriptionWithCompletion:]";
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__ATXFaceSuggestionClient_fetchScoredComplicationDescriptionWithCompletion___block_invoke;
  v9[3] = &unk_1E4D571E0;
  v10 = v4;
  v7 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchScoredComplicationDescriptionWithCompletion:", v7);

}

void __76__ATXFaceSuggestionClient_fetchScoredComplicationDescriptionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionClient fetchScoredComplicationDescriptionWithCompletion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchMetricsDescriptionWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSXPCConnection *connection;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_lock_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[ATXFaceSuggestionClient fetchMetricsDescriptionWithCompletion:]";
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__ATXFaceSuggestionClient_fetchMetricsDescriptionWithCompletion___block_invoke;
  v9[3] = &unk_1E4D571E0;
  v10 = v4;
  v7 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchMetricsDescriptionWithCompletion:", v7);

}

void __65__ATXFaceSuggestionClient_fetchMetricsDescriptionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionClient fetchMetricsDescriptionWithCompletion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)logPosterEdit:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSXPCConnection *connection;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  __atxlog_handle_lock_screen();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[ATXFaceSuggestionClient logPosterEdit:completion:]";
    _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__ATXFaceSuggestionClient_logPosterEdit_completion___block_invoke;
  v12[3] = &unk_1E4D571E0;
  v13 = v6;
  v10 = v6;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logPosterEdit:completion:", v7, v10);

}

void __52__ATXFaceSuggestionClient_logPosterEdit_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionClient logPosterEdit:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)logPosterEditUIViewedWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSXPCConnection *connection;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_lock_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[ATXFaceSuggestionClient logPosterEditUIViewedWithCompletion:]";
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__ATXFaceSuggestionClient_logPosterEditUIViewedWithCompletion___block_invoke;
  v9[3] = &unk_1E4D571E0;
  v10 = v4;
  v7 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logPosterEditUIViewedWithCompletion:", v7);

}

void __63__ATXFaceSuggestionClient_logPosterEditUIViewedWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionClient logPosterEditUIViewedWithCompletion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)logPosterSwitch:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSXPCConnection *connection;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  __atxlog_handle_lock_screen();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[ATXFaceSuggestionClient logPosterSwitch:completion:]";
    _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__ATXFaceSuggestionClient_logPosterSwitch_completion___block_invoke;
  v12[3] = &unk_1E4D571E0;
  v13 = v6;
  v10 = v6;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logPosterSwitch:completion:", v7, v10);

}

void __54__ATXFaceSuggestionClient_logPosterSwitch_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionClient logPosterSwitch:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)synchronousDateOfLastGalleryAppearanceWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSXPCConnection *connection;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_lock_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[ATXFaceSuggestionClient synchronousDateOfLastGalleryAppearanceWithCompletion:]";
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__ATXFaceSuggestionClient_synchronousDateOfLastGalleryAppearanceWithCompletion___block_invoke;
  v9[3] = &unk_1E4D571E0;
  v10 = v4;
  v7 = v4;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousDateOfLastGalleryAppearanceWithCompletion:", v7);

}

void __80__ATXFaceSuggestionClient_synchronousDateOfLastGalleryAppearanceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionClient synchronousDateOfLastGalleryAppearanceWithCompletion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching synchronous remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)logComplicationsSeenInGalleryWithEngagements:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSXPCConnection *connection;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  __atxlog_handle_lock_screen();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[ATXFaceSuggestionClient logComplicationsSeenInGalleryWithEngagements:completion:]";
    _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__ATXFaceSuggestionClient_logComplicationsSeenInGalleryWithEngagements_completion___block_invoke;
  v12[3] = &unk_1E4D571E0;
  v13 = v6;
  v10 = v6;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logComplicationsSeenInGalleryWithEngagements:completion:", v7, v10);

}

void __83__ATXFaceSuggestionClient_logComplicationsSeenInGalleryWithEngagements_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionClient logComplicationsSeenInGalleryWithEngagements:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)logFaceGalleryItemsSeenInGalleryWithOutcomes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSXPCConnection *connection;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  __atxlog_handle_lock_screen();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[ATXFaceSuggestionClient logFaceGalleryItemsSeenInGalleryWithOutcomes:completion:]";
    _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__ATXFaceSuggestionClient_logFaceGalleryItemsSeenInGalleryWithOutcomes_completion___block_invoke;
  v12[3] = &unk_1E4D571E0;
  v13 = v6;
  v10 = v6;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logFaceGalleryItemsSeenInGalleryWithOutcomes:completion:", v7, v10);

}

void __83__ATXFaceSuggestionClient_logFaceGalleryItemsSeenInGalleryWithOutcomes_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionClient logFaceGalleryItemsSeenInGalleryWithOutcomes:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_logEvent:(id)a3
{
  id v4;
  NSObject *loggingQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  loggingQueue = self->_loggingQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__ATXFaceSuggestionClient__logEvent___block_invoke;
  v7[3] = &unk_1E4D57258;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(loggingQueue, v7);

}

void __37__ATXFaceSuggestionClient__logEvent___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "source");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendEvent:", *(_QWORD *)(a1 + 40));

}

- (void)logFaceGalleryDidAppearWithFaceGalleryConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_lock_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[ATXFaceSuggestionClient logFaceGalleryDidAppearWithFaceGalleryConfiguration:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v8, 0x16u);
  }

  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_31);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logFaceGalleryDidAppearWithFaceGalleryConfiguration:", v4);

  +[ATXFaceGalleryEvent galleryDidAppearEventWithConfiguration:](ATXFaceGalleryEvent, "galleryDidAppearEventWithConfiguration:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceSuggestionClient _logEvent:](self, "_logEvent:", v7);

}

void __79__ATXFaceSuggestionClient_logFaceGalleryDidAppearWithFaceGalleryConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  __atxlog_handle_lock_screen();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[ATXFaceSuggestionClient logFaceGalleryDidAppearWithFaceGalleryConfiguration:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)logFaceGalleryDidDisappear
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_lock_screen();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ATXFaceSuggestionClient logFaceGalleryDidDisappear]";
    _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  +[ATXFaceGalleryEvent galleryDidDisappearEvent](ATXFaceGalleryEvent, "galleryDidDisappearEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceSuggestionClient _logEvent:](self, "_logEvent:", v4);

}

- (void)logFaceGalleryItemsDidAppear:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_lock_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[ATXFaceSuggestionClient logFaceGalleryItemsDidAppear:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v7, 0x16u);
  }

  +[ATXFaceGalleryEvent itemsDidAppearEventWithItems:](ATXFaceGalleryEvent, "itemsDidAppearEventWithItems:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceSuggestionClient _logEvent:](self, "_logEvent:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingQueue, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __31__ATXFaceSuggestionClient_init__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: connection interrupted", a5, a6, a7, a8, 2u);
}

void __31__ATXFaceSuggestionClient_init__block_invoke_16_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: connection invalidated", a5, a6, a7, a8, 2u);
}

@end
