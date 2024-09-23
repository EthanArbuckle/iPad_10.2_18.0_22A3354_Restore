id DALoggingwithCategory(unint64_t a1)
{
  if (a1 >= 0xC)
    DALoggingwithCategory_cold_1();
  if (DALoggingwithCategory_onceToken != -1)
    dispatch_once(&DALoggingwithCategory_onceToken, &__block_literal_global_8);
  return (id)DALoggingwithCategory_log[a1];
}

void sub_1C1D13AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x2F0], 8);
  _Block_object_dispose(&STACK[0x390], 8);
  _Block_object_dispose(&STACK[0x3F0], 8);
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

void sub_1C1D145B0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1C1D1522C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t buf, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1D156F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1D15CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1D15F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1D160BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1D16620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1D175F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1D1850C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1D195A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1D198FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1D1A748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1D1AE14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1D1B180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1D1BBE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1C1D1BFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1D1C284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1D1C430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1D1C998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1D1CDD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1D1D11C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1C1D1D388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1D1D6D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1C1D1DC34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1D1DE18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1D1DEE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1D1E46C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1D1E4F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void DACPLoggingAppendDataToLogFile(int a1, const void *a2, CFDataRef theData, void *a4)
{
  unint64_t v8;
  NSObject *v9;
  _QWORD *v10;
  CFDataRef Copy;
  _QWORD *WorkSettingsFromSettings;
  NSObject *v13;
  _QWORD block[7];
  _QWORD v15[5];
  _QWORD v16[5];

  if (_init_once == -1)
  {
    if (!theData)
    {
LABEL_17:
      if (!a4)
        return;
      if (_callbackQueue_onceToken != -1)
        dispatch_once(&_callbackQueue_onceToken, &__block_literal_global_56);
      v9 = _callbackQueue_queue;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __DACPLoggingAppendDataToLogFile_block_invoke;
      v16[3] = &unk_1E7B9D188;
      v16[4] = a4;
      v10 = v16;
      goto LABEL_21;
    }
  }
  else
  {
    dispatch_once(&_init_once, &__block_literal_global_49);
    if (!theData)
      goto LABEL_17;
  }
  if (!CFDataGetLength(theData))
    goto LABEL_17;
  v8 = _settingsForFacility(a2);
  if ((int)_maxLogFileLevel(v8) < a1)
  {
    if (!a4)
      return;
    if (_callbackQueue_onceToken != -1)
      dispatch_once(&_callbackQueue_onceToken, &__block_literal_global_56);
    v9 = _callbackQueue_queue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __DACPLoggingAppendDataToLogFile_block_invoke_2;
    v15[3] = &unk_1E7B9D188;
    v15[4] = a4;
    v10 = v15;
LABEL_21:
    dispatch_async(v9, v10);
    return;
  }
  Copy = CFDataCreateCopy(0, theData);
  if (a4)
    a4 = _Block_copy(a4);
  WorkSettingsFromSettings = _createWorkSettingsFromSettings(v8);
  atomic_store(0, (unsigned __int8 *)(v8 + 156));
  if (_workGroup_once != -1)
    dispatch_once(&_workGroup_once, &__block_literal_global_59);
  v13 = _workGroup_group;
  if (_workQueue_once != -1)
    dispatch_once(&_workQueue_once, &__block_literal_global_60);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __DACPLoggingAppendDataToLogFile_block_invoke_3;
  block[3] = &unk_1E7B9D1B0;
  block[5] = WorkSettingsFromSettings;
  block[6] = Copy;
  block[4] = a4;
  dispatch_group_async(v13, (dispatch_queue_t)_workQueue_queue, block);
}

unint64_t _settingsForFacility(const void *a1)
{
  unint64_t v1;
  const __CFArray *v3;
  CFRange v5;

  v1 = atomic_load(&_logFileSettings);
  if (a1)
  {
    v1 = atomic_load((unint64_t *)v1);
    if (v1)
    {
      while (1)
      {
        v3 = *(const __CFArray **)(v1 + 8);
        if (v3)
        {
          v5.length = CFArrayGetCount(*(CFArrayRef *)(v1 + 8));
          v5.location = 0;
          if (CFArrayContainsValue(v3, v5, a1))
            break;
        }
        v1 = atomic_load((unint64_t *)v1);
        if (!v1)
          return atomic_load(&_logFileSettings);
      }
    }
    else
    {
      return atomic_load(&_logFileSettings);
    }
  }
  return v1;
}

uint64_t _maxLogFileLevel(unint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  BOOL v3;

  while (1)
  {
    v1 = atomic_load((unsigned int *)(a1 + 56));
    if ((_DWORD)v1 != -3)
      break;
    v1 = atomic_load((unsigned int *)(a1 + 48));
    if ((_DWORD)v1 != -2)
      break;
    v2 = atomic_load(&_logFileSettings);
    v3 = a1 == v2;
    a1 = v2;
    if (v3)
      _maxLogFileLevel_cold_1();
  }
  return v1;
}

_QWORD *_createWorkSettingsFromSettings(unint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  unint64_t v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unsigned int v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  unint64_t v23;
  unsigned __int8 v24;
  NSObject *v25;
  __int16 v27[8];

  v2 = malloc_type_calloc(0x50uLL, 1uLL, 0x36DEFBAuLL);
  v3 = v2;
  if (v2)
  {
    v4 = atomic_load((unint64_t *)(a1 + 8));
    *v2 = v4;
    v5 = atomic_load((unint64_t *)(a1 + 16));
    v2[1] = v5;
    v6 = atomic_load((unint64_t *)(a1 + 24));
    v2[2] = v6;
    v7 = a1;
    while (1)
    {
      v8 = atomic_load((unint64_t *)(v7 + 32));
      if (v8 != -2)
        break;
      v9 = atomic_load(&_logFileSettings);
      v10 = v7 == v9;
      v7 = v9;
      if (v10)
        _createWorkSettingsFromSettings_cold_1();
    }
    v2[3] = v8;
    v11 = a1;
    while (1)
    {
      v12 = atomic_load((unsigned int *)(v11 + 40));
      if (v12 != -2)
        break;
      v13 = atomic_load(&_logFileSettings);
      v10 = v11 == v13;
      v11 = v13;
      if (v10)
        _createWorkSettingsFromSettings_cold_2();
    }
    *((_DWORD *)v2 + 8) = v12;
    v14 = atomic_load((unint64_t *)(a1 + 64));
    v2[5] = v14;
    v15 = atomic_load((unint64_t *)(a1 + 80));
    v2[6] = v15;
    v16 = atomic_load((unint64_t *)(a1 + 96));
    v17 = *(_QWORD *)(a1 + 136);
    v2[7] = v16;
    v2[8] = v17;
    v18 = a1;
    while (1)
    {
      v19 = atomic_load((unsigned int *)(v18 + 144));
      if (v19)
        break;
      v20 = atomic_load(&_logFileSettings);
      v10 = v18 == v20;
      v18 = v20;
      if (v10)
        _createWorkSettingsFromSettings_cold_3();
    }
    *((_BYTE *)v2 + 72) = v19 == 2;
    v21 = a1;
    while (1)
    {
      v22 = *(_DWORD *)(v21 + 152);
      if (v22)
        break;
      v23 = atomic_load(&_logFileSettings);
      v10 = v21 == v23;
      v21 = v23;
      if (v10)
        _createWorkSettingsFromSettings_cold_4();
    }
    *((_BYTE *)v2 + 73) = v22 == 2;
    v24 = atomic_load((unsigned __int8 *)(a1 + 156));
    *((_BYTE *)v2 + 74) = v24;
  }
  else
  {
    v25 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v27[0] = 0;
      _os_log_impl(&dword_1C1D11000, v25, OS_LOG_TYPE_ERROR, "Could not create a copy of the log file settings.", (uint8_t *)v27, 2u);
    }
  }
  return v3;
}

