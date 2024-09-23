@implementation CKIsRunningInCameraAppsClient

CFStringRef __CKIsRunningInCameraAppsClient_block_invoke()
{
  __CFBundle *MainBundle;
  CFStringRef result;
  const void *v2;
  BOOL v3;

  MainBundle = CFBundleGetMainBundle();
  result = CFBundleGetIdentifier(MainBundle);
  if (result)
  {
    v2 = result;
    result = (CFStringRef)CFEqual(result, (CFTypeRef)*MEMORY[0x1E0D37580]);
    if ((_DWORD)result
      || (result = (CFStringRef)CFEqual(v2, (CFTypeRef)*MEMORY[0x1E0D375A0]), (_DWORD)result)
      || (result = (CFStringRef)CFEqual(v2, CFSTR("com.apple.InCallService")), (_DWORD)result)
      || (result = (CFStringRef)CFEqual(v2, CFSTR("com.apple.iMessageAppsBrowserTest")), (_DWORD)result))
    {
      v3 = 1;
    }
    else
    {
      result = (CFStringRef)CFEqual(v2, CFSTR("com.apple.CameraEffectsDemo"));
      v3 = (_DWORD)result != 0;
    }
  }
  else
  {
    v3 = 0;
  }
  CKIsRunningInCameraAppsClient_sIsRunningInDarkModeClient = v3;
  return result;
}

@end
