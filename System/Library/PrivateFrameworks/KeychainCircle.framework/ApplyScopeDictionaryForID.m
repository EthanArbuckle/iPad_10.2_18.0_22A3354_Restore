@implementation ApplyScopeDictionaryForID

void __ApplyScopeDictionaryForID_block_invoke(uint64_t a1, const __CFNumber *cf, const __CFString *a3)
{
  CFNumberRef v4;
  CFTypeID v6;
  int v7;
  CFTypeID v8;
  CFTypeID v9;
  __CFSet *v10;
  __CFSet *v11;
  int valuePtr;

  v4 = cf;
  if (cf)
  {
    v6 = CFGetTypeID(cf);
    if (v6 == CFStringGetTypeID())
    {
      if (CFEqual(v4, CFSTR("Emergency")))
      {
        v7 = 0;
LABEL_22:
        valuePtr = v7;
        v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
        goto LABEL_23;
      }
      if (CFEqual(v4, CFSTR("Alert")))
      {
        v7 = 1;
        goto LABEL_22;
      }
      if (CFEqual(v4, CFSTR("Critical")))
      {
        v7 = 2;
        goto LABEL_22;
      }
      if (CFEqual(v4, CFSTR("Error")))
      {
        v7 = 3;
        goto LABEL_22;
      }
      if (CFEqual(v4, CFSTR("Warning")))
      {
        v7 = 4;
        goto LABEL_22;
      }
      if (CFEqual(v4, CFSTR("Notice")))
      {
        v7 = 5;
        goto LABEL_22;
      }
      if (CFEqual(v4, CFSTR("Info")))
      {
        v7 = 6;
        goto LABEL_22;
      }
      if (CFEqual(v4, CFSTR("Debug")))
      {
        v7 = 7;
        goto LABEL_22;
      }
    }
    else
    {
      v8 = CFGetTypeID(v4);
      if (v8 == CFNumberGetTypeID())
      {
        CFRetain(v4);
        if (a3)
          goto LABEL_24;
        goto LABEL_29;
      }
    }
    v4 = 0;
    if (a3)
      goto LABEL_24;
LABEL_29:
    if (!v4)
      return;
    goto LABEL_30;
  }
LABEL_23:
  if (!a3)
    goto LABEL_29;
LABEL_24:
  v9 = CFGetTypeID(a3);
  if (v9 != CFStringGetTypeID())
    goto LABEL_29;
  v10 = CopyScopesFromScopeList(a3);
  v11 = v10;
  if (v4 && v10)
  {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), v4, v10);
    CFRelease(v4);
    v4 = v11;
LABEL_30:
    CFRelease(v4);
    return;
  }
  if (v4)
    CFRelease(v4);
  v4 = v11;
  if (v11)
    goto LABEL_30;
}

@end