void DACPLoggingSlurpFileIntoLogFile(int a1, const void *a2, const __CFString *a3, const __CFString *Copy, const __CFString *a5, void *a6)
{
  unint64_t v12;
  _QWORD *WorkSettingsFromSettings;
  NSObject *v14;
  _QWORD v15[9];
  _QWORD block[5];

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_49);
  v12 = _settingsForFacility(a2);
  if ((int)_maxLogFileLevel(v12) >= a1)
  {
    if (Copy)
      Copy = CFStringCreateCopy(0, Copy);
    if (a3)
      a3 = CFStringCreateCopy(0, a3);
    if (a5)
      a5 = CFStringCreateCopy(0, a5);
    if (a6)
      a6 = _Block_copy(a6);
    WorkSettingsFromSettings = _createWorkSettingsFromSettings(v12);
    atomic_store(0, (unsigned __int8 *)(v12 + 156));
    if (_workGroup_once != -1)
      dispatch_once(&_workGroup_once, &__block_literal_global_59);
    v14 = _workGroup_group;
    if (_workQueue_once != -1)
      dispatch_once(&_workQueue_once, &__block_literal_global_60);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __DACPLoggingSlurpFileIntoLogFile_block_invoke_2;
    v15[3] = &unk_1E7B9D1D8;
    v15[6] = Copy;
    v15[7] = a3;
    v15[8] = a5;
    v15[4] = a6;
    v15[5] = WorkSettingsFromSettings;
    dispatch_group_async(v14, (dispatch_queue_t)_workQueue_queue, v15);
  }
  else if (a6)
  {
    if (_callbackQueue_onceToken != -1)
      dispatch_once(&_callbackQueue_onceToken, &__block_literal_global_56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __DACPLoggingSlurpFileIntoLogFile_block_invoke;
    block[3] = &unk_1E7B9D188;
    block[4] = a6;
    dispatch_async((dispatch_queue_t)_callbackQueue_queue, block);
  }
}

void DACPLoggingAddCustomLogConfiguration(const __CFArray *a1, const __CFDictionary *a2)
{
  const __CFNumber *v4;
  const __CFNumber *v5;
  const __CFNumber *v6;
  const __CFNumber *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  char *DefaultSettings;
  unint64_t v13;
  void *DefaultLogFileName;
  NSObject *v15;
  const __CFString *v16;
  CFTypeRef v17;
  uint64_t v18;
  int v19;
  CFTypeRef v20;
  CFTypeRef v21;
  CFTypeRef v22;
  CFTypeRef v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  int v31;
  unint64_t *v32;
  unint64_t *i;
  void *aBlock;
  CFTypeRef v35;
  CFTypeRef v36;
  const __CFBoolean *v37;
  const __CFString *Value;
  unint64_t v39;
  CFTypeRef cf;
  unint64_t v41;
  const __CFBoolean *v42;
  const __CFBoolean *BOOLean;
  uint8_t buf[8];
  _QWORD block[5];
  int v46;
  int v47;
  int v48;
  uint64_t valuePtr;

  if (!a1)
    DACPLoggingAddCustomLogConfiguration_cold_1();
  if (!CFArrayGetCount(a1))
    DACPLoggingAddCustomLogConfiguration_cold_2();
  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_49);
  if (CFDictionaryContainsKey(a2, CFSTR("logName")))
    cf = CFDictionaryGetValue(a2, CFSTR("logName"));
  else
    cf = 0;
  if (CFDictionaryContainsKey(a2, CFSTR("logDirectory")))
    Value = (const __CFString *)CFDictionaryGetValue(a2, CFSTR("logDirectory"));
  else
    Value = 0;
  if (CFDictionaryContainsKey(a2, CFSTR("maxLogFileSize")))
    v4 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("maxLogFileSize"));
  else
    v4 = 0;
  if (CFDictionaryContainsKey(a2, CFSTR("maxLogFileCount")))
    v5 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("maxLogFileCount"));
  else
    v5 = 0;
  if (CFDictionaryContainsKey(a2, CFSTR("wantsCompressedFiles")))
    BOOLean = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("wantsCompressedFiles"));
  else
    BOOLean = 0;
  if (CFDictionaryContainsKey(a2, CFSTR("consoleUsesRealLevels")))
    v42 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("consoleUsesRealLevels"));
  else
    v42 = 0;
  if (CFDictionaryContainsKey(a2, CFSTR("maxConsoleLevel")))
    v6 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("maxConsoleLevel"));
  else
    v6 = 0;
  if (CFDictionaryContainsKey(a2, CFSTR("maxLogFileLevel")))
    v7 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("maxLogFileLevel"));
  else
    v7 = 0;
  if (CFDictionaryContainsKey(a2, CFSTR("consoleLevelDefaultsDomain")))
    v36 = CFDictionaryGetValue(a2, CFSTR("consoleLevelDefaultsDomain"));
  else
    v36 = 0;
  if (CFDictionaryContainsKey(a2, CFSTR("consoleLevelDefaultsKey")))
    v41 = (unint64_t)CFDictionaryGetValue(a2, CFSTR("consoleLevelDefaultsKey"));
  else
    v41 = 0;
  if (CFDictionaryContainsKey(a2, CFSTR("logFileLevelDefaultsDomain")))
    v35 = CFDictionaryGetValue(a2, CFSTR("logFileLevelDefaultsDomain"));
  else
    v35 = 0;
  if (CFDictionaryContainsKey(a2, CFSTR("logFileLevelDefaultsKey")))
    v39 = (unint64_t)CFDictionaryGetValue(a2, CFSTR("logFileLevelDefaultsKey"));
  else
    v39 = 0;
  if (CFDictionaryContainsKey(a2, CFSTR("enableNewlines")))
    v37 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("enableNewlines"));
  else
    v37 = 0;
  if (CFDictionaryContainsKey(a2, CFSTR("createFileLogFormatBlock")))
    v8 = CFDictionaryGetValue(a2, CFSTR("createFileLogFormatBlock"));
  else
    v8 = 0;
  if (CFDictionaryContainsKey(a2, CFSTR("createConsoleLogFormatBlock")))
    v9 = CFDictionaryGetValue(a2, CFSTR("createConsoleLogFormatBlock"));
  else
    v9 = 0;
  if (CFDictionaryContainsKey(a2, CFSTR("didCreateNewFileBlock")))
    aBlock = (void *)CFDictionaryGetValue(a2, CFSTR("didCreateNewFileBlock"));
  else
    aBlock = 0;
  if (CFDictionaryContainsKey(a2, CFSTR("willLogToConsoleBlock")))
    v10 = CFDictionaryGetValue(a2, CFSTR("willLogToConsoleBlock"));
  else
    v10 = 0;
  if (CFDictionaryContainsKey(a2, CFSTR("willLogToFileBlock")))
  {
    v11 = CFDictionaryGetValue(a2, CFSTR("willLogToFileBlock"));
    if (v8)
      goto LABEL_62;
  }
  else
  {
    v11 = 0;
    if (v8)
      goto LABEL_62;
  }
  if (CFDictionaryContainsKey(a2, CFSTR("createLogFormatBlock")))
  {
    v8 = CFDictionaryGetValue(a2, CFSTR("createLogFormatBlock"));
LABEL_62:
    if (v9)
      goto LABEL_68;
    goto LABEL_63;
  }
  v8 = 0;
  if (v9)
    goto LABEL_68;
