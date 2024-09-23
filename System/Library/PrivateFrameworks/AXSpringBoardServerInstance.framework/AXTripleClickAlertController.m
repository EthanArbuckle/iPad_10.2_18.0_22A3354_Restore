@implementation AXTripleClickAlertController

+ (BOOL)_allowInteractiveSheetDismissal
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
