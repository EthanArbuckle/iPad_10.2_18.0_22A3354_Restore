@implementation ATXComplicationSuggestionHeuristics

- (ATXComplicationSuggestionHeuristics)init
{
  ATXComplicationSuggestionHeuristics *v2;
  ATXComplicationSuggestionHeuristics *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXComplicationSuggestionHeuristics;
  v2 = -[ATXComplicationSuggestionHeuristics init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ATXComplicationSuggestionHeuristics flushCache](v2, "flushCache");
  return v3;
}

- (void)flushCache
{
  _PASLazyPurgeableResult *v3;
  _PASLazyPurgeableResult *cache;

  v3 = (_PASLazyPurgeableResult *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815E0]), "initWithBlock:idleTimeout:", &__block_literal_global_8, 3600.0);
  cache = self->_cache;
  self->_cache = v3;

}

ATXComplicationSuggestionHeuristicsCache *__49__ATXComplicationSuggestionHeuristics_flushCache__block_invoke()
{
  ATXComplicationSuggestionHeuristicsCache *v0;

  v0 = objc_alloc_init(ATXComplicationSuggestionHeuristicsCache);
  -[ATXComplicationSuggestionHeuristicsCache setNumBluetoothConnectionsOverLastWeek:](v0, "setNumBluetoothConnectionsOverLastWeek:", +[ATXComplicationSuggestionHeuristics _numBluetoothConnectionsOverLastWeek](ATXComplicationSuggestionHeuristics, "_numBluetoothConnectionsOverLastWeek"));
  -[ATXComplicationSuggestionHeuristicsCache setNumCalendarEventsOverLastAndNextWeek:](v0, "setNumCalendarEventsOverLastAndNextWeek:", +[ATXComplicationSuggestionHeuristics _numCalendarEventsOverLastAndNextWeek](ATXComplicationSuggestionHeuristics, "_numCalendarEventsOverLastAndNextWeek"));
  -[ATXComplicationSuggestionHeuristicsCache setNumRemindersOverLastWeek:](v0, "setNumRemindersOverLastWeek:", +[ATXComplicationSuggestionHeuristics _numRemindersOverLastWeek](ATXComplicationSuggestionHeuristics, "_numRemindersOverLastWeek"));
  return v0;
}

