void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x26u);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void OUTLINED_FUNCTION_24(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Cu);
}

void sub_2330C4098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2330C4F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t CMIOLog()
{
  if (CMIOLog::once != -1)
    dispatch_once(&CMIOLog::once, &__block_literal_global_13);
  return CMIOLog::cmioLog;
}

const char *CMIOFilename(const char *a1)
{
  size_t i;

  for (i = strlen(a1); i; --i)
  {
    if (a1[i - 1] == 47)
      break;
  }
  return &a1[i];
}

uint64_t getSTExecutableIdentityResolverClass()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3052000000;
  v6 = __Block_byref_object_copy_;
  v7 = __Block_byref_object_dispose_;
  v0 = getSTExecutableIdentityResolverClass_softClass;
  v8 = getSTExecutableIdentityResolverClass_softClass;
  if (!getSTExecutableIdentityResolverClass_softClass)
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __getSTExecutableIdentityResolverClass_block_invoke;
    v2[3] = &unk_250457AA0;
    v2[4] = &v3;
    __getSTExecutableIdentityResolverClass_block_invoke((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2330C50A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2330C7838(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,const __CFString *a22)
{
  NSObject *v22;
  void *v23;
  uint64_t v24;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    v22 = CMIOLog();
    if (v22 && os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      -[CMIOExtensionStream clientQueue_updateMutableStreamPropertiesByPolicy].cold.1();
    }
    v23 = (void *)MEMORY[0x24BDD1540];
    a21 = *MEMORY[0x24BDD0FC8];
    a22 = CFSTR("exception");
    v24 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &a22, &a21, 1);
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -8, v24);
    objc_end_catch();
    JUMPOUT(0x2330C74F0);
  }
  _Unwind_Resume(exception_object);
}

void sub_2330C7DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2330C9504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2330CCB5C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_2330CD374(_Unwind_Exception *exc_buf, int a2)
{
  NSObject *v2;

  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    v2 = CMIOLog();
    if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __47__CMIOExtensionProvider_removeProviderContext___block_invoke_cold_1();
    }
    objc_end_catch();
    JUMPOUT(0x2330CD234);
  }
  _Unwind_Resume(exc_buf);
}

void sub_2330CD3D0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_2330CE03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_2330CEC74(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42)
{
  uint64_t v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;

  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    v43 = CMIOLog();
    if (v43 && os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __55__CMIOExtensionProvider_pluginStatesForClientID_reply___block_invoke_cold_2();
    }
    v44 = (void *)MEMORY[0x24BDD1540];
    *(_QWORD *)(v42 - 224) = *MEMORY[0x24BDD0FC8];
    *(_QWORD *)(v42 - 216) = CFSTR("exception");
    v45 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42 - 216, v42 - 224, 1);
    objc_msgSend(v44, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -8, v45);
    objc_end_catch();
    JUMPOUT(0x2330CE5D4);
  }
  _Unwind_Resume(exc_buf);
}

void sub_2330CED34(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_2330CEF88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, const __CFString *a12, char a13)
{
  NSObject *v13;
  void *v14;
  uint64_t v15;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      -[CMIOExtensionProvider _addAvailablePropertyStatesForDevice:toDictionary:].cold.2();
    }
    v14 = (void *)MEMORY[0x24BDD1540];
    a11 = *MEMORY[0x24BDD0FC8];
    a12 = CFSTR("exception");
    v15 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &a12, &a11, 1);
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -8, v15);
    objc_end_catch();
    JUMPOUT(0x2330CEE80);
  }
  _Unwind_Resume(exception_object);
}

void sub_2330CF478(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, const __CFString *a12, char a13)
{
  NSObject *v13;
  void *v14;
  uint64_t v15;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __74__CMIOExtensionProvider_pluginPropertyStatesForClientID_properties_reply___block_invoke_cold_2();
    }
    v14 = (void *)MEMORY[0x24BDD1540];
    a11 = *MEMORY[0x24BDD0FC8];
    a12 = CFSTR("exception");
    v15 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &a12, &a11, 1);
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -8, v15);
    objc_end_catch();
    JUMPOUT(0x2330CF348);
  }
  _Unwind_Resume(exception_object);
}

void sub_2330CFA20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, const __CFString *a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  NSObject *v25;
  void *v26;
  uint64_t v27;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    v25 = CMIOLog();
    if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __81__CMIOExtensionProvider_setPluginPropertyValuesForClientID_propertyValues_reply___block_invoke_cold_3();
    }
    v26 = (void *)MEMORY[0x24BDD1540];
    a17 = *MEMORY[0x24BDD0FC8];
    a18 = CFSTR("exception");
    v27 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &a18, &a17, 1);
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -8, v27);
    objc_end_catch();
    JUMPOUT(0x2330CF7A4);
  }
  _Unwind_Resume(exception_object);
}

void sub_2330D06FC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_2330D0710(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;

  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    v29 = CMIOLog();
    if (v29 && os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __64__CMIOExtensionProvider_deviceStatesForClientID_deviceID_reply___block_invoke_cold_3();
    }
    v30 = (void *)MEMORY[0x24BDD1540];
    *(_QWORD *)(v28 - 240) = *MEMORY[0x24BDD0FC8];
    *(_QWORD *)(v28 - 232) = CFSTR("exception");
    v31 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28 - 232, v28 - 240, 1);
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -8, v31);
    objc_end_catch();
    JUMPOUT(0x2330D00ECLL);
  }
  _Unwind_Resume(exc_buf);
}

void sub_2330D0CBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, const __CFString *a12, char a13)
{
  NSObject *v13;
  void *v14;
  uint64_t v15;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __83__CMIOExtensionProvider_devicePropertyStatesForClientID_deviceID_properties_reply___block_invoke_cold_3();
    }
    v14 = (void *)MEMORY[0x24BDD1540];
    a11 = *MEMORY[0x24BDD0FC8];
    a12 = CFSTR("exception");
    v15 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &a12, &a11, 1);
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -8, v15);
    objc_end_catch();
    JUMPOUT(0x2330D0B8CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_2330D16B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  NSObject *v25;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    v25 = CMIOLog();
    if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_cold_4();
    }
    objc_end_catch();
    JUMPOUT(0x2330D12D0);
  }
  _Unwind_Resume(exception_object);
}

void sub_2330D1F80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, const __CFString *a12, char a13)
{
  NSObject *v13;
  void *v14;
  uint64_t v15;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __83__CMIOExtensionProvider_streamPropertyStatesForClientID_streamID_properties_reply___block_invoke_cold_3();
    }
    v14 = (void *)MEMORY[0x24BDD1540];
    a11 = *MEMORY[0x24BDD0FC8];
    a12 = CFSTR("exception");
    v15 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &a12, &a11, 1);
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -8, v15);
    objc_end_catch();
    JUMPOUT(0x2330D1E50);
  }
  _Unwind_Resume(exception_object);
}

void sub_2330D2788(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, const __CFString *a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  NSObject *v25;
  void *v26;
  uint64_t v27;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    v25 = CMIOLog();
    if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_cold_5();
    }
    v26 = (void *)MEMORY[0x24BDD1540];
    a17 = *MEMORY[0x24BDD0FC8];
    a18 = CFSTR("exception");
    v27 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &a18, &a17, 1);
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -8, v27);
    objc_end_catch();
    JUMPOUT(0x2330D2334);
  }
  _Unwind_Resume(exception_object);
}

void sub_2330D36D4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_2330D3EA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, const __CFString *a12, char a13)
{
  NSObject *v13;
  void *v14;
  uint64_t v15;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      -[CMIOExtensionProvider _clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:].cold.3();
    }
    v14 = (void *)MEMORY[0x24BDD1540];
    a11 = *MEMORY[0x24BDD0FC8];
    a12 = CFSTR("exception");
    v15 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &a12, &a11, 1);
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -8, v15);
    objc_end_catch();
    JUMPOUT(0x2330D3E58);
  }
  _Unwind_Resume(exception_object);
}

void sub_2330D4308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

Class __getSTExecutableIdentityResolverClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SystemStatusServerLibraryCore_frameworkLibrary)
  {
    SystemStatusServerLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SystemStatusServerLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("STExecutableIdentityResolver");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
      break;
LABEL_6:
    v3 = (void *)__getSTExecutableIdentityResolverClass_block_invoke_cold_1();
    free(v3);
  }
  getSTExecutableIdentityResolverClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

