@implementation CGLogWithArguments

os_log_t __CGLogWithArguments_block_invoke()
{
  __CFBundle *MainBundleIfLooksLikeBundle;
  const __CFString *Identifier;
  const __CFString *v2;
  CFIndex Length;
  os_log_t result;
  CFRange v5;

  MainBundleIfLooksLikeBundle = (__CFBundle *)_CFBundleGetMainBundleIfLooksLikeBundle();
  if (MainBundleIfLooksLikeBundle)
  {
    Identifier = CFBundleGetIdentifier(MainBundleIfLooksLikeBundle);
    if (Identifier)
    {
      v2 = Identifier;
      Length = CFStringGetLength(Identifier);
      if (!CFStringGetCString(v2, (char *)fetch_process_name_name, 1024, 0x8000100u))
      {
        v5.location = 0;
        v5.length = Length;
        CFStringGetBytes(v2, v5, 0x600u, 0x3Fu, 0, fetch_process_name_name, 1024, 0);
      }
    }
  }
  if (!fetch_process_name_name[0])
    __sprintf_chk((char *)fetch_process_name_name, 0, 0x401uLL, "Unknown process name");
  result = os_log_create("com.apple.coregraphics", (const char *)fetch_process_name_name);
  CGLogWithArguments_log = (uint64_t)result;
  return result;
}

@end