LABEL_63:
  if (CFDictionaryContainsKey(a2, CFSTR("createLogFormatBlock")))
    v9 = CFDictionaryGetValue(a2, CFSTR("createLogFormatBlock"));
  else
    v9 = 0;
LABEL_68:
  valuePtr = 10485760;
  if (v4 && !CFNumberGetValue(v4, kCFNumberSInt64Type, &valuePtr))
    DACPLoggingAddCustomLogConfiguration_cold_10();
  v48 = -1;
  if (v5 && !CFNumberGetValue(v5, kCFNumberSInt32Type, &v48))
    DACPLoggingAddCustomLogConfiguration_cold_9();
  v47 = 5;
  if (v6 && !CFNumberGetValue(v6, kCFNumberSInt32Type, &v47))
    DACPLoggingAddCustomLogConfiguration_cold_8();
  v46 = -1;
  if (v7 && !CFNumberGetValue(v7, kCFNumberSInt32Type, &v46))
    DACPLoggingAddCustomLogConfiguration_cold_7();
  if (valuePtr <= -3)
    DACPLoggingAddCustomLogConfiguration_cold_3();
  if (v48 <= -3)
    DACPLoggingAddCustomLogConfiguration_cold_4();
  if (v47 <= -3)
    DACPLoggingAddCustomLogConfiguration_cold_5();
  if (v46 <= -3)
    DACPLoggingAddCustomLogConfiguration_cold_6();
  DefaultSettings = _createDefaultSettings();
  if (DefaultSettings)
  {
    v13 = (unint64_t)DefaultSettings;
    *((_QWORD *)DefaultSettings + 18) = 0;
    *((_QWORD *)DefaultSettings + 1) = CFArrayCreateCopy(0, a1);
    if (cf)
      DefaultLogFileName = (void *)CFRetain(cf);
    else
      DefaultLogFileName = (void *)_createDefaultLogFileName();
    *(_QWORD *)(v13 + 16) = DefaultLogFileName;
    if (Value)
      v16 = Value;
    else
      v16 = CFSTR("/var/mobile/Library/Logs/CrashReporter/Reminders");
    v17 = CFRetain(v16);
    v18 = valuePtr;
    *(_QWORD *)(v13 + 24) = v17;
    *(_QWORD *)(v13 + 32) = v18;
    v19 = v47;
    *(_DWORD *)(v13 + 40) = v48;
    *(_DWORD *)(v13 + 44) = v19;
    *(_DWORD *)(v13 + 48) = v46;
    v20 = v36;
    if (v36)
      v20 = CFRetain(v36);
    *(_QWORD *)(v13 + 104) = v20;
    if (v41)
      v21 = CFRetain((CFTypeRef)v41);
    else
      v21 = 0;
    *(_QWORD *)(v13 + 112) = v21;
    v22 = v35;
    if (v35)
      v22 = CFRetain(v35);
    *(_QWORD *)(v13 + 120) = v22;
    if (v39)
      v23 = CFRetain((CFTypeRef)v39);
    else
      v23 = 0;
    *(_QWORD *)(v13 + 128) = v23;
    if (v8)
      v24 = _Block_copy(v8);
    else
      v24 = 0;
    *(_QWORD *)(v13 + 64) = v24;
    if (v9)
      v25 = _Block_copy(v9);
    else
      v25 = 0;
    *(_QWORD *)(v13 + 72) = v25;
    v26 = aBlock;
    if (aBlock)
      v26 = _Block_copy(aBlock);
    *(_QWORD *)(v13 + 80) = v26;
    if (v10)
      v27 = _Block_copy(v10);
    else
      v27 = 0;
    *(_QWORD *)(v13 + 88) = v27;
    if (v11)
      v28 = _Block_copy(v11);
    else
      v28 = 0;
    *(_QWORD *)(v13 + 96) = v28;
    if (BOOLean)
    {
      if (CFBooleanGetValue(BOOLean))
        v29 = 2;
      else
        v29 = 1;
    }
    else
    {
      v29 = 0;
    }
    *(_DWORD *)(v13 + 144) = v29;
    if (v42)
    {
      if (CFBooleanGetValue(v42))
        v30 = 2;
      else
        v30 = 1;
    }
    else
    {
      v30 = 0;
    }
    *(_DWORD *)(v13 + 148) = v30;
    if (v37)
    {
      if (CFBooleanGetValue(v37))
        v31 = 2;
      else
        v31 = 1;
    }
    else
    {
      v31 = 0;
    }
    *(_DWORD *)(v13 + 152) = v31;
    v32 = &_logFileSettings;
    for (i = (unint64_t *)atomic_load(&_logFileSettings); i; i = (unint64_t *)atomic_load(i))
      v32 = i;
    atomic_store(v13, v32);
    if (v41 | v39 && _startObservingDefaultChanges_once != -1)
      dispatch_once(&_startObservingDefaultChanges_once, &__block_literal_global_71);
    if (_recomputeQueue_onceToken != -1)
      dispatch_once(&_recomputeQueue_onceToken, &__block_literal_global_78);
    dispatch_sync((dispatch_queue_t)_recomputeQueue_queue, &__block_literal_global_0);
    if (_configurationQueue_once != -1)
      dispatch_once(&_configurationQueue_once, &__block_literal_global_80);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __DACPLoggingAddCustomLogConfiguration_block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v13;
    dispatch_sync((dispatch_queue_t)_configurationQueue_queue, block);
  }
  else
  {
    v15 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C1D11000, v15, OS_LOG_TYPE_ERROR, "Could not create a new log file setting.", buf, 2u);
    }
  }
}

