@implementation AXSystemGetVersion

void __AXSystemGetVersion_block_invoke()
{
  void *v0;
  void *v1;
  CFTypeID v2;
  id v3;
  uint64_t v4;

  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      v3 = v1;
      if ((objc_msgSend(v3, "hasPrefix:", CFSTR("5.0")) & 1) != 0)
      {
        v4 = 2;
      }
      else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("5.1")) & 1) != 0)
      {
        v4 = 1;
      }
      else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("6.0")) & 1) != 0)
      {
        v4 = 3;
      }
      else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("6.1")) & 1) != 0)
      {
        v4 = 4;
      }
      else if (objc_msgSend(v3, "hasPrefix:", CFSTR("7.0")))
      {
        v4 = 5;
      }
      else
      {
        v4 = 0;
      }

    }
    else
    {
      v4 = 0;
    }
    CFRelease(v1);
  }
  else
  {
    v4 = 0;
  }
  AXSystemGetVersion__AXSystemVersion = v4;
}

@end
