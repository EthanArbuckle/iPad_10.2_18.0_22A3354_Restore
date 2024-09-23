@implementation CKIsRunningInIMTranscoderAgent

CFStringRef __CKIsRunningInIMTranscoderAgent_block_invoke()
{
  __CFBundle *MainBundle;
  CFStringRef result;
  BOOL v2;

  MainBundle = CFBundleGetMainBundle();
  result = CFBundleGetIdentifier(MainBundle);
  if (result)
  {
    result = (CFStringRef)CFEqual(result, CFSTR("com.apple.messages.IMTranscoderAgent-Mobile"));
    v2 = (_DWORD)result != 0;
  }
  else
  {
    v2 = 0;
  }
  CKIsRunningInIMTranscoderAgent_isIsRunningInIMTranscoderAgent = v2;
  return result;
}

@end