Class __getSTExecutableIdentityClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SystemStatusLibraryCore_frameworkLibrary)
  {
    SystemStatusLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SystemStatusLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("STExecutableIdentity");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
      break;
LABEL_6:
    v3 = (void *)__getSTExecutableIdentityClass_block_invoke_cold_1();
    free(v3);
  }
  getSTExecutableIdentityClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t OUTLINED_FUNCTION_5(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(_QWORD *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 1024;
  return result;
}

void OUTLINED_FUNCTION_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(a3 + 20) = v3;
  *(_WORD *)(a3 + 28) = 2112;
  *(_QWORD *)(a3 + 30) = a2;
}

void OUTLINED_FUNCTION_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;

  *(_DWORD *)(a3 + 14) = v3;
  *(_WORD *)(a3 + 18) = 2080;
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x30u);
}

void OUTLINED_FUNCTION_23(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x28u);
}

uint64_t OUTLINED_FUNCTION_26()
{
  void *v0;

  return objc_msgSend(v0, "deviceID");
}

uint64_t OUTLINED_FUNCTION_27()
{
  void *v0;

  return objc_msgSend(v0, "clientInfo");
}

BOOL CMIOExtensionPropertyIs4CCProperty(void *a1)
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("4cc_")) && objc_msgSend(a1, "length") == 18;
}

unint64_t CMIOExtensionPropertyAddressFromProperty(void *a1)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;

  if (objc_msgSend(a1, "hasPrefix:", CFSTR("4cc_")) && objc_msgSend(a1, "length") == 18)
  {
    v2 = objc_msgSend(a1, "UTF8String");
    v3 = *(char *)(v2 + 7) | (*(char *)(v2 + 6) << 8) | (*(char *)(v2 + 5) << 16) | (*(unsigned __int8 *)(v2 + 4) << 24);
    if (v3 == 808464432)
      v3 = 0;
    LODWORD(v4) = *(char *)(v2 + 12) | (*(char *)(v2 + 11) << 8) | (*(char *)(v2 + 10) << 16) | (*(unsigned __int8 *)(v2 + 9) << 24);
    if ((_DWORD)v4 == 808464432)
      v4 = 0;
    else
      v4 = v4;
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return v3 | (unint64_t)(v4 << 32);
}

uint64_t CMIOExtensionPropertyFromPropertyAddress(unint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unsigned int v3;

  if (a2 + 1 <= 3)
    a2 = dword_233109580[a2 + 1];
  v2 = HIDWORD(a1);
  if (!HIDWORD(a1))
    LODWORD(v2) = 808464432;
  if ((_DWORD)a1)
    v3 = a1;
  else
    v3 = 808464432;
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("4cc_%c%c%c%c_%c%c%c%c_%c%c%c%c"), HIBYTE(v3), BYTE2(v3), BYTE1(v3), v3, BYTE3(v2), BYTE2(v2), BYTE1(v2), v2, HIBYTE(a2), BYTE2(a2), BYTE1(a2), a2);
}

uint64_t CMIOExtensionPropertyForPropertyAddressInDictionary(unint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[9];
  unsigned int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;

  if (objc_msgSend(a3, "count"))
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3052000000;
    v20 = __Block_byref_object_copy__0;
    v21 = __Block_byref_object_dispose__0;
    v22 = 0;
    v6 = CMIOExtensionPropertyFromPropertyAddress(a1, a2);
    v18[5] = v6;
    if (!objc_msgSend(a3, "objectForKey:", v6))
    {
      v9 = CMIOExtensionPropertyFromPropertyAddress(a1 | 0x2A2A2A2A00000000, 0xFFFFFFFF);
      v18[5] = v9;
      v10 = objc_msgSend(a3, "objectForKey:", v9);
      v7 = v18 + 5;
      if (v10)
        goto LABEL_6;
      *v7 = 0;
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("4cc_%c%c%c%c_"), BYTE3(a1), BYTE2(a1), BYTE1(a1), a1);
      v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c%c%c%c_"), HIBYTE(HIDWORD(a1)), BYTE6(a1), BYTE5(a1), BYTE4(a1));
      v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c%c%c%c"), HIBYTE(a2), BYTE2(a2), BYTE1(a2), a2);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __CMIOExtensionPropertyForPropertyAddressInDictionary_block_invoke;
      v15[3] = &unk_250457D68;
      v16 = a2;
      v15[4] = v12;
      v15[5] = v13;
      v15[6] = v14;
      v15[7] = &v17;
      v15[8] = a1;
      objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v15);
    }
    v7 = v18 + 5;
LABEL_6:
    v8 = *v7;
    _Block_object_dispose(&v17, 8);
    return v8;
  }
  return 0;
}

void sub_2330D7958(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t CMIOExtensionPropertyForPropertyAddressInSet(unint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[9];
  unsigned int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;

  if (!objc_msgSend(a3, "count"))
    return 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v6 = CMIOExtensionPropertyFromPropertyAddress(a1, a2);
  v18[5] = v6;
  if (objc_msgSend(a3, "containsObject:", v6))
    goto LABEL_5;
  v7 = CMIOExtensionPropertyFromPropertyAddress(a1 | 0x2A2A2A2A00000000, 0xFFFFFFFF);
  v18[5] = v7;
  v8 = objc_msgSend(a3, "containsObject:", v7);
  v9 = v18 + 5;
  if ((v8 & 1) == 0)
  {
    *v9 = 0;
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("4cc_%c%c%c%c_"), BYTE3(a1), BYTE2(a1), BYTE1(a1), a1);
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c%c%c%c_"), HIBYTE(HIDWORD(a1)), BYTE6(a1), BYTE5(a1), BYTE4(a1));
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c%c%c%c"), HIBYTE(a2), BYTE2(a2), BYTE1(a2), a2);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __CMIOExtensionPropertyForPropertyAddressInSet_block_invoke;
    v15[3] = &unk_250457D90;
    v16 = a2;
    v15[4] = v10;
    v15[5] = v11;
    v15[6] = v12;
    v15[7] = &v17;
    v15[8] = a1;
    objc_msgSend(a3, "enumerateObjectsUsingBlock:", v15);
LABEL_5:
    v9 = v18 + 5;
  }
  v13 = *v9;
  _Block_object_dispose(&v17, 8);
  return v13;
}

void sub_2330D7C40(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

BOOL CMIOExtensionPropertyIs4CCBooleanControlProperty(void *a1)
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("4cc_"))
      && objc_msgSend(a1, "length") == 28
      && !objc_msgSend(a1, "compare:options:range:", CFSTR("_togl_"), 0, 18, 6);
}

BOOL CMIOExtensionPropertyIs4CCSelectorControlProperty(void *a1)
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("4cc_"))
      && objc_msgSend(a1, "length") == 28
      && !objc_msgSend(a1, "compare:options:range:", CFSTR("_slct_"), 0, 18, 6);
}

BOOL CMIOExtensionPropertyIs4CCFeatureControlProperty(void *a1)
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("4cc_"))
      && objc_msgSend(a1, "length") == 28
      && !objc_msgSend(a1, "compare:options:range:", CFSTR("_ftct_"), 0, 18, 6);
}

BOOL CMIOExtensionPropertyIs4CCControlProperty(void *a1)
{
  return CMIOExtensionPropertyIs4CCBooleanControlProperty(a1)
      || CMIOExtensionPropertyIs4CCSelectorControlProperty(a1)
      || CMIOExtensionPropertyIs4CCFeatureControlProperty(a1);
}

BOOL CMIOExtensionFeatureControlFromProperty(void *a1, int *a2, int *a3, int *a4, int *a5)
{
  _BOOL8 v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;

  v10 = CMIOExtensionPropertyIs4CCFeatureControlProperty(a1);
  if (v10)
  {
    v11 = objc_msgSend(a1, "UTF8String");
    v12 = *(char *)(v11 + 7) | (*(char *)(v11 + 6) << 8) | (*(char *)(v11 + 5) << 16) | (*(unsigned __int8 *)(v11 + 4) << 24);
    if (v12 == 808464432)
      v12 = 0;
    v13 = *(char *)(v11 + 12) | (*(char *)(v11 + 11) << 8) | (*(char *)(v11 + 10) << 16) | (*(unsigned __int8 *)(v11 + 9) << 24);
    if (v13 == 808464432)
      v13 = 0;
    v14 = *(char *)(v11 + 17) | (*(char *)(v11 + 16) << 8) | (*(char *)(v11 + 15) << 16) | (*(unsigned __int8 *)(v11 + 14) << 24);
    switch(v14)
    {
      case 707406378:
        v14 = -1;
        break;
      case 808464433:
        v14 = 1;
        break;
      case 808464432:
        v14 = 0;
        break;
      case 808464434:
        v14 = 2;
        break;
    }
    v15 = *(char *)(v11 + 27) | (*(char *)(v11 + 26) << 8) | (*(char *)(v11 + 25) << 16) | (*(unsigned __int8 *)(v11 + 24) << 24);
    if (v15 == 808464432)
      v15 = 0;
    if (a2)
      *a2 = v12;
    if (a3)
      *a3 = v13;
    if (a4)
      *a4 = v14;
    if (a5)
      *a5 = v15;
  }
  return v10;
}

