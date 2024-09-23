@implementation ATXModeSuggestionScorer

- (ATXModeSuggestionScorer)initWithModeUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originBundleId:(id)a6 originAnchorType:(id)a7 confidenceScore:(double)a8 secondsSinceSuggested:(double)a9 serializedTriggers:(id)a10
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ATXModeSuggestionScorer *v23;
  void *v25;
  void *v26;
  id v28;

  v28 = a10;
  v15 = a7;
  v16 = a6;
  v17 = a3;
  v26 = (void *)objc_opt_new();
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C78]), "initWithStoreConfig:", 0);
  v18 = (void *)objc_opt_new();
  v19 = (void *)objc_opt_new();
  BiomeLibrary();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "UserFocus");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "ComputedMode");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[ATXModeSuggestionScorer initWithModeUUID:modeType:origin:originBundleId:originAnchorType:confidenceScore:secondsSinceSuggested:serializedTriggers:configuredModeService:feedbackStream:feedbackHistogramHelper:appLaunchStream:groundTruthModeStream:](self, "initWithModeUUID:modeType:origin:originBundleId:originAnchorType:confidenceScore:secondsSinceSuggested:serializedTriggers:configuredModeService:feedbackStream:feedbackHistogramHelper:appLaunchStream:groundTruthModeStream:", v17, a4, a5, v16, v15, v28, a8, a9, v26, v25, v18, v19, v22);

  return v23;
}

- (ATXModeSuggestionScorer)initWithModeUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originBundleId:(id)a6 originAnchorType:(id)a7 confidenceScore:(double)a8 secondsSinceSuggested:(double)a9 serializedTriggers:(id)a10 configuredModeService:(id)a11 feedbackStream:(id)a12 feedbackHistogramHelper:(id)a13 appLaunchStream:(id)a14 groundTruthModeStream:(id)a15
{
  id v21;
  id v22;
  ATXModeSuggestionScorer *v23;
  uint64_t v24;
  NSString *modeUUID;
  uint64_t v26;
  NSArray *triggers;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  objc_super v38;

  v37 = a3;
  v36 = a6;
  v35 = a7;
  v21 = a10;
  v34 = a11;
  v33 = a12;
  v32 = a13;
  v31 = a14;
  v22 = a15;
  v38.receiver = self;
  v38.super_class = (Class)ATXModeSuggestionScorer;
  v23 = -[ATXModeSuggestionScorer init](&v38, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v37, "copy");
    modeUUID = v23->_modeUUID;
    v23->_modeUUID = (NSString *)v24;

    v23->_modeType = a4;
    v23->_origin = a5;
    objc_storeStrong((id *)&v23->_originBundleId, a6);
    objc_storeStrong((id *)&v23->_originAnchorType, a7);
    v23->_confidenceScore = a8;
    v23->_secondsSinceSuggested = a9;
    ATXDeserializeTriggers();
    v26 = objc_claimAutoreleasedReturnValue();
    triggers = v23->_triggers;
    v23->_triggers = (NSArray *)v26;

    objc_storeStrong((id *)&v23->_configuredModeService, a11);
    objc_storeStrong((id *)&v23->_feedbackStream, a12);
    objc_storeStrong((id *)&v23->_feedbackHistogramHelper, a13);
    objc_storeStrong((id *)&v23->_appLaunchStream, a14);
    objc_storeStrong((id *)&v23->_groundTruthModeStream, a15);
  }

  return v23;
}

- (BOOL)isModeConfigured
{
  NSNumber *cachedIsModeConfigured;
  DNDModeConfiguration *v4;
  DNDModeConfiguration *cachedDNDMode;
  NSNumber *v6;
  NSNumber *v7;

  cachedIsModeConfigured = self->_cachedIsModeConfigured;
  if (!cachedIsModeConfigured)
  {
    if (self->_modeUUID)
    {
      -[ATXConfiguredModeService DNDModeConfigurationForActivityWithUUID:](self->_configuredModeService, "DNDModeConfigurationForActivityWithUUID:");
      v4 = (DNDModeConfiguration *)objc_claimAutoreleasedReturnValue();
      cachedDNDMode = self->_cachedDNDMode;
      self->_cachedDNDMode = v4;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_cachedDNDMode != 0);
      v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (NSNumber *)MEMORY[0x1E0C9AAA0];
    }
    v7 = self->_cachedIsModeConfigured;
    self->_cachedIsModeConfigured = v6;

    cachedIsModeConfigured = self->_cachedIsModeConfigured;
  }
  return -[NSNumber BOOLValue](cachedIsModeConfigured, "BOOLValue");
}

- (BOOL)isUserCurrentlyInMode
{
  NSNumber *cachedIsUserCurrentlyInMode;

  if (self->_cachedIsUserCurrentlyInMode)
  {
    -[ATXModeSuggestionScorer _populateCachedDataAboutUsersCurrentMode](self, "_populateCachedDataAboutUsersCurrentMode");
    cachedIsUserCurrentlyInMode = self->_cachedIsUserCurrentlyInMode;
  }
  else
  {
    cachedIsUserCurrentlyInMode = 0;
  }
  return -[NSNumber BOOLValue](cachedIsUserCurrentlyInMode, "BOOLValue");
}

- (BOOL)isUserCurrentlyInADifferentMode
{
  NSNumber *cachedIsUserCurrentlyInADifferentMode;

  cachedIsUserCurrentlyInADifferentMode = self->_cachedIsUserCurrentlyInADifferentMode;
  if (!cachedIsUserCurrentlyInADifferentMode)
  {
    -[ATXModeSuggestionScorer _populateCachedDataAboutUsersCurrentMode](self, "_populateCachedDataAboutUsersCurrentMode");
    cachedIsUserCurrentlyInADifferentMode = self->_cachedIsUserCurrentlyInADifferentMode;
  }
  return -[NSNumber BOOLValue](cachedIsUserCurrentlyInADifferentMode, "BOOLValue");
}

