void sub_20A61A974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void KmlLogFunc2(os_log_type_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v12 = (objc_class *)MEMORY[0x24BDD17C8];
  v13 = a4;
  v14 = (void *)objc_msgSend([v12 alloc], "initWithFormat:arguments:", v13, &a9);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s : %d : %@"), a2, a3, v14);
  KmlLogger();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, a1))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v15;
    _os_log_impl(&dword_20A619000, v16, a1, "%{public}@", buf, 0xCu);
  }

}

void sub_20A61B6D4(_Unwind_Exception *a1)
{
  void *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 56));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id KmlLogger()
{
  if (KmlLogger_onceToken != -1)
    dispatch_once(&KmlLogger_onceToken, &__block_literal_global);
  return (id)KmlLogger__logger;
}

void KmlSharingLogFunc(os_log_type_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v13 = (objc_class *)MEMORY[0x24BDD17C8];
  v14 = a5;
  v15 = (void *)objc_msgSend([v13 alloc], "initWithFormat:arguments:", v14, &a9);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s : %d : %s : %@"), a2, a3, a4, v15);
  KmlLogger();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, a1))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v16;
    _os_log_impl(&dword_20A619000, v17, a1, "%{public}@", buf, 0xCu);
  }

}

void KmlLogFunc_InternalOnly(os_log_type_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_8);
  if (isInternalBuild_internalBuild)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v12, &a9);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s : %d : %@"), a2, a3, v13);
    KmlLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, a1))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v14;
      _os_log_impl(&dword_20A619000, v15, a1, "%{public}@", buf, 0xCu);
    }

  }
}

id KmlSignpostLogger()
{
  if (KmlSignpostLogger_onceToken != -1)
    dispatch_once(&KmlSignpostLogger_onceToken, &__block_literal_global_6);
  return (id)KmlSignpostLogger__signpostLogger;
}

uint64_t __isInternalBuild_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  isInternalBuild_internalBuild = result;
  return result;
}

void sub_20A61C550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_20A61CAE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A61CD6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A61D134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL isEndOfKeyConfigTag(int a1)
{
  return a1 == 0x7FFF || a1 == 24415;
}

BOOL isDeviceKeyAttestationTag(int a1)
{
  return (a1 & 0xFFFFDFFF) == 24410;
}

void sub_20A6205B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_20A620E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_20A6210D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_20A6213E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A6215B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A621794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A621ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20A621D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A6220C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_20A622414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A622760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_20A622B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_20A622F68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Unwind_Resume(exception_object);
}

void sub_20A6232F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A62363C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A623980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A623CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A623FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A624838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_20A624B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A624E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_20A62520C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_20A62558C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_20A625918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_20A625C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A625FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

const char *DAErrorString(uint64_t a1)
{
  uint64_t v2;
  const char *result;

  v2 = 0;
  result = "Unknown Error";
  while (DAErrorString_DAErrorStrings[v2] != a1)
  {
    v2 += 2;
    if (v2 == 124)
      return result;
  }
  return (const char *)DAErrorString_DAErrorStrings[v2 + 1];
}

uint64_t kmlErrorCodeToDAErrorCode(int a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int v5;

  if (!a1)
    return 0;
  v2 = 0;
  result = 213;
  while (1)
  {
    v4 = v2 + 16;
    if (v2 == 1328)
      break;
    v5 = *(_DWORD *)((char *)&unk_20A6387F0 + v2 + 16);
    v2 += 16;
    if (v5 == a1)
      return *(_QWORD *)((char *)&unk_20A6387F0 + v4 + 8);
  }
  return result;
}

