@implementation ATXCallHistoryDataSource

- (ATXCallHistoryDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXCallHistoryDataSource *v6;
  ATXCallHistoryDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCallHistoryDataSource;
  v6 = -[ATXCallHistoryDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (void)callNewerThan:(double)a3 showIncoming:(BOOL)a4 showOutgoing:(BOOL)a5 missedOnly:(BOOL)a6 callback:(id)a7
{
  id v10;
  double v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t i;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  int v36;
  _BOOL4 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _QWORD v43[2];
  _QWORD v44[4];

  v37 = a6;
  v44[2] = *MEMORY[0x1E0C80C00];
  v10 = a7;
  if ((ATXHeuristicCanLearnFromApp(&unk_1E82D54D0) & 1) != 0)
  {
    v11 = 7776000.0;
    v33 = v10;
    if (a3 <= 7776000.0)
    {
      v11 = a3;
    }
    else
    {
      __atxlog_handle_heuristic();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[ATXCallHistoryDataSource callNewerThan:showIncoming:showOutgoing:missedOnly:callback:].cold.2(v12, a3);

    }
    v43[0] = *MEMORY[0x1E0D0CEE8];
    -[ATXHeuristicDevice now](self->_device, "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dateByAddingTimeInterval:", -v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v14;
    v43[1] = *MEMORY[0x1E0D0CEE0];
    -[ATXHeuristicDevice now](self->_device, "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc(MEMORY[0x1E0D0CE68]);
    v32 = (void *)v16;
    v18 = (void *)objc_msgSend(v17, "initWithFetchingLimitsDictionary:andCoalescingStrategy:andPostFetchingPredicate:withQueue:", v16, *MEMORY[0x1E0D0CED8], 0, 0);
    v34 = (void *)objc_opt_new();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v31 = v18;
    objc_msgSend(v18, "recentCalls");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v39;
      v23 = *MEMORY[0x1E0D0CE98];
      v24 = *MEMORY[0x1E0D0CEA8];
      v36 = *MEMORY[0x1E0D0CEA0];
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v39 != v22)
            objc_enumerationMutation(v19);
          v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          v27 = objc_msgSend(v26, "callStatus");
          if ((a4 || (v23 & v27) == 0) && (a5 || (v24 & v27) == 0) && (!v37 || (v36 & v27) != 0))
          {
            objc_msgSend(v26, "date");
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
            {
              -[ATXCallHistoryDataSource _dictForCall:](self, "_dictForCall:", v26);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (v29)
                objc_msgSend(v34, "addObject:", v29);

            }
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v21);
    }

    __atxlog_handle_heuristic();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[ATXCallHistoryDataSource callNewerThan:showIncoming:showOutgoing:missedOnly:callback:].cold.1(v34, v30);

    v10 = v33;
    (*((void (**)(id, void *, _QWORD))v33 + 2))(v33, v34, 0);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x1E0C9AA60], 0);
  }

}

- (id)_dictForCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "localParticipantUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("localParticipantUUID"));

  objc_msgSend(v4, "uniqueId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("uniqueId"));

  v9 = objc_msgSend(v4, "callStatus");
  v10 = (void *)objc_opt_new();
  v11 = v10;
  if ((*MEMORY[0x1E0D0CE98] & v9) != 0)
    objc_msgSend(v10, "addObject:", CFSTR("incoming"));
  if ((*MEMORY[0x1E0D0CEA8] & v9) != 0)
    objc_msgSend(v11, "addObject:", CFSTR("outgoing"));
  v12 = *MEMORY[0x1E0D0CEA0];
  if ((*MEMORY[0x1E0D0CEA0] & v9) != 0)
    objc_msgSend(v11, "addObject:", CFSTR("missed"));
  v13 = (void *)objc_msgSend(v11, "copy");

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("callStatus"));
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  objc_msgSend(v14, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("date"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (objc_msgSend(v4, "callStatus") & v12) != 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("missed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "unreadCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("unreadCount"));

  objc_msgSend(v4, "contactIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("contactIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "mediaType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("mediaType"));

  objc_msgSend(v4, "callerNameForDisplay");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("callerNameForDisplay"));

  objc_msgSend(v4, "serviceProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("serviceProvider"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("CHRecentCall"));
  v23 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v4, "remoteParticipantHandles", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v32;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v32 != v27)
          objc_enumerationMutation(v24);
        -[ATXCallHistoryDataSource _dictForHandle:](self, "_dictForHandle:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v28));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
          objc_msgSend(v23, "addObject:", v29);

        ++v28;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v26);
  }

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("remoteParticipantHandles"));
  return v5;
}

- (id)_dictForHandle:(id)a3
{
  id v3;
  uint64_t v4;
  const __CFString *v5;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v9[0] = CFSTR("type");
  v3 = a3;
  v4 = objc_msgSend(v3, "type");
  if ((unint64_t)(v4 - 1) > 2)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E82C4D50[v4 - 1];
  v10[0] = v5;
  v9[1] = CFSTR("value");
  objc_msgSend(v3, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)callNewerThan:(void *)a1 showIncoming:(NSObject *)a2 showOutgoing:missedOnly:callback:.cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_debug_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_DEBUG, "Found %lu call(s) for query", (uint8_t *)&v3, 0xCu);
}

- (void)callNewerThan:(os_log_t)log showIncoming:(double)a2 showOutgoing:missedOnly:callback:.cold.2(os_log_t log, double a2)
{
  int v2;
  double v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134218240;
  v3 = a2;
  v4 = 1024;
  v5 = 7776000;
  _os_log_fault_impl(&dword_1C99DF000, log, OS_LOG_TYPE_FAULT, "maxAge %f too big; maximum is %i",
    (uint8_t *)&v2,
    0x12u);
}

@end
