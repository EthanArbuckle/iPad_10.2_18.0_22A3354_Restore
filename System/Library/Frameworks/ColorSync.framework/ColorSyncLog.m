@implementation ColorSyncLog

os_log_t __ColorSyncLog_block_invoke()
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
      if (!CFStringGetCString(v2, (char *)&fetch_process_name_name, 1024, 0x8000100u))
      {
        v5.location = 0;
        v5.length = Length;
        CFStringGetBytes(v2, v5, 0x600u, 0x3Fu, 0, (UInt8 *)&fetch_process_name_name, 1024, 0);
      }
    }
  }
  if (!(_BYTE)fetch_process_name_name)
    strcpy((char *)&fetch_process_name_name, "Unknown process nam");
  result = os_log_create("com.apple.colorsync", (const char *)&fetch_process_name_name);
  ColorSyncLog_log = (uint64_t)result;
  return result;
}

@end
