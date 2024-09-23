@implementation ATXModeScoringSessionRange

- (ATXModeScoringSessionRange)initWithStartDate:(id)a3 endDate:(id)a4 modeEntityStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  ATXModeScoringSessionRange *v11;
  NSDate *v12;
  NSDate *startDate;
  NSDate *v14;
  NSDate *endDate;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXModeScoringSessionRange;
  v11 = -[ATXModeScoringSessionRange init](&v17, sel_init);
  if (v11)
  {
    if (v8)
    {
      v12 = (NSDate *)v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    startDate = v11->_startDate;
    v11->_startDate = v12;

    if (v9)
    {
      v14 = (NSDate *)v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    endDate = v11->_endDate;
    v11->_endDate = v14;

    objc_storeStrong((id *)&v11->_modeEntityStore, a5);
  }

  return v11;
}

- (void)filterSessions
{
  NSArray *v3;
  NSArray *sessions;

  -[NSArray _pas_filteredArrayWithTest:](self->_sessions, "_pas_filteredArrayWithTest:", &__block_literal_global_51);
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sessions = self->_sessions;
  self->_sessions = v3;

}

BOOL __44__ATXModeScoringSessionRange_filterSessions__block_invoke(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "duration");
  return v2 > 300.0;
}

- (BOOL)_areTimesClose:(id)a3 secondTime:(id)a4
{
  double v4;

  objc_msgSend(a4, "timeIntervalSinceDate:", a3);
  return v4 < 60.0;
}

- (void)attachAppLaunches
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  _QWORD v13[3];
  int v14;

  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "App");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "InFocus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "atx_publisherFromStartDate:", self->_startDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v7 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__ATXModeScoringSessionRange_attachAppLaunches__block_invoke_7;
  v10[3] = &unk_1E82DE1F0;
  v12 = v13;
  v10[4] = self;
  v8 = v7;
  v11 = v8;
  v9 = (id)objc_msgSend(v6, "sinkWithCompletion:receiveInput:", &__block_literal_global_6, v10);

  _Block_object_dispose(v13, 8);
}

void __47__ATXModeScoringSessionRange_attachAppLaunches__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "state") == 1)
  {
    __atxlog_handle_default();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v2, "error");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "Error: %@", (uint8_t *)&v5, 0xCu);

    }
  }

}

void __47__ATXModeScoringSessionRange_attachAppLaunches__block_invoke_7(uint64_t a1, void *a2)
{
  unint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  while (1)
  {
    v3 = *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count") <= v3)
      break;
    objc_msgSend(v18, "eventBody");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v7 = v6;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectAtIndexedSubscript:", *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endTimestamp");
    v10 = v9;

    if (v7 <= v10)
      break;
    if (objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectAtIndexedSubscript:", *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "populateAppLaunches:", *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
    }
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  v12 = *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count") == v12;
  v14 = v18;
  if (!v13)
  {
    objc_msgSend(v18, "eventBody");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v18;
    if (v15)
    {
      v16 = *(void **)(a1 + 40);
      objc_msgSend(v18, "eventBody");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v17);

      v14 = v18;
    }
  }

}

