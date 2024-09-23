@implementation CKIsRunningInNanoSettings

CFStringRef __CKIsRunningInNanoSettings_block_invoke()
{
  __CFBundle *MainBundle;
  CFStringRef result;
  BOOL v2;

  MainBundle = CFBundleGetMainBundle();
  result = CFBundleGetIdentifier(MainBundle);
  if (result)
  {
    result = (CFStringRef)CFEqual(result, CFSTR("com.apple.NanoSettings"));
    v2 = (_DWORD)result != 0;
  }
  else
  {
    v2 = 0;
  }
  CKIsRunningInNanoSettings_sIsRunningInPreferences = v2;
  return result;
}

@end
