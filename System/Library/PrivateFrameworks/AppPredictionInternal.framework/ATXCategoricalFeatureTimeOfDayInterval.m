@implementation ATXCategoricalFeatureTimeOfDayInterval

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  NSObject *v11;

  v4 = a3;
  objc_msgSend(v4, "timeContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "timeContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "timeOfDay");

    v8 = CFSTR("6_to_12");
    v9 = CFSTR("18_to_24");
    if (v7 < 0x12)
      v9 = CFSTR("12_to_18");
    if (v7 >= 0xC)
      v8 = v9;
    if (v7 >= 6)
      v10 = v8;
    else
      v10 = CFSTR("0_to_6");
  }
  else
  {
    __atxlog_handle_relevance_model();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[ATXCategoricalFeatureTimeOfDayHour categoricalFeatureValueForContext:candidate:].cold.1();

    v10 = CFSTR("<Unexpected Category Value>");
  }

  return (id)v10;
}

@end
