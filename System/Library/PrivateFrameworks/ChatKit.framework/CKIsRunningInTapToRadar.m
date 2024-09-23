@implementation CKIsRunningInTapToRadar

CFStringRef __CKIsRunningInTapToRadar_block_invoke()
{
  __CFBundle *MainBundle;
  CFStringRef result;
  BOOL v2;

  MainBundle = CFBundleGetMainBundle();
  result = CFBundleGetIdentifier(MainBundle);
  if (result)
  {
    result = (CFStringRef)CFEqual(result, CFSTR("com.apple.TapToRadar"));
    v2 = (_DWORD)result != 0;
  }
  else
  {
    v2 = 0;
  }
  CKIsRunningInTapToRadar_sIsRunningInTapToRadar = v2;
  return result;
}

@end
