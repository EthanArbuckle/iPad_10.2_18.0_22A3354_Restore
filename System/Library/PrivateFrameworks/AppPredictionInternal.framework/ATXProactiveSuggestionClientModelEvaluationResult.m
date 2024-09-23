@implementation ATXProactiveSuggestionClientModelEvaluationResult

- (ATXProactiveSuggestionClientModelEvaluationResult)initWithSessionType:(unint64_t)a3 executableType:(int64_t)a4 removeDockedApps:(BOOL)a5
{
  ATXProactiveSuggestionClientModelEvaluationResult *v8;
  ATXProactiveSuggestionClientModelEvaluationResult *v9;
  void *v10;
  uint64_t v11;
  NSSet *dockedApps;
  uint64_t v13;
  NSMutableDictionary *engagedInTop4PerCandidate;
  uint64_t v15;
  NSMutableDictionary *engagedInTop8PerCandidate;
  uint64_t v17;
  NSMutableDictionary *shownInTop8PerCandidate;
  uint64_t v19;
  NSMutableDictionary *engagedPerCandidate;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)ATXProactiveSuggestionClientModelEvaluationResult;
  v8 = -[ATXProactiveSuggestionClientModelEvaluationResult init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_sessionType = a3;
    v8->_executableType = a4;
    v8->_removeDockedApps = a5;
    +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allDockedApps");
    v11 = objc_claimAutoreleasedReturnValue();
    dockedApps = v9->_dockedApps;
    v9->_dockedApps = (NSSet *)v11;

    v13 = objc_opt_new();
    engagedInTop4PerCandidate = v9->_engagedInTop4PerCandidate;
    v9->_engagedInTop4PerCandidate = (NSMutableDictionary *)v13;

    v15 = objc_opt_new();
    engagedInTop8PerCandidate = v9->_engagedInTop8PerCandidate;
    v9->_engagedInTop8PerCandidate = (NSMutableDictionary *)v15;

    v17 = objc_opt_new();
    shownInTop8PerCandidate = v9->_shownInTop8PerCandidate;
    v9->_shownInTop8PerCandidate = (NSMutableDictionary *)v17;

    v19 = objc_opt_new();
    engagedPerCandidate = v9->_engagedPerCandidate;
    v9->_engagedPerCandidate = (NSMutableDictionary *)v19;

  }
  return v9;
}