uint64_t CMIOExtensionPropertyFromFeatureControl(unsigned int a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;

  if (a3 + 1 >= 3)
  {
    v4 = 808464434;
    if (a3 != 2)
      v4 = a3;
  }
  else
  {
    v4 = dword_233109570[a3 + 1];
  }
  if (a2)
    v5 = a2;
  else
    v5 = 808464432;
  if (a1)
    v6 = a1;
  else
    v6 = 808464432;
  if (a4)
    v7 = a4;
  else
    v7 = 808464432;
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("4cc_%c%c%c%c_%c%c%c%c_%c%c%c%c_ftct_%c%c%c%c"), HIBYTE(v6), BYTE2(v6), BYTE1(v6), v6, HIBYTE(v5), BYTE2(v5), BYTE1(v5), v5, HIBYTE(v4), BYTE2(v4), BYTE1(v4), v4, HIBYTE(v7), BYTE2(v7), BYTE1(v7), v7);
}

BOOL CMIOExtensionControlFromProperty(void *a1, int *a2, int *a3, int *a4, int *a5, int *a6)
{
  _BOOL8 v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;

  v12 = CMIOExtensionPropertyIs4CCControlProperty(a1);
  if (v12)
  {
    v13 = objc_msgSend(a1, "UTF8String");
    v14 = *(char *)(v13 + 7) | (*(char *)(v13 + 6) << 8) | (*(char *)(v13 + 5) << 16) | (*(unsigned __int8 *)(v13 + 4) << 24);
    if (v14 == 808464432)
      v14 = 0;
    v15 = *(char *)(v13 + 12) | (*(char *)(v13 + 11) << 8) | (*(char *)(v13 + 10) << 16) | (*(unsigned __int8 *)(v13 + 9) << 24);
    if (v15 == 808464432)
      v15 = 0;
    v16 = *(char *)(v13 + 17) | (*(char *)(v13 + 16) << 8) | (*(char *)(v13 + 15) << 16) | (*(unsigned __int8 *)(v13 + 14) << 24);
    switch(v16)
    {
      case 707406378:
        v16 = -1;
        break;
      case 808464433:
        v16 = 1;
        break;
      case 808464432:
        v16 = 0;
        break;
      case 808464434:
        v16 = 2;
        break;
    }
    v17 = *(char *)(v13 + 22) | (*(char *)(v13 + 21) << 8) | (*(char *)(v13 + 20) << 16) | (*(unsigned __int8 *)(v13 + 19) << 24);
    if (v17 == 808464432)
      v17 = 0;
    v18 = *(char *)(v13 + 27) | (*(char *)(v13 + 26) << 8) | (*(char *)(v13 + 25) << 16) | (*(unsigned __int8 *)(v13 + 24) << 24);
    if (v18 == 808464432)
      v18 = 0;
    if (a3)
      *a3 = v14;
    if (a4)
      *a4 = v15;
    if (a5)
      *a5 = v16;
    if (a6)
      *a6 = v18;
    if (a2)
      *a2 = v17;
  }
  return v12;
}

uint64_t CMIOExtensionPropertyFromControl(unsigned int a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;

  if (a4 + 1 >= 3)
  {
    if (a4 == 2)
      v5 = 808464434;
    else
      v5 = a4;
  }
  else
  {
    v5 = dword_233109570[a4 + 1];
  }
  if (a3)
    v6 = a3;
  else
    v6 = 808464432;
  if (a2)
    v7 = a2;
  else
    v7 = 808464432;
  if (a5)
    v8 = a5;
  else
    v8 = 808464432;
  if (a1)
    v9 = a1;
  else
    v9 = 808464432;
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("4cc_%c%c%c%c_%c%c%c%c_%c%c%c%c_%c%c%c%c_%c%c%c%c"), HIBYTE(v7), BYTE2(v7), BYTE1(v7), v7, HIBYTE(v6), BYTE2(v6), BYTE1(v6), v6, HIBYTE(v5), BYTE2(v5), BYTE1(v5), v5, HIBYTE(v9), BYTE2(v9), BYTE1(v9), v9,
           HIBYTE(v8),
           BYTE2(v8),
           BYTE1(v8),
           v8);
}

void cmio_bbufUtilXPCObjectReleaser(xpc_object_t object)
{
  if (object)
    xpc_release(object);
}

void OUTLINED_FUNCTION_10_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x22u);
}

uint64_t CMIOFormatDescriptionGetOnlyHasIFrames(const opaqueCMFormatDescription *a1)
{
  const __CFDictionary *Extensions;
  const __CFBoolean *Value;

  if (a1
    && (Extensions = CMFormatDescriptionGetExtensions(a1)) != 0
    && (Value = (const __CFBoolean *)CFDictionaryGetValue(Extensions, (const void *)kCMIOFormatDescriptionExtensionKey_OnlyHasIFrames)) != 0)
  {
    return CFBooleanGetValue(Value);
  }
  else
  {
    return 0;
  }
}

uint64_t CMIOFormatDescriptionGetManufacturerCode(const opaqueCMFormatDescription *a1, _DWORD *a2)
{
  uint64_t result;
  UInt8 buffer[4];
  CFRange v5;

  if (!a2)
    return 4294967246;
  *a2 = 0;
  if (!a1)
    return 4294967246;
  result = (uint64_t)CMFormatDescriptionGetExtensions(a1);
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, (const void *)*MEMORY[0x24BDC0B88]);
    if (result)
    {
      *(_DWORD *)buffer = 0;
      v5.location = 0;
      v5.length = 4;
      if (CFStringGetBytes((CFStringRef)result, v5, 0, 0, 0, buffer, 4, 0) == 4)
      {
        result = 0;
        *a2 = bswap32(*(unsigned int *)buffer);
        return result;
      }
      return 4294967246;
    }
  }
  return result;
}

BOOL CMIOFormatDescriptionSignifiesDiscontinuity(CMFormatDescriptionRef desc, const opaqueCMFormatDescription *a2)
{
  _BOOL8 result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CMMediaType MediaType;
  CMMediaType v12;
  FourCharCode MediaSubType;
  CMVideoDimensions Dimensions;
  const __CFDictionary *Extensions;
  CFDictionaryRef v16;
  const __CFDictionary *v17;
  uint64_t v18;
  const void *v19;
  const void *Value;
  const void *v21;
  BOOL v22;
  _QWORD v23[13];

  result = 0;
  v23[12] = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BDC5480];
  v23[0] = *MEMORY[0x24BDC0B50];
  v23[1] = v4;
  v5 = *MEMORY[0x24BDC54E8];
  v23[2] = *MEMORY[0x24BDC54E0];
  v23[3] = v5;
  v6 = *MEMORY[0x24BDC5490];
  v23[4] = *MEMORY[0x24BDC5508];
  v23[5] = v6;
  v7 = *MEMORY[0x24BDC54F0];
  v23[6] = *MEMORY[0x24BDC5510];
  v23[7] = v7;
  v8 = *MEMORY[0x24BDC0B68];
  v23[8] = *MEMORY[0x24BDC5570];
  v23[9] = v8;
  v9 = *MEMORY[0x24BDC5418];
  v23[10] = *MEMORY[0x24BDC5420];
  v23[11] = v9;
  if (a2 && desc && desc != a2)
  {
    MediaType = CMFormatDescriptionGetMediaType(desc);
    v12 = CMFormatDescriptionGetMediaType(a2);
    if (MediaType != 1986618469 || v12 != 1986618469)
      return CMFormatDescriptionEqual(desc, a2) == 0;
    MediaSubType = CMFormatDescriptionGetMediaSubType(desc);
    if (MediaSubType != CMFormatDescriptionGetMediaSubType(a2))
      return 1;
    Dimensions = CMVideoFormatDescriptionGetDimensions(desc);
    if (Dimensions != CMVideoFormatDescriptionGetDimensions(a2))
      return 1;
    Extensions = CMFormatDescriptionGetExtensions(desc);
    v16 = CMFormatDescriptionGetExtensions(a2);
    if (Extensions == v16)
      return 0;
    v17 = v16;
    result = 1;
    if (Extensions && v17)
    {
      v18 = 0;
      while (1)
      {
        v19 = (const void *)v23[v18];
        Value = CFDictionaryGetValue(Extensions, v19);
        v21 = CFDictionaryGetValue(v17, v19);
        if (Value != v21)
        {
          v22 = !Value || v21 == 0;
          if (v22 || !CFEqual(Value, v21))
            break;
        }
        result = 0;
        if (++v18 == 12)
          return result;
      }
      return 1;
    }
  }
  return result;
}

