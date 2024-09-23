@implementation CGCMSUtilsCreateLinearSRGBProfile

uint64_t *__CGCMSUtilsCreateLinearSRGBProfile_block_invoke_3()
{
  uint64_t *result;
  uint64_t v1;

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t *)CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle
    && (result = (uint64_t *)dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "kColorSyncSRGBProfile")) != 0)
  {
    v1 = *result;
  }
  else
  {
    v1 = 0;
  }
  _block_invoke_2_s = v1;
  return result;
}

uint64_t (*__CGCMSUtilsCreateLinearSRGBProfile_block_invoke_7())()
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
  _block_invoke_2_f_174 = v1;
  return result;
}

uint64_t (*__CGCMSUtilsCreateLinearSRGBProfile_block_invoke_6())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCopyTag");
  v1 = colorsync_smart_null_1449;
  if (result)
    v1 = result;
  _block_invoke_2_f_166 = v1;
  return result;
}

uint64_t (*__CGCMSUtilsCreateLinearSRGBProfile_block_invoke_5())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCopyTag");
  v1 = colorsync_smart_null_1449;
  if (result)
    v1 = result;
  _block_invoke_2_f_162 = v1;
  return result;
}

uint64_t (*__CGCMSUtilsCreateLinearSRGBProfile_block_invoke_4())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCopyTag");
  v1 = colorsync_smart_null_1449;
  if (result)
    v1 = result;
  _block_invoke_2_f_157 = v1;
  return result;
}

uint64_t (*__CGCMSUtilsCreateLinearSRGBProfile_block_invoke_2())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCreateWithName");
  v1 = colorsync_smart_null_1449;
  if (result)
    v1 = result;
  _block_invoke_2_f = v1;
  return result;
}

