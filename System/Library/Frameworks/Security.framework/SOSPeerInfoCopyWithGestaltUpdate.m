@implementation SOSPeerInfoCopyWithGestaltUpdate

uint64_t __SOSPeerInfoCopyWithGestaltUpdate_block_invoke(uint64_t a1, uint64_t a2)
{
  const void *v2;
  BOOL v3;
  uint64_t v4;
  const void *v6;

  v2 = *(const void **)(a1 + 32);
  if (a2)
    v3 = v2 == 0;
  else
    v3 = 1;
  v4 = !v3;
  if (!v3)
  {
    if (*(const void **)(a2 + 32) != v2)
    {
      CFRetain(*(CFTypeRef *)(a1 + 32));
      v6 = *(const void **)(a2 + 32);
      if (v6)
        CFRelease(v6);
      *(_QWORD *)(a2 + 32) = v2;
    }
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a2 + 16), CFSTR("DeviceGestalt"), v2);
  }
  return v4;
}

@end