- (void)_populateCachedDataAboutUsersCurrentMode
{
  void *v3;
  NSNumber *v4;
  NSNumber *cachedIsUserCurrentlyInMode;
  NSNumber *v6;
  NSNumber *cachedIsUserCurrentlyInADifferentMode;
  id v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80E48]), "initWithStream:", self->_groundTruthModeStream);
  objc_msgSend(v3, "currentMode");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeSuggestionScorer _isUserCurrentlyInSuggestedMode:](self, "_isUserCurrentlyInSuggestedMode:", v8));
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  cachedIsUserCurrentlyInMode = self->_cachedIsUserCurrentlyInMode;
  self->_cachedIsUserCurrentlyInMode = v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeSuggestionScorer _isUserCurrentlyInDifferentModeFromSuggestedMode:](self, "_isUserCurrentlyInDifferentModeFromSuggestedMode:", v8));
  v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  cachedIsUserCurrentlyInADifferentMode = self->_cachedIsUserCurrentlyInADifferentMode;
  self->_cachedIsUserCurrentlyInADifferentMode = v6;

}

- (BOOL)_isUserCurrentlyInSuggestedMode:(id)a3
{
  void *v4;
  char v5;

  if (!a3 || !self->_modeUUID)
    return 0;
  objc_msgSend(a3, "mode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", self->_modeUUID);

  return v5;
}

- (BOOL)_isUserCurrentlyInDifferentModeFromSuggestedMode:(id)a3
{
  _BOOL4 v4;

  v4 = !-[ATXModeSuggestionScorer _isUserCurrentlyInSuggestedMode:](self, "_isUserCurrentlyInSuggestedMode:");
  return a3 && v4;
}

- (double)score
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double confidenceScore;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  NSObject *v28;
  NSString *modeUUID;
  uint64_t modeType;
  NSNumber *feedbackScore;
  double v32;
  double secondsSinceSuggested;
  int v35;
  NSString *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  __int16 v43;
  NSNumber *v44;
  __int16 v45;
  double v46;
  __int16 v47;
  _BOOL4 v48;
  __int16 v49;
  _BOOL4 v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  -[ATXModeSuggestionScorer _scoringWeights](self, "_scoringWeights");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("confidenceScoreWeight"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("feedbackScoreWeight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("secondsSinceSuggestedWeight"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isModeConfiguredWeight"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isUserCurrentlyInModeWeight"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  -[ATXModeSuggestionScorer _populateFeedbackScoresIfNeeded](self, "_populateFeedbackScoresIfNeeded");
  confidenceScore = self->_confidenceScore;
  -[NSNumber doubleValue](self->_feedbackScore, "doubleValue");
  v21 = v9 * v20 + v6 * confidenceScore + v12 * self->_secondsSinceSuggested;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeSuggestionScorer isModeConfigured](self, "isModeConfigured"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  v24 = v21 + v15 * v23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeSuggestionScorer isUserCurrentlyInMode](self, "isUserCurrentlyInMode"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "doubleValue");
  v27 = v24 + v18 * v26;

  __atxlog_handle_modes();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    modeUUID = self->_modeUUID;
    modeType = self->_modeType;
    feedbackScore = self->_feedbackScore;
    v32 = self->_confidenceScore;
    secondsSinceSuggested = self->_secondsSinceSuggested;
    v35 = 138545154;
    v36 = modeUUID;
    v37 = 2048;
    v38 = modeType;
    v39 = 2048;
    v40 = v27;
    v41 = 2048;
    v42 = v32;
    v43 = 2112;
    v44 = feedbackScore;
    v45 = 2048;
    v46 = secondsSinceSuggested;
    v47 = 1024;
    v48 = -[ATXModeSuggestionScorer isModeConfigured](self, "isModeConfigured");
    v49 = 1024;
    v50 = -[ATXModeSuggestionScorer isUserCurrentlyInMode](self, "isUserCurrentlyInMode");
    _os_log_impl(&dword_1C9A3B000, v28, OS_LOG_TYPE_DEFAULT, "ATXModeSuggestionScorer: Calculating combined score for modeUUID: %{public}@, modeType: %lu combinedScore: %f, confidenceScore: %f, feedbackScore: %@, secondsSinceSuggested: %f, isActivityConfigured: %d, isUserCurrentlyInActivity: %d", (uint8_t *)&v35, 0x4Au);
  }

  return v27;
}

