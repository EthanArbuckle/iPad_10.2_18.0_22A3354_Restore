@implementation CKIsRunningInPassKitIntentsExtension

CFStringRef __CKIsRunningInPassKitIntentsExtension_block_invoke()
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
    result = (CFStringRef)CFEqual(result, CFSTR("com.apple.Passbook.PassbookIntentsExtension"));
    if ((_DWORD)result)
    {
      v3 = 1;
    }
    else
    {
      result = (CFStringRef)CFEqual(v2, CFSTR("com.apple.PassKit.PassKitIntentsExtension"));
      v3 = (_DWORD)result != 0;
    }
  }
  else
  {
    v3 = 0;
  }
  CKIsRunningInPassKitIntentsExtension_sIsRunningInWalletIntentsExtension = v3;
  return result;
}

@end
