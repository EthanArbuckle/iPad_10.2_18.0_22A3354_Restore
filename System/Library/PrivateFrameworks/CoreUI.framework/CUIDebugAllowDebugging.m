@implementation CUIDebugAllowDebugging

BOOL ____CUIDebugAllowDebugging_block_invoke()
{
  _BOOL8 result;

  result = -[NSUserDefaults BOOLForKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "BOOLForKey:", CFSTR("CUIAllowDebugPrefs"));
  __CUIDebugAllowDebugging___AllowDebugPrefs = result;
  return result;
}

@end