- (id)_scoringWeights
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("rankingScoreWeights"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldSuggestOnLockScreen
{
  id v3;
  void *v4;

  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v4 = (void *)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  LOBYTE(self) = -[ATXModeSuggestionScorer _shouldSuggestOnLockScreenWithDefaults:](self, "_shouldSuggestOnLockScreenWithDefaults:", v4);

  return (char)self;
}

- (BOOL)_shouldSuggestOnLockScreenWithDefaults:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  int v35;
  NSObject *v36;
  NSString *modeUUID;
  double v38;
  double v39;
  double confidenceScore;
  NSNumber *feedbackScore;
  NSNumber *rejectionsInPastWeek;
  NSNumber *totalRejections;
  NSNumber *totalIgnores;
  NSNumber *timesShownInLastDay;
  NSNumber *timesShown;
  NSNumber *rejectionsAcrossAllModesInPastDay;
  NSNumber *timesShownAcrossAllModesInPastDay;
  NSNumber *rejectionsAcrossAllModesInPastWeek;
  NSNumber *timesShownAcrossAllModesInPastWeek;
  void *v51;
  double v52;
  double v53;
  NSObject *v54;
  double v55;
  double v56;
  NSObject *v57;
  _BOOL4 v58;
  NSObject *v59;
  NSString *v60;
  double v61;
  const char *v62;
  double v63;
  NSString *v64;
  NSNumber *v65;
  double v66;
  NSString *v67;
  NSNumber *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  NSString *v73;
  double v74;
  NSString *v75;
  NSNumber *v76;
  double v77;
  NSString *v78;
  NSNumber *v79;
  double v80;
  NSString *v81;
  NSNumber *v82;
  double v83;
  NSString *v84;
  NSNumber *v85;
  double v86;
  NSString *v87;
  NSNumber *v88;
  NSObject *v89;
  uint32_t v90;
  NSString *v92;
  const __CFString *v93;
  NSObject *v94;
  NSString *v95;
  NSObject *v96;
  NSString *v97;
  NSString *v98;
  NSString *originBundleId;
  double v100;
  double v101;
  double v102;
  uint8_t buf[4];
  NSString *v104;
  __int16 v105;
  double v106;
  __int16 v107;
  double v108;
  __int16 v109;
  double v110;
  __int16 v111;
  NSNumber *v112;
  __int16 v113;
  NSNumber *v114;
  __int16 v115;
  NSNumber *v116;
  __int16 v117;
  NSNumber *v118;
  __int16 v119;
  NSNumber *v120;
  __int16 v121;
  NSNumber *v122;
  __int16 v123;
  NSNumber *v124;
  __int16 v125;
  NSNumber *v126;
  __int16 v127;
  NSNumber *v128;
  __int16 v129;
  NSNumber *v130;
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild")
    || (objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x1E0D80ED0]) & 1) == 0)
  {
    if (!-[ATXModeSuggestionScorer isModeConfigured](self, "isModeConfigured") && self->_modeType != 6)
    {
      __atxlog_handle_modes();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v7 = "ATXModeSuggestionScorer: Mode is not configured and type is not driving, should suppress mode set-up sugges"
             "tion from lockscreen";
        goto LABEL_37;
      }
LABEL_65:
      v5 = 0;
LABEL_66:

      goto LABEL_67;
    }
    if (!-[ATXModeSuggestionScorer isModeConfigured](self, "isModeConfigured")
      && -[ATXModeSuggestionScorer _hasUserSetUpModeBefore](self, "_hasUserSetUpModeBefore"))
    {
      __atxlog_handle_modes();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v7 = "ATXModeSuggestionScorer: User has configured mode before, should suppress mode set-up suggestion from lockscreen";
LABEL_37:
        _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
        goto LABEL_65;
      }
      goto LABEL_65;
    }
    if (!-[ATXModeSuggestionScorer isModeConfigured](self, "isModeConfigured")
      && self->_modeType == 6
      && !-[ATXModeSuggestionScorer _inValidLocaleForDrivingSuggestions](self, "_inValidLocaleForDrivingSuggestions"))
    {
      __atxlog_handle_modes();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v7 = "ATXModeSuggestionScorer: Mode is not configured and type is driving, should suppress mode set-up suggestion"
             " from lockscreen because user is not in valid locale";
        goto LABEL_37;
      }
      goto LABEL_65;
    }
    -[ATXModeSuggestionScorer _lockScreenSuggestionThresholds](self, "_lockScreenSuggestionThresholds");
    v6 = objc_claimAutoreleasedReturnValue();
    -[ATXModeSuggestionScorer _populateFeedbackScoresIfNeeded](self, "_populateFeedbackScoresIfNeeded");
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("confidenceScoreThreshold"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;

    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("rejectionsInPastWeekThreshold"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("totalRejectionsThreshold"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("totalIgnoresAndRejectionsThreshold"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v18;

    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("timesShownInLastDayThreshold"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v102 = v21;

    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("rejectionsAcrossAllModesInPastDayThreshold"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v24 = v23;

    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("timesShownAcrossAllModesInPastDayThreshold"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    v27 = v26;

    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("timesShownAcrossAllModesInPastWeekThreshold"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    v30 = v29;

    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("rejectionsAcrossAllModesInPastWeekThreshold"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "doubleValue");
    v33 = v32;

    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("shouldSuppressIfUserIsInADifferentMode"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "BOOLValue");

    __atxlog_handle_modes();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      modeUUID = self->_modeUUID;
      *(_QWORD *)&v38 = self->_modeType;
      BMUserFocusInferredModeTypeToActivity();
      ATXActivityTypeToString();
      v39 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      confidenceScore = self->_confidenceScore;
      feedbackScore = self->_feedbackScore;
      rejectionsInPastWeek = self->_rejectionsInPastWeek;
      totalRejections = self->_totalRejections;
      totalIgnores = self->_totalIgnores;
      timesShownInLastDay = self->_timesShownInLastDay;
      timesShown = self->_timesShown;
      rejectionsAcrossAllModesInPastDay = self->_rejectionsAcrossAllModesInPastDay;
      timesShownAcrossAllModesInPastDay = self->_timesShownAcrossAllModesInPastDay;
      timesShownAcrossAllModesInPastWeek = self->_timesShownAcrossAllModesInPastWeek;
      rejectionsAcrossAllModesInPastWeek = self->_rejectionsAcrossAllModesInPastWeek;
      *(_DWORD *)buf = 138546690;
      v104 = modeUUID;
      v105 = 2048;
      v106 = v38;
      v107 = 2114;
      v108 = v39;
      v109 = 2048;
      v110 = confidenceScore;
      v111 = 2112;
      v112 = feedbackScore;
      v113 = 2112;
      v114 = rejectionsInPastWeek;
      v115 = 2112;
      v116 = totalRejections;
      v117 = 2112;
      v118 = totalIgnores;
      v119 = 2112;
      v120 = timesShownInLastDay;
      v121 = 2114;
      v122 = timesShown;
      v123 = 2112;
      v124 = rejectionsAcrossAllModesInPastDay;
      v125 = 2112;
      v126 = timesShownAcrossAllModesInPastDay;
      v127 = 2112;
      v128 = timesShownAcrossAllModesInPastWeek;
      v129 = 2112;
      v130 = rejectionsAcrossAllModesInPastWeek;
      _os_log_impl(&dword_1C9A3B000, v36, OS_LOG_TYPE_DEFAULT, "ATXModeSuggestionScorer: Determining if mode should be suggestion on lock screen. uuid: %{public}@, modeType: %lu, modeString: %{public}@, confidenceScore: %f, feedbackScore: %@, rejectionsInPastWeek: %@, totalRejections: %@, totalIgnores: %@, timesShownInLastDay: %@, timesShown: %{public}@, rejectionsAcrossAllModesInPastDay: %@, timesShownAcrossAllModesInPastDay: %@, timesShownAcrossAllModesInPastWeek: %@, rejectionsAcrossAllModesInPastWeek: %@", buf, 0x8Eu);

    }
    if (-[ATXModeSuggestionScorer isModeConfigured](self, "isModeConfigured") || self->_modeType != 6)
    {
LABEL_24:
      if (self->_confidenceScore >= v10)
      {
        -[NSNumber doubleValue](self->_rejectionsInPastWeek, "doubleValue");
        if (v63 <= v13)
        {
          -[NSNumber doubleValue](self->_totalRejections, "doubleValue");
          if (v66 <= v16)
          {
            -[NSNumber doubleValue](self->_totalIgnores, "doubleValue");
            v70 = v69;
            -[NSNumber doubleValue](self->_totalRejections, "doubleValue");
            v72 = v70 + v71;
            if (v72 <= v19)
            {
              -[NSNumber doubleValue](self->_timesShownInLastDay, "doubleValue");
              if (v74 <= v102)
              {
                -[NSNumber doubleValue](self->_rejectionsAcrossAllModesInPastDay, "doubleValue");
                if (v77 <= v24)
                {
                  -[NSNumber doubleValue](self->_timesShownAcrossAllModesInPastDay, "doubleValue");
                  if (v80 <= v27)
                  {
                    -[NSNumber doubleValue](self->_timesShownAcrossAllModesInPastWeek, "doubleValue");
                    if (v83 <= v30)
                    {
                      -[NSNumber doubleValue](self->_rejectionsAcrossAllModesInPastWeek, "doubleValue");
                      if (v86 <= v33)
                      {
                        if (v35
                          && -[ATXModeSuggestionScorer isUserCurrentlyInADifferentMode](self, "isUserCurrentlyInADifferentMode"))
                        {
                          __atxlog_handle_modes();
                          v59 = objc_claimAutoreleasedReturnValue();
                          if (!os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                            goto LABEL_64;
                          v92 = self->_modeUUID;
                          *(_DWORD *)buf = 138543362;
                          v104 = v92;
                          v62 = "ATXModeSuggestionScorer: mode: %{public}@ should NOT be suggested on lock screen because"
                                " user is currently in another mode";
                          v89 = v59;
                          v90 = 12;
                          goto LABEL_63;
                        }
                        if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild")
                          && (v93 = (const __CFString *)*MEMORY[0x1E0D80EC8],
                              buf[0] = 0,
                              CFPreferencesGetAppBooleanValue(v93, (CFStringRef)*MEMORY[0x1E0CF9510], buf)))
                        {
                          __atxlog_handle_modes();
                          v94 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                          {
                            v95 = self->_modeUUID;
                            *(_DWORD *)buf = 138543362;
                            v104 = v95;
                            _os_log_impl(&dword_1C9A3B000, v94, OS_LOG_TYPE_DEFAULT, "ATXModeSuggestionScorer: mode: %{public}@ skipping check to see if app has been launched on two separate days", buf, 0xCu);
                          }

                        }
                        else if (-[NSString length](self->_originBundleId, "length")
                               && !-[ATXModeSuggestionScorer _hasLaunchedAppOnAtLeastTwoSeparateDays](self, "_hasLaunchedAppOnAtLeastTwoSeparateDays"))
                        {
                          __atxlog_handle_modes();
                          v59 = objc_claimAutoreleasedReturnValue();
                          if (!os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                            goto LABEL_64;
                          v98 = self->_modeUUID;
                          originBundleId = self->_originBundleId;
                          *(_DWORD *)buf = 138543618;
                          v104 = v98;
                          v105 = 2112;
                          v106 = *(double *)&originBundleId;
                          v62 = "ATXModeSuggestionScorer: mode: %{public}@ should NOT be suggested on lock screen because"
                                " user has not launched bundleId: %@ on two seperate days";
                          v89 = v59;
                          v90 = 22;
                          goto LABEL_63;
                        }
                        __atxlog_handle_modes();
                        v96 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
                        {
                          v97 = self->_modeUUID;
                          *(_DWORD *)buf = 138543362;
                          v104 = v97;
                          _os_log_impl(&dword_1C9A3B000, v96, OS_LOG_TYPE_DEFAULT, "ATXModeSuggestionScorer: mode: %{public}@ should be suggested on lock screen", buf, 0xCu);
                        }

                        v5 = 1;
                        goto LABEL_66;
                      }
                      __atxlog_handle_modes();
                      v59 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                      {
                        v87 = self->_modeUUID;
                        v88 = self->_rejectionsAcrossAllModesInPastWeek;
                        *(_DWORD *)buf = 138543874;
                        v104 = v87;
                        v105 = 2112;
                        v106 = *(double *)&v88;
                        v107 = 2048;
                        v108 = v33;
                        v62 = "ATXModeSuggestionScorer: mode: %{public}@ should NOT be suggested on lock screen because r"
                              "ejectionsAcrossAllModesInPastWeek: %@ does not pass threshold: %f";
                        goto LABEL_62;
                      }
                    }
                    else
                    {
                      __atxlog_handle_modes();
                      v59 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                      {
                        v84 = self->_modeUUID;
                        v85 = self->_timesShownAcrossAllModesInPastWeek;
                        *(_DWORD *)buf = 138543874;
                        v104 = v84;
                        v105 = 2112;
                        v106 = *(double *)&v85;
                        v107 = 2048;
                        v108 = v30;
                        v62 = "ATXModeSuggestionScorer: mode: %{public}@ should NOT be suggested on lock screen because t"
                              "imesShownAcrossAllModesInPastWeek: %@ does not pass threshold: %f";
                        goto LABEL_62;
                      }
                    }
                  }
                  else
                  {
                    __atxlog_handle_modes();
                    v59 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                    {
                      v81 = self->_modeUUID;
                      v82 = self->_timesShownAcrossAllModesInPastDay;
                      *(_DWORD *)buf = 138543874;
                      v104 = v81;
                      v105 = 2112;
                      v106 = *(double *)&v82;
                      v107 = 2048;
                      v108 = v27;
                      v62 = "ATXModeSuggestionScorer: mode: %{public}@ should NOT be suggested on lock screen because tim"
                            "esShownAcrossAllModesInPastDay: %@ does not pass threshold: %f";
                      goto LABEL_62;
                    }
                  }
                }
                else
                {
                  __atxlog_handle_modes();
                  v59 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                  {
                    v78 = self->_modeUUID;
                    v79 = self->_rejectionsAcrossAllModesInPastDay;
                    *(_DWORD *)buf = 138543874;
                    v104 = v78;
                    v105 = 2112;
                    v106 = *(double *)&v79;
                    v107 = 2048;
                    v108 = v24;
                    v62 = "ATXModeSuggestionScorer: mode: %{public}@ should NOT be suggested on lock screen because rejec"
                          "tionsAcrossAllModesInPastDay: %@ does not pass threshold: %f";
                    goto LABEL_62;
                  }
                }
              }
              else
              {
                __atxlog_handle_modes();
                v59 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                {
                  v75 = self->_modeUUID;
                  v76 = self->_timesShownInLastDay;
                  *(_DWORD *)buf = 138543874;
                  v104 = v75;
                  v105 = 2112;
                  v106 = *(double *)&v76;
                  v107 = 2048;
                  v108 = v102;
                  v62 = "ATXModeSuggestionScorer: mode: %{public}@ should NOT be suggested on lock screen because timesSh"
                        "ownInLastDay: %@ does not pass threshold: %f";
                  goto LABEL_62;
                }
              }
            }
            else
            {
              __atxlog_handle_modes();
              v59 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
              {
                v73 = self->_modeUUID;
                *(_DWORD *)buf = 138543874;
                v104 = v73;
                v105 = 2048;
                v106 = v72;
                v107 = 2048;
                v108 = v19;
                v62 = "ATXModeSuggestionScorer: mode: %{public}@ should NOT be suggested on lock screen because totalIgno"
                      "resAndRejections: %f does not pass threshold: %f";
                goto LABEL_62;
              }
            }
          }
          else
          {
            __atxlog_handle_modes();
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              v67 = self->_modeUUID;
              v68 = self->_totalRejections;
              *(_DWORD *)buf = 138543874;
              v104 = v67;
              v105 = 2112;
              v106 = *(double *)&v68;
              v107 = 2048;
              v108 = v16;
              v62 = "ATXModeSuggestionScorer: mode: %{public}@ should NOT be suggested on lock screen because totalReject"
                    "ions: %@ does not pass threshold: %f";
              goto LABEL_62;
            }
          }
        }
        else
        {
          __atxlog_handle_modes();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            v64 = self->_modeUUID;
            v65 = self->_rejectionsInPastWeek;
            *(_DWORD *)buf = 138543874;
            v104 = v64;
            v105 = 2112;
            v106 = *(double *)&v65;
            v107 = 2048;
            v108 = v13;
            v62 = "ATXModeSuggestionScorer: mode: %{public}@ should NOT be suggested on lock screen because rejectionsInP"
                  "astWeek: %@ does not pass threshold: %f";
            goto LABEL_62;
          }
        }
      }
      else
      {
        __atxlog_handle_modes();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          v60 = self->_modeUUID;
          v61 = self->_confidenceScore;
          *(_DWORD *)buf = 138543874;
          v104 = v60;
          v105 = 2048;
          v106 = v61;
          v107 = 2048;
          v108 = v10;
          v62 = "ATXModeSuggestionScorer: mode: %{public}@ should NOT be suggested on lock screen because confidenceScore"
                ": %f does not pass threshold: %f";
LABEL_62:
          v89 = v59;
          v90 = 32;
LABEL_63:
          _os_log_impl(&dword_1C9A3B000, v89, OS_LOG_TYPE_DEFAULT, v62, buf, v90);
        }
      }
LABEL_64:

      goto LABEL_65;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("dateDrivingSetupSuggestionLastShown"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v100 = v27;
        v101 = v24;
        objc_msgSend(v4, "doubleForKey:", *MEMORY[0x1E0CF9550]);
        v53 = v52;
        *(double *)&v54 = COERCE_DOUBLE(objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v52));
        objc_msgSend(v51, "timeIntervalSinceReferenceDate");
        v56 = v55;
        __atxlog_handle_modes();
        v57 = objc_claimAutoreleasedReturnValue();
        v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
        if (v56 <= v53)
        {
          v27 = v100;
          v24 = v101;
          if (v58)
          {
            *(_DWORD *)buf = 138543618;
            v104 = (NSString *)v51;
            v105 = 2114;
            v106 = *(double *)&v54;
            _os_log_impl(&dword_1C9A3B000, v57, OS_LOG_TYPE_DEFAULT, "ATXModeSuggestionScorer: Driving setup suggestion was shown on %{public}@ and the last major OS upgrade was on approximately %{public}@", buf, 0x16u);
          }

          goto LABEL_23;
        }
        if (v58)
        {
          *(_DWORD *)buf = 138543618;
          v104 = (NSString *)v51;
          v105 = 2114;
          v106 = *(double *)&v54;
          _os_log_impl(&dword_1C9A3B000, v57, OS_LOG_TYPE_DEFAULT, "ATXModeSuggestionScorer: Not showing Driving setup suggestion because suggestion was already shown once (%{public}@) since last major os upgrade (%{public}@)", buf, 0x16u);
        }

      }
      else
      {
        __atxlog_handle_modes();
        *(double *)&v54 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
          -[ATXModeSuggestionScorer _shouldSuggestOnLockScreenWithDefaults:].cold.1(v54);
      }

      goto LABEL_65;
    }
LABEL_23:

    goto LABEL_24;
  }
  v5 = 1;
LABEL_67:

  return v5;
}

- (BOOL)_hasUserSetUpModeBefore
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  BMUserFocusInferredModeTypeToActivity();
  ATXActivityTypeToModeSemanticType();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v4 = (void *)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CF9538]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v2);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_hasUserSetUpSmartActivationForThisModeBefore
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  BMUserFocusInferredModeTypeToActivity();
  ATXActivityTypeToModeSemanticType();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v4 = (void *)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CF9540]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v2);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)shouldSuggestTriggers
{
  _BOOL4 v3;
  NSObject *v4;
  NSString *modeUUID;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  NSArray *triggers;
  int v14;
  NSString *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  NSArray *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = -[ATXModeSuggestionScorer shouldSuggestOnLockScreen](self, "shouldSuggestOnLockScreen");
  if (v3)
  {
    if (-[ATXModeSuggestionScorer _hasUserSetUpSmartActivationForThisModeBefore](self, "_hasUserSetUpSmartActivationForThisModeBefore"))
    {
      __atxlog_handle_modes();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        modeUUID = self->_modeUUID;
        v14 = 138543362;
        v15 = modeUUID;
        _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "ATXModeSuggestionScorer: mode: %{public}@ trigger should not be suggested because smart activation was previously ON for this mode", (uint8_t *)&v14, 0xCu);
      }
    }
    else
    {
      if (!-[ATXModeSuggestionScorer isModeConfigured](self, "isModeConfigured"))
        goto LABEL_11;
      -[DNDModeConfiguration triggers](self->_cachedDNDMode, "triggers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (!v7
        || (v8 = (void *)objc_opt_class(),
            -[DNDModeConfiguration triggers](self->_cachedDNDMode, "triggers"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            LODWORD(v8) = objc_msgSend(v8, "_areConfiguredTriggers:conflictingWithSuggestedTriggers:", v9, self->_triggers), v9, !(_DWORD)v8))
      {
LABEL_11:
        LOBYTE(v3) = 1;
        return v3;
      }
      __atxlog_handle_modes();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v10 = self->_modeUUID;
        -[DNDModeConfiguration triggers](self->_cachedDNDMode, "triggers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        triggers = self->_triggers;
        v14 = 138543874;
        v15 = v10;
        v16 = 2114;
        v17 = v11;
        v18 = 2114;
        v19 = triggers;
        _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "ATXModeSuggestionScorer: mode: %{public}@ trigger should not be suggested because existing triggers %{public}@ conflict with predicted triggers: %{public}@", (uint8_t *)&v14, 0x20u);

      }
    }

    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)shouldAllowSmartEntry
{
  _BOOL4 v3;
  NSObject *v4;
  NSString *modeUUID;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_modeUUID)
    goto LABEL_8;
  v3 = -[ATXModeSuggestionScorer isModeConfigured](self, "isModeConfigured");
  if (!v3)
    return v3;
  if (-[DNDModeConfiguration allowSmartEntry](self->_cachedDNDMode, "allowSmartEntry") != 2)
  {
LABEL_8:
    LOBYTE(v3) = 0;
    return v3;
  }
  if (-[ATXModeSuggestionScorer _hasHadEarlyExitTodayForModeWithUUID:](self, "_hasHadEarlyExitTodayForModeWithUUID:", self->_modeUUID))
  {
    __atxlog_handle_modes();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      modeUUID = self->_modeUUID;
      v7 = 138543362;
      v8 = modeUUID;
      _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "ATXModeSuggestionScorer: mode: %{public}@ not allowing smart entry because we already had an early exit today", (uint8_t *)&v7, 0xCu);
    }

    goto LABEL_8;
  }
  LOBYTE(v3) = 1;
  return v3;
}

