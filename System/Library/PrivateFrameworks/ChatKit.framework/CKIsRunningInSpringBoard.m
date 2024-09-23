@implementation CKIsRunningInSpringBoard

CFStringRef __CKIsRunningInSpringBoard_block_invoke()
{
  __CFBundle *MainBundle;
  CFStringRef result;
  BOOL v2;

  MainBundle = CFBundleGetMainBundle();
  result = CFBundleGetIdentifier(MainBundle);
  if (result)
  {
    result = (CFStringRef)CFEqual(result, CFSTR("com.apple.springboard"));
    v2 = (_DWORD)result != 0;
  }
  else
  {
    v2 = 0;
  }
  CKIsRunningInSpringBoard_sIsRunningInSpringBoard = v2;
  return result;
}

@end