id kmlErrorToDAError(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    v5 = 0;
    goto LABEL_26;
  }
  objc_msgSend(v1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("DigitalAccessError"));

  if (v4)
  {
    v5 = v2;
    goto LABEL_26;
  }
  objc_msgSend(v2, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "com.apple.sesd.kml.sharing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v2, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "com.apple.sesd.kml.pairing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqual:", v9) & 1) != 0)
  {

LABEL_8:
    goto LABEL_9;
  }
  objc_msgSend(v2, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "com.apple.sesd.kml");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  if ((v17 & 1) != 0)
  {
LABEL_9:
    v10 = objc_msgSend(v2, "code");
    if (v10)
    {
      v11 = 0;
      v12 = 213;
      while (1)
      {
        v13 = v11 + 16;
        if (v11 == 1328)
          break;
        v14 = *(_DWORD *)((char *)&unk_20A6387F0 + v11 + 16);
        v11 += 16;
        if (v14 == v10)
        {
          v12 = *(_QWORD *)((char *)&unk_20A6387F0 + v13 + 8);
          goto LABEL_17;
        }
      }
    }
    else
    {
      v12 = 0;
    }
    goto LABEL_17;
  }
  v12 = 213;
LABEL_17:
  v18 = 0;
  v19 = "Unknown Error";
  while (DAErrorString_DAErrorStrings[v18] != v12)
  {
    v18 += 2;
    if (v18 == 124)
      goto LABEL_22;
  }
  v19 = (const char *)DAErrorString_DAErrorStrings[v18 + 1];
LABEL_22:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedFailureReason");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(v2, "localizedFailureReason");
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = &stru_24C3287B0;
  }

  v23 = *MEMORY[0x24BDD0FD8];
  v26[0] = *MEMORY[0x24BDD0FC8];
  v26[1] = v23;
  v27[0] = v20;
  v27[1] = v22;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), v12, v24);
  v5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_26:
  return v5;
}

void sub_20A627D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  void *v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v13);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_20A628050(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20A628198(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

const __CFString *DAKeyTransportTypeAsString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Bluetooth");
  if (a1 == 1)
    v1 = CFSTR("NearField");
  if (a1)
    return v1;
  else
    return CFSTR("Unknown");
}

void sub_20A6293B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20A629AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A629E44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A629ECC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A629F5C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A62A340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_20A62A5C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A62A830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void DAManagerSetMachServiceName(void *a1)
{
  id v1;
  id v2;

  if (a1)
  {
    v1 = a1;
    +[DAManager sharedManager](DAManager, "sharedManager");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    -[DAManager setServiceName:]((uint64_t)v2, v1);

  }
}

const char *KmlErrorString(int a1)
{
  uint64_t v2;
  const char *result;

  v2 = 0;
  result = "Unknown Error";
  while (KmlErrorString_KmlErrorStrings[v2] != a1)
  {
    v2 += 4;
    if (v2 == 328)
      return result;
  }
  return *(const char **)&KmlErrorString_KmlErrorStrings[v2 + 2];
}

uint64_t sesErrorCodeToKmlErrorCode(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int *i;
  uint64_t v4;
  __int128 v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  v2 = 209;
  *((_QWORD *)&v6 + 1) = 6;
  v7[0] = 215;
  v7[1] = -1;
  v7[2] = 0xFFFFFFFFLL;
  if (a1 != 3)
  {
    for (i = (unsigned int *)v7; ; i += 4)
    {
      v2 = *i;
      if ((_DWORD)v2 == -1)
        break;
      v4 = *((_QWORD *)i - 1);
      if (v4 == a1)
        return v2;
    }
    return a2;
  }
  return v2;
}

id sesErrorToKmlError(void *a1, unsigned int a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[5];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = v3;
  if (!v3)
    goto LABEL_6;
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "com.apple.sesd.kml.sharing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v4, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "com.apple.sesd.kml.pairing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", v8) & 1) != 0)
  {

LABEL_5:
LABEL_6:
    v9 = v4;
    goto LABEL_7;
  }
  objc_msgSend(v4, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "com.apple.sesd.kml");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if ((v13 & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v4, "underlyingErrors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v4, "underlyingErrors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "code");

  }
  else
  {
    v17 = objc_msgSend(v4, "code");
  }

  v31[2] = 3;
  v18 = 209;
  v31[3] = 209;
  v31[4] = 6;
  v32[0] = 215;
  v32[1] = -1;
  v32[2] = 0xFFFFFFFFLL;
  if (v17 != 3)
  {
    v19 = (unsigned int *)v32;
    while (1)
    {
      v18 = *v19;
      if (*v19 == -1)
        break;
      v20 = *((_QWORD *)v19 - 1);
      v19 += 4;
      if (v20 == v17)
        goto LABEL_18;
    }
    v18 = a2;
  }
LABEL_18:
  v21 = 0;
  v22 = "Unknown Error";
  while (KmlErrorString_KmlErrorStrings[v21] != v18)
  {
    v21 += 4;
    if (v21 == 328)
      goto LABEL_23;
  }
  v22 = *(const char **)&KmlErrorString_KmlErrorStrings[v21 + 2];
LABEL_23:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedFailureReason");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(v4, "localizedFailureReason");
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = &stru_24C3287B0;
  }

  v26 = *MEMORY[0x24BDD0FD8];
  v30[0] = *MEMORY[0x24BDD0FC8];
  v30[1] = v26;
  v31[0] = v23;
  v31[1] = v25;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "com.apple.sesd.kml");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, v18, v27);
  v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v9;
}

