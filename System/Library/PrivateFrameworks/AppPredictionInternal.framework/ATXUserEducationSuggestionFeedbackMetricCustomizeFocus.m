@implementation ATXUserEducationSuggestionFeedbackMetricCustomizeFocus

- (id)metricName
{
  return CFSTR("com.apple.ATXUserEducationSuggestionFeedbackMetricCustomizeFocus");
}

- (id)coreAnalyticsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ATXUserEducationSuggestionFeedbackMetricCustomizeFocus;
  -[ATXUserEducationSuggestionFeedbackMetric coreAnalyticsDictionary](&v10, sel_coreAnalyticsDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[ATXUserEducationSuggestionFeedbackMetric feedback](self, "feedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "modeSemanticType");
  DNDModeSemanticTypeToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("modeSemanticType"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("modeSemanticType"));

  }
  return v4;
}

@end
