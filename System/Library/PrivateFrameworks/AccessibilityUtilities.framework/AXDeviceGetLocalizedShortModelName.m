@implementation AXDeviceGetLocalizedShortModelName

void __AXDeviceGetLocalizedShortModelName_block_invoke()
{
  void *v0;
  void *v1;
  CFTypeID v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      v3 = objc_msgSend(v1, "copy");
      v4 = (void *)AXDeviceGetLocalizedShortModelName__AXDeviceGetLocalizedShortModelName;
      AXDeviceGetLocalizedShortModelName__AXDeviceGetLocalizedShortModelName = v3;

    }
    CFRelease(v1);
  }
}

@end
