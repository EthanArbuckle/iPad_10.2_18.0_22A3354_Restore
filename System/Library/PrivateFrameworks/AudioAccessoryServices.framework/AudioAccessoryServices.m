void sub_236B4E04C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AAXPCGetNextClientID()
{
  unsigned int v0;
  uint64_t result;

  if (AAXPCGetNextClientID_sOnce != -1)
    dispatch_once(&AAXPCGetNextClientID_sOnce, &__block_literal_global);
  do
  {
    v0 = __ldaxr((unsigned int *)&AAXPCGetNextClientID_sNext);
    result = v0 + 1;
  }
  while (__stlxr(result, (unsigned int *)&AAXPCGetNextClientID_sNext));
  return result;
}

void sub_236B50D88(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_236B50FB0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_236B52548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v12;
  va_list va;

  va_start(va, a12);
  (*(void (**)(uint64_t))(v12 + 16))(v12);
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

void sub_236B52794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B52A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B52CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B52F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B557E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_236B55E00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_236B55F2C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_236B56038(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_236B581A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
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

void sub_236B58570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B5891C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B58CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B58FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B59378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B59730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B59AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B59E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B5A174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B5A520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B5A8C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B5AC70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B5B018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B5B45C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B5B808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B5BBBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B5BFF0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_236B5C35C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B5C690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B5C9FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B5CD24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
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

void sub_236B5D7B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _btSessionEventHandler(uint64_t a1, int a2, int a3, void *a4)
{
  void *v8;
  unsigned __int8 *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;

  v8 = (void *)MEMORY[0x23B7FD590]();
  v9 = a4;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)v9 + 23));
  switch(a2)
  {
    case 0:
      v10 = **((_DWORD **)v9 + 17);
      if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      *((_QWORD *)v9 + 10) = a1;
      v9[89] = 0;
      if (v9[90])
        objc_msgSend(v9, "_btEnsureStarted");
      else
        objc_msgSend(v9, "_btEnsureStopped");
      goto LABEL_38;
    case 1:
      v12 = **((_DWORD **)v9 + 17);
      if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize()))
      {
        v17 = (a3 + 310000);
        LogPrintF();
      }
      *((_QWORD *)v9 + 10) = 0;
      v9[89] = 0;
      objc_msgSend(v9, "_btEnsureStopped", v17);
      if (!v9[96] || v9[91])
        goto LABEL_37;
      v15 = **((_DWORD **)v9 + 17);
      if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      v9[96] = 0;
      objc_msgSend(v9, "_btEnsureStopped");
      goto LABEL_36;
    case 2:
      v13 = **((_DWORD **)v9 + 17);
      if (v13 <= 60 && (v13 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      *((_QWORD *)v9 + 10) = 0;
      v9[89] = 0;
      v16 = v9[90];
      objc_msgSend(v9, "_btEnsureStopped");
      if (v16)
LABEL_36:
        objc_msgSend(v9, "_btEnsureStarted");
LABEL_37:
      CFRelease(v9);
      goto LABEL_38;
    case 3:
      v14 = **((_DWORD **)v9 + 17);
      if (v14 <= 60 && (v14 != -1 || _LogCategory_Initialize()))
        goto LABEL_16;
      goto LABEL_38;
    default:
      v11 = **((_DWORD **)v9 + 17);
      if (v11 <= 40 && (v11 != -1 || _LogCategory_Initialize()))
LABEL_16:
        LogPrintF();
LABEL_38:

      objc_autoreleasePoolPop(v8);
      return;
  }
}

