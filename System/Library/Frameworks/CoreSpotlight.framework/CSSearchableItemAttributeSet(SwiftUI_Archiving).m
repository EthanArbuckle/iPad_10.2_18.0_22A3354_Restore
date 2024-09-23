@implementation CSSearchableItemAttributeSet(SwiftUI_Archiving)

- (void)setCachedViewData:()SwiftUI_Archiving .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18C42F000, log, OS_LOG_TYPE_ERROR, "Cached view is too large to index", v1, 2u);
}

@end
