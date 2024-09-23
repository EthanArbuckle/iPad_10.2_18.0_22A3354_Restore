uint64_t AUSandboxPlatformInitWithBundleIdentifier(NSObject *a1)
{
  NSObject *v1;
  char v3[1024];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (a1)
    v1 = a1;
  else
    v1 = MEMORY[0x24BDACB70];
  bzero(v3, 0x400uLL);
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      AUSandboxPlatformInitWithBundleIdentifier_cold_2();
    return 1;
  }
  if (!confstr(65537, v3, 0x400uLL))
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      AUSandboxPlatformInitWithBundleIdentifier_cold_1();
    return 1;
  }
  return 0;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_22CD68618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_22CD687E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCSVoiceTriggerRTModelClass_block_invoke(uint64_t a1)
{
  CoreSpeechLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CSVoiceTriggerRTModel");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCSVoiceTriggerRTModelClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCSVoiceTriggerRTModelClass_block_invoke_cold_1();
    CoreSpeechLibrary();
  }
}

void CoreSpeechLibrary()
{
  void *v0;

  if (!CoreSpeechLibraryCore_frameworkLibrary)
    CoreSpeechLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CoreSpeechLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getCSCoreSpeechServicesClass_block_invoke(uint64_t a1)
{
  Class result;
  iAUPServer *v3;
  SEL v4;
  BOOL v5;

  CoreSpeechLibrary();
  result = objc_getClass("CSCoreSpeechServices");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCSCoreSpeechServicesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (iAUPServer *)__getCSCoreSpeechServicesClass_block_invoke_cold_1();
    return (Class)-[iAUPServer initInstanceWithByteEscape:](v3, v4, v5);
  }
  return result;
}

