_QWORD *__aclSaveMightHaveResult_block_invoke(_QWORD *result)
{
  _QWORD *v1;
  const void *v2;

  if (*((double *)result + 4) > *(double *)&qword_1ED1B3A40)
  {
    v1 = result;
    qword_1ED1B3A40 = result[4];
    if (qword_1ED1B3A48)
      CFRelease((CFTypeRef)qword_1ED1B3A48);
    v2 = (const void *)v1[5];
    qword_1ED1B3A48 = (uint64_t)v2;
    if (v2)
      CFRetain(v2);
    byte_1ED1B3A50 = *((_BYTE *)v1 + 56);
    if (qword_1ED1B3A58)
      CFRelease((CFTypeRef)qword_1ED1B3A58);
    result = (_QWORD *)v1[6];
    qword_1ED1B3A58 = (uint64_t)result;
    if (result)
      return CFRetain(result);
  }
  return result;
}

_xpc_connection_s *aclGetSharedLocatorConnection(uint64_t a1, CFErrorRef *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _xpc_connection_s *v8;
  NSObject *global_queue;
  _xpc_connection_s *mach_service;
  _QWORD handler[6];

  v8 = (_xpc_connection_s *)qword_1ED1B3A00;
  if (!qword_1ED1B3A00)
  {
    if (qword_1ED1B3A08 < 0
      || (global_queue = dispatch_get_global_queue(0, 0),
          (mach_service = xpc_connection_create_mach_service("com.apple.AssetCacheLocatorService", global_queue, 2uLL)) == 0))
    {
      v8 = 0;
      if (a2)
        *a2 = aclErrorCreate(a1, (const __CFString *)*MEMORY[0x1E0C9AFD0], 12, CFSTR("xpc_connection_create(%s) failed"), a5, a6, a7, a8, (char)"com.apple.AssetCacheLocatorService");
    }
    else
    {
      v8 = mach_service;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 0x40000000;
      handler[2] = __aclGetSharedLocatorConnection_block_invoke;
      handler[3] = &__block_descriptor_tmp_218;
      handler[4] = mach_service;
      handler[5] = &qword_1ED1B3A00;
      xpc_connection_set_event_handler(mach_service, handler);
      qword_1ED1B3A00 = (uint64_t)v8;
      xpc_connection_resume(v8);
    }
  }
  return v8;
}

CFErrorRef aclErrorCreateFromXPC(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value;
  void *v4;
  CFErrorRef v5;
  const char *string;
  const __CFString *v8;
  int64_t int64;
  const char *v10;
  CFStringRef v11;
  CFStringRef v12;
  CFStringRef v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFStringRef v18;

  value = xpc_dictionary_get_value(xdict, "error");
  if (value)
  {
    v4 = value;
    if (MEMORY[0x1D8267440]() == MEMORY[0x1E0C812F8])
    {
      string = xpc_dictionary_get_string(v4, "errorDomain");
      if (string)
        v8 = CFStringCreateWithCString(0, string, 0x8000100u);
      else
        v8 = 0;
      int64 = xpc_dictionary_get_int64(v4, "errorCode");
      v10 = xpc_dictionary_get_string(v4, "errorDescription");
      if (v10)
      {
        v11 = CFStringCreateWithCString(0, v10, 0x8000100u);
        if (v11)
        {
          v12 = v11;
          v13 = CFStringCreateWithFormat(0, 0, CFSTR("AssetCacheLocatorService: %@"), v11);
          v18 = v13;
          if (v8 && v13)
          {
            v5 = aclErrorCreate(a1, v8, int64, CFSTR("%@"), v14, v15, v16, v17, (char)v13);
            goto LABEL_15;
          }
          if (v13)
          {
            v5 = 0;
LABEL_15:
            CFRelease(v18);
            CFRelease(v12);
            if (!v8)
              return v5;
            goto LABEL_19;
          }
          CFRelease(v12);
        }
      }
      v5 = 0;
      if (!v8)
        return v5;
LABEL_19:
      CFRelease(v8);
      return v5;
    }
  }
  return 0;
}

void ACSMightCurrentNetworkHaveCachingServer(const __CFString *a1, NSObject *global_queue, uint64_t a3)
{
  double Current;
  uint32_t v7;
  uint32_t v8;
  NSObject *v9;
  uint64_t v10;
  const void *v11;
  int v12;
  __CFError *v13;
  CFErrorRef Copy;
  int v15;
  const void *v16;
  const void *v17;
  xpc_object_t v18;
  NSObject *v19;
  CFAbsoluteTime v20;
  _QWORD v21[10];
  uint32_t v22;
  _QWORD v23[8];
  uint32_t v24;
  char v25;
  _QWORD block[8];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double *v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t buf[4];
  uint32_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  _BYTE v50[24];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  if (acl != -1)
    dispatch_once(&acl, &__block_literal_global_0);
  do
    v7 = arc4random();
  while (!v7);
  v8 = v7;
  v9 = qword_1ED1B39F0;
  if (os_log_type_enabled((os_log_t)qword_1ED1B39F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110146;
    v44 = v8;
    v45 = 2080;
    v46 = "ACSMightCurrentNetworkHaveCachingServer";
    v47 = 2112;
    v48 = a1;
    v49 = 2048;
    *(_QWORD *)v50 = global_queue;
    *(_WORD *)&v50[8] = 2048;
    *(_QWORD *)&v50[10] = a3;
    _os_log_impl(&dword_1D4CDC000, v9, OS_LOG_TYPE_DEFAULT, "#%08x %s(options=%@, callbackQueue=%p, callback=%p)", buf, 0x30u);
  }
  v10 = MEMORY[0x1E0C809B0];
  if (!a3)
    goto LABEL_22;
  if (!global_queue)
    global_queue = dispatch_get_global_queue(0, 0);
  dispatch_retain(global_queue);
  v39 = 0;
  v40 = (double *)&v39;
  v41 = 0x2000000000;
  v42 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2000000000;
  v38 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2000000000;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2000000000;
  v30 = 0;
  block[0] = v10;
  block[1] = 0x40000000;
  block[2] = __ACSMightCurrentNetworkHaveCachingServer_block_invoke;
  block[3] = &unk_1E9877DA0;
  block[4] = &v39;
  block[5] = &v35;
  block[6] = &v31;
  block[7] = &v27;
  dispatch_sync((dispatch_queue_t)qword_1ED1B3A10, block);
  if (CFAbsoluteTimeGetCurrent() - v40[3] >= 5.0)
    goto LABEL_16;
  v11 = (const void *)v36[3];
  if (!a1)
  {
    if (!v11)
      goto LABEL_13;
LABEL_16:
    v15 = 1;
    goto LABEL_17;
  }
  if (!v11 || !CFEqual(a1, v11))
    goto LABEL_16;
LABEL_13:
  v12 = *((unsigned __int8 *)v32 + 24);
  v13 = (__CFError *)v28[3];
  if (v13)
    Copy = aclErrorCreateCopy(v13);
  else
    Copy = 0;
  v19 = qword_1ED1B39F0;
  if (os_log_type_enabled((os_log_t)qword_1ED1B39F0, OS_LOG_TYPE_DEFAULT))
  {
    v20 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 67110402;
    v44 = v8;
    v45 = 2080;
    v46 = "ACSMightCurrentNetworkHaveCachingServer";
    v47 = 2112;
    v48 = CFSTR("same");
    v49 = 1024;
    *(_DWORD *)v50 = v12;
    *(_WORD *)&v50[4] = 2112;
    *(_QWORD *)&v50[6] = Copy;
    *(_WORD *)&v50[14] = 2048;
    *(double *)&v50[16] = v20 - Current;
    _os_log_impl(&dword_1D4CDC000, v19, OS_LOG_TYPE_DEFAULT, "#%08x %s -> [%@] mightHave %{BOOL}d, error %@, elapsed %.3f", buf, 0x36u);
  }
  v23[0] = v10;
  v23[1] = 0x40000000;
  v23[2] = __ACSMightCurrentNetworkHaveCachingServer_block_invoke_76;
  v23[3] = &unk_1E9877DC8;
  v23[4] = a3;
  v23[5] = Copy;
  v25 = v12;
  v24 = v8;
  v23[6] = "ACSMightCurrentNetworkHaveCachingServer";
  v23[7] = global_queue;
  dispatch_async(global_queue, v23);
  v15 = 0;
LABEL_17:
  v16 = (const void *)v28[3];
  if (v16)
  {
    CFRelease(v16);
    v28[3] = 0;
  }
  v17 = (const void *)v36[3];
  if (v17)
  {
    CFRelease(v17);
    v36[3] = 0;
  }
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  if (v15)
  {
LABEL_22:
    v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v18, "tag", v8);
    xpc_dictionary_set_string(v18, "command", "recentlySeen");
    if (a1)
    {
      if (CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("autoRefresh")) == (const void *)*MEMORY[0x1E0C9AE40])
        xpc_dictionary_set_BOOL(v18, "autoRefresh", 0);
      if (CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("quickMiss")) == (const void *)*MEMORY[0x1E0C9AE50])
        xpc_dictionary_set_BOOL(v18, "quickMiss", 1);
      CFRetain(a1);
    }
    v21[0] = v10;
    v21[1] = 0x40000000;
    v21[2] = __ACSMightCurrentNetworkHaveCachingServer_block_invoke_2;
    v21[3] = &unk_1E9877E68;
    v22 = v8;
    *(double *)&v21[6] = Current;
    v21[7] = a1;
    v21[8] = "ACSMightCurrentNetworkHaveCachingServer";
    v21[4] = a3;
    v21[5] = v18;
    v21[9] = global_queue;
    dispatch_async((dispatch_queue_t)qword_1ED1B39F8, v21);
  }
}

