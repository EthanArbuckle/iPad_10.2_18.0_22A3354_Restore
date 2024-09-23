@implementation C3DGetSurfacePropertiesToDefines

void __C3DGetSurfacePropertiesToDefines_block_invoke()
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
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  void *keys[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0;
  *(_OWORD *)values = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0;
  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 100);
  for (i = 0; i != 31; ++i)
  {
    v3 = off_1EA5A4710[i];
    keys[i] = (void *)CFStringCreateWithFormat(v0, 0, CFSTR("_surface.%@"), v3);
    CFStringReplaceAll(Mutable, v3);
    CFStringUppercase(Mutable, 0);
    values[i] = (void *)CFStringCreateWithFormat(v0, 0, CFSTR("USE_%@"), Mutable);
  }
  CFRelease(Mutable);
  v4 = CFDictionaryCreate(v0, (const void **)keys, (const void **)values, 31, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v5 = 0;
  C3DGetSurfacePropertiesToDefines_s_dic = (uint64_t)v4;
  do
  {
    CFRelease(keys[v5]);
    CFRelease(values[v5++]);
  }
  while (v5 != 31);
}

@end
