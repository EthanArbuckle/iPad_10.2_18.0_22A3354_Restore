@implementation TranslationFeedbackActivity

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)_systemImageName
{
  return CFSTR("exclamationmark.circle");
}

- (int64_t)actionType
{
  return 15;
}

- (BOOL)canPerformWithTranslationContext:(id)a3
{
  return objc_msgSend(a3, "hasStartedTranslating");
}

- (void)performActivityWithTranslationContext:(id)a3
{
  objc_msgSend(a3, "requestSendFeedbackWithCompletionHandler:", 0);
  -[_SFActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

@end