void sub_1D4CDF2EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4CDF7F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4CDFBD8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4CDFE14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4CDFFEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4CE1104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
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

void sub_1D4CE37A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D4CE9460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4CE98C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4CE9CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4CEA084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSZExtractorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!StreamingZipLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E9877BE0;
    v5 = 0;
    StreamingZipLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!StreamingZipLibraryCore_frameworkLibrary)
    __getSZExtractorClass_block_invoke_cold_1(&v3);
  result = objc_getClass("SZExtractor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSZExtractorClass_block_invoke_cold_2();
  getSZExtractorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t _A_CALLBACK_BLOCK_RELEASED_AN_ASSETCACHESERVICES_OBJECT_IT_DID_NOT_OWN(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v8;
  _DWORD v10[2];
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = qword_1ED1B39F0;
  if (os_log_type_enabled((os_log_t)qword_1ED1B39F0, OS_LOG_TYPE_ERROR))
  {
    v10[0] = 67109890;
    v10[1] = a1;
    v11 = 2080;
    v12 = a2;
    v13 = 2080;
    v14 = a3;
    v15 = 2048;
    v16 = a4;
    _os_log_error_impl(&dword_1D4CDC000, v8, OS_LOG_TYPE_ERROR, "#%08x A callback block invoked by %s released an object it did not own: \"%s\", %p", (uint8_t *)v10, 0x26u);
  }
  raise(6);
  pause();
  return pause();
}

void ACSLocateCachingServer(const void *a1, const __CFDictionary *a2, NSObject *global_queue, uint64_t a4, double a5)
{
  double Current;
  uint32_t v11;
  unsigned int v12;
  NSObject *v13;
  _QWORD *v14;
  const __CFString *String;
  const __CFString *v16;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v18;
  CFIndex v19;
  const __CFString *ValueAtIndex;
  int v21;
  _QWORD v22[10];
  unsigned int v23;
  uint8_t buf[4];
  unsigned int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const void *v29;
  __int16 v30;
  double v31;
  __int16 v32;
  const __CFDictionary *v33;
  __int16 v34;
  NSObject *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  if (acl != -1)
    dispatch_once(&acl, &__block_literal_global_0);
  do
    v11 = arc4random();
  while (!v11);
  v12 = v11;
  v13 = qword_1ED1B39F0;
  if (os_log_type_enabled((os_log_t)qword_1ED1B39F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110658;
    v25 = v12;
    v26 = 2080;
    v27 = "ACSLocateCachingServer";
    v28 = 2112;
    v29 = a1;
    v30 = 2048;
    v31 = a5;
    v32 = 2112;
    v33 = a2;
    v34 = 2048;
    v35 = global_queue;
    v36 = 2048;
    v37 = a4;
    _os_log_impl(&dword_1D4CDC000, v13, OS_LOG_TYPE_DEFAULT, "#%08x %s(assetURL=%@, locateTimeout=%.3f, options=%@, callbackQueue=%p, callback=%p)", buf, 0x44u);
  }
  if (a4)
  {
    CFRetain(a1);
    if (!global_queue)
      global_queue = dispatch_get_global_queue(0, 0);
    dispatch_retain(global_queue);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 0x40000000;
    v22[2] = __ACSLocateCachingServer_block_invoke;
    v22[3] = &unk_1E9877D28;
    v23 = v12;
    v22[5] = a1;
    v22[6] = "ACSLocateCachingServer";
    *(double *)&v22[7] = Current;
    *(double *)&v22[8] = a5;
    v22[9] = global_queue;
    v14 = v22;
    v22[4] = a4;
  }
  else
  {
    v14 = 0;
  }
  String = CFURLCopyQueryString((CFURLRef)a1, 0);
  if (String)
  {
    v16 = String;
    ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, String, CFSTR("&"));
    if (ArrayBySeparatingStrings)
    {
      v18 = ArrayBySeparatingStrings;
      if (CFArrayGetCount(ArrayBySeparatingStrings) < 1)
      {
LABEL_17:
        v21 = 0;
      }
      else
      {
        v19 = 0;
        while (1)
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v18, v19);
          if (!aclIsReservedQueryParameter(ValueAtIndex))
            break;
          if (++v19 >= CFArrayGetCount(v18))
            goto LABEL_17;
        }
        v21 = 1;
      }
      CFRelease(v18);
    }
    else
    {
      v21 = 0;
    }
    CFRelease(v16);
  }
  else
  {
    v21 = 0;
  }
  aclLocateCommon(v12, 1u, a2, v21, (uint64_t)v14, Current, a5);
}

CFErrorRef aclErrorCreateCopy(__CFError *a1)
{
  const __CFDictionary *v2;
  const __CFString *Domain;
  CFIndex Code;
  CFErrorRef v5;

  v2 = CFErrorCopyUserInfo(a1);
  Domain = CFErrorGetDomain(a1);
  Code = CFErrorGetCode(a1);
  v5 = CFErrorCreate(0, Domain, Code, v2);
  if (v2)
    CFRelease(v2);
  return v5;
}

CFErrorRef aclErrorCreate(uint64_t a1, const __CFString *a2, CFIndex a3, const __CFString *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v14;
  CFStringRef v15;
  CFStringRef v16;
  CFStringRef v17;
  CFStringRef v18;
  const __CFDictionary *Copy;
  CFErrorRef v20;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
    return CFErrorCreate(0, a2, a3, 0);
  v14 = Mutable;
  v15 = CFStringCreateWithFormat(0, 0, CFSTR("#%08x"), a1);
  if (v15)
  {
    v16 = v15;
    CFDictionaryAddValue(v14, CFSTR("com.apple.AssetCacheLocator.tag"), v15);
    CFRelease(v16);
  }
  if (a4)
  {
    v17 = CFStringCreateWithFormatAndArguments(0, 0, a4, &a9);
    if (v17)
    {
      v18 = v17;
      CFDictionaryAddValue(v14, (const void *)*MEMORY[0x1E0C9AFE0], v17);
      CFRelease(v18);
    }
  }
  Copy = CFDictionaryCreateCopy(0, v14);
  CFRelease(v14);
  v20 = CFErrorCreate(0, a2, a3, Copy);
  if (Copy)
    CFRelease(Copy);
  return v20;
}

