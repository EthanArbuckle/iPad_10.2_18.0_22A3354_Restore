@implementation ATXModeScoringSession

- (id)initFromStartTime:(double)a3 endTime:(double)a4 modeEntityStore:(id)a5
{
  id v9;
  ATXModeScoringSession *v10;
  ATXModeScoringSession *v11;
  uint64_t v12;
  NSArray *appLaunches;
  objc_super v15;

  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXModeScoringSession;
  v10 = -[ATXModeScoringSession init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_startTimestamp = a3;
    v10->_endTimestamp = a4;
    v12 = objc_opt_new();
    appLaunches = v11->_appLaunches;
    v11->_appLaunches = (NSArray *)v12;

    objc_storeStrong((id *)&v11->_modeEntityStore, a5);
  }

  return v11;
}

- (id)_initFromStartTime:(double)a3 endTime:(double)a4 modeEntityStore:(id)a5 appLaunches:(id)a6 sessionAffinityVector:(id)a7
{
  id v13;
  id v14;
  id v15;
  ATXModeScoringSession *v16;
  id *p_isa;
  objc_super v19;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)ATXModeScoringSession;
  v16 = -[ATXModeScoringSession init](&v19, sel_init);
  p_isa = (id *)&v16->super.isa;
  if (v16)
  {
    v16->_startTimestamp = a3;
    v16->_endTimestamp = a4;
    objc_storeStrong((id *)&v16->_appLaunches, a6);
    objc_storeStrong(p_isa + 5, a5);
    objc_storeStrong(p_isa + 4, a7);
  }

  return p_isa;
}

- (BOOL)isStronglyCorrelatedWithTopMode
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;

  -[ATXModeEntityAffinityVector sortedAffinities](self->_sessionAffinityVector, "sortedAffinities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "count"))
  {
    if (objc_msgSend(v3, "count") == 1)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "first");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "doubleValue");
      v8 = v7;
      objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "first");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v4 = v8 > v11 + v11;

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasModeWithinRank:(unint64_t)a3 rank:(unint64_t)a4
{
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  char v11;

  -[ATXModeEntityAffinityVector sortedAffinities](self->_sessionAffinityVector, "sortedAffinities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  if (v7 >= a4)
    v8 = a4;
  else
    v8 = v7;
  objc_msgSend(v6, "subarrayWithRange:", 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ATXModeToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "containsObject:", v10);

  return v11;
}

uint64_t __48__ATXModeScoringSession_hasModeWithinRank_rank___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "second");
}

- (double)numScoredAppLaunches
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  ATXModeEntityStore *modeEntityStore;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_appLaunches;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        modeEntityStore = self->_modeEntityStore;
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "bundleID", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXModeEntityStore appEntityForBundleId:](modeEntityStore, "appEntityForBundleId:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "affinityVector");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          v7 = v7 + 1.0;
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (double)secondsUntilOtherSession:(id)a3
{
  id v4;
  double *p_endTimestamp;
  double v6;
  double v7;
  double *p_startTimestamp;
  double startTimestamp;
  double v10;
  double v11;

  v4 = a3;
  objc_msgSend(v4, "startTimestamp");
  p_endTimestamp = &self->_endTimestamp;
  if (v6 > self->_endTimestamp)
  {
    objc_msgSend(v4, "startTimestamp");
LABEL_5:
    v10 = v7 - *p_endTimestamp;
    goto LABEL_6;
  }
  objc_msgSend(v4, "endTimestamp");
  startTimestamp = self->_startTimestamp;
  p_startTimestamp = &self->_startTimestamp;
  v10 = 0.0;
  if (v11 < startTimestamp)
  {
    objc_msgSend(v4, "endTimestamp");
    p_endTimestamp = p_startTimestamp;
    goto LABEL_5;
  }
LABEL_6:

  return v10;
}

- (double)duration
{
  return self->_endTimestamp - self->_startTimestamp;
}

- (BOOL)isLabeled
{
  ATXModeEntityAffinityVector *sessionAffinityVector;

  sessionAffinityVector = self->_sessionAffinityVector;
  if (sessionAffinityVector)
    LOBYTE(sessionAffinityVector) = !-[ATXModeEntityAffinityVector isZeroVector](sessionAffinityVector, "isZeroVector");
  return (char)sessionAffinityVector;
}

- (unint64_t)topMode
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[ATXModeEntityAffinityVector sortedAffinities](self->_sessionAffinityVector, "sortedAffinities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "second");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = ATXStringToMode();

  }
  else
  {
    v5 = 16;
  }

  return v5;
}

- (double)affinityForMode:(unint64_t)a3
{
  double result;

  -[ATXModeEntityAffinityVector scoreForMode:](self->_sessionAffinityVector, "scoreForMode:", a3);
  return result;
}

