@implementation IOHIDLoadServicePluginBundles

void ___IOHIDLoadServicePluginBundles_block_invoke()
{
  const __CFArray *v0;
  __int128 v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = xmmword_1E2003E08;
  v2 = CFSTR("/usr/appleinternal/lib/HIDPlugins/ServicePlugins");
  v0 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&v1, 3, MEMORY[0x1E0C9B378]);
  __hidServicePluginBundles = (uint64_t)__IOHIDPlugInLoadBundles(v0);
  CFRelease(v0);
}

@end