char *_createDefaultSettings()
{
  char *v0;
  char *v1;

  v0 = (char *)malloc_type_calloc(0xA0uLL, 1uLL, 0x7F442D01uLL);
  v1 = v0;
  if (v0)
  {
    *((_QWORD *)v0 + 4) = 10485760;
    *(_OWORD *)(v0 + 40) = xmmword_1C1D31B50;
    *((_DWORD *)v0 + 14) = -3;
    *((_QWORD *)v0 + 18) = 0x100000002;
    *((_DWORD *)v0 + 38) = 2;
    *((_QWORD *)v0 + 17) = malloc_type_calloc(0x10uLL, 1uLL, 0x91B4318FuLL);
  }
  return v1;
}

CFStringRef _createDefaultLogFileName()
{
  const char *v0;
  const UInt8 *v1;
  size_t v2;
  uint64_t v4;

  v0 = getprogname();
  if (v0)
  {
    v1 = (const UInt8 *)v0;
    v2 = strlen(v0);
    return CFStringCreateWithBytes(0, v1, v2, 0x8000100u, 0);
  }
  else
  {
    v4 = getpid();
    return CFStringCreateWithFormat(0, 0, CFSTR("pid_%d"), v4);
  }
}

void _recomputeQueueRecomputeMaxAcceptedLevel()
{
  unint64_t *v0;
  signed int v1;
  signed int v2;
  signed int v3;
  signed int v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = (unint64_t *)atomic_load(&_logFileSettings);
  if (v0)
  {
    v1 = -1;
    do
    {
      v2 = _maxLogFileLevel((unint64_t)v0);
      if (v2 <= v1)
        v3 = v1;
      else
        v3 = v2;
      v4 = _maxConsoleLevel((unint64_t)v0);
      if (v4 <= v3)
        v1 = v3;
      else
        v1 = v4;
      v0 = (unint64_t *)atomic_load(v0);
    }
    while (v0);
  }
  else
  {
    v1 = -1;
  }
  atomic_store(v1, &_DACPLoggingMaxAcceptedLevel);
  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v1;
    _os_log_impl(&dword_1C1D11000, v5, OS_LOG_TYPE_INFO, "Recomputed max accepted logging level. New max: %d", (uint8_t *)v6, 8u);
  }
}

void _configurationQueueRereadDefaultsForSetting(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int DefaultsValue;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 8);
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_1C1D11000, v2, OS_LOG_TYPE_INFO, "Rereading configuration for %@", (uint8_t *)&v11, 0xCu);
  }
  v4 = (const __CFString *)atomic_load((unint64_t *)(a1 + 104));
  v5 = (const __CFString *)atomic_load((unint64_t *)(a1 + 112));
  v6 = (const __CFString *)atomic_load((unint64_t *)(a1 + 120));
  v7 = (const __CFString *)atomic_load((unint64_t *)(a1 + 128));
  if (!v5)
  {
    if (!v7)
      goto LABEL_10;
    DefaultsValue = _configurationQueueReadDefaultsValue(v6, v7);
    goto LABEL_8;
  }
  v8 = _configurationQueueReadDefaultsValue(v4, v5);
  v9 = v8;
  if (v7)
  {
    DefaultsValue = _configurationQueueReadDefaultsValue(v6, v7);
    atomic_store(v9, (unsigned int *)(a1 + 52));
LABEL_8:
    atomic_store(DefaultsValue, (unsigned int *)(a1 + 56));
    goto LABEL_10;
  }
  atomic_store(v8, (unsigned int *)(a1 + 52));
LABEL_10:
  if (_recomputeQueue_onceToken != -1)
    dispatch_once(&_recomputeQueue_onceToken, &__block_literal_global_78);
  dispatch_async((dispatch_queue_t)_recomputeQueue_queue, &__block_literal_global_82);
}

BOOL DACPLoggingFlush(dispatch_time_t timeout)
{
  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_49);
  if (_workGroup_once != -1)
    dispatch_once(&_workGroup_once, &__block_literal_global_59);
  return dispatch_group_wait((dispatch_group_t)_workGroup_group, timeout) == 0;
}

void DACPLoggingSetCustomMaxConsoleLevel(const void *a1, unsigned int a2)
{
  unsigned int *v4;
  unsigned int v5;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_49);
  v4 = (unsigned int *)(_settingsForFacility(a1) + 44);
  do
    v5 = __ldxr(v4);
  while (__stlxr(a2, v4));
  if (v5 != a2)
  {
    if (_recomputeQueue_onceToken != -1)
      dispatch_once(&_recomputeQueue_onceToken, &__block_literal_global_78);
    dispatch_sync((dispatch_queue_t)_recomputeQueue_queue, &__block_literal_global_83);
  }
}

uint64_t DACPLoggingCustomMaxConsoleLevel(const void *a1)
{
  unint64_t v2;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_49);
  v2 = _settingsForFacility(a1);
  return _maxConsoleLevel(v2);
}

uint64_t _maxConsoleLevel(unint64_t a1)
{
  uint64_t v1;
  unsigned int v2;
  unint64_t v3;
  BOOL v4;

  while (1)
  {
    v1 = atomic_load((unsigned int *)(a1 + 52));
    v2 = atomic_load((unsigned int *)(a1 + 52));
    if (v2 != -3)
      break;
    v1 = atomic_load((unsigned int *)(a1 + 44));
    if ((_DWORD)v1 != -2)
      break;
    v3 = atomic_load(&_logFileSettings);
    v4 = a1 == v3;
    a1 = v3;
    if (v4)
      _maxConsoleLevel_cold_1();
  }
  return v1;
}

void DACPLoggingSetCustomMaxLogFileLevel(const void *a1, unsigned int a2)
{
  unsigned int *v4;
  unsigned int v5;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_49);
  v4 = (unsigned int *)(_settingsForFacility(a1) + 48);
  do
    v5 = __ldxr(v4);
  while (__stlxr(a2, v4));
  if (v5 != a2)
  {
    if (_recomputeQueue_onceToken != -1)
      dispatch_once(&_recomputeQueue_onceToken, &__block_literal_global_78);
    dispatch_sync((dispatch_queue_t)_recomputeQueue_queue, &__block_literal_global_84);
  }
}

uint64_t DACPLoggingCustomMaxLogFileLevel(const void *a1)
{
  unint64_t v2;

  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_49);
  v2 = _settingsForFacility(a1);
  return _maxLogFileLevel(v2);
}

void DACPLoggingSetCustomCreateFileLogFormatBlock(const void *a1, const void *a2)
{
  _setCustomCreateLogFormatBlock(a1, a2, 1, 0);
}