void sub_2330E57A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_7_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x30u);
}

void OUTLINED_FUNCTION_8_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(a3 + 30) = v3;
  *(_WORD *)(a3 + 38) = 2114;
  *(_QWORD *)(a3 + 40) = a2;
}

void sub_2330E61BC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 152));
  _Unwind_Resume(a1);
}

void sub_2330E8470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  uint64_t v0;

  return xpc_connection_get_pid(*(xpc_connection_t *)(v0 + 32));
}

uint64_t cmio_XPCMessageSetCFNumber(void *a1, const char *a2, CFTypeRef cf)
{
  CFTypeID v6;
  CFTypeID v7;
  void *v8;
  void *v9;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;

  if (!cf)
    return 0;
  if (a1)
  {
    v6 = CFGetTypeID(cf);
    if (v6 == CFNumberGetTypeID() || (v7 = CFGetTypeID(cf), v7 == CFBooleanGetTypeID()))
    {
      v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      if (v8)
      {
        v9 = v8;
        xpc_dictionary_set_value(a1, a2, v8);
        xpc_release(v9);
        return 0;
      }
      v12 = CMIOLog();
      if (v12)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          cmio_XPCMessageSetCFNumber_cold_2();
      }
    }
    else
    {
      v13 = CMIOLog();
      if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        cmio_XPCMessageSetCFNumber_cold_3();
    }
  }
  else
  {
    v11 = CMIOLog();
    if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      cmio_XPCMessageSetCFNumber_cold_1();
  }
  return 0xFFFFFFFFLL;
}

uint64_t cmio_XPCMessageSetCFString(void *a1, const char *a2, CFTypeRef cf)
{
  CFTypeID v5;
  void *v6;
  void *v7;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;

  if (!cf)
    return 0;
  if (a1)
  {
    v5 = CFGetTypeID(cf);
    if (v5 == CFStringGetTypeID())
    {
      v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      if (v6)
      {
        v7 = v6;
        xpc_dictionary_set_value(a1, a2, v6);
        xpc_release(v7);
        return 0;
      }
      v11 = CMIOLog();
      if (v11)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          cmio_XPCMessageSetCFString_cold_2();
      }
    }
    else
    {
      v10 = CMIOLog();
      if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        cmio_XPCMessageSetCFString_cold_3();
    }
  }
  else
  {
    v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      cmio_XPCMessageSetCFString_cold_1();
  }
  return 0xFFFFFFFFLL;
}

uint64_t cmio_XPCMessageSetCFData(void *a1, const char *a2, CFTypeRef cf)
{
  CFTypeID v5;
  void *v6;
  void *v7;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;

  if (!cf)
    return 0;
  if (a1)
  {
    v5 = CFGetTypeID(cf);
    if (v5 == CFDataGetTypeID())
    {
      v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      if (v6)
      {
        v7 = v6;
        xpc_dictionary_set_value(a1, a2, v6);
        xpc_release(v7);
        return 0;
      }
      v11 = CMIOLog();
      if (v11)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          cmio_XPCMessageSetCFData_cold_2();
      }
    }
    else
    {
      v10 = CMIOLog();
      if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        cmio_XPCMessageSetCFData_cold_3();
    }
  }
  else
  {
    v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      cmio_XPCMessageSetCFData_cold_1();
  }
  return 0xFFFFFFFFLL;
}

uint64_t cmio_XPCMessageSetCFArray(void *a1, const char *a2, CFTypeRef cf)
{
  CFTypeID v5;
  void *v6;
  void *v7;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;

  if (!cf)
    return 0;
  if (a1)
  {
    v5 = CFGetTypeID(cf);
    if (v5 == CFArrayGetTypeID())
    {
      v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      if (v6)
      {
        v7 = v6;
        xpc_dictionary_set_value(a1, a2, v6);
        xpc_release(v7);
        return 0;
      }
      v11 = CMIOLog();
      if (v11)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          cmio_XPCMessageSetCFArray_cold_2();
      }
    }
    else
    {
      v10 = CMIOLog();
      if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        cmio_XPCMessageSetCFArray_cold_3();
    }
  }
  else
  {
    v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      cmio_XPCMessageSetCFArray_cold_1();
  }
  return 0xFFFFFFFFLL;
}

uint64_t cmio_XPCMessageSetCFDictionary(void *a1, const char *a2, CFTypeRef cf)
{
  CFTypeID v5;
  void *v6;
  void *v7;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;

  if (!cf)
    return 0;
  if (a1)
  {
    v5 = CFGetTypeID(cf);
    if (v5 == CFDictionaryGetTypeID())
    {
      v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      if (v6)
      {
        v7 = v6;
        xpc_dictionary_set_value(a1, a2, v6);
        xpc_release(v7);
        return 0;
      }
      v11 = CMIOLog();
      if (v11)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          cmio_XPCMessageSetCFDictionary_cold_2();
      }
    }
    else
    {
      v10 = CMIOLog();
      if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        cmio_XPCMessageSetCFDictionary_cold_3();
    }
  }
  else
  {
    v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      cmio_XPCMessageSetCFDictionary_cold_1();
  }
  return 0xFFFFFFFFLL;
}