- (void)updateCountsForSessionsWithShownSuggestions:(id)a3 engagedSuggestions:(id)a4 rejectedSuggestions:(id)a5
{
  id v7;
  void *v8;
  NSSet *dockedApps;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t engagedInTop1;
  unint64_t engagedInTop2;
  unint64_t engagedInTop4;
  unint64_t engagedInTop8;
  void *v19;
  NSMutableDictionary *engagedInTop4PerCandidate;
  void *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *v24;
  void *v25;
  void *v26;
  NSMutableDictionary *engagedInTop8PerCandidate;
  void *v28;
  void *v29;
  void *v30;
  NSMutableDictionary *v31;
  void *v32;
  void *v33;
  NSMutableDictionary *engagedPerCandidate;
  void *v35;
  void *v36;
  void *v37;
  NSMutableDictionary *v38;
  void *v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t i;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  unint64_t v49;
  id v50;

  v50 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "executableType") != self->_executableType
      || self->_removeDockedApps
      && (dockedApps = self->_dockedApps,
          objc_msgSend(v8, "executableIdentifier"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          LOBYTE(dockedApps) = -[NSSet containsObject:](dockedApps, "containsObject:", v10),
          v10,
          (dockedApps & 1) != 0))
    {
LABEL_35:

      goto LABEL_36;
    }
    v11 = objc_msgSend(MEMORY[0x1E0CF9508], "consumerTypeForSubType:", objc_msgSend(v8, "consumerSubType")) == 14
       && self->_executableType == 1;
    v12 = self->_removeDockedApps || v11;
    -[ATXProactiveSuggestionClientModelEvaluationResult filteredSuggestions:removeDockedApps:](self, "filteredSuggestions:removeDockedApps:", v50, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend((id)objc_opt_class(), "rankOfEngagedSuggestion:inSuggestions:", v8, v13);
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      engagedInTop1 = self->_engagedInTop1;
      engagedInTop2 = self->_engagedInTop2;
      if (!v14)
        ++engagedInTop1;
      if (v14 < 2)
        ++engagedInTop2;
      self->_engagedInTop1 = engagedInTop1;
      self->_engagedInTop2 = engagedInTop2;
      engagedInTop4 = self->_engagedInTop4;
      engagedInTop8 = self->_engagedInTop8;
      if (v14 < 4)
        ++engagedInTop4;
      if (v14 < 8)
        ++engagedInTop8;
      self->_engagedInTop4 = engagedInTop4;
      self->_engagedInTop8 = engagedInTop8;
      self->_reciprocalRank = (float)(1.0 / (float)(v14 + 1)) + self->_reciprocalRank;
      if (v14 <= 3)
      {
        v19 = (void *)MEMORY[0x1E0CB37E8];
        engagedInTop4PerCandidate = self->_engagedInTop4PerCandidate;
        objc_msgSend(v8, "executableIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](engagedInTop4PerCandidate, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "numberWithInt:", objc_msgSend(v22, "intValue") + 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = self->_engagedInTop4PerCandidate;
        objc_msgSend(v8, "executableIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v23, v25);

LABEL_23:
        v26 = (void *)MEMORY[0x1E0CB37E8];
        engagedInTop8PerCandidate = self->_engagedInTop8PerCandidate;
        objc_msgSend(v8, "executableIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](engagedInTop8PerCandidate, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "numberWithInt:", objc_msgSend(v29, "intValue") + 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = self->_engagedInTop8PerCandidate;
        objc_msgSend(v8, "executableIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v30, v32);

        goto LABEL_24;
      }
      if (v14 <= 7)
        goto LABEL_23;
    }
LABEL_24:
    v33 = (void *)MEMORY[0x1E0CB37E8];
    engagedPerCandidate = self->_engagedPerCandidate;
    objc_msgSend(v8, "executableIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](engagedPerCandidate, "objectForKeyedSubscript:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "numberWithInt:", objc_msgSend(v36, "intValue") + 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = self->_engagedPerCandidate;
    objc_msgSend(v8, "executableIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v37, v39);

    v40 = objc_msgSend(v13, "count");
    v41 = 8;
    if (v40 < 8)
      v41 = v40;
    if (v41)
    {
      for (i = 0; i < v49; ++i)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", i);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "executableIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = (void *)MEMORY[0x1E0CB37E8];
        -[NSMutableDictionary objectForKeyedSubscript:](self->_shownInTop8PerCandidate, "objectForKeyedSubscript:", v44);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "numberWithInt:", objc_msgSend(v46, "intValue") + 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_shownInTop8PerCandidate, "setObject:forKeyedSubscript:", v47, v44);

        v48 = objc_msgSend(v13, "count");
        if (v48 >= 8)
          v49 = 8;
        else
          v49 = v48;
      }
    }
    if (objc_msgSend(v13, "count"))
      ++self->_numberOfSessionsWithPredictions;
    ++self->_numberOfSessions;

    goto LABEL_35;
  }
LABEL_36:

}

+ (int64_t)rankOfEngagedSuggestion:(id)a3 inSuggestions:(id)a4
{
  id v5;
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "count"))
  {
LABEL_8:
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_9;
  }
  v7 = 0;
  while (1)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "executableIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "executableIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqualToString:", v10))
    {

      goto LABEL_7;
    }
    v11 = objc_msgSend(v5, "executableType");
    v12 = objc_msgSend(v8, "executableType");

    if (v11 == v12)
      break;
LABEL_7:

    if (++v7 >= (unint64_t)objc_msgSend(v6, "count"))
      goto LABEL_8;
  }

LABEL_9:
  return v7;
}

