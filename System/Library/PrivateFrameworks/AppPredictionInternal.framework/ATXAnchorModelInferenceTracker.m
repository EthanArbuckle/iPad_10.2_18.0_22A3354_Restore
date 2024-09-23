@implementation ATXAnchorModelInferenceTracker

- (ATXAnchorModelInferenceTracker)init
{
  ATXAnchorModelInferenceTracker *v2;
  id v3;
  uint64_t v4;
  NSUserDefaults *defaults;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXAnchorModelInferenceTracker;
  v2 = -[ATXAnchorModelInferenceTracker init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v4 = objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v4;

  }
  return v2;
}

- (void)trackInferenceStartedForInferenceEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v7, "retryCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "integerValue") + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRetryCount:", v6);

  -[ATXAnchorModelInferenceTracker persistInferenceEvent:](self, "persistInferenceEvent:", v7);
}

- (void)trackInferenceFinishedForInferenceEvent:(id)a3
{
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("ATXAnchorModelInferenceTrackerDefaultsKey"));
}

- (void)trackInferenceFailedForInferenceEvent:(id)a3
{
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("ATXAnchorModelInferenceTrackerDefaultsKey"));
}

- (void)clearAllIncompleteInferenceEvents
{
  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("ATXAnchorModelInferenceTrackerDefaultsKey"));
}

- (id)inferenceEventsToTryAgain
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[ATXAnchorModelInferenceTracker fetchPersistedInferenceEvents](self, "fetchPersistedInferenceEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__ATXAnchorModelInferenceTracker_inferenceEventsToTryAgain__block_invoke;
  v6[3] = &unk_1E82E7688;
  v6[4] = self;
  objc_msgSend(v3, "_pas_filteredArrayWithTest:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __59__ATXAnchorModelInferenceTracker_inferenceEventsToTryAgain__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  double v9;
  double v10;
  _BOOL4 v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "retryCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  if (v5 >= 4)
  {
    __atxlog_handle_anchor();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134217984;
      v15 = 3;
      v7 = "Found an incomplete inference event, but it has already been retried %ld times. Tracking it as a failed inference event.";
LABEL_7:
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v14, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  objc_msgSend(v3, "dateFirstAdded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceNow");
  v10 = v9;

  __atxlog_handle_anchor();
  v6 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v10 < -1200.0)
  {
    if (v11)
    {
      v14 = 134217984;
      v15 = 0x4034000000000000;
      v7 = "Found an incomplete inference event, but it originally happened more than %.2f minutes ago. Tracking it as a "
           "failed inference event.";
      goto LABEL_7;
    }
LABEL_8:

    objc_msgSend(*(id *)(a1 + 32), "trackInferenceFailedForInferenceEvent:", v3);
    v12 = 0;
    goto LABEL_12;
  }
  if (v11)
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "Found an incomplete inference event. Going to retry it.", (uint8_t *)&v14, 2u);
  }

  v12 = 1;
LABEL_12:

  return v12;
}

- (void)persistInferenceEvent:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  v6 = v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 0;
  if (v7)
  {
    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v4, CFSTR("ATXAnchorModelInferenceTrackerDefaultsKey"));
  }
  else
  {
    __atxlog_handle_anchor();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXAnchorModelInferenceTracker persistInferenceEvent:].cold.1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unable to archive ATXAnchorModelIncompleteInferenceEvent with error: %@"), v6);
  }

}

- (id)fetchPersistedInferenceEvents
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("ATXAnchorModelInferenceTrackerDefaultsKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1CAA48B6C]();
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, &v16);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v16;
    objc_autoreleasePoolPop(v3);
    if (v4)
      v6 = v5 == 0;
    else
      v6 = 0;
    if (v6)
    {
      v17[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      __atxlog_handle_anchor();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[ATXAnchorModelInferenceTracker fetchPersistedInferenceEvents].cold.2((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unable to unarchive ATXAnchorModelIncompleteInferenceEvent with error: %@"), v5);
      v14 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    __atxlog_handle_anchor();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ATXAnchorModelInferenceTracker fetchPersistedInferenceEvents].cold.1(v5);
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

- (void)persistInferenceEvent:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Unable to archive ATXAnchorModelIncompleteInferenceEvent with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)fetchPersistedInferenceEvents
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Unable to unarchive ATXAnchorModelIncompleteInferenceEvent with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
