@implementation ATXProactiveSuggestionFeedbackResult(iOSUIFeedbackQuery)

- (id)predictionContext
{
  void *v2;
  char isKindOfClass;
  void *v4;

  objc_msgSend(a1, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(a1, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
