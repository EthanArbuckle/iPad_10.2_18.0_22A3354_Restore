@implementation CKIsRunningInMessages

CFStringRef __CKIsRunningInMessages_block_invoke()
{
  __CFBundle *MainBundle;
  CFStringRef result;
  BOOL v2;

  MainBundle = CFBundleGetMainBundle();
  result = CFBundleGetIdentifier(MainBundle);
  if (result)
  {
    result = (CFStringRef)CFEqual(result, CFSTR("com.apple.MobileSMS"));
    v2 = (_DWORD)result != 0;
  }
  else
  {
    v2 = 0;
  }
  sIsRunningInMessages = v2;
  return result;
}

@end