+ (id)coalesceSessions:(id)a3 modeEntityStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  id v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = v11;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v18, "startTimestamp");
        if (v19 < v9)
          v9 = v19;
        objc_msgSend(v18, "endTimestamp");
        if (v20 >= v12)
          v12 = v20;
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v15);
  }

  objc_msgSend(v13, "_pas_mappedArrayWithTransform:", &__block_literal_global_12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXModeEntityAffinityVector weightedCentroid:](ATXModeEntityAffinityVector, "weightedCentroid:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v24 = v13;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v33 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "appLaunches", (_QWORD)v32);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObjectsFromArray:", v29);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v26);
  }

  v30 = -[ATXModeScoringSession _initFromStartTime:endTime:modeEntityStore:appLaunches:sessionAffinityVector:]([ATXModeScoringSession alloc], "_initFromStartTime:endTime:modeEntityStore:appLaunches:sessionAffinityVector:", v6, v23, v22, v9, v12);
  return v30;
}

id __58__ATXModeScoringSession_coalesceSessions_modeEntityStore___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0D81638];
  v3 = a2;
  objc_msgSend(v3, "sessionAffinityVector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "numScoredAppLaunches");
  v7 = v6;

  objc_msgSend(v5, "numberWithDouble:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tupleWithFirst:second:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)populateAppLaunches:(id)a3
{
  NSArray *v4;
  NSArray *appLaunches;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  appLaunches = self->_appLaunches;
  self->_appLaunches = v4;

  -[ATXModeScoringSession _populateAffinity](self, "_populateAffinity");
}

- (void)_populateAffinity
{
  NSArray *appLaunches;
  void *v4;
  ATXModeEntityAffinityVector *v5;
  ATXModeEntityAffinityVector *sessionAffinityVector;
  _QWORD v7[5];

  appLaunches = self->_appLaunches;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__ATXModeScoringSession__populateAffinity__block_invoke;
  v7[3] = &unk_1E82DB598;
  v7[4] = self;
  -[NSArray _pas_mappedArrayWithTransform:](appLaunches, "_pas_mappedArrayWithTransform:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXModeEntityAffinityVector weightedCentroid:](ATXModeEntityAffinityVector, "weightedCentroid:", v4);
  v5 = (ATXModeEntityAffinityVector *)objc_claimAutoreleasedReturnValue();
  sessionAffinityVector = self->_sessionAffinityVector;
  self->_sessionAffinityVector = v5;

}

id __42__ATXModeScoringSession__populateAffinity__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = a2;
  objc_msgSend(v4, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appEntityForBundleId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "affinityVector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_weightForLaunch:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)_weightForLaunch:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "histogramForLaunchType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "totalLaunchesForBundleIds:", v7);
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 / sqrt(v9 + 1.0));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)debug_prettyPrintSession:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  ATXModeEntityStore *modeEntityStore;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v3 = a3;
  v47 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v6 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFormatFromTemplate:options:locale:", CFSTR("EMMMd HH:mm ss ZZZZ"), 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDateFormat:", v8);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_startTimestamp);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_endTimestamp);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_modes();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[ATXModeEntityAffinityVector prettyDescription](self->_sessionAffinityVector, "prettyDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v42 = v10;
    v43 = 2112;
    v44 = v12;
    v45 = 2112;
    v46 = v14;
    _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "Session: %@, %@: %@", buf, 0x20u);

  }
  if (v3)
  {
    v32 = v12;
    v33 = v10;
    v34 = v8;
    v35 = v5;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v15 = self->_appLaunches;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v37 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          modeEntityStore = self->_modeEntityStore;
          objc_msgSend(v20, "bundleID", v32, v33, v34, v35);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXModeEntityStore appEntityForBundleId:](modeEntityStore, "appEntityForBundleId:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "affinityVector");
          v24 = objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            v25 = (void *)v24;
            objc_msgSend(v23, "affinityVector");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "isZeroVector");

            if ((v27 & 1) == 0)
            {
              __atxlog_handle_modes();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v20, "bundleID");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "affinityVector");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "prettyDescription");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v42 = v29;
                v43 = 2112;
                v44 = v31;
                _os_log_impl(&dword_1C9A3B000, v28, OS_LOG_TYPE_DEFAULT, "    App Launch: %@, %@", buf, 0x16u);

              }
            }
          }

        }
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v17);
    }

    v8 = v34;
    v5 = v35;
    v12 = v32;
    v10 = v33;
  }

}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (double)endTimestamp
{
  return self->_endTimestamp;
}

- (NSArray)appLaunches
{
  return self->_appLaunches;
}

- (ATXModeEntityAffinityVector)sessionAffinityVector
{
  return self->_sessionAffinityVector;
}

- (void)setSessionAffinityVector:(id)a3
{
  objc_storeStrong((id *)&self->_sessionAffinityVector, a3);
}

- (ATXModeEntityStore)modeEntityStore
{
  return self->_modeEntityStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeEntityStore, 0);
  objc_storeStrong((id *)&self->_sessionAffinityVector, 0);
  objc_storeStrong((id *)&self->_appLaunches, 0);
}

@end
