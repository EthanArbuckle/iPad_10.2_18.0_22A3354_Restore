@implementation CKIsRunningInMessagesNotificationExtension

CFStringRef __CKIsRunningInMessagesNotificationExtension_block_invoke()
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
    result = (CFStringRef)CFEqual(result, CFSTR("com.apple.MobileSMS.MessagesNotificationExtension"));
    if ((_DWORD)result)
    {
      v3 = 1;
    }
    else
    {
      result = (CFStringRef)CFEqual(v2, CFSTR("com.apple.MobileSMS.MessagesPluginNotificationExtension"));
      v3 = (_DWORD)result != 0;
    }
  }
  else
  {
    v3 = 0;
  }
  CKIsRunningInMessagesNotificationExtension_sIsRunningInMessagesExtension = v3;
  return result;
}

@end