id kmlUtilDataForHexString(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  __darwin_ct_rune_t v7;
  __darwin_ct_rune_t v8;
  unsigned __int16 v9;
  unsigned int v10;
  int v11;
  unsigned __int16 v12;
  unsigned int v13;
  BOOL v14;
  char v15;
  char v17;

  v1 = a1;
  v2 = v1;
  if (v1 && objc_msgSend(v1, "length"))
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C3287B0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_24C3287B0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "length") != 1)
    {
      v6 = 0;
      do
      {
        v17 = 0;
        v7 = objc_msgSend(v5, "characterAtIndex:", v6);
        v8 = objc_msgSend(v5, "characterAtIndex:", v6 + 1);
        v9 = __toupper(v7);
        v10 = v9 - 48;
        if (v10 >= 0xA)
          v10 = -1;
        if (v9 - 65 >= 6)
          v11 = v10;
        else
          v11 = v9 - 55;
        v12 = __toupper(v8);
        v13 = v12 - 48;
        if (v13 >= 0xA)
          v13 = -1;
        if (v12 - 65 < 6)
          v13 = v12 - 55;
        v14 = v13 == -1 || v11 == -1;
        v15 = v13 | (16 * v11);
        if (v14)
          v15 = 0;
        v17 = v15;
        objc_msgSend(v3, "appendBytes:length:", &v17, 1);
        v6 += 2;
      }
      while (objc_msgSend(v5, "length") - 1 > v6);
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id kmlUtilHexStringFromData(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  void *v9;

  v1 = a1;
  v2 = v1;
  if (v1 && objc_msgSend(v1, "length"))
  {
    v3 = 2 * objc_msgSend(v2, "length");
    v4 = (char *)malloc_type_malloc(v3 | 1, 0x8F3A8AADuLL);
    v4[v3] = 0;
    v5 = objc_retainAutorelease(v2);
    v6 = objc_msgSend(v5, "bytes");
    if (objc_msgSend(v5, "length"))
    {
      v7 = 0;
      v8 = v4;
      do
      {
        sprintf(v8, "%02X", *(unsigned __int8 *)(v6 + v7++));
        v8 += 2;
      }
      while (objc_msgSend(v5, "length") > v7);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v4);
    free(v4);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id kmlUtilSHA1(void *a1)
{
  id v1;
  const void *v2;
  CC_LONG v3;
  void *v4;
  unsigned __int8 md[20];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = objc_retainAutorelease(a1);
  v2 = (const void *)objc_msgSend(v1, "bytes");
  v3 = objc_msgSend(v1, "length");

  v4 = CC_SHA1(v2, v3, md);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 20);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

id kmlUtilSHA256(void *a1)
{
  id v1;
  const void *v2;
  CC_LONG v3;
  void *v4;
  unsigned __int8 md[32];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = objc_retainAutorelease(a1);
  v2 = (const void *)objc_msgSend(v1, "bytes");
  v3 = objc_msgSend(v1, "length");

  v4 = CC_SHA256(v2, v3, md);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

void kmlUtilLogLargeData(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  v25 = a1;
  v3 = a2;
  KmlLogFunc_InternalOnly(OS_LOG_TYPE_INFO, (uint64_t)"void kmlUtilLogLargeData(NSString *__strong, NSData *__strong)", 117, CFSTR("--- start %@ ---"), v4, v5, v6, v7, (uint64_t)v25);
  kmlUtilHexStringFromData(v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  if (v9 < 0x321)
  {
    v10 = 0;
  }
  else
  {
    v10 = 0;
    do
    {
      objc_msgSend(v8, "substringWithRange:", v10, 800);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      KmlLogFunc_InternalOnly(OS_LOG_TYPE_INFO, (uint64_t)"void kmlUtilLogLargeData(NSString *__strong, NSData *__strong)", 122, CFSTR("%@"), v12, v13, v14, v15, (uint64_t)v11);

      v10 += 800;
      v9 -= 800;
    }
    while (v9 > 0x320);
  }
  objc_msgSend(v8, "substringWithRange:", v10, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  KmlLogFunc_InternalOnly(OS_LOG_TYPE_INFO, (uint64_t)"void kmlUtilLogLargeData(NSString *__strong, NSData *__strong)", 126, CFSTR("%@"), v17, v18, v19, v20, (uint64_t)v16);

  KmlLogFunc_InternalOnly(OS_LOG_TYPE_INFO, (uint64_t)"void kmlUtilLogLargeData(NSString *__strong, NSData *__strong)", 127, CFSTR("--- end %@ ---"), v21, v22, v23, v24, (uint64_t)v25);
}

id kmlUtilUUIDToData(void *a1)
{
  _QWORD v2[3];

  v2[2] = *MEMORY[0x24BDAC8D0];
  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getUUIDBytes:", v2);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v2, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

id kmlUtilTimeNow()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("UTC"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTimeZone:", v2);

  objc_msgSend(v1, "setDateFormat:", CFSTR("yyyyMMddHHmmss'Z'"));
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setLocale:", v3);

  objc_msgSend(v1, "stringFromDate:", v0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"NSData *kmlUtilTimeNow(void)", 149, CFSTR("date now %@"), v5, v6, v7, v8, (uint64_t)v4);
  v9 = (void *)MEMORY[0x24BDBCE50];
  v10 = objc_retainAutorelease(v4);
  objc_msgSend(v9, "dataWithBytes:length:", objc_msgSend(v10, "UTF8String"), objc_msgSend(v10, "length"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id kmlUtilTimeFiveMinutesFromNow()
{
  void *v0;
  double v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timeIntervalSince1970");
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v1 + 300.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("UTC"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyyMMddHHmmss'Z'"));
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocale:", v5);

  objc_msgSend(v3, "stringFromDate:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"NSData *kmlUtilTimeFiveMinutesFromNow(void)", 167, CFSTR("date five minutes from %@"), v7, v8, v9, v10, (uint64_t)v6);
  v11 = (void *)MEMORY[0x24BDBCE50];
  v12 = objc_retainAutorelease(v6);
  objc_msgSend(v11, "dataWithBytes:length:", objc_msgSend(v12, "UTF8String"), objc_msgSend(v12, "length"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t kmlUtilInfiniteTime(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"NSData *kmlUtilInfiniteTime(void)", 175, CFSTR("infinite date %@"), a5, a6, a7, a8, (uint64_t)CFSTR("99991231235959Z"));
  return objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", objc_msgSend(CFSTR("99991231235959Z"), "UTF8String"), objc_msgSend(CFSTR("99991231235959Z"), "length"));
}

uint64_t isInternalBuild()
{
  if ((isInternalBuild_hasChecked & 1) == 0)
  {
    if (MGGetBoolAnswer())
      isInternalBuild_internalBuild_0 = 1;
    isInternalBuild_hasChecked = 1;
  }
  return isInternalBuild_internalBuild_0;
}

id randomStringWithLength(uint64_t a1)
{
  uint32_t v2;
  void *i;

  v2 = objc_msgSend(CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"), "length");
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", a1);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a1; --a1)
    objc_msgSend(i, "appendFormat:", CFSTR("%C"), objc_msgSend(CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"), "characterAtIndex:", arc4random_uniform(v2)));
  return i;
}

id kmlUtilSanitizeFriendlyName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[6];
  _QWORD v15[4];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v1 = a1;
  objc_msgSend(v1, "dataUsingEncoding:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "length") > 0x1E)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__3;
    v20 = __Block_byref_object_dispose__3;
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    v8 = objc_msgSend(v1, "length");
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __kmlUtilSanitizeFriendlyName_block_invoke;
    v14[3] = &unk_24C328290;
    v14[4] = v15;
    v14[5] = &v16;
    objc_msgSend(v1, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 2, v14);
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"NSString *kmlUtilSanitizeFriendlyName(NSString *__strong)", 234, CFSTR("Original key name: %@ ,  truncated key name: %@"), v9, v10, v11, v12, (uint64_t)v1);
    v7 = (id)v17[5];
    _Block_object_dispose(v15, 8);
    _Block_object_dispose(&v16, 8);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"NSString *kmlUtilSanitizeFriendlyName(NSString *__strong)", 216, CFSTR("UTF8 encoded friendly name is less than %ld chars : %@"), v3, v4, v5, v6, 30);
    v7 = v1;
  }

  return v7;
}

void sub_20A62F008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __kmlUtilSanitizeFriendlyName_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id v9;

  v9 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v9, "lengthOfBytesUsingEncoding:", 4);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) > 0x1EuLL)
    *a7 = 1;
  else
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendString:", v9);

}

id kmlUtilGetDckIdFromSlotId(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = a1;
  v6 = v1;
  if (v1 && objc_msgSend(v1, "length"))
  {
    if (objc_msgSend(v6, "length") == 8)
    {
      v7 = v6;
    }
    else
    {
      if ((unint64_t)objc_msgSend(v6, "length") < 9)
      {
        objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 8);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "replaceBytesInRange:withBytes:", 8 - objc_msgSend(v6, "length"), objc_msgSend(v6, "length"), objc_msgSend(objc_retainAutorelease(v6), "bytes"));
        KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"NSData *kmlUtilGetDckIdFromSlotId(NSData *__strong)", 255, CFSTR("DCK Identifier : %@"), v9, v10, v11, v12, (uint64_t)v8);
        goto LABEL_10;
      }
      objc_msgSend(v6, "subdataWithRange:", 0, 8);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"NSData *kmlUtilGetDckIdFromSlotId(NSData *__strong)", 241, CFSTR("Invalid slotId %@:"), v2, v3, v4, v5, (uint64_t)v6);
    v8 = 0;
  }
LABEL_10:

  return v8;
}

id kmlUtilGetOOBKey(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;

  v3 = a1;
  v4 = a2;
  v9 = v4;
  if (v3 && v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 64);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ccsha256_di();
    objc_msgSend(v3, "length");
    objc_msgSend(objc_retainAutorelease(v3), "bytes");
    objc_msgSend(v9, "length");
    objc_msgSend(objc_retainAutorelease(v9), "bytes");
    objc_msgSend(v10, "length");
    v11 = objc_retainAutorelease(v10);
    v20 = objc_msgSend(v11, "mutableBytes");
    v12 = cchkdf();
    if ((_DWORD)v12)
    {
      KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"NSData *kmlUtilGetOOBKey(NSData *__strong, NSData *__strong)", 273, CFSTR("cchkdf failed with %d"), v13, v14, v15, v16, v12);
      v17 = 0;
    }
    else
    {
      objc_msgSend(v11, "subdataWithRange:", 0, 16, v20);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"NSData *kmlUtilGetOOBKey(NSData *__strong, NSData *__strong)", 262, CFSTR("Missing masterKey or identifier"), v5, v6, v7, v8, v19);
    v17 = 0;
  }

  return v17;
}

id kmlUtilRandomDataWithSize(size_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", a1);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  arc4random_buf((void *)objc_msgSend(v2, "mutableBytes"), a1);
  return v2;
}

id kmlUtilGeneratePasscode(void *a1, void *a2, unint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v30;
  id v31;
  id v32;
  unsigned __int8 v33;

  v5 = a1;
  v6 = a2;
  if (objc_msgSend(v5, "length") && (v7 = objc_msgSend(v6, "length"), a3) && v7)
  {
    v33 = 0;
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v31 = v6;
    v32 = v5;
    while (1)
    {
      KmlLogFunc_InternalOnly(OS_LOG_TYPE_DEBUG, (uint64_t)"NSString *kmlUtilGeneratePasscode(NSData *__strong, NSData *__strong, NSUInteger)", 305, CFSTR("counter : %u ; digits scored : %u"),
        v8,
        v9,
        v10,
        v11,
        v33);
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", &v33, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "appendData:", v5);
      objc_msgSend(v14, "appendData:", v6);
      kmlUtilSHA256(v14);
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v16 = objc_msgSend(v15, "bytes");
      if (objc_msgSend(v15, "length"))
      {
        v21 = 0;
        while (1)
        {
          if (*(unsigned __int8 *)(v16 + v21) <= 0xF9u)
          {
            v30 = a0123456789[*(unsigned __int16 *)(v16 + v21) % 0xAu];
            objc_msgSend(v12, "appendFormat:", CFSTR("%C"));
            if (++v13 == a3)
              break;
          }
          if (++v21 >= (unint64_t)objc_msgSend(v15, "length"))
            goto LABEL_12;
        }
        v13 = a3;
      }
LABEL_12:
      if (v33 == 255)
        break;
      ++v33;

      v6 = v31;
      v5 = v32;
      if (v13 >= a3)
      {
        v22 = v12;
        goto LABEL_17;
      }
    }
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"NSString *kmlUtilGeneratePasscode(NSData *__strong, NSData *__strong, NSUInteger)", 326, CFSTR("Ran out of randomizer counter. Abort!"), v17, v18, v19, v20, v30);

    v22 = 0;
    v6 = v31;
    v5 = v32;
LABEL_17:
    v28 = v22;

  }
  else
  {
    v23 = objc_msgSend(v5, "length");
    objc_msgSend(v6, "length");
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"NSString *kmlUtilGeneratePasscode(NSData *__strong, NSData *__strong, NSUInteger)", 290, CFSTR("length of : longTermSecret:%u; seed:%u; desiredPasscode:%u"),
      v24,
      v25,
      v26,
      v27,
      v23);
    v28 = 0;
  }

  return v28;
}

id kmlUtilGenerateAccountIdHash(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "length") && objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendData:", v3);
    objc_msgSend(v5, "appendData:", v4);
    kmlUtilSHA256(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = objc_msgSend(v3, "length");
    objc_msgSend(v4, "length");
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"NSData *kmlUtilGenerateAccountIdHash(NSData *__strong, NSData *__strong)", 340, CFSTR("anonymizedDsid.length = %lu, readerIdentifier.length = %lu"), v8, v9, v10, v11, v7);
    v6 = 0;
  }

  return v6;
}

uint64_t kmlUtilIsFleetKey(unsigned int a1)
{
  return (a1 >> 3) & 1;
}

uint64_t kmlUtilIsServerIssuedKey(unsigned int a1)
{
  return (a1 >> 2) & 1;
}

uint64_t kmlUtilKeyClassOriginBitmap(unsigned int a1)
{
  return (a1 >> 2) & 3;
}

id kmlUtilGetMockInstanceCAData()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("ECIES_v1"), "dataUsingEncoding:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[KmlTlv TLVWithTag:value:]((uint64_t)KmlTlv, 218, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v3);

  kmlUtilRandomDataWithSize(0x41uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[KmlTlv TLVWithTag:value:]((uint64_t)KmlTlv, 69, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v5);

  kmlUtilRandomDataWithSize(0x20uLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[KmlTlv TLVWithTag:value:]((uint64_t)KmlTlv, 70, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v7);

  kmlUtilRandomDataWithSize(0x80uLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[KmlTlv TLVWithTag:value:]((uint64_t)KmlTlv, 74, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v9);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v1;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        -[KmlTlv asData](*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "appendData:", v15, (_QWORD)v19);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  +[KmlTlv TLVWithTag:value:]((uint64_t)KmlTlv, 32546, v0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[KmlTlv asData]((uint64_t)v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id kmlUtilDecodeJson(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v71);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v71;
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"NSDictionary *kmlUtilDecodeJson(NSData *__strong, NSDictionary *__strong, NSString *__strong, NSError *__autoreleasing *)", 417, CFSTR("json serialization error : %@"), v16, v17, v18, v19, (uint64_t)v15);
    KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"NSDictionary *kmlUtilDecodeJson(NSData *__strong, NSDictionary *__strong, NSString *__strong, NSError *__autoreleasing *)", 418, CFSTR("jsonObject : %@"), v20, v21, v22, v23, (uint64_t)v14);
    if (v15 || !v14)
    {
      v30 = 0;
      v29 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v15);
      goto LABEL_38;
    }
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(v14, "objectForKey:", v9);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        v64 = 0;
        goto LABEL_37;
      }
    }
    else
    {
      v24 = v14;
    }
    v64 = v24;
    if (objc_msgSend(v24, "count"))
    {
      v62 = v14;
      v63 = v7;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      objc_msgSend(v8, "allKeys");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
      v33 = v64;
      if (v32)
      {
        v34 = v32;
        v35 = *(_QWORD *)v68;
        v65 = v31;
        do
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v68 != v35)
              objc_enumerationMutation(v31);
            v37 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
            objc_msgSend(v33, "objectForKey:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v8, "objectForKeyedSubscript:", v37);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              if (v43 == (void *)objc_opt_class())
              {
                objc_msgSend(v66, "setObject:forKeyedSubscript:", v38, v37);
              }
              else if (v43 == (void *)objc_opt_class())
              {
                v48 = v8;
                v49 = objc_alloc_init(MEMORY[0x24BDD16F0]);
                objc_msgSend(v49, "numberFromString:", v38);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                if (v54)
                  objc_msgSend(v66, "setObject:forKeyedSubscript:", v54, v37);
                else
                  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"NSDictionary *kmlUtilDecodeJson(NSData *__strong, NSDictionary *__strong, NSString *__strong, NSError *__autoreleasing *)", 457, CFSTR("Skip %@, since value is nil"), v50, v51, v52, v53, v37);

                v8 = v48;
                v33 = v64;
                v31 = v65;
              }
              else if (v43 == (void *)objc_opt_class())
              {
                kmlUtilDataForHexString(v38);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v55, "length"))
                  objc_msgSend(v66, "setObject:forKeyedSubscript:", v55, v37);
                else
                  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"NSDictionary *kmlUtilDecodeJson(NSData *__strong, NSDictionary *__strong, NSString *__strong, NSError *__autoreleasing *)", 467, CFSTR("Skip %@, since value is nil"), v56, v57, v58, v59, v37);

                v31 = v65;
              }
              else
              {
                KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"NSDictionary *kmlUtilDecodeJson(NSData *__strong, NSDictionary *__strong, NSString *__strong, NSError *__autoreleasing *)", 471, CFSTR("Skip %@, since it is expected to have value of unsupported class"), v44, v45, v46, v47, v37);
              }

            }
            else
            {
              KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"NSDictionary *kmlUtilDecodeJson(NSData *__strong, NSDictionary *__strong, NSString *__strong, NSError *__autoreleasing *)", 441, CFSTR("Skip %@, since it has non string value in json"), v39, v40, v41, v42, v37);
            }

          }
          v34 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
        }
        while (v34);
      }

      v29 = v66;
      v7 = v63;
      v30 = v33;
      v14 = v62;
      v15 = 0;
      goto LABEL_38;
    }
