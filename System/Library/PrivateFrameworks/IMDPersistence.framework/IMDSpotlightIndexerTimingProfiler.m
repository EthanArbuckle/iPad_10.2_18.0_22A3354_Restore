@implementation IMDSpotlightIndexerTimingProfiler

- (void)startMainTimerWithExpectedTimeoutInterval:(double)a3
{
  NSObject *v4;
  IMTimingCollection *v5;
  IMTimingCollection *timingCollection;
  NSMutableSet *v7;
  NSMutableSet *runningTimers;
  NSMutableArray *v9;
  NSMutableArray *runTimers;
  NSArray *abortedTimers;
  NSObject *v12;
  double v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[IMDSpotlightIndexerTimingProfiler setTimeout:](self, "setTimeout:", a3);
  if (self->_timingCollection)
  {
    IMLogHandleForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1ABC5DEA0();

  }
  else
  {
    v5 = (IMTimingCollection *)objc_alloc_init(MEMORY[0x1E0D36AE8]);
    timingCollection = self->_timingCollection;
    self->_timingCollection = v5;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    runningTimers = self->_runningTimers;
    self->_runningTimers = v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    runTimers = self->_runTimers;
    self->_runTimers = v9;

    abortedTimers = self->_abortedTimers;
    self->_abortedTimers = 0;

    IMLogHandleForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[IMDSpotlightIndexerTimingProfiler timeout](self, "timeout");
      v14 = 134217984;
      v15 = (uint64_t)v13;
      _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "Starting profiling -- we have %ld seconds to finish", (uint8_t *)&v14, 0xCu);
    }

    -[IMTimingCollection startTimingForKey:](self->_timingCollection, "startTimingForKey:", CFSTR("All Indexers"));
  }
}

- (void)startTimingForKey:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    if (self->_timingCollection)
    {
      if (!-[NSMutableSet containsObject:](self->_runningTimers, "containsObject:", v4))
      {
        -[NSMutableSet addObject:](self->_runningTimers, "addObject:", v4);
        -[NSMutableArray addObject:](self->_runTimers, "addObject:", v4);
        -[IMTimingCollection startTimingForKey:](self->_timingCollection, "startTimingForKey:", v4);
        goto LABEL_11;
      }
      IMLogHandleForCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_1ABC5DF58();
    }
    else
    {
      IMLogHandleForCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_1ABC5DEF8();
    }
  }
  else
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1ABC5DECC();
  }

LABEL_11:
}

- (void)startTimingForKey:(id)a3 iteration:(int64_t)a4
{
  NSObject *v5;
  id v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%ld"), a3, a4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[IMDSpotlightIndexerTimingProfiler startTimingForKey:](self, "startTimingForKey:", v6);

  }
  else
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1ABC5DECC();

  }
}

- (void)stopTimingForKey:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (!v4)
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1ABC5DECC();
    goto LABEL_11;
  }
  if (!self->_timingCollection)
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1ABC5DFB8();
    goto LABEL_11;
  }
  if (!-[NSMutableSet containsObject:](self->_runningTimers, "containsObject:", v4))
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1ABC5E018();
LABEL_11:

    goto LABEL_12;
  }
  -[IMTimingCollection stopTimingForKey:](self->_timingCollection, "stopTimingForKey:", v4);
  -[NSMutableSet removeObject:](self->_runningTimers, "removeObject:", v4);
LABEL_12:

}

- (void)stopTimingForKey:(id)a3 iteration:(int64_t)a4
{
  NSObject *v5;
  id v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%ld"), a3, a4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[IMDSpotlightIndexerTimingProfiler stopTimingForKey:](self, "stopTimingForKey:", v6);

  }
  else
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1ABC5DECC();

  }
}