- (BOOL)_hasHadEarlyExitTodayForModeWithUUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v3 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startOfDayForDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  objc_msgSend(v7, "publisherFromStartTime:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filterWithIsIncluded:", &__block_literal_global_44);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__ATXModeSuggestionScorer__hasHadEarlyExitTodayForModeWithUUID___block_invoke_3;
  v13[3] = &unk_1E82DB080;
  v10 = v3;
  v14 = v10;
  v15 = &v16;
  v11 = (id)objc_msgSend(v9, "sinkWithCompletion:receiveInput:", &__block_literal_global_60, v13);

  LOBYTE(v7) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return (char)v7;
}

BOOL __64__ATXModeSuggestionScorer__hasHadEarlyExitTodayForModeWithUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "eventType") == 5;

  return v3;
}

void __64__ATXModeSuggestionScorer__hasHadEarlyExitTodayForModeWithUUID___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "activity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modeUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    {
      __atxlog_handle_modes();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v3, "timestamp");
        v11 = 138543618;
        v12 = v9;
        v13 = 2048;
        v14 = v10;
        _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "ATXModeSuggestionScorer: mode: %{public}@ has an early exit detected at %f", (uint8_t *)&v11, 0x16u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }

  }
}

- (BOOL)_inValidLocaleForDrivingSuggestions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1CAA48B6C](self, a2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("US"), CFSTR("CA"), CFSTR("GB"), 0);
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_msgSend(v3, "containsObject:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    __atxlog_handle_modes();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "ATXModeSuggestionScorer: user is in locale: %@", buf, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

+ (BOOL)_areConfiguredTriggers:(id)a3 conflictingWithSuggestedTriggers:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "_pas_filteredArrayWithTest:", &__block_literal_global_64);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = 1;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_68);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_71);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "intersectSet:", v11);
    v8 = objc_msgSend(v14, "count") != 0;

  }
  return v8;
}