void aclLocateCommon(unsigned int a1, unsigned int a2, const __CFDictionary *a3, int a4, uint64_t a5, double a6, double a7)
{
  uint64_t v7;
  uint64_t v14;
  const void *v15;
  int v16;
  const void *v17;
  const void *v18;
  const void *v19;
  xpc_object_t v20;
  const __CFArray *Value;
  const __CFArray *v22;
  CFTypeID v23;
  int64_t Count;
  const void **v25;
  const void **v26;
  CFIndex v27;
  CFIndex v28;
  const void *v29;
  const void *ValueAtIndex;
  CFTypeID v31;
  const __CFDictionary *v32;
  const __CFArray *v33;
  CFTypeID v34;
  xpc_object_t v35;
  const void *v36;
  const void *v37;
  const __CFString *v38;
  const __CFString *v39;
  unsigned int v40;
  CFIndex Length;
  CFIndex v42;
  char *v43;
  const void *v44;
  const void *v45;
  const __CFNumber *v46;
  unsigned int v47;
  int v48;
  const __CFDictionary *v49;
  uint64_t v50;
  unsigned int v51;
  _QWORD v52[10];
  unsigned int v53;
  unsigned int v54;
  char v55;
  _QWORD block[10];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t valuePtr;
  uint64_t *p_valuePtr;
  uint64_t v79;
  uint64_t v80;

  v7 = a5;
  v14 = MEMORY[0x1E0C809B0];
  if (!a5)
    goto LABEL_20;
  valuePtr = 0;
  p_valuePtr = &valuePtr;
  v79 = 0x2000000000;
  v80 = 0;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2000000000;
  v76 = 0;
  v69 = 0;
  v70 = &v69;
  v71 = 0x2000000000;
  v72 = 0;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2000000000;
  v68 = 0;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2000000000;
  v64 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x2000000000;
  v60 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __aclLocateCommon_block_invoke;
  block[3] = &unk_1E9878058;
  block[4] = &valuePtr;
  block[5] = &v73;
  block[6] = &v69;
  block[7] = &v65;
  block[8] = &v61;
  block[9] = &v57;
  dispatch_sync((dispatch_queue_t)qword_1ED1B3A10, block);
  if (a3 && CFDictionaryGetValue(a3, CFSTR("forceMiss")) == (const void *)*MEMORY[0x1E0C9AE50]
    || CFAbsoluteTimeGetCurrent() - *((double *)p_valuePtr + 3) >= 5.0)
  {
    goto LABEL_12;
  }
  v15 = (const void *)v74[3];
  if (a3)
  {
    if (!v15 || !CFEqual(a3, v15))
      goto LABEL_12;
  }
  else if (v15)
  {
LABEL_12:
    v16 = 1;
    goto LABEL_13;
  }
  if (*((unsigned __int8 *)v70 + 24) != a4 || *((_DWORD *)v66 + 6) < (signed int)a2)
    goto LABEL_12;
  (*(void (**)(uint64_t, const __CFString *, uint64_t, uint64_t))(v7 + 16))(v7, CFSTR("same"), v62[3], v58[3]);
  v16 = 0;
LABEL_13:
  v17 = (const void *)v58[3];
  if (v17)
  {
    CFRelease(v17);
    v58[3] = 0;
  }
  v18 = (const void *)v62[3];
  if (v18)
  {
    CFRelease(v18);
    v62[3] = 0;
  }
  v19 = (const void *)v74[3];
  if (v19)
  {
    CFRelease(v19);
    v74[3] = 0;
  }
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&valuePtr, 8);
  if (v16)
  {
LABEL_20:
    v20 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v20, "tag", a1);
    xpc_dictionary_set_string(v20, "command", "locate");
    xpc_dictionary_set_int64(v20, "quantity", a2);
    if (!a3)
    {
LABEL_65:
      v52[0] = v14;
      v52[1] = 0x40000000;
      v52[2] = __aclLocateCommon_block_invoke_2;
      v52[3] = &unk_1E9878120;
      *(double *)&v52[5] = a6;
      v55 = a4;
      v53 = a1;
      v54 = a2;
      v52[4] = v7;
      v52[6] = a3;
      v52[7] = v20;
      *(double *)&v52[8] = a7;
      v52[9] = "aclLocateCommon";
      dispatch_async((dispatch_queue_t)qword_1ED1B39F8, v52);
      return;
    }
    Value = (const __CFArray *)CFDictionaryGetValue(a3, CFSTR("capabilities"));
    v51 = a1;
    if (Value)
    {
      v22 = Value;
      v23 = CFGetTypeID(Value);
      if (v23 == CFArrayGetTypeID())
      {
        v47 = a2;
        v48 = a4;
        v49 = a3;
        v50 = v7;
        Count = CFArrayGetCount(v22);
        v25 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
        v26 = (const void **)malloc_type_calloc(Count, 8uLL, 0xC0040B8AA526DuLL);
        if (Count < 1)
        {
          v28 = 0;
        }
        else
        {
          v27 = 0;
          v28 = 0;
          v29 = (const void *)*MEMORY[0x1E0C9AE50];
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v22, v27);
            v31 = CFGetTypeID(ValueAtIndex);
            if (v31 == CFStringGetTypeID())
            {
              v25[v28] = ValueAtIndex;
              v26[v28++] = v29;
            }
            ++v27;
          }
          while (Count != v27);
        }
        v22 = CFDictionaryCreate(0, v25, v26, v28, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        free(v26);
        free(v25);
        v33 = v22;
        a3 = v49;
        v7 = v50;
        a2 = v47;
        a4 = v48;
      }
      else
      {
        v33 = 0;
      }
      v34 = CFGetTypeID(v22);
      if (v34 == CFDictionaryGetTypeID())
        v32 = v22;
      else
        v32 = 0;
      if (a4)
        goto LABEL_39;
    }
    else
    {
      v32 = 0;
      v33 = 0;
      if (a4)
        goto LABEL_39;
    }
    if (!v32)
    {
LABEL_49:
      if (v33)
        CFRelease(v33);
      v38 = (const __CFString *)CFDictionaryGetValue(a3, CFSTR("x-apple-persistent-identifier"));
      v14 = MEMORY[0x1E0C809B0];
      if (v38)
      {
        v39 = v38;
        v40 = a2;
        Length = CFStringGetLength(v38);
        v42 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
        v43 = (char *)malloc_type_malloc(v42, 0x5DAC55DFuLL);
        if (CFStringGetCString(v39, v43, v42, 0x8000100u))
          xpc_dictionary_set_string(v20, "x-apple-persistent-identifier", v43);
        free(v43);
        a2 = v40;
      }
      if (CFDictionaryGetValue(a3, CFSTR("autoRefresh")) == (const void *)*MEMORY[0x1E0C9AE40])
        xpc_dictionary_set_BOOL(v20, "autoRefresh", 0);
      v44 = CFDictionaryGetValue(a3, CFSTR("quickMiss"));
      v45 = (const void *)*MEMORY[0x1E0C9AE50];
      a1 = v51;
      if (v44 == (const void *)*MEMORY[0x1E0C9AE50])
        xpc_dictionary_set_BOOL(v20, "quickMiss", 1);
      if (CFDictionaryGetValue(a3, CFSTR("forceMiss")) == v45)
        xpc_dictionary_set_BOOL(v20, "forceMiss", 1);
      v46 = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("sizeHint"));
      if (v46)
      {
        valuePtr = 0;
        if (CFNumberGetValue(v46, kCFNumberSInt64Type, &valuePtr))
          xpc_dictionary_set_uint64(v20, "sizeHint", valuePtr);
      }
      CFRetain(a3);
      goto LABEL_65;
    }
LABEL_39:
    v35 = xpc_dictionary_create(0, 0, 0);
    if (v32)
    {
      v36 = CFDictionaryGetValue(v32, CFSTR("import"));
      v37 = (const void *)*MEMORY[0x1E0C9AE50];
      if (v36 == (const void *)*MEMORY[0x1E0C9AE50])
        xpc_dictionary_set_BOOL(v35, "import", 1);
      if (CFDictionaryGetValue(v32, CFSTR("namespaces")) == v37)
        xpc_dictionary_set_BOOL(v35, "namespaces", 1);
      if (CFDictionaryGetValue(v32, CFSTR("personalCaching")) == v37)
        xpc_dictionary_set_BOOL(v35, "personalCaching", 1);
    }
    if (a4)
      xpc_dictionary_set_BOOL(v35, "queryParameters", 1);
    xpc_dictionary_set_value(v20, "capabilities", v35);
    xpc_release(v35);
    goto LABEL_49;
  }
}

