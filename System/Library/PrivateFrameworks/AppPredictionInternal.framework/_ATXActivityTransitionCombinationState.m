@implementation _ATXActivityTransitionCombinationState

- (_ATXActivityTransitionCombinationState)init
{
  _ATXActivityTransitionCombinationState *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_ATXActivityTransitionCombinationState;
  result = -[_ATXActivityTransitionCombinationState init](&v3, sel_init);
  if (result)
  {
    result->_timeBasedActivity = 14;
    result->_timeBasedConfidence = 0.0;
    result->_appLaunchActivity = 14;
    result->_appLaunchConfidence = 0.0;
    result->_heuristicActivity = 14;
    result->_heuristicConfidence = 0.0;
    result->_computedModeConfidence = 0.0;
    result->_timestamp = 0.0;
    result->_computedModeActivity = 14;
  }
  return result;
}

- (id)newStateFromTransition:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  NSObject *v17;

  v4 = a3;
  v5 = (void *)-[_ATXActivityTransitionCombinationState copy](self, "copy");
  if (objc_msgSend(v4, "isEntryEvent"))
    v6 = objc_msgSend(v4, "inferredActivityType");
  else
    v6 = 14;
  v7 = 0.0;
  if (objc_msgSend(v4, "isEntryEvent"))
  {
    objc_msgSend(v4, "confidence");
    v7 = v8;
  }
  objc_msgSend(v4, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("timeBasedInferredActivity"));

  if (v10)
  {
    objc_msgSend(v5, "setTimeBasedActivity:", v6);
    objc_msgSend(v5, "setTimeBasedConfidence:", v7);
  }
  else
  {
    objc_msgSend(v4, "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("appLaunchInferredActivity"));

    if (v12)
    {
      objc_msgSend(v5, "setAppLaunchActivity:", v6);
      objc_msgSend(v5, "setAppLaunchConfidence:", v7);
    }
    else
    {
      objc_msgSend(v4, "source");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("heuristicInferredActivity"));

      if (v14)
      {
        objc_msgSend(v5, "setHeuristicActivity:", v6);
        objc_msgSend(v5, "setHeuristicConfidence:", v7);
      }
      else
      {
        objc_msgSend(v4, "source");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("computedModeActivity"));

        if (v16)
        {
          objc_msgSend(v5, "setComputedModeActivity:", v6);
          objc_msgSend(v5, "setComputedModeConfidence:", v7);
        }
        else
        {
          __atxlog_handle_modes();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            -[_ATXActivityTransitionCombinationState newStateFromTransition:].cold.1((uint64_t)self, v4, v17);

        }
      }
    }
  }
  objc_msgSend(v4, "transitionTime");
  objc_msgSend(v5, "setTimestamp:");

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _ATXActivityTransitionCombinationState *v4;

  v4 = -[_ATXActivityTransitionCombinationState init](+[_ATXActivityTransitionCombinationState allocWithZone:](_ATXActivityTransitionCombinationState, "allocWithZone:", a3), "init");
  -[_ATXActivityTransitionCombinationState setTimeBasedActivity:](v4, "setTimeBasedActivity:", -[_ATXActivityTransitionCombinationState timeBasedActivity](self, "timeBasedActivity"));
  -[_ATXActivityTransitionCombinationState timeBasedConfidence](self, "timeBasedConfidence");
  -[_ATXActivityTransitionCombinationState setTimeBasedConfidence:](v4, "setTimeBasedConfidence:");
  -[_ATXActivityTransitionCombinationState setAppLaunchActivity:](v4, "setAppLaunchActivity:", -[_ATXActivityTransitionCombinationState appLaunchActivity](self, "appLaunchActivity"));
  -[_ATXActivityTransitionCombinationState appLaunchConfidence](self, "appLaunchConfidence");
  -[_ATXActivityTransitionCombinationState setAppLaunchConfidence:](v4, "setAppLaunchConfidence:");
  -[_ATXActivityTransitionCombinationState setHeuristicActivity:](v4, "setHeuristicActivity:", -[_ATXActivityTransitionCombinationState heuristicActivity](self, "heuristicActivity"));
  -[_ATXActivityTransitionCombinationState heuristicConfidence](self, "heuristicConfidence");
  -[_ATXActivityTransitionCombinationState setHeuristicConfidence:](v4, "setHeuristicConfidence:");
  -[_ATXActivityTransitionCombinationState setComputedModeActivity:](v4, "setComputedModeActivity:", -[_ATXActivityTransitionCombinationState computedModeActivity](self, "computedModeActivity"));
  -[_ATXActivityTransitionCombinationState computedModeConfidence](self, "computedModeConfidence");
  -[_ATXActivityTransitionCombinationState setComputedModeConfidence:](v4, "setComputedModeConfidence:");
  -[_ATXActivityTransitionCombinationState timestamp](self, "timestamp");
  -[_ATXActivityTransitionCombinationState setTimestamp:](v4, "setTimestamp:");
  return v4;
}