- (id)complicationHeuristicsDictionary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXComplicationSuggestionHeuristics _batteryHeuristic](self, "_batteryHeuristic");
  if (-[ATXComplicationSuggestionHeuristics _confidenceIsValidForPrediction:](self, "_confidenceIsValidForPrediction:", v4))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXComplicationWidgetPersonalities batteryComplicationWidgetPersonality](ATXComplicationWidgetPersonalities, "batteryComplicationWidgetPersonality");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v6);

  }
  v7 = -[ATXComplicationSuggestionHeuristics _calendarHeuristic](self, "_calendarHeuristic");
  if (-[ATXComplicationSuggestionHeuristics _confidenceIsValidForPrediction:](self, "_confidenceIsValidForPrediction:", v7))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXComplicationWidgetPersonalities calendarNextEventComplicationWidgetPersonality](ATXComplicationWidgetPersonalities, "calendarNextEventComplicationWidgetPersonality");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v9);

  }
  v10 = -[ATXComplicationSuggestionHeuristics _reminderHeuristic](self, "_reminderHeuristic");
  if (-[ATXComplicationSuggestionHeuristics _confidenceIsValidForPrediction:](self, "_confidenceIsValidForPrediction:", v10))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXComplicationWidgetPersonalities remindersComplicationWidgetPersonality](ATXComplicationWidgetPersonalities, "remindersComplicationWidgetPersonality");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v12);

  }
  +[ATXComplicationWidgetPersonalities weatherConditionsComplicationWidgetPersonality](ATXComplicationWidgetPersonalities, "weatherConditionsComplicationWidgetPersonality");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E83CBB00, v13);

  -[ATXComplicationSuggestionHeuristics _homeHeuristics](self, "_homeHeuristics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v14);

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendString:", CFSTR("\nHeurstics scores:\n\n"));
  +[ATXComplicationWidgetPersonalities batteryComplicationWidgetPersonality](ATXComplicationWidgetPersonalities, "batteryComplicationWidgetPersonality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend((id)objc_opt_class(), "scoreFromConfidence:", -[ATXComplicationSuggestionHeuristics _batteryHeuristic](self, "_batteryHeuristic"));
  -[_PASLazyPurgeableResult result](self->_cache, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numBluetoothConnectionsOverLastWeek");

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "extensionBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v4;
  objc_msgSend(v4, "kind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Extension BundleId: %@\nKind: %@\nScore: %lu\nBluetooth connections over last week: %lu\n\n"), v9, v10, v5, v7);
  v11 = objc_claimAutoreleasedReturnValue();

  v64 = (void *)v11;
  objc_msgSend(v3, "appendString:", v11);
  +[ATXComplicationWidgetPersonalities calendarNextEventComplicationWidgetPersonality](ATXComplicationWidgetPersonalities, "calendarNextEventComplicationWidgetPersonality");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend((id)objc_opt_class(), "scoreFromConfidence:", -[ATXComplicationSuggestionHeuristics _calendarHeuristic](self, "_calendarHeuristic"));
  -[_PASLazyPurgeableResult result](self->_cache, "result");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "numCalendarEventsOverLastAndNextWeek");

  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v12, "extensionBundleId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v12;
  objc_msgSend(v12, "kind");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("Extension BundleId: %@\nKind: %@\nScore: %lu\nCalendar events over last and next week: %lu\n\n"), v17, v18, v13, v15);
  v19 = objc_claimAutoreleasedReturnValue();

  v62 = (void *)v19;
  objc_msgSend(v3, "appendString:", v19);
  +[ATXComplicationWidgetPersonalities remindersComplicationWidgetPersonality](ATXComplicationWidgetPersonalities, "remindersComplicationWidgetPersonality");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[ATXComplicationSuggestionHeuristics _reminderHeuristic](self, "_reminderHeuristic");
  -[_PASLazyPurgeableResult result](self->_cache, "result");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "numRemindersOverLastWeek");

  v24 = objc_msgSend((id)objc_opt_class(), "scoreFromConfidence:", v21);
  v25 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v20, "extensionBundleId");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v20;
  objc_msgSend(v20, "kind");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("Extension BundleId: %@\nKind: %@\nScore: %lu\nReminders over last week: %lu\n\n"), v26, v27, v24, v23);
  v28 = objc_claimAutoreleasedReturnValue();

  v60 = (void *)v28;
  objc_msgSend(v3, "appendString:", v28);
  +[ATXComplicationWidgetPersonalities weatherConditionsComplicationWidgetPersonality](ATXComplicationWidgetPersonalities, "weatherConditionsComplicationWidgetPersonality");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend((id)objc_opt_class(), "scoreFromConfidence:", 4);
  v31 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v29, "extensionBundleId");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v29;
  objc_msgSend(v29, "kind");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", CFSTR("Extension BundleId: %@\nKind: %@\nScore: %lu\n\n"), v32, v33, v30);
  v34 = objc_claimAutoreleasedReturnValue();

  v58 = (void *)v34;
  objc_msgSend(v3, "appendString:", v34);
  objc_msgSend((id)objc_opt_class(), "_countedHomeAccessoryEvents");
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend((id)objc_opt_class(), "getClimateCountGivenHomeCounts:", v35);
  v37 = objc_msgSend((id)objc_opt_class(), "getLightCountGivenHomeCounts:", v35);
  v57 = (void *)v35;
  v38 = objc_msgSend((id)objc_opt_class(), "getSecurityCountGivenHomeCounts:", v35);
  objc_msgSend(v3, "appendString:", CFSTR("Home Heuristics \n"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Climate Count: %lu\n"), v36);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v39);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Security Count: %lu\n"), v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v40);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Lights Count: %lu\n"), v37);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v41);

  v42 = v3;
  objc_msgSend(v3, "appendString:", CFSTR("Scores: \n"));
  -[ATXComplicationSuggestionHeuristics _homeHeuristics](self, "_homeHeuristics");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v67;
    do
    {
      v47 = 0;
      do
      {
        if (*(_QWORD *)v67 != v46)
          objc_enumerationMutation(v43);
        v48 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v47);
        v49 = (void *)objc_opt_class();
        objc_msgSend(v43, "objectForKeyedSubscript:", v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v49, "scoreFromConfidence:", objc_msgSend(v50, "unsignedIntegerValue"));

        v52 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v48, "kind");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "stringWithFormat:", CFSTR("%@: %ld\n"), v53, v51);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "appendString:", v54);

        ++v47;
      }
      while (v45 != v47);
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
    }
    while (v45);
  }
  objc_msgSend(v42, "appendString:", CFSTR("\n"));
  v55 = (void *)objc_msgSend(v42, "copy");

  return v55;
}