void __CGCMSUtilsCreateLinearSRGBProfile_block_invoke()
{
  uint64_t (*v0)(uint64_t);
  uint64_t v1;
  const void *v2;
  CFArrayRef v3;
  uint64_t i;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  CFArrayRef v9;
  uint64_t j;
  const void *v11;
  CFDataRef v12;
  CFNumberRef v13;
  uint64_t v14;
  CFDictionaryRef v15;
  uint64_t k;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int16 valuePtr;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  UInt8 bytes[8];
  const __CFString *v35;
  const __CFString *v36;
  CFArrayRef v37;
  CFArrayRef v38;
  CFArrayRef v39;
  CFArrayRef v40;
  CFNumberRef v41;
  CFNumberRef v42;
  CFNumberRef v43;
  CFNumberRef v44;
  CFNumberRef v45;
  CFNumberRef v46;
  CFNumberRef v47;
  CFNumberRef v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const void *v54;
  const void *v55;
  const void *v56;
  CFDataRef v57;
  void *v58[6];
  __int128 v59;
  __int128 v60;
  void *values[2];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  void *keys[2];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  if (_block_invoke_2_cglibrarypredicate != -1)
    dispatch_once(&_block_invoke_2_cglibrarypredicate, &__block_literal_global_124);
  v0 = (uint64_t (*)(uint64_t))_block_invoke_2_f;
  if (_block_invoke_2_cglibrarypredicate_126 != -1)
    dispatch_once(&_block_invoke_2_cglibrarypredicate_126, &__block_literal_global_128);
  v1 = v0(_block_invoke_2_s);
  if (v1)
  {
    v2 = (const void *)v1;
    v33 = 0x3FE47AE147AE147BLL;
    v32 = 0x3FD51EB851EB851FLL;
    v31 = 0x3FD3333333333333;
    v30 = 0x3FE3333333333333;
    v29 = 0x3FC3333333333333;
    v28 = 0x3FAEB851EB851EB8;
    v27 = 0x3FD40346DC5D6388;
    v26 = 0x3FD50E5604189375;
    v73 = xmmword_1E1631548;
    v74 = *(_OWORD *)&off_1E1631558;
    v75 = xmmword_1E1631568;
    v76 = *(_OWORD *)off_1E1631578;
    v69 = xmmword_1E1631508;
    v70 = *(_OWORD *)&off_1E1631518;
    v71 = xmmword_1E1631528;
    v72 = *(_OWORD *)&off_1E1631538;
    *(_OWORD *)keys = xmmword_1E16314C8;
    v66 = *(_OWORD *)&off_1E16314D8;
    v67 = xmmword_1E16314E8;
    v68 = *(_OWORD *)&off_1E16314F8;
    valuePtr = 0;
    v23 = 0;
    v24 = 0x3FF0000000000000;
    v21 = 0;
    v22 = 0;
    v19 = 0;
    v20 = 0;
    v18 = 0;
    v63 = 0u;
    v64 = 0u;
    *(_OWORD *)values = 0u;
    v62 = 0u;
    values[0] = CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
    values[1] = CFNumberCreate(0, kCFNumberDoubleType, &v24);
    *(_QWORD *)&v62 = CFNumberCreate(0, kCFNumberDoubleType, &v23);
    *((_QWORD *)&v62 + 1) = CFNumberCreate(0, kCFNumberDoubleType, &v22);
    *(_QWORD *)&v63 = CFNumberCreate(0, kCFNumberDoubleType, &v21);
    *((_QWORD *)&v63 + 1) = CFNumberCreate(0, kCFNumberDoubleType, &v20);
    *(_QWORD *)&v64 = CFNumberCreate(0, kCFNumberDoubleType, &v19);
    *((_QWORD *)&v64 + 1) = CFNumberCreate(0, kCFNumberDoubleType, &v18);
    v3 = CFArrayCreate(0, (const void **)values, 8, MEMORY[0x1E0C9B378]);
    for (i = 0; i != 8; ++i)
    {
      v5 = values[i];
      if (v5)
        CFRelease(v5);
    }
    if (_block_invoke_2_cglibrarypredicate_158 != -1)
      dispatch_once(&_block_invoke_2_cglibrarypredicate_158, &__block_literal_global_160);
    v6 = (const void *)_block_invoke_2_f_157(v2, CFSTR("rXYZ"));
    if (_block_invoke_2_cglibrarypredicate_163 != -1)
      dispatch_once(&_block_invoke_2_cglibrarypredicate_163, &__block_literal_global_165);
    v7 = (const void *)_block_invoke_2_f_162(v2, CFSTR("gXYZ"));
    if (_block_invoke_2_cglibrarypredicate_167 != -1)
      dispatch_once(&_block_invoke_2_cglibrarypredicate_167, &__block_literal_global_169);
    v8 = (const void *)_block_invoke_2_f_166(v2, CFSTR("bXYZ"));
    v59 = 0u;
    v60 = 0u;
    v58[0] = CFNumberCreate(0, kCFNumberSInt16Type, &_block_invoke_2_iccDate);
    v58[1] = CFNumberCreate(0, kCFNumberSInt16Type, &unk_184F0C72A);
    v58[2] = CFNumberCreate(0, kCFNumberSInt16Type, &unk_184F0C72C);
    v58[3] = CFNumberCreate(0, kCFNumberSInt16Type, &unk_184F0C72E);
    v58[4] = CFNumberCreate(0, kCFNumberSInt16Type, &unk_184F0C730);
    v58[5] = CFNumberCreate(0, kCFNumberSInt16Type, &unk_184F0C732);
    v9 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)v58, 6, MEMORY[0x1E0C9B378]);
    for (j = 0; j != 6; ++j)
    {
      v11 = v58[j];
      if (v11)
        CFRelease(v11);
    }
    *(_QWORD *)bytes = 1885563235;
    LODWORD(v35) = 16779265;
    v12 = CFDataCreate(0, bytes, 12);
    *(_QWORD *)bytes = CFSTR("displayRGB");
    v35 = CFSTR("4.0");
    v36 = CFSTR("sRGB IEC61966-2.1 Linear");
    v37 = v3;
    v38 = v3;
    v39 = v3;
    v40 = v9;
    v41 = CFNumberCreate(0, kCFNumberDoubleType, &v33);
    v42 = CFNumberCreate(0, kCFNumberDoubleType, &v32);
    v43 = CFNumberCreate(0, kCFNumberDoubleType, &v31);
    v44 = CFNumberCreate(0, kCFNumberDoubleType, &v30);
    v45 = CFNumberCreate(0, kCFNumberDoubleType, &v29);
    v46 = CFNumberCreate(0, kCFNumberDoubleType, &v28);
    v47 = CFNumberCreate(0, kCFNumberDoubleType, &v27);
    v13 = CFNumberCreate(0, kCFNumberDoubleType, &v26);
    v14 = *MEMORY[0x1E0C9AE50];
    v48 = v13;
    v49 = v14;
    v50 = v14;
    v51 = v14;
    v52 = v14;
    v53 = v14;
    v54 = v6;
    v55 = v7;
    v56 = v8;
    v57 = v12;
    v15 = CFDictionaryCreate(0, (const void **)keys, (const void **)bytes, 24, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (_block_invoke_2_cglibrarypredicate_175 != -1)
      dispatch_once(&_block_invoke_2_cglibrarypredicate_175, &__block_literal_global_177);
    CGCMSUtilsCreateLinearSRGBProfile_linear_profile = _block_invoke_2_f_174(v15);
    if (v3)
      CFRelease(v3);
    if (v9)
      CFRelease(v9);
    for (k = 56; k != 120; k += 8)
    {
      v17 = *(const void **)&bytes[k];
      if (v17)
        CFRelease(v17);
    }
    if (v6)
      CFRelease(v6);
    if (v7)
      CFRelease(v7);
    if (v8)
      CFRelease(v8);
    if (v12)
      CFRelease(v12);
    if (v15)
      CFRelease(v15);
    CFRelease(v2);
  }
}

@end