- (id)filteredSuggestions:(id)a3 removeDockedApps:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSSet *dockedApps;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        if (v4)
        {
          dockedApps = self->_dockedApps;
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "executableIdentifier", (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[NSSet containsObject:](dockedApps, "containsObject:", v15);

        }
        else
        {
          v16 = 0;
        }
        if (objc_msgSend(v13, "executableType", (_QWORD)v18) == self->_executableType && !v16)
          objc_msgSend(v7, "addObject:", v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t sessionType;
  __CFString *v9;
  unint64_t executableType;
  __CFString *v11;
  NSSet *dockedApps;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  float v18;
  float v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  float v23;
  double v24;
  void *v25;
  float v26;
  void *v27;
  float v28;
  double v29;
  void *v30;
  float v31;
  float v32;
  void *v33;
  float v34;
  float v35;
  void *v36;
  float v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary keysSortedByValueUsingComparator:](self->_shownInTop8PerCandidate, "keysSortedByValueUsingComparator:", &__block_literal_global_76);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSMutableDictionary count](self->_shownInTop8PerCandidate, "count");
  if (v4 >= 0x14)
    v5 = 20;
  else
    v5 = v4;
  objc_msgSend(v3, "subarrayWithRange:", 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  sessionType = self->_sessionType;
  if (sessionType)
  {
    if (sessionType == 1)
    {
      v9 = CFSTR("UI");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %lu)"), self->_sessionType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = CFSTR("Shadow");
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("Session Type: %@\n"), v9);

  executableType = self->_executableType;
  if (executableType >= 0xC)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %li)"), self->_executableType);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E82E0308[executableType];
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("Suggestion Type: %@\n"), v11);

  if (self->_executableType == 1)
  {
    if (self->_removeDockedApps)
      dockedApps = self->_dockedApps;
    else
      dockedApps = (NSSet *)CFSTR("None");
    objc_msgSend(v7, "appendFormat:", CFSTR("Docked Apps Removed: %@\n"), dockedApps);
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("Success@1: %.02f\n"), (float)((float)self->_engagedInTop1 / (float)self->_numberOfSessionsWithPredictions));
  objc_msgSend(v7, "appendFormat:", CFSTR("Success@2: %.02f\n"), (float)((float)self->_engagedInTop2 / (float)self->_numberOfSessionsWithPredictions));
  objc_msgSend(v7, "appendFormat:", CFSTR("Success@4: %.02f\n"), (float)((float)self->_engagedInTop4 / (float)self->_numberOfSessionsWithPredictions));
  objc_msgSend(v7, "appendFormat:", CFSTR("Success@8: %.02f\n"), (float)((float)self->_engagedInTop8 / (float)self->_numberOfSessionsWithPredictions));
  objc_msgSend(v7, "appendFormat:", CFSTR("Mean Reciprocal Rank (MRR): %.02f\n"), (float)(self->_reciprocalRank / (float)self->_numberOfSessionsWithPredictions));
  objc_msgSend(v7, "appendFormat:", CFSTR("# Sessions w predictions: %lu\n"), self->_numberOfSessionsWithPredictions);
  objc_msgSend(v7, "appendFormat:", CFSTR("# Sessions: %lu\n"), self->_numberOfSessions);
  objc_msgSend(v7, "appendFormat:", CFSTR("Top predicted candidates:\n"));
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v40;
    v17 = 0.0;
    v18 = 0.0;
    v19 = 0.0;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v40 != v16)
          objc_enumerationMutation(v13);
        v21 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_engagedInTop8PerCandidate, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "floatValue");
        v24 = v23;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_engagedPerCandidate, "objectForKeyedSubscript:", v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "floatValue");
        *(float *)&v24 = v24 / (v26 + 0.000001);

        -[NSMutableDictionary objectForKeyedSubscript:](self->_engagedInTop8PerCandidate, "objectForKeyedSubscript:", v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "floatValue");
        v29 = v28;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_shownInTop8PerCandidate, "objectForKeyedSubscript:", v21);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "floatValue");
        *(float *)&v29 = v29 / (v31 + 0.000001);

        v32 = (float)(*(float *)&v24 * *(float *)&v29) / ((float)(*(float *)&v24 + *(float *)&v29) + 0.000001)
            + (float)(*(float *)&v24 * *(float *)&v29) / ((float)(*(float *)&v24 + *(float *)&v29) + 0.000001);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_engagedPerCandidate, "objectForKeyedSubscript:", v21);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "floatValue");
        v35 = v34 / (float)self->_numberOfSessions;

        v19 = v19 + v32;
        v18 = v18 + (float)(v32 * v35);
        v17 = v17 + v35;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_shownInTop8PerCandidate, "objectForKeyedSubscript:", v21);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "floatValue");
        objc_msgSend(v7, "appendFormat:", CFSTR("\t launched: %.02f; shown %.02f; precision %.02f; recall %.02f; f1 %.02f; candidate: %@\n"),
          v35,
          (float)(v37 / (float)self->_numberOfSessions),
          *(float *)&v29,
          *(float *)&v24,
          v32,
          v21,
          (_QWORD)v39);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v15);
  }
  else
  {
    v17 = 0.0;
    v18 = 0.0;
    v19 = 0.0;
  }

  objc_msgSend(v7, "appendFormat:", CFSTR("\tAverage F1 Score in top predicted candidates: %.02f\n"), (float)(v19 / (float)(unint64_t)objc_msgSend(v13, "count")));
  objc_msgSend(v7, "appendFormat:", CFSTR("\tLaunch-weighted Average F1 Score for top predicted candidates: %.02f\n"), (float)(v18 / v17));

  return v7;
}

