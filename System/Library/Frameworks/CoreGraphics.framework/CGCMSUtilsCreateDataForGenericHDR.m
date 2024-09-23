@implementation CGCMSUtilsCreateDataForGenericHDR

uint64_t (*__CGCMSUtilsCreateDataForGenericHDR_block_invoke_3())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCopyData");
  v1 = colorsync_smart_null_1449;
  if (result)
    v1 = result;
  CGCMSUtilsCreateDataForGenericHDR_f_84 = (uint64_t (*)(_QWORD, _QWORD))v1;
  return result;
}

uint64_t (*__CGCMSUtilsCreateDataForGenericHDR_block_invoke_2())()
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
  CGCMSUtilsCreateDataForGenericHDR_f = (uint64_t (*)(_QWORD))v1;
  return result;
}

void __CGCMSUtilsCreateDataForGenericHDR_block_invoke()
{
  const __CFAllocator *v0;
  CFArrayRef v1;
  uint64_t i;
  const void *v3;
  CFArrayRef v4;
  uint64_t j;
  const void *v6;
  CFArrayRef v7;
  uint64_t k;
  const void *v9;
  CFArrayRef v10;
  uint64_t m;
  const void *v12;
  CFArrayRef v13;
  uint64_t n;
  const void *v15;
  CFDictionaryRef v16;
  uint64_t v17;
  const void *v18;
  CFNumberRef v19;
  CFNumberRef v20;
  CFNumberRef v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  const __CFString *v25;
  void *keys[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v28 = xmmword_1E1630FA8;
  v29 = *(_OWORD *)&off_1E1630FB8;
  v30 = xmmword_1E1630FC8;
  *(_OWORD *)keys = xmmword_1E1630F88;
  v27 = *(_OWORD *)&off_1E1630F98;
  v25 = 0;
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  v19 = CFNumberCreate(0, kCFNumberFloatType, &qword_184F0C740);
  v20 = CFNumberCreate(0, kCFNumberFloatType, (char *)&qword_184F0C740 + 4);
  v21 = CFNumberCreate(0, kCFNumberFloatType, &unk_184F0C748);
  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v1 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&v19, 3, MEMORY[0x1E0C9B378]);
  for (i = 0; i != 24; i += 8)
  {
    v3 = *(CFNumberRef *)((char *)&v19 + i);
    if (v3)
      CFRelease(v3);
  }
  v19 = CFNumberCreate(0, kCFNumberFloatType, &_block_invoke_hdr);
  v20 = CFNumberCreate(0, kCFNumberFloatType, &unk_184F0C6CC);
  v21 = CFNumberCreate(0, kCFNumberFloatType, &unk_184F0C6D0);
  v4 = CFArrayCreate(v0, (const void **)&v19, 3, MEMORY[0x1E0C9B378]);
  for (j = 0; j != 24; j += 8)
  {
    v6 = *(CFNumberRef *)((char *)&v19 + j);
    if (v6)
      CFRelease(v6);
  }
  v19 = CFNumberCreate(0, kCFNumberFloatType, &unk_184F0C6D4);
  v20 = CFNumberCreate(0, kCFNumberFloatType, &unk_184F0C6D8);
  v21 = CFNumberCreate(0, kCFNumberFloatType, &unk_184F0C6DC);
  v7 = CFArrayCreate(v0, (const void **)&v19, 3, MEMORY[0x1E0C9B378]);
  for (k = 0; k != 24; k += 8)
  {
    v9 = *(CFNumberRef *)((char *)&v19 + k);
    if (v9)
      CFRelease(v9);
  }
  v19 = CFNumberCreate(0, kCFNumberFloatType, &unk_184F0C6E0);
  v20 = CFNumberCreate(0, kCFNumberFloatType, &unk_184F0C6E4);
  v21 = CFNumberCreate(0, kCFNumberFloatType, &unk_184F0C6E8);
  v10 = CFArrayCreate(v0, (const void **)&v19, 3, MEMORY[0x1E0C9B378]);
  for (m = 0; m != 24; m += 8)
  {
    v12 = *(CFNumberRef *)((char *)&v19 + m);
    if (v12)
      CFRelease(v12);
  }
  v19 = CFNumberCreate(0, kCFNumberSInt16Type, &_block_invoke_iccDate);
  v20 = CFNumberCreate(0, kCFNumberSInt16Type, &unk_184F0C6BE);
  v21 = CFNumberCreate(0, kCFNumberSInt16Type, &unk_184F0C6C0);
  *(_QWORD *)&v22 = CFNumberCreate(0, kCFNumberSInt16Type, &unk_184F0C6C2);
  *((_QWORD *)&v22 + 1) = CFNumberCreate(0, kCFNumberSInt16Type, &unk_184F0C6C4);
  *(_QWORD *)&v23 = CFNumberCreate(0, kCFNumberSInt16Type, &unk_184F0C6C6);
  v13 = CFArrayCreate(v0, (const void **)&v19, 6, MEMORY[0x1E0C9B378]);
  for (n = 0; n != 48; n += 8)
  {
    v15 = *(CFNumberRef *)((char *)&v19 + n);
    if (v15)
      CFRelease(v15);
  }
  v19 = v1;
  v20 = v4;
  v21 = v7;
  *(_QWORD *)&v22 = v10;
  *((_QWORD *)&v22 + 1) = CFNumberCreate(0, kCFNumberFloatType, &_block_invoke_gamma);
  *(_QWORD *)&v23 = CFNumberCreate(0, kCFNumberFloatType, &unk_184F0C6B4);
  *((_QWORD *)&v23 + 1) = CFNumberCreate(0, kCFNumberFloatType, &unk_184F0C6B8);
  *(_QWORD *)&v24 = v13;
  *((_QWORD *)&v24 + 1) = CFSTR("Generic HDR Profile");
  v25 = CFSTR("calRGB");
  v16 = CFDictionaryCreate(v0, (const void **)keys, (const void **)&v19, 10, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v17 = 0;
  CGCMSUtilsCreateDataForGenericHDR_profileSpec = (uint64_t)v16;
  do
  {
    v18 = *(CFNumberRef *)((char *)&v19 + v17);
    if (v18)
      CFRelease(v18);
    v17 += 8;
  }
  while (v17 != 64);
}

@end