void _ACSLocateAllCachingServers(const __CFDictionary *a1, NSObject *global_queue, uint64_t a3, double a4)
{
  double Current;
  uint32_t v9;
  unsigned int v10;
  NSObject *v11;
  _QWORD *v12;
  _QWORD v13[9];
  unsigned int v14;
  uint8_t buf[4];
  unsigned int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  double v20;
  __int16 v21;
  const __CFDictionary *v22;
  __int16 v23;
  NSObject *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  if (acl != -1)
    dispatch_once(&acl, &__block_literal_global_0);
  do
    v9 = arc4random();
  while (!v9);
  v10 = v9;
  v11 = qword_1ED1B39F0;
  if (os_log_type_enabled((os_log_t)qword_1ED1B39F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110402;
    v16 = v10;
    v17 = 2080;
    v18 = "_ACSLocateAllCachingServers";
    v19 = 2048;
    v20 = a4;
    v21 = 2112;
    v22 = a1;
    v23 = 2048;
    v24 = global_queue;
    v25 = 2048;
    v26 = a3;
    _os_log_impl(&dword_1D4CDC000, v11, OS_LOG_TYPE_DEFAULT, "#%08x %s(locateTimeout=%.3f, options=%@, callbackQueue=%p, callback=%p)", buf, 0x3Au);
  }
  if (a3)
  {
    if (!global_queue)
      global_queue = dispatch_get_global_queue(0, 0);
    dispatch_retain(global_queue);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = ___ACSLocateAllCachingServers_block_invoke;
    v13[3] = &unk_1E9877D78;
    v14 = v10;
    *(double *)&v13[6] = Current;
    *(double *)&v13[7] = a4;
    v13[8] = global_queue;
    v13[4] = a3;
    v13[5] = "_ACSLocateAllCachingServers";
    v12 = v13;
  }
  else
  {
    v12 = 0;
  }
  aclLocateCommon(v10, 0, a1, 1, (uint64_t)v12, Current, a4);
}

uint64_t ACSUpdateCachingServerHealth(const __CFURL *a1, uint64_t a2, int a3, CFErrorRef *a4)
{
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *String;
  const __CFString *v12;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v14;
  CFIndex v15;
  const __CFString *ValueAtIndex;
  const __CFString *v17;
  const __CFString *v18;
  int HasPrefix;
  int v20;
  CFStringRef v21;
  SInt32 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  xpc_object_t v28;
  uint64_t result;
  CFErrorRef v30;
  char v31;
  int v32;
  _QWORD block[5];
  int v34;
  _QWORD v35[2];
  int v36;
  char v37[16];
  _WORD v38[15];
  char v39[8];
  uint64_t v40;
  uint8_t buf[48];
  __int128 v42;
  char v43[30];
  char buffer[8];
  uint64_t v45;
  double *(*v46)(double *);
  void *v47;
  __int128 v48;
  _BYTE v49[21];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (acl != -1)
    dispatch_once(&acl, &__block_literal_global_0);
  do
    v8 = arc4random();
  while (!(_DWORD)v8);
  v9 = v8;
  v10 = qword_1ED1B39F0;
  if (os_log_type_enabled((os_log_t)qword_1ED1B39F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)&buf[4] = v9;
    *(_WORD *)&buf[8] = 2080;
    *(_QWORD *)&buf[10] = "ACSUpdateCachingServerHealth";
    *(_WORD *)&buf[18] = 2112;
    *(_QWORD *)&buf[20] = a1;
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = a2;
    *(_WORD *)&buf[38] = 1024;
    *(_DWORD *)&buf[40] = a3;
    _os_log_impl(&dword_1D4CDC000, v10, OS_LOG_TYPE_DEFAULT, "#%08x %s(url=%@, options=%@, healthy=%{BOOL}d)", buf, 0x2Cu);
  }
  String = CFURLCopyQueryString(a1, 0);
  if (String)
  {
    v12 = String;
    ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, String, CFSTR("&"));
    if (ArrayBySeparatingStrings)
    {
      v14 = ArrayBySeparatingStrings;
      if (CFArrayGetCount(ArrayBySeparatingStrings) < 1)
      {
        v20 = 0;
      }
      else
      {
        v32 = a3;
        v15 = 0;
        while (1)
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v14, v15);
          v17 = CFURLCreateStringByReplacingPercentEscapes(0, ValueAtIndex, &stru_1E9878D50);
          if (v17)
          {
            v18 = v17;
            HasPrefix = CFStringHasPrefix(v17, CFSTR("source="));
            CFRelease(v18);
            if (HasPrefix)
              break;
          }
          if (++v15 >= CFArrayGetCount(v14))
          {
            v20 = 0;
            goto LABEL_18;
          }
        }
        v20 = 1;
LABEL_18:
        a3 = v32;
      }
      CFRelease(v14);
    }
    else
    {
      v20 = 0;
    }
    CFRelease(v12);
  }
  else
  {
    v20 = 0;
  }
  v21 = CFURLCopyHostName(a1);
  v22 = CFURLGetPortNumber(a1);
  v42 = 0u;
  memset(v43, 0, sizeof(v43));
  memset(buf, 0, sizeof(buf));
  if (!v20 || !v21 || v22 < 1)
  {
    if (!v21)
      goto LABEL_34;
    goto LABEL_33;
  }
  if (!CFStringGetCString(v21, buffer, 62, 0x8000100u))
  {
LABEL_33:
    CFRelease(v21);
LABEL_34:
    if (!a4)
      return 0;
    v30 = aclErrorCreate(v9, (const __CFString *)*MEMORY[0x1E0C9AFD0], 22, CFSTR("invalid URL"), v23, v24, v25, v26, v31);
    result = 0;
    *a4 = v30;
    return result;
  }
  v36 = 0;
  v35[0] = 0;
  v35[1] = 0;
  *(_QWORD *)v39 = 0;
  v40 = 0;
  *(_OWORD *)v37 = 0u;
  memset(v38, 0, sizeof(v38));
  if (strcasecmp(buffer, "localhost") && (inet_pton(2, buffer, &v36) != 1 || !inet_ntop(2, &v36, v39, 0x10u)))
  {
    if (inet_pton(30, buffer, v35) == 1 && inet_ntop(30, v35, v37, 0x2Eu))
    {
      snprintf((char *)buf, 0x5EuLL, "[%s]:%u");
      goto LABEL_29;
    }
    goto LABEL_33;
  }
  snprintf((char *)buf, 0x5EuLL, "%s:%u");
LABEL_29:
  CFRelease(v21);
  v27 = MEMORY[0x1E0C809B0];
  if (!a3)
  {
    *(_QWORD *)buffer = MEMORY[0x1E0C809B0];
    v45 = 0x40000000;
    v46 = __aclSaveLocateResult_block_invoke;
    v47 = &__block_descriptor_tmp_205;
    v48 = 0u;
    memset(v49, 0, sizeof(v49));
    dispatch_sync((dispatch_queue_t)qword_1ED1B3A10, buffer);
  }
  v28 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v28, "tag", v9);
  xpc_dictionary_set_string(v28, "command", "updateHealth");
  xpc_dictionary_set_string(v28, "hostport", (const char *)buf);
  xpc_dictionary_set_BOOL(v28, "healthy", a3 != 0);
  block[0] = v27;
  block[1] = 0x40000000;
  block[2] = __ACSUpdateCachingServerHealth_block_invoke;
  block[3] = &__block_descriptor_tmp_111;
  v34 = v9;
  block[4] = v28;
  dispatch_async((dispatch_queue_t)qword_1ED1B39F8, block);
  return 1;
}

