@implementation ATXActivitySuggestionFeedbackLogUploader

+ (void)sendActivitySuggestionEventToCoreAnalytics:(id)a3
{
  id v3;

  objc_msgSend(a1, "_generateCADictionaryForEvent:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

+ (id)_generateCADictionaryForEvent:(id)a3
{
  id v4;
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
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "acceptedTriggers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_arrayToStringOfClasses:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("acceptedTriggerClasses"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "activity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "activityType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("activityType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "eventType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("feedbackEventType"));

  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "activity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "origin"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("origin"));

  objc_msgSend(v4, "activity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "originAnchorType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("originAnchorType"));

  objc_msgSend(v4, "activity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "triggers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_arrayToStringOfClasses:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("suggestedTriggerClasses"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "suggestionType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("suggestionType"));

  objc_msgSend(v4, "activity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "suggestionUUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("suggestionUUID"));

  v23 = (void *)MEMORY[0x1E0CB37E8];
  v24 = objc_msgSend(v4, "location");

  objc_msgSend(v23, "numberWithUnsignedInteger:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("uiLocation"));

  return v5;
}

+ (id)_arrayToStringOfClasses:(id)a3
{
  void *v3;
  __CFString *v4;

  if (a3)
  {
    objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_75);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(":"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = &stru_1E4D5DB30;
  }
  return v4;
}

NSString *__68__ATXActivitySuggestionFeedbackLogUploader__arrayToStringOfClasses___block_invoke()
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

@end
