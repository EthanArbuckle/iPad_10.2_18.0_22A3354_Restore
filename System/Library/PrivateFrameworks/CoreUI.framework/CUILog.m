@implementation CUILog

BOOL ___CUILog_block_invoke()
{
  _BOOL8 result;

  result = -[NSUserDefaults BOOLForKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "BOOLForKey:", CFSTR("CUIShowDebugLogs"));
  _CUILog___showDebugLogs = result;
  return result;
}

@end