uint64_t cmio_XPCMessageCopyCFNumber(void *a1, const char *a2, NSObject **a3)
{
  uint64_t result;
  NSObject *v5;
  NSObject *v6;
  CFTypeID v7;
  CFTypeID v8;
  NSObject *v9;
  NSObject *v10;

  result = (uint64_t)xpc_dictionary_get_value(a1, a2);
  if (!result)
  {
    v6 = 0;
    goto LABEL_7;
  }
  v5 = _CFXPCCreateCFObjectFromXPCObject();
  if (!v5)
  {
    v9 = CMIOLog();
    v6 = v9;
    if (!v9)
    {
LABEL_16:
      result = 0xFFFFFFFFLL;
      goto LABEL_7;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      cmio_XPCMessageCopyCFNumber_cold_1();
LABEL_15:
    v6 = 0;
    goto LABEL_16;
  }
  v6 = v5;
  v7 = CFGetTypeID(v5);
  if (v7 != CFNumberGetTypeID())
  {
    v8 = CFGetTypeID(v6);
    if (v8 != CFBooleanGetTypeID())
    {
      v10 = CMIOLog();
      if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        cmio_XPCMessageCopyCFNumber_cold_2();
      CFRelease(v6);
      goto LABEL_15;
    }
  }
  result = 0;
LABEL_7:
  *a3 = v6;
  return result;
}

uint64_t cmio_XPCMessageCopyCFString(void *a1, const char *a2, NSObject **a3)
{
  uint64_t result;
  NSObject *v5;
  NSObject *v6;
  CFTypeID v7;
  NSObject *v8;
  NSObject *v9;

  result = (uint64_t)xpc_dictionary_get_value(a1, a2);
  if (!result)
  {
    v6 = 0;
    goto LABEL_6;
  }
  v5 = _CFXPCCreateCFObjectFromXPCObject();
  if (!v5)
  {
    v8 = CMIOLog();
    v6 = v8;
    if (!v8)
    {
LABEL_15:
      result = 0xFFFFFFFFLL;
      goto LABEL_6;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      cmio_XPCMessageCopyCFString_cold_1();
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  v6 = v5;
  v7 = CFGetTypeID(v5);
  if (v7 != CFStringGetTypeID())
  {
    v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      cmio_XPCMessageCopyCFString_cold_2();
    CFRelease(v6);
    goto LABEL_14;
  }
  result = 0;
LABEL_6:
  *a3 = v6;
  return result;
}

uint64_t cmio_XPCMessageCopyCFData(void *a1, const char *a2, NSObject **a3)
{
  uint64_t result;
  NSObject *v5;
  NSObject *v6;
  CFTypeID v7;
  NSObject *v8;
  NSObject *v9;

  result = (uint64_t)xpc_dictionary_get_value(a1, a2);
  if (!result)
  {
    v6 = 0;
    goto LABEL_6;
  }
  v5 = _CFXPCCreateCFObjectFromXPCObject();
  if (!v5)
  {
    v8 = CMIOLog();
    v6 = v8;
    if (!v8)
    {
LABEL_15:
      result = 0xFFFFFFFFLL;
      goto LABEL_6;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      cmio_XPCMessageCopyCFData_cold_1();
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  v6 = v5;
  v7 = CFGetTypeID(v5);
  if (v7 != CFDataGetTypeID())
  {
    v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      cmio_XPCMessageCopyCFData_cold_2();
    CFRelease(v6);
    goto LABEL_14;
  }
  result = 0;
LABEL_6:
  *a3 = v6;
  return result;
}

uint64_t cmio_XPCMessageCopyCFArray(void *a1, const char *a2, NSObject **a3)
{
  uint64_t result;
  NSObject *v5;
  NSObject *v6;
  CFTypeID v7;
  NSObject *v8;
  NSObject *v9;

  result = (uint64_t)xpc_dictionary_get_value(a1, a2);
  if (!result)
  {
    v6 = 0;
    goto LABEL_6;
  }
  v5 = _CFXPCCreateCFObjectFromXPCObject();
  if (!v5)
  {
    v8 = CMIOLog();
    v6 = v8;
    if (!v8)
    {
LABEL_15:
      result = 0xFFFFFFFFLL;
      goto LABEL_6;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      cmio_XPCMessageCopyCFArray_cold_1();
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  v6 = v5;
  v7 = CFGetTypeID(v5);
  if (v7 != CFArrayGetTypeID())
  {
    v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      cmio_XPCMessageCopyCFArray_cold_2();
    CFRelease(v6);
    goto LABEL_14;
  }
  result = 0;
LABEL_6:
  *a3 = v6;
  return result;
}

uint64_t cmio_XPCMessageCopyCFDictionary(void *a1, const char *a2, NSObject **a3)
{
  uint64_t result;
  NSObject *v5;
  NSObject *v6;
  CFTypeID v7;
  NSObject *v8;
  NSObject *v9;

  result = (uint64_t)xpc_dictionary_get_value(a1, a2);
  if (!result)
  {
    v6 = 0;
    goto LABEL_6;
  }
  v5 = _CFXPCCreateCFObjectFromXPCObject();
  if (!v5)
  {
    v8 = CMIOLog();
    v6 = v8;
    if (!v8)
    {
LABEL_15:
      result = 0xFFFFFFFFLL;
      goto LABEL_6;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      cmio_XPCMessageCopyCFDictionary_cold_1();
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  v6 = v5;
  v7 = CFGetTypeID(v5);
  if (v7 != CFDictionaryGetTypeID())
  {
    v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      cmio_XPCMessageCopyCFDictionary_cold_2();
    CFRelease(v6);
    goto LABEL_14;
  }
  result = 0;
LABEL_6:
  *a3 = v6;
  return result;
}

uint64_t cmio_VDCAssistantDeviceUIDForUSBAssistantNSUUID(void *a1)
{
  _BYTE v2[4];
  unsigned __int16 v3;
  unsigned __int16 v4;
  unsigned __int16 v5;
  unsigned __int16 v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "getUUIDBytes:", v2);
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%016llx"), (int)(bswap32(v5) & 0xFFFF0000) | (unint64_t)(bswap32(v6) >> 16) | ((unint64_t)(bswap32(v3) >> 16) << 48) | ((unint64_t)(bswap32(v4) >> 16) << 32));
}

uint64_t cmio_getSTCameraCaptureAttributionMapKey(const __CFString *a1, const __CFString *a2)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("unknownDevice");
  if (a1)
    v2 = a1;
  v3 = CFSTR("unknownStream");
  if (a2)
    v3 = a2;
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v2, v3);
}

void sub_2330EA5BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2330EBFA0(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  NSObject *v3;

  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __62__CMIOExtensionProviderHostContext_availablePluginProperties___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2330EBF64);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2330EC58C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  NSObject *v19;

  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      v19 = CMIOLog();
      if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        -[CMIOExtensionProviderHostContext pluginStates:].cold.1();
      }
      objc_end_catch();
      JUMPOUT(0x2330EC4D4);
    }
    objc_begin_catch(exception_object);
    JUMPOUT(0x2330EC4D8);
  }
  _Unwind_Resume(exception_object);
}

void sub_2330ECCE8(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  NSObject *v3;

  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2330ECCACLL);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2330ED218(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  NSObject *v3;

  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __66__CMIOExtensionProviderHostContext_setPluginPropertyValues_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2330ED1DCLL);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2330ED76C(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  NSObject *v3;

  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __80__CMIOExtensionProviderHostContext_availableDevicePropertiesWithDeviceID_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2330ED730);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2330EDD98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  uint64_t v15;
  NSObject *v16;

  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      v16 = CMIOLog();
      if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2330EDD58);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(v15 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2330EE428(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  NSObject *v3;

  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2330EE3ECLL);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2330EE9A8(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  NSObject *v3;

  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __93__CMIOExtensionProviderHostContext_setDevicePropertyValuesWithDeviceID_propertyValues_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2330EE96CLL);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2330EEEFC(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  NSObject *v3;

  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __80__CMIOExtensionProviderHostContext_availableStreamPropertiesWithStreamID_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2330EEEC0);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2330EF4F0(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  NSObject *v3;

  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2330EF4B4);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2330EFC3C(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  NSObject *v3;

  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __93__CMIOExtensionProviderHostContext_setStreamPropertyValuesWithStreamID_propertyValues_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2330EFC00);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2330F00E0(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  NSObject *v3;

  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __66__CMIOExtensionProviderHostContext_startStreamWithStreamID_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2330F00A4);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2330F0584(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  NSObject *v3;

  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __65__CMIOExtensionProviderHostContext_stopStreamWithStreamID_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2330F0548);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2330F0ED4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t v11;
  NSObject *v12;

  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      v12 = CMIOLog();
      if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __94__CMIOExtensionProviderHostContext_captureAsyncStillImageWithStreamID_uniqueID_options_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2330F0E98);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(v11 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2330F13E4(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  NSObject *v3;

  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __77__CMIOExtensionProviderHostContext_enqueueReactionEffect_reactionType_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2330F13A8);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_7_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(a3 + 20) = v3;
  *(_WORD *)(a3 + 28) = 2114;
  *(_QWORD *)(a3 + 30) = a2;
}

void OUTLINED_FUNCTION_8_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x1Cu);
}

void OUTLINED_FUNCTION_10_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v3;

  *(_WORD *)(a3 + 28) = v3;
  *(_QWORD *)(a3 + 30) = a2;
}

uint64_t OUTLINED_FUNCTION_12_1(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  return result;
}

void OUTLINED_FUNCTION_13_0(uint64_t a1@<X1>, int a2@<W8>)
{
  *(_DWORD *)(a1 + 14) = a2;
  *(_WORD *)(a1 + 18) = 2080;
}

uint64_t CMIOPreferences()
{
  if (CMIOPreferences::once != -1)
    dispatch_once(&CMIOPreferences::once, &__block_literal_global_5);
  return CMIOPreferences::cmioPref;
}