+ (int64_t)scoreFromConfidence:(unsigned __int8)a3
{
  if (a3 > 5u)
    return -10000;
  else
    return qword_1C9E7E8A0[(char)a3];
}

- (unsigned)_batteryHeuristic
{
  void *v3;
  void *v4;
  unint64_t v5;
  unsigned __int8 v6;
  char v7;

  v3 = (void *)MEMORY[0x1CAA48B6C](self, a2);
  -[_PASLazyPurgeableResult result](self->_cache, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numBluetoothConnectionsOverLastWeek");

  if (v5 <= 0x14)
  {
    if (v5 <= 5)
      v7 = 2;
    else
      v7 = 3;
    if (v5 <= 0xA)
      v6 = v7;
    else
      v6 = 4;
  }
  else
  {
    v6 = 5;
  }
  objc_autoreleasePoolPop(v3);
  return v6;
}

- (unsigned)_calendarHeuristic
{
  void *v3;
  void *v4;
  unint64_t v5;
  unsigned __int8 v6;
  char v7;

  v3 = (void *)MEMORY[0x1CAA48B6C](self, a2);
  -[_PASLazyPurgeableResult result](self->_cache, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numCalendarEventsOverLastAndNextWeek");

  if (v5 <= 0x32)
  {
    if (v5 <= 8)
      v7 = 2;
    else
      v7 = 3;
    if (v5 <= 0x14)
      v6 = v7;
    else
      v6 = 4;
  }
  else
  {
    v6 = 5;
  }
  objc_autoreleasePoolPop(v3);
  return v6;
}

- (unsigned)_reminderHeuristic
{
  void *v3;
  void *v4;
  unint64_t v5;
  unsigned __int8 v6;
  char v7;

  v3 = (void *)MEMORY[0x1CAA48B6C](self, a2);
  -[_PASLazyPurgeableResult result](self->_cache, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numRemindersOverLastWeek");

  if (v5 <= 0xA)
  {
    if (v5 <= 1)
      v7 = 2;
    else
      v7 = 3;
    if (v5 <= 5)
      v6 = v7;
    else
      v6 = 4;
  }
  else
  {
    v6 = 5;
  }
  objc_autoreleasePoolPop(v3);
  return v6;
}

- (id)_homeHeuristics
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  objc_msgSend((id)objc_opt_class(), "_countedHomeAccessoryEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)objc_opt_class(), "getClimateCountGivenHomeCounts:", v3);
  v5 = objc_msgSend((id)objc_opt_class(), "getLightCountGivenHomeCounts:", v3);
  v6 = objc_msgSend((id)objc_opt_class(), "getSecurityCountGivenHomeCounts:", v3);
  v7 = (void *)objc_opt_new();
  if (v4 && v5 && v6)
  {
    v8 = v5 + v4 + v6;
    if (v8)
      v9 = 3;
    else
      v9 = 1;
    if (v8 <= 5)
      v10 = v9;
    else
      v10 = 4;
    if (v8 <= 0xF)
      v11 = v10;
    else
      v11 = 5;
    v12 = 1;
    v13 = 1;
    v14 = 1;
  }
  else
  {
    if (v4)
      v15 = 3;
    else
      v15 = 1;
    if (v4 > 5)
      v15 = 4;
    if (v4 <= 0xF)
      v12 = v15;
    else
      v12 = 5;
    if (v5)
      v16 = 3;
    else
      v16 = 1;
    if (v5 > 5)
      v16 = 4;
    if (v5 <= 0xF)
      v13 = v16;
    else
      v13 = 5;
    if (v6)
      v17 = 3;
    else
      v17 = 1;
    if (v6 > 5)
      v17 = 4;
    v18 = v6 > 0xF;
    v11 = 1;
    if (v18)
      v14 = 5;
    else
      v14 = v17;
  }
  if (-[ATXComplicationSuggestionHeuristics _confidenceIsValidForPrediction:](self, "_confidenceIsValidForPrediction:", v11))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXComplicationWidgetPersonalities homeSummaryComplicationWidgetPersonality](ATXComplicationWidgetPersonalities, "homeSummaryComplicationWidgetPersonality");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, v20);

  }
  if (-[ATXComplicationSuggestionHeuristics _confidenceIsValidForPrediction:](self, "_confidenceIsValidForPrediction:", v12))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXComplicationWidgetPersonalities homeClimateComplicationWidgetPersonality](ATXComplicationWidgetPersonalities, "homeClimateComplicationWidgetPersonality");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, v22);

  }
  if (-[ATXComplicationSuggestionHeuristics _confidenceIsValidForPrediction:](self, "_confidenceIsValidForPrediction:", v14))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXComplicationWidgetPersonalities homeSecurityComplicationWidgetPersonality](ATXComplicationWidgetPersonalities, "homeSecurityComplicationWidgetPersonality");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, v24);

  }
  if (-[ATXComplicationSuggestionHeuristics _confidenceIsValidForPrediction:](self, "_confidenceIsValidForPrediction:", v13))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXComplicationWidgetPersonalities homeLightsComplicationWidgetPersonality](ATXComplicationWidgetPersonalities, "homeLightsComplicationWidgetPersonality");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, v26);

  }
  +[ATXComplicationWidgetPersonalities homeSecuritySingleSensorComplicationWidgetPersonality](ATXComplicationWidgetPersonalities, "homeSecuritySingleSensorComplicationWidgetPersonality");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E83CBB18, v27);

  +[ATXComplicationWidgetPersonalities homeClimateSingleSensorComplicationWidgetPersonality](ATXComplicationWidgetPersonalities, "homeClimateSingleSensorComplicationWidgetPersonality");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E83CBB18, v28);

  return v7;
}

