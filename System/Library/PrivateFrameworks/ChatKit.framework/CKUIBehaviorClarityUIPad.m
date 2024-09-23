@implementation CKUIBehaviorClarityUIPad

- (id)theme
{
  if (theme_once_4551 != -1)
    dispatch_once(&theme_once_4551, &__block_literal_global_4552);
  return (id)theme_sBehavior_4550;
}

void __33__CKUIBehaviorClarityUIPad_theme__block_invoke()
{
  CKUIThemeClarityUI *v0;
  void *v1;

  v0 = objc_alloc_init(CKUIThemeClarityUI);
  v1 = (void *)theme_sBehavior_4550;
  theme_sBehavior_4550 = (uint64_t)v0;

}

- (BOOL)areBannersSupported
{
  if (areBannersSupported_once_4554 != -1)
    dispatch_once(&areBannersSupported_once_4554, &__block_literal_global_4555);
  return 0;
}

- (BOOL)forcesUnknownFiltering
{
  if (forcesUnknownFiltering_once_4557 != -1)
    dispatch_once(&forcesUnknownFiltering_once_4557, &__block_literal_global_4558);
  return forcesUnknownFiltering_sBehavior_4556;
}

void __50__CKUIBehaviorClarityUIPad_forcesUnknownFiltering__block_invoke()
{
  forcesUnknownFiltering_sBehavior_4556 = 1;
}

- (BOOL)shouldUseSimpleTimestampsInTranscript
{
  if (shouldUseSimpleTimestampsInTranscript_once_4560 != -1)
    dispatch_once(&shouldUseSimpleTimestampsInTranscript_once_4560, &__block_literal_global_4561);
  return shouldUseSimpleTimestampsInTranscript_sBehavior_4559;
}

void __65__CKUIBehaviorClarityUIPad_shouldUseSimpleTimestampsInTranscript__block_invoke()
{
  shouldUseSimpleTimestampsInTranscript_sBehavior_4559 = 1;
}

- (BOOL)resetsIdleTimer
{
  if (resetsIdleTimer_once_4563 != -1)
    dispatch_once(&resetsIdleTimer_once_4563, &__block_literal_global_4564);
  return 0;
}

@end
