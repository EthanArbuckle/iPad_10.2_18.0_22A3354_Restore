@implementation ATXModeAppConfigurationMetricLogger

- (void)logMetricsWithXPCActivity:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id obj;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuredModes");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v40;
    v28 = *(_QWORD *)v40;
    v29 = v3;
    do
    {
      v7 = 0;
      v30 = v5;
      do
      {
        if (*(_QWORD *)v40 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v8, "modeIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        objc_msgSend(v3, "appConfigurationsForModeIdentifier:error:", v10, &v38);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v38;

        v33 = v11;
        if (v12)
        {
          __atxlog_handle_metrics();
          v13 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            goto LABEL_18;
          v14 = (objc_class *)objc_opt_class();
          NSStringFromClass(v14);
          v32 = v9;
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "localizedDescription");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "semanticType");
          DNDModeSemanticTypeToString();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v45 = v15;
          v46 = 2112;
          v47 = v16;
          v48 = 2112;
          v49 = v17;
          _os_log_error_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_ERROR, "%@: Got error: %@, when getting AppConfigturation for %@", buf, 0x20u);

          v5 = v30;
        }
        else
        {
          v32 = v9;
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          objc_msgSend(v11, "allKeys");
          v13 = objc_claimAutoreleasedReturnValue();
          v18 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v35;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v35 != v20)
                  objc_enumerationMutation(v13);
                v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
                v23 = (void *)objc_opt_new();
                objc_msgSend(v22, "bundleID");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "setBundleId:", v24);

                objc_msgSend(v8, "semanticType");
                DNDModeSemanticTypeToString();
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "setModeSemanticType:", v25);

                objc_msgSend(v23, "logToCoreAnalytics");
              }
              v19 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
            }
            while (v19);
            v6 = v28;
            v3 = v29;
            v5 = v30;
          }
        }
        v9 = v32;
LABEL_18:

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    }
    while (v5);
  }

}

@end