uint64_t CMIOPreferencesGetIntegerValue(void *key, char *a2)
{
  const __CFString *Value;
  const __CFString *v5;
  CFTypeID v6;
  SInt32 IntValue;
  uint64_t v8;
  CFTypeID v9;
  CFTypeID v10;
  char v11;
  uint64_t valuePtr;

  if (CMIOPreferences::once != -1)
    dispatch_once(&CMIOPreferences::once, &__block_literal_global_5);
  if (CMIOPreferences::cmioPref)
  {
    Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)CMIOPreferences::cmioPref, key);
    if (Value)
    {
      v5 = Value;
      v6 = CFGetTypeID(Value);
      if (v6 == CFStringGetTypeID())
      {
        IntValue = CFStringGetIntValue(v5);
        if (IntValue)
        {
          v8 = IntValue;
          goto LABEL_21;
        }
        v8 = 1;
        if (CFStringCompare(v5, CFSTR("true"), 1uLL))
        {
          v8 = 1;
          if (CFStringCompare(v5, CFSTR("yes"), 1uLL))
          {
            if (CFStringCompare(v5, CFSTR("false"), 1uLL)
              && CFStringCompare(v5, CFSTR("no"), 1uLL)
              && CFStringCompare(v5, CFSTR("0"), 1uLL))
            {
              goto LABEL_17;
            }
            v8 = 0;
          }
        }
      }
      else
      {
        v9 = CFGetTypeID(v5);
        if (v9 == CFNumberGetTypeID())
        {
          valuePtr = 0;
          CFNumberGetValue((CFNumberRef)v5, kCFNumberCFIndexType, &valuePtr);
          v8 = valuePtr;
        }
        else
        {
          v10 = CFGetTypeID(v5);
          if (v10 != CFBooleanGetTypeID())
            goto LABEL_17;
          v8 = CFBooleanGetValue((CFBooleanRef)v5) != 0;
        }
      }
LABEL_21:
      v11 = 1;
      if (!a2)
        return v8;
      goto LABEL_18;
    }
  }
LABEL_17:
  v11 = 0;
  v8 = 0;
  if (a2)
LABEL_18:
    *a2 = v11;
  return v8;
}

uint64_t CMIOLogLevel(int a1)
{
  if (CMIOLogLevel::once != -1)
    dispatch_once(&CMIOLogLevel::once, &__block_literal_global_17);
  if (CMIOLogLevel::cmioLevel < a1)
    return 0;
  if (CMIOLog::once != -1)
    dispatch_once(&CMIOLog::once, &__block_literal_global_13);
  return CMIOLog::cmioLog;
}

void sub_2330F1CDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2330F632C(_Unwind_Exception *exception_object, int a2, ...)
{
  id v2;
  NSObject *v3;
  const char *v4;
  va_list va;

  va_start(va, a2);
  if (a2)
  {
    if (a2 == 2)
    {
      v2 = objc_begin_catch(exception_object);
      v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v4 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
        __73__CMIOExtensionProviderContext_pullSampleBufferForStreamID_replyq_reply___block_invoke_cold_1((uint64_t)v4, (uint64_t)v2, (uint64_t)va);
      }
      objc_end_catch();
      JUMPOUT(0x2330F62FCLL);
    }
    objc_begin_catch(exception_object);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  id *v0;

  return objc_msgSend(*v0, "pid");
}

OSStatus CMIOSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, CMFormatDescriptionRef formatDescription, UInt32 numSamples, UInt32 numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, UInt32 numSampleSizeEntries, const size_t *sampleSizeArray, UInt64 sequenceNumber, UInt32 discontinuityFlags, CMSampleBufferRef *sBufOut)
{
  CMSampleBufferRef *v11;
  CFNumberRef v13;
  OSStatus v14;
  OSStatus v21;
  NSObject *v22;
  CFNumberRef v23;
  const __CFNumber *v24;
  CMAttachmentBearerRef target;

  v11 = sBufOut;
  target = 0;
  if (!sBufOut)
    return -50;
  v13 = 0;
  v14 = -50;
  if (formatDescription)
  {
    if (sampleTimingArray)
    {
      if (CMFormatDescriptionGetMediaType(formatDescription) != 1986618469
        || (v13 = 0, v14 = -50, numSamples == 1) && numSampleSizeEntries == 1)
      {
        v21 = CMSampleBufferCreate(allocator, dataBuffer, 1u, 0, 0, formatDescription, numSamples, numSampleTimingEntries, sampleTimingArray, numSampleSizeEntries, sampleSizeArray, (CMSampleBufferRef *)&target);
        if (v21)
        {
          v14 = v21;
          v22 = CMIOLog();
          v13 = (CFNumberRef)v22;
          if (v22)
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              CMIOSampleBufferCreate_cold_1();
            v13 = 0;
          }
        }
        else
        {
          v13 = CFNumberCreate(allocator, kCFNumberSInt64Type, &sequenceNumber);
          if (v13)
          {
            CMSetAttachment(target, kCMIOSampleBufferAttachmentKey_SequenceNumber, v13, 1u);
            v23 = CFNumberCreate(allocator, kCFNumberSInt32Type, &discontinuityFlags);
            if (v23)
            {
              v24 = v23;
              CMSetAttachment(target, kCMIOSampleBufferAttachmentKey_DiscontinuityFlags, v23, 1u);
              *v11 = (CMSampleBufferRef)target;
              target = 0;
              CFRelease(v13);
              v14 = 0;
              v13 = v24;
LABEL_20:
              CFRelease(v13);
              return v14;
            }
          }
          v14 = -108;
        }
      }
    }
  }
  if (target)
  {
    CFRelease(target);
    target = 0;
  }
  if (v13)
    goto LABEL_20;
  return v14;
}

OSStatus CMIOSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, UInt64 sequenceNumber, UInt32 discontinuityFlags, CMSampleBufferRef *sBufOut)
{
  CFNumberRef v8;
  OSStatus v9;
  OSStatus v11;
  NSObject *v12;
  CFNumberRef v13;
  const __CFNumber *v14;
  CMSampleBufferRef sampleBufferOut;
  UInt32 v17;
  UInt64 valuePtr;

  valuePtr = sequenceNumber;
  v17 = discontinuityFlags;
  sampleBufferOut = 0;
  if (!sBufOut)
    return -50;
  v8 = 0;
  v9 = -50;
  if (formatDescription && sampleTiming)
  {
    v11 = CMSampleBufferCreateForImageBuffer(allocator, imageBuffer, 1u, 0, 0, formatDescription, sampleTiming, &sampleBufferOut);
    if (v11)
    {
      v9 = v11;
      v12 = CMIOLog();
      v8 = (CFNumberRef)v12;
      if (v12)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          CMIOSampleBufferCreateForImageBuffer_cold_1();
        v8 = 0;
      }
    }
    else
    {
      v8 = CFNumberCreate(allocator, kCFNumberSInt64Type, &valuePtr);
      if (v8)
      {
        CMSetAttachment(sampleBufferOut, kCMIOSampleBufferAttachmentKey_SequenceNumber, v8, 1u);
        v13 = CFNumberCreate(allocator, kCFNumberSInt32Type, &v17);
        if (v13)
        {
          v14 = v13;
          CMSetAttachment(sampleBufferOut, kCMIOSampleBufferAttachmentKey_DiscontinuityFlags, v13, 1u);
          *sBufOut = sampleBufferOut;
          sampleBufferOut = 0;
          CFRelease(v8);
          v9 = 0;
          v8 = v14;
LABEL_17:
          CFRelease(v8);
          return v9;
        }
      }
      v9 = -108;
    }
  }
  if (sampleBufferOut)
  {
    CFRelease(sampleBufferOut);
    sampleBufferOut = 0;
  }
  if (v8)
    goto LABEL_17;
  return v9;
}