uint64_t __64__ATXProactiveSuggestionClientModelEvaluationResult_description__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (int64_t)executableType
{
  return self->_executableType;
}

- (BOOL)removeDockedApps
{
  return self->_removeDockedApps;
}

- (unint64_t)engagedInTop1
{
  return self->_engagedInTop1;
}

- (void)setEngagedInTop1:(unint64_t)a3
{
  self->_engagedInTop1 = a3;
}

- (unint64_t)engagedInTop2
{
  return self->_engagedInTop2;
}

- (void)setEngagedInTop2:(unint64_t)a3
{
  self->_engagedInTop2 = a3;
}

- (unint64_t)engagedInTop4
{
  return self->_engagedInTop4;
}

- (void)setEngagedInTop4:(unint64_t)a3
{
  self->_engagedInTop4 = a3;
}

- (unint64_t)engagedInTop8
{
  return self->_engagedInTop8;
}

- (void)setEngagedInTop8:(unint64_t)a3
{
  self->_engagedInTop8 = a3;
}

- (unint64_t)numberOfSessionsWithPredictions
{
  return self->_numberOfSessionsWithPredictions;
}

- (void)setNumberOfSessionsWithPredictions:(unint64_t)a3
{
  self->_numberOfSessionsWithPredictions = a3;
}

- (unint64_t)numberOfSessions
{
  return self->_numberOfSessions;
}

- (void)setNumberOfSessions:(unint64_t)a3
{
  self->_numberOfSessions = a3;
}

- (NSMutableDictionary)engagedInTop4PerCandidate
{
  return self->_engagedInTop4PerCandidate;
}

- (void)setEngagedInTop4PerCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_engagedInTop4PerCandidate, a3);
}

- (NSMutableDictionary)engagedInTop8PerCandidate
{
  return self->_engagedInTop8PerCandidate;
}

- (void)setEngagedInTop8PerCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_engagedInTop8PerCandidate, a3);
}

- (NSMutableDictionary)shownInTop8PerCandidate
{
  return self->_shownInTop8PerCandidate;
}

- (void)setShownInTop8PerCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_shownInTop8PerCandidate, a3);
}

- (NSMutableDictionary)engagedPerCandidate
{
  return self->_engagedPerCandidate;
}

- (void)setEngagedPerCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_engagedPerCandidate, a3);
}

- (float)reciprocalRank
{
  return self->_reciprocalRank;
}

- (void)setReciprocalRank:(float)a3
{
  self->_reciprocalRank = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagedPerCandidate, 0);
  objc_storeStrong((id *)&self->_shownInTop8PerCandidate, 0);
  objc_storeStrong((id *)&self->_engagedInTop8PerCandidate, 0);
  objc_storeStrong((id *)&self->_engagedInTop4PerCandidate, 0);
  objc_storeStrong((id *)&self->_dockedApps, 0);
}

@end