void ACSImportFileIntoCachingServer(const __CFURL *a1, const __CFString *a2, const __CFDictionary *a3, const __CFDictionary *a4, NSObject *global_queue, uint64_t a6)
{
  CFAbsoluteTime Current;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *CStringPtr;
  uint8_t *v17;
  CFFileDescriptorNativeDescriptor v18;
  int v19;
  xpc_object_t v20;
  const __CFString *v21;
  CFIndex Length;
  CFIndex v23;
  char *v24;
  CFIndex Count;
  size_t v26;
  const void **v27;
  const void **v28;
  uint64_t i;
  const __CFString *v30;
  const __CFString *v31;
  CFTypeID v32;
  CFTypeID v33;
  CFIndex v34;
  CFIndex v35;
  char *v36;
  CFIndex v37;
  CFIndex v38;
  char *v39;
  const __CFDictionary *v40;
  const __CFArray *Value;
  const __CFArray *v42;
  CFTypeID v43;
  CFIndex v44;
  CFIndex v45;
  xpc_object_t v46;
  CFIndex v47;
  const void *ValueAtIndex;
  uint64_t v49;
  _OWORD *v50;
  BOOL v51;
  const void *v52;
  const void *v53;
  const void *v54;
  const void *v55;
  const char *v56;
  const __CFString *v57;
  int *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  CFErrorRef v63;
  _QWORD *v64;
  NSObject *v65;
  const __CFString *v66;
  const __CFString *v67;
  CFIndex v68;
  CFIndex v69;
  char *v70;
  xpc_object_t v71;
  xpc_object_t v72;
  CFFileDescriptorRef v73;
  uint64_t v74;
  NSObject *v75;
  xpc_object_t xdict;
  const __CFDictionary *theDict;
  _QWORD block[10];
  int v79;
  _QWORD v80[8];
  int v81;
  uint8_t buf[4];
  int v83;
  __int16 v84;
  const char *v85;
  __int16 v86;
  const __CFURL *v87;
  __int16 v88;
  const __CFString *v89;
  __int16 v90;
  const __CFDictionary *v91;
  __int16 v92;
  const __CFDictionary *v93;
  __int16 v94;
  NSObject *v95;
  __int16 v96;
  uint64_t v97;
  _OWORD v98[4];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  if (acl != -1)
    dispatch_once(&acl, &__block_literal_global_0);
  do
    v13 = arc4random();
  while (!(_DWORD)v13);
  v14 = v13;
  v15 = qword_1ED1B39F0;
  if (os_log_type_enabled((os_log_t)qword_1ED1B39F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110914;
    v83 = v14;
    v84 = 2080;
    v85 = "ACSImportFileIntoCachingServer";
    v86 = 2112;
    v87 = a1;
    v88 = 2112;
    v89 = a2;
    v90 = 2112;
    v91 = a3;
    v92 = 2112;
    v93 = a4;
    v94 = 2048;
    v95 = global_queue;
    v96 = 2048;
    v97 = a6;
    _os_log_impl(&dword_1D4CDC000, v15, OS_LOG_TYPE_DEFAULT, "#%08x %s(assetURL=%@, sourcePath=%@, headers=%@, options=%@, callbackQueue=%p, callback=%p)", buf, 0x4Eu);
  }
  if (a6)
  {
    if (!global_queue)
      global_queue = dispatch_get_global_queue(0, 0);
    dispatch_retain(global_queue);
  }
  CStringPtr = CFStringGetCStringPtr(a2, 0x8000100u);
  if (CStringPtr)
  {
    v17 = (uint8_t *)CStringPtr;
    *__error() = 22;
  }
  else
  {
    v17 = buf;
    if (!CFStringGetCString(a2, (char *)buf, 1024, 0x8000100u))
    {
      *__error() = 22;
      goto LABEL_48;
    }
  }
  theDict = a4;
  v18 = open((const char *)v17, 0);
  if ((v18 & 0x80000000) == 0)
  {
    v19 = v18;
    v74 = a6;
    v75 = global_queue;
    v73 = CFFileDescriptorCreate(0, v18, 1u, 0, 0);
    v20 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v20, "tag", v14);
    xpc_dictionary_set_string(v20, "command", "import");
    v21 = CFURLGetString(a1);
    Length = CFStringGetLength(v21);
    v23 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    v24 = (char *)malloc_type_malloc(v23, 0x5BCF0BFDuLL);
    if (CFStringGetCString(v21, v24, v23, 0x8000100u))
      xpc_dictionary_set_string(v20, "url", v24);
    free(v24);
    xpc_dictionary_set_string(v20, "sourcePath", (const char *)v17);
    xpc_dictionary_set_fd(v20, "sourceFd", v19);
    if (a3)
    {
      Count = CFDictionaryGetCount(a3);
      if (Count >= 1)
      {
        v26 = Count;
        xdict = xpc_dictionary_create(0, 0, 0);
        v27 = (const void **)malloc_type_calloc(v26, 8uLL, 0xC0040B8AA526DuLL);
        v28 = (const void **)malloc_type_calloc(v26, 8uLL, 0xC0040B8AA526DuLL);
        CFDictionaryGetKeysAndValues(a3, v27, v28);
        for (i = 0; i != v26; ++i)
        {
          v30 = (const __CFString *)v27[i];
          v31 = (const __CFString *)v28[i];
          v32 = CFGetTypeID(v30);
          if (v32 == CFStringGetTypeID())
          {
            v33 = CFGetTypeID(v31);
            if (v33 == CFStringGetTypeID())
            {
              v34 = CFStringGetLength(v30);
              v35 = CFStringGetMaximumSizeForEncoding(v34, 0x8000100u) + 1;
              v36 = (char *)malloc_type_malloc(v35, 0xC3A09D31uLL);
              if (CFStringGetCString(v30, v36, v35, 0x8000100u))
              {
                v37 = CFStringGetLength(v31);
                v38 = CFStringGetMaximumSizeForEncoding(v37, 0x8000100u) + 1;
                v39 = (char *)malloc_type_malloc(v38, 0x9B859CAAuLL);
                if (CFStringGetCString(v31, v39, v38, 0x8000100u))
                  xpc_dictionary_set_string(xdict, v36, v39);
                free(v39);
              }
              free(v36);
            }
          }
        }
        free(v28);
        free(v27);
        xpc_dictionary_set_value(v20, "headers", xdict);
        xpc_release(xdict);
      }
    }
    v40 = theDict;
    if (!theDict)
      goto LABEL_59;
    Value = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("importStrategies"));
    if (Value)
    {
      v42 = Value;
      v43 = CFGetTypeID(Value);
      if (v43 == CFArrayGetTypeID())
      {
        v44 = CFArrayGetCount(v42);
        if (v44 >= 1)
        {
          v45 = v44;
          v98[0] = xmmword_1E9878228;
          v98[1] = *(_OWORD *)&off_1E9878238;
          v98[2] = xmmword_1E9878248;
          v98[3] = *(_OWORD *)&off_1E9878258;
          v46 = xpc_array_create(0, 0);
          v47 = 0;
LABEL_33:
          while (2)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v42, v47);
            v49 = 0;
            while (1)
            {
              if (CFEqual(ValueAtIndex, *(CFTypeRef *)&v98[v49]))
              {
                v50 = &v98[v49];
                if (!BYTE13(v98[v49]))
                  break;
              }
              if (++v49 == 4)
              {
                if (++v47 < v45)
                  goto LABEL_33;
                goto LABEL_43;
              }
            }
            xpc_array_set_uint64(v46, 0xFFFFFFFFFFFFFFFFLL, *((int *)v50 + 2));
            *((_BYTE *)v50 + 13) = 1;
            ++v47;
            if (*((_BYTE *)v50 + 12))
              v51 = 0;
            else
              v51 = v47 < v45;
            if (v51)
              continue;
            break;
          }
LABEL_43:
          xpc_dictionary_set_value(v20, "importStrategies", v46);
          xpc_release(v46);
          v40 = theDict;
        }
      }
    }
    v52 = CFDictionaryGetValue(v40, CFSTR("sourceOffset"));
    aclSetU64Option(v20, "sourceOffset", v52);
    v53 = CFDictionaryGetValue(v40, CFSTR("sourceLength"));
    aclSetU64Option(v20, "sourceLength", v53);
    v54 = CFDictionaryGetValue(v40, CFSTR("method"));
    if (v54)
    {
      v55 = v54;
      if (CFEqual(v54, CFSTR("PUT")))
      {
        v56 = "PUT";
      }
      else
      {
        if (!CFEqual(v55, CFSTR("POST")))
          goto LABEL_53;
        v56 = "POST";
      }
      xpc_dictionary_set_string(v20, "method", v56);
    }
LABEL_53:
    v66 = (const __CFString *)CFDictionaryGetValue(v40, CFSTR("x-apple-persistent-identifier"));
    if (v66)
    {
      v67 = v66;
      v68 = CFStringGetLength(v66);
      v69 = CFStringGetMaximumSizeForEncoding(v68, 0x8000100u) + 1;
      v70 = (char *)malloc_type_malloc(v69, 0x36A60298uLL);
      if (CFStringGetCString(v67, v70, v69, 0x8000100u))
      {
        v71 = xpc_dictionary_get_value(v20, "headers");
        if (v71)
        {
          xpc_dictionary_set_string(v71, "x-apple-persistent-identifier", v70);
        }
        else
        {
          v72 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_string(v72, "x-apple-persistent-identifier", v70);
          xpc_dictionary_set_value(v20, "headers", v72);
          xpc_release(v72);
        }
      }
      free(v70);
    }
LABEL_59:
    v65 = qword_1ED1B39F8;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = __ACSImportFileIntoCachingServer_block_invoke_2;
    block[3] = &unk_1E9877F50;
    v79 = v14;
    *(CFAbsoluteTime *)&block[6] = Current;
    block[7] = v73;
    block[8] = v20;
    block[4] = v74;
    block[5] = "ACSImportFileIntoCachingServer";
    block[9] = v75;
    v64 = block;
    goto LABEL_60;
  }
LABEL_48:
  if (!a6)
    return;
  v57 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
  v58 = __error();
  v63 = aclErrorCreate(v14, v57, *v58, CFSTR("open(%@) failed"), v59, v60, v61, v62, (char)a2);
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 0x40000000;
  v80[2] = __ACSImportFileIntoCachingServer_block_invoke;
  v80[3] = &unk_1E9877EB0;
  v80[4] = a6;
  v80[5] = v63;
  v81 = v14;
  v80[6] = "ACSImportFileIntoCachingServer";
  v80[7] = global_queue;
  v64 = v80;
  v65 = global_queue;
LABEL_60:
  dispatch_async(v65, v64);
}

void aclSetU64Option(void *a1, const char *a2, CFTypeRef cf)
{
  CFTypeID v6;
  uint64_t valuePtr;

  if (cf)
  {
    v6 = CFGetTypeID(cf);
    if (v6 == CFNumberGetTypeID())
    {
      valuePtr = 0;
      if (CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt64Type, &valuePtr))
        xpc_dictionary_set_uint64(a1, a2, valuePtr);
    }
  }
}

void _ACSIntrospect(const __CFDictionary *a1, NSObject *global_queue, uint64_t a3)
{
  CFAbsoluteTime Current;
  uint32_t v7;
  uint32_t v8;
  NSObject *v9;
  xpc_object_t v10;
  _QWORD v11[9];
  uint32_t v12;
  uint8_t buf[4];
  uint32_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const __CFDictionary *v18;
  __int16 v19;
  NSObject *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  if (acl != -1)
    dispatch_once(&acl, &__block_literal_global_0);
  do
    v7 = arc4random();
  while (!v7);
  v8 = v7;
  v9 = qword_1ED1B39F0;
  if (os_log_type_enabled((os_log_t)qword_1ED1B39F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110146;
    v14 = v8;
    v15 = 2080;
    v16 = "_ACSIntrospect";
    v17 = 2112;
    v18 = a1;
    v19 = 2048;
    v20 = global_queue;
    v21 = 2048;
    v22 = a3;
    _os_log_impl(&dword_1D4CDC000, v9, OS_LOG_TYPE_DEFAULT, "#%08x %s(options=%@, callbackQueue=%p, callback=%p)", buf, 0x30u);
  }
  if (a3)
  {
    if (!global_queue)
      global_queue = dispatch_get_global_queue(0, 0);
    dispatch_retain(global_queue);
  }
  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v10, "tag", v8);
  xpc_dictionary_set_string(v10, "command", "introspect");
  if (a1 && CFDictionaryGetValue(a1, CFSTR("forceMiss")) == (const void *)*MEMORY[0x1E0C9AE50])
    xpc_dictionary_set_BOOL(v10, "forceMiss", 1);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 0x40000000;
  v11[2] = ___ACSIntrospect_block_invoke;
  v11[3] = &unk_1E9877FF0;
  v12 = v8;
  v11[5] = v10;
  v11[6] = "_ACSIntrospect";
  *(CFAbsoluteTime *)&v11[7] = Current;
  v11[4] = a3;
  v11[8] = global_queue;
  dispatch_async((dispatch_queue_t)qword_1ED1B39F8, v11);
}