- (double)scaledTimeBasedConfidence
{
  double v2;

  -[_ATXActivityTransitionCombinationState timeBasedConfidence](self, "timeBasedConfidence");
  return v2 * 1.0 / 85.0;
}

- (double)scaledAppLaunchConfidence
{
  double v2;

  -[_ATXActivityTransitionCombinationState appLaunchConfidence](self, "appLaunchConfidence");
  return v2 * 4.0 / 85.0;
}

- (double)scaledHeuristicConfidence
{
  double v2;

  -[_ATXActivityTransitionCombinationState heuristicConfidence](self, "heuristicConfidence");
  return v2 * 16.0 / 85.0;
}

- (double)scaledComputedModeConfidence
{
  double v2;

  -[_ATXActivityTransitionCombinationState computedModeConfidence](self, "computedModeConfidence");
  return v2 * 64.0 / 85.0;
}

- (id)topActivityWithConfidence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t j;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _QWORD v64[6];

  v64[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D81638];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_ATXActivityTransitionCombinationState timeBasedActivity](self, "timeBasedActivity"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[_ATXActivityTransitionCombinationState scaledTimeBasedConfidence](self, "scaledTimeBasedConfidence");
  objc_msgSend(v4, "numberWithDouble:");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tupleWithFirst:second:", v53, v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v51;
  v5 = (void *)MEMORY[0x1E0D81638];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_ATXActivityTransitionCombinationState appLaunchActivity](self, "appLaunchActivity"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[_ATXActivityTransitionCombinationState scaledAppLaunchConfidence](self, "scaledAppLaunchConfidence");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tupleWithFirst:second:", v50, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v8;
  v9 = (void *)MEMORY[0x1E0D81638];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_ATXActivityTransitionCombinationState heuristicActivity](self, "heuristicActivity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[_ATXActivityTransitionCombinationState scaledHeuristicConfidence](self, "scaledHeuristicConfidence");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tupleWithFirst:second:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v13;
  v14 = (void *)MEMORY[0x1E0D81638];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_ATXActivityTransitionCombinationState computedModeActivity](self, "computedModeActivity"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[_ATXActivityTransitionCombinationState scaledComputedModeConfidence](self, "scaledComputedModeConfidence");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tupleWithFirst:second:", v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_opt_new();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v21 = v19;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v59 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v26, "first");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (!v28)
          v28 = &unk_1E83CC088;
        objc_msgSend(v28, "doubleValue");
        v31 = v30;

        v32 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v26, "second");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "doubleValue");
        objc_msgSend(v32, "numberWithDouble:", v31 + v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "first");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v35, v36);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    }
    while (v23);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v37 = v20;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v55;
    v41 = &unk_1E83CC0A0;
    v42 = &unk_1E83CC088;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v55 != v40)
          objc_enumerationMutation(v37);
        v44 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
        objc_msgSend(v37, "objectForKeyedSubscript:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v45, "compare:", v42) == 1)
        {
          v46 = v44;

          v47 = v45;
          v42 = v47;
          v41 = v46;
        }

      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    }
    while (v39);
  }
  else
  {
    v41 = &unk_1E83CC0A0;
    v42 = &unk_1E83CC088;
  }

  objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v41, v42);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  return v48;
}

