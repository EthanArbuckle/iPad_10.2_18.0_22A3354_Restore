@implementation ExitTranslationActivity

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (int64_t)actionType
{
  return 14;
}

- (void)performActivityWithTranslationContext:(id)a3
{
  objc_msgSend(a3, "reloadPageInOriginalLanguage");
  -[_SFActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (BOOL)canPerformWithTranslationContext:(id)a3
{
  return objc_msgSend(a3, "hasStartedTranslating");
}

@end