void _ACSSetTestFlags(uint64_t a1, uint64_t a2)
{
  uint32_t v4;
  uint32_t v5;
  NSObject *v6;
  xpc_object_t v7;
  _QWORD v8[5];
  uint32_t v9;
  uint8_t buf[4];
  uint32_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (acl != -1)
    dispatch_once(&acl, &__block_literal_global_0);
  do
    v4 = arc4random();
  while (!v4);
  v5 = v4;
  v6 = qword_1ED1B39F0;
  if (os_log_type_enabled((os_log_t)qword_1ED1B39F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    v11 = v5;
    v12 = 2080;
    v13 = "_ACSSetTestFlags";
    v14 = 2048;
    v15 = a1;
    v16 = 2112;
    v17 = a2;
    _os_log_impl(&dword_1D4CDC000, v6, OS_LOG_TYPE_DEFAULT, "#%08x %s(flags=%#llx, options=%@)", buf, 0x26u);
  }
  if (os_variant_allows_internal_security_policies())
    qword_1ED1B3A08 = a1 & 0x8000000000000000;
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v7, "tag", v5);
  xpc_dictionary_set_string(v7, "command", "setTestFlags");
  xpc_dictionary_set_uint64(v7, "flags", a1 & 0x7FFFFFFFFFFFFFFFLL);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 0x40000000;
  v8[2] = ___ACSSetTestFlags_block_invoke;
  v8[3] = &__block_descriptor_tmp_149;
  v9 = v5;
  v8[4] = v7;
  dispatch_async((dispatch_queue_t)qword_1ED1B39F8, v8);
}

dispatch_queue_t __aclInit_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  NSObject *v2;
  dispatch_queue_t result;

  qword_1ED1B39F0 = (uint64_t)os_log_create("com.apple.AssetCacheServices", "Framework");
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = dispatch_queue_create("AssetCacheLocator.connectionQueue", v0);
  qword_1ED1B3A00 = 0;
  qword_1ED1B3A08 = 0;
  qword_1ED1B39F8 = (uint64_t)v1;
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("AssetCacheLocator.lastResultsQueue", v2);
  qword_1ED1B3A10 = (uint64_t)result;
  return result;
}

BOOL aclIsReservedQueryParameter(CFStringRef originalString)
{
  const __CFString *v1;
  const __CFString *v2;
  _BOOL8 v3;

  v1 = CFURLCreateStringByReplacingPercentEscapes(0, originalString, &stru_1E9878D50);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = CFStringCompare(v1, CFSTR("source"), 0) == kCFCompareEqualTo
    || CFStringHasPrefix(v2, CFSTR("source="))
    || CFStringCompare(v2, CFSTR("sourceScheme"), 0) == kCFCompareEqualTo
    || CFStringHasPrefix(v2, CFSTR("sourceScheme=")) != 0;
  CFRelease(v2);
  return v3;
}

CFTypeRef __aclLocateCommon_block_invoke(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  CFTypeRef result;

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = qword_1ED1B3A18;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = qword_1ED1B3A20;
  v2 = *(const void **)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v2)
    CFRetain(v2);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = byte_1ED1B3A28;
  *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = dword_1ED1B3A2C;
  *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = qword_1ED1B3A30;
  v3 = *(const void **)(*(_QWORD *)(a1[8] + 8) + 24);
  if (v3)
    CFRetain(v3);
  *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = qword_1ED1B3A38;
  result = *(CFTypeRef *)(*(_QWORD *)(a1[9] + 8) + 24);
  if (result)
    return CFRetain(result);
  return result;
}

void __aclLocateCommon_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  _xpc_connection_s *SharedLocatorConnection;
  _xpc_connection_s *v11;
  NSObject *v12;
  NSObject *v13;
  double v14;
  const char *v15;
  NSObject *v16;
  dispatch_semaphore_t v17;
  void *v18;
  NSObject *global_queue;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  double v25;
  dispatch_time_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CFErrorRef v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CFErrorRef v36;
  char v37;
  _QWORD block[6];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  _QWORD handler[14];
  char v44;
  _QWORD v45[3];
  char v46;
  CFErrorRef v47;
  _QWORD v48[2];
  void (*v49)(uint64_t, const void *);
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;

  v9 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 0x40000000;
  v49 = __aclLocateCommon_block_invoke_3;
  v50 = &unk_1E9878080;
  v52 = *(_QWORD *)(a1 + 40);
  v53 = *(_QWORD *)(a1 + 48);
  v55 = *(_BYTE *)(a1 + 88);
  v54 = *(_QWORD *)(a1 + 80);
  v51 = *(_QWORD *)(a1 + 32);
  v47 = 0;
  SharedLocatorConnection = aclGetSharedLocatorConnection(v54, &v47, a3, a4, a5, a6, a7, a8);
  if (!SharedLocatorConnection)
  {
    xpc_release(*(xpc_object_t *)(a1 + 56));
    v49((uint64_t)v48, v47);
    return;
  }
  v11 = SharedLocatorConnection;
  xpc_retain(SharedLocatorConnection);
  v12 = 0;
  v13 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2000000000;
  v46 = 0;
  v14 = *(double *)(a1 + 64);
  if (v14 >= 0.0)
  {
    v15 = *(const char **)(a1 + 72);
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = dispatch_queue_create(v15, v16);
    v17 = dispatch_semaphore_create(0);
    v12 = v17;
    if (!v13 || !v17)
    {
      if (v13)
        dispatch_release(v13);
      if (v12)
        dispatch_release(v12);
      xpc_release(v11);
      xpc_release(*(xpc_object_t *)(a1 + 56));
      v36 = aclErrorCreate(*(unsigned int *)(a1 + 80), (const __CFString *)*MEMORY[0x1E0C9AFD0], 12, CFSTR("dispatch_queue/semaphore_create failed"), v32, v33, v34, v35, v37);
      v49((uint64_t)v48, v36);
      goto LABEL_23;
    }
    dispatch_retain(v13);
    dispatch_retain(v12);
    xpc_retain(v11);
    v14 = *(double *)(a1 + 64);
  }
  v18 = *(void **)(a1 + 56);
  global_queue = dispatch_get_global_queue(0, 0);
  handler[0] = v9;
  handler[1] = 0x40000000;
  handler[2] = __aclLocateCommon_block_invoke_4;
  handler[3] = &unk_1E98780D0;
  *(double *)&handler[6] = v14;
  handler[7] = v13;
  handler[8] = v12;
  handler[9] = *(_QWORD *)(a1 + 72);
  handler[10] = *(_QWORD *)(a1 + 40);
  v20 = *(_QWORD *)(a1 + 48);
  v44 = *(_BYTE *)(a1 + 88);
  handler[13] = *(_QWORD *)(a1 + 80);
  handler[4] = *(_QWORD *)(a1 + 32);
  handler[5] = v45;
  handler[11] = v20;
  handler[12] = v11;
  xpc_connection_send_message_with_reply(v11, v18, global_queue, handler);
  xpc_release(*(xpc_object_t *)(a1 + 56));
  v21 = *(double *)(a1 + 64);
  if (v21 >= 0.0)
  {
    v22 = v21 - (CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 40));
    v23 = v22 * 1000000000.0;
    v24 = v22 < 0.0;
    v25 = 0.0;
    if (!v24)
      v25 = v23;
    v26 = dispatch_time(0, (uint64_t)v25);
    if (!v12)
      __aclLocateCommon_block_invoke_2_cold_1();
    if (dispatch_semaphore_wait(v12, v26))
    {
      v39 = 0;
      v40 = &v39;
      v41 = 0x2000000000;
      v42 = 0;
      block[0] = v9;
      block[1] = 0x40000000;
      block[2] = __aclLocateCommon_block_invoke_2_197;
      block[3] = &unk_1E98780F8;
      block[4] = &v39;
      block[5] = v45;
      dispatch_sync(v13, block);
      if (!*((_BYTE *)v40 + 24))
      {
        xpc_connection_cancel(v11);
        if (v11 == (_xpc_connection_s *)qword_1ED1B3A00)
        {
          xpc_release(v11);
          qword_1ED1B3A00 = 0;
        }
        v31 = aclErrorCreate(*(unsigned int *)(a1 + 80), (const __CFString *)*MEMORY[0x1E0C9AFD0], 60, CFSTR("timed out waiting for reply from XPC service %s"), v27, v28, v29, v30, (char)"com.apple.AssetCacheLocatorService");
        v49((uint64_t)v48, v31);
      }
      _Block_object_dispose(&v39, 8);
    }
    xpc_release(v11);
    dispatch_release(v13);
    dispatch_release(v12);
  }