LABEL_37:
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"NSDictionary *kmlUtilDecodeJson(NSData *__strong, NSDictionary *__strong, NSString *__strong, NSError *__autoreleasing *)", 434, CFSTR("Missing target dictionary with keyName : %@"), v25, v26, v27, v28, (uint64_t)v9);
    v29 = 0;
    v30 = v64;
LABEL_38:

    goto LABEL_39;
  }
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"NSDictionary *kmlUtilDecodeJson(NSData *__strong, NSDictionary *__strong, NSString *__strong, NSError *__autoreleasing *)", 407, CFSTR("json data is nil"), v10, v11, v12, v13, v61);
  v29 = 0;
LABEL_39:

  return v29;
}

uint64_t kmlUtilAddUniqueTagToSet(void *a1, unsigned int a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsObject:", v5);

  if (v6)
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"_Bool kmlUtilAddUniqueTagToSet(NSMutableSet *__strong, uint16_t)", 480, CFSTR("Received duplicated tag: 0x%02X"), v7, v8, v9, v10, v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  return v6 ^ 1u;
}

uint64_t cccErrorCodeToKmlErrorCode(int a1)
{
  uint64_t v1;

  v1 = 0;
  while (LOBYTE(KmlCCCErrorConversionMap[v1 + 1]) != a1)
  {
    v1 += 2;
    if (v1 == 8)
      return 105;
  }
  return KmlCCCErrorConversionMap[v1];
}

