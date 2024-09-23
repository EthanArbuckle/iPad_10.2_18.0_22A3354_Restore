@implementation MakeFontCacheDictionariesMutable

void __MakeFontCacheDictionariesMutable_block_invoke()
{
  const void *v0;
  const void *v1;
  const __CFAllocator *v2;

  v0 = (const void *)__PSToFileName;
  v1 = (const void *)__PSToFamilyNamePublic;
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  __PSToFileName = (uint64_t)CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, (CFDictionaryRef)__PSToFileName);
  __PSToFamilyNamePublic = (uint64_t)CFDictionaryCreateMutableCopy(v2, 0, (CFDictionaryRef)__PSToFamilyNamePublic);
  CFRelease(v0);
  CFRelease(v1);
}

@end
