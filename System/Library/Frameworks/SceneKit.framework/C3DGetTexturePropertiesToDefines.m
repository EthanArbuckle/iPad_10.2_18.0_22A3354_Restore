@implementation C3DGetTexturePropertiesToDefines

void __C3DGetTexturePropertiesToDefines_block_invoke()
{
  const __CFAllocator *v0;
  __CFString *Mutable;
  uint64_t i;
  const __CFString *v3;
  CFDictionaryRef v4;
  uint64_t v5;
  void *values[2];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  void *keys[2];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  *(_OWORD *)values = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 100);
  for (i = 0; i != 8; ++i)
  {
    v3 = off_1EA5A4848[i];
    keys[i] = (void *)CFStringCreateWithFormat(v0, 0, CFSTR("u_%@Texture"), v3);
    CFStringReplaceAll(Mutable, v3);
    CFStringUppercase(Mutable, 0);
    values[i] = (void *)CFStringCreateWithFormat(v0, 0, CFSTR("USE_%@_MAP"), Mutable);
  }
  CFRelease(Mutable);
  v4 = CFDictionaryCreate(v0, (const void **)keys, (const void **)values, 8, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v5 = 0;
  C3DGetTexturePropertiesToDefines_s_dic = (uint64_t)v4;
  do
  {
    CFRelease(keys[v5]);
    CFRelease(values[v5++]);
  }
  while (v5 != 8);
}

@end