uint64_t kmlErrorCodeToCCCErrorCode(int a1)
{
  uint64_t v1;

  v1 = 0;
  while (KmlCCCErrorConversionMap[v1] != a1)
  {
    v1 += 2;
    if (v1 == 8)
      return 255;
  }
  return LOBYTE(KmlCCCErrorConversionMap[v1 + 1]);
}

const char *cccErrorString(int a1)
{
  uint64_t v2;
  const char *result;

  v2 = 0;
  result = "Unknown Error";
  while (cccErrorString_CCCErrorStrings[v2] != a1)
  {
    v2 += 16;
    if (v2 == 208)
      return result;
  }
  return *(const char **)&cccErrorString_CCCErrorStrings[v2 + 8];
}

void sub_20A6317F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_20A631B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_20A631ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A632184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A632620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_20A632930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A632D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_20A6330CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_20A633440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A633740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A633B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_20A633F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_20A634458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 184), 8);
  _Unwind_Resume(a1);
}

void sub_20A63483C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A634B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A634F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_20A635214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A635530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_20A635864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A635B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_20A635F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_20A636284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_20A636610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_20A636964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A636CA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC320](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t SESEndPointCreateEncryptionKeyWithSession()
{
  return MEMORY[0x24BE829B0]();
}

uint64_t SESEndPointCreateForHydraWithSession()
{
  return MEMORY[0x24BE829B8]();
}

uint64_t SESEndPointCreateForLyonHydraWithSession()
{
  return MEMORY[0x24BE829C0]();
}

uint64_t SESEndPointCreateForLyonWithSession()
{
  return MEMORY[0x24BE829C8]();
}

uint64_t SESEndPointIsCarKeySupported()
{
  return MEMORY[0x24BE829D0]();
}

uint64_t SESEndPointList()
{
  return MEMORY[0x24BE829D8]();
}

uint64_t SESEndPointListWithSession()
{
  return MEMORY[0x24BE829E0]();
}

uint64_t SESEndPointPreWarm()
{
  return MEMORY[0x24BE829E8]();
}

uint64_t SESEndPointPrivacyDecryption()
{
  return MEMORY[0x24BE829F0]();
}

uint64_t SESEndPointUpdateHydraMailboxes()
{
  return MEMORY[0x24BE829F8]();
}

uint64_t SESEndpointGetBindingAttestationRequestWithSession()
{
  return MEMORY[0x24BE82A00]();
}

uint64_t SESEndpointGetSupportedLyonVersions()
{
  return MEMORY[0x24BE82A08]();
}

uint64_t SESEndpointNotifyPassAdded()
{
  return MEMORY[0x24BE82A10]();
}

uint64_t SESendPointCreateForHomeWithSession()
{
  return MEMORY[0x24BE82A18]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC938](*(_QWORD *)&a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

uint64_t cchkdf()
{
  return MEMORY[0x24BDAD690]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x24BDAD828]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x24BEDD468](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFE60](a1, a2);
}

uint64_t updateLyonCredentialDocumentStatusWithSession()
{
  return MEMORY[0x24BE82A58]();
}