BOOL __83__ATXModeSuggestionScorer__areConfiguredTriggers_conflictingWithSuggestedTriggers___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  objc_opt_class();
  v3 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v2, "enabledSetting") == 2;

  return v3;
}

uint64_t __83__ATXModeSuggestionScorer__areConfiguredTriggers_conflictingWithSuggestedTriggers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CF8C68], "DNDModeConfigurationTriggerClassFromATXTrigger:", a2);
}

uint64_t __83__ATXModeSuggestionScorer__areConfiguredTriggers_conflictingWithSuggestedTriggers___block_invoke_3()
{
  return objc_opt_class();
}

- (BOOL)_isSameActivityAndSource:(id)a3
{
  id v4;
  void *v5;
  NSString *modeUUID;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSString *originAnchorType;
  void *v13;
  char v14;
  BOOL v15;

  v4 = a3;
  objc_msgSend(v4, "modeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (modeUUID = self->_modeUUID, v5, modeUUID))
  {
    objc_msgSend(v4, "modeUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", self->_modeUUID);

    if ((v8 & 1) == 0)
      goto LABEL_15;
  }
  else
  {
    objc_msgSend(v4, "modeUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      goto LABEL_6;
    if (self->_modeUUID)
      goto LABEL_15;
  }
  v10 = objc_msgSend(v4, "origin");
  if (v10 != BMUserFocusInferredModeOriginToLegacy())
    goto LABEL_15;
  objc_msgSend(v4, "originAnchorType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11 || (originAnchorType = self->_originAnchorType, v11, !originAnchorType))
  {
    objc_msgSend(v4, "originAnchorType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      if (!self->_originAnchorType)
        goto LABEL_12;
LABEL_15:
      v15 = 0;
      goto LABEL_16;
    }
LABEL_6:

    goto LABEL_15;
  }
  objc_msgSend(v4, "originAnchorType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", self->_originAnchorType);

  if ((v14 & 1) == 0)
    goto LABEL_15;
LABEL_12:
  v15 = 1;
LABEL_16:

  return v15;
}

- (BOOL)_hasLaunchedAppOnAtLeastTwoSeparateDays
{
  double v2;

  -[ATXAppLaunches uniqueDaysAppHasBeenLaunchedOverLast28Days:](self->_appLaunchStream, "uniqueDaysAppHasBeenLaunchedOverLast28Days:", self->_originBundleId);
  return v2 >= 2.0;
}

- (void)_populateFeedbackScoresIfNeeded
{
  if (!self->_feedbackScore || !self->_rejectionsInPastWeek)
    -[ATXModeSuggestionScorer _populateFeedbackScores](self, "_populateFeedbackScores");
}

- (void)_populateFeedbackScores
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ATXActivitySuggestionFeedbackStream *feedbackStream;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSNumber *v14;
  NSNumber *rejectionsInPastWeek;
  NSNumber *v16;
  NSNumber *timesShownInLastDay;
  ATXActivitySuggestionsFeedbackProcessor *v18;
  NSNumber *v19;
  NSNumber *rejectionsAcrossAllModesInPastDay;
  NSNumber *v21;
  NSNumber *timesShownAcrossAllModesInPastDay;
  NSNumber *v23;
  NSNumber *timesShownAcrossAllModesInPastWeek;
  NSNumber *v25;
  NSNumber *rejectionsAcrossAllModesInPastWeek;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  NSNumber *v33;
  NSNumber *feedbackScore;
  NSNumber *v35;
  NSNumber *totalRejections;
  NSNumber *v37;
  NSNumber *totalIgnores;
  NSNumber *v39;
  NSNumber *timesShown;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(_QWORD *, void *);
  void *v44;
  ATXModeSuggestionScorer *v45;
  id v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  double *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  double *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  double *v74;
  uint64_t v75;
  uint64_t v76;

  v73 = 0;
  v74 = (double *)&v73;
  v75 = 0x2020000000;
  v76 = 0;
  v69 = 0;
  v70 = (double *)&v69;
  v71 = 0x2020000000;
  v72 = 0;
  v65 = 0;
  v66 = (double *)&v65;
  v67 = 0x2020000000;
  v68 = 0;
  v61 = 0;
  v62 = (double *)&v61;
  v63 = 0x2020000000;
  v64 = 0;
  v57 = 0;
  v58 = (double *)&v57;
  v59 = 0x2020000000;
  v60 = 0;
  v53 = 0;
  v54 = (double *)&v53;
  v55 = 0x2020000000;
  v56 = 0;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, -7, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, -1, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  feedbackStream = self->_feedbackStream;
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  -[ATXActivitySuggestionFeedbackStream publisherFromStartTime:](feedbackStream, "publisherFromStartTime:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filterWithIsIncluded:", &__block_literal_global_72_0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = MEMORY[0x1E0C809B0];
  v42 = 3221225472;
  v43 = __50__ATXModeSuggestionScorer__populateFeedbackScores__block_invoke_3;
  v44 = &unk_1E82DD998;
  v45 = self;
  v47 = &v73;
  v12 = v8;
  v46 = v12;
  v48 = &v69;
  v49 = &v61;
  v50 = &v65;
  v51 = &v53;
  v52 = &v57;
  v13 = (id)objc_msgSend(v11, "sinkWithCompletion:receiveInput:", &__block_literal_global_73, &v41);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v74[3], v41, v42, v43, v44, v45);
  v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  rejectionsInPastWeek = self->_rejectionsInPastWeek;
  self->_rejectionsInPastWeek = v14;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v70[3]);
  v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  timesShownInLastDay = self->_timesShownInLastDay;
  self->_timesShownInLastDay = v16;

  v18 = -[ATXActivitySuggestionsFeedbackProcessor initWithFeedbackStream:feedbackHistogramHelper:]([ATXActivitySuggestionsFeedbackProcessor alloc], "initWithFeedbackStream:feedbackHistogramHelper:", self->_feedbackStream, self->_feedbackHistogramHelper);
  -[ATXActivitySuggestionsFeedbackProcessor processFeedbackWithXPCActivity:](v18, "processFeedbackWithXPCActivity:", 0);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v66[3]);
  v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  rejectionsAcrossAllModesInPastDay = self->_rejectionsAcrossAllModesInPastDay;
  self->_rejectionsAcrossAllModesInPastDay = v19;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v58[3]);
  v21 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  timesShownAcrossAllModesInPastDay = self->_timesShownAcrossAllModesInPastDay;
  self->_timesShownAcrossAllModesInPastDay = v21;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v54[3]);
  v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  timesShownAcrossAllModesInPastWeek = self->_timesShownAcrossAllModesInPastWeek;
  self->_timesShownAcrossAllModesInPastWeek = v23;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v62[3]);
  v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  rejectionsAcrossAllModesInPastWeek = self->_rejectionsAcrossAllModesInPastWeek;
  self->_rejectionsAcrossAllModesInPastWeek = v25;

  -[ATXActivitySuggestionsFeedbackHistogramHelper suggestionsGivenForLockScreenSuggestionWithModeUUID:modeType:origin:originAnchorType:](self->_feedbackHistogramHelper, "suggestionsGivenForLockScreenSuggestionWithModeUUID:modeType:origin:originAnchorType:", self->_modeUUID, self->_modeType, self->_origin, self->_originAnchorType);
  v28 = v27;
  -[ATXActivitySuggestionsFeedbackHistogramHelper acceptancesForLockScreenSuggestionWithModeUUID:modeType:origin:originAnchorType:](self->_feedbackHistogramHelper, "acceptancesForLockScreenSuggestionWithModeUUID:modeType:origin:originAnchorType:", self->_modeUUID, self->_modeType, self->_origin, self->_originAnchorType);
  v30 = v29;
  -[ATXActivitySuggestionsFeedbackHistogramHelper rejectionsForLockScreenSuggestionWithModeUUID:modeType:origin:originAnchorType:](self->_feedbackHistogramHelper, "rejectionsForLockScreenSuggestionWithModeUUID:modeType:origin:originAnchorType:", self->_modeUUID, self->_modeType, self->_origin, self->_originAnchorType);
  v32 = v31;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v30 + 1.0) / (v28 + 1.0));
  v33 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  feedbackScore = self->_feedbackScore;
  self->_feedbackScore = v33;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v32);
  v35 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  totalRejections = self->_totalRejections;
  self->_totalRejections = v35;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28 - v30 - v32);
  v37 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  totalIgnores = self->_totalIgnores;
  self->_totalIgnores = v37;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
  v39 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  timesShown = self->_timesShown;
  self->_timesShown = v39;

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);
}

