@implementation CKUIBehaviorClarityUIPhone

- (id)theme
{
  if (theme_once_4534 != -1)
    dispatch_once(&theme_once_4534, &__block_literal_global_4535);
  return (id)theme_sBehavior_4533;
}

void __35__CKUIBehaviorClarityUIPhone_theme__block_invoke()
{
  CKUIThemeClarityUI *v0;
  void *v1;

  v0 = objc_alloc_init(CKUIThemeClarityUI);
  v1 = (void *)theme_sBehavior_4533;
  theme_sBehavior_4533 = (uint64_t)v0;

}

- (BOOL)areBannersSupported
{
  if (areBannersSupported_once_4538 != -1)
    dispatch_once(&areBannersSupported_once_4538, &__block_literal_global_4539);
  return 0;
}

- (BOOL)forcesUnknownFiltering
{
  if (forcesUnknownFiltering_once_4541 != -1)
    dispatch_once(&forcesUnknownFiltering_once_4541, &__block_literal_global_4542);
  return forcesUnknownFiltering_sBehavior_4540;
}

void __52__CKUIBehaviorClarityUIPhone_forcesUnknownFiltering__block_invoke()
{
  forcesUnknownFiltering_sBehavior_4540 = 1;
}

- (BOOL)shouldUseSimpleTimestampsInTranscript
{
  if (shouldUseSimpleTimestampsInTranscript_once_4544 != -1)
    dispatch_once(&shouldUseSimpleTimestampsInTranscript_once_4544, &__block_literal_global_4545);
  return shouldUseSimpleTimestampsInTranscript_sBehavior_4543;
}

void __67__CKUIBehaviorClarityUIPhone_shouldUseSimpleTimestampsInTranscript__block_invoke()
{
  shouldUseSimpleTimestampsInTranscript_sBehavior_4543 = 1;
}

- (BOOL)resetsIdleTimer
{
  if (resetsIdleTimer_once_4547 != -1)
    dispatch_once(&resetsIdleTimer_once_4547, &__block_literal_global_4548);
  return 0;
}

@end