- (void)populateInitialSessionsFromScreenTransitions
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  ATXModeScoringSession *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  id v27;
  id v28;
  ATXModeScoringSession *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  id v35;
  NSArray *sessions;
  NSArray *v37;
  NSArray *v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v38 = (NSArray *)objc_opt_new();
  +[ATXDeviceBacklightHelper getScreenOnIntervalsBetweenStartDate:endDate:](ATXDeviceBacklightHelper, "getScreenOnIntervalsBetweenStartDate:endDate:", self->_startDate, self->_endDate);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v41;
    while (1)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v41 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (v5)
        {
          objc_msgSend(v5, "endDate");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "startDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[ATXModeScoringSessionRange _areTimesClose:secondTime:](self, "_areTimesClose:secondTime:", v9, v10))
          {
            objc_msgSend(v8, "endDate");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "timeIntervalSinceReferenceDate");
            v13 = v12;
            objc_msgSend(v5, "startDate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "timeIntervalSinceReferenceDate");
            v16 = v15;

            if (v13 > v16)
            {
              v17 = objc_alloc(MEMORY[0x1E0CB3588]);
              objc_msgSend(v5, "startDate");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "endDate");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v17, "initWithStartDate:endDate:", v18, v19);

              v5 = (id)v20;
              continue;
            }
          }
          else
          {

          }
          v21 = [ATXModeScoringSession alloc];
          objc_msgSend(v5, "startDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "timeIntervalSinceReferenceDate");
          v24 = v23;
          objc_msgSend(v5, "endDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "timeIntervalSinceReferenceDate");
          v27 = -[ATXModeScoringSession initFromStartTime:endTime:modeEntityStore:](v21, "initFromStartTime:endTime:modeEntityStore:", self->_modeEntityStore, v24, v26);

          -[NSArray addObject:](v38, "addObject:", v27);
          v28 = v8;

          v5 = v28;
        }
        else
        {
          v5 = v8;
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (!v4)
        goto LABEL_17;
    }
  }
  v5 = 0;
LABEL_17:
  v29 = [ATXModeScoringSession alloc];
  objc_msgSend(v5, "startDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "timeIntervalSinceReferenceDate");
  v32 = v31;
  objc_msgSend(v5, "endDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "timeIntervalSinceReferenceDate");
  v35 = -[ATXModeScoringSession initFromStartTime:endTime:modeEntityStore:](v29, "initFromStartTime:endTime:modeEntityStore:", self->_modeEntityStore, v32, v34);

  -[NSArray addObject:](v38, "addObject:", v35);
  sessions = self->_sessions;
  self->_sessions = v38;
  v37 = v38;

}

- (void)coalesceSessions
{
  NSArray *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  NSArray *sessions;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (NSArray *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  -[NSArray _pas_filteredArrayWithTest:](self->_sessions, "_pas_filteredArrayWithTest:", &__block_literal_global_12_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (!-[ATXModeScoringSessionRange _shouldCoaleseNextSession:currentBuffer:](self, "_shouldCoaleseNextSession:currentBuffer:", v10, v4))
        {
          +[ATXModeScoringSession coalesceSessions:modeEntityStore:](ATXModeScoringSession, "coalesceSessions:modeEntityStore:", v4, self->_modeEntityStore);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v3, "addObject:", v11);

          objc_msgSend(v4, "removeAllObjects");
        }
        objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  if (objc_msgSend(v4, "count"))
  {
    +[ATXModeScoringSession coalesceSessions:modeEntityStore:](ATXModeScoringSession, "coalesceSessions:modeEntityStore:", v4, self->_modeEntityStore);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v12);

  }
  sessions = self->_sessions;
  self->_sessions = v3;

}

uint64_t __46__ATXModeScoringSessionRange_coalesceSessions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLabeled");
}

- (BOOL)_shouldCoaleseNextSession:(id)a3 currentBuffer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  BOOL v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    +[ATXModeScoringSession coalesceSessions:modeEntityStore:](ATXModeScoringSession, "coalesceSessions:modeEntityStore:", v7, self->_modeEntityStore);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "topMode");
    if (objc_msgSend(v8, "isStronglyCorrelatedWithTopMode"))
      v10 = 2;
    else
      v10 = 1;
    if ((objc_msgSend(v6, "hasModeWithinRank:rank:", v9, v10) & 1) != 0 || (objc_msgSend(v6, "duration"), v11 < 30.0))
    {
      v17[0] = v8;
      v17[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXModeScoringSession coalesceSessions:modeEntityStore:](ATXModeScoringSession, "coalesceSessions:modeEntityStore:", v12, self->_modeEntityStore);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "hasModeWithinRank:rank:", v9, 1))
      {
        objc_msgSend(v8, "secondsUntilOtherSession:", v6);
        v15 = v14 < 3600.0;
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSArray)sessions
{
  return self->_sessions;
}

- (ATXModeEntityStore)modeEntityStore
{
  return self->_modeEntityStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeEntityStore, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