void _setCustomCreateLogFormatBlock(const void *a1, const void *a2, int a3, int a4)
{
  unint64_t v8;
  void *v9;
  unint64_t *v10;
  const void *v11;
  int v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  unint64_t *v16;
  const void *v17;
  int v18;
  NSObject *v19;
  unint64_t v20;
  int v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (_init_once != -1)
    dispatch_once(&_init_once, &__block_literal_global_49);
  v8 = _settingsForFacility(a1);
  if (a3)
  {
    v9 = a2 ? _Block_copy(a2) : 0;
    v10 = (unint64_t *)(v8 + 64);
    do
      v11 = (const void *)__ldxr(v10);
    while (__stlxr((unint64_t)v9, v10));
    v12 = atomic_load((unsigned __int8 *)(v8 + 157));
    if (v11)
    {
      if (!v12)
      {
        CFRelease(v11);
        if (!a4)
          return;
        goto LABEL_14;
      }
      v13 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = atomic_load((unint64_t *)(v8 + 8));
        v21 = 138412290;
        v22 = v14;
        _os_log_impl(&dword_1C1D11000, v13, OS_LOG_TYPE_DEFAULT, "Leaking old createFileLogFormatBlock because it was set after logging has begun for facliities %@", (uint8_t *)&v21, 0xCu);
      }
    }
  }
  if (!a4)
    return;
LABEL_14:
  if (a2)
    v15 = _Block_copy(a2);
  else
    v15 = 0;
  v16 = (unint64_t *)(v8 + 72);
  do
    v17 = (const void *)__ldxr(v16);
  while (__stlxr((unint64_t)v15, v16));
  v18 = atomic_load((unsigned __int8 *)(v8 + 157));
  if (v17)
  {
    if (v18)
    {
      v19 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = atomic_load((unint64_t *)(v8 + 8));
        v21 = 138412290;
        v22 = v20;
        _os_log_impl(&dword_1C1D11000, v19, OS_LOG_TYPE_DEFAULT, "Leaking old createConoleLogFormatBlock because it was set after logging has begun for facliities %@", (uint8_t *)&v21, 0xCu);
      }
    }
    else
    {
      CFRelease(v17);
    }
  }
}

void DACPLoggingSetCustomCreateConsoleLogFormatBlock(const void *a1, const void *a2)
{
  _setCustomCreateLogFormatBlock(a1, a2, 0, 1);
}

uint64_t ___init_block_invoke()
{
  char *DefaultSettings;
  unint64_t v1;
  NSObject *v2;
  uint8_t v4[16];

  _processName = (uint64_t)_createDefaultLogFileName();
  getpid();
  DefaultSettings = _createDefaultSettings();
  if (DefaultSettings)
  {
    v1 = (unint64_t)DefaultSettings;
    *((_QWORD *)DefaultSettings + 2) = CFRetain((CFTypeRef)_processName);
    *(_QWORD *)(v1 + 24) = CFRetain(CFSTR("/var/mobile/Library/Logs/CrashReporter/Reminders"));
    atomic_store(v1, &_logFileSettings);
  }
  else
  {
    v2 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1C1D11000, v2, OS_LOG_TYPE_ERROR, "Cannot allocate global log settings.", v4, 2u);
    }
  }
  atexit((void (*)(void))_flushAtExit);
  if (_configurationQueue_once != -1)
    dispatch_once(&_configurationQueue_once, &__block_literal_global_80);
  dispatch_async((dispatch_queue_t)_configurationQueue_queue, &__block_literal_global_51);
  return _rereadObfuscationPreferences();
}

BOOL _flushAtExit()
{
  dispatch_time_t v0;

  v0 = dispatch_time(0, 5000000000);
  return DACPLoggingFlush(v0);
}

void ___init_block_invoke_50()
{
  uint64_t v0;

  v0 = atomic_load(&_logFileSettings);
  _configurationQueueRereadDefaultsForSetting(v0);
}

uint64_t _rereadObfuscationPreferences()
{
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR(".GlobalPreferences"));
  keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppBooleanValue(CFSTR("DACPLoggingUnobfuscate"), CFSTR(".GlobalPreferences"), &keyExistsAndHasValidFormat);
  return CPIsInternalDevice();
}

dispatch_queue_t ___callbackQueue_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("com.apple.DACPLogging.callbackQueue", v0);
  _callbackQueue_queue = (uint64_t)result;
  return result;
}

dispatch_group_t ___workGroup_block_invoke()
{
  dispatch_group_t result;

  result = dispatch_group_create();
  _workGroup_group = (uint64_t)result;
  return result;
}

void ___workQueue_block_invoke()
{
  NSObject *v0;
  NSObject *global_queue;

  v0 = dispatch_queue_create("com.apple.DACPLogging.workQueue", 0);
  _workQueue_queue = (uint64_t)v0;
  global_queue = dispatch_get_global_queue(-2, 0);
  dispatch_set_target_queue(v0, global_queue);
}

void _workQueueRefreshUUIDForWorkSettings(_QWORD *a1)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint32_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = -[DACPLogShared _getUUIDForFolder:baseName:](+[DACPLogShared shared](DACPLogShared, "shared"), "_getUUIDForFolder:baseName:", a1[2], a1[1]);
  v3 = DALoggingwithCategory(0);
  v4 = v3;
  if (v2)
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    *(_DWORD *)v12 = 138412290;
    *(_QWORD *)&v12[4] = v2;
    v5 = "Got UUID: %@";
    v6 = v4;
    v7 = OS_LOG_TYPE_INFO;
    v8 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)v12 = 0;
    v5 = "Could not get file UUID.";
    v6 = v4;
    v7 = OS_LOG_TYPE_ERROR;
    v8 = 2;
  }
  _os_log_impl(&dword_1C1D11000, v6, v7, v5, v12, v8);
LABEL_7:
  v9 = objc_msgSend(v2, "copy", *(_OWORD *)v12);
  v10 = a1[8];
  v11 = *(const void **)(v10 + 8);
  if (v11)
  {
    CFRelease(v11);
    v10 = a1[8];
  }
  *(_QWORD *)(v10 + 8) = v9;
}

uint64_t ___startObservingDefaultChanges_block_invoke()
{
  if (_configurationQueue_once != -1)
    dispatch_once(&_configurationQueue_once, &__block_literal_global_80);
  notify_register_dispatch("com.apple.managedconfiguration.defaultsdidchange", (int *)&_startObservingDefaultChanges_token, (dispatch_queue_t)_configurationQueue_queue, &__block_literal_global_74);
  if (_configurationQueue_once != -1)
    dispatch_once(&_configurationQueue_once, &__block_literal_global_80);
  return notify_register_dispatch("com.apple.AppSupport.loggingDefaultsChanged", (int *)&_startObservingDefaultChanges_token, (dispatch_queue_t)_configurationQueue_queue, &__block_literal_global_76);
}

uint64_t _configurationQueueRereadAllDefaults()
{
  NSObject *v0;
  unint64_t *i;
  uint8_t v3[16];

  v0 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1C1D11000, v0, OS_LOG_TYPE_INFO, "Re-reading all defaults values.", v3, 2u);
  }
  for (i = (unint64_t *)atomic_load(&_logFileSettings); i; i = (unint64_t *)atomic_load(i))
    _configurationQueueRereadDefaultsForSetting((uint64_t)i);
  if (_recomputeQueue_onceToken != -1)
    dispatch_once(&_recomputeQueue_onceToken, &__block_literal_global_78);
  dispatch_async((dispatch_queue_t)_recomputeQueue_queue, &__block_literal_global_77);
  return _rereadObfuscationPreferences();
}

