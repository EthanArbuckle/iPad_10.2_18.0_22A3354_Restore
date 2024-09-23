@implementation IOHIDLoadServiceFilterBundles

void ___IOHIDLoadServiceFilterBundles_block_invoke()
{
  const __CFArray *v0;
  _OWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = xmmword_1E2003DC8;
  v1[1] = *(_OWORD *)off_1E2003DD8;
  v0 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)v1, 4, MEMORY[0x1E0C9B378]);
  __hidServiceFilterBundles = (uint64_t)__IOHIDPlugInLoadBundles(v0);
  CFRelease(v0);
}

@end