OSStatus CMIOSampleBufferCreateNoDataMarker(CFAllocatorRef allocator, UInt32 noDataEvent, CMFormatDescriptionRef formatDescription, UInt64 sequenceNumber, UInt32 discontinuityFlags, CMSampleBufferRef *sBufOut)
{
  CFNumberRef v6;
  OSStatus v7;
  CFNumberRef v9;
  OSStatus v11;
  NSObject *v12;
  CFNumberRef v13;
  CFNumberRef v14;
  CFNumberRef v15;
  _BYTE v17[12];
  UInt64 valuePtr;
  UInt32 v19;

  v6 = 0;
  v19 = noDataEvent;
  *(_DWORD *)&v17[8] = 0;
  valuePtr = sequenceNumber;
  *(_QWORD *)v17 = discontinuityFlags | 0x1000;
  v7 = -50;
  if (sequenceNumber == -1)
  {
    v9 = 0;
  }
  else
  {
    v9 = 0;
    if (sBufOut)
    {
      v11 = CMSampleBufferCreate(allocator, 0, 0, 0, 0, formatDescription, 0, 0, 0, 0, 0, (CMSampleBufferRef *)&v17[4]);
      if (v11)
      {
        v7 = v11;
        v12 = CMIOLog();
        v6 = (CFNumberRef)v12;
        if (v12)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            CMIOSampleBufferCreateNoDataMarker_cold_1();
          v6 = 0;
        }
        v9 = 0;
      }
      else
      {
        v6 = CFNumberCreate(allocator, kCFNumberSInt64Type, &valuePtr);
        if (v6)
        {
          CMSetAttachment(*(CMAttachmentBearerRef *)&v17[4], kCMIOSampleBufferAttachmentKey_SequenceNumber, v6, 1u);
          v9 = CFNumberCreate(allocator, kCFNumberSInt32Type, v17);
          if (v9)
          {
            CMSetAttachment(*(CMAttachmentBearerRef *)&v17[4], kCMIOSampleBufferAttachmentKey_DiscontinuityFlags, v9, 1u);
            v13 = CFNumberCreate(allocator, kCFNumberSInt32Type, &v19);
            if (v13)
            {
              v14 = v13;
              CMSetAttachment(*(CMAttachmentBearerRef *)&v17[4], kCMIOSampleBufferAttachmentKey_NoDataMarker, v13, 1u);
              v7 = 0;
              *sBufOut = *(CMSampleBufferRef *)&v17[4];
              *(_QWORD *)&v17[4] = 0;
LABEL_19:
              CFRelease(v6);
              v15 = v14;
              goto LABEL_20;
            }
          }
        }
        else
        {
          v9 = 0;
        }
        v7 = -108;
      }
    }
  }
  if (*(_QWORD *)&v17[4])
  {
    CFRelease(*(CFTypeRef *)&v17[4]);
    *(_QWORD *)&v17[4] = 0;
  }
  v14 = 0;
  v15 = 0;
  if (v6)
    goto LABEL_19;
LABEL_20:
  if (v9)
    CFRelease(v9);
  if (v15)
    CFRelease(v15);
  return v7;
}

void CMIOSampleBufferSetSequenceNumber(CFAllocatorRef allocator, CMSampleBufferRef sbuf, UInt64 sequenceNumber)
{
  CFNumberRef v4;
  CFNumberRef v5;
  UInt64 valuePtr;

  valuePtr = sequenceNumber;
  if (sbuf)
  {
    v4 = CFNumberCreate(allocator, kCFNumberSInt64Type, &valuePtr);
    if (v4)
    {
      v5 = v4;
      CMSetAttachment(sbuf, kCMIOSampleBufferAttachmentKey_SequenceNumber, v4, 1u);
      CFRelease(v5);
    }
  }
}

UInt64 CMIOSampleBufferGetSequenceNumber(CMSampleBufferRef sbuf)
{
  CFTypeRef v1;
  const void *v2;
  CFTypeID TypeID;
  UInt64 valuePtr;

  if (!sbuf)
    return -1;
  v1 = CMGetAttachment(sbuf, kCMIOSampleBufferAttachmentKey_SequenceNumber, 0);
  if (!v1)
    return -1;
  v2 = v1;
  TypeID = CFNumberGetTypeID();
  if (TypeID != CFGetTypeID(v2))
    return -1;
  valuePtr = 0;
  if (CFNumberGetValue((CFNumberRef)v2, kCFNumberSInt64Type, &valuePtr))
    return valuePtr;
  else
    return -1;
}

void CMIOSampleBufferSetDiscontinuityFlags(CFAllocatorRef allocator, CMSampleBufferRef sbuf, UInt32 discontinuityFlags)
{
  CFNumberRef v4;
  CFNumberRef v5;
  UInt32 valuePtr;

  valuePtr = discontinuityFlags;
  if (sbuf)
  {
    v4 = CFNumberCreate(allocator, kCFNumberSInt32Type, &valuePtr);
    if (v4)
    {
      v5 = v4;
      CMSetAttachment(sbuf, kCMIOSampleBufferAttachmentKey_DiscontinuityFlags, v4, 1u);
      CFRelease(v5);
    }
  }
}

UInt32 CMIOSampleBufferGetDiscontinuityFlags(CMSampleBufferRef sbuf)
{
  CFTypeRef v1;
  const void *v2;
  CFTypeID TypeID;
  UInt32 valuePtr;

  if (!sbuf)
    return 1;
  v1 = CMGetAttachment(sbuf, kCMIOSampleBufferAttachmentKey_DiscontinuityFlags, 0);
  if (!v1)
    return 1;
  v2 = v1;
  TypeID = CFNumberGetTypeID();
  if (TypeID != CFGetTypeID(v2))
    return 1;
  valuePtr = 0;
  if (CFNumberGetValue((CFNumberRef)v2, kCFNumberSInt32Type, &valuePtr))
    return valuePtr;
  else
    return 1;
}

OSStatus CMIOSampleBufferCopyNonRequiredAttachments(CMSampleBufferRef sourceSBuf, CMSampleBufferRef destSBuf, CMAttachmentMode attachmentMode)
{
  OSStatus v3;
  const __CFAllocator *v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  __CFDictionary *MutableCopy;
  __CFDictionary *v10;

  v3 = -50;
  if (sourceSBuf && destSBuf)
  {
    v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v7 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x24BDBD240], sourceSBuf, attachmentMode);
    if (v7)
    {
      v8 = v7;
      if (CFDictionaryGetCount(v7) >= 1)
      {
        if (CFDictionaryContainsKey(v8, kCMIOSampleBufferAttachmentKey_DiscontinuityFlags)
          || CFDictionaryContainsKey(v8, kCMIOSampleBufferAttachmentKey_SequenceNumber))
        {
          MutableCopy = CFDictionaryCreateMutableCopy(v6, 0, v8);
          if (MutableCopy)
          {
            v10 = MutableCopy;
            CFDictionaryRemoveValue(MutableCopy, kCMIOSampleBufferAttachmentKey_DiscontinuityFlags);
            CFDictionaryRemoveValue(v10, kCMIOSampleBufferAttachmentKey_SequenceNumber);
            if (CFDictionaryGetCount(v10) >= 1)
              CMSetAttachments(destSBuf, v10, attachmentMode);
            CFRelease(v8);
            v3 = 0;
            goto LABEL_16;
          }
          v3 = -108;
LABEL_15:
          v10 = v8;
LABEL_16:
          CFRelease(v10);
          return v3;
        }
        CMSetAttachments(destSBuf, v8, attachmentMode);
      }
      v3 = 0;
      goto LABEL_15;
    }
    return 0;
  }
  return v3;
}

OSStatus CMIOSampleBufferCopySampleAttachments(CMSampleBufferRef sourceSBuf, CMSampleBufferRef destSBuf)
{
  uint64_t v2;
  const __CFArray *SampleAttachmentsArray;
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  const __CFArray *v8;
  const __CFArray *v9;
  CFIndex v10;
  uint64_t v11;
  CFIndex v12;
  uint64_t v13;
  const __CFDictionary *ValueAtIndex;
  __CFDictionary *v15;
  __CFDictionary *v16;
  CFIndex v17;
  const void **v18;
  const void **v19;
  const void **v20;
  uint64_t v22;
  const __CFArray *v23;

  LODWORD(v2) = -50;
  if (sourceSBuf && destSBuf)
  {
    SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(sourceSBuf, 0);
    if (SampleAttachmentsArray)
    {
      v5 = SampleAttachmentsArray;
      Count = CFArrayGetCount(SampleAttachmentsArray);
      if (Count >= 1)
      {
        v7 = Count;
        v8 = CMSampleBufferGetSampleAttachmentsArray(destSBuf, 1u);
        if (!v8)
        {
          LODWORD(v2) = -108;
          return v2;
        }
        v9 = v8;
        v10 = CFArrayGetCount(v8);
        if (v7 >= v10)
          v11 = v10;
        else
          v11 = v7;
        if (v11 >= 1)
        {
          v12 = 0;
          v2 = 0;
          v22 = v11;
          v23 = v5;
          while (1)
          {
            v13 = v2;
            ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v12);
            v15 = (__CFDictionary *)CFArrayGetValueAtIndex(v9, v12);
            LODWORD(v2) = -50;
            if (!ValueAtIndex)
              return v2;
            v16 = v15;
            if (!v15)
              return v2;
            v17 = CFDictionaryGetCount(ValueAtIndex);
            v18 = (const void **)malloc_type_malloc(8 * v17, 0x80040B8603338uLL);
            v19 = (const void **)malloc_type_malloc(8 * v17, 0x80040B8603338uLL);
            v20 = v19;
            if (v18)
            {
              if (v19)
                break;
            }
            v13 = 4294967188;
            v2 = 4294967188;
            if (v18)
              goto LABEL_19;
LABEL_20:
            if (v20)
              free(v20);
            if (++v12 == v11)
              return v2;
          }
          CFDictionaryGetKeysAndValues(ValueAtIndex, v18, v19);
          if (v17)
          {
            do
            {
              CFDictionarySetValue(v16, v18[v17 - 1], v20[v17 - 1]);
              --v17;
            }
            while (v17);
            v11 = v22;
            v5 = v23;
          }
LABEL_19:
          free(v18);
          v2 = v13;
          goto LABEL_20;
        }
      }
    }
    LODWORD(v2) = 0;
  }
  return v2;
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t __getSTExecutableIdentityResolverClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSTExecutableIdentityClass_block_invoke_cold_1(v0);
}

