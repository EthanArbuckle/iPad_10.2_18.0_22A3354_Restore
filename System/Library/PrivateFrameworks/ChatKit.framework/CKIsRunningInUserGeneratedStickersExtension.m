@implementation CKIsRunningInUserGeneratedStickersExtension

CFStringRef __CKIsRunningInUserGeneratedStickersExtension_block_invoke()
{
  __CFBundle *MainBundle;
  CFStringRef result;
  BOOL v2;

  MainBundle = CFBundleGetMainBundle();
  result = CFBundleGetIdentifier(MainBundle);
  if (result)
  {
    result = (CFStringRef)CFEqual(result, CFSTR("com.apple.Stickers.UserGenerated.MessagesExtension"));
    v2 = (_DWORD)result != 0;
  }
  else
  {
    v2 = 0;
  }
  CKIsRunningInUserGeneratedStickersExtension_isIsRunningInUserGeneratedStickersExtension = v2;
  return result;
}

@end