+ (unint64_t)getClimateCountGivenHomeCounts:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "countForObject:", CFSTR("0000008A-0000-1000-8000-0026BB765291"));
  v5 = objc_msgSend(v3, "countForObject:", CFSTR("0000004A-0000-1000-8000-0026BB765291")) + v4;
  v6 = objc_msgSend(v3, "countForObject:", CFSTR("000000BC-0000-1000-8000-0026BB765291"));
  v7 = v5 + v6 + objc_msgSend(v3, "countForObject:", CFSTR("000000BD-0000-1000-8000-0026BB765291"));
  v8 = objc_msgSend(v3, "countForObject:", CFSTR("0000008D-0000-1000-8000-0026BB765291"));
  v9 = objc_msgSend(v3, "countForObject:", CFSTR("00000082-0000-1000-8000-0026BB765291"));

  return v7 + v8 + v9;
}

+ (unint64_t)getSecurityCountGivenHomeCounts:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "countForObject:", CFSTR("00000041-0000-1000-8000-0026BB765291"));
  v5 = objc_msgSend(v3, "countForObject:", CFSTR("00000081-0000-1000-8000-0026BB765291")) + v4;
  v6 = objc_msgSend(v3, "countForObject:", CFSTR("0000008B-0000-1000-8000-0026BB765291"));
  v7 = v5 + v6 + objc_msgSend(v3, "countForObject:", CFSTR("00000080-0000-1000-8000-0026BB765291"));
  v8 = objc_msgSend(v3, "countForObject:", CFSTR("00000045-0000-1000-8000-0026BB765291"));
  v9 = objc_msgSend(v3, "countForObject:", CFSTR("0000007E-0000-1000-8000-0026BB765291"));

  return v7 + v8 + v9;
}

+ (unint64_t)getLightCountGivenHomeCounts:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "countForObject:", CFSTR("00000043-0000-1000-8000-0026BB765291"));
  v5 = objc_msgSend(v3, "countForObject:", CFSTR("00000049-0000-1000-8000-0026BB765291")) + v4;
  v6 = objc_msgSend(v3, "countForObject:", CFSTR("00000047-0000-1000-8000-0026BB765291"));

  return v5 + v6;
}

