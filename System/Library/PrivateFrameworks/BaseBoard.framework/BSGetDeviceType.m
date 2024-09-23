@implementation BSGetDeviceType

void __BSGetDeviceType_block_invoke()
{
  const __CFData *v0;
  const __CFData *v1;
  CFTypeID v2;
  const __CFAllocator *v3;
  const UInt8 *BytePtr;
  CFIndex Length;
  CFStringRef v6;
  const __CFString *v7;
  uint64_t v8;

  v0 = (const __CFData *)BSCopyDeviceTreeProperty("IODeviceTree:/", CFSTR("model"));
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFDataGetTypeID())
    {
      v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      BytePtr = CFDataGetBytePtr(v1);
      Length = CFDataGetLength(v1);
      v6 = CFStringCreateWithBytes(v3, BytePtr, Length, 0x8000100u, 0);
      if (v6)
      {
        v7 = v6;
        v8 = 0;
        while (!CFStringHasPrefix(v7, __DeviceTypePrefixes[v8]))
        {
          if (++v8 == 4)
            goto LABEL_10;
        }
        BSGetDeviceType___DeviceType = v8;
LABEL_10:
        CFRelease(v7);
      }
    }
    CFRelease(v1);
  }
}

@end