uint64_t __getSTExecutableIdentityClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.1(v0);
}

void cmio_XPCMessageSetCFNumber_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageSetCFNumber_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageSetCFNumber_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageSetCFString_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageSetCFString_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageSetCFString_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageSetCFData_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageSetCFData_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageSetCFData_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageSetCFArray_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageSetCFArray_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageSetCFArray_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageSetCFDictionary_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageSetCFDictionary_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageSetCFDictionary_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageCopyCFNumber_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageCopyCFNumber_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageCopyCFString_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageCopyCFString_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageCopyCFData_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageCopyCFData_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageCopyCFArray_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageCopyCFArray_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageCopyCFDictionary_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void cmio_XPCMessageCopyCFDictionary_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_0();
}

void CMIOSampleBufferCreate_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Common/Sources/CMIOSampleBuffer.c");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s ### Err %ld, ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void CMIOSampleBufferCreateForImageBuffer_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Common/Sources/CMIOSampleBuffer.c");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s ### Err %ld, ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void CMIOSampleBufferCreateNoDataMarker_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Common/Sources/CMIOSampleBuffer.c");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s ### Err %ld, ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x24BDBC170](keysToFetch, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x24BDBC650](str);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

OSStatus CMBlockBufferCreateContiguous(CFAllocatorRef structureAllocator, CMBlockBufferRef sourceBuffer, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x24BDC00B8](structureAllocator, sourceBuffer, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x24BDC00C0](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x24BDC00D8](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

Boolean CMBlockBufferIsRangeContiguous(CMBlockBufferRef theBuffer, size_t offset, size_t length)
{
  return MEMORY[0x24BDC00E8](theBuffer, offset, length);
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x24BDC0150]();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return (CMTime *)MEMORY[0x24BDC0158](retstr, clock);
}

CFDictionaryRef CMCopyDictionaryOfAttachments(CFAllocatorRef allocator, CMAttachmentBearerRef target, CMAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x24BDC0170](allocator, target, *(_QWORD *)&attachmentMode);
}

Boolean CMFormatDescriptionEqual(CMFormatDescriptionRef formatDescription, CMFormatDescriptionRef otherFormatDescription)
{
  return MEMORY[0x24BDC0190](formatDescription, otherFormatDescription);
}

CFDictionaryRef CMFormatDescriptionGetExtensions(CMFormatDescriptionRef desc)
{
  return (CFDictionaryRef)MEMORY[0x24BDC01B8](desc);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x24BDC01C0](desc);
}

CMMediaType CMFormatDescriptionGetMediaType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x24BDC01D0](desc);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x24BDC01E0](target, key, attachmentModeOut);
}

OSStatus CMMuxedFormatDescriptionCreate(CFAllocatorRef allocator, CMMuxedStreamType muxType, CFDictionaryRef extensions, CMMuxedFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x24BDC0220](allocator, *(_QWORD *)&muxType, extensions, formatDescriptionOut);
}

void CMPropagateAttachments(CMAttachmentBearerRef source, CMAttachmentBearerRef destination)
{
  MEMORY[0x24BDC0258](source, destination);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0270](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

OSStatus CMSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0290](allocator, imageBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, sampleTiming, sampleBufferOut);
}

CMTime *__cdecl CMSampleBufferGetDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x24BDC02D0](retstr, sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x24BDC02E0](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x24BDC02E8](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x24BDC0320](retstr, sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x24BDC0330](sbuf, createIfNecessary);
}

OSStatus CMSampleBufferGetSampleTimingInfoArray(CMSampleBufferRef sbuf, CMItemCount numSampleTimingEntries, CMSampleTimingInfo *timingArrayOut, CMItemCount *timingArrayEntriesNeededOut)
{
  return MEMORY[0x24BDC0348](sbuf, numSampleTimingEntries, timingArrayOut, timingArrayEntriesNeededOut);
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC0380](target, key, value, *(_QWORD *)&attachmentMode);
}

void CMSetAttachments(CMAttachmentBearerRef target, CFDictionaryRef theAttachments, CMAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC0388](target, theAttachments, *(_QWORD *)&attachmentMode);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x24BDC0420](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x24BDC0450](time1, time2);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x24BDC0468](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x24BDC05A0](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x24BDC0648](allocator, imageBuffer, formatDescriptionOut);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x24BDC0668](videoDesc);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x24BDC5138](buffer, key, attachmentMode);
}

Boolean CVBufferHasAttachment(CVBufferRef buffer, CFStringRef key)
{
  return MEMORY[0x24BDC5158](buffer, key);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC5180](buffer, key, value, *(_QWORD *)&attachmentMode);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5258](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x24BDC52C0](pixelBuffer);
}

CFTypeID CVPixelBufferGetTypeID(void)
{
  return MEMORY[0x24BDC52E0]();
}

uint64_t FigCopyBacktrace()
{
  return MEMORY[0x24BDC07D8]();
}

uint64_t FigDispatchQueueCreateTargetingWorkloopWithPriority()
{
  return MEMORY[0x24BDC0818]();
}

uint64_t FigGetUpTimeNanoseconds()
{
  return MEMORY[0x24BDC08D0]();
}

uint64_t FigRemote_CreateSampleBufferFromSerializedAtomDataBlockBuffer()
{
  return MEMORY[0x24BDC0988]();
}

uint64_t FigRemote_CreateSerializedAtomDataBlockBufferForSampleBuffer()
{
  return MEMORY[0x24BDC0998]();
}

uint64_t FigXPCMessageCopyFormatDescription()
{
  return MEMORY[0x24BDC0AB8]();
}

uint64_t FigXPCMessageCreateBlockBufferData()
{
  return MEMORY[0x24BDC0AC0]();
}

uint64_t FigXPCMessageSetBlockBuffer()
{
  return MEMORY[0x24BDC0AD0]();
}

uint64_t FigXPCMessageSetFormatDescription()
{
  return MEMORY[0x24BDC0AF0]();
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x24BDD8B60](aSurface);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8D28](xobj);
}

uint64_t TCCAccessCheckAuditToken()
{
  return MEMORY[0x24BEB3758]();
}

uint64_t TCCAccessPreflightWithAuditToken()
{
  return MEMORY[0x24BEB37A8]();
}

uint64_t TCCAccessRestricted()
{
  return MEMORY[0x24BEB37D8]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8F8](atoken);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC8](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
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

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x24BEDD0D8](location);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6F8](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

uint64_t voucher_copy()
{
  return MEMORY[0x24BDB0408]();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x24BDB0638](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB0670](xarray, index);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x24BDB0710](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x24BDB0730](name, targetq);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x24BDB0738](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x24BDB0758]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x24BDB0788](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x24BDB0880](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x24BDB0888](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x24BDB08B0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB08F8](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0928](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x24BDB0960](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x24BDB0970]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
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

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x24BDB09D8](xdict, key, uuid);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x24BDB09F8](connection);
}

uint64_t xpc_event_publisher_activate()
{
  return MEMORY[0x24BDB0A10]();
}

uint64_t xpc_event_publisher_create()
{
  return MEMORY[0x24BDB0A18]();
}

uint64_t xpc_event_publisher_fire_with_reply()
{
  return MEMORY[0x24BDB0A28]();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return MEMORY[0x24BDB0A30]();
}

uint64_t xpc_event_publisher_set_handler()
{
  return MEMORY[0x24BDB0A38]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x24BDB0B58](stream, targetq, handler);
}