- (void)logResults:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableArray *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  NSArray *abortedTimers;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  uint32_t v21;
  uint64_t v24;
  double v25;
  double v26;
  NSArray *v27;
  NSObject *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  double v32;
  NSMutableSet *runningTimers;
  NSArray *v34;
  NSMutableArray *runTimers;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  double v44;
  __int16 v45;
  double v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  double v50;
  _BYTE v51[128];
  uint64_t v52;

  v3 = a3;
  v52 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = self->_runTimers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
  if (!v6)
  {
    v9 = 0;
    v11 = 0.0;
    goto LABEL_29;
  }
  v8 = v6;
  v9 = 0;
  v10 = *(_QWORD *)v38;
  v11 = 0.0;
  *(_QWORD *)&v7 = 138412290;
  v36 = v7;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v38 != v10)
        objc_enumerationMutation(v5);
      v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v12);
      -[IMTimingCollection totalTimeForKey:](self->_timingCollection, "totalTimeForKey:", v13, v36);
      v15 = v14;
      if (v14 > v11)
      {
        v16 = v13;

        v11 = v15;
        v9 = v16;
      }
      abortedTimers = self->_abortedTimers;
      if (abortedTimers && -[NSArray containsObject:](abortedTimers, "containsObject:", v13))
      {
        IMLogHandleForCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v42 = (uint64_t)v13;
          v43 = 2048;
          v44 = v15;
          v19 = v18;
          v20 = "Timing '%@' was ABORTED after %fs";
          v21 = 22;
LABEL_25:
          _os_log_error_impl(&dword_1ABB60000, v19, OS_LOG_TYPE_ERROR, v20, buf, v21);
        }
      }
      else
      {
        if (v15 == 0.0 && v3)
        {
          IMLogHandleForCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            goto LABEL_21;
          *(_DWORD *)buf = v36;
          v42 = (uint64_t)v13;
          v19 = v18;
          v20 = "Timing '%@' was never run";
          v21 = 12;
          goto LABEL_25;
        }
        if (!v3)
          goto LABEL_22;
        IMLogHandleForCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v42 = (uint64_t)v13;
          v43 = 2048;
          v44 = v15;
          _os_log_impl(&dword_1ABB60000, v18, OS_LOG_TYPE_INFO, "Timing '%@' ran ok in %fs", buf, 0x16u);
        }
      }
LABEL_21:

LABEL_22:
      ++v12;
    }
    while (v8 != v12);
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    v8 = v24;
  }
  while (v24);
LABEL_29:

  -[IMTimingCollection totalTimeForKey:](self->_timingCollection, "totalTimeForKey:", CFSTR("All Indexers"));
  v26 = v25;
  v27 = self->_abortedTimers;
  if (v27 && -[NSArray count](v27, "count"))
  {
    IMLogHandleForCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = -[NSMutableArray count](self->_runTimers, "count");
      -[IMDSpotlightIndexerTimingProfiler timeout](self, "timeout");
      *(_DWORD *)buf = 134218496;
      v42 = v29;
      v43 = 2048;
      v44 = v26;
      v45 = 2048;
      v46 = v30 - v26;
      _os_log_error_impl(&dword_1ABB60000, v28, OS_LOG_TYPE_ERROR, "ABORTED -- %ld timings ran in %fs (%fs remaining before timeout).", buf, 0x20u);
    }
  }
  else
  {
    IMLogHandleForCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v31 = -[NSMutableArray count](self->_runTimers, "count");
      -[IMDSpotlightIndexerTimingProfiler timeout](self, "timeout");
      *(_DWORD *)buf = 134219010;
      v42 = v31;
      v43 = 2048;
      v44 = v26;
      v45 = 2048;
      v46 = v32 - v26;
      v47 = 2112;
      v48 = v9;
      v49 = 2048;
      v50 = v11;
      _os_log_impl(&dword_1ABB60000, v28, OS_LOG_TYPE_INFO, "Finished %ld timings in %fs (%fs remaining before timeout). Slowest timing: %@ at %fs", buf, 0x34u);
    }
  }

  runningTimers = self->_runningTimers;
  self->_runningTimers = 0;

  v34 = self->_abortedTimers;
  self->_abortedTimers = 0;

  runTimers = self->_runTimers;
  self->_runTimers = 0;

}

