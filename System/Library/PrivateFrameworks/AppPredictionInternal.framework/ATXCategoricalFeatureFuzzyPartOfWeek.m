@implementation ATXCategoricalFeatureFuzzyPartOfWeek

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;

  v4 = a3;
  objc_msgSend(v4, "timeContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "timeContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "timeOfDay");

    if (v7 > 17)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timeContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dateByAddingTimeInterval:", 86400.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isDateInWeekend:", v14);

    }
    else
    {
      objc_msgSend(v4, "timeContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "dateInWeekend");
    }

    v15 = CFSTR("Weekday");
    if (v9)
      v15 = CFSTR("Weekend");
    v11 = v15;
  }
  else
  {
    __atxlog_handle_relevance_model();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ATXCategoricalFeatureTimeOfDayHour categoricalFeatureValueForContext:candidate:].cold.1();

    v11 = CFSTR("<Unexpected Category Value>");
  }

  return v11;
}

@end
