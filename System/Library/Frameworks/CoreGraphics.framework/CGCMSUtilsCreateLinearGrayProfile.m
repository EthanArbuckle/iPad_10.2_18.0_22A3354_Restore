@implementation CGCMSUtilsCreateLinearGrayProfile

uint64_t (*__CGCMSUtilsCreateLinearGrayProfile_block_invoke_2())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncMakeProfile");
  v1 = colorsync_smart_null_1449;
  if (result)
    v1 = result;
  _block_invoke_3_f = v1;
  return result;
}

void __CGCMSUtilsCreateLinearGrayProfile_block_invoke()
{
  const __CFAllocator *v0;
  CFArrayRef v1;
  uint64_t i;
  const void *v3;
  CFArrayRef v4;
  uint64_t j;
  const void *v6;
  CFDictionaryRef v7;
  uint64_t v8;
  char v9;
  char v10;
  const void *v11;
  int v12;
  uint64_t v13;
  int v14;
  void *values;
  CFNumberRef v16;
  CFNumberRef v17;
  CFNumberRef v18;
  CFNumberRef v19;
  CFNumberRef v20;
  void *keys[2];
  __int128 v22;
  __int128 v23;
  uint64_t valuePtr;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v13 = 0x1000107E0;
  valuePtr = 0x3F8000003F76D5D0;
  v25 = 1062415525;
  v12 = 1065353216;
  *(_OWORD *)keys = xmmword_1E16312F8;
  v22 = *(_OWORD *)&off_1E1631308;
  v23 = xmmword_1E1631318;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  values = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
  v16 = CFNumberCreate(0, kCFNumberFloatType, (char *)&valuePtr + 4);
  v17 = CFNumberCreate(0, kCFNumberFloatType, &v25);
  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v1 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&values, 3, MEMORY[0x1E0C9B378]);
  for (i = 0; i != 24; i += 8)
  {
    v3 = *(void **)((char *)&values + i);
    if (v3)
      CFRelease(v3);
  }
  values = CFNumberCreate(0, kCFNumberSInt16Type, &v13);
  v16 = CFNumberCreate(0, kCFNumberSInt16Type, (char *)&v13 + 2);
  v17 = CFNumberCreate(0, kCFNumberSInt16Type, (char *)&v13 + 4);
  v18 = CFNumberCreate(0, kCFNumberSInt16Type, (char *)&v13 + 6);
  v19 = CFNumberCreate(0, kCFNumberSInt16Type, &v14);
  v20 = CFNumberCreate(0, kCFNumberSInt16Type, (char *)&v14 + 2);
  v4 = CFArrayCreate(v0, (const void **)&values, 6, MEMORY[0x1E0C9B378]);
  for (j = 0; j != 48; j += 8)
  {
    v6 = *(void **)((char *)&values + j);
    if (v6)
      CFRelease(v6);
  }
  values = v1;
  v16 = CFNumberCreate(0, kCFNumberFloatType, &v12);
  v17 = (CFNumberRef)CFSTR("Linear Gray");
  v18 = (CFNumberRef)CFSTR("calGray");
  v19 = v4;
  v7 = CFDictionaryCreate(v0, (const void **)keys, (const void **)&values, 5, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v8 = 0;
  v9 = 1;
  do
  {
    v10 = v9;
    v11 = *(&values + v8);
    if (v11)
      CFRelease(v11);
    v9 = 0;
    v8 = 1;
  }
  while ((v10 & 1) != 0);
  if (v4)
    CFRelease(v4);
  if (_block_invoke_3_cglibrarypredicate != -1)
    dispatch_once(&_block_invoke_3_cglibrarypredicate, &__block_literal_global_186);
  CGCMSUtilsCreateLinearGrayProfile_linear_profile = _block_invoke_3_f(v7);
  if (v7)
    CFRelease(v7);
}

@end