- (void)stopProfilingAfterIndexersBailed
{
  NSMutableSet *runningTimers;
  NSArray *abortedTimers;
  NSMutableArray *runTimers;
  IMTimingCollection *timingCollection;
  NSObject *v7;
  uint8_t v8[16];

  if (self->_timingCollection)
  {
    runningTimers = self->_runningTimers;
    self->_runningTimers = 0;

    abortedTimers = self->_abortedTimers;
    self->_abortedTimers = 0;

    runTimers = self->_runTimers;
    self->_runTimers = 0;

    timingCollection = self->_timingCollection;
    self->_timingCollection = 0;

    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "Bailed on profiling (not an error)", v8, 2u);
    }
  }
  else
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1ABC5E078();
  }

}

- (void)abortCurrentTimers
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *v8;
  NSArray *abortedTimers;
  NSMutableSet *runningTimers;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_runningTimers)
  {
    -[IMTimingCollection stopTimingForKey:](self->_timingCollection, "stopTimingForKey:", CFSTR("All Indexers"));
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = self->_runningTimers;
    v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          -[IMTimingCollection stopTimingForKey:](self->_timingCollection, "stopTimingForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7++), (_QWORD)v11);
        }
        while (v5 != v7);
        v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

    -[NSMutableSet allObjects](self->_runningTimers, "allObjects");
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    abortedTimers = self->_abortedTimers;
    self->_abortedTimers = v8;

    runningTimers = self->_runningTimers;
    self->_runningTimers = 0;

  }
}

- (void)stopMainTimerAndLogAfterFailure
{
  NSObject *v3;
  NSObject *v4;

  if (self->_timingCollection)
  {
    -[IMDSpotlightIndexerTimingProfiler abortCurrentTimers](self, "abortCurrentTimers");
    IMLogHandleForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1ABC5E0D0();

    -[IMDSpotlightIndexerTimingProfiler logResults:](self, "logResults:", 1);
  }
  else
  {
    IMLogHandleForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1ABC5E0A4();

  }
}

- (void)stopMainTimerAndLogAfterSuccess
{
  IMTimingCollection *timingCollection;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSMutableSet *runningTimers;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  timingCollection = self->_timingCollection;
  if (timingCollection)
  {
    -[IMTimingCollection stopTimingForKey:](timingCollection, "stopTimingForKey:", CFSTR("All Indexers"));
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = self->_runningTimers;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
          IMLogHandleForCategory();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v18 = v9;
            _os_log_error_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_ERROR, "Timing '%@' was still running after profiler was stopped", buf, 0xCu);
          }

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      }
      while (v6);
    }

    runningTimers = self->_runningTimers;
    self->_runningTimers = 0;

    -[IMDSpotlightIndexerTimingProfiler logResults:](self, "logResults:", 0);
  }
  else
  {
    IMLogHandleForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1ABC5E0A4();

  }
}

- (IMTimingCollection)timingCollection
{
  return self->_timingCollection;
}

- (void)setTimingCollection:(id)a3
{
  objc_storeStrong((id *)&self->_timingCollection, a3);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSMutableSet)runningTimers
{
  return self->_runningTimers;
}

- (void)setRunningTimers:(id)a3
{
  objc_storeStrong((id *)&self->_runningTimers, a3);
}

- (NSMutableArray)runTimers
{
  return self->_runTimers;
}

- (void)setRunTimers:(id)a3
{
  objc_storeStrong((id *)&self->_runTimers, a3);
}

- (NSArray)abortedTimers
{
  return self->_abortedTimers;
}

- (void)setAbortedTimers:(id)a3
{
  objc_storeStrong((id *)&self->_abortedTimers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abortedTimers, 0);
  objc_storeStrong((id *)&self->_runTimers, 0);
  objc_storeStrong((id *)&self->_runningTimers, 0);
  objc_storeStrong((id *)&self->_timingCollection, 0);
}

@end