void _btServiceEventHandler(uint64_t a1, _BYTE *a2, int a3, uint64_t a4, int a5, void *a6)
{
  void *v12;
  unsigned int *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  int v25;
  void *v26;
  unint64_t v27;
  int FeatureCapability;
  int v29;
  int v30;
  BOOL v31;
  int v32;
  int v33;
  int v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  _BYTE v44[248];
  char __s1[32];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v12 = (void *)MEMORY[0x23B7FD590]();
  v13 = a6;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)v13 + 23));
  if (!*((_BYTE *)v13 + 88))
    goto LABEL_65;
  if (a3 == 2)
  {
    v15 = **((_DWORD **)v13 + 17);
    if (v15 > 30 || v15 == -1 && !_LogCategory_Initialize())
      goto LABEL_65;
    goto LABEL_16;
  }
  if (a3 == 1)
  {
    v16 = **((_DWORD **)v13 + 17);
    if (v16 > 30 || v16 == -1 && !_LogCategory_Initialize())
      goto LABEL_65;
    goto LABEL_16;
  }
  if (a3)
  {
    v17 = **((_DWORD **)v13 + 17);
    if (v17 > 30 || v17 == -1 && !_LogCategory_Initialize())
      goto LABEL_65;
LABEL_16:
    BTServiceSpecificEventToString(a4);
    goto LABEL_17;
  }
  v14 = **((_DWORD **)v13 + 17);
  if (v14 <= 30 && (v14 != -1 || _LogCategory_Initialize()))
  {
    v38 = BTServiceSpecificEventToString(a4);
    v39 = (a5 + 310000);
    v36 = &unk_236B71060;
    v37 = a4;
    v35 = (unint64_t)a2;
    LogPrintF();
  }
  if ((_DWORD)a4 != 11)
    goto LABEL_65;
  __s1[0] = 0;
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString[0])(a1, (uint64_t)__s1, 32))
  {
    v33 = **((_DWORD **)v13 + 17);
    if (v33 > 90 || v33 == -1 && !_LogCategory_Initialize())
      goto LABEL_65;
LABEL_17:
    LogPrintF();
    goto LABEL_65;
  }
  if (strcmp(__s1, (const char *)v13 + 8))
  {
    v34 = **((_DWORD **)v13 + 17);
    if (v34 > 30 || v34 == -1 && !_LogCategory_Initialize())
      goto LABEL_65;
    goto LABEL_17;
  }
  if (!a5)
  {
    v44[0] = 0;
    if (a1)
    {
      ((void (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetName[0])(a1, (uint64_t)v44, 248);
      if (v44[0])
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v44);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)*((_QWORD *)v13 + 26);
        *((_QWORD *)v13 + 26) = v20;

      }
      v43 = 0;
      v42 = 0;
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetDeviceId[0])(a1, (uint64_t)&v43 + 4, (uint64_t)&v43, (uint64_t)&v42, (uint64_t)(v13 + 40));
      v41 = 0;
      v22 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTAccessoryManagerGetDefault[0])(*((_QWORD *)v13 + 10), (uint64_t)&v41);
      if (v22)
      {
        v23 = v22;
        v24 = **((_DWORD **)v13 + 17);
        if (v24 <= 60 && (v24 != -1 || _LogCategory_Initialize()))
        {
          v35 = (v23 + 310000);
          LogPrintF();
        }
      }
      if (v41)
      {
        v40 = 0;
        FeatureCapability = softLinkBTAccessoryManagerGetFeatureCapability(v41, a1, 26, (uint64_t)&v40);
        if (FeatureCapability)
        {
          v29 = FeatureCapability;
          v30 = **((_DWORD **)v13 + 17);
          if (v30 <= 60 && (v30 != -1 || _LogCategory_Initialize()))
          {
            v35 = (v29 + 310000);
            LogPrintF();
          }
          v31 = 0;
        }
        else
        {
          v31 = v40 != 0;
        }
        *((_BYTE *)v13 + 157) = v31;
      }
    }
    v32 = **((_DWORD **)v13 + 17);
    if (v32 <= 30 && (v32 != -1 || _LogCategory_Initialize()))
    {
      v35 = (unint64_t)v44;
      v36 = (void *)v13[40];
      LogPrintF();
    }
    *((_BYTE *)v13 + 41) = 0;
    v26 = v13;
    v27 = 0;
    goto LABEL_64;
  }
  if (*((_BYTE *)v13 + 153))
  {
    v18 = (a5 + 310000);
    v19 = **((_DWORD **)v13 + 17);
    if (v19 <= 60 && (v19 != -1 || _LogCategory_Initialize()))
    {
      v35 = v18;
      LogPrintF();
    }
    *((_BYTE *)v13 + 41) = 0;
    v26 = v13;
    v27 = v18;
LABEL_64:
    objc_msgSend(v26, "_completed:", v27, v35, v36, v37, v38, v39);
    goto LABEL_65;
  }
  v25 = **((_DWORD **)v13 + 17);
  if (v25 <= 60 && (v25 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if ((a5 - 151) <= 0xF && ((1 << (a5 + 105)) & 0x8081) != 0)
    objc_msgSend(v13, "_btDeletePairingAndRetry");
LABEL_65:

  objc_autoreleasePoolPop(v12);
}

void _btPairingAgentStatusHandler(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v7;
  id v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;

  v7 = (void *)MEMORY[0x23B7FD590]();
  v8 = a5;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)v8 + 23));
  switch(a2)
  {
    case 0:
      v9 = **((_DWORD **)v8 + 17);
      if (v9 <= 30 && (v9 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      if (*((_BYTE *)v8 + 90))
      {
        *((_BYTE *)v8 + 72) = 1;
        objc_msgSend(v8, "_btEnsureStarted");
      }
      break;
    case 1:
      v11 = **((_DWORD **)v8 + 17);
      if (v11 <= 30 && (v11 != -1 || _LogCategory_Initialize()))
        goto LABEL_16;
      break;
    case 2:
      v12 = **((_DWORD **)v8 + 17);
      if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize()))
        goto LABEL_16;
      break;
    case 3:
      v13 = **((_DWORD **)v8 + 17);
      if (v13 <= 30 && (v13 != -1 || _LogCategory_Initialize()))
        goto LABEL_16;
      break;
    default:
      v10 = **((_DWORD **)v8 + 17);
      if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
LABEL_16:
        LogPrintF();
      break;
  }

  objc_autoreleasePoolPop(v7);
}

void _btPairingAgentUserConfirmationHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v8;
  id v9;
  int v10;
  int v11;
  int v12;
  char __s1[32];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x23B7FD590]();
  v9 = a5;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)v9 + 23));
  __s1[0] = 0;
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString[0])(a2, (uint64_t)__s1, 32))
  {
    v12 = **((_DWORD **)v9 + 17);
    if (v12 > 90 || v12 == -1 && !_LogCategory_Initialize())
      goto LABEL_8;
LABEL_14:
    LogPrintF();
    goto LABEL_8;
  }
  v10 = strcmp(__s1, (const char *)v9 + 8);
  v11 = **((_DWORD **)v9 + 17);
  if (v10)
  {
    if (v11 > 30 || v11 == -1 && !_LogCategory_Initialize())
      goto LABEL_8;
    goto LABEL_14;
  }
  if (v11 <= 30 && (v11 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  ((void (*)(uint64_t, uint64_t, uint64_t))softLinkBTPairingAgentAcceptSSP[0])(a1, a2, 0);
LABEL_8:

  objc_autoreleasePoolPop(v8);
}

Class initWPClient()
{
  Class result;

  if (WirelessProximityLibrary_sOnce != -1)
    dispatch_once(&WirelessProximityLibrary_sOnce, &__block_literal_global_0);
  result = objc_getClass("WPClient");
  classWPClient = (uint64_t)result;
  getWPClientClass[0] = (uint64_t (*)())WPClientFunction;
  return result;
}

id WPClientFunction()
{
  return (id)classWPClient;
}

uint64_t initBTSessionAttachWithQueue(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  id v8;
  uint64_t v9;

  v7 = MobileBluetoothLibrary_sOnce;
  v8 = a4;
  if (v7 != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTSessionAttachWithQueue[0] = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTSessionAttachWithQueue");
  v9 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, id))softLinkBTSessionAttachWithQueue[0])(a1, a2, a3, v8);

  return v9;
}