BOOL __50__ATXModeSuggestionScorer__populateFeedbackScores__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "location") == 1;

  return v3;
}

void __50__ATXModeSuggestionScorer__populateFeedbackScores__block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)a1[4];
  objc_msgSend(v3, "activity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "_isSameActivityAndSource:", v5);

  if (!(_DWORD)v4)
  {
    v6 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v16, "timestamp");
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "eventType") == 3)
    {
      *(double *)(*(_QWORD *)(a1[8] + 8) + 24) = *(double *)(*(_QWORD *)(a1[8] + 8) + 24) + 1.0;
      objc_msgSend(v7, "earlierDate:", a1[5]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)a1[5];

      if (v8 != v9)
        goto LABEL_14;
      v10 = a1[9];
    }
    else
    {
      if (objc_msgSend(v3, "eventType"))
        goto LABEL_14;
      *(double *)(*(_QWORD *)(a1[10] + 8) + 24) = *(double *)(*(_QWORD *)(a1[10] + 8) + 24) + 1.0;
      objc_msgSend(v7, "earlierDate:", a1[5]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)a1[5];

      if (v14 != v15)
        goto LABEL_14;
      v10 = a1[11];
    }
    *(double *)(*(_QWORD *)(v10 + 8) + 24) = *(double *)(*(_QWORD *)(v10 + 8) + 24) + 1.0;
    goto LABEL_14;
  }
  if (objc_msgSend(v3, "eventType") != 3)
  {
    if (objc_msgSend(v3, "eventType"))
      goto LABEL_15;
    v11 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v16, "timestamp");
    objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "earlierDate:", a1[5]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)a1[5];

    if (v12 == v13)
      *(double *)(*(_QWORD *)(a1[7] + 8) + 24) = *(double *)(*(_QWORD *)(a1[7] + 8) + 24) + 1.0;
