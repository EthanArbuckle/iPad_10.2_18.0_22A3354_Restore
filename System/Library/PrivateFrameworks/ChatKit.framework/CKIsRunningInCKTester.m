@implementation CKIsRunningInCKTester

CFStringRef __CKIsRunningInCKTester_block_invoke()
{
  __CFBundle *MainBundle;
  CFStringRef result;
  BOOL v2;

  MainBundle = CFBundleGetMainBundle();
  result = CFBundleGetIdentifier(MainBundle);
  if (result)
  {
    result = (CFStringRef)CFEqual(result, CFSTR("com.apple.messages.ChatKitTester"));
    v2 = (_DWORD)result != 0;
  }
  else
  {
    v2 = 0;
  }
  CKIsRunningInCKTester_sIsRunningInCKTester = v2;
  return result;
}

@end