dispatch_queue_t ___recomputeQueue_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("com.apple.DACPLogging.recomputeQueue", v0);
  _recomputeQueue_queue = (uint64_t)result;
  return result;
}

dispatch_queue_t ___configurationQueue_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("com.apple.DACPLogging.configurationQueue", v0);
  _configurationQueue_queue = (uint64_t)result;
  return result;
}

uint64_t _configurationQueueReadDefaultsValue(const __CFString *a1, const __CFString *a2)
{
  uint64_t v4;
  const __CFString *v5;
  const __CFNumber *v6;
  const __CFNumber *v7;
  CFTypeID v8;
  NSObject *v9;
  const char *v10;
  CFTypeID v11;
  SInt32 IntValue;
  NSObject *v13;
  int valuePtr;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = 4294967293;
  valuePtr = -3;
  if (a1)
    v5 = a1;
  else
    v5 = CFSTR(".GlobalPreferences");
  CFPreferencesAppSynchronize(v5);
  v6 = (const __CFNumber *)CFPreferencesCopyAppValue(a2, v5);
  if (!v6)
    return v4;
  v7 = v6;
  v8 = CFGetTypeID(v6);
  if (v8 == CFNumberGetTypeID())
  {
    if (!CFNumberGetValue(v7, kCFNumberSInt32Type, &valuePtr))
    {
      v9 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
LABEL_8:
        *(_DWORD *)buf = 138412546;
        v17 = a1;
        v18 = 2112;
        v19 = a2;
        v10 = "Defaults domain %@ and key %@ cannot be converted into an integer.";
LABEL_15:
        _os_log_impl(&dword_1C1D11000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x16u);
      }
    }
  }
  else
  {
    v11 = CFGetTypeID(v7);
    if (v11 != CFStringGetTypeID())
    {
      v9 = DALoggingwithCategory(0);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      *(_DWORD *)buf = 138412546;
      v17 = a1;
      v18 = 2112;
      v19 = a2;
      v10 = "Defaults domain %@ and key %@ is not a number.";
      goto LABEL_15;
    }
    IntValue = CFStringGetIntValue((CFStringRef)v7);
    if ((IntValue - 0x7FFFFFFF) <= 1)
    {
      v9 = DALoggingwithCategory(0);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      goto LABEL_8;
    }
    valuePtr = IntValue;
  }
LABEL_17:
  CFRelease(v7);
  v4 = valuePtr;
  if (valuePtr <= -4)
  {
    v13 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v17 = a1;
      v18 = 2112;
      v19 = a2;
      v20 = 1024;
      v21 = valuePtr;
      _os_log_impl(&dword_1C1D11000, v13, OS_LOG_TYPE_ERROR, "Rejecting domain %@ key %@ value of %d.", buf, 0x1Cu);
    }
    return 4294967293;
  }
  return v4;
}

id OUTLINED_FUNCTION_0()
{
  return DALoggingwithCategory(0);
}

