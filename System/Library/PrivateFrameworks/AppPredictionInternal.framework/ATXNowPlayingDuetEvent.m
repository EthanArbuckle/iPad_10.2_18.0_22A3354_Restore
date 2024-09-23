@implementation ATXNowPlayingDuetEvent

- (ATXNowPlayingDuetEvent)initWithBundleId:(id)a3 track:(id)a4 nowPlayingState:(int64_t)a5 startDate:(id)a6 endDate:(id)a7
{
  id v12;
  id v13;
  ATXNowPlayingDuetEvent *v14;
  uint64_t v15;
  NSString *bundleId;
  uint64_t v17;
  NSString *track;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ATXNowPlayingDuetEvent;
  v14 = -[ATXDuetEvent initWithStartDate:endDate:](&v20, sel_initWithStartDate_endDate_, a6, a7);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    bundleId = v14->_bundleId;
    v14->_bundleId = (NSString *)v15;

    v17 = objc_msgSend(v13, "copy");
    track = v14->_track;
    v14->_track = (NSString *)v17;

    v14->_nowPlayingState = a5;
  }

  return v14;
}

- (ATXNowPlayingDuetEvent)initWithDKEvent:(id)a3
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  ATXNowPlayingDuetEvent *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v25;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXNowPlayingDuetEvent.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

  }
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject isEqualToString:](v9, "isEqualToString:", CFSTR("unknown")))
    {
      __atxlog_handle_default();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ATXNowPlayingDuetEvent initWithDKEvent:].cold.1();
    }
    else
    {
      +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allInstalledAppsKnownToSpringBoard");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsObject:", v9);

      if ((v14 & 1) != 0)
      {
        objc_msgSend(v5, "metadata");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D15AA0], "title");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v16);
        v10 = objc_claimAutoreleasedReturnValue();

        if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v5, "metadata");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D15AA0], "playing");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "integerValue");

          if (v20)
          {
            objc_msgSend(v5, "startDate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "endDate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            self = -[ATXNowPlayingDuetEvent initWithBundleId:track:nowPlayingState:startDate:endDate:](self, "initWithBundleId:track:nowPlayingState:startDate:endDate:", v9, v10, v20, v21, v22);

            v11 = self;
LABEL_21:

            goto LABEL_22;
          }
          __atxlog_handle_default();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[ATXNowPlayingDuetEvent initWithDKEvent:].cold.3();
        }
        else
        {
          __atxlog_handle_default();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[ATXNowPlayingDuetEvent initWithDKEvent:].cold.2((uint64_t)v10, v23);
        }

      }
      else
      {
        __atxlog_handle_default();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[ATXNowPlayingDuetEvent initWithDKEvent:].cold.4();
      }
    }
    v11 = 0;
    goto LABEL_21;
  }
  __atxlog_handle_default();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[ATXNowPlayingDuetEvent initWithDKEvent:].cold.5(v5, v9);
  v11 = 0;
LABEL_22:

  return v11;
}

- (ATXNowPlayingDuetEvent)initWithCurrentContextStoreValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  ATXNowPlayingDuetEvent *v29;
  ATXNowPlayingDuetEvent *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  const __CFString *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v39;

  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForNowPlayingDataDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    __atxlog_handle_default();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[ATXNowPlayingDuetEvent initWithCurrentContextStoreValues].cold.1();

    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[ATXNowPlayingDuetEvent initWithCurrentContextStoreValues].cold.5();

    v33 = (void *)MEMORY[0x1E0C99DA0];
    v34 = *MEMORY[0x1E0C99768];
    v35 = CFSTR("ContextStore's 'keyPathForNowPlayingDataDictionary' is not an NSDictionary.");
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0D15C58], "nowPlayingStatusKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    __atxlog_handle_default();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[ATXNowPlayingDuetEvent initWithCurrentContextStoreValues].cold.4();

    v33 = (void *)MEMORY[0x1E0C99DA0];
    v34 = *MEMORY[0x1E0C99768];
    v35 = CFSTR("Value for 'nowPlayingStatusKey' in ContextStore's 'keyPathForNowPlayingDataDictionary' is not an NSNumber.");
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0D15C58], "nowPlayingStatusKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  objc_msgSend(MEMORY[0x1E0D15C58], "nowPlayingBundleIdKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v14 = objc_opt_isKindOfClass();

  if ((v14 & 1) == 0)
  {
    __atxlog_handle_default();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[ATXNowPlayingDuetEvent initWithCurrentContextStoreValues].cold.3();

    v33 = (void *)MEMORY[0x1E0C99DA0];
    v34 = *MEMORY[0x1E0C99768];
    v35 = CFSTR("Value for 'nowPlayingBundleIdKey' in ContextStore's 'keyPathForNowPlayingDataDictionary' is not an NSString.");
LABEL_25:
    objc_msgSend(v33, "raise:format:", v34, v35);
LABEL_26:
    v30 = 0;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0D15C58], "nowPlayingBundleIdKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (__CFString *)v16;
  else
    v18 = &stru_1E82FDC98;
  v19 = v18;

  objc_msgSend(MEMORY[0x1E0D15C58], "nowPlayingTrackKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v22 = objc_opt_isKindOfClass();

  if ((v22 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D15C58], "nowPlayingTrackKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    if (v24)
      v26 = (__CFString *)v24;
    else
      v26 = &stru_1E82FDC98;
    v27 = v26;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[ATXNowPlayingDuetEvent initWithBundleId:track:nowPlayingState:startDate:endDate:](self, "initWithBundleId:track:nowPlayingState:startDate:endDate:", v19, v27, v11, v28, v28);

    self = v29;
    v30 = self;
  }
  else
  {
    __atxlog_handle_default();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[ATXNowPlayingDuetEvent initWithCurrentContextStoreValues].cold.2();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Value for 'nowPlayingTrackKey' in ContextStore's 'keyPathForNowPlayingDataDictionary' is not an NSString."));
    v30 = 0;
  }

LABEL_27:
  return v30;
}