void __45__iAUPServer_setHSModel_fallbackModel_error___block_invoke(id *a1)
{
  const char *v2;
  const char *v3;
  _DWORD *v4;
  id v5;
  _BOOL4 v6;
  id v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  const char *v17;
  size_t v18;
  size_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  _BYTE *v23;
  _BYTE *v24;
  unsigned int v25;
  char v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  _BOOL4 v32;
  uint64_t v33;
  _BOOL4 v34;
  size_t v35;
  size_t v36;
  __int16 v37;

  if (a1[4])
    v2 = "valid";
  else
    v2 = "nil";
  if (a1[5])
    v3 = "valid";
  else
    v3 = "nil";
  NSLog(CFSTR("%s(): newModel=%s fallbackModel=%s error=%@\n"), "-[iAUPServer setHSModel:fallbackModel:error:]_block_invoke", v2, v3, a1[6]);
  v4 = a1[7];
  if (v4[4] != 5)
  {
    NSLog(CFSTR("[HS Callback] Invalid State=%s\n"), objc_msgSend(v4, "serverStateString:"));
    goto LABEL_53;
  }
  if (a1[6])
    goto LABEL_9;
  v5 = a1[4];
  v6 = v5
    && objc_msgSend(v5, "modelData")
    && objc_msgSend(a1[4], "modelHash")
    && objc_msgSend(a1[4], "modelLocale") != 0;
  v7 = a1[5];
  v8 = v7 && objc_msgSend(v7, "modelHash") && objc_msgSend(a1[5], "modelLocale") != 0;
  v34 = v8;
  v32 = v6;
  if (v6)
  {
    v9 = objc_msgSend((id)objc_msgSend(a1[4], "modelHash"), "lengthOfBytesUsingEncoding:", 1);
    v10 = objc_msgSend((id)objc_msgSend(a1[4], "modelLocale"), "lengthOfBytesUsingEncoding:", 1);
    v33 = objc_msgSend((id)objc_msgSend(a1[4], "modelData"), "length");
    *((_QWORD *)a1[7] + 4) = -[FirmwareBundle initWithData:hashData:signatureData:certData:]([FirmwareBundle alloc], "initWithData:hashData:signatureData:certData:", objc_msgSend(a1[4], "modelData"), objc_msgSend(a1[4], "digest"), objc_msgSend(a1[4], "signature"), objc_msgSend(a1[4], "certificate"));
    v11 = (void *)*((_QWORD *)a1[7] + 4);
    if (!v11)
    {
      NSLog(CFSTR("[HS Callback] Failed to create firmware bundle\n"), v30);
      goto LABEL_9;
    }
    v35 = v10;
    v36 = v9;
    v12 = (v9 + v10 + 4);
    if (objc_msgSend(v11, "firmwareImage"))
      v13 = "valid";
    else
      v13 = "nil";
    v31 = v13;
    v14 = objc_msgSend(*((id *)a1[7] + 4), "firmwareImageSize");
    if (objc_msgSend(*((id *)a1[7] + 4), "hash"))
      v15 = "valid";
    else
      v15 = "nil";
    if (objc_msgSend(*((id *)a1[7] + 4), "signature"))
      v16 = "valid";
    else
      v16 = "nil";
    if (objc_msgSend(*((id *)a1[7] + 4), "certificate"))
      v17 = "valid";
    else
      v17 = "nil";
    NSLog(CFSTR("FimrwareBundle created [image=%s imageSize=%d hash=%s signature=%s cert=%s productID=%d baseAddress=%d]\n"), v31, v14, v15, v16, v17, objc_msgSend(*((id *)a1[7] + 4), "productIDCode"), objc_msgSend(*((id *)a1[7] + 4), "firmwareImageBaseAddress"));
    if (!v34)
      goto LABEL_35;
  }
  else
  {
    v35 = 0;
    v36 = 0;
    v33 = 0;
    v12 = 2;
    if (!v8)
    {
LABEL_35:
      v18 = 0;
      v19 = 0;
      v20 = 0;
      goto LABEL_38;
    }
  }
  v18 = objc_msgSend((id)objc_msgSend(a1[5], "modelHash"), "lengthOfBytesUsingEncoding:", 1);
  v19 = objc_msgSend((id)objc_msgSend(a1[5], "modelLocale"), "lengthOfBytesUsingEncoding:", 1);
  v20 = objc_msgSend((id)objc_msgSend(a1[5], "modelData"), "length");
  v12 = (v18 + v19 + v12 + 2);
LABEL_38:
  if (objc_msgSend(a1[4], "modelData"))
    v21 = "valid";
  else
    v21 = "nil";
  NSLog(CFSTR("%s(): newModel=[data[%lu]=%s locale[%lu]=%@ hash[%lu]=%@]\n"), "-[iAUPServer setHSModel:fallbackModel:error:]_block_invoke", v33, v21, v35, objc_msgSend(a1[4], "modelLocale"), v36, objc_msgSend(a1[4], "modelHash"));
  if (objc_msgSend(a1[5], "modelData"))
    v22 = "valid";
  else
    v22 = "nil";
  NSLog(CFSTR("%s(): fbModel=[data[%lu]=%s locale[%lu]=%@ hash[%lu]=%@]\n"), "-[iAUPServer setHSModel:fallbackModel:error:]_block_invoke", v20, v22, v19, objc_msgSend(a1[5], "modelLocale"), v18, objc_msgSend(a1[5], "modelHash"));
  NSLog(CFSTR("%s(): returnPayloadSize=%d\n"), "-[iAUPServer setHSModel:fallbackModel:error:]_block_invoke", v12);
  v23 = malloc_type_calloc(v12, 1uLL, 0x97229F3EuLL);
  if (!v23)
  {
    NSLog(CFSTR("[HS Callback] Error allocating return payload buf size=%d\n"), v12);
LABEL_9:
    objc_msgSend(a1[7], "setServerState:", 3);
    v37 = 0;
    objc_msgSend(a1[7], "sendCommand:payload:payload_length:", 99, &v37, 2);
    objc_msgSend(*((id *)a1[7] + 1), "handleSessionError:message:", objc_msgSend(a1[6], "code"), CFSTR("Failed to retrieve HS Asset Info"));
    goto LABEL_53;
  }
  v24 = v23;
  *v23 = 0;
  v25 = 2;
  if (v34)
    v26 = 2;
  else
    v26 = 0;
  v23[1] = v26 | v32;
  if (v32)
  {
    v23[2] = v35;
    memcpy(v23 + 3, (const void *)objc_msgSend((id)objc_msgSend(a1[4], "modelLocale"), "cStringUsingEncoding:", 1), v35);
    v24[(v35 + 3)] = v36;
    memcpy(&v24[(v35 + 4)], (const void *)objc_msgSend((id)objc_msgSend(a1[4], "modelHash"), "cStringUsingEncoding:", 1), v36);
    v25 = v35 + 4 + v36;
  }
  if (v34)
  {
    v27 = v25 + 1;
    v24[v25] = v19;
    memcpy(&v24[v27], (const void *)objc_msgSend((id)objc_msgSend(a1[5], "modelLocale"), "cStringUsingEncoding:", 1), v19);
    v28 = v27 + v19;
    v29 = (v27 + v19 + 1);
    v24[v28] = v18;
    memcpy(&v24[v29], (const void *)objc_msgSend((id)objc_msgSend(a1[5], "modelHash"), "cStringUsingEncoding:", 1), v18);
    LOWORD(v25) = v29 + v18;
  }
  objc_msgSend(a1[7], "sendCommand:payload:payload_length:", 97, v24, (unsigned __int16)v25);
  objc_msgSend(a1[7], "setServerState:", 6);
  free(v24);
LABEL_53:

  *((_QWORD *)a1[7] + 5) = 0;
}

