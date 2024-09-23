@implementation ATXProactiveSuggestionShadowLoggerXPCScheduler

- (id)shadowLoggingURLPathWithFileName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CF94D8];
  v4 = a3;
  objc_msgSend(v3, "feedbackRootDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("shadowLogging"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingPathComponent:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)shadowLogWithXPCActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  __objc2_class **v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _QWORD v48[8];
  _QWORD v49[10];

  v49[8] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = &unk_1E83CDC48;
  v48[1] = &unk_1E83CDC78;
  v49[0] = &unk_1E83D0568;
  v49[1] = &unk_1E83D0580;
  v48[2] = &unk_1E83CDC60;
  v48[3] = &unk_1E83CDCA8;
  v49[2] = &unk_1E83D0598;
  v49[3] = &unk_1E83D05B0;
  v48[4] = &unk_1E83CDCC0;
  v48[5] = &unk_1E83CDCD8;
  v49[4] = &unk_1E83D05C8;
  v49[5] = &unk_1E83D05E0;
  v48[6] = &unk_1E83CDCF0;
  v48[7] = &unk_1E83CDD08;
  v49[6] = &unk_1E83D05F8;
  v49[7] = &unk_1E83D0610;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v41;
    v9 = 0x1E0D81000uLL;
    v30 = v5;
    v31 = v4;
    v27 = *(_QWORD *)v41;
    do
    {
      v10 = 0;
      v28 = v7;
      do
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v10);
        v12 = objc_msgSend(v11, "integerValue");
        if ((unint64_t)(v12 - 49) < 0xFFFFFFFFFFFFFFD0)
          goto LABEL_24;
        v29 = v10;
        v32 = v12;
        objc_msgSend(*(id *)(v9 + 408), "clientModelIdFromClientModelType:", v12);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
        if (!v14)
          goto LABEL_23;
        v15 = v14;
        v16 = *(_QWORD *)v37;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v37 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            if ((objc_msgSend(v3, "didDefer") & 1) != 0)
            {

              v5 = v30;
              v4 = v31;
              goto LABEL_28;
            }
            v19 = objc_msgSend(v18, "integerValue");
            if ((unint64_t)(v19 - 11) >= 0xFFFFFFFFFFFFFFF6)
            {
              v20 = v19;
              if (v19 == 1)
              {
                v21 = off_1E82D71E8;
              }
              else
              {
                if (v19 != 2)
                  continue;
                v21 = off_1E82D71E0;
              }
              v22 = (void *)objc_msgSend(objc_alloc(*v21), "initWithClientModelType:", v32);
              v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811E0]), "initWithDataSource:", v22);
              objc_msgSend(v23, "computeResultFromStartDate:toEndDate:", v34, v33);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "asCoreAnalyticsMessageWithModelId:executableType:", v35, v20);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              __atxlog_handle_metrics();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v45 = v25;
                _os_log_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_DEFAULT, "Sending shadow metrics event to CoreAnalytics %@", buf, 0xCu);
              }

              AnalyticsSendEvent();
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
          if (v15)
            continue;
          break;
        }
LABEL_23:

        v5 = v30;
        v4 = v31;
        v8 = v27;
        v7 = v28;
        v9 = 0x1E0D81000;
        v10 = v29;
LABEL_24:
        ++v10;
      }
      while (v10 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v7);
  }
LABEL_28:

}

@end