LABEL_23:
  _Block_object_dispose(v45, 8);
}

void __aclLocateCommon_block_invoke_3(uint64_t a1, const void *a2)
{
  CFAbsoluteTime Current;
  CFDateRef v5;
  const CFDictionaryKeyCallBacks *v6;
  const CFDictionaryValueCallBacks *v7;
  CFDictionaryRef v8;
  CFDictionaryRef v9;
  CFArrayRef v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  int v14;
  const void *v15;
  uint64_t v16;
  _QWORD block[8];
  int v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  keys[0] = CFSTR("validUntil");
  Current = CFAbsoluteTimeGetCurrent();
  v5 = CFDateCreate(0, Current + 300.0);
  values = v5;
  v6 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v7 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  v8 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFRelease(v5);
  v22 = CFSTR("advice");
  v21 = v8;
  v9 = CFDictionaryCreate(0, (const void **)&v22, (const void **)&v21, 1, v6, v7);
  CFRelease(v8);
  v20 = v9;
  v10 = CFArrayCreate(0, (const void **)&v20, 1, MEMORY[0x1E0C9B378]);
  CFRelease(v9);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(_BYTE *)(a1 + 64);
  v14 = *(_DWORD *)(a1 + 60);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __aclSaveLocateResult_block_invoke;
  block[3] = &__block_descriptor_tmp_205;
  block[4] = v11;
  v19 = v13;
  v18 = v14;
  block[5] = v12;
  block[6] = v10;
  block[7] = a2;
  dispatch_sync((dispatch_queue_t)qword_1ED1B3A10, block);
  v15 = *(const void **)(a1 + 48);
  if (v15)
    CFRelease(v15);
  v16 = *(_QWORD *)(a1 + 32);
  if (v16)
    (*(void (**)(uint64_t, const __CFString *, CFArrayRef, const void *))(v16 + 16))(v16, CFSTR("new"), v10, a2);
  if (a2)
    CFRelease(a2);
  if (v10)
    CFRelease(v10);
}

void __aclLocateCommon_block_invoke_4(uint64_t a1, __CFString *a2)
{
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  xpc_object_t array;
  void *v14;
  size_t count;
  CFMutableArrayRef Mutable;
  const __CFArray *v17;
  uint64_t v18;
  CFIndex v19;
  CFIndex v20;
  CFIndex v21;
  double v22;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *Value;
  double v25;
  double v26;
  uint64_t v28;
  __CFArray *v29;
  char v30;
  int v31;
  CFErrorRef v32;
  char v33;
  int v34;
  const __CFString *v35;
  const __CFString *v36;
  uint64_t v37;
  const __CFString *v38;
  int v39;
  CFErrorRef v40;
  const void *v41;
  uint64_t v42;
  _QWORD block[6];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint64_t applier;
  _BYTE v49[32];
  CFMutableArrayRef v50;
  const __CFArray *v51;
  uint64_t v52;
  int v53;
  char v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  v45 = &v44;
  v46 = 0x2000000000;
  v47 = 0;
  if (*(double *)(a1 + 48) >= 0.0)
  {
    v4 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = __aclLocateCommon_block_invoke_5;
    block[3] = &unk_1E98780A8;
    v5 = *(_QWORD *)(a1 + 40);
    block[4] = &v44;
    block[5] = v5;
    dispatch_sync(v4, block);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
  }
  v6 = qword_1ED1B39F0;
  if (os_log_type_enabled((os_log_t)qword_1ED1B39F0, OS_LOG_TYPE_DEBUG))
  {
    v34 = *(_DWORD *)(a1 + 104);
    v35 = CFSTR("XPC_ERROR_CONNECTION_INTERRUPTED");
    v36 = CFSTR("XPC_ERROR_CONNECTION_INVALID");
    v37 = *(_QWORD *)(a1 + 72);
    if (a2 == (__CFString *)MEMORY[0x1E0C81288])
      v38 = CFSTR("XPC_ERROR_TERMINATION_IMMINENT");
    else
      v38 = a2;
    if (a2 != (__CFString *)MEMORY[0x1E0C81260])
      v36 = v38;
    v39 = *((unsigned __int8 *)v45 + 24);
    if (a2 != (__CFString *)MEMORY[0x1E0C81258])
      v35 = v36;
    LODWORD(applier) = 67109890;
    HIDWORD(applier) = v34;
    *(_WORD *)v49 = 2080;
    *(_QWORD *)&v49[2] = v37;
    *(_WORD *)&v49[10] = 2112;
    *(_QWORD *)&v49[12] = v35;
    *(_WORD *)&v49[20] = 1024;
    *(_DWORD *)&v49[22] = v39;
    _os_log_debug_impl(&dword_1D4CDC000, v6, OS_LOG_TYPE_DEBUG, "#%08x %s reply callback(object=%@) calledback=%{BOOL}d", (uint8_t *)&applier, 0x22u);
  }
  if (!*((_BYTE *)v45 + 24))
  {
    if (MEMORY[0x1D8267440](a2) == MEMORY[0x1E0C812F8])
    {
      v11 = xpc_dictionary_get_double(a2, "validityInterval");
      if (v11 >= 5.0)
        v12 = v11;
      else
        v12 = 5.0;
      array = xpc_dictionary_get_array(a2, "servers");
      if (array)
      {
        v14 = array;
        count = xpc_array_get_count(array);
        Mutable = CFArrayCreateMutable(0, count, MEMORY[0x1E0C9B378]);
        if (Mutable)
        {
          v17 = Mutable;
          v18 = MEMORY[0x1E0C809B0];
          applier = MEMORY[0x1E0C809B0];
          *(_QWORD *)v49 = 0x40000000;
          *(_QWORD *)&v49[8] = __aclResultsCreateFromXPC_block_invoke;
          *(_QWORD *)&v49[16] = &__block_descriptor_tmp_216;
          *(double *)&v49[24] = v12;
          v50 = Mutable;
          xpc_array_apply(v14, &applier);
          v19 = CFArrayGetCount(v17);
          if (v19 >= 1)
          {
            v20 = v19;
            v21 = 0;
            v22 = 0.0;
            do
            {
              ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v17, v21);
              Value = (const __CFDictionary *)CFDictionaryGetValue(ValueAtIndex, CFSTR("advice"));
              if (Value && CFDictionaryGetValue(Value, CFSTR("validUntil")))
              {
                v25 = MEMORY[0x1D8266C9C]();
                v26 = v25 - CFAbsoluteTimeGetCurrent();
                if (v22 > v26 || v21 == 0)
                  v22 = v26;
              }
              ++v21;
            }
            while (v20 != v21);
            if (v22 >= 5.0)
            {
              v28 = *(_QWORD *)(a1 + 80);
              v29 = *(__CFArray **)(a1 + 88);
              v30 = *(_BYTE *)(a1 + 112);
              v31 = *(_DWORD *)(a1 + 108);
              applier = v18;
              *(_QWORD *)v49 = 0x40000000;
              *(_QWORD *)&v49[8] = __aclSaveLocateResult_block_invoke;
              *(_QWORD *)&v49[16] = &__block_descriptor_tmp_205;
              *(_QWORD *)&v49[24] = v28;
              v54 = v30;
              v53 = v31;
              v50 = v29;
              v51 = v17;
              v52 = 0;
              dispatch_sync((dispatch_queue_t)qword_1ED1B3A10, &applier);
            }
          }
          v32 = 0;
          v33 = 0;
          goto LABEL_35;
        }
      }
      v40 = aclErrorCreateFromXPC(*(unsigned int *)(a1 + 104), a2);
    }
    else
    {
      v40 = aclErrorCreate(*(unsigned int *)(a1 + 104), (const __CFString *)*MEMORY[0x1E0C9AFD0], 100, CFSTR("unexpected reply from XPC service %s: %@"), v7, v8, v9, v10, (char)"com.apple.AssetCacheLocatorService");
    }
    v32 = v40;
    v17 = 0;
    v33 = 1;
LABEL_35:
    v41 = *(const void **)(a1 + 88);
    if (v41)
      CFRelease(v41);
    v42 = *(_QWORD *)(a1 + 32);
    if (v42)
      (*(void (**)(uint64_t, const __CFString *, const __CFArray *, CFErrorRef))(v42 + 16))(v42, CFSTR("new"), v17, v32);
    if (v32)
      CFRelease(v32);
    if ((v33 & 1) == 0)
      CFRelease(v17);
  }
  xpc_release(*(xpc_object_t *)(a1 + 96));
  if (*(double *)(a1 + 48) >= 0.0)
  {
    dispatch_release(*(dispatch_object_t *)(a1 + 56));
    dispatch_release(*(dispatch_object_t *)(a1 + 64));
  }
  _Block_object_dispose(&v44, 8);
}

uint64_t __aclLocateCommon_block_invoke_5(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8)
                                                                            + 24);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __aclLocateCommon_block_invoke_2_197(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8)
                                                                            + 24);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  return result;
}

