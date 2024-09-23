@implementation BMCoreDuetDiscoverabilitySignalsSource

void __52__BMCoreDuetDiscoverabilitySignalsSource_sendEvent___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  Class (*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a3;
  if (a2)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v6 = (void *)get_CDContextualKeyPathClass_softClass;
    v21 = get_CDContextualKeyPathClass_softClass;
    if (!get_CDContextualKeyPathClass_softClass)
    {
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __get_CDContextualKeyPathClass_block_invoke;
      v16 = &unk_1E2647EA8;
      v17 = &v18;
      __get_CDContextualKeyPathClass_block_invoke((uint64_t)&v13);
      v6 = (void *)v19[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v18, 8);
    objc_msgSend(v7, "ephemeralKeyPathWithKey:", CFSTR("/discoverability/signals/dataDictionary"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v10 = (void *)get_CDClientContextClass_softClass_0;
    v21 = get_CDClientContextClass_softClass_0;
    if (!get_CDClientContextClass_softClass_0)
    {
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __get_CDClientContextClass_block_invoke_0;
      v16 = &unk_1E2647EA8;
      v17 = &v18;
      __get_CDClientContextClass_block_invoke_0((uint64_t)&v13);
      v10 = (void *)v19[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v18, 8);
    objc_msgSend(v11, "userContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, v8);

  }
  else
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __52__BMCoreDuetDiscoverabilitySignalsSource_sendEvent___block_invoke_cold_1();
  }

}

- (void)sendEvent:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  Class (*v56)(uint64_t);
  void *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  _QWORD v64[2];
  void *v65;
  _QWORD v66[3];

  v66[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BMCoreDuetDiscoverabilitySignalsSource sendEvent:].cold.4(self, (uint64_t)v4, v5);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    -[NSObject identifier](v6, "identifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject bundleID](v6, "bundleID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject context](v6, "context");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject userInfo](v6, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MGCopyAnswer();
    if (v8)
    {
      objc_msgSend(CFSTR("iOS-"), "stringByAppendingString:", v8);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v48 = 0;
    }

    if (v50 && v49 && v48)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", CFAbsoluteTimeGetCurrent());
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc(MEMORY[0x1E0C99E08]);
      v66[0] = v48;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(get_DKDiscoverabilitySignalsMetadataKeyClass(), "osBuild");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend(v10, "initWithObjects:forKeys:", v11, v13);

      if (v47)
      {
        objc_msgSend(get_DKDiscoverabilitySignalsMetadataKeyClass(), "context");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setObject:forKeyedSubscript:", v47, v14);

      }
      if (v7)
      {
        objc_msgSend(get_DKDiscoverabilitySignalsMetadataKeyClass(), "userInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setObject:forKeyedSubscript:", v7, v15);

      }
      v59 = 0;
      v60 = &v59;
      v61 = 0x2050000000;
      v16 = (void *)get_DKSourceClass_softClass;
      v62 = get_DKSourceClass_softClass;
      if (!get_DKSourceClass_softClass)
      {
        v54 = MEMORY[0x1E0C809B0];
        v55 = 3221225472;
        v56 = __get_DKSourceClass_block_invoke;
        v57 = &unk_1E2647EA8;
        v58 = &v59;
        __get_DKSourceClass_block_invoke((uint64_t)&v54);
        v16 = (void *)v60[3];
      }
      v17 = objc_retainAutorelease(v16);
      _Block_object_dispose(&v59, 8);
      v45 = (void *)objc_msgSend([v17 alloc], "initWithIdentifier:bundleIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:", 0, v49, 0, 0, 0, 0);
      v59 = 0;
      v60 = &v59;
      v61 = 0x2050000000;
      v18 = (void *)get_DKEventClass_softClass_2;
      v62 = get_DKEventClass_softClass_2;
      if (!get_DKEventClass_softClass_2)
      {
        v54 = MEMORY[0x1E0C809B0];
        v55 = 3221225472;
        v56 = __get_DKEventClass_block_invoke_2;
        v57 = &unk_1E2647EA8;
        v58 = &v59;
        __get_DKEventClass_block_invoke_2((uint64_t)&v54);
        v18 = (void *)v60[3];
      }
      v19 = objc_retainAutorelease(v18);
      _Block_object_dispose(&v59, 8);
      v59 = 0;
      v60 = &v59;
      v61 = 0x2050000000;
      v20 = (void *)get_DKSystemEventStreamsClass_softClass_1;
      v62 = get_DKSystemEventStreamsClass_softClass_1;
      if (!get_DKSystemEventStreamsClass_softClass_1)
      {
        v54 = MEMORY[0x1E0C809B0];
        v55 = 3221225472;
        v56 = __get_DKSystemEventStreamsClass_block_invoke_1;
        v57 = &unk_1E2647EA8;
        v58 = &v59;
        __get_DKSystemEventStreamsClass_block_invoke_1((uint64_t)&v54);
        v20 = (void *)v60[3];
      }
      v21 = objc_retainAutorelease(v20);
      _Block_object_dispose(&v59, 8);
      objc_msgSend(v21, "discoverabilitySignalsStream");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v46, "copy");
      objc_msgSend(v19, "eventWithStream:source:startDate:endDate:identifierStringValue:metadata:", v22, v45, v9, v9, v50, v23);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v53 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, 0, &v53);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v53;
        if (v25)
        {
          __biome_log_for_category();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            -[BMCoreDuetDiscoverabilitySignalsSource sendEvent:].cold.2();

        }
      }
      else
      {
        v24 = 0;
      }
      v59 = 0;
      v60 = &v59;
      v61 = 0x2050000000;
      v27 = (void *)getBMDiscoverabilitySignalsClass_softClass;
      v62 = getBMDiscoverabilitySignalsClass_softClass;
      if (!getBMDiscoverabilitySignalsClass_softClass)
      {
        v54 = MEMORY[0x1E0C809B0];
        v55 = 3221225472;
        v56 = __getBMDiscoverabilitySignalsClass_block_invoke;
        v57 = &unk_1E2647EA8;
        v58 = &v59;
        __getBMDiscoverabilitySignalsClass_block_invoke((uint64_t)&v54);
        v27 = (void *)v60[3];
      }
      v28 = objc_retainAutorelease(v27);
      _Block_object_dispose(&v59, 8);
      v29 = (void *)objc_msgSend(v28, "alloc");
      -[NSObject identifier](v6, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject context](v6, "context");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v29, "initWithContentIdentifier:context:osBuild:userInfo:", v30, v31, v48, v24);

      BMRootLibraryBridge();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "streamWithIdentifier:error:", CFSTR("Discoverability.Signals"), 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "source");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "sendEvent:", v32);

      v36 = objc_alloc(MEMORY[0x1E0C99E08]);
      v64[0] = v50;
      v64[1] = v49;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(v36, "initWithObjects:forKeys:", v37, &unk_1E26D36F8);

      if (v47)
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v47, CFSTR("context"));
      if (v7)
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v7, CFSTR("userInfo"));
      v59 = 0;
      v60 = &v59;
      v61 = 0x2050000000;
      v39 = (void *)get_DKKnowledgeStoreClass_softClass_0;
      v62 = get_DKKnowledgeStoreClass_softClass_0;
      if (!get_DKKnowledgeStoreClass_softClass_0)
      {
        v54 = MEMORY[0x1E0C809B0];
        v55 = 3221225472;
        v56 = __get_DKKnowledgeStoreClass_block_invoke_0;
        v57 = &unk_1E2647EA8;
        v58 = &v59;
        __get_DKKnowledgeStoreClass_block_invoke_0((uint64_t)&v54);
        v39 = (void *)v60[3];
      }
      v40 = objc_retainAutorelease(v39);
      _Block_object_dispose(&v59, 8);
      objc_msgSend(v40, "userKnowledgeStore");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v44;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __52__BMCoreDuetDiscoverabilitySignalsSource_sendEvent___block_invoke;
      v51[3] = &unk_1E2648AA0;
      v52 = v38;
      v43 = v38;
      objc_msgSend(v41, "saveObjects:responseQueue:withCompletion:", v42, 0, v51);

    }
    else
    {
      __biome_log_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[BMCoreDuetDiscoverabilitySignalsSource sendEvent:].cold.1();
    }

  }
  else
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMCoreDuetDiscoverabilitySignalsSource sendEvent:].cold.3(v6);
  }

}

- (void)sendEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18D810000, v0, v1, "Invalid event sent to source, missing property on discoverability signal event %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)sendEvent:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  _os_log_fault_impl(&dword_18D810000, v0, OS_LOG_TYPE_FAULT, "Encountered issue serializing userInfo to json %@", v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (void)sendEvent:(os_log_t)log .cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18D810000, log, OS_LOG_TYPE_ERROR, "Wrong event type sent to source expecting discoverability signal event", v1, 2u);
}

- (void)sendEvent:(NSObject *)a3 .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_18D810000, a3, OS_LOG_TYPE_DEBUG, "Event donation to %@ stream: %@", v6, 0x16u);

}

void __52__BMCoreDuetDiscoverabilitySignalsSource_sendEvent___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18D810000, v0, v1, "Error persisting discoverability signal event to knowledge store %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
