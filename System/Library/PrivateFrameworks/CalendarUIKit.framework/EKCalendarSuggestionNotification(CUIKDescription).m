@implementation EKCalendarSuggestionNotification(CUIKDescription)

- (uint64_t)supportsDisplay
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;

  objc_msgSend(a1, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[EKCalendarSuggestionNotification(CUIKDescription) supportsDisplay].cold.1(v4);
    goto LABEL_12;
  }
  objc_msgSend(a1, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localCustomObjectForKey:", *MEMORY[0x1E0D0C500]);
  v4 = objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[EKCalendarSuggestionNotification(CUIKDescription) supportsDisplay].cold.2(a1);
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[EKCalendarSuggestionNotification(CUIKDescription) supportsDisplay].cold.3((uint64_t)v4, a1, v6);
LABEL_11:

LABEL_12:
    v5 = 0;
    goto LABEL_13;
  }
  v5 = -[NSObject BOOLValue](v4, "BOOLValue");
LABEL_13:

  return v5;
}

- (id)descriptionStrings:()CUIKDescription
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = (void *)objc_opt_new();
  objc_msgSend(a1, "startDateForNextOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "type") == 13)
  {
    CUIKBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Canceled"), &stru_1E6EBAE30, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("Action"));
    v9 = (void *)MEMORY[0x1E0C9AAB0];
    v10 = CFSTR("Cancelled");
    v11 = v5;
LABEL_17:
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v10);
LABEL_18:

    goto LABEL_19;
  }
  if (objc_msgSend(a1, "type") == 12)
  {
    objc_msgSend(a1, "originAppName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CUIKSuggestionDescriptionGenerator brandedOriginDescriptionStringWithAppName:](CUIKSuggestionDescriptionGenerator, "brandedOriginDescriptionStringWithAppName:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "localizedYearMonthAndDayStringShortened:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(a1, "allDay"))
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("Date"));
      }
      else
      {
        objc_msgSend(v6, "timeStringAlwaysIncludeMinutes:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0CB3940];
        CUIKBundle();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("%@ at %@"), &stru_1E6EBAE30, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringWithFormat:", v18, v13, v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("Date"));
      }

    }
    v10 = CFSTR("Action");
    goto LABEL_16;
  }
  v14 = (id)objc_msgSend(a1, "_resourceChangeStringWithOptions:dict:", a3, v5);
  if (objc_msgSend(a1, "type") == 14)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 || !v6)
      goto LABEL_18;
    if ((objc_msgSend(a1, "timeChanged") & 1) != 0 || objc_msgSend(a1, "dateChanged"))
    {
      objc_msgSend(v6, "localizedYearMonthAndDayStringShortened:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("Date");
LABEL_16:
      v11 = v5;
      v9 = v8;
      goto LABEL_17;
    }
  }
LABEL_19:

  return v5;
}

- (id)allDescriptionStringsWithOptions:()CUIKDescription
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "descriptionStrings:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("Date"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("Action"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2)
  {
    v11 = v2;
    v12 = v3;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = (uint64_t *)&v11;
    v7 = 2;
  }
  else
  {
    v10 = v3;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v10;
    v7 = 1;
  }
  objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v10, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)supportsDisplay
{
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = v6;
  v11 = 2114;
  v12 = v8;
  _os_log_error_impl(&dword_1B8A6A000, a3, OS_LOG_TYPE_ERROR, "Event has unexpected type ('%{public}@') for key used to determine if suggested event is eligible for notification, event unique identifier = %{public}@", (uint8_t *)&v9, 0x16u);

  OUTLINED_FUNCTION_5();
}

@end