void sub_22CD6CA9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22CD6CB9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22CD6CD18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ConstructError(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  void *v11;

  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", a3, &a9);
  v11 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
  if (v10)
  {
    NSLog(CFSTR("%@"), v10);
    objc_msgSend(v11, "setObject:forKey:", v10, *MEMORY[0x24BDD0FC8]);
  }
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.MobileAccessoryUpdater.EAFirmwareUpdater"), a2, v11);
}

void sub_22CD706D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22CD70E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
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

void sub_22CD71170(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t generateSHA256HashForDataAtLocationAsData(uint64_t a1, uint64_t a2)
{
  return generateHashForDataAtLocationAsData(a1, 10, a2);
}

uint64_t generateHashForDataAtLocationAsData(uint64_t a1, int a2, uint64_t a3)
{
  void *v5;
  uint64_t result;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t OutputSize;
  char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
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
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", a1, a3);
  result = 0;
  if (a2 && v5)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = CCDigestInit();
    do
    {
      v8 = (void *)MEMORY[0x22E307BE8](v7);
      v9 = (void *)objc_msgSend(v5, "uarpReadDataUpToLength:error:", 0x4000, a3, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27,
                     v28,
                     v29,
                     v30,
                     v31,
                     v32,
                     v33,
                     v34,
                     v35,
                     v36,
                     v37,
                     v38,
                     v39,
                     v40,
                     v41,
                     (_QWORD)v42);
      objc_msgSend(v9, "bytes");
      objc_msgSend(v9, "length");
      CCDigestUpdate();
      v10 = objc_msgSend(v9, "length");
      objc_autoreleasePoolPop(v8);
    }
    while (v10 >> 14);
    OutputSize = CCDigestGetOutputSize();
    v12 = (char *)&v13 - ((MEMORY[0x24BDAC7A8]() + 15) & 0xFFFFFFFFFFFFFFF0);
    CCDigestFinal();
    if (objc_msgSend(v5, "uarpCloseAndReturnError:", a3))
      return objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v12, OutputSize);
    else
      return 0;
  }
  return result;
}

id generateSHA256HashForDataAtLocation(uint64_t a1, uint64_t a2)
{
  return generateHashForDataAtLocation(a1, 10, a2);
}

id generateHashForDataAtLocation(uint64_t a1, int a2, uint64_t a3)
{
  void *HashForDataAtLocationAsData;
  void *v4;
  uint64_t v5;
  id v6;
  unint64_t v7;

  HashForDataAtLocationAsData = (void *)generateHashForDataAtLocationAsData(a1, a2, a3);
  if (!HashForDataAtLocationAsData)
    return 0;
  v4 = HashForDataAtLocationAsData;
  v5 = objc_msgSend(HashForDataAtLocationAsData, "bytes");
  v6 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if (objc_msgSend(v4, "length"))
  {
    v7 = 0;
    do
      objc_msgSend(v6, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(v5 + v7++));
    while (v7 < objc_msgSend(v4, "length"));
  }
  return v6;
}

void *generateBase64HashForDataAtLocation(uint64_t a1, int a2, uint64_t a3)
{
  void *result;

  result = (void *)generateHashForDataAtLocationAsData(a1, a2, a3);
  if (result)
    return (void *)objc_msgSend(result, "base64EncodedStringWithOptions:", 0);
  return result;
}

void AUSandboxPlatformInitWithBundleIdentifier_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __error();
  OUTLINED_FUNCTION_0(&dword_22CD67000, v0, v1, "failed to initialize temporary directory: %d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_1();
}

void AUSandboxPlatformInitWithBundleIdentifier_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __error();
  OUTLINED_FUNCTION_0(&dword_22CD67000, v0, v1, "failed to set temporary directory suffix: %d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_1();
}

uint64_t __getCSVoiceTriggerRTModelClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCSCoreSpeechServicesClass_block_invoke_cold_1(v0);
}

uint64_t __getCSCoreSpeechServicesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[FirmwareBundle initWithURL:hashData:signatureData:certData:].cold.1(v0);
}

uint64_t CCDigestFinal()
{
  return MEMORY[0x24BDAC1D0]();
}

uint64_t CCDigestGetOutputSize()
{
  return MEMORY[0x24BDAC1D8]();
}

uint64_t CCDigestInit()
{
  return MEMORY[0x24BDAC1E0]();
}

uint64_t CCDigestUpdate()
{
  return MEMORY[0x24BDAC1F8]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x24BDACC40]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE678]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t ccdigest_init()
{
  return MEMORY[0x24BDAD540]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x24BDAD548]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x24BDAD828]();
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x24BDADA08](*(_QWORD *)&a1, a2, a3);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

uint64_t metadataTLVGetNext()
{
  return MEMORY[0x24BE66A08]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t parseSuperBinaryAndPayloadHeaders()
{
  return MEMORY[0x24BE66A10]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

uint64_t updateSuperBinaryPayload()
{
  return MEMORY[0x24BE66A18]();
}

