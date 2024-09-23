@implementation ATXTimeBasedInferredActivityBiomeStream

- (id)sessionPublisherFromStartTime:(double)a3
{
  void *v3;
  void *v4;

  -[ATXTimeBasedInferredActivityBiomeStream transitionPublisherFromStartTime:](self, "transitionPublisherFromStartTime:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXUnifiedActivityStreamConversions sessionPublisherFromTransitionPublisher:](_ATXUnifiedActivityStreamConversions, "sessionPublisherFromTransitionPublisher:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)transitionPublisherFromStartTime:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (a3 == 0.0)
  {
    __atxlog_handle_modes();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[ATXTimeBasedInferredActivityBiomeStream transitionPublisherFromStartTime:].cold.1(v22);

    objc_msgSend(MEMORY[0x1E0C9AA60], "bpsPublisher");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_new();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a3);
    objc_msgSend(v5, "startOfDayForDate:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v10, "setHour:", 0);
    objc_msgSend(v10, "setMinute:", 0);
    objc_msgSend(v10, "setSecond:", 1);
    v11 = (void *)objc_opt_new();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __76__ATXTimeBasedInferredActivityBiomeStream_transitionPublisherFromStartTime___block_invoke;
    v30[3] = &unk_1E82E7F08;
    v12 = v5;
    v31 = v12;
    v24 = v9;
    v32 = v24;
    v13 = v11;
    v33 = v13;
    v25 = (void *)v8;
    objc_msgSend(v12, "enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:", v8, v10, 2, v30);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v18);
          v20 = (void *)MEMORY[0x1CAA48B6C](v15);
          -[ATXTimeBasedInferredActivityBiomeStream _addBedtimeTransitionsForDate:calendar:toArray:](self, "_addBedtimeTransitionsForDate:calendar:toArray:", v19, v12, v6, v24);
          -[ATXTimeBasedInferredActivityBiomeStream _addWorkTransitionsForDate:calendar:toArray:](self, "_addWorkTransitionsForDate:calendar:toArray:", v19, v12, v6);
          -[ATXTimeBasedInferredActivityBiomeStream _addHomeTransitionsForDate:calendar:toArray:](self, "_addHomeTransitionsForDate:calendar:toArray:", v19, v12, v6);
          objc_autoreleasePoolPop(v20);
          ++v18;
        }
        while (v16 != v18);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        v16 = v15;
      }
      while (v15);
    }

    objc_msgSend(v6, "bpsPublisher");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v21;
}

void __76__ATXTimeBasedInferredActivityBiomeStream_transitionPublisherFromStartTime___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "compareDate:toDate:toUnitGranularity:") == 1)
  {
    *a4 = 1;
LABEL_5:
    v6 = v7;
    goto LABEL_6;
  }
  v6 = v7;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_addTransitionForDate:(id)a3 transitionHour:(int64_t)a4 transitionMinute:(int64_t)a5 calendar:(id)a6 isEntry:(BOOL)a7 activity:(unint64_t)a8 toArray:(id)a9
{
  _BOOL8 v10;
  id v15;
  ATXUnifiedInferredActivityTransition *v16;
  id v17;
  id v18;

  v10 = a7;
  v15 = a9;
  objc_msgSend(a6, "dateBySettingHour:minute:second:ofDate:options:", a4, a5, 0, a3, 0);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v16 = [ATXUnifiedInferredActivityTransition alloc];
  objc_msgSend(v18, "timeIntervalSinceReferenceDate");
  v17 = -[ATXUnifiedInferredActivityTransition initFromTransitionTime:isEntryEvent:source:activityType:confidence:](v16, "initFromTransitionTime:isEntryEvent:source:activityType:confidence:", v10, CFSTR("timeBasedInferredActivity"), a8);
  objc_msgSend(v15, "addObject:", v17);

}

- (void)_addBedtimeTransitionsForDate:(id)a3 calendar:(id)a4 toArray:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ATXTimeBasedInferredActivityBiomeStream _addTransitionForDate:transitionHour:transitionMinute:calendar:isEntry:activity:toArray:](self, "_addTransitionForDate:transitionHour:transitionMinute:calendar:isEntry:activity:toArray:", v10, 0, 1, v9, 1, 5, v8);
  -[ATXTimeBasedInferredActivityBiomeStream _addTransitionForDate:transitionHour:transitionMinute:calendar:isEntry:activity:toArray:](self, "_addTransitionForDate:transitionHour:transitionMinute:calendar:isEntry:activity:toArray:", v10, 6, 30, v9, 0, 5, v8);

}

- (void)_addWorkTransitionsForDate:(id)a3 calendar:(id)a4 toArray:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v8, "isDateInWeekend:", v10) & 1) == 0)
  {
    -[ATXTimeBasedInferredActivityBiomeStream _addTransitionForDate:transitionHour:transitionMinute:calendar:isEntry:activity:toArray:](self, "_addTransitionForDate:transitionHour:transitionMinute:calendar:isEntry:activity:toArray:", v10, 9, 0, v8, 1, 2, v9);
    -[ATXTimeBasedInferredActivityBiomeStream _addTransitionForDate:transitionHour:transitionMinute:calendar:isEntry:activity:toArray:](self, "_addTransitionForDate:transitionHour:transitionMinute:calendar:isEntry:activity:toArray:", v10, 17, 0, v8, 0, 2, v9);
  }

}

- (void)_addHomeTransitionsForDate:(id)a3 calendar:(id)a4 toArray:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (objc_msgSend(v9, "isDateInWeekend:"))
    -[ATXTimeBasedInferredActivityBiomeStream _addTransitionForDate:transitionHour:transitionMinute:calendar:isEntry:activity:toArray:](self, "_addTransitionForDate:transitionHour:transitionMinute:calendar:isEntry:activity:toArray:", v10, 9, 0, v9, 1, 1, v8);
  else
    -[ATXTimeBasedInferredActivityBiomeStream _addTransitionForDate:transitionHour:transitionMinute:calendar:isEntry:activity:toArray:](self, "_addTransitionForDate:transitionHour:transitionMinute:calendar:isEntry:activity:toArray:", v10, 17, 30, v9, 1, 1, v8);
  -[ATXTimeBasedInferredActivityBiomeStream _addTransitionForDate:transitionHour:transitionMinute:calendar:isEntry:activity:toArray:](self, "_addTransitionForDate:transitionHour:transitionMinute:calendar:isEntry:activity:toArray:", v10, 22, 0, v9, 0, 1, v8);

}

- (void)transitionPublisherFromStartTime:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "A non-zero start time should be passed in", v1, 2u);
}

@end
