@implementation IOHIDLoadBundles

CFMutableDictionaryRef ___IOHIDLoadBundles_block_invoke()
{
  const __CFAllocator *v0;
  const __CFArray *v1;
  CFMutableDictionaryRef result;
  int Count;
  _OWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4[0] = xmmword_1E2003D48;
  v4[1] = *(_OWORD *)off_1E2003D58;
  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v1 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)v4, 4, MEMORY[0x1E0C9B378]);
  __hidPlugInBundles = (uint64_t)__IOHIDPlugInLoadBundles(v1);
  CFRelease(v1);
  result = (CFMutableDictionaryRef)__hidPlugInBundles;
  if (__hidPlugInBundles)
  {
    Count = CFArrayGetCount((CFArrayRef)__hidPlugInBundles);
    result = CFDictionaryCreateMutable(v0, Count, MEMORY[0x1E0C9B390], 0);
    __hidPlugInInstanceCache = (uint64_t)result;
  }
  return result;
}

@end