- (id)startTransition
{
  void *v3;
  void *v4;
  uint64_t v5;
  ATXUnifiedInferredActivityTransition *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  id v11;

  -[_ATXActivityTransitionCombinationState topActivityWithConfidence](self, "topActivityWithConfidence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  v6 = [ATXUnifiedInferredActivityTransition alloc];
  -[_ATXActivityTransitionCombinationState timestamp](self, "timestamp");
  v8 = v7;
  objc_msgSend(v3, "second");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = -[ATXUnifiedInferredActivityTransition initFromTransitionTime:isEntryEvent:source:activityType:confidence:](v6, "initFromTransitionTime:isEntryEvent:source:activityType:confidence:", 1, CFSTR("unifiedInferredActivity"), v5, v8, v10);

  return v11;
}

- (id)endTransitionWithTimestamp:(double)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  ATXUnifiedInferredActivityTransition *v7;
  void *v8;
  double v9;
  id v10;

  -[_ATXActivityTransitionCombinationState topActivityWithConfidence](self, "topActivityWithConfidence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v7 = [ATXUnifiedInferredActivityTransition alloc];
  objc_msgSend(v4, "second");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = -[ATXUnifiedInferredActivityTransition initFromTransitionTime:isEntryEvent:source:activityType:confidence:](v7, "initFromTransitionTime:isEntryEvent:source:activityType:confidence:", 0, CFSTR("unifiedInferredActivity"), v6, a3, v9);

  return v10;
}

- (BOOL)hasSameTopActivityAndConfidenceAsOther:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;

  v4 = a3;
  -[_ATXActivityTransitionCombinationState topActivityWithConfidence](self, "topActivityWithConfidence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topActivityWithConfidence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "first");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToNumber:", v8))
  {
    objc_msgSend(v5, "second");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;
    objc_msgSend(v6, "second");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v11 - v13;

    v15 = -v14;
    if (v14 >= 0.0)
      v15 = v14;
    v16 = v15 < 0.001;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)timeBasedActivity
{
  return self->_timeBasedActivity;
}

- (void)setTimeBasedActivity:(unint64_t)a3
{
  self->_timeBasedActivity = a3;
}

- (double)timeBasedConfidence
{
  return self->_timeBasedConfidence;
}

- (void)setTimeBasedConfidence:(double)a3
{
  self->_timeBasedConfidence = a3;
}

- (unint64_t)appLaunchActivity
{
  return self->_appLaunchActivity;
}

- (void)setAppLaunchActivity:(unint64_t)a3
{
  self->_appLaunchActivity = a3;
}

- (double)appLaunchConfidence
{
  return self->_appLaunchConfidence;
}

- (void)setAppLaunchConfidence:(double)a3
{
  self->_appLaunchConfidence = a3;
}

- (unint64_t)heuristicActivity
{
  return self->_heuristicActivity;
}

- (void)setHeuristicActivity:(unint64_t)a3
{
  self->_heuristicActivity = a3;
}

- (double)heuristicConfidence
{
  return self->_heuristicConfidence;
}

- (void)setHeuristicConfidence:(double)a3
{
  self->_heuristicConfidence = a3;
}

- (unint64_t)computedModeActivity
{
  return self->_computedModeActivity;
}

- (void)setComputedModeActivity:(unint64_t)a3
{
  self->_computedModeActivity = a3;
}

- (double)computedModeConfidence
{
  return self->_computedModeConfidence;
}

- (void)setComputedModeConfidence:(double)a3
{
  self->_computedModeConfidence = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void)newStateFromTransition:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_fault_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_FAULT, "[%@] Received unexpected activity transition source %@", (uint8_t *)&v8, 0x16u);

}

@end
