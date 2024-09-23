@implementation CGCMSUtilsCreateLinearITUR2020Profile

void __CGCMSUtilsCreateLinearITUR2020Profile_block_invoke()
{
  uint64_t (*v0)(uint64_t);
  uint64_t v1;
  const void *v2;
  CFArrayRef v3;
  const void *v4;
  const void *v5;
  const void *v6;
  CFArrayRef v7;
  uint64_t i;
  const void *v9;
  CFDataRef v10;
  CFNumberRef v11;
  uint64_t v12;
  CFDictionaryRef v13;
  uint64_t j;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int16 valuePtr;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  UInt8 bytes[8];
  const __CFString *v33;
  const __CFString *v34;
  CFArrayRef v35;
  CFArrayRef v36;
  CFArrayRef v37;
  CFArrayRef v38;
  CFNumberRef v39;
  CFNumberRef v40;
  CFNumberRef v41;
  CFNumberRef v42;
  CFNumberRef v43;
  CFNumberRef v44;
  CFNumberRef v45;
  CFNumberRef v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const void *v52;
  const void *v53;
  const void *v54;
  CFDataRef v55;
  void *v56[6];
  __int128 v57;
  __int128 v58;
  void *values[8];
  void *keys[2];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  if (_block_invoke_5_cglibrarypredicate != -1)
    dispatch_once(&_block_invoke_5_cglibrarypredicate, &__block_literal_global_217);
  v0 = (uint64_t (*)(uint64_t))_block_invoke_5_f;
  if (_block_invoke_5_cglibrarypredicate_218 != -1)
    dispatch_once(&_block_invoke_5_cglibrarypredicate_218, &__block_literal_global_220);
  v1 = v0(_block_invoke_5_s);
  if (v1)
  {
    v2 = (const void *)v1;
    v31 = 0x3FE6A7EF9DB22D0ELL;
    v30 = 0x3FD2B020C49BA5E3;
    v29 = 0x3FC5C28F5C28F5C3;
    v28 = 0x3FE9810624DD2F1BLL;
    v27 = 0x3FC0C49BA5E353F8;
    v26 = 0x3FA78D4FDF3B645ALL;
    v25 = 0x3FD40346DC5D6388;
    v24 = 0x3FD50E5604189375;
    v68 = xmmword_1E1631548;
    v69 = *(_OWORD *)&off_1E1631558;
    v70 = xmmword_1E1631568;
    v71 = *(_OWORD *)off_1E1631578;
    v64 = xmmword_1E1631508;
    v65 = *(_OWORD *)&off_1E1631518;
    v66 = xmmword_1E1631528;
    v67 = *(_OWORD *)&off_1E1631538;
    *(_OWORD *)keys = xmmword_1E16314C8;
    v61 = *(_OWORD *)&off_1E16314D8;
    v62 = xmmword_1E16314E8;
    v63 = *(_OWORD *)&off_1E16314F8;
    valuePtr = 0;
    v21 = 0;
    v22 = 0x3FF0000000000000;
    v19 = 0;
    v20 = 0;
    v17 = 0;
    v18 = 0;
    v16 = 0;
    values[0] = CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
    values[1] = CFNumberCreate(0, kCFNumberDoubleType, &v22);
    values[2] = CFNumberCreate(0, kCFNumberDoubleType, &v21);
    values[3] = CFNumberCreate(0, kCFNumberDoubleType, &v20);
    values[4] = CFNumberCreate(0, kCFNumberDoubleType, &v19);
    values[5] = CFNumberCreate(0, kCFNumberDoubleType, &v18);
    values[6] = CFNumberCreate(0, kCFNumberDoubleType, &v17);
    values[7] = CFNumberCreate(0, kCFNumberDoubleType, &v16);
    v3 = CFArrayCreate(0, (const void **)values, 8, MEMORY[0x1E0C9B378]);
    if (_block_invoke_5_cglibrarypredicate_224 != -1)
      dispatch_once(&_block_invoke_5_cglibrarypredicate_224, &__block_literal_global_226);
    v4 = (const void *)_block_invoke_5_f_223(v2, CFSTR("rXYZ"));
    if (_block_invoke_5_cglibrarypredicate_228 != -1)
      dispatch_once(&_block_invoke_5_cglibrarypredicate_228, &__block_literal_global_230);
    v5 = (const void *)_block_invoke_5_f_227(v2, CFSTR("gXYZ"));
    if (_block_invoke_5_cglibrarypredicate_232 != -1)
      dispatch_once(&_block_invoke_5_cglibrarypredicate_232, &__block_literal_global_234);
    v6 = (const void *)_block_invoke_5_f_231(v2, CFSTR("bXYZ"));
    v57 = 0u;
    v58 = 0u;
    v56[0] = CFNumberCreate(0, kCFNumberSInt16Type, &_block_invoke_5_iccDate);
    v56[1] = CFNumberCreate(0, kCFNumberSInt16Type, &unk_184F0C75A);
    v56[2] = CFNumberCreate(0, kCFNumberSInt16Type, &unk_184F0C75C);
    v56[3] = CFNumberCreate(0, kCFNumberSInt16Type, &unk_184F0C75E);
    v56[4] = CFNumberCreate(0, kCFNumberSInt16Type, &unk_184F0C760);
    v56[5] = CFNumberCreate(0, kCFNumberSInt16Type, &unk_184F0C762);
    v7 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)v56, 6, MEMORY[0x1E0C9B378]);
    for (i = 0; i != 6; ++i)
    {
      v9 = v56[i];
      if (v9)
        CFRelease(v9);
    }
    *(_QWORD *)bytes = 1885563235;
    LODWORD(v33) = 16779273;
    v10 = CFDataCreate(0, bytes, 12);
    *(_QWORD *)bytes = CFSTR("displayRGB");
    v33 = CFSTR("4.0");
    v34 = CFSTR("Rec. ITU-R BT.2020-1 Linear");
    v35 = v3;
    v36 = v3;
    v37 = v3;
    v38 = v7;
    v39 = CFNumberCreate(0, kCFNumberDoubleType, &v31);
    v40 = CFNumberCreate(0, kCFNumberDoubleType, &v30);
    v41 = CFNumberCreate(0, kCFNumberDoubleType, &v29);
    v42 = CFNumberCreate(0, kCFNumberDoubleType, &v28);
    v43 = CFNumberCreate(0, kCFNumberDoubleType, &v27);
    v44 = CFNumberCreate(0, kCFNumberDoubleType, &v26);
    v45 = CFNumberCreate(0, kCFNumberDoubleType, &v25);
    v11 = CFNumberCreate(0, kCFNumberDoubleType, &v24);
    v12 = *MEMORY[0x1E0C9AE50];
    v46 = v11;
    v47 = v12;
    v48 = v12;
    v49 = v12;
    v50 = v12;
    v51 = v12;
    v52 = v4;
    v53 = v5;
    v54 = v6;
    v55 = v10;
    v13 = CFDictionaryCreate(0, (const void **)keys, (const void **)bytes, 24, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (_block_invoke_5_cglibrarypredicate_238 != -1)
      dispatch_once(&_block_invoke_5_cglibrarypredicate_238, &__block_literal_global_240);
    CGCMSUtilsCreateLinearITUR2020Profile_linear_profile = _block_invoke_5_f_237(v13);
    if (v3)
      CFRelease(v3);
    if (v7)
      CFRelease(v7);
    for (j = 56; j != 120; j += 8)
    {
      v15 = *(const void **)&bytes[j];
      if (v15)
        CFRelease(v15);
    }
    if (v4)
      CFRelease(v4);
    if (v5)
      CFRelease(v5);
    if (v6)
      CFRelease(v6);
    if (v10)
      CFRelease(v10);
    if (v13)
      CFRelease(v13);
    CFRelease(v2);
  }
}