LABEL_14:

    goto LABEL_15;
  }
  *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = *(double *)(*(_QWORD *)(a1[6] + 8) + 24) + 1.0;
LABEL_15:

}

- (id)_lockScreenSuggestionThresholds
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lockScreenSuggestionThresholds"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXModeSuggestionScorer isModeConfigured](self, "isModeConfigured"))
    v5 = CFSTR("modeIsConfiguredThresholds");
  else
    v5 = CFSTR("modeIsNotConfiguredThresholds");
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDNDMode, 0);
  objc_storeStrong((id *)&self->_cachedIsModeConfigured, 0);
  objc_storeStrong((id *)&self->_cachedIsUserCurrentlyInADifferentMode, 0);
  objc_storeStrong((id *)&self->_cachedIsUserCurrentlyInMode, 0);
  objc_storeStrong((id *)&self->_rejectionsAcrossAllModesInPastWeek, 0);
  objc_storeStrong((id *)&self->_timesShownAcrossAllModesInPastWeek, 0);
  objc_storeStrong((id *)&self->_timesShownAcrossAllModesInPastDay, 0);
  objc_storeStrong((id *)&self->_rejectionsAcrossAllModesInPastDay, 0);
  objc_storeStrong((id *)&self->_timesShown, 0);
  objc_storeStrong((id *)&self->_timesShownInLastDay, 0);
  objc_storeStrong((id *)&self->_totalIgnores, 0);
  objc_storeStrong((id *)&self->_totalRejections, 0);
  objc_storeStrong((id *)&self->_rejectionsInPastWeek, 0);
  objc_storeStrong((id *)&self->_feedbackScore, 0);
  objc_storeStrong((id *)&self->_groundTruthModeStream, 0);
  objc_storeStrong((id *)&self->_appLaunchStream, 0);
  objc_storeStrong((id *)&self->_feedbackHistogramHelper, 0);
  objc_storeStrong((id *)&self->_feedbackStream, 0);
  objc_storeStrong((id *)&self->_configuredModeService, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_originBundleId, 0);
  objc_storeStrong((id *)&self->_originAnchorType, 0);
  objc_storeStrong((id *)&self->_modeUUID, 0);
}

- (void)_shouldSuggestOnLockScreenWithDefaults:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "ATXModeSuggestionScorer: Expected NSDate for dateDrivingSetupSuggestionLastShown.", v1, 2u);
}

@end