+ (unint64_t)_numBluetoothConnectionsOverLastWeek
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  unint64_t v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v2 = (void *)MEMORY[0x1CAA48B6C](a1, a2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -604800.0);
  v4 = (void *)objc_opt_new();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  BiomeLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "Device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "Wireless");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "Bluetooth");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026F0]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v3, 0, 0, 0, 0);
  objc_msgSend(v8, "publisherWithUseCase:options:", *MEMORY[0x1E0CF9398], v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__ATXComplicationSuggestionHeuristics__numBluetoothConnectionsOverLastWeek__block_invoke_97;
  v15[3] = &unk_1E82DB080;
  v11 = v4;
  v16 = v11;
  v17 = &v18;
  v12 = (id)objc_msgSend(v10, "sinkWithCompletion:receiveInput:", &__block_literal_global_96, v15);

  v13 = v19[3];
  _Block_object_dispose(&v18, 8);

  objc_autoreleasePoolPop(v2);
  return v13;
}

void __75__ATXComplicationSuggestionHeuristics__numBluetoothConnectionsOverLastWeek__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_lock_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __75__ATXComplicationSuggestionHeuristics__numBluetoothConnectionsOverLastWeek__block_invoke_cold_1(v2);

  }
}

void __75__ATXComplicationSuggestionHeuristics__numBluetoothConnectionsOverLastWeek__block_invoke_97(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v13, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "starting");

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v13, "timestamp");
      objc_msgSend(v7, "numberWithDouble:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v4);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v10;

      if (v11 != 0.0)
      {
        objc_msgSend(v13, "timestamp");
        if (v12 - v11 >= 60.0)
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, v4);
      }
    }
  }

}

+ (unint64_t)_numRemindersOverLastWeek
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -604800.0);
  v4 = objc_msgSend(a1, "numberOfRemindersSinceDate:", v3);

  return v4;
}

+ (unint64_t)numberOfRemindersSinceDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "numBundleIdOccurrencesForBundleId:startDate:endDate:", CFSTR("com.apple.reminders"), v3, v5);

  return v6;
}

+ (unint64_t)_numCalendarEventsOverLastAndNextWeek
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -604800.0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 604800.0);
  v4 = objc_msgSend((id)objc_opt_class(), "_fetchNumberOfCalendarEventsForStartDate:endDate:", v2, v3);

  return v4;
}

+ (unint64_t)_fetchNumberOfCalendarEventsForStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA48B6C]();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA078]), "initWithEKOptions:", 128);
  objc_msgSend(v8, "predicateForEventsWithStartDate:endDate:calendars:", v5, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "eventsMatchingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  objc_autoreleasePoolPop(v7);
  return v11;
}

+ (id)_countedHomeAccessoryEvents
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v2 = (void *)objc_opt_new();
  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "HomeKit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "AccessoryControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "atx_publisherFromStartDate:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__ATXComplicationSuggestionHeuristics__countedHomeAccessoryEvents__block_invoke_105;
  v11[3] = &unk_1E82DB0C8;
  v8 = v2;
  v12 = v8;
  v9 = (id)objc_msgSend(v7, "sinkWithCompletion:receiveInput:", &__block_literal_global_104, v11);

  return v8;
}

void __66__ATXComplicationSuggestionHeuristics__countedHomeAccessoryEvents__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_lock_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __66__ATXComplicationSuggestionHeuristics__countedHomeAccessoryEvents__block_invoke_cold_1(v2);

  }
}

void __66__ATXComplicationSuggestionHeuristics__countedHomeAccessoryEvents__block_invoke_105(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serviceType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v6, "serviceType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

    }
  }
  else
  {
    __atxlog_handle_lock_screen();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __66__ATXComplicationSuggestionHeuristics__countedHomeAccessoryEvents__block_invoke_105_cold_1(v3);

  }
}

- (BOOL)_confidenceIsValidForPrediction:(unsigned __int8)a3
{
  return (a3 & 0xFD) != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

void __75__ATXComplicationSuggestionHeuristics__numBluetoothConnectionsOverLastWeek__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "Could not query Bluetooth connected events for complication heuristics: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

void __66__ATXComplicationSuggestionHeuristics__countedHomeAccessoryEvents__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "Could not fetch Home accessory events: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

void __66__ATXComplicationSuggestionHeuristics__countedHomeAccessoryEvents__block_invoke_105_cold_1(void *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "eventBody");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v4, v5, "Incorrect class received while fetching home accessory events: %@", v6, v7, v8, v9, 2u);

}

@end