void sub_1C1D21690(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1D21720(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t DACustomLogDirectory()
{
  if (DACustomLogDirectory_onceToken != -1)
    dispatch_once(&DACustomLogDirectory_onceToken, &__block_literal_global_1);
  return DACustomLogDirectory_retval;
}

void setDALogLevel(unsigned int a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (_initLogging_logPred != -1)
    dispatch_once(&_initLogging_logPred, &__block_literal_global_27);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  _allDALogFacilities();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        DACPLoggingSetCustomMaxLogFileLevel(*(const void **)(*((_QWORD *)&v7 + 1) + 8 * i), a1);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

id _allDALogFacilities()
{
  if (_allDALogFacilities_pred != -1)
    dispatch_once(&_allDALogFacilities_pred, &__block_literal_global_78_0);
  return (id)_allDALogFacilities__sAllDAFacilities;
}

void setDALogOutputLevel(unsigned int a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (_initLogging_logPred != -1)
    dispatch_once(&_initLogging_logPred, &__block_literal_global_27);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  _allDALogFacilities();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        DACPLoggingSetCustomMaxConsoleLevel(*(const void **)(*((_QWORD *)&v7 + 1) + 8 * i), a1);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t getDALogLevel()
{
  if (_initLogging_logPred != -1)
    dispatch_once(&_initLogging_logPred, &__block_literal_global_27);
  return DACPLoggingCustomMaxLogFileLevel(CFSTR("DA"));
}

uint64_t getDAOutputLevel()
{
  if (_initLogging_logPred != -1)
    dispatch_once(&_initLogging_logPred, &__block_literal_global_27);
  return DACPLoggingCustomMaxConsoleLevel(CFSTR("DA"));
}

BOOL shouldDALogAtLevel()
{
  return (int)getDALogLevel() > 5;
}

uint64_t DAShouldLogPassword()
{
  void *v0;

  if ((DAShouldLogPassword__haveCheckedShouldLogPassword & 1) == 0)
  {
    DAShouldLogPassword__haveCheckedShouldLogPassword = 1;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    DAShouldLogPassword__shouldLogPassword = objc_msgSend(v0, "BOOLForKey:", CFSTR("DAShouldLogPassword"));

  }
  return DAShouldLogPassword__shouldLogPassword;
}

uint64_t DAGreenTeaLogger()
{
  if (DAGreenTeaLogger_onceToken != -1)
    dispatch_once(&DAGreenTeaLogger_onceToken, &__block_literal_global_22);
  return DAGreenTeaLogger_greenTeaLogger;
}

void DALogSimulateCrashReport(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void (*v4)(uint64_t, uint64_t, id);
  uint64_t v5;
  id v6;

  v1 = a1;
  v6 = v1;
  if (!DALogSimulateCrashReport___CrashReportHandle)
  {
    v2 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport"), "fileSystemRepresentation"), 1);
    v1 = v6;
    DALogSimulateCrashReport___CrashReportHandle = (uint64_t)v2;
    if (v2)
    {
      v3 = dlsym(v2, "SimulateCrash");
      v1 = v6;
      DALogSimulateCrashReport_DASimulateCrash = v3;
    }
  }
  v4 = (void (*)(uint64_t, uint64_t, id))DALogSimulateCrashReport_DASimulateCrash;
  if (DALogSimulateCrashReport_DASimulateCrash)
  {
    v5 = getpid();
    v4(v5, 464366555, v6);
    v1 = v6;
  }

}

void ___initLogging_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFArray *v6;
  const __CFArray *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  const void *v22;
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
  _BYTE v35[128];
  _BYTE v36[128];
  _QWORD v37[4];
  _QWORD v38[4];
  const __CFString *v39;
  _QWORD v40[4];
  _QWORD v41[4];
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  _allDALogFacilities();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v32;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v32 != v3)
          objc_enumerationMutation(v0);
        v5 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v4);
        if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Accounts")) & 1) == 0)
        {
          v42 = v5;
          v6 = (const __CFArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
          v40[0] = CFSTR("logDirectory");
          if (DACustomLogDirectory_onceToken != -1)
            dispatch_once(&DACustomLogDirectory_onceToken, &__block_literal_global_1);
          v41[0] = DACustomLogDirectory_retval;
          v41[1] = CFSTR("dataaccess");
          v40[1] = CFSTR("logName");
          v40[2] = CFSTR("consoleLevelDefaultsKey");
          v40[3] = CFSTR("logFileLevelDefaultsKey");
          v41[2] = CFSTR("DAOutputLevel");
          v41[3] = CFSTR("DALogLevel");
          DACPLoggingAddCustomLogConfiguration(v6, (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 4));
        }
        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v2);
  }

  v39 = CFSTR("Accounts");
  v7 = (const __CFArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v37[0] = CFSTR("logDirectory");
  if (DACustomLogDirectory_onceToken != -1)
    dispatch_once(&DACustomLogDirectory_onceToken, &__block_literal_global_1);
  v38[0] = DACustomLogDirectory_retval;
  v38[1] = CFSTR("DAAccountMigration");
  v37[1] = CFSTR("logName");
  v37[2] = CFSTR("consoleLevelDefaultsKey");
  v37[3] = CFSTR("logFileLevelDefaultsKey");
  v38[2] = CFSTR("DAOutputLevel");
  v38[3] = CFSTR("DALogLevel");
  DACPLoggingAddCustomLogConfiguration(v7, (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 4));
  +[DABehaviorOptions DAManagedDefaultForKey:](DABehaviorOptions, "DAManagedDefaultForKey:", CFSTR("DALogLevel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 && +[DABehaviorOptions isAppleInternalInstall](DABehaviorOptions, "isAppleInternalInstall"))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    _allDALogFacilities();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          DACPLoggingSetCustomMaxLogFileLevel(*(const void **)(*((_QWORD *)&v27 + 1) + 8 * i), 7u);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v11);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "processName");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)_CPLog_to_os_log_type_block_invoke_sProcessName;
  _CPLog_to_os_log_type_block_invoke_sProcessName = v15;

  _CPLog_to_os_log_type_block_invoke_sPID = getpid();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  _allDALogFacilities();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        v22 = *(const void **)(*((_QWORD *)&v23 + 1) + 8 * j);
        DACPLoggingSetCustomCreateFileLogFormatBlock(v22, &__block_literal_global_43);
        DACPLoggingSetCustomCreateConsoleLogFormatBlock(v22, &__block_literal_global_67);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v19);
  }

}

uint64_t ___initLogging_block_invoke_2(int a1, unsigned int a2, const __CFDate *a3, int a4, uint64_t a5, char *__s, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  char *v16;
  char *v17;
  __CFString *v18;
  uint64_t StringWithDate;
  const void *v20;
  int v21;
  id v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if (__s)
  {
    v16 = strrchr(__s, 47);
    if (v16)
      v17 = v16 + 1;
    else
      v17 = 0;
  }
  else
  {
    v17 = 0;
  }
  if (a2 > 7)
    v18 = CFSTR("Unknown");
  else
    v18 = _CPLog_to_os_log_type_block_invoke_3_levelLabels[a2];
  if (_logFormater_logPred != -1)
    dispatch_once(&_logFormater_logPred, &__block_literal_global_72);
  if (_logFormater___logFormatter)
  {
    StringWithDate = (uint64_t)CFDateFormatterCreateStringWithDate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFDateFormatterRef)_logFormater___logFormatter, a3);
  }
  else
  {
    -[__CFDate description](a3, "description");
    StringWithDate = objc_claimAutoreleasedReturnValue();
  }
  v20 = (const void *)StringWithDate;
  v21 = atomic_load(&_DACPLoggingMaxAcceptedLevel);
  v22 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v21 < 7)
  {
    v24 = objc_msgSend(v22, "initWithFormat:", CFSTR("%@|%@|%d|%p|%@|%@|%@"), v20, _CPLog_to_os_log_type_block_invoke_sProcessName, _CPLog_to_os_log_type_block_invoke_sPID, a9, a5, v18, a10, v27, v28, v29);
  }
  else
  {
    if (v17)
      v23 = v17;
    else
      v23 = __s;
    v24 = objc_msgSend(v22, "initWithFormat:", CFSTR("%@|%@|%d|%p|%@|%@|%s|%s:%lu| %@"), v20, _CPLog_to_os_log_type_block_invoke_sProcessName, _CPLog_to_os_log_type_block_invoke_sPID, a9, a5, v18, a7, v23, a8, a10);
  }
  v25 = v24;
  if (v20)
    CFRelease(v20);

  return v25;
}

uint64_t ___initLogging_block_invoke_3(int a1, unsigned int a2, const __CFDate *a3, int a4, uint64_t a5, char *__s, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  char *v16;
  char *v17;
  __CFString *v18;
  uint64_t StringWithDate;
  const void *v20;
  int v21;
  id v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if (__s)
  {
    v16 = strrchr(__s, 47);
    if (v16)
      v17 = v16 + 1;
    else
      v17 = 0;
  }
  else
  {
    v17 = 0;
  }
  if (a2 > 7)
    v18 = CFSTR("Unknown");
  else
    v18 = _CPLog_to_os_log_type_block_invoke_3_levelLabels[a2];
  if (_logFormater_logPred != -1)
    dispatch_once(&_logFormater_logPred, &__block_literal_global_72);
  if (_logFormater___logFormatter)
  {
    StringWithDate = (uint64_t)CFDateFormatterCreateStringWithDate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFDateFormatterRef)_logFormater___logFormatter, a3);
  }
  else
  {
    -[__CFDate description](a3, "description");
    StringWithDate = objc_claimAutoreleasedReturnValue();
  }
  v20 = (const void *)StringWithDate;
  v21 = atomic_load(&_DACPLoggingMaxAcceptedLevel);
  v22 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v21 < 7)
  {
    v24 = objc_msgSend(v22, "initWithFormat:", CFSTR("%p|%@|%@|%@"), a9, a5, v18, a10, v27, v28, v29);
  }
  else
  {
    if (v17)
      v23 = v17;
    else
      v23 = __s;
    v24 = objc_msgSend(v22, "initWithFormat:", CFSTR("%p|%@|%@|%s|%s:%lu| %@"), a9, a5, v18, a7, v23, a8, a10);
  }
  v25 = v24;
  if (v20)
    CFRelease(v20);

  return v25;
}

void ___logFormater_block_invoke()
{
  __CFDateFormatter *v0;

  v0 = CFDateFormatterCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFLocaleRef)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"), kCFDateFormatterShortStyle, kCFDateFormatterFullStyle);
  _logFormater___logFormatter = (uint64_t)v0;
  if (v0)
    CFDateFormatterSetFormat(v0, CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
  else
    NSLog(CFSTR("Could not create a date formatter"));
}

