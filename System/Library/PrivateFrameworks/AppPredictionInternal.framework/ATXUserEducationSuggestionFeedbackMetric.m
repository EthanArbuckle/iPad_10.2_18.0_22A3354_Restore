@implementation ATXUserEducationSuggestionFeedbackMetric

- (ATXUserEducationSuggestionFeedbackMetric)initWithFeedback:(id)a3
{
  id v5;
  ATXUserEducationSuggestionFeedbackMetric *v6;
  ATXUserEducationSuggestionFeedbackMetric *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXUserEducationSuggestionFeedbackMetric;
  v6 = -[_ATXCoreAnalyticsMetric init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_feedback, a3);

  return v7;
}

- (id)coreAnalyticsDictionary
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("feedbackType");
  -[ATXUserEducationSuggestionFeedback feedbackType](self->_feedback, "feedbackType");
  ATXUserEducationSuggestionFeedbackTypeToString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)

  return v4;
}

- (ATXUserEducationSuggestionFeedback)feedback
{
  return self->_feedback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedback, 0);
}

@end
