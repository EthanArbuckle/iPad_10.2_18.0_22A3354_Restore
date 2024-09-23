@implementation BMAppClipLaunchSource

- (BMAppClipLaunchSource)initWithStoreSource:(id)a3
{
  id v5;
  BMAppClipLaunchSource *v6;
  BMAppClipLaunchSource *v7;
  uint64_t v8;
  _CDClientContext *contextStore;
  uint64_t v10;
  _DKKnowledgeStore *knowledgeStore;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMAppClipLaunchSource;
  v6 = -[BMAppClipLaunchSource init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storeSource, a3);
    objc_msgSend(get_CDClientContextClass(), "userContext");
    v8 = objc_claimAutoreleasedReturnValue();
    contextStore = v7->_contextStore;
    v7->_contextStore = (_CDClientContext *)v8;

    objc_msgSend(get_DKKnowledgeStoreClass(), "knowledgeStore");
    v10 = objc_claimAutoreleasedReturnValue();
    knowledgeStore = v7->_knowledgeStore;
    v7->_knowledgeStore = (_DKKnowledgeStore *)v10;

  }
  return v7;
}

- (id)identifier
{
  return -[BMSource identifier](self->_storeSource, "identifier");
}

- (void)sendEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id DKEventClass_0;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  id v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  _QWORD v64[2];

  v64[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BMAppClipLaunchSource sendEvent:].cold.3(self, v5);

  -[BMSource sendEvent:](self->_storeSource, "sendEvent:", v4);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", CFAbsoluteTimeGetCurrent());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v4;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject URLHash](v7, "URLHash");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NSObject URLHash](v7, "URLHash");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(get_CDContextQueriesClass_0(), "URLHashKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, v12);

      -[NSObject URLHash](v7, "URLHash");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(get_DKAppClipUsageMetadataKeyClass(), "URLHash");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v14);

    }
    -[NSObject clipBundleID](v7, "clipBundleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[NSObject clipBundleID](v7, "clipBundleID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(get_CDContextQueriesClass_0(), "clipBundleIDKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v17);

      -[NSObject clipBundleID](v7, "clipBundleID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(get_DKAppClipUsageMetadataKeyClass(), "clipBundleID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, v19);

    }
    -[NSObject appBundleID](v7, "appBundleID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[NSObject appBundleID](v7, "appBundleID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(get_CDContextQueriesClass_0(), "appBundleIdKey");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, v22);

      -[NSObject appBundleID](v7, "appBundleID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(get_DKAppClipUsageMetadataKeyClass(), "appBundleID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, v24);

    }
    -[NSObject webAppBundleID](v7, "webAppBundleID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[NSObject webAppBundleID](v7, "webAppBundleID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(get_CDContextQueriesClass_0(), "webAppBundleIDKey");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, v27);

      -[NSObject webAppBundleID](v7, "webAppBundleID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(get_DKAppClipUsageMetadataKeyClass(), "webAppBundleID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v28, v29);

    }
    -[NSObject launchReason](v7, "launchReason");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      -[NSObject launchReason](v7, "launchReason");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(get_CDContextQueriesClass_0(), "appLaunchReasonKey");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, v32);

      -[NSObject launchReason](v7, "launchReason");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(get_DKAppClipUsageMetadataKeyClass(), "launchReason");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v33, v34);

    }
    -[NSObject fullURL](v7, "fullURL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      -[NSObject fullURL](v7, "fullURL");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(get_CDContextQueriesClass_0(), "fullURLKey");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v36, v37);

      -[NSObject fullURL](v7, "fullURL");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(get_DKAppClipUsageMetadataKeyClass(), "fullURL");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v38, v39);

    }
    -[NSObject referrerURL](v7, "referrerURL", v4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      -[NSObject referrerURL](v7, "referrerURL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(get_CDContextQueriesClass_0(), "referrerURLKey");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v41, v42);

      -[NSObject referrerURL](v7, "referrerURL");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(get_DKAppClipUsageMetadataKeyClass(), "referrerURL");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v43, v44);

    }
    v45 = v8;
    -[NSObject referrerBundleID](v7, "referrerBundleID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      -[NSObject referrerBundleID](v7, "referrerBundleID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(get_DKAppClipUsageMetadataKeyClass(), "referrerBundleID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v47, v48);

    }
    DKEventClass_0 = get_DKEventClass_0();
    objc_msgSend(get_DKSystemEventStreamsClass_0(), "appClipUsageStream");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject clipBundleID](v7, "clipBundleID");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v6;
    objc_msgSend(DKEventClass_0, "eventWithStream:startDate:endDate:identifierStringValue:metadata:", v50, v6, v6, v51, v9);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    -[BMAppClipLaunchSource knowledgeStore](self, "knowledgeStore");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0;
    v56 = objc_msgSend(v54, "saveObjects:error:", v55, &v63);
    v57 = v63;

    if ((v56 & 1) == 0)
    {
      __biome_log_for_category();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        -[BMAppClipLaunchSource sendEvent:].cold.1();

    }
    v59 = (void *)objc_msgSend(v45, "copy");
    -[BMAppClipLaunchSource contextStore](self, "contextStore");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(get_CDContextQueriesClass_0(), "keyPathForAppClipLaunch");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setObject:forKeyedSubscript:", v59, v61);

    v6 = v52;
    v4 = v62;
  }
  else
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BMAppClipLaunchSource sendEvent:].cold.2(self, v7);
  }

}

- (_CDClientContext)contextStore
{
  return self->_contextStore;
}

- (_DKKnowledgeStore)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_contextStore, 0);
  objc_storeStrong((id *)&self->_storeSource, 0);
}

- (void)sendEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_5(&dword_18D810000, v0, v1, "Error saving launch event to knowledge store: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)sendEvent:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_5(&dword_18D810000, a2, v4, "Wrong event type sent to source %@ expecting app clip launch event", v5);

  OUTLINED_FUNCTION_0_0();
}

- (void)sendEvent:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  _os_log_debug_impl(&dword_18D810000, a2, OS_LOG_TYPE_DEBUG, "Try to sent to source %@ expecting app clip launch event", v4, 0xCu);

  OUTLINED_FUNCTION_0_0();
}

@end