double *__aclSaveLocateResult_block_invoke(double *result)
{
  double v1;
  double *v3;
  const void *v4;
  const void *v5;

  v1 = result[4];
  if (v1 == 0.0 || v1 > *(double *)&qword_1ED1B3A18)
  {
    v3 = result;
    qword_1ED1B3A18 = *((_QWORD *)result + 4);
    if (qword_1ED1B3A20)
      CFRelease((CFTypeRef)qword_1ED1B3A20);
    v4 = (const void *)*((_QWORD *)v3 + 5);
    qword_1ED1B3A20 = (uint64_t)v4;
    if (v4)
      CFRetain(v4);
    byte_1ED1B3A28 = *((_BYTE *)v3 + 68);
    dword_1ED1B3A2C = *((_DWORD *)v3 + 16);
    if (qword_1ED1B3A30)
      CFRelease((CFTypeRef)qword_1ED1B3A30);
    v5 = (const void *)*((_QWORD *)v3 + 6);
    qword_1ED1B3A30 = (uint64_t)v5;
    if (v5)
      CFRetain(v5);
    if (qword_1ED1B3A38)
      CFRelease((CFTypeRef)qword_1ED1B3A38);
    result = (double *)*((_QWORD *)v3 + 7);
    qword_1ED1B3A38 = (uint64_t)result;
    if (result)
      return (double *)CFRetain(result);
  }
  return result;
}

uint64_t __aclResultsCreateFromXPC_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  const char *string;
  const char *v7;
  double v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  double v12;
  CFNumberRef v13;
  CFAbsoluteTime Current;
  CFDateRef v15;
  CFDateRef v16;
  void *v17;
  void *v18;
  void *v19;
  CFDictionaryRef v20;
  CFStringRef v21;
  CFStringRef v22;
  CFNumberRef v23;
  CFNumberRef v24;
  void *v25;
  void *v26;
  CFDictionaryRef v27;
  int int64;
  double valuePtr;
  void *v30[6];
  void *v31[2];
  __int128 v32;
  __int128 v33;
  void *values[3];
  void *keys[6];

  keys[3] = *(void **)MEMORY[0x1E0C80C00];
  if (MEMORY[0x1D8267440](a3) == MEMORY[0x1E0C812F8])
  {
    string = xpc_dictionary_get_string(a3, "hostport");
    v7 = xpc_dictionary_get_string(a3, "guid");
    v8 = xpc_dictionary_get_double(a3, "timeout");
    if (v8 < 0.2)
      v8 = 1.0;
    valuePtr = v8;
    v9 = xpc_dictionary_get_BOOL(a3, "healthy");
    v10 = xpc_dictionary_get_BOOL(a3, "favored");
    v11 = xpc_dictionary_get_BOOL(a3, "supportsUrgency");
    v12 = xpc_dictionary_get_double(a3, "validityInterval");
    if (v12 < 5.0)
      v12 = 5.0;
    int64 = xpc_dictionary_get_int64(a3, "rank");
    if (string && *string && v7 && *v7)
    {
      *(_OWORD *)keys = xmmword_1E9878160;
      keys[2] = CFSTR("validUntil");
      v13 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
      Current = CFAbsoluteTimeGetCurrent();
      v15 = CFDateCreate(0, v12 + Current);
      v16 = v15;
      v17 = (void *)*MEMORY[0x1E0C9AE50];
      v18 = (void *)*MEMORY[0x1E0C9AE40];
      if (v11)
        v19 = (void *)*MEMORY[0x1E0C9AE50];
      else
        v19 = (void *)*MEMORY[0x1E0C9AE40];
      values[0] = v13;
      values[1] = v19;
      values[2] = v15;
      v20 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      CFRelease(v16);
      CFRelease(v13);
      *(_OWORD *)v31 = xmmword_1E9878178;
      v32 = *(_OWORD *)&off_1E9878188;
      v33 = xmmword_1E9878198;
      v21 = CFStringCreateWithCString(0, v7, 0x8000100u);
      v22 = CFStringCreateWithCString(0, string, 0x8000100u);
      v23 = CFNumberCreate(0, kCFNumberIntType, &int64);
      v24 = v23;
      if (v10)
        v25 = v17;
      else
        v25 = v18;
      v30[0] = v20;
      v30[1] = v25;
      if (v9)
        v26 = v17;
      else
        v26 = v18;
      v30[2] = (void *)v21;
      v30[3] = v26;
      v30[4] = (void *)v22;
      v30[5] = v23;
      v27 = CFDictionaryCreate(0, (const void **)v31, (const void **)v30, 6, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      CFRelease(v24);
      CFRelease(v22);
      CFRelease(v21);
      CFRelease(v20);
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), v27);
      CFRelease(v27);
    }
  }
  return 1;
}

void __aclGetSharedLocatorConnection_block_invoke(uint64_t a1, xpc_object_t object)
{
  _QWORD block[4];
  __int128 v5;
  xpc_object_t v6;

  xpc_retain(object);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __aclGetSharedLocatorConnection_block_invoke_2;
  block[3] = &__block_descriptor_tmp_217;
  v5 = *(_OWORD *)(a1 + 32);
  v6 = object;
  dispatch_async((dispatch_queue_t)qword_1ED1B39F8, block);
}

void __aclGetSharedLocatorConnection_block_invoke_2(uint64_t a1)
{
  _xpc_connection_s *v2;
  NSObject *v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_xpc_connection_s **)(a1 + 32);
  if (v2 == **(_xpc_connection_s ***)(a1 + 40))
  {
    v3 = qword_1ED1B39F0;
    if (os_log_type_enabled((os_log_t)qword_1ED1B39F0, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 48);
      v5 = CFSTR("XPC_ERROR_CONNECTION_INVALID");
      if (v4 == MEMORY[0x1E0C81288])
        v6 = CFSTR("XPC_ERROR_TERMINATION_IMMINENT");
      else
        v6 = *(const __CFString **)(a1 + 48);
      if (v4 != MEMORY[0x1E0C81260])
        v5 = v6;
      if (v4 == MEMORY[0x1E0C81258])
        v7 = CFSTR("XPC_ERROR_CONNECTION_INTERRUPTED");
      else
        v7 = v5;
      v8[0] = 67109634;
      v8[1] = 0;
      v9 = 2080;
      v10 = "com.apple.AssetCacheLocatorService";
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1D4CDC000, v3, OS_LOG_TYPE_INFO, "#%08x event from XPC service %s: %@", (uint8_t *)v8, 0x1Cu);
      v2 = **(_xpc_connection_s ***)(a1 + 40);
    }
    xpc_connection_cancel(v2);
    xpc_release(**(xpc_object_t **)(a1 + 40));
    **(_QWORD **)(a1 + 40) = 0;
  }
  xpc_release(*(xpc_object_t *)(a1 + 48));
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x1Cu);
}

void __getSZExtractorClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *StreamingZipLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ACSURLSession.m"), 9, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSZExtractorClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSZExtractorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ACSURLSession.m"), 10, CFSTR("Unable to find class %s"), "SZExtractor");

  __break(1u);
}

void __aclLocateCommon_block_invoke_2_cold_1()
{
  __assert_rtn("aclLocateCommon_block_invoke", "AssetCacheLocator.c", 1026, "replySema != NULL");
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98648](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1E0C98660](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1E0C98670](err);
}

CFFileDescriptorRef CFFileDescriptorCreate(CFAllocatorRef allocator, CFFileDescriptorNativeDescriptor fd, Boolean closeOnInvalidate, CFFileDescriptorCallBack callout, const CFFileDescriptorContext *context)
{
  return (CFFileDescriptorRef)MEMORY[0x1E0C98688](allocator, *(_QWORD *)&fd, closeOnInvalidate, callout, context);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1E0C98720](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
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

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1E0C98F58](alloc, theString, separatorString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1E0C99020](alloc, formatOptions, format, arguments);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99050](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

CFStringRef CFURLCopyHostName(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C992F0](anURL);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C99318](anURL);
}

CFStringRef CFURLCopyQueryString(CFURLRef anURL, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1E0C99328](anURL, charactersToLeaveEscaped);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C99348](anURL);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C993F8](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(_QWORD *)&encoding);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1E0C99400](allocator, originalString, charactersToLeaveEscaped);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99448](allocator, URLString, baseURL);
}

SInt32 CFURLGetPortNumber(CFURLRef anURL)
{
  return MEMORY[0x1E0C99498](anURL);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C994A0](anURL);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
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

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1E0C83968](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1E0C83970](*(_QWORD *)&a1, a2, a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

int pause(void)
{
  return MEMORY[0x1E0C84AE0]();
}

int raise(int a1)
{
  return MEMORY[0x1E0C84FA8](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
  MEMORY[0x1E0C85ED8](xarray, index, value);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
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

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86248](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x1E0C86298](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
  MEMORY[0x1E0C86358](xdict, key, *(_QWORD *)&fd);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