uint64_t (*__CGCMSUtilsCreateLinearITUR2020Profile_block_invoke_7())()
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
  _block_invoke_5_f_237 = (uint64_t (*)(_QWORD))v1;
  return result;
}

uint64_t (*__CGCMSUtilsCreateLinearITUR2020Profile_block_invoke_6())()
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
  _block_invoke_5_f_231 = (uint64_t (*)(_QWORD, _QWORD))v1;
  return result;
}

uint64_t (*__CGCMSUtilsCreateLinearITUR2020Profile_block_invoke_5())()
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
  _block_invoke_5_f_227 = (uint64_t (*)(_QWORD, _QWORD))v1;
  return result;
}

uint64_t (*__CGCMSUtilsCreateLinearITUR2020Profile_block_invoke_4())()
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
  _block_invoke_5_f_223 = (uint64_t (*)(_QWORD, _QWORD))v1;
  return result;
}

uint64_t *__CGCMSUtilsCreateLinearITUR2020Profile_block_invoke_3()
{
  uint64_t *result;
  uint64_t v1;

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t *)CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle
    && (result = (uint64_t *)dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "kColorSyncITUR2020Profile")) != 0)
  {
    v1 = *result;
  }
  else
  {
    v1 = 0;
  }
  _block_invoke_5_s = v1;
  return result;
}

uint64_t (*__CGCMSUtilsCreateLinearITUR2020Profile_block_invoke_2())()
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
  _block_invoke_5_f = v1;
  return result;
}

@end