- (id)identifier
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ - %@ - %ld"), self->_bundleId, self->_track, self->_nowPlayingState);
}

- (id)description
{
  id v3;
  NSString *bundleId;
  NSString *track;
  int64_t nowPlayingState;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  bundleId = self->_bundleId;
  track = self->_track;
  nowPlayingState = self->_nowPlayingState;
  -[ATXDuetEvent startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDuetEvent endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("App bundleId: %@, Track: %@, Now playing status: %ld, start date: %@, end date: %@"), bundleId, track, nowPlayingState, v7, v8);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ATXDuetEvent startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("codingKeyForStartDate"));

  -[ATXDuetEvent endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("codingKeyForEndDate"));

  -[ATXNowPlayingDuetEvent bundleId](self, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("codingKeyForBundleId"));

  -[ATXNowPlayingDuetEvent track](self, "track");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("codingKeyForTrack"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[ATXNowPlayingDuetEvent nowPlayingState](self, "nowPlayingState"), CFSTR("codingKeyForNowPlayingState"));
}

- (ATXNowPlayingDuetEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXNowPlayingDuetEvent *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_anchor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("codingKeyForStartDate"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.NowPlaying"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v4, "error"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_anchor();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("codingKeyForEndDate"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.NowPlaying"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && (objc_msgSend(v4, "error"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, !v15))
    {
      v16 = (void *)MEMORY[0x1E0D81610];
      v17 = objc_opt_class();
      __atxlog_handle_anchor();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v17, CFSTR("codingKeyForBundleId"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.NowPlaying"), -1, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19
        && (objc_msgSend(v4, "error"), v20 = (void *)objc_claimAutoreleasedReturnValue(), v20, !v20))
      {
        v21 = (void *)MEMORY[0x1E0D81610];
        v22 = objc_opt_class();
        __atxlog_handle_anchor();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v22, CFSTR("codingKeyForTrack"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.NowPlaying"), -1, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24
          || (objc_msgSend(v4, "error"), v25 = (void *)objc_claimAutoreleasedReturnValue(), v25, v25)
          || (v26 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("codingKeyForNowPlayingState")),
              -[ATXNowPlayingDuetEvent checkAndReportDecodingFailureIfNeededForNSInteger:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForNSInteger:key:coder:errorDomain:errorCode:", v26, CFSTR("codingKeyForNowPlayingState"), v4, CFSTR("com.apple.proactive.ATXDuetEvent.NowPlaying"), -1)))
        {
          v10 = 0;
        }
        else
        {
          self = -[ATXNowPlayingDuetEvent initWithBundleId:track:nowPlayingState:startDate:endDate:](self, "initWithBundleId:track:nowPlayingState:startDate:endDate:", v19, v24, v26, v8, v14);
          v10 = self;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)track
{
  return self->_track;
}

- (int64_t)nowPlayingState
{
  return self->_nowPlayingState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_track, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)initWithDKEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Received now playing event but bundleId is 'unknown'.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithDKEvent:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Value for metadata key for NowPlaying 'title' is not a string, %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithDKEvent:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Value for metadata key for NowPlaying 'playing' is 'unknown'.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithDKEvent:.cold.4()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEBUG, "Skipping apps not on SpringBoard.", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)initWithDKEvent:(void *)a1 .cold.5(void *a1, NSObject *a2)
{
  void *v3;
  objc_class *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v7;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Value of _DKEvent was %@, not %@", (uint8_t *)&v8, 0x16u);

}

- (void)initWithCurrentContextStoreValues
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ContextStore's 'keyPathForNowPlayingDataDictionary' is not an NSDictionary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