void ___allDALogFacilities_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("EAS"), CFSTR("CalDAV"), CFSTR("LDAP"), CFSTR("SubCal"), CFSTR("DA"), CFSTR("CardDAV"), CFSTR("IMAP"), CFSTR("CoreDAV"), CFSTR("PC"), CFSTR("EASPARSING"), CFSTR("Accounts"), CFSTR("DAREM"), 0);
  v1 = (void *)_allDALogFacilities__sAllDAFacilities;
  _allDALogFacilities__sAllDAFacilities = v0;

}

id _fileOpsQueue()
{
  if (_fileOpsQueue_onceToken != -1)
    dispatch_once(&_fileOpsQueue_onceToken, &__block_literal_global_117);
  return (id)_fileOpsQueue_queue;
}

void sub_1C1D24CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
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

id _homeDirectoryPathComponentsForUID(uid_t a1)
{
  passwd *v2;
  char *v3;
  char *v4;
  void *v5;
  void *v6;
  NSObject *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = getpwuid(a1);
  if (v2)
  {
    v3 = realpath_DARWIN_EXTSN(v2->pw_dir, 0);
    if (v3)
    {
      v4 = v3;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pathComponents");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      free(v4);
      return v6;
    }
  }
  else
  {
    DALoggingwithCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9[0] = 67109120;
      v9[1] = a1;
      _os_log_impl(&dword_1C1D11000, v8, OS_LOG_TYPE_ERROR, "Could not gather information for user %d. Not granting access to write logs.", (uint8_t *)v9, 8u);
    }

  }
  return 0;
}

void sub_1C1D255FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1C1D25BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void ___fileOpsQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("fileOpsQueue", v2);
  v1 = (void *)_fileOpsQueue_queue;
  _fileOpsQueue_queue = (uint64_t)v0;

}

uint64_t ___fileDateFormatter_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_fileDateFormatter_formatter;
  _fileDateFormatter_formatter = (uint64_t)v0;

  objc_msgSend((id)_fileDateFormatter_formatter, "setDateStyle:", 1);
  return objc_msgSend((id)_fileDateFormatter_formatter, "setDateFormat:", CFSTR("yyyy_MM_dd_HH_mm_ssZZZ"));
}

uint64_t DAECalendarAvailabilityTypeAsString(unint64_t a1)
{
  if (a1 > 6)
    return 0;
  else
    return *((_QWORD *)&off_1E7B9D7E0 + a1);
}

void _maxLogFileLevel_cold_1()
{
  __assert_rtn("_maxLogFileLevel", "DACPLogging.m", 544, "settings != globalSettings");
}

void _createWorkSettingsFromSettings_cold_1()
{
  __assert_rtn("_maxLogFileSize", "DACPLogging.m", 400, "settings != globalSettings");
}

void _createWorkSettingsFromSettings_cold_2()
{
  __assert_rtn("_maxLogFileCount", "DACPLogging.m", 411, "settings != globalSettings");
}

void _createWorkSettingsFromSettings_cold_3()
{
  __assert_rtn("_wantsCompressedFiles", "DACPLogging.m", 460, "settings != globalSettings");
}

void _createWorkSettingsFromSettings_cold_4()
{
  __assert_rtn("_enableNewlines", "DACPLogging.m", 473, "settings != globalSettings");
}

void DACPLoggingAddCustomLogConfiguration_cold_1()
{
  __assert_rtn("DACPLoggingAddCustomLogConfiguration", "DACPLogging.m", 1004, "facilityStrings");
}

void DACPLoggingAddCustomLogConfiguration_cold_2()
{
  __assert_rtn("DACPLoggingAddCustomLogConfiguration", "DACPLogging.m", 1005, "CFArrayGetCount(facilityStrings)");
}

void DACPLoggingAddCustomLogConfiguration_cold_3()
{
  __assert_rtn("DACPLoggingAddCustomLogConfiguration", "DACPLogging.m", 1046, "maxLogFileSize >= -2");
}

void DACPLoggingAddCustomLogConfiguration_cold_4()
{
  __assert_rtn("DACPLoggingAddCustomLogConfiguration", "DACPLogging.m", 1047, "maxLogFileCount >= -2");
}

void DACPLoggingAddCustomLogConfiguration_cold_5()
{
  __assert_rtn("DACPLoggingAddCustomLogConfiguration", "DACPLogging.m", 1048, "maxConsoleLevel >= -2");
}

void DACPLoggingAddCustomLogConfiguration_cold_6()
{
  __assert_rtn("DACPLoggingAddCustomLogConfiguration", "DACPLogging.m", 1049, "maxLogFileLevel >= -2");
}

void DACPLoggingAddCustomLogConfiguration_cold_7()
{
  __assert_rtn("DACPLoggingAddCustomLogConfiguration", "DACPLogging.m", 1044, "CFNumberGetValue(maxLogFileLevelObj, kCFNumberSInt32Type, &maxLogFileLevel)");
}

void DACPLoggingAddCustomLogConfiguration_cold_8()
{
  __assert_rtn("DACPLoggingAddCustomLogConfiguration", "DACPLogging.m", 1041, "CFNumberGetValue(maxConsoleLevelObj, kCFNumberSInt32Type, &maxConsoleLevel)");
}

void DACPLoggingAddCustomLogConfiguration_cold_9()
{
  __assert_rtn("DACPLoggingAddCustomLogConfiguration", "DACPLogging.m", 1038, "CFNumberGetValue(maxLogFileCountObj, kCFNumberSInt32Type, &maxLogFileCount)");
}

void DACPLoggingAddCustomLogConfiguration_cold_10()
{
  __assert_rtn("DACPLoggingAddCustomLogConfiguration", "DACPLogging.m", 1035, "CFNumberGetValue(maxLogFileSizeObj, kCFNumberSInt64Type, &maxLogFileSize)");
}

void _maxConsoleLevel_cold_1()
{
  __assert_rtn("_maxConsoleLevel", "DACPLogging.m", 511, "settings != globalSettings");
}

void DALoggingwithCategory_cold_1()
{
  __assert_rtn("DALoggingwithCategory", "DALogging.m", 277, "category < DACategoryCount");
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D10](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1E0C983B0](allocator, theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1E0C98460](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x1E0C98490](allocator, formatter, date);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x1E0C984C0](formatter, formatString);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1E0C990F0](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C993F8](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(_QWORD *)&encoding);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

uint64_t CPFileCompressionZDeflate()
{
  return MEMORY[0x1E0CFA288]();
}

uint64_t CPIsInternalDevice()
{
  return MEMORY[0x1E0CFA2C8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFPreferencesWriteManagedDomainForUser()
{
  return MEMORY[0x1E0C9A3B0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x1E0C81648](a1);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x1E0DDFE88]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fchmodat(int a1, const char *a2, mode_t a3, int a4)
{
  return MEMORY[0x1E0C832D8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1E0C837A0](*(_QWORD *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

int link(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C83B70](a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t proc_disable_cpumon()
{
  return MEMORY[0x1E0C84BE0]();
}

uint64_t proc_set_cpumon_defaults()
{
  return MEMORY[0x1E0C84C70]();
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C85008](a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85718](a1, a2);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FA0](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1E0C862B0](xdict);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

