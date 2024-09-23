@implementation IOHIDLoadConnectionPluginBundles

void ___IOHIDLoadConnectionPluginBundles_block_invoke()
{
  const __CFArray *v0;
  __int128 v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1 = xmmword_1E2003E60;
  v0 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&v1, 2, MEMORY[0x1E0C9B378]);
  __hidConnectionPluginBundles = (uint64_t)__IOHIDPlugInLoadBundles(v0);
  CFRelease(v0);
}

@end