uint64_t initBTServiceAddCallbacks(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (MobileBluetoothLibrary_sOnce != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTServiceAddCallbacks[0] = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTServiceAddCallbacks");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTServiceAddCallbacks[0])(a1, a2, a3);
}

uint64_t initBTDeviceAddressFromString(uint64_t a1, uint64_t a2)
{
  if (MobileBluetoothLibrary_sOnce != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTDeviceAddressFromString[0] = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceAddressFromString");
  return ((uint64_t (*)(uint64_t, uint64_t))softLinkBTDeviceAddressFromString[0])(a1, a2);
}

uint64_t initBTDeviceFromAddress(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (MobileBluetoothLibrary_sOnce != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTDeviceFromAddress[0] = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceFromAddress");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceFromAddress[0])(a1, a2, a3);
}

uint64_t initBTDeviceGetAddressString(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (MobileBluetoothLibrary_sOnce != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTDeviceGetAddressString[0] = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceGetAddressString");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString[0])(a1, a2, a3);
}

uint64_t initBTDeviceGetPairingStatus(uint64_t a1, uint64_t a2)
{
  if (MobileBluetoothLibrary_sOnce != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTDeviceGetPairingStatus[0] = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceGetPairingStatus");
  return ((uint64_t (*)(uint64_t, uint64_t))softLinkBTDeviceGetPairingStatus[0])(a1, a2);
}

uint64_t initBTPairingAgentCreate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (MobileBluetoothLibrary_sOnce != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTPairingAgentCreate[0] = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTPairingAgentCreate");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTPairingAgentCreate[0])(a1, a2, a3, a4);
}

uint64_t initBTPairingAgentStart(uint64_t a1)
{
  if (MobileBluetoothLibrary_sOnce != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTPairingAgentStart[0] = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTPairingAgentStart");
  return ((uint64_t (*)(uint64_t))softLinkBTPairingAgentStart[0])(a1);
}

uint64_t initBTDeviceConfigureLinkKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (MobileBluetoothLibrary_sOnce != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTDeviceConfigureLinkKey[0] = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceConfigureLinkKey");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTDeviceConfigureLinkKey[0])(a1, a2, a3, a4);
}

uint64_t initBTDeviceConnectServicesWithParameters(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (MobileBluetoothLibrary_sOnce != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTDeviceConnectServicesWithParameters[0] = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceConnectServicesWithParameters");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTDeviceConnectServicesWithParameters[0])(a1, a2, a3, a4);
}

uint64_t initBTDeviceConnectServices(uint64_t a1, uint64_t a2)
{
  if (MobileBluetoothLibrary_sOnce != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTDeviceConnectServices[0] = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceConnectServices");
  return ((uint64_t (*)(uint64_t, uint64_t))softLinkBTDeviceConnectServices[0])(a1, a2);
}

uint64_t initBTDeviceDisconnect(uint64_t a1)
{
  if (MobileBluetoothLibrary_sOnce != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTDeviceDisconnect[0] = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceDisconnect");
  return ((uint64_t (*)(uint64_t))softLinkBTDeviceDisconnect[0])(a1);
}

uint64_t initBTPairingAgentCancelPairing(uint64_t a1)
{
  if (MobileBluetoothLibrary_sOnce != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTPairingAgentCancelPairing[0] = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTPairingAgentCancelPairing");
  return ((uint64_t (*)(uint64_t))softLinkBTPairingAgentCancelPairing[0])(a1);
}

uint64_t initBTPairingAgentStop(uint64_t a1)
{
  if (MobileBluetoothLibrary_sOnce != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTPairingAgentStop[0] = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTPairingAgentStop");
  return ((uint64_t (*)(uint64_t))softLinkBTPairingAgentStop[0])(a1);
}

uint64_t initBTPairingAgentDestroy(uint64_t a1)
{
  if (MobileBluetoothLibrary_sOnce != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTPairingAgentDestroy[0] = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTPairingAgentDestroy");
  return ((uint64_t (*)(uint64_t))softLinkBTPairingAgentDestroy[0])(a1);
}

uint64_t initBTServiceRemoveCallbacks(uint64_t a1, uint64_t a2)
{
  if (MobileBluetoothLibrary_sOnce != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTServiceRemoveCallbacks[0] = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTServiceRemoveCallbacks");
  return ((uint64_t (*)(uint64_t, uint64_t))softLinkBTServiceRemoveCallbacks[0])(a1, a2);
}

uint64_t initBTSessionDetachWithQueue(uint64_t a1)
{
  if (MobileBluetoothLibrary_sOnce != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTSessionDetachWithQueue[0] = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTSessionDetachWithQueue");
  return ((uint64_t (*)(uint64_t))softLinkBTSessionDetachWithQueue[0])(a1);
}

uint64_t initBTPairingAgentDeletePairedDevice(uint64_t a1, uint64_t a2)
{
  if (MobileBluetoothLibrary_sOnce != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTPairingAgentDeletePairedDevice[0] = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTPairingAgentDeletePairedDevice");
  return ((uint64_t (*)(uint64_t, uint64_t))softLinkBTPairingAgentDeletePairedDevice[0])(a1, a2);
}

uint64_t initBTPairingAgentAcceptSSP(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (MobileBluetoothLibrary_sOnce != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTPairingAgentAcceptSSP[0] = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTPairingAgentAcceptSSP");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTPairingAgentAcceptSSP[0])(a1, a2, a3);
}

const char *BTServiceSpecificEventToString(int a1)
{
  const char *result;

  if (a1 <= 500)
  {
    if (a1 <= 100)
    {
      if (a1 <= 1)
      {
        if (!a1)
          return "BT_SERVICE_SDP";
        if (a1 == 1)
          return "BT_SERVICE_CONNECTION_ATTEMPT";
      }
      else
      {
        switch(a1)
        {
          case 2:
            return "BT_SERVICE_DISCONNECTION_ATTEMPT";
          case 11:
            return "BT_SERVICE_CONNECTION_RESULT";
          case 12:
            return "BT_SERVICE_DISCONNECTION_RESULT";
        }
      }
    }
    else
    {
      if (a1 <= 201)
      {
        switch(a1)
        {
          case 'e':
            result = "BT_SERVICE_HANDSFREE_AUDIO_CONNECTED";
            break;
          case 'f':
            result = "BT_SERVICE_HANDSFREE_AUDIO_DISCONNECTED";
            break;
          case 'g':
            result = "BT_SERVICE_HANDSFREE_START_VOICE_COMMAND";
            break;
          case 'h':
            result = "BT_SERVICE_HANDSFREE_END_VOICE_COMMAND";
            break;
          default:
            if (a1 != 201)
              return "?";
            result = "BT_SERVICE_A2DP_AUDIO_CONNECTED";
            break;
        }
        return result;
      }
      if (a1 > 301)
      {
        if (a1 == 302)
          return "BT_SERVICE_PHONE_BOOK_SEND_COMPLETE";
        if (a1 == 303)
          return "BT_SERVICE_PHONE_BOOK_SYNC_SUPPORTED";
      }
      else
      {
        if (a1 == 202)
          return "BT_SERVICE_A2DP_AUDIO_DISCONNECTED";
        if (a1 == 301)
          return "BT_SERVICE_PHONE_BOOK_SEND_INITIATED";
      }
    }
    return "?";
  }
  switch(a1)
  {
    case 501:
      result = "BT_SERVICE_REMOTE_PLAY";
      break;
    case 502:
      result = "BT_SERVICE_REMOTE_PAUSE";
      break;
    case 503:
      result = "BT_SERVICE_REMOTE_STOP";
      break;
    case 504:
      result = "BT_SERVICE_REMOTE_PREVIOUS";
      break;
    case 505:
      result = "BT_SERVICE_REMOTE_NEXT";
      break;
    case 506:
      result = "BT_SERVICE_REMOTE_VOL_UP";
      break;
    case 507:
      result = "BT_SERVICE_REMOTE_VOL_DOWN";
      break;
    case 508:
      result = "BT_SERVICE_REMOTE_MUTE";
      break;
    case 509:
      result = "BT_SERVICE_REMOTE_FASTFORWARD_START";
      break;
    case 510:
      result = "BT_SERVICE_REMOTE_FASTFORWARD_STOP";
      break;
    case 511:
      result = "BT_SERVICE_REMOTE_REWIND_START";
      break;
    case 512:
      result = "BT_SERVICE_REMOTE_REWIND_STOP";
      break;
    default:
      if (a1 == 601)
      {
        result = "BT_SERVICE_SENSOR_RSSI";
      }
      else
      {
        if (a1 != 701)
          return "?";
        result = "BT_SERVICE_LMP_NAME_CHANGED";
      }
      break;
  }
  return result;
}

uint64_t initBTDeviceGetName(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (MobileBluetoothLibrary_sOnce != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTDeviceGetName[0] = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceGetName");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetName[0])(a1, a2, a3);
}

uint64_t initBTDeviceGetDeviceId(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (MobileBluetoothLibrary_sOnce != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTDeviceGetDeviceId[0] = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceGetDeviceId");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetDeviceId[0])(a1, a2, a3, a4, a5);
}

uint64_t initBTAccessoryManagerGetDefault(uint64_t a1, uint64_t a2)
{
  if (MobileBluetoothLibrary_sOnce != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTAccessoryManagerGetDefault[0] = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTAccessoryManagerGetDefault");
  return ((uint64_t (*)(uint64_t, uint64_t))softLinkBTAccessoryManagerGetDefault[0])(a1, a2);
}

uint64_t initBTAccessoryManagerGetFeatureCapability(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (MobileBluetoothLibrary_sOnce != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
  softLinkBTAccessoryManagerGetFeatureCapability = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTAccessoryManagerGetFeatureCapability");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTAccessoryManagerGetFeatureCapability)(a1, a2, a3, a4);
}

id BTErrorF()
{
  NSErrorV();
  return (id)objc_claimAutoreleasedReturnValue();
}

id BTNestedErrorF()
{
  NSErrorNestedV();
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t BTXPCGetNextClientID()
{
  unsigned int v0;
  uint64_t result;

  if (BTXPCGetNextClientID_sOnce != -1)
    dispatch_once(&BTXPCGetNextClientID_sOnce, &__block_literal_global_1);
  do
  {
    v0 = __ldaxr((unsigned int *)&BTXPCGetNextClientID_sNext);
    result = v0 + 1;
  }
  while (__stlxr(result, (unsigned int *)&BTXPCGetNextClientID_sNext));
  return result;
}

void sub_236B68D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B6B8E4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
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

void sub_236B6C264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B6C614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236B6C9C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CBErrorF()
{
  return MEMORY[0x24BDBB178]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t CUDispatchTimerSet()
{
  return MEMORY[0x24BE29128]();
}

uint64_t CUPrintFlags32()
{
  return MEMORY[0x24BE291B0]();
}

uint64_t CUPrintNSDataAddress()
{
  return MEMORY[0x24BE291C8]();
}

uint64_t CUPrintNSDataHex()
{
  return MEMORY[0x24BE291D0]();
}

uint64_t CUPrintNSError()
{
  return MEMORY[0x24BE291D8]();
}

uint64_t CUPrintNSObjectOneLine()
{
  return MEMORY[0x24BE291F0]();
}

uint64_t CUPrintXPC()
{
  return MEMORY[0x24BE29200]();
}

uint64_t CUXPCDecodeNSData()
{
  return MEMORY[0x24BE29238]();
}

uint64_t CUXPCDecodeNSErrorIfNeeded()
{
  return MEMORY[0x24BE29250]();
}

uint64_t CUXPCDecodeObject()
{
  return MEMORY[0x24BE29268]();
}

uint64_t CUXPCDecodeUInt64RangedEx()
{
  return MEMORY[0x24BE29278]();
}

uint64_t CUXPCEncodeNSError()
{
  return MEMORY[0x24BE29298]();
}

uint64_t DebugGetErrorString()
{
  return MEMORY[0x24BE29350]();
}

uint64_t FatalErrorF()
{
  return MEMORY[0x24BE29380]();
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x24BE295B0]();
}

uint64_t LogCategoryReplaceF()
{
  return MEMORY[0x24BE295C8]();
}

uint64_t LogCategory_Remove()
{
  return MEMORY[0x24BE295D0]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x24BE295F0]();
}

uint64_t LogPrintF_safe()
{
  return MEMORY[0x24BE295F8]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x24BE29648]();
}

uint64_t NSAppendPrintF_safe()
{
  return MEMORY[0x24BE29650]();
}

uint64_t NSDecodeObjectIfPresent()
{
  return MEMORY[0x24BE29660]();
}

uint64_t NSDecodeSInt64RangedIfPresent()
{
  return MEMORY[0x24BE29668]();
}

uint64_t NSDecodeStandardContainerIfPresent()
{
  return MEMORY[0x24BE29670]();
}

uint64_t NSErrorF()
{
  return MEMORY[0x24BE29688]();
}

uint64_t NSErrorNestedV()
{
  return MEMORY[0x24BE296A0]();
}

uint64_t NSErrorV()
{
  return MEMORY[0x24BE296B0]();
}

uint64_t NSPrintF_safe()
{
  return MEMORY[0x24BE296C8]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t RandomBytes()
{
  return MEMORY[0x24BE29910]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x24BDBD138]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x24BDBD148]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x24BE29B48]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x24BDB0638](xarray, applier);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x24BDB0710](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x24BDB0728]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

uint64_t xpc_dictionary_expects_reply()
{
  return MEMORY[0x24BDB08E8]();
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB08F8](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x24BDB0998](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

