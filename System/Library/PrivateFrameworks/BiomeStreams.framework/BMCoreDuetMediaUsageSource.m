@implementation BMCoreDuetMediaUsageSource

- (BMCoreDuetMediaUsageSource)initWithIdentifier:(id)a3
{
  BMCoreDuetMediaUsageSource *v3;
  BMCoreDuetMediaUsageStore *v4;
  BMCoreDuetMediaUsageStore *storage;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BMCoreDuetMediaUsageSource;
  v3 = -[BMSource initWithIdentifier:](&v7, sel_initWithIdentifier_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(BMCoreDuetMediaUsageStore);
    storage = v3->_storage;
    v3->_storage = v4;

  }
  return v3;
}

- (void)sendEvent:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
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
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id DKEventClass_0;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  NSObject *v62;
  BMCoreDuetMediaUsageSource *v63;
  id v64;

  v4 = a3;
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BMCoreDuetMediaUsageSource sendEvent:].cold.5(self, (uint64_t)v4, v5);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    if ((-[NSObject isValidWithContext:error:](v6, "isValidWithContext:error:", 0, 0) & 1) != 0)
    {
      objc_msgSend(get_CDContextQueriesClass_0(), "keyPathForAppMediaUsageDataDictionaries");
      v7 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject isStarting](v6, "isStarting"))
      {
        v8 = v6;
        if (-[NSObject isStarting](v8, "isStarting"))
        {
          v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          -[NSObject bundleID](v8, "bundleID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(get_CDContextQueriesClass_0(), "appMediaUsageBundleID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v11);

          -[NSObject URL](v8, "URL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(get_CDContextQueriesClass_0(), "appMediaUsageURL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, v13);

          -[NSObject mediaURL](v8, "mediaURL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(get_CDContextQueriesClass_0(), "appMediaUsageMediaURL");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, v15);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSObject isUsageTrusted](v8, "isUsageTrusted"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(get_CDContextQueriesClass_0(), "isUsageTrusted");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v17);

          -[NSObject dateInterval](v8, "dateInterval");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "startDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(get_CDContextQueriesClass_0(), "appMediaUsageStartDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, v20);

          -[NSObject safariProfileID](v8, "safariProfileID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(get_CDContextQueriesClass_0(), "appUsageSafariProfileID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, v22);

          v23 = (void *)objc_msgSend(v9, "copy");
        }
        else
        {
          v23 = 0;
        }

        -[BMCoreDuetMediaUsageSource storage](self, "storage");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addContextValue:toArrayAtKeyPath:", v23, v7);
      }
      else
      {
        v59 = (void *)MEMORY[0x1E0CB3880];
        v61 = v4;
        objc_msgSend(get_CDContextQueriesClass_0(), "appMediaUsageBundleID");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject bundleID](v6, "bundleID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(get_CDContextQueriesClass_0(), "appMediaUsageURL");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject URL](v6, "URL");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(get_CDContextQueriesClass_0(), "appMediaUsageMediaURL");
        v62 = v7;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject mediaURL](v6, "mediaURL");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(get_CDContextQueriesClass_0(), "isUsageTrusted");
        v63 = self;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSObject isUsageTrusted](v6, "isUsageTrusted"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "predicateWithFormat:", CFSTR("SELF.%K == %@ && SELF.%K == %@ && SELF.%K == %@ && SELF.%K == %@"), v57, v24, v25, v26, v27, v28, v29, v30);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v62;
        -[BMCoreDuetMediaUsageSource storage](v63, "storage");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "removeObjectsMatchingPredicate:fromArrayAtKeyPath:", v23, v62);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v32, "count"))
        {
          objc_msgSend(v32, "firstObject");
          v33 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(get_CDContextQueriesClass_0(), "appMediaUsageStartDate");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v33, "objectForKeyedSubscript:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = v6;
          v37 = v35;
          v60 = v37;
          if ((-[NSObject isStarting](v36, "isStarting") & 1) != 0)
          {
            v38 = 0;
          }
          else
          {
            v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            -[NSObject URL](v36, "URL");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(get_DKAppMediaUsageMetadataKeyClass(), "URL");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v40, v41);

            -[NSObject mediaURL](v36, "mediaURL");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(get_DKAppMediaUsageMetadataKeyClass(), "mediaURL");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v42, v43);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSObject isUsageTrusted](v36, "isUsageTrusted"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(get_DKDigitalHealthMetadataKeyClass_0(), "isUsageTrusted");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v44, v45);

            -[NSObject safariProfileID](v36, "safariProfileID");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(get_DKDigitalHealthMetadataKeyClass_0(), "safariProfileID");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v46, v47);

            DKEventClass_0 = get_DKEventClass_0();
            objc_msgSend(get_DKSystemEventStreamsClass_0(), "appMediaUsageStream");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject dateInterval](v36, "dateInterval");
            v58 = v23;
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "startDate");
            v51 = v33;
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject bundleID](v36, "bundleID");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(DKEventClass_0, "eventWithStream:startDate:endDate:identifierStringValue:metadata:", v49, v60, v52, v53, v39);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            v7 = v62;
            v33 = v51;
            v37 = v60;

            v23 = v58;
          }
          v4 = v61;

          -[BMCoreDuetMediaUsageSource storage](v63, "storage");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = 0;
          objc_msgSend(v54, "saveKnowledgeEvent:error:", v38, &v64);
          v55 = v64;

          if (v55)
          {
            __biome_log_for_category();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
              -[BMCoreDuetMediaUsageSource sendEvent:].cold.2();

          }
        }
        else
        {
          __biome_log_for_category();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            -[BMCoreDuetMediaUsageSource sendEvent:].cold.1();
          v4 = v61;
        }

      }
    }
    else
    {
      __biome_log_for_category();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[BMCoreDuetMediaUsageSource sendEvent:].cold.3();
    }

  }
  else
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMCoreDuetMediaUsageSource sendEvent:].cold.4();
  }

}

- (BMCoreDuetMediaUsageStore)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

- (void)sendEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_5(&dword_18D810000, v0, v1, "Failed to find start event for incoming end event %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)sendEvent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_5(&dword_18D810000, v0, v1, "Error persisting media usage event to knowledge store: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)sendEvent:.cold.3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  _os_log_fault_impl(&dword_18D810000, v0, OS_LOG_TYPE_FAULT, "Invalid event sent to source, missing property on media usage event %@", v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (void)sendEvent:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6_0(&dword_18D810000, v0, v1, "Wrong event type sent to source expecting media usage event", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sendEvent:(NSObject *)a3 .cold.5(void *a1, uint64_t a2, NSObject *a3)
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

@end
