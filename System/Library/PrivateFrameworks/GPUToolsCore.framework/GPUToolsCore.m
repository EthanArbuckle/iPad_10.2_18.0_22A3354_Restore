uint64_t FBDecoder_DecodeArguments(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  int v7;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  unsigned int v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unsigned __int16 *v21;
  int v22;
  unsigned __int16 v23;
  int v24;
  char *v25;
  __int16 v26;
  char *v27;
  BOOL v28;
  int v29;
  int v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t result;
  unsigned int v35;
  unint64_t v36;
  char *v37;
  unint64_t v38;
  int v39;
  _DWORD *v40;

  v7 = a2;
  v9 = a2 + a3;
  v10 = *a1;
  v11 = (char *)(a2 + v10);
  v12 = (char *)memchr((void *)(a2 + v10), 0, a3 - v10);
  if (!v12)
    return 0xFFFFFFFFLL;
  v13 = v12;
  v39 = v7;
  v40 = a1;
  v14 = a1[1];
  v15 = v12 + 1;
  if (v11 == v12)
  {
LABEL_36:
    result = 0;
    *v40 = (((_DWORD)v15 + 3) & 0xFFFFFFFC) - v39;
    v40[1] = v14;
    return result;
  }
  while (1)
  {
    v16 = v14;
    if (v14 >= a5)
      return 2;
    v17 = (unint64_t *)(a4 + 16 * v14);
    v18 = a4 + 16 * v16;
    *(_BYTE *)(v18 + 11) = 0;
    v19 = (char *)(v18 + 11);
    v20 = a4 + 16 * v16;
    *(_WORD *)(v20 + 8) = 1;
    v21 = (unsigned __int16 *)(v20 + 8);
    v22 = *v11;
    if (v22 == 64)
    {
      v23 = 0;
      v25 = v11 + 1;
      v24 = v11[1];
      if (v11 + 1 != v13)
      {
        v26 = v24 - 48;
        if ((v24 - 48) <= 9)
        {
          v23 = 0;
          v27 = v11 + 2;
          do
          {
            v23 = v26 + 10 * v23;
            v28 = v27 == v13;
            v30 = *v27++;
            v29 = v30;
            if (v28)
              break;
            v26 = v29 - 48;
          }
          while ((v29 - 48) < 0xA);
          v25 = v27 - 1;
        }
      }
      *v19 = 1;
      v31 = v23;
      *v21 = v23;
      v22 = *v25;
      v32 = 3;
      v11 = v25;
    }
    else
    {
      v32 = 2;
      v31 = 1;
    }
    if (v22 == 117)
    {
      *v19 = v32;
      v33 = *++v11;
      LOBYTE(v22) = v33;
    }
    *(_BYTE *)(a4 + 16 * v16 + 10) = v22;
    result = 0xFFFFFFFFLL;
    if ((char)v22 <= 97)
    {
      if ((char)v22 != 67)
      {
        if ((char)v22 != 83 && (char)v22 != 85)
          return result;
        if (v9 - (unint64_t)v15 >= 8 && *v15 == 0xFFFFFFFFLL)
        {
          *v17 = 0;
          *v21 = 0;
          ++v15;
        }
        else
        {
          *v17 = (unint64_t)v15;
          v37 = (char *)memchr(v15, 0, v9 - (_QWORD)v15);
          if (!v37)
            return 0xFFFFFFFFLL;
          *v21 = (_WORD)v37 - (_WORD)v15;
          v15 = v37 + 1;
        }
        goto LABEL_31;
      }
    }
    else
    {
      v35 = (char)v22 - 98;
      if (v35 > 0x15)
        return result;
      if (((1 << v35) & 0x244404) == 0)
      {
        if (((1 << v35) & 0x90) != 0)
        {
          v38 = ((unint64_t)v15 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          *v17 = v38;
          v15 = (_QWORD *)(v38 + 4 * v31);
        }
        else
        {
          if ((char)v22 != 98)
            return result;
          *v17 = (unint64_t)v15;
          v15 = (_QWORD *)((char *)v15 + v31);
        }
        goto LABEL_31;
      }
    }
    v36 = ((unint64_t)v15 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    *v17 = v36;
    v15 = (_QWORD *)(v36 + 8 * v31);
LABEL_31:
    if (v9 < (unint64_t)v15)
      return 0xFFFFFFFFLL;
    if ((unint64_t)(v11 + 1) < v9 && v11[1] == 60)
      v11 = (char *)memchr(v11 + 2, 62, v13 - (v11 + 2));
    v14 = v16 + 1;
    if (++v11 == v13)
      goto LABEL_36;
  }
}

void GPUTools::Interpose::DYInterposeCommonInit(GPUTools::Interpose *this, DYGuestAppClient *(*a2)(void))
{
  int v2;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFBundle *MainBundle;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFStringRef Identifier;
  const char *v13;

  v2 = (int)a2;
  v4 = (void *)MEMORY[0x2426231FC]();
  if (GPUTools::Interpose::DYInterposeCommonInit(DYGuestAppClient * (*)(void),int)::onceToken != -1)
    dispatch_once(&GPUTools::Interpose::DYInterposeCommonInit(DYGuestAppClient * (*)(void),int)::onceToken, &__block_literal_global);
  v5 = ((uint64_t (*)(void))this)();
  if (!v5)
    dy_abort("platform initialization failed");
  v6 = (void *)v5;
  DYSetGuestAppClient(v2, v5);
  dispatch_resume((dispatch_object_t)objc_msgSend(v6, "globalSyncQueue"));
  objc_msgSend(v6, "sendTimebaseUpdate");
  MainBundle = CFBundleGetMainBundle();
  v8 = -[__CFURL path](CFBundleCopyBundleURL(MainBundle), "path");
  if (!v8)
  {
    v13 = "bundlePath";
    goto LABEL_9;
  }
  v9 = v8;
  v10 = -[__CFURL path](CFBundleCopyExecutableURL(MainBundle), "path");
  if (!v10)
  {
    v13 = "executablePath";
LABEL_9:
    __assert_rtn("void GPUTools::Interpose::DYInterposeCommonInit(initializePlatform_fn, int)", "", 0, v13);
  }
  v11 = v10;
  Identifier = CFBundleGetIdentifier(MainBundle);
  objc_msgSend(v6, "sendMessage:", +[DYTransportMessage messageWithKind:attributes:payload:](DYTransportMessage, "messageWithKind:attributes:payload:", 1536, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", getpid()), CFSTR("pid"), v9, CFSTR("path"), v11, CFSTR("executable-path"), Identifier, CFSTR("identifier"), 0), 0));
  objc_autoreleasePoolPop(v4);
}

char *GPUTools::Interpose::DYFetchSandboxEntitlements(GPUTools::Interpose *this)
{
  char *result;

  if (getenv("DY_SANDBOX_SOCKET"))
    sandbox_extension_consume();
  result = getenv("DY_SANDBOX_GENERIC");
  if (result)
    return (char *)sandbox_extension_consume();
  return result;
}

DYUNIXDomainSocketTransport *GPUTools::Interpose::DYCreateTransport(GPUTools::Interpose *this, const char *a2)
{
  char *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  DYUNIXDomainSocketTransport *v8;
  DYUNIXDomainSocketTransport *v9;

  v2 = getenv((const char *)this);
  if (!v2)
    dy_abort("[create_transport] GT_HOST_URL environment not set");
  v3 = v2;
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v2, 4);
  if (!v4)
    __assert_rtn("DYTransport *GPUTools::Interpose::DYCreateTransport(const char *)", "", 0, "url_str");
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
  if (!v5)
    dy_abort("[create_transport] failed to parse GT_HOST_URL: %s", v3);
  v6 = v5;
  v7 = (void *)objc_msgSend(v5, "scheme");
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("null")) & 1) == 0)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("file")))
    {
      v9 = -[DYUNIXDomainSocketTransport initWithMode:]([DYUNIXDomainSocketTransport alloc], "initWithMode:", 1);
    }
    else
    {
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("dysmt")) & 1) == 0
        && !objc_msgSend(v7, "isEqualToString:", CFSTR("dysmtdeferred")))
      {
        goto LABEL_16;
      }
      v9 = -[DYSharedMemoryTransport initWithMode:uniqueIdentifier:]([DYSharedMemoryTransport alloc], "initWithMode:uniqueIdentifier:", 1, 0);
    }
    v8 = v9;
    -[DYUNIXDomainSocketTransport setUrl:](v9, "setUrl:", v6);
    if (v8)
      return v8;
LABEL_16:
    dy_abort("[create_transport] failed to create transport; GT_HOST_URL: %s", v3);
  }
  return 0;
}

uint64_t (*GPUTools::Interpose::DYInterposeSetMessageDispatcher(uint64_t (*result)(GPUTools::Interpose *__hidden this, DYGuestAppClient *, GPUTools::FB::Stream *, const void *, unint64_t), uint64_t (*a2)(GPUTools::Interpose *__hidden this, DYGuestAppClient *, DYTransportMessage *, const char *, const void *, unint64_t)))(GPUTools::Interpose *__hidden this, DYGuestAppClient *, GPUTools::FB::Stream *, const void *, unint64_t)
{
  GPUTools::Interpose::sDispatcher = result;
  off_256BB31A0 = a2;
  return result;
}

void GPUTools::Interpose::DYInterposeDefaultFlushStream(GPUTools::Interpose *this, DYGuestAppClient *a2, GPUTools::FB::Stream *a3, const void *a4)
{
  void *v8;
  id v9;
  OS_dispatch_queue *saveptrQueue;
  uint64_t v11;
  void *v12;
  void *v13;
  DYTransportMessage *v14;

  v8 = (void *)MEMORY[0x2426231FC]();
  v9 = objc_alloc(MEMORY[0x24BDBCED8]);
  saveptrQueue = a2->_saveptrQueue;
  v11 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", BYTE4(a2->_stopCaptureQueue) == 0);
  v12 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", saveptrQueue, CFSTR("buffer name"), v11, CFSTR("has pstream header"), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend((id)-[GPUTools::Interpose activeCaptureDescriptor](this, "activeCaptureDescriptor"), "sessionId")), CFSTR("capture serial"), 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, a4, 0);
  v14 = -[DYTransportMessage initWithKind:attributes:payload:]([DYTransportMessage alloc], "initWithKind:attributes:payload:", 1792, v12, v13);

  -[GPUTools::Interpose sendTimebaseUpdate](this, "sendTimebaseUpdate");
  -[GPUTools::Interpose sendMessage:](this, "sendMessage:", v14);

  objc_autoreleasePoolPop(v8);
}

void GPUTools::Interpose::DYInterposeDefaultStorePointer(GPUTools::Interpose *this, DYGuestAppClient *a2, DYTransportMessage *a3, const char *a4, const void *a5)
{
  id v8;

  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a4, a5, 0);
  -[GPUTools::Interpose sendCaptureData:name:inReplyTo:](this, "sendCaptureData:name:inReplyTo:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3), a2);

}

void GPUTools::Interpose::DYFlushFbufStream(GPUTools::Interpose *this, DYGuestAppClient *a2, Stream *a3)
{
  GPUTools::Interpose *v4;
  unint64_t v5;
  DYTransport *transport;
  char *v7;
  DYTransport *p_url;

  v4 = this;
  transport = a2->_transport;
  if (BYTE4(a2->_stopCaptureQueue))
    v7 = (char *)((char *)a2->_source - (char *)transport - 8);
  else
    v7 = (char *)((char *)a2->_source - (char *)transport);
  if (v7)
  {
    if (BYTE4(a2->_stopCaptureQueue))
      p_url = (DYTransport *)&transport->_url;
    else
      p_url = a2->_transport;
    GPUTools::Interpose::sDispatcher(this, a2, (GPUTools::FB::Stream *)p_url, v7, v5);

  }
}

BOOL GPUTools::Interpose::DYSavePointer(GPUTools::Interpose *this, DYGuestAppClient *a2, void *data, char *__dst, char *a5, uint64_t a6, DYTransportMessage *a7, char a8, _BYTE *a9, BOOL *a10)
{
  char v13;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _BOOL8 v20;
  NSObject *v22;
  _QWORD block[11];
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  unsigned __int8 md[8];
  unsigned __int8 *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (!a2 || !data)
  {
    strcpy(__dst, kDYNullURL[0]);
    return 0;
  }
  v13 = (char)a7;
  CC_SHA256(data, (CC_LONG)a2, md);
  if ((unint64_t)a5 >= 0x41)
  {
    v17 = 0;
    v18 = __dst;
    do
    {
      snprintf(v18, (size_t)a5, "%02x", md[v17++]);
      v18 += 2;
      a5 -= 2;
    }
    while (v17 != 32);
  }
  if ((v13 & 1) == 0 && (a8 & 1) == 0)
    return 0;
  if (-[GPUTools::Interpose liveDebugging](this, "liveDebugging"))
  {
    v19 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", data, a2);
    -[GPUTools::Interpose sendCaptureData:name:inReplyTo:](this, "sendCaptureData:name:inReplyTo:", v19, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", __dst), 0);
    return 1;
  }
  else
  {
    *(_QWORD *)md = 0;
    v31 = md;
    v32 = 0x2020000000;
    v33 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 1;
    v22 = -[GPUTools::Interpose saveptrQueue](this, "saveptrQueue");
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZN8GPUTools9Interpose13DYSavePointerEP16DYGuestAppClientmPKvPcmP18DYTransportMessagebbPb_block_invoke;
    block[3] = &unk_250D61EF0;
    block[8] = __dst;
    block[9] = data;
    block[10] = a2;
    block[4] = this;
    block[5] = a6;
    block[6] = &v26;
    block[7] = md;
    v25 = a8;
    dispatch_sync(v22, block);
    if (a9)
      *a9 = *((_BYTE *)v27 + 24);
    v20 = v31[24] != 0;
    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(md, 8);
  }
  return v20;
}

void sub_23C6D6684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools9Interpose13DYSavePointerEP16DYGuestAppClientmPKvPcmP18DYTransportMessagebbPb_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  BufferInfo *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", *(_QWORD *)(a1 + 64), 1);
  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "saveptrPtrInfoDict"), "objectForKey:", v6);
  v3 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 72));
  v4 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "ptrUrlInfoDict"), "objectForKeyedSubscript:", v3);
  if (v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "compare:", v6) != 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "ptrUrlInfoDict"), "setObject:forKeyedSubscript:", v6, v3);
  if (v2)
  {
    if (!*(_BYTE *)(a1 + 88))
      objc_msgSend(v2, "incrementUsage");
  }
  else
  {
    v5 = -[BufferInfo initWithSize:usage:]([BufferInfo alloc], "initWithSize:usage:", *(_QWORD *)(a1 + 80), 1);
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "saveptrPtrInfoDict"), "setObject:forKey:", v5, v6);
    ((void (*)(GPUTools::Interpose *, DYGuestAppClient *, DYTransportMessage *, const char *, const void *))off_256BB31A0)(*(GPUTools::Interpose **)(a1 + 32), *(DYGuestAppClient **)(a1 + 40), (DYTransportMessage *)objc_msgSend(v6, "UTF8String"), *(const char **)(a1 + 72), *(const void **)(a1 + 80));

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

uint64_t GPUTools::Interpose::DYStorePointer(GPUTools::Interpose *this, const void *a2, DYTransportMessage *a3, GPUTools::Interpose *a4, DYGuestAppClient *a5, DYTransportMessage *a6)
{
  return off_256BB31A0(a4, a5, a3, (const char *)this, a2, (unint64_t)off_256BB31A0);
}

Method GPUTools::Interpose::DYInstallObjCMethodOverrides(Method result)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  objc_method *v5;
  uint64_t v6;
  objc_class *v7;
  const char *v8;
  void (*v9)(void);
  const char *TypeEncoding;

  v1 = *(_QWORD *)result;
  if (*((_QWORD *)result + 1) != *(_QWORD *)result)
  {
    v2 = (uint64_t *)result;
    v3 = 0;
    v4 = 0;
    do
    {
      result = class_getInstanceMethod(*(Class *)(v1 + v3), *(SEL *)(v1 + v3 + 8));
      if (result)
      {
        v5 = result;
        **(_QWORD **)(*v2 + v3 + 16) = method_getImplementation(result);
        v6 = *v2 + v3;
        if (!**(_QWORD **)(v6 + 16))
          __assert_rtn("void GPUTools::Interpose::DYInstallObjCMethodOverrides(const std::vector<DYObjCMethodOverride> &)", "", 0, "*overrides[i].original");
        v7 = *(objc_class **)v6;
        v8 = *(const char **)(v6 + 8);
        v9 = *(void (**)(void))(v6 + 24);
        TypeEncoding = method_getTypeEncoding(v5);
        result = (Method)class_addMethod(v7, v8, v9, TypeEncoding);
        if ((result & 1) == 0)
          result = (Method)method_setImplementation(v5, *(IMP *)(*v2 + v3 + 24));
      }
      ++v4;
      v1 = *v2;
      v3 += 32;
    }
    while (v4 < (v2[1] - *v2) >> 5);
  }
  return result;
}

void dy_abort(char *a1, ...)
{
  char *v1;
  size_t v2;
  size_t v3;
  char *__s[2];
  va_list va;

  va_start(va, a1);
  __s[0] = 0;
  va_copy((va_list)&__s[1], va);
  vasprintf(__s, a1, va);
  if (__crashreporter_info__)
  {
    v2 = strlen((const char *)__crashreporter_info__);
    v3 = v2 + strlen(__s[0]) + 2;
    v1 = (char *)malloc_type_malloc(v3, 0xBD3F99FDuLL);
    strlcpy(v1, (const char *)__crashreporter_info__, v3);
    strlcat(v1, "\n", v3);
    strlcat(v1, __s[0], v3);
    free(__s[0]);
  }
  else
  {
    v1 = __s[0];
  }
  __crashreporter_info__ = (uint64_t)v1;
  syslog(3, "aborting: %s\n", v1);
  abort();
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_23C6D6B10(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t DYTimingBenchmark()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[40000];
  uint64_t v5;
  uint64_t v6;

  MEMORY[0x24BDAC7A8]();
  v0 = 0;
  v6 = *MEMORY[0x24BDAC8D0];
  do
  {
    v1 = mach_absolute_time();
    v2 = mach_absolute_time() - v1;
    if (g_DYTimebaseInfo != dword_256BC8DD4)
      v2 = __udivti3();
    *(_QWORD *)&v4[v0] = v2;
    v0 += 8;
  }
  while (v0 != 80008);
  qsort_b(v4, 0x2711uLL, 8uLL, &__block_literal_global_0);
  return v5;
}

void sub_23C6D7840(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_23C6D7870(void *exc_buf, int a2)
{
  uint64_t v2;

  if (a2)
  {
    objc_begin_catch(exc_buf);
    if (a2 == 2)
    {
      *(_QWORD *)(v2 + 40) = 0;
      objc_end_catch();
    }
    JUMPOUT(0x23C6D77D4);
  }
  JUMPOUT(0x23C6D7864);
}

void dy_ProbesInit()
{
  void *v0;

  v0 = (void *)MEMORY[0x2426231FC]();
  g_signpostLog = MEMORY[0x24BDACB78];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "BOOLForKey:", CFSTR("GPUToolsPerfLogging")))g_signpostLog = (uint64_t)os_log_create("com.apple.gputools", "GPUToolsCore");
  objc_autoreleasePoolPop(v0);
}

void sub_23C6D86EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, std::random_device a13, std::random_device a14)
{
  std::random_device::~random_device(&a13);
  _Unwind_Resume(a1);
}

std::random_device *std::random_device::random_device[abi:ne180100](std::random_device *a1)
{
  std::string __token;

  std::string::basic_string[abi:ne180100]<0>(&__token, "/dev/urandom");
  std::random_device::random_device(a1, &__token);
  if (SHIBYTE(__token.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__token.__r_.__value_.__l.__data_);
  return a1;
}

void sub_23C6D8754(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_23C6D9228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
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

uint64_t smt_poll_thread_entry(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  char __str[64];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a1[1];
  v3 = (void *)a1[2];
  snprintf(__str, 0x40uLL, "gputools.smt_poll.%p", a1);
  pthread_setname_np(__str);
  while (!*((_BYTE *)a1 + 24))
  {
    dispatch_sync(v2, v3);
    usleep(0x1F40u);
  }

  return 0;
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

uint64_t GPUTools::SM::ProcessStateSettingReturnCode(uint64_t result, int a2)
{
  unsigned int v2;
  BOOL v3;

  switch(a2)
  {
    case 1:
      v2 = 1;
      v3 = (result | 2) == 2;
      goto LABEL_4;
    case 2:
      v3 = (_DWORD)result == 0;
      v2 = 2;
LABEL_4:
      if (v3)
        result = v2;
      else
        result = result;
      break;
    case 3:
      if ((_DWORD)result == 4)
        result = 4;
      else
        result = 3;
      break;
    case 4:
      result = 4;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t GPUTools::FB::Stream::Stream(uint64_t a1, void *aBlock, const void *a3)
{
  *(_QWORD *)a1 = 0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  *(_BYTE *)(a1 + 60) = 0;
  if (!aBlock)
    __assert_rtn("GPUTools::FB::Stream::Stream(callback, callback)", "", 0, "flush_handler");
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 40) = _Block_copy(aBlock);
  if (a3)
    *(_QWORD *)(a1 + 48) = _Block_copy(a3);
  return a1;
}

{
  *(_QWORD *)a1 = 0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  *(_BYTE *)(a1 + 60) = 0;
  if (!aBlock)
    __assert_rtn("GPUTools::FB::Stream::Stream(callback, callback)", "", 0, "flush_handler");
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 40) = _Block_copy(aBlock);
  if (a3)
    *(_QWORD *)(a1 + 48) = _Block_copy(a3);
  return a1;
}

GPUTools::FB::Stream *GPUTools::FB::Stream::Stream(GPUTools::FB::Stream *this, __CFData *a2)
{
  _QWORD v5[5];
  _QWORD aBlock[5];

  v5[4] = a2;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN8GPUTools2FB6StreamC2EP8__CFData_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_0;
  aBlock[4] = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 0x40000000;
  v5[2] = ___ZN8GPUTools2FB6StreamC2EP8__CFData_block_invoke_2;
  v5[3] = &__block_descriptor_tmp_3;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_QWORD *)this + 6) = 0;
  *((_DWORD *)this + 14) = 0;
  *((_BYTE *)this + 60) = 0;
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 5) = _Block_copy(aBlock);
  *((_QWORD *)this + 6) = _Block_copy(v5);
  if (!a2)
    __assert_rtn("GPUTools::FB::Stream::Stream(CFMutableDataRef)", "", 0, "data");
  CFRetain(a2);
  return this;
}

{
  _QWORD v5[5];
  _QWORD aBlock[5];

  v5[4] = a2;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN8GPUTools2FB6StreamC1EP8__CFData_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_5;
  aBlock[4] = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 0x40000000;
  v5[2] = ___ZN8GPUTools2FB6StreamC1EP8__CFData_block_invoke_2;
  v5[3] = &__block_descriptor_tmp_6;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_QWORD *)this + 6) = 0;
  *((_DWORD *)this + 14) = 0;
  *((_BYTE *)this + 60) = 0;
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 5) = _Block_copy(aBlock);
  *((_QWORD *)this + 6) = _Block_copy(v5);
  if (!a2)
    __assert_rtn("GPUTools::FB::Stream::Stream(CFMutableDataRef)", "", 0, "data");
  CFRetain(a2);
  return this;
}

void sub_23C6DA450(_Unwind_Exception *a1)
{
  GPUTools::FB::Stream *v1;

  GPUTools::FB::Stream::~Stream(v1);
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools2FB6StreamC2EP8__CFData_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  CFIndex v3;
  BOOL v4;
  const UInt8 *v5;
  CFIndex v6;

  v2 = *(_QWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 16) - v2;
  v4 = *(_BYTE *)(a2 + 60) == 0;
  if (*(_BYTE *)(a2 + 60))
    v5 = (const UInt8 *)(v2 + 8);
  else
    v5 = *(const UInt8 **)(a2 + 8);
  if (v4)
    v6 = v3;
  else
    v6 = v3 - 8;
  CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 32), v5, v6);
}

void ___ZN8GPUTools2FB6StreamC2EP8__CFData_block_invoke_2(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void GPUTools::FB::Stream::~Stream(GPUTools::FB::Stream *this)
{
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  const void *v6;

  if (*((_QWORD *)this + 1))
  {
    v2 = (unsigned int *)((char *)this + 56);
    do
      v3 = __ldaxr(v2);
    while (__stlxr(1u, v2));
    if (v3 == 1)
    {
      do
      {
        while (*v2 == 1)
          ;
        do
          v4 = __ldaxr(v2);
        while (__stlxr(1u, v2));
      }
      while (v4 == 1);
    }
    if (!*((_QWORD *)this + 1))
      __assert_rtn("void GPUTools::FB::Stream::Close()", "", 0, "_bh.buffer != nullptr");
    CFRelease(*((CFTypeRef *)this + 4));
    *((_QWORD *)this + 4) = 0;
    if (*(_QWORD *)this)
    {
      GPUTools::VMBuffer::~VMBuffer(*(GPUTools::VMBuffer **)this);
      MEMORY[0x242622C98]();
    }
    *((_BYTE *)this + 60) = 0;
    *(_OWORD *)this = 0u;
    *((_OWORD *)this + 1) = 0u;
    atomic_store(0, (unsigned int *)this + 14);
  }
  v5 = *((_QWORD *)this + 6);
  if (v5)
  {
    (*(void (**)(uint64_t, GPUTools::FB::Stream *))(v5 + 16))(v5, this);
    _Block_release(*((const void **)this + 6));
  }
  v6 = (const void *)*((_QWORD *)this + 5);
  if (v6)
    _Block_release(v6);
}

void sub_23C6DA594(void *a1)
{
  unsigned int *v1;

  atomic_store(0, v1);
  __clang_call_terminate(a1);
}

void sub_23C6DA674(_Unwind_Exception *a1)
{
  GPUTools::FB::Stream *v1;

  GPUTools::FB::Stream::~Stream(v1);
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools2FB6StreamC1EP8__CFData_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  CFIndex v3;
  BOOL v4;
  const UInt8 *v5;
  CFIndex v6;

  v2 = *(_QWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 16) - v2;
  v4 = *(_BYTE *)(a2 + 60) == 0;
  if (*(_BYTE *)(a2 + 60))
    v5 = (const UInt8 *)(v2 + 8);
  else
    v5 = *(const UInt8 **)(a2 + 8);
  if (v4)
    v6 = v3;
  else
    v6 = v3 - 8;
  CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 32), v5, v6);
}

void ___ZN8GPUTools2FB6StreamC1EP8__CFData_block_invoke_2(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t GPUTools::FB::Stream::Stream(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = 0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  *(_BYTE *)(a1 + 60) = 0;
  return GPUTools::FB::Stream::operator=(a1, a2);
}

{
  *(_QWORD *)a1 = 0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  *(_BYTE *)(a1 + 60) = 0;
  return GPUTools::FB::Stream::operator=(a1, a2);
}

uint64_t GPUTools::FB::Stream::operator=(uint64_t a1, uint64_t a2)
{
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;

  if (a1 != a2)
  {
    v4 = (unsigned int *)(a1 + 56);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(1u, v4));
    if (v5 == 1)
    {
      do
      {
        while (*v4 == 1)
          ;
        do
          v6 = __ldaxr(v4);
        while (__stlxr(1u, v4));
      }
      while (v6 == 1);
    }
    v7 = (unsigned int *)(a2 + 56);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(1u, v7));
    if (v8 == 1)
    {
      do
      {
        while (*v7 == 1)
          ;
        do
          v9 = __ldaxr(v7);
        while (__stlxr(1u, v7));
      }
      while (v9 == 1);
    }
    do
      v10 = __ldaxr(v4);
    while (__stlxr(1u, v4));
    if (v10 == 1)
    {
      do
      {
        while (*v4 == 1)
          ;
        do
          v11 = __ldaxr(v4);
        while (__stlxr(1u, v4));
      }
      while (v11 == 1);
    }
    if (!*(_QWORD *)(a1 + 8))
      __assert_rtn("void GPUTools::FB::Stream::Close()", "", 0, "_bh.buffer != nullptr");
    CFRelease(*(CFTypeRef *)(a1 + 32));
    *(_QWORD *)(a1 + 32) = 0;
    if (*(_QWORD *)a1)
    {
      GPUTools::VMBuffer::~VMBuffer(*(GPUTools::VMBuffer **)a1);
      MEMORY[0x242622C98]();
    }
    *(_BYTE *)(a1 + 60) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    atomic_store(0, (unsigned int *)(a1 + 56));
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
    v12 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = v12;
    *(_BYTE *)(a1 + 60) = *(_BYTE *)(a2 + 60);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_BYTE *)(a2 + 60) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_QWORD *)(a2 + 48) = 0;
    atomic_store(0, (unsigned int *)(a2 + 56));
    atomic_store(0, (unsigned int *)(a1 + 56));
  }
  return a1;
}

void sub_23C6DA880(_Unwind_Exception *a1)
{
  unsigned int *v1;
  unsigned int *v2;

  atomic_store(0, v1);
  atomic_store(0, v2);
  atomic_store(0, v1);
  _Unwind_Resume(a1);
}

double GPUTools::FB::Stream::Close(GPUTools::FB::Stream *this)
{
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;
  double result;

  v2 = (unsigned int *)((char *)this + 56);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(1u, v2));
  if (v3 == 1)
  {
    do
    {
      while (*v2 == 1)
        ;
      do
        v4 = __ldaxr(v2);
      while (__stlxr(1u, v2));
    }
    while (v4 == 1);
  }
  if (!*((_QWORD *)this + 1))
    __assert_rtn("void GPUTools::FB::Stream::Close()", "", 0, "_bh.buffer != nullptr");
  CFRelease(*((CFTypeRef *)this + 4));
  *((_QWORD *)this + 4) = 0;
  if (*(_QWORD *)this)
  {
    GPUTools::VMBuffer::~VMBuffer(*(GPUTools::VMBuffer **)this);
    MEMORY[0x242622C98]();
  }
  *((_BYTE *)this + 60) = 0;
  result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  atomic_store(0, (unsigned int *)this + 14);
  return result;
}

void sub_23C6DA974(_Unwind_Exception *a1)
{
  unsigned int *v1;

  atomic_store(0, v1);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

BOOL GPUTools::FB::Stream::Open(GPUTools::FB::Stream *this, const __CFString *a2)
{
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  GPUTools::VMBuffer *v7;
  uint64_t v8;
  _BOOL8 result;
  const char *v10;

  v4 = (unsigned int *)((char *)this + 56);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(1u, v4));
  if (v5 == 1)
  {
    do
    {
      while (*v4 == 1)
        ;
      do
        v6 = __ldaxr(v4);
      while (__stlxr(1u, v4));
    }
    while (v6 == 1);
  }
  if (!a2)
  {
    v10 = "filename";
    goto LABEL_15;
  }
  if (*((_QWORD *)this + 1))
  {
    v10 = "_bh.buffer == nullptr";
LABEL_15:
    __assert_rtn("BOOL GPUTools::FB::Stream::Open(CFStringRef)", "", 0, v10);
  }
  v7 = (GPUTools::VMBuffer *)operator new();
  GPUTools::VMBuffer::VMBuffer(v7, 0x7000uLL, 0);
  v8 = *((_QWORD *)v7 + 4) + *(_QWORD *)v7;
  *((_QWORD *)this + 1) = v8;
  if (v8)
  {
    *(_QWORD *)this = v7;
    *((_QWORD *)this + 4) = CFStringCreateCopy(0, a2);
    **((_QWORD **)this + 1) = 0;
    **((_DWORD **)this + 1) = 1347638349;
    *(_BYTE *)(*((_QWORD *)this + 1) + 5) = 4;
    *((_QWORD *)this + 2) = *((_QWORD *)this + 1) + 8;
    *((_QWORD *)this + 3) = 28664;
  }
  else
  {
    GPUTools::VMBuffer::~VMBuffer(v7);
    MEMORY[0x242622C98]();
  }
  result = v8 != 0;
  atomic_store(0, v4);
  return result;
}

void sub_23C6DAAE8(_Unwind_Exception *a1)
{
  uint64_t v1;
  unsigned int *v2;

  MEMORY[0x242622C98](v1, 0x1000C40EED21634);
  atomic_store(0, v2);
  _Unwind_Resume(a1);
}

void sub_23C6DAB10(_Unwind_Exception *a1)
{
  unsigned int *v1;

  atomic_store(0, v1);
  _Unwind_Resume(a1);
}

void sub_23C6DAB18(_Unwind_Exception *a1)
{
  unsigned int *v1;

  atomic_store(0, v1);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::FB::Stream::Send(GPUTools::FB::Stream *this)
{
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;
  char v5;
  uint64_t result;

  v2 = (unsigned int *)((char *)this + 56);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(1u, v2));
  if (v3 == 1)
  {
    do
    {
      while (*v2 == 1)
        ;
      do
        v4 = __ldaxr(v2);
      while (__stlxr(1u, v2));
    }
    while (v4 == 1);
  }
  v5 = *((_BYTE *)this + 60);
  *((_BYTE *)this + 60) = 0;
  result = (*(uint64_t (**)(void))(*((_QWORD *)this + 5) + 16))();
  *((_BYTE *)this + 60) = v5;
  atomic_store(0, (unsigned int *)this + 14);
  return result;
}

void sub_23C6DABA8(_Unwind_Exception *a1)
{
  unsigned int *v1;

  atomic_store(0, v1);
  _Unwind_Resume(a1);
}

void GPUTools::FB::Stream::WriteFunction(GPUTools::FB::Stream *this, const GPUTools::FD::Function *a2)
{
  const GPUTools::FD::Function *v2;
  unint64_t v4;
  const GPUTools::FD::Function *v5;
  uint64_t v6;
  Fbuf *v7;
  GPUTools::FB::ArgumentProvider *v8;
  char **v9;
  _QWORD *v10;
  int v11;
  GPUTools::FB::ArgumentProvider *v12;
  _QWORD *v13;
  Fbuf *v14;
  Fbuf *v15;
  Fbuf *v16;
  void *v17;
  void *var0;
  char v19[40];
  _QWORD *v20;
  char v21;
  char v22[40];
  _QWORD *v23;
  char v24;
  Fbuf *v25;
  Fbuf *v26;

  v2 = a2;
  v4 = 0;
  v5 = a2;
  do
  {
    ++v4;
    v5 = (const GPUTools::FD::Function *)*((_QWORD *)v5 + 65);
  }
  while (v5);
  std::vector<GPUTools::FB::Fbuf>::vector(&v25, v4);
  v6 = 0;
  do
  {
    v7 = v25;
    GPUTools::FB::FunctionArgumentProvider::FunctionArgumentProvider((GPUTools::FB::FunctionArgumentProvider *)v22, v2, 0);
    v9 = (char **)&v7[v6];
    if (v24 >= 0)
      v10 = &v23;
    else
      v10 = v23;
    GPUTools::FB::Encode(v9, (GPUTools::FB::Fbuf *)*(unsigned int *)v2, *((_DWORD *)v2 + 1) & 0xFFFFFBC6, (uint64_t)v10, v22, v8);
    *((_QWORD *)*v9 + 2) = *((_QWORD *)v2 + 57);
    *((_QWORD *)*v9 + 3) = *((_QWORD *)v2 + 58);
    *((_QWORD *)*v9 + 1) = *((_QWORD *)v2 + 64);
    v11 = *((_DWORD *)v2 + 1);
    if ((v11 & 1) != 0)
    {
      GPUTools::FB::FunctionArgumentProvider::FunctionArgumentProvider((GPUTools::FB::FunctionArgumentProvider *)v19, v2, 1);
      if (v21 >= 0)
        v13 = &v20;
      else
        v13 = v20;
      GPUTools::FB::Encode((char **)&v25[v6], (GPUTools::FB::Fbuf *)0xFFFFD000, 0, (uint64_t)v13, v19, v12);
      GPUTools::FB::FunctionArgumentProvider::~FunctionArgumentProvider((GPUTools::FB::FunctionArgumentProvider *)v19);
      v11 = *((_DWORD *)v2 + 1);
    }
    if ((v11 & 8) != 0)
    {
      GPUTools::FB::EncodeStaticBacktrace((GPUTools::FB *)v9, *((GPUTools::FB::Fbuf **)v2 + 59), (unint64_t *)*((unsigned __int16 *)v2 + 240));
      v11 = *((_DWORD *)v2 + 1);
    }
    if ((v11 & 0x10) != 0)
    {
      GPUTools::FB::EncodeGLError((GPUTools::FB *)v9, (GPUTools::FB::Fbuf *)*((unsigned __int16 *)v2 + 241));
      v11 = *((_DWORD *)v2 + 1);
    }
    if ((v11 & 0x20) != 0)
    {
      GPUTools::FB::EncodePerfEvents((GPUTools::FB::Fbuf *)v9, *((_DWORD *)v2 + 121), *((const void **)v2 + 61), *((unsigned int *)v2 + 124));
      v11 = *((_DWORD *)v2 + 1);
    }
    if ((v11 & 0x400) != 0)
      GPUTools::FB::EncodeGCDQueueInfo((GPUTools::FB *)v9, *((GPUTools::FB::Fbuf **)v2 + 63), *((_DWORD *)v2 + 125));
    v2 = (const GPUTools::FD::Function *)*((_QWORD *)v2 + 65);
    GPUTools::FB::FunctionArgumentProvider::~FunctionArgumentProvider((GPUTools::FB::FunctionArgumentProvider *)v22);
    ++v6;
  }
  while (v2);
  GPUTools::FB::Stream::Writev_partial((char *)this, v25, v4, 1);
  v14 = v25;
  if (v25)
  {
    v15 = v26;
    v16 = v25;
    if (v26 != v25)
    {
      do
      {
        var0 = v15[-1].var0.var0;
        --v15;
        v17 = var0;
        if (var0)
          free(v17);
        v15->var0.var0 = 0;
        v15->var1 = 0;
        v15->var2 = 0;
      }
      while (v15 != v14);
      v16 = v25;
    }
    v26 = v14;
    operator delete(v16);
  }
}

void sub_23C6DADA8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::vector<GPUTools::FB::Fbuf>::~vector[abi:ne180100]((void **)(v1 - 104));
  _Unwind_Resume(a1);
}

_QWORD *std::vector<GPUTools::FB::Fbuf>::vector(_QWORD *a1, unint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;
  char *v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL)
      std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
    v3 = 3 * a2;
    v4 = operator new(24 * a2);
    *a1 = v4;
    a1[1] = v4;
    v5 = (char *)&v4[v3];
    a1[2] = &v4[v3];
    do
    {
      *v4 = 0;
      v4[1] = 0;
      *((_DWORD *)v4 + 4) = 0;
      v4 += 3;
      v3 -= 3;
    }
    while (v3 * 8);
    a1[1] = v5;
  }
  return a1;
}

void sub_23C6DAE84(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(_QWORD *)v1)
    std::vector<GPUTools::FB::Fbuf>::vector((void **)(v1 + 8), *(char **)v1, (void **)v1);
  _Unwind_Resume(exception_object);
}

void **std::vector<GPUTools::FB::Fbuf>::~vector[abi:ne180100](void **a1)
{
  char *v2;
  char *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (char *)*a1;
  if (*a1)
  {
    v3 = (char *)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        v6 = (void *)*((_QWORD *)v3 - 3);
        v3 -= 24;
        v5 = v6;
        if (v6)
          free(v5);
        *(_QWORD *)v3 = 0;
        *((_QWORD *)v3 + 1) = 0;
        *((_DWORD *)v3 + 4) = 0;
      }
      while (v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

double GPUTools::FB::Stream::Write_nolock(GPUTools::FB::Stream *this, Fbuf *a2, size_t __n, int a4)
{
  size_t v4;
  void *v9;
  uint64_t v10;
  double result;
  _DWORD *var0;

  v4 = *((_QWORD *)this + 3);
  if (__n > v4)
    dy_abort("fbuf exceeded capacity of fbuf stream by %lu bytes", __n - v4);
  v10 = *((_QWORD *)this + 1);
  v9 = (void *)*((_QWORD *)this + 2);
  if ((unint64_t)v9 + __n - v10 - 8 > v4)
  {
    (*(void (**)(void))(*((_QWORD *)this + 5) + 16))();
    v9 = (void *)(*((_QWORD *)this + 1) + 8);
    *((_QWORD *)this + 2) = v9;
    *((_BYTE *)this + 60) = 1;
  }
  memcpy(v9, a2->var0.var0, __n);
  *((_QWORD *)this + 2) += __n;
  if (a4)
  {
    var0 = a2->var0.var0;
    a2->var1 = a2->var0.var0;
    if (a2->var2 >= 0x24)
    {
      var0[8] = 0;
      result = 0.0;
      *(_OWORD *)var0 = 0u;
      *((_OWORD *)var0 + 1) = 0u;
    }
  }
  return result;
}

void *GPUTools::FB::Stream::Writev_nopartial(GPUTools::FB::Stream *this, Fbuf *a2, uint64_t a3, char a4)
{
  uint64_t v5;
  Fbuf *v6;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  Fbuf *v13;
  uint64_t v14;
  Fbuf *v15;
  unsigned int *var0;
  unint64_t v17;
  BOOL v18;
  uint64_t v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int v22;
  void *result;
  size_t v24;
  _DWORD *v25;
  unsigned int *v26;
  size_t v27;

  v5 = a3;
  v6 = a2;
  if (!a3)
  {
    v8 = 0;
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    v8 = 0;
    v9 = 0;
LABEL_8:
    v14 = a3 - v9;
    v15 = &a2[v9];
    do
    {
      var0 = (unsigned int *)v15->var0.var0;
      ++v15;
      v8 += *var0;
      --v14;
    }
    while (v14);
    goto LABEL_10;
  }
  v10 = 0;
  v11 = 0;
  v9 = a3 & 0xFFFFFFFFFFFFFFFELL;
  v12 = a3 & 0xFFFFFFFFFFFFFFFELL;
  v13 = a2;
  do
  {
    v10 += *(unsigned int *)v13->var0.var0;
    v11 += *(unsigned int *)v13[1].var0.var0;
    v13 += 2;
    v12 -= 2;
  }
  while (v12);
  v8 = v11 + v10;
  if (v9 != a3)
    goto LABEL_8;
LABEL_10:
  v17 = *((_QWORD *)this + 3);
  v18 = v8 >= v17;
  v19 = v8 - v17;
  if (v19 != 0 && v18)
    dy_abort("fbufs exceeded capacity of fbuf stream by %lu bytes", v19);
LABEL_11:
  v20 = (unsigned int *)((char *)this + 56);
  do
    v21 = __ldaxr(v20);
  while (__stlxr(1u, v20));
  if (v21 == 1)
  {
    do
    {
      while (*v20 == 1)
        ;
      do
        v22 = __ldaxr(v20);
      while (__stlxr(1u, v20));
    }
    while (v22 == 1);
  }
  result = (void *)*((_QWORD *)this + 2);
  if ((unint64_t)result + v8 - *((_QWORD *)this + 1) - 8 > *((_QWORD *)this + 3))
  {
    (*(void (**)(void))(*((_QWORD *)this + 5) + 16))();
    result = (void *)(*((_QWORD *)this + 1) + 8);
    *((_QWORD *)this + 2) = result;
    *((_BYTE *)this + 60) = 1;
    if (!v5)
      goto LABEL_25;
  }
  else if (!a3)
  {
    goto LABEL_25;
  }
  if ((a4 & 1) != 0)
  {
    do
    {
      v24 = *(unsigned int *)v6->var0.var0;
      result = memcpy(*((void **)this + 2), v6->var0.var0, v24);
      *((_QWORD *)this + 2) += v24;
      v25 = v6->var0.var0;
      v6->var1 = v6->var0.var0;
      if (v6->var2 >= 0x24)
      {
        v25[8] = 0;
        *(_OWORD *)v25 = 0u;
        *((_OWORD *)v25 + 1) = 0u;
      }
      ++v6;
      --v5;
    }
    while (v5);
  }
  else
  {
    do
    {
      v26 = (unsigned int *)v6->var0.var0;
      ++v6;
      v27 = *v26;
      memcpy(result, v26, v27);
      result = (void *)(*((_QWORD *)this + 2) + v27);
      *((_QWORD *)this + 2) = result;
      --v5;
    }
    while (v5);
  }
LABEL_25:
  atomic_store(0, v20);
  return result;
}

void sub_23C6DB1C4(_Unwind_Exception *a1)
{
  unsigned int *v1;

  atomic_store(0, v1);
  _Unwind_Resume(a1);
}

char *GPUTools::FB::Stream::Writev_partial(char *this, Fbuf *a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  void *var0;
  size_t v11;
  unint64_t v12;
  void *v13;
  _DWORD *v14;
  void *v15;
  void *v16;

  v4 = a3;
  v6 = (uint64_t)this;
  v7 = (unsigned int *)(this + 56);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(1u, v7));
  if (v8 == 1)
  {
    do
    {
      while (*v7 == 1)
        ;
      do
        v9 = __ldaxr(v7);
      while (__stlxr(1u, v7));
    }
    while (v9 == 1);
  }
  if (a3)
  {
    if ((a4 & 1) != 0)
    {
      while (1)
      {
        var0 = a2->var0.var0;
        v11 = *(unsigned int *)a2->var0.var0;
        v12 = *(_QWORD *)(v6 + 24);
        if (v12 < v11)
          break;
        v13 = *(void **)(v6 + 16);
        if ((unint64_t)v13 + v11 - *(_QWORD *)(v6 + 8) - 8 > v12)
        {
          (*(void (**)(void))(*(_QWORD *)(v6 + 40) + 16))();
          v13 = (void *)(*(_QWORD *)(v6 + 8) + 8);
          *(_QWORD *)(v6 + 16) = v13;
          *(_BYTE *)(v6 + 60) = 1;
          var0 = a2->var0.var0;
        }
        this = (char *)memcpy(v13, var0, v11);
        *(_QWORD *)(v6 + 16) += v11;
        v14 = a2->var0.var0;
        a2->var1 = a2->var0.var0;
        if (a2->var2 >= 0x24)
        {
          v14[8] = 0;
          *(_OWORD *)v14 = 0u;
          *((_OWORD *)v14 + 1) = 0u;
        }
        ++a2;
        if (!--v4)
          goto LABEL_20;
      }
    }
    else
    {
      while (1)
      {
        v15 = a2->var0.var0;
        v11 = *(unsigned int *)a2->var0.var0;
        v12 = *(_QWORD *)(v6 + 24);
        if (v12 < v11)
          break;
        v16 = *(void **)(v6 + 16);
        if ((unint64_t)v16 + v11 - *(_QWORD *)(v6 + 8) - 8 > v12)
        {
          (*(void (**)(void))(*(_QWORD *)(v6 + 40) + 16))();
          v16 = (void *)(*(_QWORD *)(v6 + 8) + 8);
          *(_QWORD *)(v6 + 16) = v16;
          *(_BYTE *)(v6 + 60) = 1;
          v15 = a2->var0.var0;
        }
        this = (char *)memcpy(v16, v15, v11);
        *(_QWORD *)(v6 + 16) += v11;
        ++a2;
        if (!--v4)
          goto LABEL_20;
      }
    }
    dy_abort("fbuf exceeded capacity of fbuf stream by %lu bytes", v11 - v12);
  }
LABEL_20:
  atomic_store(0, v7);
  return this;
}

void sub_23C6DB380(_Unwind_Exception *a1)
{
  unsigned int *v1;

  atomic_store(0, v1);
  _Unwind_Resume(a1);
}

void sub_23C6DB388(_Unwind_Exception *a1)
{
  unsigned int *v1;

  atomic_store(0, v1);
  _Unwind_Resume(a1);
}

void sub_23C6DB390(_Unwind_Exception *a1)
{
  unsigned int *v1;

  atomic_store(0, v1);
  _Unwind_Resume(a1);
}

void std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void GPUTools::DYLockUtils::Lock(os_unfair_lock_t lock, volatile int *a2)
{
  if (GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::onceToken != -1)
    dispatch_once(&GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::onceToken, &__block_literal_global_2);
  if (GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::shouldUseLegacyLock)
    _os_nospin_lock_lock();
  else
    os_unfair_lock_lock(lock);
}

uint64_t GPUTools::DYLockUtils::ShouldUseLegacyLock(GPUTools::DYLockUtils *this)
{
  if (GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::onceToken != -1)
    dispatch_once(&GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::onceToken, &__block_literal_global_2);
  return GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::shouldUseLegacyLock;
}

void GPUTools::DYLockUtils::Unlock(os_unfair_lock_t lock, volatile int *a2)
{
  if (GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::onceToken != -1)
    dispatch_once(&GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::onceToken, &__block_literal_global_2);
  if (GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::shouldUseLegacyLock)
    _os_nospin_lock_unlock();
  else
    os_unfair_lock_unlock(lock);
}

uint64_t GPUTools::DYLockUtils::TryLock(os_unfair_lock_t lock, volatile int *a2)
{
  if (GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::onceToken != -1)
    dispatch_once(&GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::onceToken, &__block_literal_global_2);
  if (GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::shouldUseLegacyLock)
    return _os_nospin_lock_trylock();
  else
    return os_unfair_lock_trylock(lock);
}

void sub_23C6DC948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
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

CFTypeRef DYCreateDictionaryFromVMStatistics(char *valuePtr)
{
  const __CFAllocator *v2;
  CFDictionaryRef v3;
  uint64_t i;
  void *values[15];
  void *keys[2];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = *(_OWORD *)&off_250D62918;
  v13 = xmmword_250D62928;
  *(_OWORD *)keys = xmmword_250D628C8;
  v8 = *(_OWORD *)&off_250D628D8;
  v9 = xmmword_250D628E8;
  v14 = CFSTR("speculative_count");
  v10 = *(_OWORD *)&off_250D628F8;
  v11 = xmmword_250D62908;
  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  values[0] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, valuePtr);
  values[1] = CFNumberCreate(v2, kCFNumberIntType, valuePtr + 4);
  values[2] = CFNumberCreate(v2, kCFNumberIntType, valuePtr + 8);
  values[3] = CFNumberCreate(v2, kCFNumberIntType, valuePtr + 12);
  values[4] = CFNumberCreate(v2, kCFNumberLongLongType, valuePtr + 16);
  values[5] = CFNumberCreate(v2, kCFNumberLongLongType, valuePtr + 24);
  values[6] = CFNumberCreate(v2, kCFNumberLongLongType, valuePtr + 32);
  values[7] = CFNumberCreate(v2, kCFNumberLongLongType, valuePtr + 40);
  values[8] = CFNumberCreate(v2, kCFNumberLongLongType, valuePtr + 48);
  values[9] = CFNumberCreate(v2, kCFNumberLongLongType, valuePtr + 56);
  values[10] = CFNumberCreate(v2, kCFNumberLongLongType, valuePtr + 64);
  values[11] = CFNumberCreate(v2, kCFNumberLongLongType, valuePtr + 72);
  values[12] = CFNumberCreate(v2, kCFNumberLongLongType, valuePtr + 80);
  values[13] = CFNumberCreate(v2, kCFNumberIntType, valuePtr + 88);
  values[14] = CFNumberCreate(v2, kCFNumberIntType, valuePtr + 92);
  v3 = CFDictionaryCreate(v2, (const void **)keys, (const void **)values, 15, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  for (i = 0; i != 15; ++i)
    CFRelease(values[i]);
  return CFMakeCollectable(v3);
}

uint64_t DYFillVMStatisticsFromDictionary(uint64_t a1, CFDictionaryRef theDict)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFNumber *Value;
  const __CFNumber *v10;
  const __CFNumber *v11;
  const __CFNumber *v12;
  const __CFNumber *v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  const __CFNumber *v16;
  const __CFNumber *v17;
  const __CFNumber *v18;
  const __CFNumber *v19;
  const __CFNumber *v20;
  const __CFNumber *v21;
  const __CFNumber *v22;
  const __CFNumber *v23;

  *(_QWORD *)(a1 + 144) = 0;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  v4 = (void *)(a1 + 80);
  *(_OWORD *)(a1 + 64) = 0u;
  v5 = (void *)(a1 + 64);
  *(_OWORD *)(a1 + 48) = 0u;
  v6 = (void *)(a1 + 48);
  *(_OWORD *)(a1 + 32) = 0u;
  v7 = (void *)(a1 + 32);
  *(_OWORD *)(a1 + 16) = 0u;
  v8 = (void *)(a1 + 16);
  Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("free_count"));
  CFNumberGetValue(Value, kCFNumberIntType, (void *)a1);
  v10 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("active_count"));
  CFNumberGetValue(v10, kCFNumberIntType, (void *)(a1 + 4));
  v11 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("inactive_count"));
  CFNumberGetValue(v11, kCFNumberIntType, (void *)(a1 + 8));
  v12 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("wire_count"));
  CFNumberGetValue(v12, kCFNumberIntType, (void *)(a1 + 12));
  v13 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("zero_fill_count"));
  CFNumberGetValue(v13, kCFNumberLongLongType, v8);
  v14 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("reactivations"));
  CFNumberGetValue(v14, kCFNumberLongLongType, (void *)(a1 + 24));
  v15 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("pageins"));
  CFNumberGetValue(v15, kCFNumberLongLongType, v7);
  v16 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("pageouts"));
  CFNumberGetValue(v16, kCFNumberLongLongType, (void *)(a1 + 40));
  v17 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("faults"));
  CFNumberGetValue(v17, kCFNumberLongLongType, v6);
  v18 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("cow_faults"));
  CFNumberGetValue(v18, kCFNumberLongLongType, (void *)(a1 + 56));
  v19 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("lookups"));
  CFNumberGetValue(v19, kCFNumberLongLongType, v5);
  v20 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("hits"));
  CFNumberGetValue(v20, kCFNumberLongLongType, (void *)(a1 + 72));
  v21 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("purges"));
  CFNumberGetValue(v21, kCFNumberLongLongType, v4);
  v22 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("purgeable_count"));
  CFNumberGetValue(v22, kCFNumberIntType, (void *)(a1 + 88));
  v23 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("speculative_count"));
  return CFNumberGetValue(v23, kCFNumberIntType, (void *)(a1 + 92));
}

void sub_23C6DEE98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,void *__p,uint64_t a49,int a50,__int16 a51,char a52,char a53)
{
  if (a53 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t DYSetGTMTLCaptureMode(uint64_t result)
{
  sGTMTLCaptureMode = result;
  return result;
}

BOOL DYCheckGLDispatchTableSize(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v7;
  char *v8;
  void *v9;
  unsigned int (*v10)(_QWORD, uint64_t, int *);
  const char *v12;
  char *v13;
  int v14;

  v1 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", a1);
  if (!v1)
  {
    v12 = "gl_bundle";
    goto LABEL_19;
  }
  v2 = objc_msgSend(v1, "pathForResource:ofType:", CFSTR("GLEngine.bundle"), 0);
  if (!v2)
    __assert_rtn("BOOL DYCheckGLDispatchTableSize(NSString *)", "", 0, "engine_bundle_path");
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v2);
  if (!v3)
  {
    v12 = "engine_bundle";
    goto LABEL_19;
  }
  v4 = (const __CFString *)objc_msgSend(v3, "executablePath");
  if (!v4)
  {
    v12 = "engine_exec_path";
    goto LABEL_19;
  }
  v5 = v4;
  MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(v4);
  v7 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x9868CDE3uLL);
  if (!v7)
  {
    v12 = "engine_exec_path_c";
    goto LABEL_19;
  }
  v8 = v7;
  if (!CFStringGetFileSystemRepresentation(v5, v7, MaximumSizeOfFileSystemRepresentation))
  {
    v12 = "ok";
    goto LABEL_19;
  }
  v9 = dlopen(v8, 5);
  free(v8);
  if (!v9)
  {
    v13 = dlerror();
    dy_abort("failed to dlopen interpose dylib: %s", v13);
  }
  v10 = (unsigned int (*)(_QWORD, uint64_t, int *))dlsym(v9, "gliGetInteger");
  if (!v10)
  {
    v12 = "gliGetInteger_ptr";
LABEL_19:
    __assert_rtn("BOOL DYCheckGLDispatchTableSize(NSString *)", "", 0, v12);
  }
  v14 = 0;
  if (v10(0, 224, &v14))
    dy_abort("dispatch table size query failed");
  dlclose(v9);
  return v14 == 8288;
}

const char *DYGetGLInterposeDylibPath()
{
  return "/usr/lib/libglInterpose.dylib";
}

char *DYGetMTLInterposeDylibPath(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, const char *a5)
{
  char *v5;

  if (sGTMTLCaptureMode != 1
    || (v5 = &DYGetCapturePath(void)::libPath,
        DYGetCapturePathForLibrary(&DYGetCapturePath(void)::libPath, (uint64_t)"/System/Library/PrivateFrameworks/GPUToolsCapture.framework/GPUToolsCapture", "/usr/lib/libMTLCapture.dylib", a4, a5), !DYGetCapturePath(void)::libPath))
  {
    DYGetLegacyCapturePath();
    return DYGetLegacyCapturePath(void)::libPath;
  }
  return v5;
}

char *DYGetLegacyCapturePath(void)
{
  void *v0;
  char *result;
  stat v2;

  v0 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", CFSTR("/Developer/Library/PrivateFrameworks/MTLToolsDeviceSupport.framework/libMTLInterpose.dylib")));
  result = (char *)stat((const char *)objc_msgSend(v0, "fileSystemRepresentation"), &v2);
  if (!(_DWORD)result)
    return strncpy(DYGetLegacyCapturePath(void)::libPath, (const char *)objc_msgSend(v0, "fileSystemRepresentation"), 0x400uLL);
  return result;
}

char *DYGetMTLDiagnosticsDylibPath(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, const char *a5)
{
  DYGetCapturePathForLibrary(DYGetMTLDiagnosticsDylibPath::libPath, (uint64_t)"/System/Library/PrivateFrameworks/GPUToolsDiagnostics.framework/GPUToolsDiagnostics", "/usr/lib/libMTLToolsDiagnostics.dylib", a4, a5);
  return DYGetMTLDiagnosticsDylibPath::libPath;
}

char *DYGetCapturePathForLibrary(char *a1, uint64_t a2, const char *a3, const char *a4, const char *a5)
{
  void *v7;
  char *result;
  void *v9;
  stat v10;

  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2, a4, a5)));
  result = (char *)stat((const char *)objc_msgSend(v7, "fileSystemRepresentation"), &v10);
  if (!(_DWORD)result)
    result = strncpy(a1, (const char *)objc_msgSend(v7, "fileSystemRepresentation"), 0x400uLL);
  if (!*a1)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3)));
    result = (char *)stat((const char *)objc_msgSend(v9, "fileSystemRepresentation"), &v10);
    if (!(_DWORD)result)
      return strncpy(a1, (const char *)objc_msgSend(v9, "fileSystemRepresentation"), 0x400uLL);
  }
  return result;
}

uint64_t DYModifyEnvironmentForDualCaptureSupport(uint64_t result, uint64_t a2, uint64_t a3, const char *a4, const char *a5)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;

  if (sGTMTLCaptureMode == 2)
  {
    v5 = (void *)result;
    v6 = (void *)MEMORY[0x24BDD17C8];
    DYGetCapturePathForLibrary(&DYGetCapturePath(void)::libPath, (uint64_t)"/System/Library/PrivateFrameworks/GPUToolsCapture.framework/GPUToolsCapture", "/usr/lib/libMTLCapture.dylib", a4, a5);
    v7 = objc_msgSend(v6, "stringWithUTF8String:", &DYGetCapturePath(void)::libPath);
    v8 = (void *)MEMORY[0x24BDD17C8];
    DYGetLegacyCapturePath();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(v8, "stringWithUTF8String:", DYGetLegacyCapturePath(void)::libPath), CFSTR("GPUTOOLS_LEGACY_INTERPOSER_PATH"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("DYMTL_TOOLS_DYLIB_PATH"));
    v9 = (__CFString *)objc_msgSend(v5, "objectForKey:", CFSTR("DYLD_INSERT_LIBRARIES"));
    if (!v9)
      v9 = &stru_250D63BC0;
    return objc_msgSend(v5, "setObject:forKey:", -[__CFString dy_appendComponentsString:usingSeparator:unique:](v9, "dy_appendComponentsString:usingSeparator:unique:", v7, CFSTR(":"), 1), CFSTR("DYLD_INSERT_LIBRARIES"));
  }
  return result;
}

uint64_t DYAppendInsertLibrary(void *a1, uint64_t a2)
{
  __CFString *v4;

  v4 = (__CFString *)objc_msgSend(a1, "objectForKey:", CFSTR("DYLD_INSERT_LIBRARIES"));
  if (!v4)
    v4 = &stru_250D63BC0;
  return objc_msgSend(a1, "setObject:forKey:", -[__CFString dy_appendComponentsString:usingSeparator:unique:](v4, "dy_appendComponentsString:usingSeparator:unique:", a2, CFSTR(":"), 1), CFSTR("DYLD_INSERT_LIBRARIES"));
}

void *DYGetInterposeDylibHandle(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, const char *a5)
{
  int v5;
  char *v6;
  uint64_t v7;
  char v8;
  char v9;
  const char *v10;
  void *result;
  _QWORD v12[3];

  v5 = a1;
  v12[2] = *MEMORY[0x24BDAC8D0];
  v6 = DYGetMTLInterposeDylibPath(a1, a2, a3, a4, a5);
  v7 = 0;
  v12[0] = v6;
  v12[1] = "/usr/lib/libglInterpose.dylib";
  v8 = 1;
  do
  {
    while (1)
    {
      v9 = v8;
      v10 = (const char *)v12[v7];
      if (!v10)
        break;
      result = dlopen(v10, v5);
      v8 = 0;
      v7 = 1;
      if (((result == 0) & v9) == 0)
        return result;
    }
    v8 = 0;
    v7 = 1;
  }
  while ((v9 & 1) != 0);
  return 0;
}

void DYPrependInsertLibrary(void *a1, uint64_t a2)
{
  __CFString *v4;
  id v5;

  if (a2)
  {
    v5 = (id)objc_msgSend(a1, "objectForKey:", CFSTR("DYLD_INSERT_LIBRARIES"));
    objc_msgSend(a1, "setObject:forKey:", a2, CFSTR("DYLD_INSERT_LIBRARIES"));
    v4 = (__CFString *)objc_msgSend(a1, "objectForKey:", CFSTR("DYLD_INSERT_LIBRARIES"));
    if (!v4)
      v4 = &stru_250D63BC0;
    objc_msgSend(a1, "setObject:forKey:", -[__CFString dy_appendComponentsString:usingSeparator:unique:](v4, "dy_appendComponentsString:usingSeparator:unique:", v5, CFSTR(":"), 1), CFSTR("DYLD_INSERT_LIBRARIES"));

  }
}

void *DYSetBlockPointer(void *aBlock, const void **a2)
{
  void *result;

  if (!a2)
    __assert_rtn("void DYSetBlockPointer(void *, void **)", "", 0, "target");
  if (*a2)
    _Block_release(*a2);
  if (aBlock)
    result = _Block_copy(aBlock);
  else
    result = 0;
  *a2 = result;
  return result;
}

const __CFString *DYSystemRootDirectory()
{
  return CFSTR("/");
}

void DYLog(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  DYLogv(a1, a2, &a9);
}

void DYLogv(int a1, const char *a2, va_list a3)
{
  char *v4;

  v4 = 0;
  vasprintf(&v4, a2, a3);
  _log_asl(a1, (uint64_t)v4);
  free(v4);
}

void _log_asl(int a1, uint64_t a2)
{
  int v4;
  _QWORD v5[5];
  int v6;

  if (_log_asl_aslc_once != -1)
    dispatch_once(&_log_asl_aslc_once, &__block_literal_global_4);
  if (a1 <= 1)
    v4 = 1;
  else
    v4 = a1;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = ___log_asl_block_invoke_2;
  v5[3] = &__block_descriptor_44_e5_v8__0l;
  v6 = v4;
  v5[4] = a2;
  dispatch_sync((dispatch_queue_t)_log_asl_log_queue, v5);
}

void _DYOLog(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v12;
  objc_class *v13;
  void *v14;
  void *v15;

  v12 = objc_alloc(MEMORY[0x24BDD17C8]);
  v13 = (objc_class *)objc_opt_class();
  v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("<%@: %p>: %@"), NSStringFromClass(v13), a1, a3);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v14, &a9);
  _log_asl(a2, objc_msgSend(v15, "UTF8String"));

}

void _DYOCondLog(int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v12;
  objc_class *v13;
  void *v14;
  void *v15;

  if (a1)
  {
    v12 = objc_alloc(MEMORY[0x24BDD17C8]);
    v13 = (objc_class *)objc_opt_class();
    v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("<%@: %p>: %@"), NSStringFromClass(v13), a2, a4);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v14, &a9);
    _log_asl(a3, objc_msgSend(v15, "UTF8String"));

  }
}

asl_object_t ___log_asl_block_invoke()
{
  asl_object_t result;

  _log_asl_log_queue = (uint64_t)dispatch_queue_create("com.apple.gt.log", 0);
  _log_asl_log_stderr = getenv("GT_LOG_TO_STDERR") != 0;
  result = asl_open(0, 0, 2u);
  _log_asl_aslc = (uint64_t)result;
  return result;
}

uint64_t ___log_asl_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = asl_log((asl_object_t)_log_asl_aslc, 0, *(_DWORD *)(a1 + 40), "%s", *(const char **)(a1 + 32));
  if (_log_asl_log_stderr)
    return fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", *(const char **)(a1 + 32));
  return result;
}

uint64_t DYFSFileExists(uint64_t a1)
{
  uint64_t result;
  char v2;

  v2 = 0;
  LODWORD(result) = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "fileExistsAtPath:isDirectory:", a1, &v2);
  if (v2)
    return 0;
  else
    return result;
}

uint64_t DYFSDirectoryExists(uint64_t a1)
{
  uint64_t result;
  char v2;

  v2 = 0;
  LODWORD(result) = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "fileExistsAtPath:isDirectory:", a1, &v2);
  if (v2)
    return result;
  else
    return 0;
}

uint64_t DYFSCreateTempFileURL(uint64_t a1, uint64_t a2, __CFString *a3, uint64_t a4, uint64_t *a5)
{
  void *v10;
  const __CFString *v11;
  int v12;
  void *v13;
  int v14;
  uint64_t result;
  uint64_t v16;
  char buffer[1024];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v10 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  if (!a3)
    a3 = &stru_250D63BC0;
  v11 = -[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", -[__CFString stringByAppendingString:](a3, "stringByAppendingString:", CFSTR("XXXXXX")));
  CFStringGetFileSystemRepresentation(v11, buffer, 1024);
  v12 = mkstemp(buffer);
  if (v12 == -1)
  {
    if (a5)
    {
      v16 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
      result = 0;
      *a5 = v16;
      return result;
    }
    return 0;
  }
  close(v12);
  v13 = (void *)objc_msgSend(v10, "stringWithFileSystemRepresentation:length:", buffer, strlen(buffer));
  if (!objc_msgSend(v10, "removeItemAtPath:error:", v13, a5))
    return 0;
  if (a1)
  {
    v14 = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 0, 0, a5);
    result = 0;
    if (!v14)
      return result;
    v13 = (void *)objc_msgSend(v13, "stringByAppendingPathComponent:", a1);
  }
  if (a2)
    v13 = (void *)objc_msgSend(v13, "stringByAppendingPathExtension:", a2);
  return objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v13, a4);
}

NSUInteger DYFSCreateDirectory(uint64_t a1, NSSearchPathDirectory directory, _QWORD *a3)
{
  NSArray *v5;
  NSUInteger result;
  uint64_t v7;
  uint64_t v8;

  v8 = 0;
  v5 = NSSearchPathForDirectoriesInDomains(directory, 1uLL, 1);
  result = -[NSArray count](v5, "count");
  if (result)
  {
    v7 = objc_msgSend(-[NSArray objectAtIndex:](v5, "objectAtIndex:", 0), "stringByAppendingPathComponent:", a1);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v8);
    if (v8)
    {
      result = 0;
      if (a3)
        *a3 = v8;
    }
    else
    {
      return objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v7, 1);
    }
  }
  return result;
}

void *DYFSCanWriteAtURL(void *result)
{
  if (result)
  {
    result = (void *)objc_msgSend(result, "URLByDeletingLastPathComponent");
    if (result)
      return (void *)(access((const char *)objc_msgSend((id)objc_msgSend(result, "path"), "UTF8String"), 2) == 0);
  }
  return result;
}

const char *GTMessageKindAsString(int a1)
{
  char *v1;
  int v2;

  if (a1 > 1791)
  {
    if (a1 <= 4095)
    {
      switch(a1)
      {
        case 2304:
          v1 = "kDYMessageFSStreamInitializeTransfer";
          break;
        case 2305:
          v1 = "kDYMessageFSStreamInitializeTransferAck";
          break;
        case 2306:
          v1 = "kDYMessageFSStreamItemData";
          break;
        case 2307:
          v1 = "kDYMessageFSStreamFinishedSending";
          break;
        case 2308:
          v1 = "kDYMessageFSStreamFinishedSendingAck";
          break;
        case 2309:
          v1 = "kDYMessageFSStreamAbort";
          break;
        default:
          switch(a1)
          {
            case 1792:
              v1 = "kDYMessageTraceBufferedFstreamData";
              break;
            case 1793:
              v1 = "kDYMessageTraceConfiguration";
              break;
            case 1794:
              v1 = "kDYMessageTraceOverridesConfiguration";
              break;
            case 1795:
              v1 = "kDYMessageTraceFlushBuffers";
              break;
            case 1796:
              v1 = "kDYMessageTraceModeChanged";
              break;
            default:
LABEL_109:
              v1 = (char *)GTMessageKindAsString_str();
              snprintf(v1, 0x40uLL, "Unrecognized message: %d", v2);
              break;
          }
          break;
      }
    }
    else
    {
      switch(a1)
      {
        case 4096:
          return "kDYMessageReplayerAppReady";
        case 4097:
        case 4123:
        case 4124:
        case 4125:
        case 4126:
        case 4127:
        case 4128:
          goto LABEL_109;
        case 4098:
          return "kDYMessageReplayerReplayArchive";
        case 4099:
          return "kDYMessageReplayerExperimentResult";
        case 4100:
          return "kDYMessageReplayerReplayFinished";
        case 4101:
          return "kDYMessageReplayerSetBackgroundImage";
        case 4102:
          return "kDYMessageReplayerDeleteAllArchives";
        case 4103:
          return "kDYMessageReplayerBeginDebugArchive";
        case 4104:
          return "kDYMessageReplayerEndDebugArchive";
        case 4105:
          return "kDYMessageReplayerDebugStatus";
        case 4106:
          return "kDYMessageReplayerDebugFuncStop";
        case 4107:
          return "kDYMessageReplayerDebugEnableWireframePresent";
        case 4108:
          return "kDYMessageReplayerDebugEnableDrawCallPresent";
        case 4109:
          return "kDYMessageReplayerDebugWireframeLineWidth";
        case 4110:
          return "kDYMessageReplayerDebugWireframeLineColor";
        case 4111:
          return "kDYMessageReplayerDebugDisableFunctions";
        case 4112:
          return "kDYMessageReplayerDebugEnableFunctions";
        case 4113:
          return "kDYMessageReplayerSetBackgroundImageData";
        case 4114:
          return "kDYMessageReplayerLoadArchives";
        case 4115:
          return "kDYMessageReplayerQueryLoadedArchivesInfo";
        case 4116:
          return "kDYMessageReplayerArchivesDirectoryPath";
        case 4117:
          return "kDYMessageReplayerQueryShaderInfo";
        case 4118:
          return "kDYMessageReplayerDerivedCounterData";
        case 4119:
          return "kDYMessageReplayerGenerateThumbnails";
        case 4120:
          return "kDYMessageReplayerGenerateDependencyGraphThumbnails";
        case 4121:
          return "kDYMessageFetchResourceObjectBatch";
        case 4122:
          return "kDYMessageReplayerDebugEnableOutlinePresent";
        case 4129:
          return "kGTMessageReplayerResourcesUsedForFunctionIndex";
        default:
          if (a1 == 4353)
          {
            v1 = "kGTMessageDiagnosticsReceivedData";
          }
          else
          {
            if (a1 != 4865)
              goto LABEL_109;
            v1 = "kGTMessageRunnablePID";
          }
          break;
      }
    }
  }
  else if (a1 <= 1279)
  {
    if (a1 > 511)
    {
      switch(a1)
      {
        case 1024:
          v1 = "kDYMessageCurrentDrawFramebufferImage";
          break;
        case 1025:
          v1 = "kDYMessageFetchResourceList";
          break;
        case 1026:
          v1 = "kDYMessageFetchResourceObject";
          break;
        case 1027:
          v1 = "kDYMessageFetchState";
          break;
        case 1028:
          v1 = "kDYMessageUpdateResourceObject";
          break;
        case 1029:
          v1 = "kDYMessageClearResourceOverrides";
          break;
        case 1030:
          v1 = "kDYGenerateShaderDebuggerTrace";
          break;
        default:
          if (a1 == 512)
          {
            v1 = "kDYMessageBreakpoint";
          }
          else
          {
            if (a1 != 513)
              goto LABEL_109;
            v1 = "kDYMessageBreakpointContinue";
          }
          break;
      }
    }
    else
    {
      v1 = "kDYMessageCaptureStart";
      switch(a1)
      {
        case 256:
          return v1;
        case 257:
          v1 = "kDYMessageCaptureStarted";
          break;
        case 258:
          v1 = "kDYMessageCaptureData";
          break;
        case 259:
          v1 = "kDYMessageCaptureCreateAlias";
          break;
        case 260:
          v1 = "kDYMessageCaptureStop";
          break;
        case 262:
          v1 = "kDYMessageCaptureDataReferenceCounts";
          break;
        case 263:
          v1 = "kDYMessageCaptureSentAllData";
          break;
        case 264:
          v1 = "kDYMessageCaptureActivateSession";
          break;
        case 265:
          v1 = "kDYMessageCaptureInvalidateSession";
          break;
        case 266:
          v1 = "kDYMessageCaptureSentUsedData";
          break;
        case 267:
          v1 = "kDYMessageCaptureSentAllMetadata";
          break;
        case 271:
          v1 = "kDYMessageCaptureDataChunk";
          break;
        default:
          goto LABEL_109;
      }
    }
  }
  else
  {
    switch(a1)
    {
      case 1280:
        v1 = "kDYMessageLaunchGuestApp";
        break;
      case 1281:
        v1 = "kDYMessageKillGuestApp";
        break;
      case 1282:
        v1 = "kDYMessageGuestAppTerminated";
        break;
      case 1283:
        v1 = "kDYMessageTerminateDaemon";
        break;
      case 1284:
        v1 = "kDYMessageApplicationList";
        break;
      case 1285:
        v1 = "kDYMessageApplicationIcon";
        break;
      case 1286:
        v1 = "kDYMessageDaemonCreateGuestAppTransport";
        break;
      case 1287:
        v1 = "kDYMessageMobileDaemonReloadUIServer";
        break;
      case 1288:
        v1 = "kDYMessageSendGuestAppToBackground";
        break;
      case 1289:
        v1 = "kDYMessageBringGuestAppToForeground";
        break;
      case 1290:
        v1 = "kDYMessageGPUToolsVersionQuery";
        break;
      case 1291:
        v1 = "kDYMessageMobileDaemonPosixSpawn";
        break;
      case 1292:
        v1 = "kDYMessageDaemonRegisterInferior";
        break;
      case 1293:
        v1 = "kDYDaemonResumeInferior";
        break;
      case 1294:
        v1 = "kDYMessageDaemonDeviceCapabilities";
        break;
      case 1295:
        v1 = "kDYMessageDaemonLaunchDebugServer";
        break;
      case 1296:
      case 1297:
        goto LABEL_109;
      case 1298:
        v1 = "kDYMessageDeviceCompatibilityCapabilities";
        break;
      default:
        switch(a1)
        {
          case 1536:
            v1 = "kDYMessageInferiorLaunched";
            break;
          case 1537:
            v1 = "kDYMessageInferiorSignalInterposeSemaphore";
            break;
          case 1538:
            v1 = "kDYMessageGuestAppCSSignature";
            break;
          case 1539:
            v1 = "kDYMessageGuestAppTimebase";
            break;
          case 1540:
            v1 = "kDYMessageGuestAppInvalidateSavePointerAliases";
            break;
          case 1541:
            v1 = "kDYMessageGuestAppProfilingData";
            break;
          case 1542:
            v1 = "kDYMessageGuestAppGLContextsInfo";
            break;
          case 1543:
            v1 = "kDYMessageGuestAppCADisplayLinkEvent";
            break;
          case 1544:
            v1 = "kDYMessageGuestAppMultitaskingSuspensionState";
            break;
          case 1545:
            v1 = "kDYMessageGuestAppLockGraphics";
            break;
          case 1546:
            v1 = "kDYMessageGuestAppUnlockGraphics";
            break;
          case 1547:
            v1 = "kDYMessageGuestAppMTLCommandQueuesInfo";
            break;
          case 1548:
            v1 = "kDYMessageGuestAppMTLCommandBuffersCaptured";
            break;
          case 1549:
            v1 = "kDYMessageGuestAppMTLCaptureScopesInfo";
            break;
          case 1550:
            v1 = "kDYMessageGuestAppCAMetalLayersInfo";
            break;
          case 1551:
            v1 = "kDYMessageGuestAppMTLDevicesInfo";
            break;
          default:
            goto LABEL_109;
        }
        break;
    }
  }
  return v1;
}

const char *GTResourceTypeAsString(uint64_t a1)
{
  if (a1 <= 21)
  {
    if (a1 == 1)
      return "Texture";
    if (a1 == 2)
      return "Buffer";
  }
  else
  {
    switch(a1)
    {
      case 22:
        return "Threadgroup buffer";
      case 24:
        return "Indirect command buffer";
      case 39:
        return "Rasterization rate map";
    }
  }
  return "Resource";
}

size_t DYIOSurfaceUtilsPlaneCount(__IOSurface *a1)
{
  size_t result;

  result = IOSurfaceGetPlaneCount(a1);
  if (!result)
    return IOSurfaceGetAllocSize(a1) != 0;
  return result;
}

uint64_t DYIOSurfaceUtilsGetPlaneInfo@<X0>(__IOSurface *a1@<X0>, size_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;
  uint64_t v7;

  *(_QWORD *)(a3 + 40) = 0;
  *(_OWORD *)(a3 + 24) = 0u;
  *(_OWORD *)(a3 + 8) = 0u;
  *(_QWORD *)a3 = a2;
  *(_QWORD *)(a3 + 16) = IOSurfaceGetHeightOfPlane(a1, a2);
  *(_QWORD *)(a3 + 8) = IOSurfaceGetWidthOfPlane(a1, a2);
  *(_QWORD *)(a3 + 24) = IOSurfaceGetBytesPerRowOfPlane(a1, a2);
  *(_QWORD *)(a3 + 32) = IOSurfaceGetBytesPerElementOfPlane(a1, a2);
  result = IOSurfaceGetPixelFormat(a1);
  *(_DWORD *)(a3 + 40) = result;
  if ((_DWORD)result == 1647534392)
  {
    v7 = 4;
    if (a2)
      v7 = 1;
    *(_QWORD *)(a3 + 32) = v7;
  }
  return result;
}

size_t DYIOSurfaceUtilsPerPlaneInfo(__IOSurface *a1, uint64_t a2, uint64_t (*a3)(uint64_t, _BYTE *))
{
  size_t result;
  size_t v7;
  size_t i;
  _BYTE v9[48];

  result = DYIOSurfaceUtilsPlaneCount(a1);
  if (result)
  {
    v7 = result;
    for (i = 0; i != v7; ++i)
    {
      DYIOSurfaceUtilsGetPlaneInfo(a1, i, (uint64_t)v9);
      result = a3(a2, v9);
    }
  }
  return result;
}

uint64_t DYIOSurfaceUtilsStorePlaneData(__IOSurface *a1, uint64_t a2, uint64_t a3, unsigned __int8 a4, char a5)
{
  _QWORD v7[4];
  uint64_t v8;

  v7[3] = a3;
  v7[0] = a1;
  v7[1] = a2;
  v8 = a4;
  BYTE1(v8) = a5;
  BYTE2(v8) = 1;
  v7[2] = 0;
  IOSurfaceLock(a1, 1u, 0);
  DYIOSurfaceUtilsPerPlaneInfo(a1, (uint64_t)v7, (uint64_t (*)(uint64_t, _BYTE *))StorePlaneData);
  return IOSurfaceUnlock(a1, 1u, 0);
}

void StorePlaneData()
{
  uint64_t v0;
  size_t *v1;
  size_t *v2;
  uint64_t v3;
  size_t v4;
  char *v5;
  uint64_t v6;
  char *BaseAddressOfPlane;
  char *v8;
  size_t v9;
  char *v10;
  size_t v11;
  size_t v12;
  char v13;
  uint64_t v14;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v3 = v0;
  v14 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(v0 + 34) || *(_QWORD *)(v0 + 24) == *v1)
  {
    if (*(_BYTE *)(v0 + 32))
      v4 = v1[4] * v1[1];
    else
      v4 = v1[3];
    v5 = *(char **)(v0 + 8);
    v6 = *(_QWORD *)(v0 + 16);
    BaseAddressOfPlane = (char *)IOSurfaceGetBaseAddressOfPlane(*(IOSurfaceRef *)v0, *v1);
    if (BaseAddressOfPlane)
    {
      v8 = BaseAddressOfPlane;
      if (*(_BYTE *)(v3 + 33))
      {
        v9 = v2[3];
        if (v9 <= 0x10000)
          v10 = &v13;
        else
          v10 = (char *)malloc_type_malloc(v9, 0xEC887224uLL);
        if (v2[2])
        {
          v12 = 0;
          do
          {
            memcpy(v10, &v8[v2[3] * v12], v2[3]);
            memcpy(&v5[v6], v10, v4);
            v6 += v4;
            ++v12;
          }
          while (v12 < v2[2]);
        }
        if (v2[3] > 0x10000)
          free(v10);
      }
      else if (v2[2])
      {
        v11 = 0;
        do
        {
          memcpy(&v5[v6], &v8[v2[3] * v11], v4);
          v6 += v4;
          ++v11;
        }
        while (v11 < v2[2]);
      }
    }
    else
    {
      bzero(v5, v2[2] * v4);
    }
    *(_QWORD *)(v3 + 16) = v6;
  }
}

uint64_t DYIOSurfaceUtilsStoreData(__IOSurface *a1, uint64_t a2, unsigned __int8 a3, char a4)
{
  _QWORD v6[4];
  uint64_t v7;

  v6[3] = 0;
  v6[1] = a2;
  v6[2] = 0;
  v6[0] = a1;
  v7 = a3;
  BYTE1(v7) = a4;
  IOSurfaceLock(a1, 1u, 0);
  DYIOSurfaceUtilsPerPlaneInfo(a1, (uint64_t)v6, (uint64_t (*)(uint64_t, _BYTE *))StorePlaneData);
  return IOSurfaceUnlock(a1, 1u, 0);
}

uint64_t DYGetGuestAppClient(int a1)
{
  if (g_init_guest_app_client_once != -1)
    dispatch_once_f(&g_init_guest_app_client_once, 0, (dispatch_function_t)init_guest_app_client);
  dispatch_sync((dispatch_queue_t)g_set_app_client[a1], &__block_literal_global_5);
  return g_app_client[a1];
}

void init_guest_app_client(void *a1)
{
  g_set_app_client = (uint64_t)dispatch_queue_create(0, 0);
  dispatch_suspend((dispatch_object_t)g_set_app_client);
  qword_256BB8BF0 = (uint64_t)dispatch_queue_create(0, 0);
  dispatch_suspend((dispatch_object_t)qword_256BB8BF0);
}

void DYSetGuestAppClient(int a1, uint64_t a2)
{
  dispatch_once_t *v4;
  _QWORD v5[5];
  int v6;

  if (g_init_guest_app_client_once != -1)
    dispatch_once_f(&g_init_guest_app_client_once, 0, (dispatch_function_t)init_guest_app_client);
  v4 = (dispatch_once_t *)((char *)&DYSetGuestAppClient::onceToken + 8 * a1);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __DYSetGuestAppClient_block_invoke;
  v5[3] = &unk_250D62BA8;
  v6 = a1;
  v5[4] = a2;
  if (*v4 != -1)
    dispatch_once(v4, v5);
}

uint64_t DYGetGlobalClientTransport(void *a1)
{
  if (g_init_guest_app_client_once != -1)
    dispatch_once_f(&g_init_guest_app_client_once, 0, (dispatch_function_t)init_guest_app_client);
  return objc_msgSend(a1, "valueForKey:", CFSTR("transport"));
}

uint64_t DYGetGlobalTransportSource(void *a1)
{
  if (g_init_guest_app_client_once != -1)
    dispatch_once_f(&g_init_guest_app_client_once, 0, (dispatch_function_t)init_guest_app_client);
  return objc_msgSend(a1, "valueForKey:", CFSTR("source"));
}

uint64_t DYDisableBufferSwaps(uint64_t a1)
{
  if (g_interpose_api_once != -1)
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  return g_interpose_api(a1);
}

uint64_t init_interpose_api(void *a1, uint64_t a2, uint64_t a3, const char *a4, const char *a5)
{
  void *v5;
  void *v6;
  char *v8;
  const char *v9;

  v5 = DYGetInterposeDylibHandle(272, a2, a3, a4, a5);
  if (!v5)
  {
    v8 = dlerror();
    dy_abort("failed to dlopen interpose dylib: %s", v8);
  }
  v6 = v5;
  g_interpose_api = dlsym(v5, "reset_graphics_timing");
  if (!g_interpose_api)
  {
    v9 = "g_interpose_api.reset_graphics_timing != nullptr";
    goto LABEL_14;
  }
  g_interpose_api = dlsym(v6, "get_graphics_timing");
  if (!g_interpose_api)
  {
    v9 = "g_interpose_api.get_graphics_timing != nullptr";
    goto LABEL_14;
  }
  g_interpose_api = dlsym(v6, "get_profiling_data");
  if (!g_interpose_api)
  {
    v9 = "g_interpose_api.get_profiling_data != nullptr";
    goto LABEL_14;
  }
  g_interpose_api = dlsym(v6, "get_all_per_function_profiling_data");
  if (!g_interpose_api)
  {
    v9 = "g_interpose_api.get_all_per_function_profiling_data != nullptr";
    goto LABEL_14;
  }
  g_interpose_api = dlsym(v6, "disable_buffer_swaps");
  if (!g_interpose_api)
  {
    v9 = "g_interpose_api.disable_buffer_swaps != nullptr";
LABEL_14:
    __assert_rtn("void init_interpose_api(void *)", "", 0, v9);
  }
  return dlclose(v6);
}

uint64_t DYResetGraphicsTiming()
{
  if (g_interpose_api_once != -1)
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  return g_interpose_api();
}

uint64_t DYGetGraphicsTiming(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (g_interpose_api_once != -1)
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  return g_interpose_api(a1, a2, a3);
}

uint64_t DYGetProfilingData()
{
  if (g_interpose_api_once != -1)
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  return g_interpose_api();
}

uint64_t DYGetAllPerFunctionProfilingData()
{
  if (g_interpose_api_once != -1)
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  return g_interpose_api();
}

uint64_t DYGetInterposeVersion()
{
  return 65538;
}

void sub_23C6E3214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, a3);
  MEMORY[0x242622C98](v3, 0x10B0C40F47DA5FCLL);
  GPUTools::FD::IFunctionDecoder::~IFunctionDecoder((GPUTools::FD::IFunctionDecoder *)va);
  _Unwind_Resume(a1);
}

void sub_23C6E364C(_Unwind_Exception *a1, volatile int *a2)
{
  GPUTools::DYLockUtils::Unlock((os_unfair_lock_t)&sDisplayLinkIdleTimeLock, a2);
  _Unwind_Resume(a1);
}

void sub_23C6E374C(_Unwind_Exception *a1, volatile int *a2)
{
  GPUTools::DYLockUtils::Unlock((os_unfair_lock_t)&sDisplayLinkIdleTimeLock, a2);
  _Unwind_Resume(a1);
}

uint64_t DYCADisplayLinkInterposeInit(DYGuestAppClient *a1)
{
  if (DYCADisplayLinkInterposeInit(DYGuestAppClient *)::onceToken != -1)
    dispatch_once(&DYCADisplayLinkInterposeInit(DYGuestAppClient *)::onceToken, &__block_literal_global_6);
  return objc_msgSend((id)_appClients, "addObject:", a1);
}

void ___Z28DYCADisplayLinkInterposeInitP16DYGuestAppClient_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  objc_class *v5;
  objc_method *ClassMethod;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *__p;
  void *v11;
  _QWORD *v12;

  v9 = objc_opt_class();
  v8 = objc_opt_class();
  v7 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = operator new(0xE0uLL);
  v12 = v4 + 28;
  *v4 = v9;
  v4[1] = sel__initWithDisplayLink_;
  v4[2] = &o_CADisplayLink_initWithDisplayLink;
  v4[3] = CADisplayLink_initWithDisplayLink;
  v4[4] = v8;
  v4[5] = sel__initWithDisplayLinkItem_;
  v4[6] = &o_CADisplayLink_initWithDisplayLink;
  v4[7] = CADisplayLink_initWithDisplayLink;
  v4[8] = v7;
  v4[9] = sel_setFrameInterval_;
  v4[10] = &o_CADisplayLink_setFrameInterval;
  v4[11] = CADisplayLink_setFrameInterval;
  v4[12] = v0;
  v4[13] = sel_setPreferredFramesPerSecond_;
  v4[14] = &o_CADisplayLink_setPreferredFramesPerSecond;
  v4[15] = CADisplayLink_setPreferredFramesPerSecond;
  v4[16] = v1;
  v4[17] = sel_addToRunLoop_forMode_;
  v4[18] = &o_CADisplayLink_addToRunLoopForMode;
  v4[19] = CADisplayLink_addToRunLoopForMode;
  v4[20] = v2;
  v4[21] = sel_removeFromRunLoop_forMode_;
  v4[22] = &o_CADisplayLink_removeFromRunLoopForMode;
  v4[23] = CADisplayLink_removeFromRunLoopForMode;
  v4[24] = v3;
  v4[25] = sel_invalidate;
  v4[26] = &o_CADisplayLink_invalidate;
  v4[27] = CADisplayLink_invalidate;
  __p = v4;
  v11 = v4 + 28;
  GPUTools::Interpose::DYInstallObjCMethodOverrides((Method)&__p);
  v5 = (objc_class *)objc_opt_class();
  ClassMethod = class_getClassMethod(v5, sel_displayLinkWithDisplay_target_selector_);
  if (!ClassMethod)
    __assert_rtn("void DYCADisplayLinkInterposeInit(DYGuestAppClient *)_block_invoke", "", 0, "method");
  o_CADisplayLink_displayLinkWithDisplay_target_selector = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))method_setImplementation(ClassMethod, (IMP)CADisplayLink_displayLinkWithDisplay_target_selector);
  _appClients = (uint64_t)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (__p)
  {
    v11 = __p;
    operator delete(__p);
  }
}

void sub_23C6E3A10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

CADisplayLink *CADisplayLink_initWithDisplayLink(CADisplayLink *a1, objc_selector *a2, void *a3)
{
  volatile int *v3;
  CADisplayLink *v4;
  uint64_t v5;
  uint64_t v6;
  volatile int *v7;
  volatile int *v8;
  uint64_t IntervalDictionary;
  _QWORD v11[5];
  CADisplayLink *v12;
  CADisplayLink **v13;

  v4 = (CADisplayLink *)o_CADisplayLink_initWithDisplayLink(a1, a2, a3);
  if (v4)
  {
    GPUTools::DYLockUtils::Lock((os_unfair_lock_t)&sDisplayLinkIdentifierMapLock, v3);
    v5 = spDisplayLinkIdentifierMap;
    if (!spDisplayLinkIdentifierMap)
    {
      v5 = operator new();
      *(_OWORD *)v5 = 0u;
      *(_OWORD *)(v5 + 16) = 0u;
      *(_DWORD *)(v5 + 32) = 1065353216;
      spDisplayLinkIdentifierMap = v5;
    }
    v6 = ++_CreateCADisplayLinkIdentifierFor(CADisplayLink *)::sDisplayLinkIdentifier;
    v12 = v4;
    v13 = &v12;
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void *&&>,std::tuple<>>(v5, &v12, (uint64_t)&std::piecewise_construct, &v13)[3] = v6;
    GPUTools::DYLockUtils::Unlock((os_unfair_lock_t)&sDisplayLinkIdentifierMapLock, v7);
    IntervalDictionary = _GetIntervalDictionary(v4, v8);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = ___ZL33CADisplayLink_initWithDisplayLinkP13CADisplayLinkP13objc_selectorPv_block_invoke;
    v11[3] = &unk_250D62BF0;
    v11[4] = IntervalDictionary;
    objc_msgSend((id)_appClients, "enumerateObjectsUsingBlock:", v11);
  }
  return v4;
}

void sub_23C6E3B3C(_Unwind_Exception *a1, volatile int *a2)
{
  GPUTools::DYLockUtils::Unlock((os_unfair_lock_t)&sDisplayLinkIdentifierMapLock, a2);
  _Unwind_Resume(a1);
}

uint64_t CADisplayLink_setFrameInterval(CADisplayLink *a1, objc_selector *a2)
{
  volatile int *v3;
  uint64_t IntervalDictionary;
  _QWORD v6[5];

  o_CADisplayLink_setFrameInterval(a1, a2);
  IntervalDictionary = _GetIntervalDictionary(a1, v3);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = ___ZL30CADisplayLink_setFrameIntervalP13CADisplayLinkP13objc_selectorl_block_invoke;
  v6[3] = &unk_250D62BF0;
  v6[4] = IntervalDictionary;
  return objc_msgSend((id)_appClients, "enumerateObjectsUsingBlock:", v6);
}

uint64_t CADisplayLink_setPreferredFramesPerSecond(CADisplayLink *a1, objc_selector *a2)
{
  volatile int *v3;
  uint64_t IntervalDictionary;
  _QWORD v6[5];

  o_CADisplayLink_setPreferredFramesPerSecond(a1, a2);
  IntervalDictionary = _GetIntervalDictionary(a1, v3);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = ___ZL41CADisplayLink_setPreferredFramesPerSecondP13CADisplayLinkP13objc_selectorl_block_invoke;
  v6[3] = &unk_250D62BF0;
  v6[4] = IntervalDictionary;
  return objc_msgSend((id)_appClients, "enumerateObjectsUsingBlock:", v6);
}

uint64_t CADisplayLink_addToRunLoopForMode(CADisplayLink *a1, objc_selector *a2, NSRunLoop *a3, NSString *a4)
{
  volatile int *v7;
  uint64_t CADisplayLinkIdentifierFor;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[5];

  o_CADisplayLink_addToRunLoopForMode(a1, a2);
  CADisplayLinkIdentifierFor = _GetCADisplayLinkIdentifierFor(a1, v7);
  v9 = (void *)MEMORY[0x24BDBCE70];
  v10 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", CADisplayLinkIdentifierFor);
  v11 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", &unk_250D6E320, CFSTR("event"), v10, CFSTR("identifier"), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3), CFSTR("runLoop"), a4, CFSTR("mode"), 0);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = ___ZL33CADisplayLink_addToRunLoopForModeP13CADisplayLinkP13objc_selectorP9NSRunLoopP8NSString_block_invoke;
  v13[3] = &unk_250D62BF0;
  v13[4] = v11;
  return objc_msgSend((id)_appClients, "enumerateObjectsUsingBlock:", v13);
}

uint64_t CADisplayLink_removeFromRunLoopForMode(CADisplayLink *a1, objc_selector *a2, NSRunLoop *a3, NSString *a4)
{
  volatile int *v7;
  uint64_t CADisplayLinkIdentifierFor;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[5];

  o_CADisplayLink_removeFromRunLoopForMode(a1, a2);
  CADisplayLinkIdentifierFor = _GetCADisplayLinkIdentifierFor(a1, v7);
  v9 = (void *)MEMORY[0x24BDBCE70];
  v10 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", CADisplayLinkIdentifierFor);
  v11 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", &unk_250D6E338, CFSTR("event"), v10, CFSTR("identifier"), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3), CFSTR("runLoop"), a4, CFSTR("mode"), 0);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = ___ZL38CADisplayLink_removeFromRunLoopForModeP13CADisplayLinkP13objc_selectorP9NSRunLoopP8NSString_block_invoke;
  v13[3] = &unk_250D62BF0;
  v13[4] = v11;
  return objc_msgSend((id)_appClients, "enumerateObjectsUsingBlock:", v13);
}

uint64_t CADisplayLink_invalidate(CADisplayLink *a1, objc_selector *a2)
{
  uint64_t v4;
  volatile int *v5;
  volatile int *v6;
  _QWORD v8[5];
  CADisplayLink *v9;

  v4 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", &unk_250D6E350, CFSTR("event"), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", _GetCADisplayLinkIdentifierFor(a1, (volatile int *)a2)), CFSTR("identifier"), 0);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = ___ZL24CADisplayLink_invalidateP13CADisplayLinkP13objc_selector_block_invoke;
  v8[3] = &unk_250D62BF0;
  v8[4] = v4;
  objc_msgSend((id)_appClients, "enumerateObjectsUsingBlock:", v8);
  GPUTools::DYLockUtils::Lock((os_unfair_lock_t)&sDisplayLinkIdentifierMapLock, v5);
  if (spDisplayLinkIdentifierMap)
  {
    v9 = a1;
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__erase_unique<void *>((_QWORD *)spDisplayLinkIdentifierMap, &v9);
  }
  GPUTools::DYLockUtils::Unlock((os_unfair_lock_t)&sDisplayLinkIdentifierMapLock, v6);
  return o_CADisplayLink_invalidate(a1, a2);
}

void sub_23C6E3F4C(_Unwind_Exception *a1, volatile int *a2)
{
  GPUTools::DYLockUtils::Unlock((os_unfair_lock_t)&sDisplayLinkIdentifierMapLock, a2);
  _Unwind_Resume(a1);
}

uint64_t CADisplayLink_displayLinkWithDisplay_target_selector(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  DYDisplayLinkInterposer *v8;
  uint64_t v9;

  v8 = -[DYDisplayLinkInterposer initWithTarget:selector:]([DYDisplayLinkInterposer alloc], "initWithTarget:selector:", a4, a5);
  v9 = o_CADisplayLink_displayLinkWithDisplay_target_selector(a1, a2, a3, v8, sel_forwardDisplayLinkCallback_);

  return v9;
}

uint64_t _GetIntervalDictionary(CADisplayLink *a1, volatile int *a2)
{
  uint64_t CADisplayLinkIdentifierFor;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  CADisplayLinkIdentifierFor = _GetCADisplayLinkIdentifierFor(a1, a2);
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", CADisplayLinkIdentifierFor);
  v6 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CADisplayLink preferredFramesPerSecond](a1, "preferredFramesPerSecond"));
  return objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", &unk_250D6E308, CFSTR("event"), v5, CFSTR("identifier"), v6, CFSTR("targetFPS"), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CADisplayLink frameInterval](a1, "frameInterval")), CFSTR("interval"), 0);
}

uint64_t ___ZL33CADisplayLink_initWithDisplayLinkP13CADisplayLinkP13objc_selectorPv_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sendMessage:", +[DYTransportMessage messageWithKind:attributes:plistPayload:](DYTransportMessage, "messageWithKind:attributes:plistPayload:", 1543, 0, *(_QWORD *)(a1 + 32)));
}

_QWORD *std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void *&&>,std::tuple<>>(uint64_t a1, _QWORD *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  _QWORD **v12;
  _QWORD *i;
  unint64_t v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;

  v7 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  v8 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v7 >> 47) ^ v7);
  v9 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      v4 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
      if (v9 >= v10)
        v4 = v9 % v10;
    }
    else
    {
      v4 = v9 & (v10 - 1);
    }
    v12 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v4);
    if (v12)
    {
      for (i = *v12; i; i = (_QWORD *)*i)
      {
        v14 = i[1];
        if (v14 == v9)
        {
          if (i[2] == *a2)
            return i;
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v14 >= v10)
              v14 %= v10;
          }
          else
          {
            v14 &= v10 - 1;
          }
          if (v14 != v4)
            break;
        }
      }
    }
  }
  i = operator new(0x20uLL);
  *i = 0;
  i[1] = v9;
  i[2] = **a4;
  i[3] = 0;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v10 || (float)(v16 * (float)v10) < v15)
  {
    v17 = 1;
    if (v10 >= 3)
      v17 = (v10 & (v10 - 1)) != 0;
    v18 = v17 | (2 * v10);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v20);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v4 = v9 % v10;
      else
        v4 = v9;
    }
    else
    {
      v4 = (v10 - 1) & v9;
    }
  }
  v21 = *(_QWORD *)a1;
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v22)
  {
    *i = *v22;
LABEL_38:
    *v22 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v21 + 8 * v4) = a1 + 16;
  if (*i)
  {
    v23 = *(_QWORD *)(*i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v23 >= v10)
        v23 %= v10;
    }
    else
    {
      v23 &= v10 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_23C6E433C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

uint64_t _GetCADisplayLinkIdentifierFor(CADisplayLink *a1, volatile int *a2)
{
  volatile int *v3;
  _QWORD *v4;
  uint64_t v5;
  CADisplayLink *v7;

  GPUTools::DYLockUtils::Lock((os_unfair_lock_t)&sDisplayLinkIdentifierMapLock, a2);
  if (spDisplayLinkIdentifierMap
    && (v7 = a1,
        (v4 = std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::find<void *>((_QWORD *)spDisplayLinkIdentifierMap, &v7)) != 0))
  {
    v5 = v4[3];
  }
  else
  {
    v5 = 0;
  }
  GPUTools::DYLockUtils::Unlock((os_unfair_lock_t)&sDisplayLinkIdentifierMapLock, v3);
  return v5;
}

void sub_23C6E45EC(_Unwind_Exception *a1, volatile int *a2)
{
  GPUTools::DYLockUtils::Unlock((os_unfair_lock_t)&sDisplayLinkIdentifierMapLock, a2);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::find<void *>(_QWORD *a1, _QWORD *a2)
{
  int8x8_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint8x8_t v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *result;
  unint64_t v10;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  v4 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v3 >> 47) ^ v3);
  v5 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
  v6 = (uint8x8_t)vcnt_s8(v2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    v7 = v5;
    if (v5 >= *(_QWORD *)&v2)
      v7 = v5 % *(_QWORD *)&v2;
  }
  else
  {
    v7 = v5 & (*(_QWORD *)&v2 - 1);
  }
  v8 = *(_QWORD **)(*a1 + 8 * v7);
  if (!v8)
    return 0;
  result = (_QWORD *)*v8;
  if (*v8)
  {
    do
    {
      v10 = result[1];
      if (v10 == v5)
      {
        if (result[2] == *a2)
          return result;
      }
      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v10 >= *(_QWORD *)&v2)
            v10 %= *(_QWORD *)&v2;
        }
        else
        {
          v10 &= *(_QWORD *)&v2 - 1;
        }
        if (v10 != v7)
          return 0;
      }
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

uint64_t ___ZL41CADisplayLink_setPreferredFramesPerSecondP13CADisplayLinkP13objc_selectorl_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sendMessage:", +[DYTransportMessage messageWithKind:attributes:plistPayload:](DYTransportMessage, "messageWithKind:attributes:plistPayload:", 1543, 0, *(_QWORD *)(a1 + 32)));
}

uint64_t ___ZL30CADisplayLink_setFrameIntervalP13CADisplayLinkP13objc_selectorl_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sendMessage:", +[DYTransportMessage messageWithKind:attributes:plistPayload:](DYTransportMessage, "messageWithKind:attributes:plistPayload:", 1543, 0, *(_QWORD *)(a1 + 32)));
}

uint64_t ___ZL33CADisplayLink_addToRunLoopForModeP13CADisplayLinkP13objc_selectorP9NSRunLoopP8NSString_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sendMessage:", +[DYTransportMessage messageWithKind:attributes:plistPayload:](DYTransportMessage, "messageWithKind:attributes:plistPayload:", 1543, 0, *(_QWORD *)(a1 + 32)));
}

uint64_t ___ZL38CADisplayLink_removeFromRunLoopForModeP13CADisplayLinkP13objc_selectorP9NSRunLoopP8NSString_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sendMessage:", +[DYTransportMessage messageWithKind:attributes:plistPayload:](DYTransportMessage, "messageWithKind:attributes:plistPayload:", 1543, 0, *(_QWORD *)(a1 + 32)));
}

uint64_t ___ZL24CADisplayLink_invalidateP13CADisplayLinkP13objc_selector_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sendMessage:", +[DYTransportMessage messageWithKind:attributes:plistPayload:](DYTransportMessage, "messageWithKind:attributes:plistPayload:", 1543, 0, *(_QWORD *)(a1 + 32)));
}

uint64_t *std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__erase_unique<void *>(_QWORD *a1, _QWORD *a2)
{
  uint64_t *result;

  result = std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::find<void *>(a1, a2);
  if (result)
  {
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::erase(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::erase(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  void *v3;
  void *__p;

  v2 = *a2;
  std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::remove(a1, a2, (uint64_t)&__p);
  v3 = __p;
  __p = 0;
  if (v3)
    operator delete(v3);
  return v2;
}

_QWORD *std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::remove@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3;
  unint64_t v4;
  uint8x8_t v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3 = (int8x8_t)result[1];
  v4 = a2[1];
  v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(_QWORD *)&v3)
      v4 %= *(_QWORD *)&v3;
  }
  else
  {
    v4 &= *(_QWORD *)&v3 - 1;
  }
  v6 = *(_QWORD **)(*result + 8 * v4);
  do
  {
    v7 = v6;
    v6 = (_QWORD *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2)
    goto LABEL_18;
  v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(_QWORD *)&v3)
      v8 %= *(_QWORD *)&v3;
  }
  else
  {
    v8 &= *(_QWORD *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2)
      goto LABEL_19;
    v9 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(_QWORD *)&v3)
        v9 %= *(_QWORD *)&v3;
    }
    else
    {
      v9 &= *(_QWORD *)&v3 - 1;
    }
    if (v9 != v4)
LABEL_19:
      *(_QWORD *)(*result + 8 * v4) = 0;
  }
  v10 = *a2;
  if (*a2)
  {
    v11 = *(_QWORD *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(_QWORD *)&v3)
        v11 %= *(_QWORD *)&v3;
    }
    else
    {
      v11 &= *(_QWORD *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(_QWORD *)(*result + 8 * v11) = v7;
      v10 = *a2;
    }
  }
  *v7 = v10;
  *a2 = 0;
  --result[3];
  *(_QWORD *)a3 = a2;
  *(_QWORD *)(a3 + 8) = result + 2;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

_QWORD *std::__hash_table<std::__hash_value_type<_opaque_pthread_t *,unsigned long long>,std::__unordered_map_hasher<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,unsigned long long>,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,true>,std::__unordered_map_equal<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,unsigned long long>,std::equal_to<_opaque_pthread_t *>,std::hash<_opaque_pthread_t *>,true>,std::allocator<std::__hash_value_type<_opaque_pthread_t *,unsigned long long>>>::__emplace_unique_key_args<_opaque_pthread_t *,std::piecewise_construct_t const&,std::tuple<_opaque_pthread_t *&&>,std::tuple<>>(uint64_t a1, _QWORD *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  _QWORD **v12;
  _QWORD *i;
  unint64_t v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;

  v7 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  v8 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v7 >> 47) ^ v7);
  v9 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      v4 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
      if (v9 >= v10)
        v4 = v9 % v10;
    }
    else
    {
      v4 = v9 & (v10 - 1);
    }
    v12 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v4);
    if (v12)
    {
      for (i = *v12; i; i = (_QWORD *)*i)
      {
        v14 = i[1];
        if (v14 == v9)
        {
          if (i[2] == *a2)
            return i;
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v14 >= v10)
              v14 %= v10;
          }
          else
          {
            v14 &= v10 - 1;
          }
          if (v14 != v4)
            break;
        }
      }
    }
  }
  i = operator new(0x20uLL);
  *i = 0;
  i[1] = v9;
  i[2] = **a4;
  i[3] = 0;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v10 || (float)(v16 * (float)v10) < v15)
  {
    v17 = 1;
    if (v10 >= 3)
      v17 = (v10 & (v10 - 1)) != 0;
    v18 = v17 | (2 * v10);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v20);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v4 = v9 % v10;
      else
        v4 = v9;
    }
    else
    {
      v4 = (v10 - 1) & v9;
    }
  }
  v21 = *(_QWORD *)a1;
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v22)
  {
    *i = *v22;
LABEL_38:
    *v22 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v21 + 8 * v4) = a1 + 16;
  if (*i)
  {
    v23 = *(_QWORD *)(*i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v23 >= v10)
        v23 %= v10;
    }
    else
    {
      v23 &= v10 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_23C6E4C20(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::Interpose::DYInterposeThreadEntry(GPUTools::Interpose *this, void *a2)
{
  if ((int)this >= 2)
    __assert_rtn("void *GPUTools::Interpose::DYInterposeThreadEntry(void *)", "", 0, "idx < kDYGraphicsAPIMax");
  GPUTools::Interpose::DYInterposeCommonInit(*((GPUTools::Interpose **)&GPUTools::Interpose::g_context + (int)this), (DYGuestAppClient *(*)(void))this);
  return 0;
}

uint64_t GPUTools::Interpose::DYInitInterpose(GPUTools::Interpose *this, DYGuestAppClient *(*a2)(void))
{
  int v2;
  char *v4;
  const char *v5;
  __CFBundle *MainBundle;
  const __CFURL *v7;
  uint64_t result;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  dispatch_time_t v14;
  pthread_t v15;
  pthread_attr_t buffer[16];
  uint64_t v17;

  v2 = (int)a2;
  v17 = *MEMORY[0x24BDAC8D0];
  v4 = getenv("GT_TRUE_BINARY");
  if (!v4
    || (v5 = v4,
        MainBundle = CFBundleGetMainBundle(),
        v7 = CFBundleCopyExecutableURL(MainBundle),
        CFURLGetFileSystemRepresentation(v7, 1u, (UInt8 *)buffer, 1024),
        CFRelease(v7),
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "true_binary=%s\npath=%s\n", v5, (const char *)buffer),
        result = strcmp((const char *)buffer, v5),
        !(_DWORD)result))
  {
    unsetenv("DYLD_INSERT_LIBRARIES");
    v9 = getenv("GT_CWD");
    if (v9)
      chdir(v9);
    if (GPUTools::Interpose::DYInitInterpose(DYGuestAppClient * (*)(void),int)::onceToken != -1)
      dispatch_once(&GPUTools::Interpose::DYInitInterpose(DYGuestAppClient * (*)(void),int)::onceToken, &__block_literal_global_7);
    GPUTools::Interpose::g_context[v2] = this;
    __dmb(0xBu);
    pthread_attr_init(buffer);
    pthread_attr_setdetachstate(buffer, 2);
    v15 = 0;
    pthread_create(&v15, buffer, (void *(__cdecl *)(void *))GPUTools::Interpose::DYInterposeThreadEntry, (void *)v2);
    pthread_attr_destroy(buffer);
    v10 = (void *)DYGetGuestAppClient(v2);
    v11 = (void *)DYGetGlobalClientTransport(v10);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (result = objc_msgSend(v11, "deferred"), (result & 1) == 0))
    {
      do
      {
        v12 = (void *)DYGetGuestAppClient(v2);
        result = objc_msgSend((id)DYGetGlobalClientTransport(v12), "invalid");
        if ((result & 1) != 0)
          break;
        v13 = GPUTools::Interpose::gInterposeSemaphore;
        v14 = dispatch_time(0, 2000000000);
        result = dispatch_semaphore_wait(v13, v14);
      }
      while (result);
    }
  }
  return result;
}

dispatch_semaphore_t ___ZN8GPUTools9Interpose15DYInitInterposeEPFP16DYGuestAppClientvEi_block_invoke()
{
  dispatch_semaphore_t result;

  result = dispatch_semaphore_create(0);
  GPUTools::Interpose::gInterposeSemaphore = (uint64_t)result;
  return result;
}

DYError *DYErrorFromDictionary(void *a1)
{
  DYError *result;
  DYError *v3;
  uint64_t v4;
  uint64_t v5;

  result = (DYError *)objc_msgSend(a1, "objectForKey:", CFSTR("error domain"));
  if (result)
  {
    v3 = result;
    v4 = objc_msgSend((id)objc_msgSend(a1, "objectForKey:", CFSTR("error code")), "integerValue");
    v5 = objc_msgSend(a1, "objectForKey:", CFSTR("error description"));
    return +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", v3, v4, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v5, *MEMORY[0x24BDD0FC8]));
  }
  return result;
}

void *DYDictionaryFromError(void *result)
{
  void *v1;
  void *v2;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    v2 = (void *)MEMORY[0x24BDBCE70];
    v3 = objc_msgSend(result, "domain");
    return (void *)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("error domain"), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v1, "code")), CFSTR("error code"), objc_msgSend(v1, "localizedDescription"), CFSTR("error description"), 0);
  }
  return result;
}

uint64_t DYErrorIsTransportError(void *a1)
{
  uint64_t v2;

  if (a1
    && ((v2 = objc_msgSend(a1, "code"), (unint64_t)(v2 - 31) < 0xA) || (v2 & 0xFFFFFFFFFFFFFF00) == 0x100))
  {
    return objc_msgSend((id)objc_msgSend(a1, "domain"), "isEqualToString:", CFSTR("DYErrorDomain"));
  }
  else
  {
    return 0;
  }
}

const __CFString *_StringForError(uint64_t a1)
{
  const __CFString *result;
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (a1 <= 511)
  {
    switch(a1)
    {
      case 1:
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("invalid filename (%ld)"), 1);
      case 2:
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("data is too large (%ld)"), 2);
      case 3:
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("IO failure (%ld)"), 3);
      case 4:
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("out of memory (%ld)"), 4);
      case 5:
        v3 = (void *)MEMORY[0x24BDD17C8];
        v4 = 5;
        goto LABEL_64;
      case 6:
        v3 = (void *)MEMORY[0x24BDD17C8];
        v4 = 6;
LABEL_64:
        result = (const __CFString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("Unable to connect to the device. (%ld)"), v4);
        break;
      case 7:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("read-only capture archive (%ld)"), 7);
        break;
      case 8:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("truncated capture archive store (%ld)"), 8);
        break;
      case 9:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("truncated capture archive index (%ld)"), 9);
        break;
      case 10:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("invalid capture archive index (%ld)"), 10);
        break;
      case 11:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unknown capture archive index version (%ld)"), 11);
        break;
      case 12:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("file exists in capture archive (%ld)"), 12);
        break;
      case 13:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("file does not exists in capture archive (%ld)"), 13);
        break;
      case 14:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("capture archive does not exist (%ld)"), 14);
        break;
      case 15:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("missing capture archive index (%ld)"), 15);
        break;
      case 16:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("invalid capture archive metadata (%ld)"), 16);
        break;
      case 17:
      case 27:
        return 0;
      case 18:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("corrupted capture archive store (%ld)"), 18);
        break;
      case 19:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("could not write capture archive metadata (%ld)"), 19);
        break;
      case 20:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("capture archive has been closed (%ld)"), 20);
        break;
      case 21:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("already tried to launch guest app (%ld)"), 21);
        break;
      case 22:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("invalid launch dictionary (%ld)"), 22);
        break;
      case 23:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("guest app not found (%ld)"), 23);
        break;
      case 24:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("guest app launch timed out (%ld)"), 24);
        break;
      case 25:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("invalid guest app session (%ld)"), 25);
        break;
      case 26:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("guest app has not been launched yet (%ld)"), 26);
        break;
      case 28:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("did not find interpose dylib (%ld)"), 28);
        break;
      case 29:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed to launch guest app (%ld)"), 29);
        break;
      case 30:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("guest app terminated (%ld)"), 30);
        break;
      case 31:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lost transport connection (%ld)"), 31);
        break;
      case 32:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("invalid transport (%ld)"), 32);
        break;
      case 33:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("transport is not connected (%ld)"), 33);
        break;
      case 34:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("message has already been sent (%ld)"), 34);
        break;
      case 35:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("in-reply-to message has not been sent (%ld)"), 35);
        break;
      case 36:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed to encode message attributes (%ld)"), 36);
        break;
      case 37:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("connect timed out (%ld)"), 37);
        break;
      case 38:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("undefined socket path (%ld)"), 38);
        break;
      case 39:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("socket path is too long (%ld)"), 39);
        break;
      case 40:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("message originated from this transport (%ld)"), 40);
        break;
      case 41:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("initialized function stream with immutable data but swapping is required (%ld)"), 41);
        break;
      case 42:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("transfer refused (%ld)"), 42);
        break;
      case 43:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("protocol error (%ld)"), 43);
        break;
      case 44:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("path outside destination root (%ld)"), 44);
        break;
      case 45:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("transfer aborted (%ld)"), 45);
        break;
      case 46:
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unknown item type (%ld)"), 46);
        break;
      default:
        switch(a1)
        {
          case 256:
            result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("invalid socket descriptor (%ld)"), 256);
            break;
          case 257:
            result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("invalid socket url (%ld)"), 257);
            break;
          case 258:
            result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("transport source cancelled (%ld)"), 258);
            break;
          case 259:
            result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("corrupt transport message header (%ld)"), 259);
            break;
          case 260:
            result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("corrupt transport message attributes (%ld)"), 260);
            break;
          case 261:
            result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("message too large (%ld)"), 261);
            break;
          default:
            return 0;
        }
        break;
    }
    return result;
  }
  if (a1 <= 2047)
  {
    if (a1 <= 1023)
    {
      v2 = a1 - 512;
      result = CFSTR("Device connection lost.");
      switch(v2)
      {
        case 0:
          result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("guest app crashed (%ld)"), 512);
          break;
        case 1:
          result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("another capture session is active (%ld)"), 513);
          break;
        case 2:
          result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("capture session is already active (%ld)"), 514);
          break;
        case 3:
          result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("capture session activation failed (%ld)"), 515);
          break;
        case 4:
          result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("inferior already running (%ld)"), 516);
          break;
        case 5:
          result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("GL dispatch table mismatch (%ld)"), 517);
          break;
        case 6:
          result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("inferior and host session ids mismatch (%ld)"), 518);
          break;
        case 7:
          return result;
        default:
          return 0;
      }
      return result;
    }
    if (a1 <= 1279)
    {
      switch(a1)
      {
        case 1024:
          return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("truncated data (%ld)"), 1024);
        case 1025:
          return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("invalid transport message payload (%ld)"), 1025);
        case 1026:
          return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unexpected transport message (%ld)"), 1026);
      }
    }
    else if (a1 > 1791)
    {
      if (a1 == 1792)
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("no data (%ld)"), 1792);
      if (a1 == 1793)
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("guest app session error (%ld)"), 1793);
    }
    else
    {
      if (a1 == 1280)
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("invalid function stream header (%ld)"), 1280);
      if (a1 == 1536)
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("position does not exist in archive (%ld)"), 1536);
    }
    return 0;
  }
  if (a1 <= 4351)
  {
    if (a1 > 2304)
    {
      switch(a1)
      {
        case 2305:
          return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("no archive data (%ld)"), 2305);
        case 2306:
          return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("no thumbnail support (%ld)"), 2306);
        case 4096:
          return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed to create core symbolicator (%ld)"), 4096);
      }
    }
    else
    {
      switch(a1)
      {
        case 2048:
          return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("already replaying (%ld)"), 2048);
        case 2049:
          return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("no loaded archives (%ld)"), 2049);
        case 2304:
          return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("no resource streamer (%ld)"), 2304);
      }
    }
    return 0;
  }
  switch(a1)
  {
    case 4608:
      result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot find the specified username and host (%ld)"), 4608);
      break;
    case 4609:
      result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Specified remote machine is not available. Please make sure to login with specified user (%ld)"), 4609);
      break;
    case 4610:
      result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot find the target path provided (%ld)"), 4610);
      break;
    case 4611:
      result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot authenticate SSH, make sure the authentication is done right (%ld)"), 4611);
      break;
    case 4612:
      result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot find Xcode.app on the remote machine. Please make sure that Xcode.app is in the Applications folder (%ld)"), 4612);
      break;
    case 4613:
      result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Metal.framework is not available on the remote machine (%ld)"), 4613);
      break;
    case 4614:
      result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing environment variables, please make sure all the required environment variables are enabled (%ld)"), 4614);
      break;
    default:
      if (a1 == 4352)
      {
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Shader profiler failed due to an internal error (%ld)"), 4352);
      }
      else
      {
        if (a1 != 4353)
          return 0;
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Shader profiler does not support multi-context captures (%ld)"), 4353);
      }
      break;
  }
  return result;
}

_QWORD *GPUTools::error::__init@<X0>(GPUTools::error *this@<X0>, _QWORD *a2@<X8>)
{
  __CFString *v4;

  v4 = (__CFString *)_StringForError((uint64_t)this);
  if (!v4)
    v4 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unknown error (%ld)"), this);
  return std::string::basic_string[abi:ne180100]<0>(a2, (char *)-[__CFString UTF8String](v4, "UTF8String"));
}

void GPUTools::FB::Decoder::EmitRichSemanticTypes(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5)
{
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v11;

  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_DWORD *)v5;
  switch(a4)
  {
    case 1u:
      v7 = 29;
      if (v6 > 469)
      {
        if (v6 > 799)
        {
          if ((v6 - 800) > 0x2D)
            goto LABEL_62;
          if (((1 << (v6 - 32)) & 0x3C0001800000) != 0)
            goto LABEL_31;
          if (v6 != 800)
          {
LABEL_62:
            if (v6 == 897)
            {
              v8 = 31;
              goto LABEL_71;
            }
            goto LABEL_65;
          }
          goto LABEL_66;
        }
        if (v6 == 470)
        {
          v8 = 22;
          goto LABEL_71;
        }
        if (v6 == 497)
          goto LABEL_67;
      }
      else
      {
        if (v6 > 138)
        {
          if (v6 <= 381)
          {
            switch(v6)
            {
              case 139:
              case 143:
              case 146:
                goto LABEL_31;
              case 140:
                goto LABEL_67;
              default:
                goto LABEL_65;
            }
          }
          if (v6 != 382 && v6 != 384)
          {
            if (v6 == 469)
            {
              v8 = 21;
              goto LABEL_71;
            }
            goto LABEL_65;
          }
LABEL_31:
          v7 = 27;
          goto LABEL_67;
        }
        if (v6 <= 35)
        {
          if (v6 != 2)
          {
            if (v6 != 10)
              goto LABEL_65;
            goto LABEL_31;
          }
LABEL_66:
          v7 = 32;
LABEL_67:
          *(_DWORD *)(a3 + 12) = v7;
          goto LABEL_68;
        }
        if (v6 == 36)
        {
LABEL_8:
          v8 = 20;
LABEL_71:
          *(_DWORD *)(a3 + 12) = v8;
          return;
        }
        if (v6 == 44)
          goto LABEL_66;
      }
LABEL_65:
      if ((v6 - 386) <= 0x1F)
        goto LABEL_66;
LABEL_68:
      if (a4 && (v6 & 0xFFFFFFFE) == 0x1A)
      {
        v8 = 28;
        goto LABEL_71;
      }
      if (a4)
      {
        v8 = 17;
        if (v6 == 78 || v6 == 131 || a4 >= 2 && v6 == 79)
          goto LABEL_71;
      }
      if (a5 == 1 && v6 == 235)
      {
        v8 = 30;
        goto LABEL_71;
      }
      return;
    case 2u:
      if (v6 > 246)
      {
        v7 = 25;
        switch(v6)
        {
          case 879:
          case 881:
          case 885:
            goto LABEL_67;
          case 880:
          case 883:
          case 884:
            goto LABEL_68;
          case 882:
            goto LABEL_47;
          default:
            if (v6 == 247)
              goto LABEL_47;
            if (v6 != 920)
              goto LABEL_68;
            v8 = 24;
            break;
        }
        goto LABEL_71;
      }
      if (v6 > 233)
      {
        if (v6 == 234 || v6 == 238)
        {
LABEL_47:
          if (**(_DWORD **)(v5 + 72) >> 1 == 17008)
            goto LABEL_66;
        }
      }
      else
      {
        if (v6 == 141)
          goto LABEL_26;
        if (v6 == 217)
          goto LABEL_18;
      }
      goto LABEL_68;
    case 3u:
      if (v6 > 860)
      {
        if ((v6 - 861) > 0x18)
          goto LABEL_68;
        v11 = 1 << (v6 - 93);
        if ((v11 & 0xA03) == 0)
        {
          if ((v11 & 0x1040000) == 0)
            goto LABEL_68;
          v7 = 26;
          goto LABEL_67;
        }
      }
      else if ((v6 - 598) >= 4 && (v6 - 294) >= 2)
      {
        if (v6 != 216)
          goto LABEL_68;
LABEL_18:
        v8 = 17;
        goto LABEL_71;
      }
      if (**(_DWORD **)(v5 + 96) != 34892)
        goto LABEL_68;
      v7 = 29;
      goto LABEL_67;
    case 4u:
      if (v6 == 865)
      {
        v8 = 23;
        goto LABEL_71;
      }
      if (v6 != 240)
        goto LABEL_68;
      v9 = **(_DWORD **)(v5 + 120);
      if (v9 == 36048 || v9 == 36051)
      {
LABEL_26:
        v8 = 29;
        goto LABEL_71;
      }
      return;
    default:
      if (a4 == 9 && v6 == 28)
        goto LABEL_8;
      goto LABEL_68;
  }
}

size_t GPUTools::FB::Decoder::DecodeArguments(size_t result, uint64_t a2, char *a3, int a4, uint64_t a5)
{
  _QWORD *v5;
  char *v6;
  unsigned __int8 v7;
  uint64_t v8;
  _BYTE *v9;
  int v10;
  size_t v11;
  char *v12;
  unsigned int v13;
  unsigned int v14;
  _BOOL4 v15;
  _BOOL4 v16;
  signed __int8 v17;
  signed __int8 v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  int v28;
  unint64_t *v29;
  int v30;
  uint64_t v31;
  int v32;
  unint64_t *v33;
  unint64_t v34;
  int v35;
  uint64_t v36;
  int v37;
  unsigned int v38;
  char *v39;
  int v40;
  int v41;
  int v42;
  uint64_t v43;
  unint64_t *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  _BOOL4 v52;
  char *v53;
  char v54;
  char v55;
  int v56;
  int v57;
  uint64_t v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  uint64_t v62;
  int v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  int v71;
  int v72;
  int v73;
  uint64_t v74;
  unsigned int *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  void **v79;
  GPUTools::AlignmentBuffer *v80;
  char *v84;
  size_t v85;
  unint64_t v86;
  _WORD *v87;
  uint64_t v88;
  char *v89;
  _BYTE *v90;
  int v91;
  _BOOL4 v92;
  uint64_t v93;
  unsigned int v94;
  char *__endptr[2];

  v5 = (_QWORD *)a2;
  __endptr[0] = a3;
  v6 = *(char **)(a2 + 16);
  v94 = 0;
  v7 = *a3;
  if (*a3)
  {
    v8 = a5;
    v9 = (_BYTE *)result;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v80 = (GPUTools::AlignmentBuffer *)(a2 + 32);
    v79 = (void **)(a2 + 64);
    v90 = (_BYTE *)result;
    while (1)
    {
      v15 = v7 == 117;
      if (v7 == 117)
        goto LABEL_4;
      v16 = 0;
      if (v7 <= 0x3Fu)
      {
        if (v7 == 35)
        {
          __endptr[0] = a3 + 1;
          v59 = strtoul(a3 + 1, __endptr, 10);
          v9 = v90;
          v14 = v59;
          result = (size_t)&jpt_23C6E5F88;
          if (v90[13])
            v6 = (char *)((unint64_t)(v6 + 3) & 0xFFFFFFFFFFFFFFFCLL);
          if (!v90[12])
            goto LABEL_116;
          if (v14)
          {
            v74 = v14;
            v75 = (unsigned int *)v6;
            do
            {
              *v75 = bswap32(*v75);
              ++v75;
              --v74;
            }
            while (v74);
LABEL_116:
            v60 = (unsigned __int16)v10;
            *(_WORD *)(v8 + 24 * (unsigned __int16)v10 + 22) = 2;
            if (v14 >= 0x10000)
            {
              v78 = "array_to_decode_count <= std::numeric_limits<decltype(arguments[argument_count].length)>::max()";
              goto LABEL_245;
            }
          }
          else
          {
            v60 = (unsigned __int16)v10;
            *(_WORD *)(v8 + 24 * (unsigned __int16)v10 + 22) = 2;
          }
          v13 = 0;
          *(_WORD *)(v8 + 24 * v60 + 20) = v14;
          v11 += 4 * v14;
          v12 = v6;
          goto LABEL_191;
        }
        if (v7 == 60)
        {
          v51 = a3[1];
          __endptr[0] = a3 + 1;
          v52 = v51 != 117;
          if (v51 == 117 || v51 == 99)
          {
            v55 = a3[2];
            v53 = a3 + 2;
            v54 = v55;
            __endptr[0] = v53;
          }
          else
          {
            v52 = 0;
            v53 = a3 + 1;
            v54 = v51;
          }
          v62 = v54;
          if ((int)v62 <= 114)
          {
            v63 = 9;
            switch((int)v62)
            {
              case 'b':
                if (v51 == 117)
                  v63 = 2;
                else
                  v63 = 1;
                goto LABEL_211;
              case 'd':
                v63 = 10;
                goto LABEL_211;
              case 'f':
                goto LABEL_211;
              case 'i':
                if (v51 == 117)
                  v63 = 6;
                else
                  v63 = 5;
                goto LABEL_211;
              case 'l':
                if (v51 == 117)
                  v63 = 12;
                else
                  v63 = 11;
                goto LABEL_211;
              default:
                goto LABEL_250;
            }
          }
          switch((_DWORD)v62)
          {
            case 's':
              if (v51 == 117)
                v63 = 4;
              else
                v63 = 3;
              break;
            case 't':
              v63 = 13;
              break;
            case 'w':
              if (v51 == 117)
                v63 = 8;
              else
                v63 = 7;
              break;
            default:
LABEL_250:
              dy_abort("unknown or invalid format character: '%c' (in '%s')\n", v62, v53);
          }
LABEL_211:
          v71 = (unsigned __int16)v10 - 1;
          *(_DWORD *)(v8 + 24 * v71 + 12) = v63;
          if (v52)
            *(_WORD *)(v8 + 24 * v71 + 22) |= 4u;
          __endptr[0] = v53 + 2;
          goto LABEL_191;
        }
        v17 = v7;
        if (v7 == 58)
          dy_abort("url list decoding is no longer supported", 11);
        goto LABEL_5;
      }
      if (v7 != 64)
        break;
      __endptr[0] = a3 + 1;
      v61 = strtoul(a3 + 1, __endptr, 10);
      v94 = v61;
      *(_WORD *)(v8 + 24 * (unsigned __int16)v10 + 22) = 1;
      if (v61 >= 0x10000)
      {
        v78 = "array_lengths[0] <= std::numeric_limits<decltype(arguments[argument_count].length)>::max()";
LABEL_245:
        __assert_rtn("void GPUTools::FB::Decoder::DecodeArguments(DecodeJob &, const char *, uint32_t, Argument *) const", "", 0, v78);
      }
      v13 = 0;
      *(_WORD *)(v8 + 24 * (unsigned __int16)v10 + 20) = v61;
      v12 = (char *)&v94;
      v14 = 1;
      v9 = v90;
      result = (size_t)&jpt_23C6E5F88;
LABEL_191:
      a3 = __endptr[0];
      v7 = *__endptr[0];
      if (!*__endptr[0])
        goto LABEL_240;
    }
    if (v7 == 99)
    {
LABEL_4:
      v16 = v7 != 117;
      v18 = *++a3;
      v17 = v18;
      __endptr[0] = a3;
    }
    else
    {
      v17 = v7;
    }
LABEL_5:
    v19 = v17;
    v91 = v10;
    v92 = v16;
    if (v14)
    {
      v20 = v19 - 65;
      if ((v19 - 65) > 0x37 || ((1 << v20) & 0xCCA93A01BFFDBFLL) == 0)
LABEL_248:
        dy_abort("unknown format character: '%c' (in '%s')\n", v19, a3);
      v84 = &v6[v11];
      v85 = v11;
      v21 = v8 + 24 * (unsigned __int16)v10;
      v22 = (int *)(v21 + 8);
      v86 = (unint64_t)(v6 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      v87 = (_WORD *)(v21 + 22);
      v23 = 1;
      do
      {
        v24 = &v6[v11];
        switch(v20)
        {
          case 0:
          case 1:
          case 4:
          case 5:
          case 7:
          case 8:
          case 10:
          case 11:
          case 14:
          case 16:
          case 17:
          case 19:
          case 23:
          case 36:
            LOBYTE(v15) = 1;
            goto LABEL_11;
          case 2:
          case 13:
          case 15:
          case 47:
            LOBYTE(v15) = 1;
            goto LABEL_28;
          case 3:
          case 12:
          case 24:
          case 51:
            LOBYTE(v15) = 1;
            goto LABEL_20;
          case 33:
            if (v15)
              v42 = 2;
            else
              v42 = 1;
            *v22 = v42;
            v43 = *(unsigned int *)&v12[4 * v13];
            v11 += v43;
            *(_DWORD *)&v12[4 * v13] = v11 - v43;
            break;
          case 35:
            if (v9[13])
              v44 = (unint64_t *)((unint64_t)(v24 + 3) & 0xFFFFFFFFFFFFFFFCLL);
            else
              v44 = (unint64_t *)&v6[v11];
            v30 = *(_DWORD *)&v12[4 * v13];
            if (v9[12] && v30)
            {
              v50 = *(unsigned int *)&v12[4 * v13];
              do
              {
                *v44 = bswap64(*v44);
                ++v44;
                --v50;
              }
              while (v50);
            }
            v31 = v13;
            v32 = 10;
            goto LABEL_35;
          case 37:
          case 45:
            if (v9[13])
              v34 = (unint64_t)(v24 + 3) & 0xFFFFFFFFFFFFFFFCLL;
            else
              v34 = (unint64_t)&v6[v11];
            v26 = v13;
            LODWORD(v27) = *(_DWORD *)&v12[4 * v13];
            if (v9[12] && (_DWORD)v27)
            {
              v48 = 0;
              do
              {
                *(_DWORD *)(v34 + 4 * v48) = bswap32(*(_DWORD *)(v34 + 4 * v48));
                ++v48;
                v27 = *(unsigned int *)&v12[4 * v13];
              }
              while (v48 < v27);
            }
            v28 = 9;
            goto LABEL_18;
          case 40:
          case 55:
LABEL_11:
            if (v9[13])
              v25 = (unint64_t)(v24 + 3) & 0xFFFFFFFFFFFFFFFCLL;
            else
              v25 = (unint64_t)&v6[v11];
            v26 = v13;
            LODWORD(v27) = *(_DWORD *)&v12[4 * v13];
            if (v9[12] && (_DWORD)v27)
            {
              v45 = 0;
              do
              {
                *(_DWORD *)(v25 + 4 * v45) = bswap32(*(_DWORD *)(v25 + 4 * v45));
                ++v45;
                v27 = *(unsigned int *)&v12[4 * v13];
              }
              while (v45 < v27);
            }
            if (v15)
              v28 = 6;
            else
              v28 = 5;
LABEL_18:
            *v22 = v28;
            v11 += (4 * v27);
            *(_DWORD *)&v12[4 * v26] = v11 - 4 * v27;
            goto LABEL_36;
          case 43:
LABEL_20:
            if (v9[13])
              v29 = (unint64_t *)((unint64_t)(v24 + 3) & 0xFFFFFFFFFFFFFFFCLL);
            else
              v29 = (unint64_t *)&v6[v11];
            v30 = *(_DWORD *)&v12[4 * v13];
            if (v9[12] && v30)
            {
              v46 = *(unsigned int *)&v12[4 * v13];
              do
              {
                *v29 = bswap64(*v29);
                ++v29;
                --v46;
              }
              while (v46);
            }
            v31 = v13;
            if (v15)
              v32 = 12;
            else
              v32 = 11;
            goto LABEL_35;
          case 50:
            if (v9[13])
              v39 = (char *)((unint64_t)(v24 + 1) & 0xFFFFFFFFFFFFFFFELL);
            else
              v39 = &v6[v11];
            v40 = *(_DWORD *)&v12[4 * v13];
            if (v9[12] && v40)
            {
              v49 = *(unsigned int *)&v12[4 * v13];
              do
              {
                *(_WORD *)v39 = bswap32(*(unsigned __int16 *)v39) >> 16;
                v39 += 2;
                --v49;
              }
              while (v49);
            }
            if (v15)
              v41 = 4;
            else
              v41 = 3;
            *v22 = v41;
            v11 += (2 * v40);
            *(_DWORD *)&v12[4 * v13] = v11 - 2 * v40;
            v23 = 2;
            break;
          case 54:
LABEL_28:
            if (v9[13])
              v33 = (unint64_t *)((unint64_t)(v24 + 3) & 0xFFFFFFFFFFFFFFFCLL);
            else
              v33 = (unint64_t *)&v6[v11];
            v30 = *(_DWORD *)&v12[4 * v13];
            if (v9[12] && v30)
            {
              v47 = *(unsigned int *)&v12[4 * v13];
              do
              {
                *v33 = bswap64(*v33);
                ++v33;
                --v47;
              }
              while (v47);
            }
            v31 = v13;
            if (v15)
              v32 = 8;
            else
              v32 = 7;
LABEL_35:
            *v22 = v32;
            v11 += (8 * v30);
            *(_DWORD *)&v12[4 * v31] = v11 - 8 * v30;
LABEL_36:
            v23 = 4;
            break;
          default:
            v88 = v19;
            v89 = v6;
            *v22 = 13;
            *v87 |= 0x40u;
            v35 = v9[13];
            if (v9[13])
            {
              v23 = 4;
              v24 = (char *)v86;
            }
            v36 = *(unsigned int *)&v24[4 * (*(_DWORD *)&v12[4 * v13] - 1)];
            v37 = strlen(&v24[v36]);
            if (v35)
              v38 = v37 + 1;
            else
              v38 = (v37 & 0xFFFFFFFC) + 4;
            v11 += v36 + v38;
            v5 = (_QWORD *)a2;
            v6 = v89;
            v9 = v90;
            result = (size_t)&jpt_23C6E5F88;
            v19 = v88;
            break;
        }
        ++v13;
        --v14;
      }
      while (v14);
      if (v9[13])
      {
        v6 = (char *)(((unint64_t)&v84[v23 - 1] & -v23) - v85);
        v8 = a5;
        goto LABEL_154;
      }
      v8 = a5;
    }
    else
    {
      *(_DWORD *)(v8 + 24 * (unsigned __int16)v10 + 20) = 1;
      switch(v17)
      {
        case 'A':
        case 'B':
        case 'E':
        case 'F':
        case 'H':
        case 'I':
        case 'K':
        case 'L':
        case 'O':
        case 'Q':
        case 'R':
        case 'T':
        case 'X':
        case 'e':
          v15 = 1;
          goto LABEL_101;
        case 'C':
        case 'N':
        case 'P':
        case 'p':
          v15 = 1;
          goto LABEL_135;
        case 'D':
        case 'M':
        case 'Y':
        case 't':
          v15 = 1;
          goto LABEL_143;
        case 'S':
        case 'U':
        case 'V':
          *(_DWORD *)(v8 + 24 * (unsigned __int16)v10 + 8) = 13;
          if (v5[1] - (_QWORD)v6 + v5[2] >= 4uLL && *(_DWORD *)v6 == -1)
          {
            *(_QWORD *)(v8 + 24 * (unsigned __int16)v10) = 0;
            v11 = 8;
            goto LABEL_155;
          }
          v70 = v17;
          result = strlen(v6);
          v9 = v90;
          if (v90[13])
          {
            v11 = result + 1;
            v19 = v70;
            goto LABEL_154;
          }
          v11 = (result & 0xFFFFFFFFFFFFFFFCLL) + 4;
          v23 = 1;
          v19 = v70;
          break;
        case 'b':
          if (v7 == 117)
            v72 = 2;
          else
            v72 = 1;
          *(_DWORD *)(v8 + 24 * (unsigned __int16)v10 + 8) = v72;
          v56 = v9[13];
          v23 = 1;
          v11 = 1;
          goto LABEL_152;
        case 'd':
          v56 = v9[13];
          if (v9[13])
            v6 = (char *)((unint64_t)(v6 + 3) & 0xFFFFFFFFFFFFFFFCLL);
          if (v9[12])
            *(_QWORD *)v6 = bswap64(*(_QWORD *)v6);
          v65 = v8 + 24 * (unsigned __int16)v10;
          v64 = 10;
          goto LABEL_151;
        case 'f':
        case 'n':
          v56 = v9[13];
          if (v9[13])
            v6 = (char *)((unint64_t)(v6 + 3) & 0xFFFFFFFFFFFFFFFCLL);
          if (v9[12])
            *(_DWORD *)v6 = bswap32(*(_DWORD *)v6);
          v58 = v8 + 24 * (unsigned __int16)v10;
          v57 = 9;
          goto LABEL_109;
        case 'i':
        case 'x':
LABEL_101:
          v56 = v9[13];
          if (v9[13])
            v6 = (char *)((unint64_t)(v6 + 3) & 0xFFFFFFFFFFFFFFFCLL);
          if (v9[12])
            *(_DWORD *)v6 = bswap32(*(_DWORD *)v6);
          if (v15)
            v57 = 6;
          else
            v57 = 5;
          v58 = v8 + 24 * (unsigned __int16)v10;
LABEL_109:
          *(_DWORD *)(v58 + 8) = v57;
          v23 = 4;
          v11 = 4;
          goto LABEL_152;
        case 'l':
LABEL_143:
          v56 = v9[13];
          if (v9[13])
            v6 = (char *)((unint64_t)(v6 + 3) & 0xFFFFFFFFFFFFFFFCLL);
          if (v9[12])
            *(_QWORD *)v6 = bswap64(*(_QWORD *)v6);
          if (v15)
            v64 = 12;
          else
            v64 = 11;
          goto LABEL_150;
        case 's':
          v56 = v9[13];
          if (v9[13])
            v6 = (char *)((unint64_t)(v6 + 1) & 0xFFFFFFFFFFFFFFFELL);
          if (v9[12])
            *(_WORD *)v6 = bswap32(*(unsigned __int16 *)v6) >> 16;
          if (v7 == 117)
            v73 = 4;
          else
            v73 = 3;
          *(_DWORD *)(v8 + 24 * (unsigned __int16)v10 + 8) = v73;
          v23 = 2;
          v11 = 2;
          goto LABEL_152;
        case 'w':
LABEL_135:
          v56 = v9[13];
          if (v9[13])
            v6 = (char *)((unint64_t)(v6 + 3) & 0xFFFFFFFFFFFFFFFCLL);
          if (v9[12])
            *(_QWORD *)v6 = bswap64(*(_QWORD *)v6);
          if (v15)
            v64 = 8;
          else
            v64 = 7;
LABEL_150:
          v65 = v8 + 24 * (unsigned __int16)v10;
LABEL_151:
          *(_DWORD *)(v65 + 8) = v64;
          v23 = 4;
          v11 = 8;
LABEL_152:
          if (!v56)
            break;
          goto LABEL_154;
        default:
          goto LABEL_248;
      }
    }
    if ((char *)((unint64_t)&v6[v23 - 1] & -v23) != v6)
    {
      v76 = v19;
      v77 = GPUTools::AlignmentBuffer::CopyAndAlign(v80, v6, v11, v23);
      v10 = v91;
      *(_QWORD *)(v8 + 24 * (unsigned __int16)v91) = v77;
      v93 = v8 + 24 * (unsigned __int16)v91;
      std::vector<void **>::push_back[abi:ne180100](v79, &v93);
      v19 = v76;
      v9 = v90;
LABEL_155:
      switch((int)v19)
      {
        case 'A':
          v66 = v8 + 24 * (unsigned __int16)v10;
          v67 = 45;
          goto LABEL_183;
        case 'B':
          v66 = v8 + 24 * (unsigned __int16)v10;
          v67 = 37;
          goto LABEL_183;
        case 'C':
          v66 = v8 + 24 * (unsigned __int16)v10;
          v67 = 15;
          goto LABEL_183;
        case 'D':
        case 'H':
          v66 = v8 + 24 * (unsigned __int16)v10;
          v67 = 40;
          goto LABEL_183;
        case 'E':
          v66 = v8 + 24 * (unsigned __int16)v10;
          v67 = 46;
          goto LABEL_183;
        case 'F':
          v66 = v8 + 24 * (unsigned __int16)v10;
          v67 = 38;
          goto LABEL_183;
        case 'I':
          v66 = v8 + 24 * (unsigned __int16)v10;
          v67 = 42;
          goto LABEL_183;
        case 'K':
          v66 = v8 + 24 * (unsigned __int16)v10;
          v67 = 44;
          goto LABEL_183;
        case 'L':
          v66 = v8 + 24 * (unsigned __int16)v10;
          v67 = 36;
          goto LABEL_183;
        case 'M':
        case 'O':
          v66 = v8 + 24 * (unsigned __int16)v10;
          v67 = 41;
          goto LABEL_183;
        case 'N':
        case 'e':
        case 'n':
          v66 = v8 + 24 * (unsigned __int16)v10;
          v67 = 18;
          goto LABEL_183;
        case 'P':
          v66 = v8 + 24 * (unsigned __int16)v10;
          v67 = 47;
          goto LABEL_183;
        case 'Q':
          v66 = v8 + 24 * (unsigned __int16)v10;
          v67 = 43;
          goto LABEL_183;
        case 'R':
          v66 = v8 + 24 * (unsigned __int16)v10;
          v67 = 35;
          goto LABEL_183;
        case 'S':
          v66 = v8 + 24 * (unsigned __int16)v10;
          v67 = 14;
          goto LABEL_183;
        case 'T':
          v66 = v8 + 24 * (unsigned __int16)v10;
          v67 = 34;
          goto LABEL_183;
        case 'U':
          v68 = v8 + 24 * (unsigned __int16)v10;
          *(_DWORD *)(v68 + 12) = 0;
          v69 = *(_WORD *)(v68 + 22) | 8;
          goto LABEL_179;
        case 'V':
          v68 = v8 + 24 * (unsigned __int16)v10;
          *(_DWORD *)(v68 + 12) = 12;
          v69 = *(_WORD *)(v68 + 22) | 0x10;
LABEL_179:
          *(_WORD *)(v68 + 22) = v69;
          goto LABEL_184;
        case 'X':
          v66 = v8 + 24 * (unsigned __int16)v10;
          v67 = 39;
          goto LABEL_183;
        case 'Y':
          v66 = v8 + 24 * (unsigned __int16)v10;
          v67 = 33;
          goto LABEL_183;
        case 'b':
        case 'd':
        case 'f':
        case 'i':
        case 'l':
        case 's':
        case 'w':
          v66 = v8 + 24 * (unsigned __int16)v10;
          v67 = *(_DWORD *)(v66 + 8);
          goto LABEL_183;
        case 'p':
        case 't':
          v66 = v8 + 24 * (unsigned __int16)v10;
          v67 = 13;
          goto LABEL_183;
        case 'x':
          v66 = v8 + 24 * (unsigned __int16)v10;
          v67 = 19;
LABEL_183:
          *(_DWORD *)(v66 + 12) = v67;
LABEL_184:
          if (v9[14])
          {
            GPUTools::FB::Decoder::EmitRichSemanticTypes(result, (uint64_t)v5, v8 + 24 * (unsigned __int16)v10, (unsigned __int16)v10, a4);
            v9 = v90;
          }
          if (v92)
            *(_WORD *)(v8 + 24 * (unsigned __int16)v10 + 22) |= 4u;
          *(_DWORD *)(v8 + 24 * (unsigned __int16)v10 + 16) = v11;
          v6 += v11;
          result = (size_t)&jpt_23C6E5F88;
          if (v5[1] < (unint64_t)&v6[-v5[2]])
          {
            v78 = "job.capacity >= BUFFER_DELTA(job.read_ptr, read_ptr)";
            goto LABEL_245;
          }
          ++__endptr[0];
          if ((unsigned __int16)++v10 >= 0x11u)
          {
            v78 = "argument_count <= FBUF_MAX_ARGUMENTS";
            goto LABEL_245;
          }
          v14 = 0;
          v11 = 0;
          break;
        default:
          dy_abort("unknown format character: '%c' (in '%s')\n", v19, __endptr[0]);
      }
      goto LABEL_191;
    }
LABEL_154:
    v10 = v91;
    *(_QWORD *)(v8 + 24 * (unsigned __int16)v91) = v6;
    goto LABEL_155;
  }
  LOWORD(v10) = 0;
LABEL_240:
  if (!a4)
    *(_WORD *)(v5[3] + 10) = v10;
  v5[2] = (unint64_t)(v6 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  return result;
}

void std::vector<void **>::push_back[abi:ne180100](void **a1, _QWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = (unint64_t)a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    v9 = ((char *)v7 - (_BYTE *)*a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61)
      std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
    v10 = v5 - (_QWORD)*a1;
    v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>(v4, v12);
    else
      v13 = 0;
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    *(_QWORD *)v14 = *a2;
    v8 = v14 + 8;
    v17 = (char *)*a1;
    v16 = (char *)a1[1];
    if (v16 != *a1)
    {
      do
      {
        v18 = *((_QWORD *)v16 - 1);
        v16 -= 8;
        *((_QWORD *)v14 - 1) = v18;
        v14 -= 8;
      }
      while (v16 != v17);
      v16 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v8;
    a1[2] = v15;
    if (v16)
      operator delete(v16);
  }
  else
  {
    *v7 = *a2;
    v8 = v7 + 1;
  }
  a1[1] = v8;
}

uint64_t GPUTools::FB::Decoder::Decoder(uint64_t result, int a2, char a3)
{
  *(_QWORD *)result = &off_250D62C48;
  *(_DWORD *)(result + 8) = a2;
  *(_BYTE *)(result + 12) = a3;
  *(_BYTE *)(result + 14) = 1;
  if (a2 >= 5)
    dy_abort("unknown or unsupported fbuf version: %d", a2);
  *(_BYTE *)(result + 13) = a2 == 4;
  return result;
}

void sub_23C6E6D20(_Unwind_Exception *a1)
{
  GPUTools::FD::IFunctionDecoder *v1;

  GPUTools::FD::IFunctionDecoder::~IFunctionDecoder(v1);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::FB::Decoder::DecodeHeader(uint64_t result, uint64_t a2)
{
  int v2;
  unint64_t v3;
  uint64_t v4;
  int v5;
  __int128 v6;
  __int8 *v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  int v11;
  int8x16_t *v12;
  __int32 v13;
  __int32 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  const char *v20;
  int8x16_t v21;
  unsigned int v22;

  v2 = *(_DWORD *)(result + 8);
  if ((v2 - 3) < 2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    if (v3 > 0x23)
    {
      v4 = *(_QWORD *)(a2 + 16);
      if (*(_BYTE *)(result + 12))
      {
        *(int8x8_t *)v4 = vrev32_s8(*(int8x8_t *)v4);
        *(int8x16_t *)(v4 + 8) = vrev64q_s8(*(int8x16_t *)(v4 + 8));
        *(_QWORD *)(v4 + 24) = bswap64(*(_QWORD *)(v4 + 24));
        *(_DWORD *)(v4 + 32) = bswap32(*(_DWORD *)(v4 + 32));
      }
      v5 = *(_DWORD *)(v4 + 32);
      v6 = *(_OWORD *)(v4 + 16);
      *(_OWORD *)(a2 + 88) = *(_OWORD *)v4;
      *(_DWORD *)(a2 + 120) = v5;
      *(_OWORD *)(a2 + 104) = v6;
      v7 = (__int8 *)(v4 + 36);
      v8 = *(_DWORD *)(a2 + 88);
      goto LABEL_6;
    }
    v20 = "job.capacity >= sizeof(dy_fbuf_header_v4_t)";
LABEL_26:
    __assert_rtn("void GPUTools::FB::Decoder::DecodeHeader(DecodeJob &) const", "", 0, v20);
  }
  if (v2)
  {
    if (v2 == 1)
    {
      v3 = *(_QWORD *)(a2 + 8);
      if (v3 <= 0x17)
      {
        v20 = "job.capacity >= sizeof(dy_fbuf_header_v1_t)";
        goto LABEL_26;
      }
      v12 = *(int8x16_t **)(a2 + 16);
      v8 = v12->i32[0];
      if (*(_BYTE *)(result + 12))
      {
        v21 = vrev32q_s8(*v12);
        *v12 = v21;
        v12[1].i64[0] = bswap64(v12[1].u64[0]);
        v8 = v21.i32[0];
      }
      v13 = v12->i32[1];
      v14 = v12->i32[2];
      v15 = v12->u32[3];
      v16 = v12[1].i64[0];
      *(_DWORD *)(a2 + 88) = v8;
      *(_DWORD *)(a2 + 92) = v13;
      *(_QWORD *)(a2 + 104) = v16;
      *(_QWORD *)(a2 + 112) = v15;
      *(_QWORD *)(a2 + 96) = 0;
      *(_DWORD *)(a2 + 120) = v14;
      v7 = &v12[1].i8[8];
    }
    else
    {
      if (v2 != 2)
        dy_abort("unknown or unsupported fbuf version: %d", *(_DWORD *)(result + 8));
      v3 = *(_QWORD *)(a2 + 8);
      if (v3 <= 0x1B)
      {
        v20 = "job.capacity >= sizeof(dy_fbuf_header_v2_t)";
        goto LABEL_26;
      }
      v17 = *(_QWORD *)(a2 + 16);
      v8 = *(_DWORD *)v17;
      if (*(_BYTE *)(result + 12))
      {
        v8 = bswap32(v8);
        v22 = bswap32(*(_DWORD *)(v17 + 4));
        *(_DWORD *)v17 = v8;
        *(_DWORD *)(v17 + 4) = v22;
        *(int8x16_t *)(v17 + 8) = vrev64q_s8(*(int8x16_t *)(v17 + 8));
        *(_DWORD *)(v17 + 24) = bswap32(*(_DWORD *)(v17 + 24));
      }
      v18 = *(_DWORD *)(v17 + 4);
      v19 = *(_DWORD *)(v17 + 24);
      *(_DWORD *)(a2 + 88) = v8;
      *(_DWORD *)(a2 + 92) = v18;
      *(_OWORD *)(a2 + 104) = *(_OWORD *)(v17 + 8);
      *(_QWORD *)(a2 + 96) = 0;
      *(_DWORD *)(a2 + 120) = v19;
      v7 = (__int8 *)(v17 + 28);
    }
  }
  else
  {
    v3 = *(_QWORD *)(a2 + 8);
    if (v3 <= 0xB)
    {
      v20 = "job.capacity >= sizeof(dy_fbuf_header_v0_t)";
      goto LABEL_26;
    }
    v9 = *(_QWORD *)(a2 + 16);
    v8 = *(_DWORD *)v9;
    if (*(_BYTE *)(result + 12))
    {
      v8 = bswap32(v8);
      *(_DWORD *)v9 = v8;
      *(int8x8_t *)(v9 + 4) = vrev32_s8(*(int8x8_t *)(v9 + 4));
    }
    v10 = *(_DWORD *)(v9 + 4);
    v11 = *(_DWORD *)(v9 + 8);
    *(_DWORD *)(a2 + 88) = v8;
    *(_DWORD *)(a2 + 92) = v10;
    *(_QWORD *)(a2 + 104) = 0;
    *(_QWORD *)(a2 + 112) = 0;
    *(_QWORD *)(a2 + 96) = 0;
    *(_DWORD *)(a2 + 120) = v11;
    v7 = (__int8 *)(v9 + 12);
  }
LABEL_6:
  if (v3 < v8)
  {
    v20 = "job.capacity >= job.header.length";
    goto LABEL_26;
  }
  *(_QWORD *)(a2 + 16) = v7;
  return result;
}

size_t GPUTools::FB::Decoder::DecodeCore(size_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  size_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  size_t result;
  char *v14;
  int v15;
  size_t v16;
  int v17;
  size_t v18;
  char *i;
  int v20;
  char v21;
  _BYTE *j;
  size_t v23;
  int v24;
  char *m;
  int v26;
  char v27;
  char *k;
  void *__src;

  GPUTools::FB::Decoder::DecodeHeader(a1, a2);
  v4 = *(void **)(a2 + 16);
  if (*(int *)(a1 + 8) > 2)
  {
    v5 = 0;
    goto LABEL_3;
  }
  v16 = strlen(*(const char **)(a2 + 16)) + 1;
  v5 = (void *)operator new[]();
  memcpy(v5, v4, v16);
  v17 = *(_DWORD *)(a1 + 8);
  if (!v17)
  {
    for (i = (char *)v5; ; ++i)
    {
      v20 = *i;
      if (v20 == 108)
        break;
      if (v20 == 116)
      {
        v21 = 108;
        goto LABEL_27;
      }
      if (!*i)
        goto LABEL_11;
LABEL_28:
      ;
    }
    v21 = 105;
LABEL_27:
    *i = v21;
    goto LABEL_28;
  }
LABEL_11:
  if (v17 <= 2)
  {
    for (j = v5; ; ++j)
    {
      if (*j == 71)
      {
        *j = 67;
      }
      else if (!*j)
      {
        break;
      }
    }
  }
  v4 = v5;
LABEL_3:
  v6 = strlen((const char *)v4);
  v7 = *(_QWORD *)(a2 + 8);
  v8 = (v6 & 0xFFFFFFFFFFFFFFFCLL) + *(_QWORD *)(a2 + 16) + 4;
  *(_QWORD *)(a2 + 16) = v8;
  v9 = *(_QWORD *)a2;
  if (v7 < v8 - *(_QWORD *)a2)
    goto LABEL_9;
  v10 = *(_QWORD *)(a2 + 24);
  v11 = *(_DWORD *)(a2 + 120);
  v12 = *(_DWORD *)(a2 + 88);
  *(_DWORD *)v10 = *(_DWORD *)(a2 + 92);
  *(_DWORD *)(v10 + 4) = v11;
  *(_QWORD *)(v10 + 440) = v9;
  *(_DWORD *)(v10 + 432) = v12;
  result = GPUTools::FB::Decoder::DecodeArguments(a1, a2, (char *)v4, 0, v10 + 48);
  v14 = *(char **)(a2 + 16);
  if (*(_QWORD *)(a2 + 8) < (unint64_t)&v14[-*(_QWORD *)a2])
LABEL_9:
    __assert_rtn("void GPUTools::FB::Decoder::DecodeCore(DecodeJob &) const", "", 0, "job.capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr)");
  v15 = *(_DWORD *)(a2 + 120);
  if ((v15 & 1) == 0)
  {
    if ((v15 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
  if (*(int *)(a1 + 8) <= 2)
  {
    __src = *(void **)(a2 + 16);
    v23 = strlen(v14) + 1;
    v14 = (char *)operator new[]();
    if (v5)
      MEMORY[0x242622C80](v5, 0x1000C8077774924);
    memcpy(v14, __src, v23);
    v24 = *(_DWORD *)(a1 + 8);
    if (v24)
    {
LABEL_38:
      if (v24 <= 2)
      {
        for (k = v14; ; ++k)
        {
          if (*k == 71)
          {
            *k = 67;
          }
          else if (!*k)
          {
            break;
          }
        }
      }
      v5 = v14;
      goto LABEL_14;
    }
    for (m = v14; ; ++m)
    {
      v26 = *m;
      if (v26 == 108)
        break;
      if (v26 == 116)
      {
        v27 = 108;
        goto LABEL_47;
      }
      if (!*m)
        goto LABEL_38;
LABEL_48:
      ;
    }
    v27 = 105;
LABEL_47:
    *m = v27;
    goto LABEL_48;
  }
LABEL_14:
  v18 = (strlen(v14) & 0xFFFFFFFFFFFFFFFCLL) + *(_QWORD *)(a2 + 16) + 4;
  *(_QWORD *)(a2 + 16) = v18;
  if (*(_QWORD *)(a2 + 8) < v18 - *(_QWORD *)a2
    || (result = GPUTools::FB::Decoder::DecodeArguments(a1, a2, v14, 1, *(_QWORD *)(a2 + 24) + 24),
        *(_QWORD *)(a2 + 8) < *(_QWORD *)(a2 + 16) - *(_QWORD *)a2))
  {
    __assert_rtn("void GPUTools::FB::Decoder::DecodeCore(DecodeJob &) const", "", 0, "job.capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr)");
  }
  if ((*(_DWORD *)(a2 + 120) & 0x40) == 0)
  {
LABEL_7:
    if (v5)
      goto LABEL_55;
    return result;
  }
LABEL_17:
  *(_DWORD *)(*(_QWORD *)(a2 + 24) + 4) |= 6u;
  if (v5)
LABEL_55:
    JUMPOUT(0x242622C80);
  return result;
}

void sub_23C6E72F8(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    MEMORY[0x242622C80](v1, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

void GPUTools::FB::Decoder::FinalizeDecode(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD **v3;
  _QWORD **v4;
  _QWORD *v5;

  v2 = a2[3];
  *(_QWORD *)(v2 + 448) = a2[4];
  *(_DWORD *)(v2 + 436) = a2[6];
  v3 = (_QWORD **)a2[8];
  v4 = (_QWORD **)a2[9];
  if (v3 != v4)
  {
    do
    {
      v5 = *v3++;
      *v5 += a2[4];
    }
    while (v3 != v4);
    v2 = a2[3];
  }
  if (*(_WORD *)(v2 + 10) && *(_DWORD *)(v2 + 60) == 15 && *(_DWORD *)v2 != -8191 && *(_DWORD *)v2 != -8188)
    *(_QWORD *)(v2 + 16) = **(_QWORD **)(v2 + 48);
}

uint64_t GPUTools::FB::Decoder::HasFastEncodedSize(GPUTools::FB::Decoder *this)
{
  return 1;
}

uint64_t GPUTools::FB::Decoder::HasRichSemanticTypes(GPUTools::FB::Decoder *this)
{
  return 1;
}

uint64_t GPUTools::FB::Decoder::EmitsRichSemanticTypes(GPUTools::FB::Decoder *this)
{
  return *((unsigned __int8 *)this + 14);
}

uint64_t GPUTools::FB::Decoder::SetEmitsRichSemanticTypes(uint64_t this, char a2)
{
  *(_BYTE *)(this + 14) = a2;
  return this;
}

uint64_t GPUTools::FB::Decoder::GetEncodedSize(GPUTools::FB::Decoder *this, const void *a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD v5[3];
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  void *__p;
  __int128 v10;
  unsigned int v11;

  v7 = 0u;
  v8 = 64;
  __p = 0;
  v10 = 0u;
  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a2;
  v6 = 0u;
  GPUTools::FB::Decoder::DecodeHeader((uint64_t)this, (uint64_t)v5);
  v3 = v11;
  if (__p)
    operator delete(__p);
  return v3;
}

void sub_23C6E741C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t GPUTools::FB::Decoder::DecodeFlags(GPUTools::FB::Decoder *this, const void *a2, uint64_t a3)
{
  unsigned __int16 v3;
  _QWORD v5[3];
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  void *__p;
  __int128 v10;
  int v11;

  v7 = 0u;
  v8 = 64;
  __p = 0;
  v10 = 0u;
  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a2;
  v6 = 0u;
  GPUTools::FB::Decoder::DecodeHeader((uint64_t)this, (uint64_t)v5);
  v3 = v11;
  if (__p)
    operator delete(__p);
  return v3;
}

void sub_23C6E7490(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t GPUTools::FB::Decoder::Decode(GPUTools::FB::Decoder *this, const void *a2, uint64_t a3, GPUTools::FD::CoreFunction *a4)
{
  size_t v8;
  _QWORD v10[8];
  void *__p;
  void *v12;
  uint64_t v13;

  if (!a2)
    __assert_rtn("virtual BOOL GPUTools::FB::Decoder::Decode(const void *, size_t, GPUTools::FD::CoreFunction &) const", "", 0, "fbuf");
  if ((a2 & 3) != 0)
    dy_abort("misaligned fbuf buffer: %p, required alignment=4", a2);
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)v10);
  GPUTools::FD::CoreFunction::operator=((uint64_t)a4, (uint64_t)v10);
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)v10);
  memset(&v10[4], 0, 24);
  v10[7] = 64;
  v12 = 0;
  v13 = 0;
  __p = 0;
  v10[0] = a2;
  v10[1] = a3;
  v10[2] = a2;
  v10[3] = a4;
  v8 = GPUTools::FB::Decoder::DecodeCore((size_t)this, (uint64_t)v10);
  GPUTools::FB::Decoder::FinalizeDecode(v8, v10);
  if (__p)
  {
    v12 = __p;
    operator delete(__p);
  }
  return 1;
}

void sub_23C6E7584(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t GPUTools::FB::Decoder::Decode(GPUTools::FB::Decoder *this, char *a2, unint64_t a3, GPUTools::FD::Function *a4)
{
  char *v8;
  unint64_t v9;
  char *v10;
  char *v11;
  unsigned int v12;
  unsigned int v13;
  const void *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  unint64_t v21;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  int v35;
  char *v36;
  unsigned int v37;
  unint64_t v38;
  char *v39;
  char *v40;
  unsigned int v41;
  unsigned int v42;
  char *v43;
  char *v44;
  unint64_t v45;
  unsigned int v46;
  char *v48;
  char *v49;
  const char *v50;
  uint64_t v51;
  unint64_t v52;
  _QWORD v53[2];
  __int16 v54;
  char *v55;
  unint64_t v56;
  char *__s;
  GPUTools::FD::Function *v58;
  _QWORD v59[4];
  void *__p;
  char *v61;
  _QWORD v62[3];
  __int128 v63;

  if (!a2)
    __assert_rtn("virtual BOOL GPUTools::FB::Decoder::Decode(const void *, size_t, GPUTools::FD::Function &) const", "", 0, "fbuf");
  if ((a2 & 3) != 0)
    dy_abort("misaligned fbuf buffer: %p, required alignment=4", a2);
  GPUTools::FD::Function::Function((GPUTools::FD::Function *)&v55);
  GPUTools::FD::Function::operator=((uint64_t)a4, (uint64_t)&v55);
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)&v55);
  memset(v59, 0, 24);
  v59[3] = 64;
  v61 = 0;
  v62[0] = 0;
  __p = 0;
  v55 = a2;
  v56 = a3;
  __s = a2;
  v58 = a4;
  v8 = (char *)GPUTools::FB::Decoder::DecodeCore((size_t)this, (uint64_t)&v55);
  *(_OWORD *)((char *)a4 + 456) = v63;
  *((_QWORD *)a4 + 64) = v62[2];
  if ((*((_BYTE *)a4 + 4) & 8) != 0)
  {
    if (*((int *)this + 2) <= 2)
    {
      v48 = __s;
      __s += (strlen(__s) & 0xFFFFFFFFFFFFFFFCLL) + 4;
      if (v56 < __s - v55)
        __assert_rtn("virtual BOOL GPUTools::FB::Decoder::Decode(const void *, size_t, GPUTools::FD::Function &) const", "", 0, "job.capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr)");
      v8 = (char *)GPUTools::FB::Decoder::DecodeArguments((size_t)this, (uint64_t)&v55, v48, 8, (uint64_t)v53);
      if (__s - v55 > a3)
        __assert_rtn("virtual BOOL GPUTools::FB::Decoder::Decode(const void *, size_t, GPUTools::FD::Function &) const", "", 0, "capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr)");
      *((_WORD *)a4 + 240) = v54;
      *((_QWORD *)a4 + 59) = v53[0];
      if (*((_QWORD **)v61 - 1) == v53)
        *((_QWORD *)v61 - 1) = (char *)a4 + 472;
    }
    else
    {
      v10 = v55;
      v9 = v56;
      v11 = __s;
      if (v56 < __s - v55 + 8)
        __assert_rtn("virtual BOOL GPUTools::FB::Decoder::Decode(const void *, size_t, GPUTools::FD::Function &) const", "", 0, "job.capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr) + backtrace_header_size");
      v12 = *(_DWORD *)__s;
      *((_WORD *)a4 + 240) = *(_DWORD *)__s;
      v13 = *((_DWORD *)v11 + 1);
      if (*((_BYTE *)this + 12))
      {
        v12 = bswap32(v12) >> 16;
        *((_WORD *)a4 + 240) = v12;
        v13 = bswap32(v13);
      }
      v14 = v11 + 8;
      __s = v11 + 8;
      if (v9 < v11 + 8 - v10 + 8 * (unint64_t)(unsigned __int16)v12)
        __assert_rtn("virtual BOOL GPUTools::FB::Decoder::Decode(const void *, size_t, GPUTools::FD::Function &) const", "", 0, "job.capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr) + addresses_size");
      v15 = 8 * (unsigned __int16)v12;
      if (v13 == 4)
      {
        v8 = (char *)GPUTools::AlignmentBuffer::CopyAndAlign((GPUTools::AlignmentBuffer *)v59, v14, 8 * (unsigned __int16)v12, 8);
        v16 = v8;
        v17 = (char *)a4 + 472;
        *((_QWORD *)a4 + 59) = v8;
        v18 = v59[0];
        v19 = v61;
        if ((unint64_t)v61 >= v62[0])
        {
          v23 = (v61 - (_BYTE *)__p) >> 3;
          if ((unint64_t)(v23 + 1) >> 61)
            std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
          v24 = (uint64_t)(v62[0] - (_QWORD)__p) >> 2;
          if (v24 <= v23 + 1)
            v24 = v23 + 1;
          if (v62[0] - (_QWORD)__p >= 0x7FFFFFFFFFFFFFF8uLL)
            v25 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v25 = v24;
          if (v25)
            v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>((uint64_t)v62, v25);
          else
            v26 = 0;
          v27 = &v26[8 * v23];
          v28 = &v26[8 * v25];
          *(_QWORD *)v27 = v17;
          v20 = v27 + 8;
          v29 = (char *)__p;
          v8 = v61;
          if (v61 != __p)
          {
            do
            {
              v30 = *((_QWORD *)v8 - 1);
              v8 -= 8;
              *((_QWORD *)v27 - 1) = v30;
              v27 -= 8;
            }
            while (v8 != v29);
            v8 = (char *)__p;
          }
          __p = v27;
          v61 = v20;
          v62[0] = v28;
          if (v8)
            operator delete(v8);
        }
        else
        {
          *(_QWORD *)v61 = v17;
          v20 = v19 + 8;
        }
        v31 = &v16[v18];
        v61 = v20;
        v32 = *((unsigned __int16 *)a4 + 240);
        if (*((_BYTE *)this + 12))
        {
          if (*((_WORD *)a4 + 240))
          {
            v51 = v32 - 1;
            do
            {
              *(_QWORD *)&v31[8 * v51] = bswap32(*(_DWORD *)&v31[4 * v51]);
              v52 = v51-- + 1;
            }
            while (v52 > 1);
          }
        }
        else if (*((_WORD *)a4 + 240))
        {
          v33 = v32 - 1;
          do
          {
            *(_QWORD *)&v31[8 * v33] = *(unsigned int *)&v31[4 * v33];
            v34 = v33-- + 1;
          }
          while (v34 > 1);
        }
      }
      else
      {
        *((_QWORD *)a4 + 59) = v14;
        if (v13 != 8)
          dy_abort("unsupported backtrace pointer size: %u", v13);
        if (*((_BYTE *)this + 12))
        {
          v21 = *((unsigned __int16 *)a4 + 240);
          if (*((_WORD *)a4 + 240))
          {
            do
              *(_QWORD *)&v11[8 * v21] = bswap64(*(_QWORD *)&v11[8 * v21]);
            while (v21-- > 1);
          }
        }
      }
      __s += v15;
    }
  }
  v35 = *((_DWORD *)a4 + 1);
  if ((v35 & 0x10) != 0)
  {
    if (*((int *)this + 2) <= 2)
    {
      v49 = __s;
      __s += (strlen(__s) & 0xFFFFFFFFFFFFFFFCLL) + 4;
      if (v56 < __s - v55)
        __assert_rtn("virtual BOOL GPUTools::FB::Decoder::Decode(const void *, size_t, GPUTools::FD::Function &) const", "", 0, "job.capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr)");
      v8 = (char *)GPUTools::FB::Decoder::DecodeArguments((size_t)this, (uint64_t)&v55, v49, 16, (uint64_t)v53);
      if (__s - v55 > a3)
        __assert_rtn("virtual BOOL GPUTools::FB::Decoder::Decode(const void *, size_t, GPUTools::FD::Function &) const", "", 0, "capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr)");
      *((_WORD *)a4 + 241) = *(_DWORD *)v53[0];
      if (*((_QWORD **)v61 - 1) == v53)
        v61 -= 8;
      v35 = *((_DWORD *)a4 + 1);
      if ((v35 & 0x20) == 0)
        goto LABEL_48;
      goto LABEL_43;
    }
    v36 = __s;
    if (v56 < __s - v55 + 4)
    {
      v50 = "job.capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr) + sizeof(uint32_t)";
      goto LABEL_72;
    }
    v37 = *(_DWORD *)__s;
    *((_WORD *)a4 + 241) = *(_DWORD *)__s;
    if (*((_BYTE *)this + 12))
      *((_WORD *)a4 + 241) = bswap32(v37) >> 16;
    __s = v36 + 4;
  }
  if ((v35 & 0x20) == 0)
    goto LABEL_48;
LABEL_43:
  v39 = v55;
  v38 = v56;
  v40 = __s;
  if (v56 < __s - v55 + 8)
  {
    v50 = "job.capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr) + (2 * sizeof(uint32_t))";
    goto LABEL_72;
  }
  v41 = *(_DWORD *)__s;
  if (*((_BYTE *)this + 12))
  {
    v41 = bswap32(v41);
    v42 = bswap32(*((_DWORD *)__s + 1));
    *(_DWORD *)__s = v41;
    *((_DWORD *)v40 + 1) = v42;
  }
  else
  {
    v42 = *((_DWORD *)__s + 1);
  }
  *((_DWORD *)a4 + 121) = v41;
  v43 = v40 + 8;
  __s = v43;
  if (v38 < v43 - v39 + (unint64_t)v42)
    __assert_rtn("virtual BOOL GPUTools::FB::Decoder::Decode(const void *, size_t, GPUTools::FD::Function &) const", "", 0, "job.capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr) + events_size");
  *((_QWORD *)a4 + 61) = v43;
  *((_DWORD *)a4 + 124) = v42;
  __s = &v43[v42];
  v35 = *((_DWORD *)a4 + 1);
LABEL_48:
  if ((v35 & 0x400) == 0)
    goto LABEL_53;
  v44 = __s;
  if (v56 < __s - v55 + 12)
  {
    v50 = "job.capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr) + (sizeof(uint64_t) + sizeof(uint32_t))";
LABEL_72:
    __assert_rtn("virtual BOOL GPUTools::FB::Decoder::Decode(const void *, size_t, GPUTools::FD::Function &) const", "", 0, v50);
  }
  v45 = *(_QWORD *)__s;
  *((_QWORD *)a4 + 63) = *(_QWORD *)__s;
  v46 = *((_DWORD *)v44 + 2);
  *((_DWORD *)a4 + 125) = v46;
  if (*((_BYTE *)this + 12))
  {
    *((_QWORD *)a4 + 63) = bswap64(v45);
    *((_DWORD *)a4 + 125) = bswap32(v46);
  }
  __s = v44 + 12;
LABEL_53:
  GPUTools::FB::Decoder::FinalizeDecode((uint64_t)v8, &v55);
  if (__p)
  {
    v61 = (char *)__p;
    operator delete(__p);
  }
  return 1;
}

void sub_23C6E7C14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void GPUTools::FB::Decoder::~Decoder(GPUTools::FB::Decoder *this)
{
  GPUTools::FD::IFunctionDecoder::~IFunctionDecoder(this);
  JUMPOUT(0x242622C98);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

uint64_t DYCALayerInterposeInit(DYGuestAppClient *a1)
{
  if (DYCALayerInterposeInit(DYGuestAppClient *)::onceToken != -1)
    dispatch_once(&DYCALayerInterposeInit(DYGuestAppClient *)::onceToken, &__block_literal_global_8);
  return objc_msgSend((id)_appClients, "addObject:", a1);
}

void ___Z22DYCALayerInterposeInitP16DYGuestAppClient_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *__p;
  void *v7;
  _QWORD *v8;

  v0 = operator new();
  *(_OWORD *)v0 = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_DWORD *)(v0 + 32) = 1065353216;
  gLayersSetPtr = v0;
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = operator new(0x80uLL);
  v8 = v5 + 16;
  *v5 = v1;
  v5[1] = sel_setTransform_;
  v5[2] = &o_CALayer_setTransform;
  v5[3] = CALayer_setTransform;
  v5[4] = v2;
  v5[5] = sel_setSublayerTransform_;
  v5[6] = &o_CALayer_setSublayerTransform;
  v5[7] = CALayer_setSublayerTransform;
  v5[8] = v3;
  v5[9] = sel_setPosition_;
  v5[10] = &o_CALayer_setPosition;
  v5[11] = CALayer_setPosition;
  v5[12] = v4;
  v5[13] = sel_setAnchorPoint_;
  v5[14] = &o_CALayer_setAnchorPoint;
  v5[15] = CALayer_setAnchorPoint;
  __p = v5;
  v7 = v5 + 16;
  GPUTools::Interpose::DYInstallObjCMethodOverrides((Method)&__p);
  _appClients = (uint64_t)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (__p)
  {
    v7 = __p;
    operator delete(__p);
  }
}

void sub_23C6E7E70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t CALayer_setTransform(CALayer *a1, objc_selector *a2, CATransform3D *a3)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _QWORD v9[5];
  _OWORD v10[8];

  v4 = *(_OWORD *)&a3->m33;
  v10[4] = *(_OWORD *)&a3->m31;
  v10[5] = v4;
  v5 = *(_OWORD *)&a3->m43;
  v10[6] = *(_OWORD *)&a3->m41;
  v10[7] = v5;
  v6 = *(_OWORD *)&a3->m13;
  v10[0] = *(_OWORD *)&a3->m11;
  v10[1] = v6;
  v7 = *(_OWORD *)&a3->m23;
  v10[2] = *(_OWORD *)&a3->m21;
  v10[3] = v7;
  o_CALayer_setTransform(a1, a2, v10);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___ZL20CALayer_setTransformP7CALayerP13objc_selector13CATransform3D_block_invoke;
  v9[3] = &unk_250D62BF0;
  v9[4] = a1;
  return objc_msgSend((id)_appClients, "enumerateObjectsUsingBlock:", v9);
}

uint64_t CALayer_setSublayerTransform(CALayer *a1, objc_selector *a2, CATransform3D *a3)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _QWORD v9[5];
  _OWORD v10[8];

  v4 = *(_OWORD *)&a3->m33;
  v10[4] = *(_OWORD *)&a3->m31;
  v10[5] = v4;
  v5 = *(_OWORD *)&a3->m43;
  v10[6] = *(_OWORD *)&a3->m41;
  v10[7] = v5;
  v6 = *(_OWORD *)&a3->m13;
  v10[0] = *(_OWORD *)&a3->m11;
  v10[1] = v6;
  v7 = *(_OWORD *)&a3->m23;
  v10[2] = *(_OWORD *)&a3->m21;
  v10[3] = v7;
  o_CALayer_setSublayerTransform(a1, a2, v10);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___ZL28CALayer_setSublayerTransformP7CALayerP13objc_selector13CATransform3D_block_invoke;
  v9[3] = &unk_250D62BF0;
  v9[4] = a1;
  return objc_msgSend((id)_appClients, "enumerateObjectsUsingBlock:", v9);
}

uint64_t CALayer_setPosition(CALayer *a1, objc_selector *a2, CGPoint a3)
{
  _QWORD v5[5];

  o_CALayer_setPosition(a1, a2, (__n128)a3, *(__n128 *)&a3.y);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = ___ZL19CALayer_setPositionP7CALayerP13objc_selector7CGPoint_block_invoke;
  v5[3] = &unk_250D62BF0;
  v5[4] = a1;
  return objc_msgSend((id)_appClients, "enumerateObjectsUsingBlock:", v5);
}

uint64_t CALayer_setAnchorPoint(CALayer *a1, objc_selector *a2, CGPoint a3)
{
  _QWORD v5[5];

  o_CALayer_setAnchorPoint(a1, a2, (__n128)a3, *(__n128 *)&a3.y);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = ___ZL22CALayer_setAnchorPointP7CALayerP13objc_selector7CGPoint_block_invoke;
  v5[3] = &unk_250D62BF0;
  v5[4] = a1;
  return objc_msgSend((id)_appClients, "enumerateObjectsUsingBlock:", v5);
}

CGFloat DYOrderedDimensionsFromBounds(const CGRect *a1)
{
  if (a1->size.width >= a1->size.height)
    return a1->size.width;
  else
    return a1->size.height;
}

void DYEncodeCALayerTransforms(GPUTools::FB::Stream *a1, CALayer *a2)
{
  double v4;
  double v5;
  char *v6;
  BOOL v7;
  int v8;
  Class v9;
  Class v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t **v15;
  CALayer *v16;
  const char *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  Fbuf v25;
  _OWORD v26[8];
  __int128 __p;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(gLayersSetPtr + 24))
    return;
  memset(&v25, 0, 20);
  {
    v6 = (char *)getprogname();
    std::string::basic_string[abi:ne180100]<0>(&__p, v6);
    v7 = std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__p, "backboardd");
    if (SBYTE7(v28) < 0)
      operator delete((void *)__p);
    DYEncodeCALayerTransforms(GPUTools::FB::Stream *,CALayer *)::isBackboarddProg = v7;
  }
  {
    if (DYEncodeCALayerTransforms(GPUTools::FB::Stream *,CALayer *)::isBackboarddBundle)
    {
LABEL_5:
      v4 = 240.0;
      v5 = 320.0;
      goto LABEL_23;
    }
  }
  else
  {
    if (DYEncodeCALayerTransforms(GPUTools::FB::Stream *,CALayer *)::isBackboarddProg)
      v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier"), "isEqualToString:", CFSTR("com.apple.backboardd"));
    else
      v8 = 0;
    DYEncodeCALayerTransforms(GPUTools::FB::Stream *,CALayer *)::isBackboarddBundle = v8;
    if (v8)
      goto LABEL_5;
  }
  v9 = NSClassFromString(CFSTR("NSScreen"));
  v10 = NSClassFromString(CFSTR("UIScreen"));
  if (v9)
  {
    v11 = (void *)-[objc_class performSelector:](v9, "performSelector:", sel_mainScreen);
    ((void (*)(void *, char *))objc_msgSend(v11, "methodForSelector:", sel_frame))(v11, sel_frame);
  }
  else
  {
    if (!v10)
      goto LABEL_5;
    v14 = (void *)-[objc_class performSelector:](v10, "performSelector:", sel_mainScreen);
    ((void (*)(void *, char *))objc_msgSend(v14, "methodForSelector:", sel_bounds))(v14, sel_bounds);
  }
  if (v12 >= v13)
    v5 = v12;
  else
    v5 = v13;
  if (v12 >= v13)
    v4 = v13;
  else
    v4 = v12;
LABEL_23:
  v15 = *(uint64_t ***)(gLayersSetPtr + 16);
  if (v15)
  {
    do
    {
      v16 = (CALayer *)v15[2];
      if (!a2 || objc_msgSend(v15[2], "isDescendantOf:", a2))
      {
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        __p = 0u;
        v28 = 0u;
        DYFinalLayerTransform(v16, &__p);
        v26[4] = v31;
        v26[5] = v32;
        v26[6] = v33;
        v26[7] = v34;
        v26[0] = __p;
        v26[1] = v28;
        v26[2] = v29;
        v26[3] = v30;
        -[CALayer bounds](v16, "bounds");
        if (v18 >= v19)
          v20 = v19;
        else
          v20 = v18;
        if (v18 >= v19)
          v21 = v18;
        else
          v21 = v19;
        GPUTools::FB::Encode((char **)&v25, (GPUTools::FB::Fbuf *)0xFFFFE009, 65540, (uint64_t)"p@16ddd", v17, v16, v26, v5 / v21, v4 / v20);
        GPUTools::FB::Stream::Write(a1, &v25, 1);
        -[CALayer anchorPoint](v16, "anchorPoint");
        *(_QWORD *)&__p = v22;
        -[CALayer anchorPoint](v16, "anchorPoint");
        *((_QWORD *)&__p + 1) = v23;
        GPUTools::FB::Encode((char **)&v25, (GPUTools::FB::Fbuf *)0xFFFFE00BLL, 65540, (uint64_t)"p@2d", v24, v16, &__p);
        GPUTools::FB::Stream::Write(a1, &v25, 1);
      }
      v15 = (uint64_t **)*v15;
    }
    while (v15);
    if (v25.var0.var0)
      free(v25.var0.var0);
  }
}

void sub_23C6E83C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  if (a14)
    free(a14);
  _Unwind_Resume(exception_object);
}

BOOL std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(_QWORD *a1, char *__s)
{
  size_t v4;

  v4 = strlen(__s);
  if (*((char *)a1 + 23) < 0)
  {
    if (v4 == a1[1])
    {
      if (v4 == -1)
        goto LABEL_10;
      a1 = (_QWORD *)*a1;
      return memcmp(a1, __s, v4) == 0;
    }
  }
  else if (v4 == *((unsigned __int8 *)a1 + 23))
  {
    if (v4 == -1)
LABEL_10:
      std::string::__throw_out_of_range[abi:ne180100]();
    return memcmp(a1, __s, v4) == 0;
  }
  return 0;
}

void GPUTools::FB::Encode(char **this, GPUTools::FB::Fbuf *a2, int a3, uint64_t a4, const char *a5, ...)
{
  GPUTools::FB::ArgumentProvider *v9;
  char v10[16];
  va_list v11;
  va_list va;

  va_start(va, a5);
  va_copy(v11, va);
  GPUTools::FB::VAListArgumentProvider::VAListArgumentProvider(v10, va);
  GPUTools::FB::Encode(this, a2, a3, a4, v10, v9);
  GPUTools::FB::VAListArgumentProvider::~VAListArgumentProvider((GPUTools::FB::VAListArgumentProvider *)v10);
}

void sub_23C6E8518(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  GPUTools::FB::VAListArgumentProvider::~VAListArgumentProvider((GPUTools::FB::VAListArgumentProvider *)va);
  _Unwind_Resume(a1);
}

void GPUTools::FB::Stream::Write(GPUTools::FB::Stream *this, Fbuf *a2, int a3)
{
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;

  v3 = (unsigned int *)((char *)this + 56);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(1u, v3));
  if (v4 == 1)
  {
    do
    {
      while (*v3 == 1)
        ;
      do
        v5 = __ldaxr(v3);
      while (__stlxr(1u, v3));
    }
    while (v5 == 1);
  }
  GPUTools::FB::Stream::Write_nolock(this, a2, *(unsigned int *)a2->var0.var0, a3);
  atomic_store(0, v3);
}

void sub_23C6E8598(_Unwind_Exception *a1)
{
  unsigned int *v1;

  atomic_store(0, v1);
  _Unwind_Resume(a1);
}

CGFloat DYFinalLayerTransform@<D0>(CALayer *a1@<X0>, __int128 *a2@<X8>)
{
  __int128 *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CALayer *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
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
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  double m42;
  double m41;
  _OWORD *v64;
  Class v65;
  void *v66;
  void *v67;
  uint64_t v68;
  SEL Uid;
  double v70;
  double v71;
  double v72;
  __int128 *v73;
  __int128 *v74;
  double v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  CGFloat result;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  CATransform3D v96;
  CATransform3D v97;
  CATransform3D v98;
  CATransform3D v99;
  CATransform3D v100;
  CATransform3D v101;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v104;
  CATransform3D v105;
  CATransform3D v106;
  CATransform3D v107;
  CATransform3D v108;
  CATransform3D v109;
  CATransform3D v110;
  CATransform3D v111;
  CATransform3D v112;
  CATransform3D v113;
  CATransform3D v114;

  v4 = (__int128 *)MEMORY[0x24BDE5598];
  v5 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  a2[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  a2[5] = v5;
  v6 = v4[7];
  a2[6] = v4[6];
  a2[7] = v6;
  v7 = v4[1];
  *a2 = *v4;
  a2[1] = v7;
  v8 = v4[3];
  a2[2] = v4[2];
  a2[3] = v8;
  v9 = a1;
  do
  {
    if (v9 != a1)
    {
      -[CALayer anchorPoint](v9, "anchorPoint");
      v11 = v10;
      -[CALayer bounds](v9, "bounds");
      v13 = v12;
      -[CALayer anchorPoint](v9, "anchorPoint");
      v15 = v14;
      -[CALayer bounds](v9, "bounds");
      v16 = -(v11 * v13);
      v18 = -(v15 * v17);
      -[CALayer anchorPointZ](v9, "anchorPointZ");
      CATransform3DMakeTranslation(&v104, v16, v18, -v19);
      v20 = a2[5];
      *(_OWORD *)&a.m31 = a2[4];
      *(_OWORD *)&a.m33 = v20;
      v21 = a2[7];
      *(_OWORD *)&a.m41 = a2[6];
      *(_OWORD *)&a.m43 = v21;
      v22 = a2[1];
      *(_OWORD *)&a.m11 = *a2;
      *(_OWORD *)&a.m13 = v22;
      v23 = a2[3];
      *(_OWORD *)&a.m21 = a2[2];
      *(_OWORD *)&a.m23 = v23;
      b = v104;
      CATransform3DConcat(&v114, &a, &b);
      v24 = *(_OWORD *)&v114.m33;
      a2[4] = *(_OWORD *)&v114.m31;
      a2[5] = v24;
      v25 = *(_OWORD *)&v114.m43;
      a2[6] = *(_OWORD *)&v114.m41;
      a2[7] = v25;
      v26 = *(_OWORD *)&v114.m13;
      *a2 = *(_OWORD *)&v114.m11;
      a2[1] = v26;
      v27 = *(_OWORD *)&v114.m23;
      a2[2] = *(_OWORD *)&v114.m21;
      a2[3] = v27;
    }
    v28 = a2[5];
    *(_OWORD *)&v101.m31 = a2[4];
    *(_OWORD *)&v101.m33 = v28;
    v29 = a2[7];
    *(_OWORD *)&v101.m41 = a2[6];
    *(_OWORD *)&v101.m43 = v29;
    v30 = a2[1];
    *(_OWORD *)&v101.m11 = *a2;
    *(_OWORD *)&v101.m13 = v30;
    v31 = a2[3];
    *(_OWORD *)&v101.m21 = a2[2];
    *(_OWORD *)&v101.m23 = v31;
    if (v9)
      -[CALayer transform](v9, "transform");
    else
      memset(&v100, 0, sizeof(v100));
    CATransform3DConcat(&v114, &v101, &v100);
    v32 = *(_OWORD *)&v114.m33;
    a2[4] = *(_OWORD *)&v114.m31;
    a2[5] = v32;
    v33 = *(_OWORD *)&v114.m43;
    a2[6] = *(_OWORD *)&v114.m41;
    a2[7] = v33;
    v34 = *(_OWORD *)&v114.m13;
    *a2 = *(_OWORD *)&v114.m11;
    a2[1] = v34;
    v35 = *(_OWORD *)&v114.m23;
    a2[2] = *(_OWORD *)&v114.m21;
    a2[3] = v35;
    if (v9 != a1)
    {
      v36 = a2[5];
      *(_OWORD *)&v99.m31 = a2[4];
      *(_OWORD *)&v99.m33 = v36;
      v37 = a2[7];
      *(_OWORD *)&v99.m41 = a2[6];
      *(_OWORD *)&v99.m43 = v37;
      v38 = a2[1];
      *(_OWORD *)&v99.m11 = *a2;
      *(_OWORD *)&v99.m13 = v38;
      v39 = a2[3];
      *(_OWORD *)&v99.m21 = a2[2];
      *(_OWORD *)&v99.m23 = v39;
      if (v9)
        -[CALayer sublayerTransform](v9, "sublayerTransform");
      else
        memset(&v98, 0, sizeof(v98));
      CATransform3DConcat(&v114, &v99, &v98);
      v40 = *(_OWORD *)&v114.m33;
      a2[4] = *(_OWORD *)&v114.m31;
      a2[5] = v40;
      v41 = *(_OWORD *)&v114.m43;
      a2[6] = *(_OWORD *)&v114.m41;
      a2[7] = v41;
      v42 = *(_OWORD *)&v114.m13;
      *a2 = *(_OWORD *)&v114.m11;
      a2[1] = v42;
      v43 = *(_OWORD *)&v114.m23;
      a2[2] = *(_OWORD *)&v114.m21;
      a2[3] = v43;
    }
    -[CALayer position](v9, "position");
    v45 = v44;
    -[CALayer position](v9, "position");
    v47 = v46;
    -[CALayer zPosition](v9, "zPosition");
    CATransform3DMakeTranslation(&v114, v45, v47, v48);
    v104 = v114;
    v49 = *a2;
    v50 = a2[1];
    v51 = a2[3];
    *(_OWORD *)&v97.m21 = a2[2];
    *(_OWORD *)&v97.m23 = v51;
    *(_OWORD *)&v97.m11 = v49;
    *(_OWORD *)&v97.m13 = v50;
    v52 = a2[4];
    v53 = a2[5];
    v54 = a2[7];
    *(_OWORD *)&v97.m41 = a2[6];
    *(_OWORD *)&v97.m43 = v54;
    *(_OWORD *)&v97.m31 = v52;
    *(_OWORD *)&v97.m33 = v53;
    v96 = v114;
    CATransform3DConcat(&v114, &v97, &v96);
    v55 = *(_OWORD *)&v114.m33;
    a2[4] = *(_OWORD *)&v114.m31;
    a2[5] = v55;
    v56 = *(_OWORD *)&v114.m43;
    a2[6] = *(_OWORD *)&v114.m41;
    a2[7] = v56;
    v57 = *(_OWORD *)&v114.m13;
    *a2 = *(_OWORD *)&v114.m11;
    a2[1] = v57;
    v58 = *(_OWORD *)&v114.m23;
    a2[2] = *(_OWORD *)&v114.m21;
    a2[3] = v58;
    v9 = -[CALayer superlayer](v9, "superlayer");
  }
  while (v9);
  v59 = a2[3];
  v92 = a2[2];
  v93 = v59;
  v60 = a2[5];
  v94 = a2[4];
  v95 = v60;
  v61 = a2[1];
  v90 = *a2;
  v91 = v61;
  m41 = *((double *)a2 + 12);
  m42 = *((double *)a2 + 13);
  v64 = a2 + 7;
  v89 = a2[7];
  v65 = NSClassFromString(CFSTR("UIScreen"));
  if (!v65)
  {
    v74 = a2;
    v73 = a2 + 7;
    goto LABEL_26;
  }
  v66 = (void *)-[objc_class performSelector:](v65, "performSelector:", sel_getUid("mainScreen"), v89, v90, v91, v92, v93, v94, v95);
  v67 = (void *)objc_msgSend(v66, "performSelector:", sel_getUid("coordinateSpace"));
  v68 = objc_msgSend(v66, "performSelector:", sel_getUid("fixedCoordinateSpace"));
  Uid = sel_getUid("convertPoint:toCoordinateSpace:");
  v71 = fabs(((double (*)(void *, SEL, uint64_t, double, double))objc_msgSend(v67, "methodForSelector:", Uid))(v67, Uid, v68, 0.0, 0.0));
  if (v71 >= 0.001 && v71 >= fmax(v71, 0.0) * 0.001)
  {
    v75 = fabs(v70);
    if (v75 >= 0.001 && v75 >= fmax(v75, 0.0) * 0.001)
    {
      memset(&v114, 0, sizeof(v114));
      CATransform3DMakeRotation(&v114, 3.14159265, 0.0, 0.0, 1.0);
      memset(&v113, 0, sizeof(v113));
      CATransform3DMakeTranslation(&v113, -m41, -m42, 0.0);
      memset(&v112, 0, sizeof(v112));
      v77 = m41;
      v78 = m42;
      goto LABEL_25;
    }
    memset(&v114, 0, sizeof(v114));
    v76 = 1.57079633;
LABEL_24:
    CATransform3DMakeRotation(&v114, v76, 0.0, 0.0, 1.0);
    memset(&v113, 0, sizeof(v113));
    CATransform3DMakeTranslation(&v113, -m41, -m42, 0.0);
    memset(&v112, 0, sizeof(v112));
    v77 = m42;
    v78 = m41;
LABEL_25:
    CATransform3DMakeTranslation(&v112, v77, v78, 0.0);
    v79 = a2[3];
    *(_OWORD *)&v110.m21 = a2[2];
    *(_OWORD *)&v110.m23 = v79;
    v80 = a2[5];
    *(_OWORD *)&v110.m31 = a2[4];
    *(_OWORD *)&v110.m33 = v80;
    v81 = a2[1];
    *(_OWORD *)&v110.m11 = *a2;
    *(_OWORD *)&v110.m13 = v81;
    v110.m41 = m41;
    v110.m42 = m42;
    *(_OWORD *)&v110.m43 = *v64;
    v109 = v113;
    CATransform3DConcat(&v111, &v110, &v109);
    v108 = v111;
    v107 = v114;
    CATransform3DConcat(&v111, &v108, &v107);
    v106 = v111;
    v105 = v112;
    CATransform3DConcat(&v111, &v106, &v105);
    v92 = *(_OWORD *)&v111.m21;
    v93 = *(_OWORD *)&v111.m23;
    v94 = *(_OWORD *)&v111.m31;
    v95 = *(_OWORD *)&v111.m33;
    v90 = *(_OWORD *)&v111.m11;
    v91 = *(_OWORD *)&v111.m13;
    m41 = v111.m41;
    m42 = v111.m42;
    v73 = &v89;
    v74 = &v90;
    v89 = *(_OWORD *)&v111.m43;
    goto LABEL_26;
  }
  v72 = fabs(v70);
  if (v72 >= 0.001 && v72 >= fmax(v72, 0.0) * 0.001)
  {
    memset(&v114, 0, sizeof(v114));
    v76 = -1.57079633;
    goto LABEL_24;
  }
  v73 = &v89;
  v74 = &v90;
LABEL_26:
  v82 = v74[3];
  *(_OWORD *)&v114.m21 = v74[2];
  *(_OWORD *)&v114.m23 = v82;
  v83 = v74[5];
  *(_OWORD *)&v114.m31 = v74[4];
  *(_OWORD *)&v114.m33 = v83;
  v84 = v74[1];
  *(_OWORD *)&v114.m11 = *v74;
  *(_OWORD *)&v114.m13 = v84;
  *(_OWORD *)&v113.m11 = *v73;
  v85 = *(_OWORD *)&v114.m23;
  a2[2] = *(_OWORD *)&v114.m21;
  a2[3] = v85;
  v86 = *(_OWORD *)&v114.m33;
  a2[4] = *(_OWORD *)&v114.m31;
  a2[5] = v86;
  v87 = *(_OWORD *)&v114.m13;
  *a2 = *(_OWORD *)&v114.m11;
  a2[1] = v87;
  *((double *)a2 + 12) = m41;
  *((double *)a2 + 13) = m42;
  result = v113.m11;
  *v64 = *(_OWORD *)&v113.m11;
  return result;
}

void ___ZL20CALayer_setTransformP7CALayerP13objc_selector13CATransform3D_block_invoke(uint64_t a1, void *a2)
{
  if ((int)objc_msgSend(a2, "traceMode") >= 4 && objc_msgSend(a2, "traceMode") != 7)
    DYEncodeCALayerTransforms((GPUTools::FB::Stream *)objc_msgSend(a2, "defaultFbufStream"), *(CALayer **)(a1 + 32));
}

void ___ZL28CALayer_setSublayerTransformP7CALayerP13objc_selector13CATransform3D_block_invoke(uint64_t a1, void *a2)
{
  if ((int)objc_msgSend(a2, "traceMode") >= 4 && objc_msgSend(a2, "traceMode") != 7)
    DYEncodeCALayerTransforms((GPUTools::FB::Stream *)objc_msgSend(a2, "defaultFbufStream"), *(CALayer **)(a1 + 32));
}

void ___ZL19CALayer_setPositionP7CALayerP13objc_selector7CGPoint_block_invoke(uint64_t a1, void *a2)
{
  if ((int)objc_msgSend(a2, "traceMode") >= 4 && objc_msgSend(a2, "traceMode") != 7)
    DYEncodeCALayerTransforms((GPUTools::FB::Stream *)objc_msgSend(a2, "defaultFbufStream"), *(CALayer **)(a1 + 32));
}

void ___ZL22CALayer_setAnchorPointP7CALayerP13objc_selector7CGPoint_block_invoke(uint64_t a1, void *a2)
{
  if ((int)objc_msgSend(a2, "traceMode") >= 4 && objc_msgSend(a2, "traceMode") != 7)
    DYEncodeCALayerTransforms((GPUTools::FB::Stream *)objc_msgSend(a2, "defaultFbufStream"), *(CALayer **)(a1 + 32));
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
  std::__throw_out_of_range[abi:ne180100]("basic_string");
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
}

void sub_23C6E8F78(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

void sub_23C6E9CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void GPUTools::FB::EncodeStaticBacktrace(GPUTools::FB *this, GPUTools::FB::Fbuf *a2, unint64_t *a3)
{
  int v3;
  char *v6;
  size_t v7;
  size_t v8;
  _BYTE *v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  _DWORD *v13;
  _DWORD *v14;
  size_t v15;
  size_t v16;
  unint64_t v17;
  int v18;
  int v19;
  size_t v20;
  char *v21;

  v3 = (int)a3;
  v6 = (char *)*((_QWORD *)this + 1);
  *(_DWORD *)(*(_QWORD *)this + 32) |= 8u;
  v7 = 8 * a3;
  v8 = v7 + 8;
  v9 = *(_BYTE **)this;
  v10 = v6 - v9;
  v11 = *((unsigned int *)this + 4);
  v12 = v11 - (v6 - v9);
  if (v7 + 8 <= v12)
    goto LABEL_2;
  v19 = (v8 - v12 + 255) & 0xFFFFFF00;
  v20 = (v19 + v11);
  *((_DWORD *)this + 4) = v20;
  if (v9)
  {
    v21 = (char *)reallocf(v9, v20);
    *(_QWORD *)this = v21;
    if (v21)
      goto LABEL_7;
LABEL_10:
    dy_abort("failed to allocate fbuf buffer");
  }
  v21 = (char *)malloc_type_malloc((v19 + v11), 0xC56234FuLL);
  *(_QWORD *)this = v21;
  if (!v21)
    goto LABEL_10;
LABEL_7:
  if ((v21 & 3) != 0)
    dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v21, 4uLL);
  v6 = &v21[v10];
  *((_QWORD *)this + 1) = &v21[v10];
LABEL_2:
  bzero(v6, v7 + 8);
  v13 = (_DWORD *)*((_QWORD *)this + 1);
  *v13 = v3;
  v13[1] = 8;
  memcpy(v13 + 2, a2, v7);
  v14 = *(_DWORD **)this;
  v15 = v8 + *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v15;
  v16 = v15 - (_QWORD)v14;
  *v14 = v16;
  v17 = (v16 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  v18 = v17 - v16;
  if (v17 != v16)
  {
    GPUTools::FB::Fbuf::grow_advance(this, v17 - v16);
    **(_DWORD **)this += v18;
  }
}

void GPUTools::FB::Fbuf::grow(GPUTools::FB::Fbuf *this, size_t a2)
{
  _BYTE *v4;
  char *v5;
  int64_t v6;
  uint64_t v7;
  size_t v8;
  int v9;
  size_t v10;
  char *v11;

  v4 = *(_BYTE **)this;
  v5 = (char *)*((_QWORD *)this + 1);
  v6 = v5 - v4;
  v7 = *((unsigned int *)this + 4);
  v8 = v7 - (v5 - v4);
  if (a2 <= v8)
    goto LABEL_2;
  v9 = (a2 - v8 + 255) & 0xFFFFFF00;
  v10 = (v9 + v7);
  *((_DWORD *)this + 4) = v10;
  if (v4)
  {
    v11 = (char *)reallocf(v4, v10);
    *(_QWORD *)this = v11;
    if (v11)
      goto LABEL_5;
LABEL_8:
    dy_abort("failed to allocate fbuf buffer");
  }
  v11 = (char *)malloc_type_malloc((v9 + v7), 0xC56234FuLL);
  *(_QWORD *)this = v11;
  if (!v11)
    goto LABEL_8;
LABEL_5:
  if ((v11 & 3) != 0)
    dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v11, 4uLL);
  v5 = &v11[v6];
  *((_QWORD *)this + 1) = &v11[v6];
LABEL_2:
  bzero(v5, a2);
}

void GPUTools::FB::EncodeCurrentBacktrace(GPUTools::FB *this, GPUTools::FB::Fbuf *a2)
{
  char *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  int v14;
  size_t v15;
  char *v16;
  int v17;
  int v18;

  v3 = (char *)*((_QWORD *)this + 1);
  *(_DWORD *)(*(_QWORD *)this + 32) |= 8u;
  v4 = *(_BYTE **)this;
  v5 = v3 - v4;
  v6 = *((unsigned int *)this + 4);
  v7 = v6 - (v3 - v4);
  if (v7 > 0x107)
    goto LABEL_2;
  v14 = (519 - v7) & 0xFFFFFF00;
  v15 = (v14 + v6);
  *((_DWORD *)this + 4) = v15;
  if (v4)
  {
    v16 = (char *)reallocf(v4, v15);
    *(_QWORD *)this = v16;
    if (v16)
      goto LABEL_8;
LABEL_15:
    dy_abort("failed to allocate fbuf buffer");
  }
  v16 = (char *)malloc_type_malloc((v14 + v6), 0xC56234FuLL);
  *(_QWORD *)this = v16;
  if (!v16)
    goto LABEL_15;
LABEL_8:
  if ((v16 & 3) != 0)
    dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v16, 4uLL);
  v3 = &v16[v5];
  *((_QWORD *)this + 1) = &v16[v5];
LABEL_2:
  *((_QWORD *)v3 + 32) = 0;
  *((_OWORD *)v3 + 14) = 0u;
  *((_OWORD *)v3 + 15) = 0u;
  *((_OWORD *)v3 + 12) = 0u;
  *((_OWORD *)v3 + 13) = 0u;
  *((_OWORD *)v3 + 10) = 0u;
  *((_OWORD *)v3 + 11) = 0u;
  *((_OWORD *)v3 + 8) = 0u;
  *((_OWORD *)v3 + 9) = 0u;
  *((_OWORD *)v3 + 6) = 0u;
  *((_OWORD *)v3 + 7) = 0u;
  *((_OWORD *)v3 + 4) = 0u;
  *((_OWORD *)v3 + 5) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  v8 = backtrace((void **)(*((_QWORD *)this + 1) + 8), 32);
  if (v8 == 32)
  {
    v17 = 32;
    do
    {
      v18 = 2 * v17;
      GPUTools::FB::Fbuf::grow(this, (16 * ((unint64_t)(2 * v17) >> 1)) | 8);
      v8 = backtrace((void **)(*((_QWORD *)this + 1) + 8), 2 * v17);
      if (v17 >= 0x80000)
        break;
      v17 *= 2;
    }
    while (v8 >= v18);
  }
  v9 = (int *)*((_QWORD *)this + 1);
  *v9 = v8;
  v9[1] = 8;
  v10 = (uint64_t)&v9[2 * v8 + 2];
  *((_QWORD *)this + 1) = v10;
  v11 = v10 - *(_QWORD *)this;
  **(_DWORD **)this = v11;
  v12 = (v11 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  v13 = v12 - v11;
  if (v12 != v11)
  {
    GPUTools::FB::Fbuf::grow_advance(this, v12 - v11);
    **(_DWORD **)this += v13;
  }
}

void GPUTools::FB::EncodeGLError(GPUTools::FB *this, GPUTools::FB::Fbuf *a2)
{
  int v2;
  char *v4;
  _BYTE *v5;
  int64_t v6;
  uint64_t v7;
  unint64_t v8;
  _DWORD *v9;
  char *v10;
  unint64_t v11;
  int v12;
  int v13;
  size_t v14;
  char *v15;

  v2 = (int)a2;
  v4 = (char *)*((_QWORD *)this + 1);
  *(_DWORD *)(*(_QWORD *)this + 32) |= 0x10u;
  v5 = *(_BYTE **)this;
  v6 = v4 - v5;
  v7 = *((unsigned int *)this + 4);
  v8 = v7 - (v4 - v5);
  if (v8 > 3)
    goto LABEL_2;
  v13 = (259 - v8) & 0xFFFFFF00;
  v14 = (v13 + v7);
  *((_DWORD *)this + 4) = v14;
  if (v5)
  {
    v15 = (char *)reallocf(v5, v14);
    *(_QWORD *)this = v15;
    if (v15)
      goto LABEL_7;
LABEL_10:
    dy_abort("failed to allocate fbuf buffer");
  }
  v15 = (char *)malloc_type_malloc((v13 + v7), 0xC56234FuLL);
  *(_QWORD *)this = v15;
  if (!v15)
    goto LABEL_10;
LABEL_7:
  if ((v15 & 3) != 0)
    dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v15, 4uLL);
  v4 = &v15[v6];
  *((_QWORD *)this + 1) = &v15[v6];
LABEL_2:
  *(_DWORD *)v4 = 0;
  v9 = (_DWORD *)*((_QWORD *)this + 1);
  *v9++ = v2;
  *((_QWORD *)this + 1) = v9;
  v10 = (char *)v9 - *(_QWORD *)this;
  **(_DWORD **)this = (_DWORD)v10;
  v11 = (unint64_t)(v10 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  v12 = v11 - (_DWORD)v10;
  if ((char *)v11 != v10)
  {
    GPUTools::FB::Fbuf::grow_advance(this, v11 - (_QWORD)v10);
    **(_DWORD **)this += v12;
  }
}

void GPUTools::FB::EncodePerfEvents(GPUTools::FB::Fbuf *a1, int a2, const void *a3, size_t a4)
{
  char *v8;
  size_t v9;
  _BYTE *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  _DWORD *v14;
  _DWORD *v15;
  size_t v16;
  size_t v17;
  unint64_t v18;
  int v19;
  int v20;
  size_t v21;
  char *v22;

  v8 = (char *)*((_QWORD *)a1 + 1);
  *(_DWORD *)(*(_QWORD *)a1 + 32) |= 0x20u;
  v9 = a4 + 8;
  v10 = *(_BYTE **)a1;
  v11 = v8 - v10;
  v12 = *((unsigned int *)a1 + 4);
  v13 = v12 - (v8 - v10);
  if (a4 + 8 <= v13)
    goto LABEL_2;
  v20 = (v9 - v13 + 255) & 0xFFFFFF00;
  v21 = (v20 + v12);
  *((_DWORD *)a1 + 4) = v21;
  if (v10)
  {
    v22 = (char *)reallocf(v10, v21);
    *(_QWORD *)a1 = v22;
    if (v22)
      goto LABEL_7;
LABEL_10:
    dy_abort("failed to allocate fbuf buffer");
  }
  v22 = (char *)malloc_type_malloc((v20 + v12), 0xC56234FuLL);
  *(_QWORD *)a1 = v22;
  if (!v22)
    goto LABEL_10;
LABEL_7:
  if ((v22 & 3) != 0)
    dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v22, 4uLL);
  v8 = &v22[v11];
  *((_QWORD *)a1 + 1) = &v22[v11];
LABEL_2:
  bzero(v8, v9);
  v14 = (_DWORD *)*((_QWORD *)a1 + 1);
  *v14 = a2;
  v14[1] = a4;
  *((_QWORD *)a1 + 1) = v14 + 2;
  memcpy(v14 + 2, a3, a4);
  v15 = *(_DWORD **)a1;
  v16 = *((_QWORD *)a1 + 1) + a4;
  *((_QWORD *)a1 + 1) = v16;
  v17 = v16 - (_QWORD)v15;
  *v15 = v17;
  v18 = (v17 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  v19 = v18 - v17;
  if (v18 != v17)
  {
    GPUTools::FB::Fbuf::grow_advance(a1, v18 - v17);
    **(_DWORD **)a1 += v19;
  }
}

void GPUTools::FB::EncodeGCDQueueInfo(GPUTools::FB *this, GPUTools::FB::Fbuf *a2, int a3)
{
  char *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  int v15;
  size_t v16;
  char *v17;

  v6 = (char *)*((_QWORD *)this + 1);
  *(_DWORD *)(*(_QWORD *)this + 32) |= 0x400u;
  v7 = *(_BYTE **)this;
  v8 = v6 - v7;
  v9 = *((unsigned int *)this + 4);
  v10 = v9 - (v6 - v7);
  if (v10 > 0xB)
    goto LABEL_2;
  v15 = (267 - v10) & 0xFFFFFF00;
  v16 = (v15 + v9);
  *((_DWORD *)this + 4) = v16;
  if (v7)
  {
    v17 = (char *)reallocf(v7, v16);
    *(_QWORD *)this = v17;
    if (v17)
      goto LABEL_7;
LABEL_10:
    dy_abort("failed to allocate fbuf buffer");
  }
  v17 = (char *)malloc_type_malloc((v15 + v9), 0xC56234FuLL);
  *(_QWORD *)this = v17;
  if (!v17)
    goto LABEL_10;
LABEL_7:
  if ((v17 & 3) != 0)
    dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v17, 4uLL);
  v6 = &v17[v8];
  *((_QWORD *)this + 1) = &v17[v8];
LABEL_2:
  *((_DWORD *)v6 + 2) = 0;
  *(_QWORD *)v6 = 0;
  v11 = *((_QWORD *)this + 1);
  *(_QWORD *)v11 = a2;
  *(_DWORD *)(v11 + 8) = a3;
  v11 += 12;
  *((_QWORD *)this + 1) = v11;
  v12 = v11 - *(_QWORD *)this;
  **(_DWORD **)this = v12;
  v13 = (v12 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  v14 = v13 - v12;
  if (v13 != v12)
  {
    GPUTools::FB::Fbuf::grow_advance(this, v13 - v12);
    **(_DWORD **)this += v14;
  }
}

GPUTools::FB::Fbuf *GPUTools::FB::EncodeCurrentGCDQueueInfo(GPUTools::FB *this, GPUTools::FB::Fbuf *a2)
{
  GPUTools::FB::Fbuf *v2;
  int v3;

  v2 = *(GPUTools::FB::Fbuf **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 160);
  if (v2)
  {
    v3 = 0;
    switch(*(_WORD *)(MEMORY[0x24BDADEF8] + 16))
    {
      case 1:
        v3 = *((unsigned __int8 *)v2 + *(unsigned __int16 *)(MEMORY[0x24BDADEF8] + 14));
        break;
      case 2:
        v3 = *(unsigned __int16 *)((char *)v2 + *(unsigned __int16 *)(MEMORY[0x24BDADEF8] + 14));
        break;
      case 4:
      case 8:
        v3 = *(_DWORD *)((char *)v2 + *(unsigned __int16 *)(MEMORY[0x24BDADEF8] + 14));
        break;
      default:
        break;
    }
    GPUTools::FB::EncodeGCDQueueInfo(this, v2, v3);
  }
  return v2;
}

_DWORD *GPUTools::FB::EncodeThreadLocalFlags(GPUTools::FB *this)
{
  _DWORD *result;
  int v2;

  *result = v2;
  return result;
}

_QWORD *GPUTools::FB::Encode(char **this, GPUTools::FB::Fbuf *a2, int a3, uint64_t a4, const char *a5, GPUTools::FB::ArgumentProvider *a6)
{
  int v8;
  __uint64_t *v10;
  uint64_t v11;
  int v12;
  char *v13;
  int v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  size_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  size_t v24;
  char v25;
  int v26;
  unsigned int v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  const void *v39;
  size_t v40;
  char *v41;
  char *v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  unint64_t v49;
  int *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  char *v56;
  unint64_t v57;
  size_t v58;
  char *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  char *v63;
  int v64;
  size_t v65;
  char *v66;
  int v67;
  size_t v68;
  char *v69;
  char *v70;
  int v71;
  size_t v72;
  char *v73;
  int v74;
  BOOL v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  int v79;
  int v80;
  size_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  char *v92;
  int *v93;
  int v94;
  size_t v95;
  char *v96;
  int v97;
  size_t v98;
  char *v99;
  size_t v100;
  unint64_t v101;
  int v102;
  _QWORD *result;
  uint64_t v104;
  int v105;
  size_t v106;
  char *v107;
  int v108;
  size_t v109;
  char *v110;
  const char *v111;
  uint64_t v112;
  char *v113;
  __uint64_t *v114;
  int *__src;
  double v116;
  int v117;
  int v118;
  _QWORD v119[3];
  _QWORD *v120;
  __uint64_t v121[3];
  __uint64_t *v122;
  uint64_t v123;

  v8 = (int)a2;
  v123 = *MEMORY[0x24BDAC8D0];
  v118 = a3;
  pthread_mutex_lock(&sFunctionChainLock);
  v120 = 0;
  v121[0] = (__uint64_t)&off_250D63150;
  v121[1] = (__uint64_t)&v118;
  v122 = v121;
  std::__function::__value_func<void ()(void)>::swap[abi:ne180100](v121, v119);
  v10 = v122;
  if (v122 == v121)
  {
    v11 = 4;
    v10 = v121;
    goto LABEL_5;
  }
  if (v122)
  {
    v11 = 5;
LABEL_5:
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  v118 = v12;
  if ((v8 + 12281) < 2 || v8 == -12272)
  {
    if (v8 == -12272)
      v14 = 198;
    else
      v14 = 70;
    v12 |= v14;
    v118 = v12;
  }
  else if (v8 == -12288)
  {
    *((_DWORD *)*this + 8) |= 1u;
    v13 = this[1];
    goto LABEL_18;
  }
  v15 = *this;
  v16 = this[1];
  v17 = (char *)(v16 - *this);
  v18 = *((unsigned int *)this + 4);
  if ((unint64_t)(v18 - (_QWORD)v17) <= 0x23)
  {
    v108 = (291 - (v18 - (_DWORD)v17)) & 0xFFFFFF00;
    v109 = (v108 + v18);
    *((_DWORD *)this + 4) = v109;
    if (v15)
    {
      v110 = (char *)reallocf(v15, v109);
      *this = v110;
      if (v110)
        goto LABEL_136;
    }
    else
    {
      v110 = (char *)malloc_type_malloc((v108 + v18), 0xC56234FuLL);
      *this = v110;
      if (v110)
      {
LABEL_136:
        if ((v110 & 3) != 0)
          dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v110, 4uLL);
        v16 = &v110[(_QWORD)v17];
        this[1] = &v110[(_QWORD)v17];
        v12 = v118;
        goto LABEL_15;
      }
    }
    dy_abort("failed to allocate fbuf buffer");
  }
LABEL_15:
  *((_DWORD *)v16 + 8) = 0;
  *(_OWORD *)v16 = 0u;
  *((_OWORD *)v16 + 1) = 0u;
  *((_DWORD *)*this + 1) = v8;
  *((_DWORD *)*this + 8) = v12;
  v121[0] = 0;
  pthread_threadid_np(0, v121);
  *((_QWORD *)*this + 1) = v121[0];
  v19 = mach_absolute_time();
  if (g_DYTimebaseInfo != dword_256BC8DD4)
    v19 = __udivti3();
  *((_QWORD *)*this + 2) = v19;
  *((_QWORD *)*this + 3) = 0;
  v13 = this[1] + 36;
  this[1] = v13;
LABEL_18:
  v20 = (strlen((const char *)a4) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  v21 = *this;
  v22 = (char *)(v13 - *this);
  v23 = *((unsigned int *)this + 4);
  if (v20 <= v23 - (uint64_t)v22)
    goto LABEL_19;
  v105 = (v20 - (v23 - (_DWORD)v22) + 255) & 0xFFFFFF00;
  v106 = (v105 + v23);
  *((_DWORD *)this + 4) = v106;
  if (v21)
  {
    v107 = (char *)reallocf(v21, v106);
    *this = v107;
    if (v107)
      goto LABEL_132;
LABEL_150:
    dy_abort("failed to allocate fbuf buffer");
  }
  v107 = (char *)malloc_type_malloc((v105 + v23), 0xC56234FuLL);
  *this = v107;
  if (!v107)
    goto LABEL_150;
LABEL_132:
  if ((v107 & 3) != 0)
    dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v107, 4uLL);
  v13 = &v107[(_QWORD)v22];
  this[1] = &v107[(_QWORD)v22];
LABEL_19:
  bzero(v13, v20);
  strlcpy(this[1], (const char *)a4, v20);
  v24 = (size_t)&this[1][v20];
  this[1] = (char *)v24;
  v117 = 0;
  v121[0] = 0;
  v25 = *(_BYTE *)a4;
  if (*(_BYTE *)a4)
  {
    v114 = 0;
    __src = 0;
    v26 = 0;
    v27 = 0;
    v111 = a5;
    while (2)
    {
      switch(v25)
      {
        case '#':
          v34 = *(char *)++a4;
          LOBYTE(v33) = v34;
          if (v34 < 0)
          {
            v27 = 0;
          }
          else
          {
            v27 = 0;
            v33 = v33;
            do
            {
              if (!v33)
                break;
              if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v33 + 60) & 0x400) == 0)
                break;
              v27 = 10 * v27 + v33 - 48;
              v35 = *(char *)++a4;
              v33 = v35;
            }
            while ((v35 & 0x80000000) == 0);
          }
          __src = (int *)(*(uint64_t (**)(const char *))(*(_QWORD *)a5 + 72))(a5);
          v114 = (__uint64_t *)(*(uint64_t (**)(const char *))(*(_QWORD *)a5 + 72))(a5);
          v84 = *this;
          v83 = this[1];
          v85 = ((unint64_t)(v83 + 3) & 0xFFFFFFFFFFFFFFFCLL) - (_QWORD)v83;
          v86 = 4 * v27;
          v87 = v85 + v86;
          v88 = (char *)(v83 - *this);
          v89 = *((unsigned int *)this + 4);
          if (v85 + v86 <= v89 - (uint64_t)v88)
            goto LABEL_90;
          v94 = (v87 - (v89 - (_DWORD)v88) + 255) & 0xFFFFFF00;
          v95 = (v94 + v89);
          *((_DWORD *)this + 4) = v95;
          if (v84)
          {
            v96 = (char *)reallocf(v84, v95);
            *this = v96;
            if (!v96)
LABEL_144:
              dy_abort("failed to allocate fbuf buffer");
          }
          else
          {
            v96 = (char *)malloc_type_malloc((v94 + v89), 0xC56234FuLL);
            *this = v96;
            if (!v96)
              goto LABEL_144;
          }
          if ((v96 & 3) != 0)
            dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v96, 4uLL);
          v83 = &v96[(_QWORD)v88];
          this[1] = v83;
LABEL_90:
          bzero(v83, v85 + v86);
          memcpy(&this[1][v85], __src, 4 * v27);
          v26 = 0;
          this[1] += v87;
          goto LABEL_25;
        case '$':
        case '%':
        case '&':
        case '\'':
        case '(':
        case ')':
        case '*':
        case '+':
        case ',':
        case '-':
        case '.':
        case '/':
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
        case ';':
        case '=':
        case '>':
        case '?':
          goto LABEL_35;
        case ':':
          dy_abort("url list encoding is no longer supported");
        case '<':
          v74 = *(unsigned __int8 *)(a4 + 1);
          v75 = v74 == 99 || v74 == 117;
          v76 = 1;
          if (v75)
            v76 = 2;
          a4 += v76 + 2;
          goto LABEL_25;
        case '@':
          v117 = 0;
          v78 = *(char *)++a4;
          LOBYTE(v77) = v78;
          if ((v78 & 0x80000000) == 0)
          {
            v79 = 0;
            v77 = v77;
            do
            {
              if (!v77)
                break;
              if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v77 + 60) & 0x400) == 0)
                break;
              v79 = 10 * v79 + v77 - 48;
              v117 = v79;
              v80 = *(char *)++a4;
              v77 = v80;
            }
            while ((v80 & 0x80000000) == 0);
          }
          v26 = 0;
          v121[0] = (*(uint64_t (**)(const char *))(*(_QWORD *)a5 + 72))(a5);
          v114 = v121;
          __src = &v117;
          v27 = 1;
          goto LABEL_25;
        default:
          if (v25 == 99 || v25 == 117)
            goto LABEL_24;
LABEL_35:
          v36 = v25;
          v112 = a4;
          if (v27)
          {
            v37 = v36 - 65;
            if ((v36 - 65) > 0x37 || ((1 << v37) & 0xCCA93A01BFFDBFLL) == 0)
              dy_abort("unknown format character: '%c' (in '%s')\n", v36, (const char *)a4);
            v38 = 1;
            while (1)
            {
              v39 = (const void *)v114[v26];
              switch(v37)
              {
                case 0:
                case 1:
                case 4:
                case 5:
                case 7:
                case 8:
                case 10:
                case 11:
                case 14:
                case 16:
                case 17:
                case 19:
                case 23:
                case 36:
                case 37:
                case 40:
                case 45:
                case 55:
                  v40 = 4 * __src[v26];
                  goto LABEL_42;
                case 2:
                case 3:
                case 12:
                case 13:
                case 15:
                case 24:
                case 35:
                case 43:
                case 47:
                case 51:
                case 54:
                  v40 = 8 * __src[v26];
LABEL_42:
                  v38 = 4;
                  goto LABEL_43;
                case 33:
                  v40 = __src[v26];
                  goto LABEL_43;
                case 50:
                  v40 = 2 * __src[v26];
                  v38 = 2;
LABEL_43:
                  v42 = *this;
                  v41 = this[1];
                  v43 = ((unint64_t)&v41[v38 - 1] & -v38) - (_QWORD)v41;
                  v44 = v43 + v40;
                  v45 = (char *)(v41 - *this);
                  v46 = *((unsigned int *)this + 4);
                  if (v43 + v40 <= v46 - (uint64_t)v45)
                    goto LABEL_44;
                  v67 = (v44 - (v46 - (_DWORD)v45) + 255) & 0xFFFFFF00;
                  v68 = (v67 + v46);
                  *((_DWORD *)this + 4) = v68;
                  if (v42)
                  {
                    v69 = (char *)reallocf(v42, v68);
                    *this = v69;
                    if (!v69)
LABEL_138:
                      dy_abort("failed to allocate fbuf buffer");
                  }
                  else
                  {
                    v69 = (char *)malloc_type_malloc((v67 + v46), 0xC56234FuLL);
                    *this = v69;
                    if (!v69)
                      goto LABEL_138;
                  }
                  if ((v69 & 3) != 0)
                    dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v69, 4uLL);
                  v41 = &v69[(_QWORD)v45];
                  this[1] = v41;
LABEL_44:
                  bzero(v41, v43 + v40);
                  memcpy(&this[1][v43], v39, v40);
                  this[1] += v44;
                  goto LABEL_45;
                default:
                  v48 = *this;
                  v47 = this[1];
                  v49 = ((unint64_t)(v47 + 3) & 0xFFFFFFFFFFFFFFFCLL) - (_QWORD)v47;
                  v50 = __src;
                  v51 = 4 * __src[v26];
                  v52 = v49 + v51;
                  v53 = *((unsigned int *)this + 4);
                  v54 = v53 - (v47 - *this);
                  if (v49 + v51 <= v54)
                    goto LABEL_48;
                  v70 = (char *)(v47 - *this);
                  v71 = (v52 - v54 + 255) & 0xFFFFFF00;
                  v72 = (v71 + v53);
                  *((_DWORD *)this + 4) = v72;
                  if (v48)
                  {
                    v73 = (char *)reallocf(v48, v72);
                    *this = v73;
                    if (!v73)
LABEL_147:
                      dy_abort("failed to allocate fbuf buffer");
                  }
                  else
                  {
                    v73 = (char *)malloc_type_malloc((v71 + v53), 0xC56234FuLL);
                    *this = v73;
                    if (!v73)
                      goto LABEL_147;
                  }
                  if ((v73 & 3) != 0)
                    dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v73, 4uLL);
                  v47 = &v73[(_QWORD)v70];
                  this[1] = v47;
                  v50 = __src;
LABEL_48:
                  bzero(v47, v49 + v51);
                  v55 = *this;
                  v56 = this[1];
                  this[1] = &v56[v52];
                  if (v50[v26])
                  {
                    v57 = 0;
                    v113 = &v56[v49 - (_QWORD)v55];
                    do
                    {
                      v58 = strlen(*((const char **)v39 + v57)) + 1;
                      v59 = *this;
                      v60 = this[1];
                      v61 = (char *)(v60 - *this);
                      v62 = *((unsigned int *)this + 4);
                      if (v58 > v62 - (uint64_t)v61)
                      {
                        v64 = (v58 - (v62 - (_DWORD)v61) + 255) & 0xFFFFFF00;
                        v65 = (v64 + v62);
                        *((_DWORD *)this + 4) = v65;
                        if (v59)
                        {
                          v66 = (char *)reallocf(v59, v65);
                          *this = v66;
                          if (!v66)
LABEL_140:
                            dy_abort("failed to allocate fbuf buffer");
                        }
                        else
                        {
                          v66 = (char *)malloc_type_malloc((v64 + v62), 0xC56234FuLL);
                          *this = v66;
                          if (!v66)
                            goto LABEL_140;
                        }
                        if ((v66 & 3) != 0)
                          dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v66, 4uLL);
                        v60 = &v66[(_QWORD)v61];
                        this[1] = &v66[(_QWORD)v61];
                      }
                      bzero(v60, v58);
                      memcpy(this[1], *((const void **)v39 + v57), v58);
                      v63 = *this;
                      this[1] += v58;
                      *(_DWORD *)&v63[4 * v57 + (_QWORD)v113] = v51;
                      v51 += v58;
                      ++v57;
                    }
                    while (v57 < __src[v26]);
                  }
LABEL_45:
                  ++v26;
                  if (!--v27)
                    goto LABEL_23;
                  break;
              }
            }
          }
          switch(v25)
          {
            case 'A':
            case 'B':
            case 'E':
            case 'F':
            case 'H':
            case 'I':
            case 'K':
            case 'L':
            case 'O':
            case 'Q':
            case 'R':
            case 'T':
            case 'X':
            case 'e':
            case 'i':
            case 'x':
              LODWORD(v116) = (*(uint64_t (**)(const char *))(*(_QWORD *)a5 + 32))(a5);
              goto LABEL_87;
            case 'C':
            case 'D':
            case 'M':
            case 'P':
            case 'Y':
            case 'l':
            case 'p':
            case 't':
              v90 = (*(uint64_t (**)(const char *))(*(_QWORD *)a5 + 72))(a5);
              goto LABEL_92;
            case 'N':
            case 'w':
              v90 = (*(uint64_t (**)(const char *))(*(_QWORD *)a5 + 40))(a5);
LABEL_92:
              v116 = *(double *)&v90;
              goto LABEL_93;
            case 'S':
            case 'U':
            case 'V':
              v91 = (const char *)(*(uint64_t (**)(const char *))(*(_QWORD *)a5 + 80))(a5);
              v116 = *(double *)&v91;
              if (v91)
                v81 = strlen(v91) + 1;
              else
                v81 = 8;
              goto LABEL_102;
            case 'b':
              LOBYTE(v116) = (*(uint64_t (**)(const char *))(*(_QWORD *)a5 + 16))(a5);
              v81 = 1;
LABEL_102:
              v82 = 1;
              break;
            case 'd':
              v116 = (*(double (**)(const char *))(*(_QWORD *)a5 + 64))(a5);
LABEL_93:
              v81 = 8;
              v82 = 4;
              break;
            case 'f':
            case 'n':
              LODWORD(v116) = (*(float (**)(const char *))(*(_QWORD *)a5 + 56))(a5);
LABEL_87:
              v81 = 4;
              v82 = 4;
              break;
            case 's':
              LOWORD(v116) = (*(uint64_t (**)(const char *))(*(_QWORD *)a5 + 24))(a5);
              v81 = 2;
              v82 = 2;
              break;
            default:
              dy_abort("unknown format character: '%c' (in '%s')\n", v36, (const char *)a4);
          }
          v92 = this[1];
          v93 = (int *)&v116;
          if (v36 - 83 <= 3 && v36 != 84)
          {
            if (v116 == 0.0)
              v93 = &GPUTools::FB::g_null_string_token;
            else
              v93 = *(int **)&v116;
          }
          v28 = ((unint64_t)&v92[v82 - 1] & -v82) - (_QWORD)v92;
          v29 = v28 + v81;
          v30 = *this;
          v31 = (char *)(v92 - *this);
          v32 = *((unsigned int *)this + 4);
          if (v28 + v81 <= v32 - (uint64_t)v31)
            goto LABEL_22;
          v97 = (v29 - (v32 - (_DWORD)v31) + 255) & 0xFFFFFF00;
          v98 = (v97 + v32);
          *((_DWORD *)this + 4) = v98;
          if (v30)
          {
            v99 = (char *)reallocf(v30, v98);
            *this = v99;
            if (!v99)
LABEL_119:
              dy_abort("failed to allocate fbuf buffer");
          }
          else
          {
            v99 = (char *)malloc_type_malloc((v97 + v32), 0xC56234FuLL);
            *this = v99;
            if (!v99)
              goto LABEL_119;
          }
          if ((v99 & 3) != 0)
            dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v99, 4uLL);
          v92 = &v99[(_QWORD)v31];
          this[1] = v92;
LABEL_22:
          bzero(v92, v28 + v81);
          memcpy(&this[1][v28], v93, v81);
          this[1] += v29;
LABEL_23:
          v27 = 0;
          a5 = v111;
          a4 = v112;
LABEL_24:
          ++a4;
LABEL_25:
          v25 = *(_BYTE *)a4;
          if (*(_BYTE *)a4)
            continue;
          v24 = (size_t)this[1];
          break;
      }
      break;
    }
  }
  v100 = v24 - (_QWORD)*this;
  *(_DWORD *)*this = v100;
  v101 = (v100 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  v102 = v101 - v100;
  if (v101 != v100)
  {
    GPUTools::FB::Fbuf::grow_advance((GPUTools::FB::Fbuf *)this, v101 - v100);
    *(_DWORD *)*this += v102;
  }
  if (!v120)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(_QWORD *))(*v120 + 48))(v120);
  result = v120;
  if (v120 == v119)
  {
    v104 = 4;
    result = v119;
  }
  else
  {
    if (!v120)
      return result;
    v104 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v104))();
}

void sub_23C6EC124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  dy_defer::~dy_defer((dy_defer *)va);
  _Unwind_Resume(a1);
}

void dy_defer::~dy_defer(dy_defer *this)
{
  uint64_t v2;
  dy_defer *v3;
  uint64_t v4;

  v2 = *((_QWORD *)this + 3);
  if (!v2)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 48))(v2);
  v3 = (dy_defer *)*((_QWORD *)this + 3);
  if (v3 == this)
  {
    v4 = 4;
    v3 = this;
  }
  else
  {
    if (!v3)
      return;
    v4 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
}

void GPUTools::FB::CreateFunction(GPUTools::FB *this@<X0>, char *a2@<X3>, uint64_t a3@<X4>, int a4@<W1>, uint64_t a5@<X2>, GPUTools::FD::Function *a6@<X8>, ...)
{
  GPUTools::FB::ArgumentProvider *v13;
  GPUTools::FB::ArgumentProvider *v14;
  char *v15;
  void (**v16)(GPUTools::FB::FIFOPointerArgumentProvider *__hidden);
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char v20[16];
  va_list v21;
  _BYTE v22[436];
  int v23;
  char *v24;
  char *v25;
  uint64_t v26;
  unsigned int v27;
  va_list va;

  va_start(va, a6);
  v25 = 0;
  v26 = 0;
  v27 = 0;
  GPUTools::FD::Function::Function((GPUTools::FD::Function *)v22);
  va_copy(v21, va);
  GPUTools::FB::VAListArgumentProvider::VAListArgumentProvider(v20, va);
  GPUTools::FB::Encode(&v25, this, a4, a3, v20, v13);
  if (a5)
  {
    v16 = &off_250D63540;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    GPUTools::FB::FIFOPointerArgumentProvider::push((GPUTools::FB::FIFOPointerArgumentProvider *)&v16, a2);
    GPUTools::FB::Encode(&v25, (GPUTools::FB::Fbuf *)0xFFFFD000, 0, a5, (const char *)&v16, v14);
    GPUTools::FB::FIFOPointerArgumentProvider::~FIFOPointerArgumentProvider((GPUTools::FB::FIFOPointerArgumentProvider *)&v16);
  }
  GPUTools::FB::Decoder::Decoder(&v16, 4, 0);
  GPUTools::FB::Decoder::Decode((GPUTools::FB::Decoder *)&v16, v25, v27, (GPUTools::FD::Function *)v22);
  if (v24)
  {
    GPUTools::FD::Function::Function(a6, (const GPUTools::FD::Function *)v22);
  }
  else
  {
    v15 = v25;
    v23 = v26 - (_DWORD)v25;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v24 = v15;
    GPUTools::FD::Function::Function(a6, v22);
  }
  GPUTools::FD::IFunctionDecoder::~IFunctionDecoder((GPUTools::FD::IFunctionDecoder *)&v16);
  GPUTools::FB::VAListArgumentProvider::~VAListArgumentProvider((GPUTools::FB::VAListArgumentProvider *)v20);
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)v22);
  if (v25)
    free(v25);
}

void sub_23C6EC358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  void *v10;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  GPUTools::FB::VAListArgumentProvider::~VAListArgumentProvider((GPUTools::FB::VAListArgumentProvider *)va);
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)va1);
  v10 = *(void **)(v8 - 88);
  if (v10)
    free(v10);
  _Unwind_Resume(a1);
}

void GPUTools::FB::Fbuf::grow_advance(GPUTools::FB::Fbuf *this, size_t a2)
{
  _BYTE *v4;
  char *v5;
  int64_t v6;
  uint64_t v7;
  size_t v8;
  int v9;
  size_t v10;
  char *v11;

  v4 = *(_BYTE **)this;
  v5 = (char *)*((_QWORD *)this + 1);
  v6 = v5 - v4;
  v7 = *((unsigned int *)this + 4);
  v8 = v7 - (v5 - v4);
  if (a2 <= v8)
    goto LABEL_2;
  v9 = (a2 - v8 + 255) & 0xFFFFFF00;
  v10 = (v9 + v7);
  *((_DWORD *)this + 4) = v10;
  if (v4)
  {
    v11 = (char *)reallocf(v4, v10);
    *(_QWORD *)this = v11;
    if (v11)
      goto LABEL_5;
LABEL_8:
    dy_abort("failed to allocate fbuf buffer");
  }
  v11 = (char *)malloc_type_malloc((v9 + v7), 0xC56234FuLL);
  *(_QWORD *)this = v11;
  if (!v11)
    goto LABEL_8;
LABEL_5:
  if ((v11 & 3) != 0)
    dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v11, 4uLL);
  v5 = &v11[v6];
  *((_QWORD *)this + 1) = &v11[v6];
LABEL_2:
  bzero(v5, a2);
  *((_QWORD *)this + 1) += a2;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x242622C98);
}

void std::__function::__func<GPUTools::FB::Encode(GPUTools::FB::Fbuf &,unsigned int,int,char const*,GPUTools::FB::ArgumentProvider &)::$_0,std::allocator<GPUTools::FB::Encode(GPUTools::FB::Fbuf &,unsigned int,int,char const*,GPUTools::FB::ArgumentProvider &)::$_0>,void ()(void)>::~__func()
{
  JUMPOUT(0x242622C98);
}

_QWORD *std::__function::__func<GPUTools::FB::Encode(GPUTools::FB::Fbuf &,unsigned int,int,char const*,GPUTools::FB::ArgumentProvider &)::$_0,std::allocator<GPUTools::FB::Encode(GPUTools::FB::Fbuf &,unsigned int,int,char const*,GPUTools::FB::ArgumentProvider &)::$_0>,void ()(void)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_250D63150;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GPUTools::FB::Encode(GPUTools::FB::Fbuf &,unsigned int,int,char const*,GPUTools::FB::ArgumentProvider &)::$_0,std::allocator<GPUTools::FB::Encode(GPUTools::FB::Fbuf &,unsigned int,int,char const*,GPUTools::FB::ArgumentProvider &)::$_0>,void ()(void)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_250D63150;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<GPUTools::FB::Encode(GPUTools::FB::Fbuf &,unsigned int,int,char const*,GPUTools::FB::ArgumentProvider &)::$_0,std::allocator<GPUTools::FB::Encode(GPUTools::FB::Fbuf &,unsigned int,int,char const*,GPUTools::FB::ArgumentProvider &)::$_0>,void ()(void)>::operator()(uint64_t result)
{
  uint64_t v1;

  if ((**(_DWORD **)(result + 8) & 0x3000) != 0x1000)
  {
    v1 = result;
    result = pthread_mutex_unlock(&sFunctionChainLock);
    if ((*(_BYTE *)(*(_QWORD *)(v1 + 8) + 1) & 0x20) != 0)
      return pthread_mutex_unlock(&sFunctionChainLock);
  }
  return result;
}

_QWORD *std::__function::__value_func<void ()(void)>::swap[abi:ne180100](_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  if (a2 != result)
  {
    v3 = result;
    v4 = (_QWORD *)result[3];
    v5 = (_QWORD *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, v6);
        (*(void (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(_QWORD *, _QWORD *))(v6[0] + 24))(v6, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(_QWORD *, _QWORD *))(*a2 + 24))(a2, result);
      result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_23C6EC734(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

uint64_t GPUTools::FD::Argument::GetCoreTypeSize(int a1)
{
  if ((a1 - 1) >= 0xD)
    dy_abort("unknown or invalid parameter core type: 0x%x", a1);
  return qword_23C70CB90[a1 - 1];
}

char *GPUTools::FD::Argument::GetCoreTypeCString(unsigned int a1)
{
  if (a1 >= 0x30)
    dy_abort("%s: unknown or invalid parameter core type: 0x%x", "static const char *GPUTools::FD::Argument::GetCoreTypeCString(Type)", a1);
  return off_250D631E8[a1];
}

size_t GPUTools::FD::Argument::GLObjectNameFromVariable(GPUTools::FD::Argument *this, const char *a2)
{
  size_t result;
  char *v4;
  char *v5;
  int v6;
  int v7;

  if (!this)
    __assert_rtn("static uint32_t GPUTools::FD::Argument::GLObjectNameFromVariable(const char *)", "", 0, "variable");
  result = strlen((const char *)this);
  if (result)
  {
    v4 = (char *)this + result - 1;
    do
    {
      v5 = v4;
      if (v4 < (char *)this)
        break;
      v6 = *v4;
      if (v6 < 0)
        break;
      v7 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v6 + 60);
      v4 = v5 - 1;
    }
    while ((v7 & 0x400) != 0);
    return strtol(v5 + 1, 0, 10);
  }
  return result;
}

uint64_t GPUTools::FD::Argument::UniformLocationFromVariable(GPUTools::FD::Argument *this, const char *a2)
{
  size_t v3;
  char *v4;
  char *v5;
  int v6;
  int v7;

  if (!this)
    __assert_rtn("static int32_t GPUTools::FD::Argument::UniformLocationFromVariable(const char *)", "", 0, "variable");
  v3 = strlen((const char *)this);
  if (!v3)
    return 0xFFFFFFFFLL;
  v4 = (char *)this + v3 - 1;
  do
  {
    v5 = v4;
    if (v4 < (char *)this)
      break;
    v6 = *v4;
    if (v6 < 0)
      break;
    v7 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v6 + 60);
    v4 = v5 - 1;
  }
  while ((v7 & 0x400) != 0);
  return strtol(v5 + 1, 0, 10);
}

uint64_t GPUTools::FD::Argument::ProgramAndUniformBlockIndexFromVariable(GPUTools::FD::Argument *this, char *a2, unsigned int *a3, unsigned int *a4)
{
  uint64_t result;
  char *v8;
  uint64_t v9;
  char *v10;
  int v11;
  int v12;
  char *v13;
  char *v14;
  int v15;
  int v16;

  *(_DWORD *)a2 = 0;
  *a3 = -1;
  result = strlen((const char *)this);
  if (result)
  {
    v8 = (char *)this + result - 1;
    v9 = MEMORY[0x24BDAC740];
    do
    {
      v10 = v8;
      if (v8 < (char *)this)
        break;
      v11 = *v8;
      if (v11 < 0)
        break;
      v12 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v11 + 60);
      v8 = v10 - 1;
    }
    while ((v12 & 0x400) != 0);
    *a3 = strtol(v10 + 1, 0, 10);
    v13 = v10 - 1;
    do
    {
      v14 = v13;
      if (v13 < (char *)this)
        break;
      v15 = *v13;
      if (v15 < 0)
        break;
      v16 = *(_DWORD *)(v9 + 4 * v15 + 60);
      v13 = v14 - 1;
    }
    while ((v16 & 0x400) != 0);
    result = strtol(v14 + 1, 0, 10);
    *(_DWORD *)a2 = result;
  }
  return result;
}

uint64_t GPUTools::FD::Argument::ProgramAndUniformLocationFromVariable(GPUTools::FD::Argument *this, char *a2, unsigned int *a3, int *a4)
{
  uint64_t result;
  char *v8;
  uint64_t v9;
  char *v10;
  int v11;
  int v12;
  char *v13;
  char *v14;
  int v15;
  int v16;

  *(_DWORD *)a2 = 0;
  *a3 = -1;
  result = strlen((const char *)this);
  if (result)
  {
    v8 = (char *)this + result - 1;
    v9 = MEMORY[0x24BDAC740];
    do
    {
      v10 = v8;
      if (v8 < (char *)this)
        break;
      v11 = *v8;
      if (v11 < 0)
        break;
      v12 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v11 + 60);
      v8 = v10 - 1;
    }
    while ((v12 & 0x400) != 0);
    *a3 = strtol(v10 + 1, 0, 10);
    v13 = v10 - 1;
    do
    {
      v14 = v13;
      if (v13 < (char *)this)
        break;
      v15 = *v13;
      if (v15 < 0)
        break;
      v16 = *(_DWORD *)(v9 + 4 * v15 + 60);
      v13 = v14 - 1;
    }
    while ((v16 & 0x400) != 0);
    result = strtol(v14 + 1, 0, 10);
    *(_DWORD *)a2 = result;
  }
  return result;
}

size_t GPUTools::FD::Argument::ViewAsGLObjectName(const char **this)
{
  int v1;
  size_t result;
  const char *v3;
  const char *v4;
  const char *v5;
  int v6;
  int v7;

  if ((*((_WORD *)this + 11) & 0x10) != 0)
  {
    v3 = *this;
    if (!*this)
      __assert_rtn("static uint32_t GPUTools::FD::Argument::GLObjectNameFromVariable(const char *)", "", 0, "variable");
    result = strlen(*this);
    if (result)
    {
      v4 = &v3[result - 1];
      do
      {
        v5 = v4;
        if (v4 < v3)
          break;
        v6 = *v4;
        if (v6 < 0)
          break;
        v7 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v6 + 60);
        v4 = v5 - 1;
      }
      while ((v7 & 0x400) != 0);
      return strtol(v5 + 1, 0, 10);
    }
  }
  else
  {
    v1 = *((_DWORD *)this + 2);
    if (v1 != 6 && v1 != 12)
      dy_abort("cannot view argument as OpenGL object name: core_type=%u, sem_type=%u", *((_DWORD *)this + 2), *((_DWORD *)this + 3));
    return *(unsigned int *)*this;
  }
  return result;
}

uint64_t GPUTools::FD::Argument::ViewAsUniformLocation(const char **this)
{
  const char *v2;
  size_t v3;
  const char *v4;
  const char *v5;
  int v6;
  int v7;

  if ((*((_WORD *)this + 11) & 0x10) != 0)
  {
    v2 = *this;
    if (!*this)
      __assert_rtn("static int32_t GPUTools::FD::Argument::UniformLocationFromVariable(const char *)", "", 0, "variable");
    v3 = strlen(*this);
    if (v3)
    {
      v4 = &v2[v3 - 1];
      do
      {
        v5 = v4;
        if (v4 < v2)
          break;
        v6 = *v4;
        if (v6 < 0)
          break;
        v7 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v6 + 60);
        v4 = v5 - 1;
      }
      while ((v7 & 0x400) != 0);
      return strtol(v5 + 1, 0, 10);
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    if (*((_DWORD *)this + 2) != 5)
      dy_abort("cannot view argument as uniform location: core_type=%u, sem_type=%u", *((_DWORD *)this + 2), *((_DWORD *)this + 3));
    return *(unsigned int *)*this;
  }
}

__n128 GPUTools::FD::CoreFunction::DoCommonCopyMove(GPUTools::FD::CoreFunction *this, CoreFunction *a2, const CoreFunction *a3)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __n128 result;

  *(_QWORD *)this = *(_QWORD *)&a2->var0;
  *((_WORD *)this + 5) = a2->var3;
  *((_QWORD *)this + 2) = a2->var4.var0;
  v3 = *(_OWORD *)&a2->var5.var0;
  *((_QWORD *)this + 5) = *(_QWORD *)&a2->var5.var3;
  *(_OWORD *)((char *)this + 24) = v3;
  v4 = *(_OWORD *)&a2->var6[0].var0;
  *((_QWORD *)this + 8) = *(_QWORD *)&a2->var6[0].var3;
  *((_OWORD *)this + 3) = v4;
  v5 = *(_OWORD *)&a2->var6[1].var0;
  *((_QWORD *)this + 11) = *(_QWORD *)&a2->var6[1].var3;
  *(_OWORD *)((char *)this + 72) = v5;
  v6 = *(_OWORD *)&a2->var6[2].var0;
  *((_QWORD *)this + 14) = *(_QWORD *)&a2->var6[2].var3;
  *((_OWORD *)this + 6) = v6;
  v7 = *(_OWORD *)&a2->var6[3].var0;
  *((_QWORD *)this + 17) = *(_QWORD *)&a2->var6[3].var3;
  *(_OWORD *)((char *)this + 120) = v7;
  v8 = *(_OWORD *)&a2->var6[4].var0;
  *((_QWORD *)this + 20) = *(_QWORD *)&a2->var6[4].var3;
  *((_OWORD *)this + 9) = v8;
  v9 = *(_OWORD *)&a2->var6[5].var0;
  *((_QWORD *)this + 23) = *(_QWORD *)&a2->var6[5].var3;
  *(_OWORD *)((char *)this + 168) = v9;
  v10 = *(_OWORD *)&a2->var6[6].var0;
  *((_QWORD *)this + 26) = *(_QWORD *)&a2->var6[6].var3;
  *((_OWORD *)this + 12) = v10;
  v11 = *(_OWORD *)&a2->var6[7].var0;
  *((_QWORD *)this + 29) = *(_QWORD *)&a2->var6[7].var3;
  *(_OWORD *)((char *)this + 216) = v11;
  v12 = *(_OWORD *)&a2->var6[8].var0;
  *((_QWORD *)this + 32) = *(_QWORD *)&a2->var6[8].var3;
  *((_OWORD *)this + 15) = v12;
  v13 = *(_OWORD *)&a2->var6[9].var0;
  *((_QWORD *)this + 35) = *(_QWORD *)&a2->var6[9].var3;
  *(_OWORD *)((char *)this + 264) = v13;
  v14 = *(_OWORD *)&a2->var6[10].var0;
  *((_QWORD *)this + 38) = *(_QWORD *)&a2->var6[10].var3;
  *((_OWORD *)this + 18) = v14;
  v15 = *(_OWORD *)&a2->var6[11].var0;
  *((_QWORD *)this + 41) = *(_QWORD *)&a2->var6[11].var3;
  *(_OWORD *)((char *)this + 312) = v15;
  v16 = *(_OWORD *)&a2->var6[12].var0;
  *((_QWORD *)this + 44) = *(_QWORD *)&a2->var6[12].var3;
  *((_OWORD *)this + 21) = v16;
  v17 = *(_OWORD *)&a2->var6[13].var0;
  *((_QWORD *)this + 47) = *(_QWORD *)&a2->var6[13].var3;
  *(_OWORD *)((char *)this + 360) = v17;
  v18 = *(_OWORD *)&a2->var6[14].var0;
  *((_QWORD *)this + 50) = *(_QWORD *)&a2->var6[14].var3;
  *((_OWORD *)this + 24) = v18;
  result = *(__n128 *)&a2->var6[15].var0;
  *((_QWORD *)this + 53) = *(_QWORD *)&a2->var6[15].var3;
  *(__n128 *)((char *)this + 408) = result;
  *((_DWORD *)this + 108) = a2->var7;
  return result;
}

void *GPUTools::FD::CoreFunction::Relocate(GPUTools::FD::CoreFunction *this, GPUTools::FD::CoreFunction *a2, const GPUTools::FD::CoreFunction *a3)
{
  uint64_t v5;
  size_t v6;
  size_t v7;
  size_t v8;
  _QWORD **v9;
  _QWORD **v10;
  size_t v11;
  unint64_t *v12;
  _BYTE *v13;
  _QWORD *v14;
  uint64_t i;
  unint64_t *v16;
  _BYTE **v17;
  size_t v18;
  BOOL v20;
  unsigned int v21;
  size_t v22;
  void *v23;
  void *result;
  const void *v25;
  uint64_t v26;
  void *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  size_t v31;
  size_t v32;
  size_t v33;
  size_t v34;
  _BYTE v35[136];
  _BYTE v36[136];
  _BYTE *v37;
  _BYTE *v38;

  v5 = *((unsigned int *)a2 + 108);
  v6 = *((_QWORD *)a2 + 56);
  v31 = *((_QWORD *)a2 + 55);
  v32 = v5 + v31;
  v7 = *((unsigned int *)a2 + 109);
  v8 = v7 + v6;
  v33 = v6;
  v34 = v7 + v6;
  v9 = (_QWORD **)v35;
  v10 = (_QWORD **)v36;
  v37 = v35;
  v38 = v36;
  v11 = *((_QWORD *)a2 + 3);
  if (!v11)
    goto LABEL_8;
  if (v31 > v11 || v11 >= v5 + v31)
  {
    if (v6 > v11)
      goto LABEL_8;
    v13 = v36;
    v14 = &v38;
    v12 = &v33;
    if (v11 >= v8)
      goto LABEL_8;
  }
  else
  {
    v12 = &v31;
    v13 = v35;
    v14 = &v37;
  }
  *(_QWORD *)v13 = (char *)this + 24;
  *v14 += 8;
  *((_QWORD *)this + 3) = v11 - *v12;
LABEL_8:
  for (i = 48; i != 432; i += 24)
  {
    v18 = *(_QWORD *)((char *)a2 + i);
    if (v18)
    {
      if (v31 <= v18 && v32 > v18)
      {
        v16 = &v31;
        v17 = &v37;
LABEL_10:
        *(_QWORD *)*v17 = (char *)this + i;
        *v17 += 8;
        *(_QWORD *)((char *)this + i) = v18 - *v16;
        continue;
      }
      v20 = v33 <= v18 && v34 > v18;
      v17 = &v38;
      v16 = &v33;
      if (v20)
        goto LABEL_10;
    }
  }
  if (*((_QWORD *)a2 + 55) == *((_QWORD *)a2 + 56))
  {
    *((_DWORD *)this + 109) = v7;
    v27 = malloc_type_malloc(v7, 0xFD037C57uLL);
    *((_QWORD *)this + 56) = v27;
    result = memcpy(v27, *((const void **)a2 + 56), *((unsigned int *)a2 + 109));
    v21 = 0;
  }
  else
  {
    v21 = (v5 + 15) & 0xFFFFFFF0;
    v22 = v7 + v21;
    *((_DWORD *)this + 109) = v22;
    v23 = malloc_type_malloc(v22, 0xFF435406uLL);
    *((_QWORD *)this + 56) = v23;
    result = memcpy(v23, *((const void **)a2 + 55), *((unsigned int *)a2 + 108));
    v25 = (const void *)*((_QWORD *)a2 + 56);
    if (v25)
    {
      result = memcpy((void *)(*((_QWORD *)this + 56) + v21), v25, *((unsigned int *)a2 + 109));
      v26 = *((_QWORD *)this + 56);
      *((_QWORD *)this + 55) = v26;
      if (v35 == v37)
        goto LABEL_29;
      goto LABEL_28;
    }
  }
  v26 = *((_QWORD *)this + 56);
  *((_QWORD *)this + 55) = v26;
  if (v35 == v37)
    goto LABEL_29;
  do
  {
LABEL_28:
    v28 = *v9++;
    *v28 += v26;
  }
  while (v9 != (_QWORD **)v37);
LABEL_29:
  if (v36 != v38)
  {
    v29 = v26 + v21;
    do
    {
      v30 = *v10++;
      *v30 += v29;
    }
    while (v10 != (_QWORD **)v38);
  }
  return result;
}

double GPUTools::FD::CoreFunction::CoreFunction(GPUTools::FD::CoreFunction *this)
{
  double result;

  *(_QWORD *)this = 0xFFFFFFFFLL;
  *((_WORD *)this + 5) = 0;
  result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *((_OWORD *)this + 15) = 0u;
  *((_OWORD *)this + 16) = 0u;
  *((_OWORD *)this + 17) = 0u;
  *((_OWORD *)this + 18) = 0u;
  *((_OWORD *)this + 19) = 0u;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *((_OWORD *)this + 22) = 0u;
  *((_OWORD *)this + 23) = 0u;
  *((_OWORD *)this + 24) = 0u;
  *((_OWORD *)this + 25) = 0u;
  *((_OWORD *)this + 26) = 0u;
  *((_OWORD *)this + 27) = 0u;
  *((_QWORD *)this + 56) = 0;
  return result;
}

{
  double result;

  *(_QWORD *)this = 0xFFFFFFFFLL;
  *((_WORD *)this + 5) = 0;
  result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *((_OWORD *)this + 15) = 0u;
  *((_OWORD *)this + 16) = 0u;
  *((_OWORD *)this + 17) = 0u;
  *((_OWORD *)this + 18) = 0u;
  *((_OWORD *)this + 19) = 0u;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *((_OWORD *)this + 22) = 0u;
  *((_OWORD *)this + 23) = 0u;
  *((_OWORD *)this + 24) = 0u;
  *((_OWORD *)this + 25) = 0u;
  *((_OWORD *)this + 26) = 0u;
  *((_OWORD *)this + 27) = 0u;
  *((_QWORD *)this + 56) = 0;
  return result;
}

GPUTools::FD::CoreFunction *GPUTools::FD::CoreFunction::CoreFunction(GPUTools::FD::CoreFunction *this, const GPUTools::FD::CoreFunction *a2, const GPUTools::FD::CoreFunction *a3)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  *((_DWORD *)this + 109) = 0;
  *((_QWORD *)this + 56) = 0;
  if (this != a2)
  {
    *(_QWORD *)this = *(_QWORD *)a2;
    *((_WORD *)this + 5) = *((_WORD *)a2 + 5);
    *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
    v4 = *(_OWORD *)((char *)a2 + 24);
    *((_QWORD *)this + 5) = *((_QWORD *)a2 + 5);
    *(_OWORD *)((char *)this + 24) = v4;
    v5 = *((_OWORD *)a2 + 3);
    *((_QWORD *)this + 8) = *((_QWORD *)a2 + 8);
    *((_OWORD *)this + 3) = v5;
    v6 = *(_OWORD *)((char *)a2 + 72);
    *((_QWORD *)this + 11) = *((_QWORD *)a2 + 11);
    *(_OWORD *)((char *)this + 72) = v6;
    v7 = *((_OWORD *)a2 + 6);
    *((_QWORD *)this + 14) = *((_QWORD *)a2 + 14);
    *((_OWORD *)this + 6) = v7;
    v8 = *(_OWORD *)((char *)a2 + 120);
    *((_QWORD *)this + 17) = *((_QWORD *)a2 + 17);
    *(_OWORD *)((char *)this + 120) = v8;
    v9 = *((_OWORD *)a2 + 9);
    *((_QWORD *)this + 20) = *((_QWORD *)a2 + 20);
    *((_OWORD *)this + 9) = v9;
    v10 = *(_OWORD *)((char *)a2 + 168);
    *((_QWORD *)this + 23) = *((_QWORD *)a2 + 23);
    *(_OWORD *)((char *)this + 168) = v10;
    v11 = *((_OWORD *)a2 + 12);
    *((_QWORD *)this + 26) = *((_QWORD *)a2 + 26);
    *((_OWORD *)this + 12) = v11;
    v12 = *(_OWORD *)((char *)a2 + 216);
    *((_QWORD *)this + 29) = *((_QWORD *)a2 + 29);
    *(_OWORD *)((char *)this + 216) = v12;
    v13 = *((_OWORD *)a2 + 15);
    *((_QWORD *)this + 32) = *((_QWORD *)a2 + 32);
    *((_OWORD *)this + 15) = v13;
    v14 = *(_OWORD *)((char *)a2 + 264);
    *((_QWORD *)this + 35) = *((_QWORD *)a2 + 35);
    *(_OWORD *)((char *)this + 264) = v14;
    v15 = *((_OWORD *)a2 + 18);
    *((_QWORD *)this + 38) = *((_QWORD *)a2 + 38);
    *((_OWORD *)this + 18) = v15;
    v16 = *(_OWORD *)((char *)a2 + 312);
    *((_QWORD *)this + 41) = *((_QWORD *)a2 + 41);
    *(_OWORD *)((char *)this + 312) = v16;
    v17 = *((_OWORD *)a2 + 21);
    *((_QWORD *)this + 44) = *((_QWORD *)a2 + 44);
    *((_OWORD *)this + 21) = v17;
    v18 = *(_OWORD *)((char *)a2 + 360);
    *((_QWORD *)this + 47) = *((_QWORD *)a2 + 47);
    *(_OWORD *)((char *)this + 360) = v18;
    v19 = *((_OWORD *)a2 + 24);
    *((_QWORD *)this + 50) = *((_QWORD *)a2 + 50);
    *((_OWORD *)this + 24) = v19;
    v20 = *(_OWORD *)((char *)a2 + 408);
    *((_QWORD *)this + 53) = *((_QWORD *)a2 + 53);
    *(_OWORD *)((char *)this + 408) = v20;
    *((_DWORD *)this + 108) = *((_DWORD *)a2 + 108);
    GPUTools::FD::CoreFunction::Relocate(this, a2, a3);
  }
  return this;
}

{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  *((_DWORD *)this + 109) = 0;
  *((_QWORD *)this + 56) = 0;
  if (this != a2)
  {
    *(_QWORD *)this = *(_QWORD *)a2;
    *((_WORD *)this + 5) = *((_WORD *)a2 + 5);
    *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
    v4 = *(_OWORD *)((char *)a2 + 24);
    *((_QWORD *)this + 5) = *((_QWORD *)a2 + 5);
    *(_OWORD *)((char *)this + 24) = v4;
    v5 = *((_OWORD *)a2 + 3);
    *((_QWORD *)this + 8) = *((_QWORD *)a2 + 8);
    *((_OWORD *)this + 3) = v5;
    v6 = *(_OWORD *)((char *)a2 + 72);
    *((_QWORD *)this + 11) = *((_QWORD *)a2 + 11);
    *(_OWORD *)((char *)this + 72) = v6;
    v7 = *((_OWORD *)a2 + 6);
    *((_QWORD *)this + 14) = *((_QWORD *)a2 + 14);
    *((_OWORD *)this + 6) = v7;
    v8 = *(_OWORD *)((char *)a2 + 120);
    *((_QWORD *)this + 17) = *((_QWORD *)a2 + 17);
    *(_OWORD *)((char *)this + 120) = v8;
    v9 = *((_OWORD *)a2 + 9);
    *((_QWORD *)this + 20) = *((_QWORD *)a2 + 20);
    *((_OWORD *)this + 9) = v9;
    v10 = *(_OWORD *)((char *)a2 + 168);
    *((_QWORD *)this + 23) = *((_QWORD *)a2 + 23);
    *(_OWORD *)((char *)this + 168) = v10;
    v11 = *((_OWORD *)a2 + 12);
    *((_QWORD *)this + 26) = *((_QWORD *)a2 + 26);
    *((_OWORD *)this + 12) = v11;
    v12 = *(_OWORD *)((char *)a2 + 216);
    *((_QWORD *)this + 29) = *((_QWORD *)a2 + 29);
    *(_OWORD *)((char *)this + 216) = v12;
    v13 = *((_OWORD *)a2 + 15);
    *((_QWORD *)this + 32) = *((_QWORD *)a2 + 32);
    *((_OWORD *)this + 15) = v13;
    v14 = *(_OWORD *)((char *)a2 + 264);
    *((_QWORD *)this + 35) = *((_QWORD *)a2 + 35);
    *(_OWORD *)((char *)this + 264) = v14;
    v15 = *((_OWORD *)a2 + 18);
    *((_QWORD *)this + 38) = *((_QWORD *)a2 + 38);
    *((_OWORD *)this + 18) = v15;
    v16 = *(_OWORD *)((char *)a2 + 312);
    *((_QWORD *)this + 41) = *((_QWORD *)a2 + 41);
    *(_OWORD *)((char *)this + 312) = v16;
    v17 = *((_OWORD *)a2 + 21);
    *((_QWORD *)this + 44) = *((_QWORD *)a2 + 44);
    *((_OWORD *)this + 21) = v17;
    v18 = *(_OWORD *)((char *)a2 + 360);
    *((_QWORD *)this + 47) = *((_QWORD *)a2 + 47);
    *(_OWORD *)((char *)this + 360) = v18;
    v19 = *((_OWORD *)a2 + 24);
    *((_QWORD *)this + 50) = *((_QWORD *)a2 + 50);
    *((_OWORD *)this + 24) = v19;
    v20 = *(_OWORD *)((char *)a2 + 408);
    *((_QWORD *)this + 53) = *((_QWORD *)a2 + 53);
    *(_OWORD *)((char *)this + 408) = v20;
    *((_DWORD *)this + 108) = *((_DWORD *)a2 + 108);
    GPUTools::FD::CoreFunction::Relocate(this, a2, a3);
  }
  return this;
}

GPUTools::FD::CoreFunction *GPUTools::FD::CoreFunction::operator=(GPUTools::FD::CoreFunction *this, GPUTools::FD::CoreFunction *a2, const GPUTools::FD::CoreFunction *a3)
{
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
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

  if (this != a2)
  {
    v5 = (void *)*((_QWORD *)this + 56);
    if (v5)
      free(v5);
    *(_QWORD *)this = *(_QWORD *)a2;
    *((_WORD *)this + 5) = *((_WORD *)a2 + 5);
    *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
    v6 = *(_OWORD *)((char *)a2 + 24);
    *((_QWORD *)this + 5) = *((_QWORD *)a2 + 5);
    *(_OWORD *)((char *)this + 24) = v6;
    v7 = *((_OWORD *)a2 + 3);
    *((_QWORD *)this + 8) = *((_QWORD *)a2 + 8);
    *((_OWORD *)this + 3) = v7;
    v8 = *(_OWORD *)((char *)a2 + 72);
    *((_QWORD *)this + 11) = *((_QWORD *)a2 + 11);
    *(_OWORD *)((char *)this + 72) = v8;
    v9 = *((_OWORD *)a2 + 6);
    *((_QWORD *)this + 14) = *((_QWORD *)a2 + 14);
    *((_OWORD *)this + 6) = v9;
    v10 = *(_OWORD *)((char *)a2 + 120);
    *((_QWORD *)this + 17) = *((_QWORD *)a2 + 17);
    *(_OWORD *)((char *)this + 120) = v10;
    v11 = *((_OWORD *)a2 + 9);
    *((_QWORD *)this + 20) = *((_QWORD *)a2 + 20);
    *((_OWORD *)this + 9) = v11;
    v12 = *(_OWORD *)((char *)a2 + 168);
    *((_QWORD *)this + 23) = *((_QWORD *)a2 + 23);
    *(_OWORD *)((char *)this + 168) = v12;
    v13 = *((_OWORD *)a2 + 12);
    *((_QWORD *)this + 26) = *((_QWORD *)a2 + 26);
    *((_OWORD *)this + 12) = v13;
    v14 = *(_OWORD *)((char *)a2 + 216);
    *((_QWORD *)this + 29) = *((_QWORD *)a2 + 29);
    *(_OWORD *)((char *)this + 216) = v14;
    v15 = *((_OWORD *)a2 + 15);
    *((_QWORD *)this + 32) = *((_QWORD *)a2 + 32);
    *((_OWORD *)this + 15) = v15;
    v16 = *(_OWORD *)((char *)a2 + 264);
    *((_QWORD *)this + 35) = *((_QWORD *)a2 + 35);
    *(_OWORD *)((char *)this + 264) = v16;
    v17 = *((_OWORD *)a2 + 18);
    *((_QWORD *)this + 38) = *((_QWORD *)a2 + 38);
    *((_OWORD *)this + 18) = v17;
    v18 = *(_OWORD *)((char *)a2 + 312);
    *((_QWORD *)this + 41) = *((_QWORD *)a2 + 41);
    *(_OWORD *)((char *)this + 312) = v18;
    v19 = *((_OWORD *)a2 + 21);
    *((_QWORD *)this + 44) = *((_QWORD *)a2 + 44);
    *((_OWORD *)this + 21) = v19;
    v20 = *(_OWORD *)((char *)a2 + 360);
    *((_QWORD *)this + 47) = *((_QWORD *)a2 + 47);
    *(_OWORD *)((char *)this + 360) = v20;
    v21 = *((_OWORD *)a2 + 24);
    *((_QWORD *)this + 50) = *((_QWORD *)a2 + 50);
    *((_OWORD *)this + 24) = v21;
    v22 = *(_OWORD *)((char *)a2 + 408);
    *((_QWORD *)this + 53) = *((_QWORD *)a2 + 53);
    *(_OWORD *)((char *)this + 408) = v22;
    *((_DWORD *)this + 108) = *((_DWORD *)a2 + 108);
    GPUTools::FD::CoreFunction::Relocate(this, a2, a3);
  }
  return this;
}

__n128 GPUTools::FD::CoreFunction::CoreFunction(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __n128 result;

  *(_DWORD *)(a1 + 436) = 0;
  *(_QWORD *)(a1 + 448) = 0;
  if (a1 != a2)
  {
    *(_OWORD *)(a1 + 440) = *(_OWORD *)(a2 + 440);
    *(_DWORD *)(a1 + 436) = *(_DWORD *)(a2 + 436);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_WORD *)(a1 + 10) = *(_WORD *)(a2 + 10);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    v2 = *(_OWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = v2;
    v3 = *(_OWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = v3;
    v4 = *(_OWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 72) = v4;
    v5 = *(_OWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = v5;
    v6 = *(_OWORD *)(a2 + 120);
    *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
    *(_OWORD *)(a1 + 120) = v6;
    v7 = *(_OWORD *)(a2 + 144);
    *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 144) = v7;
    v8 = *(_OWORD *)(a2 + 168);
    *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
    *(_OWORD *)(a1 + 168) = v8;
    v9 = *(_OWORD *)(a2 + 192);
    *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
    *(_OWORD *)(a1 + 192) = v9;
    v10 = *(_OWORD *)(a2 + 216);
    *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
    *(_OWORD *)(a1 + 216) = v10;
    v11 = *(_OWORD *)(a2 + 240);
    *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
    *(_OWORD *)(a1 + 240) = v11;
    v12 = *(_OWORD *)(a2 + 264);
    *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
    *(_OWORD *)(a1 + 264) = v12;
    v13 = *(_OWORD *)(a2 + 288);
    *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
    *(_OWORD *)(a1 + 288) = v13;
    v14 = *(_OWORD *)(a2 + 312);
    *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
    *(_OWORD *)(a1 + 312) = v14;
    v15 = *(_OWORD *)(a2 + 336);
    *(_QWORD *)(a1 + 352) = *(_QWORD *)(a2 + 352);
    *(_OWORD *)(a1 + 336) = v15;
    v16 = *(_OWORD *)(a2 + 360);
    *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);
    *(_OWORD *)(a1 + 360) = v16;
    v17 = *(_OWORD *)(a2 + 384);
    *(_QWORD *)(a1 + 400) = *(_QWORD *)(a2 + 400);
    *(_OWORD *)(a1 + 384) = v17;
    result = *(__n128 *)(a2 + 408);
    *(_QWORD *)(a1 + 424) = *(_QWORD *)(a2 + 424);
    *(__n128 *)(a1 + 408) = result;
    *(_DWORD *)(a1 + 432) = *(_DWORD *)(a2 + 432);
    *(_DWORD *)a2 = -1;
    *(_QWORD *)(a2 + 440) = 0;
    *(_QWORD *)(a2 + 448) = 0;
    *(_QWORD *)(a2 + 432) = 0;
  }
  return result;
}

{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __n128 result;

  *(_DWORD *)(a1 + 436) = 0;
  *(_QWORD *)(a1 + 448) = 0;
  if (a1 != a2)
  {
    *(_OWORD *)(a1 + 440) = *(_OWORD *)(a2 + 440);
    *(_DWORD *)(a1 + 436) = *(_DWORD *)(a2 + 436);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_WORD *)(a1 + 10) = *(_WORD *)(a2 + 10);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    v2 = *(_OWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = v2;
    v3 = *(_OWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = v3;
    v4 = *(_OWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 72) = v4;
    v5 = *(_OWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = v5;
    v6 = *(_OWORD *)(a2 + 120);
    *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
    *(_OWORD *)(a1 + 120) = v6;
    v7 = *(_OWORD *)(a2 + 144);
    *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 144) = v7;
    v8 = *(_OWORD *)(a2 + 168);
    *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
    *(_OWORD *)(a1 + 168) = v8;
    v9 = *(_OWORD *)(a2 + 192);
    *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
    *(_OWORD *)(a1 + 192) = v9;
    v10 = *(_OWORD *)(a2 + 216);
    *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
    *(_OWORD *)(a1 + 216) = v10;
    v11 = *(_OWORD *)(a2 + 240);
    *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
    *(_OWORD *)(a1 + 240) = v11;
    v12 = *(_OWORD *)(a2 + 264);
    *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
    *(_OWORD *)(a1 + 264) = v12;
    v13 = *(_OWORD *)(a2 + 288);
    *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
    *(_OWORD *)(a1 + 288) = v13;
    v14 = *(_OWORD *)(a2 + 312);
    *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
    *(_OWORD *)(a1 + 312) = v14;
    v15 = *(_OWORD *)(a2 + 336);
    *(_QWORD *)(a1 + 352) = *(_QWORD *)(a2 + 352);
    *(_OWORD *)(a1 + 336) = v15;
    v16 = *(_OWORD *)(a2 + 360);
    *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);
    *(_OWORD *)(a1 + 360) = v16;
    v17 = *(_OWORD *)(a2 + 384);
    *(_QWORD *)(a1 + 400) = *(_QWORD *)(a2 + 400);
    *(_OWORD *)(a1 + 384) = v17;
    result = *(__n128 *)(a2 + 408);
    *(_QWORD *)(a1 + 424) = *(_QWORD *)(a2 + 424);
    *(__n128 *)(a1 + 408) = result;
    *(_DWORD *)(a1 + 432) = *(_DWORD *)(a2 + 432);
    *(_DWORD *)a2 = -1;
    *(_QWORD *)(a2 + 440) = 0;
    *(_QWORD *)(a2 + 448) = 0;
    *(_QWORD *)(a2 + 432) = 0;
  }
  return result;
}

uint64_t GPUTools::FD::CoreFunction::operator=(uint64_t a1, uint64_t a2)
{
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  if (a1 != a2)
  {
    v4 = *(void **)(a1 + 448);
    if (v4)
      free(v4);
    *(_OWORD *)(a1 + 440) = *(_OWORD *)(a2 + 440);
    *(_DWORD *)(a1 + 436) = *(_DWORD *)(a2 + 436);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_WORD *)(a1 + 10) = *(_WORD *)(a2 + 10);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    v5 = *(_OWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = v5;
    v6 = *(_OWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = v6;
    v7 = *(_OWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 72) = v7;
    v8 = *(_OWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = v8;
    v9 = *(_OWORD *)(a2 + 120);
    *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
    *(_OWORD *)(a1 + 120) = v9;
    v10 = *(_OWORD *)(a2 + 144);
    *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 144) = v10;
    v11 = *(_OWORD *)(a2 + 168);
    *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
    *(_OWORD *)(a1 + 168) = v11;
    v12 = *(_OWORD *)(a2 + 192);
    *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
    *(_OWORD *)(a1 + 192) = v12;
    v13 = *(_OWORD *)(a2 + 216);
    *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
    *(_OWORD *)(a1 + 216) = v13;
    v14 = *(_OWORD *)(a2 + 240);
    *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
    *(_OWORD *)(a1 + 240) = v14;
    v15 = *(_OWORD *)(a2 + 264);
    *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
    *(_OWORD *)(a1 + 264) = v15;
    v16 = *(_OWORD *)(a2 + 288);
    *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
    *(_OWORD *)(a1 + 288) = v16;
    v17 = *(_OWORD *)(a2 + 312);
    *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
    *(_OWORD *)(a1 + 312) = v17;
    v18 = *(_OWORD *)(a2 + 336);
    *(_QWORD *)(a1 + 352) = *(_QWORD *)(a2 + 352);
    *(_OWORD *)(a1 + 336) = v18;
    v19 = *(_OWORD *)(a2 + 360);
    *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);
    *(_OWORD *)(a1 + 360) = v19;
    v20 = *(_OWORD *)(a2 + 384);
    *(_QWORD *)(a1 + 400) = *(_QWORD *)(a2 + 400);
    *(_OWORD *)(a1 + 384) = v20;
    v21 = *(_OWORD *)(a2 + 408);
    *(_QWORD *)(a1 + 424) = *(_QWORD *)(a2 + 424);
    *(_OWORD *)(a1 + 408) = v21;
    *(_DWORD *)(a1 + 432) = *(_DWORD *)(a2 + 432);
    *(_DWORD *)a2 = -1;
    *(_QWORD *)(a2 + 440) = 0;
    *(_QWORD *)(a2 + 448) = 0;
    *(_QWORD *)(a2 + 432) = 0;
  }
  return a1;
}

void GPUTools::FD::CoreFunction::~CoreFunction(GPUTools::FD::CoreFunction *this)
{
  void *v1;

  v1 = (void *)*((_QWORD *)this + 56);
  if (v1)
    free(v1);
}

{
  void *v1;

  v1 = (void *)*((_QWORD *)this + 56);
  if (v1)
    free(v1);
}

double GPUTools::FD::Function::DoCommonCopyMove(GPUTools::FD::Function *this, Function *a2, const Function *a3)
{
  uint64_t v3;
  double result;

  *(_OWORD *)((char *)this + 456) = *(_OWORD *)((char *)a2 + 456);
  *(_OWORD *)((char *)this + 472) = *(_OWORD *)((char *)a2 + 472);
  *((_QWORD *)this + 61) = *((_QWORD *)a2 + 61);
  v3 = *((_QWORD *)a2 + 64);
  *((_QWORD *)this + 63) = *((_QWORD *)a2 + 63);
  *((_QWORD *)this + 64) = v3;
  result = *((double *)a2 + 62);
  *((double *)this + 62) = result;
  *((_QWORD *)this + 66) = *((_QWORD *)a2 + 66);
  return result;
}

_QWORD *GPUTools::FD::Function::Relocate(_QWORD *this, GPUTools::FD::Function *a2, const GPUTools::FD::Function *a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  _QWORD **v8;
  _QWORD **v9;
  _BYTE **v10;
  unint64_t v11;
  unint64_t *v12;
  _BYTE *v13;
  _QWORD *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _BYTE v25[16];
  _BYTE v26[16];
  _BYTE *v27;
  _BYTE *v28;

  v3 = *((unsigned int *)a2 + 108);
  v5 = *((_QWORD *)a2 + 55);
  v4 = *((_QWORD *)a2 + 56);
  v22 = v3 + v5;
  v6 = &v23;
  v7 = *((unsigned int *)a2 + 109) + v4;
  v23 = v4;
  v24 = v7;
  v8 = (_QWORD **)v25;
  v9 = (_QWORD **)v26;
  v10 = &v28;
  v27 = v25;
  v28 = v26;
  v11 = *((_QWORD *)a2 + 59);
  if (v11)
  {
    if (v5 <= v11 && v11 < v3 + v5)
    {
      v12 = &v21;
      v13 = v25;
      v14 = &v27;
LABEL_7:
      *(_QWORD *)v13 = this + 59;
      *v14 += 8;
      this[59] = v11 - *v12;
      goto LABEL_8;
    }
    if (v4 <= v11)
    {
      v13 = v26;
      v14 = &v28;
      v12 = &v23;
      if (v11 < v7)
        goto LABEL_7;
    }
  }
LABEL_8:
  v15 = *((_QWORD *)a2 + 61);
  if (!v15)
    goto LABEL_15;
  if (v21 <= v15 && v22 > v15)
  {
    v6 = &v21;
    v10 = &v27;
LABEL_14:
    *(_QWORD *)*v10 = this + 61;
    *v10 += 8;
    this[61] = v15 - *v6;
    goto LABEL_15;
  }
  if (v23 <= v15 && v24 > v15)
    goto LABEL_14;
LABEL_15:
  v16 = ((_DWORD)v3 + 15) & 0xFFFFFFF0;
  if (*((_QWORD *)a2 + 55) == *((_QWORD *)a2 + 56))
    v16 = 0;
  v17 = this[56];
  if (v25 != v27)
  {
    v18 = this[55];
    do
    {
      v19 = *v8++;
      *v19 += v18;
    }
    while (v8 != (_QWORD **)v27);
  }
  if (v26 != v28)
  {
    do
    {
      v20 = *v9++;
      *v20 += v16 + v17;
    }
    while (v9 != (_QWORD **)v28);
  }
  return this;
}

GPUTools::FD::Function *GPUTools::FD::Function::Function(GPUTools::FD::Function *this)
{
  *(_QWORD *)this = 0xFFFFFFFFLL;
  *((_WORD *)this + 5) = 0;
  bzero((char *)this + 16, 0x208uLL);
  return this;
}

{
  *(_QWORD *)this = 0xFFFFFFFFLL;
  *((_WORD *)this + 5) = 0;
  bzero((char *)this + 16, 0x208uLL);
  return this;
}

GPUTools::FD::Function *GPUTools::FD::Function::Function(GPUTools::FD::Function *this, const GPUTools::FD::Function *a2, const GPUTools::FD::CoreFunction *a3)
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  GPUTools::FD::Function *v22;
  uint64_t v23;

  *((_DWORD *)this + 109) = 0;
  *((_QWORD *)this + 56) = 0;
  if (this != a2)
  {
    *(_QWORD *)this = *(_QWORD *)a2;
    *((_WORD *)this + 5) = *((_WORD *)a2 + 5);
    *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
    v5 = *(_OWORD *)((char *)a2 + 24);
    *((_QWORD *)this + 5) = *((_QWORD *)a2 + 5);
    *(_OWORD *)((char *)this + 24) = v5;
    v6 = *((_OWORD *)a2 + 3);
    *((_QWORD *)this + 8) = *((_QWORD *)a2 + 8);
    *((_OWORD *)this + 3) = v6;
    v7 = *(_OWORD *)((char *)a2 + 72);
    *((_QWORD *)this + 11) = *((_QWORD *)a2 + 11);
    *(_OWORD *)((char *)this + 72) = v7;
    v8 = *((_OWORD *)a2 + 6);
    *((_QWORD *)this + 14) = *((_QWORD *)a2 + 14);
    *((_OWORD *)this + 6) = v8;
    v9 = *(_OWORD *)((char *)a2 + 120);
    *((_QWORD *)this + 17) = *((_QWORD *)a2 + 17);
    *(_OWORD *)((char *)this + 120) = v9;
    v10 = *((_OWORD *)a2 + 9);
    *((_QWORD *)this + 20) = *((_QWORD *)a2 + 20);
    *((_OWORD *)this + 9) = v10;
    v11 = *(_OWORD *)((char *)a2 + 168);
    *((_QWORD *)this + 23) = *((_QWORD *)a2 + 23);
    *(_OWORD *)((char *)this + 168) = v11;
    v12 = *((_OWORD *)a2 + 12);
    *((_QWORD *)this + 26) = *((_QWORD *)a2 + 26);
    *((_OWORD *)this + 12) = v12;
    v13 = *(_OWORD *)((char *)a2 + 216);
    *((_QWORD *)this + 29) = *((_QWORD *)a2 + 29);
    *(_OWORD *)((char *)this + 216) = v13;
    v14 = *((_OWORD *)a2 + 15);
    *((_QWORD *)this + 32) = *((_QWORD *)a2 + 32);
    *((_OWORD *)this + 15) = v14;
    v15 = *(_OWORD *)((char *)a2 + 264);
    *((_QWORD *)this + 35) = *((_QWORD *)a2 + 35);
    *(_OWORD *)((char *)this + 264) = v15;
    v16 = *((_OWORD *)a2 + 18);
    *((_QWORD *)this + 38) = *((_QWORD *)a2 + 38);
    *((_OWORD *)this + 18) = v16;
    v17 = *(_OWORD *)((char *)a2 + 312);
    *((_QWORD *)this + 41) = *((_QWORD *)a2 + 41);
    *(_OWORD *)((char *)this + 312) = v17;
    v18 = *((_OWORD *)a2 + 21);
    *((_QWORD *)this + 44) = *((_QWORD *)a2 + 44);
    *((_OWORD *)this + 21) = v18;
    v19 = *(_OWORD *)((char *)a2 + 360);
    *((_QWORD *)this + 47) = *((_QWORD *)a2 + 47);
    *(_OWORD *)((char *)this + 360) = v19;
    v20 = *((_OWORD *)a2 + 24);
    *((_QWORD *)this + 50) = *((_QWORD *)a2 + 50);
    *((_OWORD *)this + 24) = v20;
    v21 = *(_OWORD *)((char *)a2 + 408);
    *((_QWORD *)this + 53) = *((_QWORD *)a2 + 53);
    *(_OWORD *)((char *)this + 408) = v21;
    *((_DWORD *)this + 108) = *((_DWORD *)a2 + 108);
    GPUTools::FD::CoreFunction::Relocate(this, a2, a3);
  }
  if (*((_QWORD *)a2 + 65))
  {
    v22 = (GPUTools::FD::Function *)operator new();
    GPUTools::FD::Function::Function(v22, *((const GPUTools::FD::Function **)a2 + 65));
  }
  else
  {
    v22 = 0;
  }
  *((_QWORD *)this + 65) = v22;
  *(_OWORD *)((char *)this + 456) = *(_OWORD *)((char *)a2 + 456);
  *((_QWORD *)this + 59) = *((_QWORD *)a2 + 59);
  *((_DWORD *)this + 120) = *((_DWORD *)a2 + 120);
  *((_DWORD *)this + 121) = *((_DWORD *)a2 + 121);
  *((_QWORD *)this + 61) = *((_QWORD *)a2 + 61);
  v23 = *((_QWORD *)a2 + 64);
  *((_QWORD *)this + 63) = *((_QWORD *)a2 + 63);
  *((_QWORD *)this + 64) = v23;
  *((_QWORD *)this + 62) = *((_QWORD *)a2 + 62);
  *((_QWORD *)this + 66) = *((_QWORD *)a2 + 66);
  GPUTools::FD::Function::Relocate(this, a2, a3);
  return this;
}

void sub_23C6EDEE4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;

  MEMORY[0x242622C98](v2, 0x10B0C40F47DA5FCLL);
  v4 = *(void **)(v1 + 448);
  if (!v4)
    _Unwind_Resume(a1);
  free(v4);
  _Unwind_Resume(a1);
}

double GPUTools::FD::Function::Function(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  double result;

  *(_DWORD *)(a1 + 436) = 0;
  *(_QWORD *)(a1 + 448) = 0;
  if (a1 != a2)
  {
    *(_OWORD *)(a1 + 440) = *(_OWORD *)(a2 + 440);
    *(_DWORD *)(a1 + 436) = *(_DWORD *)(a2 + 436);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_WORD *)(a1 + 10) = *(_WORD *)(a2 + 10);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    v2 = *(_OWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = v2;
    v3 = *(_OWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = v3;
    v4 = *(_OWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 72) = v4;
    v5 = *(_OWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = v5;
    v6 = *(_OWORD *)(a2 + 120);
    *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
    *(_OWORD *)(a1 + 120) = v6;
    v7 = *(_OWORD *)(a2 + 144);
    *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 144) = v7;
    v8 = *(_OWORD *)(a2 + 168);
    *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
    *(_OWORD *)(a1 + 168) = v8;
    v9 = *(_OWORD *)(a2 + 192);
    *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
    *(_OWORD *)(a1 + 192) = v9;
    v10 = *(_OWORD *)(a2 + 216);
    *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
    *(_OWORD *)(a1 + 216) = v10;
    v11 = *(_OWORD *)(a2 + 240);
    *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
    *(_OWORD *)(a1 + 240) = v11;
    v12 = *(_OWORD *)(a2 + 264);
    *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
    *(_OWORD *)(a1 + 264) = v12;
    v13 = *(_OWORD *)(a2 + 288);
    *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
    *(_OWORD *)(a1 + 288) = v13;
    v14 = *(_OWORD *)(a2 + 312);
    *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
    *(_OWORD *)(a1 + 312) = v14;
    v15 = *(_OWORD *)(a2 + 336);
    *(_QWORD *)(a1 + 352) = *(_QWORD *)(a2 + 352);
    *(_OWORD *)(a1 + 336) = v15;
    v16 = *(_OWORD *)(a2 + 360);
    *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);
    *(_OWORD *)(a1 + 360) = v16;
    v17 = *(_OWORD *)(a2 + 384);
    *(_QWORD *)(a1 + 400) = *(_QWORD *)(a2 + 400);
    *(_OWORD *)(a1 + 384) = v17;
    v18 = *(_OWORD *)(a2 + 408);
    *(_QWORD *)(a1 + 424) = *(_QWORD *)(a2 + 424);
    *(_OWORD *)(a1 + 408) = v18;
    *(_DWORD *)(a1 + 432) = *(_DWORD *)(a2 + 432);
    *(_DWORD *)a2 = -1;
    *(_QWORD *)(a2 + 440) = 0;
    *(_QWORD *)(a2 + 448) = 0;
    *(_QWORD *)(a2 + 432) = 0;
  }
  *(_QWORD *)(a1 + 520) = *(_QWORD *)(a2 + 520);
  *(_OWORD *)(a1 + 456) = *(_OWORD *)(a2 + 456);
  *(_QWORD *)(a1 + 472) = *(_QWORD *)(a2 + 472);
  *(_DWORD *)(a1 + 480) = *(_DWORD *)(a2 + 480);
  *(_DWORD *)(a1 + 484) = *(_DWORD *)(a2 + 484);
  *(_QWORD *)(a1 + 488) = *(_QWORD *)(a2 + 488);
  v19 = *(_QWORD *)(a2 + 512);
  *(_QWORD *)(a1 + 504) = *(_QWORD *)(a2 + 504);
  *(_QWORD *)(a1 + 512) = v19;
  result = *(double *)(a2 + 496);
  *(double *)(a1 + 496) = result;
  *(_QWORD *)(a1 + 528) = *(_QWORD *)(a2 + 528);
  *(_QWORD *)(a2 + 520) = 0;
  return result;
}

GPUTools::FD::CoreFunction *GPUTools::FD::Function::operator=(GPUTools::FD::CoreFunction *this, GPUTools::FD::CoreFunction *a2, const GPUTools::FD::CoreFunction *a3)
{
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
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
  const GPUTools::FD::Function *v23;
  GPUTools::FD::Function *v24;
  GPUTools::FD::Function *v25;
  const GPUTools::FD::CoreFunction *v26;
  uint64_t v27;

  if (this != a2)
  {
    v5 = (void *)*((_QWORD *)this + 56);
    if (v5)
      free(v5);
    *(_QWORD *)this = *(_QWORD *)a2;
    *((_WORD *)this + 5) = *((_WORD *)a2 + 5);
    *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
    v6 = *(_OWORD *)((char *)a2 + 24);
    *((_QWORD *)this + 5) = *((_QWORD *)a2 + 5);
    *(_OWORD *)((char *)this + 24) = v6;
    v7 = *((_OWORD *)a2 + 3);
    *((_QWORD *)this + 8) = *((_QWORD *)a2 + 8);
    *((_OWORD *)this + 3) = v7;
    v8 = *(_OWORD *)((char *)a2 + 72);
    *((_QWORD *)this + 11) = *((_QWORD *)a2 + 11);
    *(_OWORD *)((char *)this + 72) = v8;
    v9 = *((_OWORD *)a2 + 6);
    *((_QWORD *)this + 14) = *((_QWORD *)a2 + 14);
    *((_OWORD *)this + 6) = v9;
    v10 = *(_OWORD *)((char *)a2 + 120);
    *((_QWORD *)this + 17) = *((_QWORD *)a2 + 17);
    *(_OWORD *)((char *)this + 120) = v10;
    v11 = *((_OWORD *)a2 + 9);
    *((_QWORD *)this + 20) = *((_QWORD *)a2 + 20);
    *((_OWORD *)this + 9) = v11;
    v12 = *(_OWORD *)((char *)a2 + 168);
    *((_QWORD *)this + 23) = *((_QWORD *)a2 + 23);
    *(_OWORD *)((char *)this + 168) = v12;
    v13 = *((_OWORD *)a2 + 12);
    *((_QWORD *)this + 26) = *((_QWORD *)a2 + 26);
    *((_OWORD *)this + 12) = v13;
    v14 = *(_OWORD *)((char *)a2 + 216);
    *((_QWORD *)this + 29) = *((_QWORD *)a2 + 29);
    *(_OWORD *)((char *)this + 216) = v14;
    v15 = *((_OWORD *)a2 + 15);
    *((_QWORD *)this + 32) = *((_QWORD *)a2 + 32);
    *((_OWORD *)this + 15) = v15;
    v16 = *(_OWORD *)((char *)a2 + 264);
    *((_QWORD *)this + 35) = *((_QWORD *)a2 + 35);
    *(_OWORD *)((char *)this + 264) = v16;
    v17 = *((_OWORD *)a2 + 18);
    *((_QWORD *)this + 38) = *((_QWORD *)a2 + 38);
    *((_OWORD *)this + 18) = v17;
    v18 = *(_OWORD *)((char *)a2 + 312);
    *((_QWORD *)this + 41) = *((_QWORD *)a2 + 41);
    *(_OWORD *)((char *)this + 312) = v18;
    v19 = *((_OWORD *)a2 + 21);
    *((_QWORD *)this + 44) = *((_QWORD *)a2 + 44);
    *((_OWORD *)this + 21) = v19;
    v20 = *(_OWORD *)((char *)a2 + 360);
    *((_QWORD *)this + 47) = *((_QWORD *)a2 + 47);
    *(_OWORD *)((char *)this + 360) = v20;
    v21 = *((_OWORD *)a2 + 24);
    *((_QWORD *)this + 50) = *((_QWORD *)a2 + 50);
    *((_OWORD *)this + 24) = v21;
    v22 = *(_OWORD *)((char *)a2 + 408);
    *((_QWORD *)this + 53) = *((_QWORD *)a2 + 53);
    *(_OWORD *)((char *)this + 408) = v22;
    *((_DWORD *)this + 108) = *((_DWORD *)a2 + 108);
    GPUTools::FD::CoreFunction::Relocate(this, a2, a3);
    v24 = (GPUTools::FD::Function *)*((_QWORD *)this + 65);
    if (v24)
    {
      GPUTools::FD::Function::~Function(v24);
      MEMORY[0x242622C98]();
    }
    if (*((_QWORD *)a2 + 65))
    {
      v25 = (GPUTools::FD::Function *)operator new();
      GPUTools::FD::Function::Function(v25, *((const GPUTools::FD::Function **)a2 + 65), v26);
    }
    else
    {
      v25 = 0;
    }
    *((_QWORD *)this + 65) = v25;
    *(_OWORD *)((char *)this + 456) = *(_OWORD *)((char *)a2 + 456);
    *((_QWORD *)this + 59) = *((_QWORD *)a2 + 59);
    *((_DWORD *)this + 120) = *((_DWORD *)a2 + 120);
    *((_DWORD *)this + 121) = *((_DWORD *)a2 + 121);
    *((_QWORD *)this + 61) = *((_QWORD *)a2 + 61);
    v27 = *((_QWORD *)a2 + 64);
    *((_QWORD *)this + 63) = *((_QWORD *)a2 + 63);
    *((_QWORD *)this + 64) = v27;
    *((_QWORD *)this + 62) = *((_QWORD *)a2 + 62);
    *((_QWORD *)this + 66) = *((_QWORD *)a2 + 66);
    GPUTools::FD::Function::Relocate(this, a2, v23);
  }
  return this;
}

void sub_23C6EE358(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x242622C98](v1, 0x10B0C40F47DA5FCLL);
  _Unwind_Resume(a1);
}

void GPUTools::FD::Function::~Function(GPUTools::FD::Function *this)
{
  GPUTools::FD::Function *v2;
  void *v3;

  v2 = (GPUTools::FD::Function *)*((_QWORD *)this + 65);
  if (!v2)
  {
    v3 = (void *)*((_QWORD *)this + 56);
    if (!v3)
      return;
LABEL_5:
    free(v3);
    return;
  }
  GPUTools::FD::Function::~Function(v2);
  MEMORY[0x242622C98]();
  v3 = (void *)*((_QWORD *)this + 56);
  if (v3)
    goto LABEL_5;
}

{
  GPUTools::FD::Function *v2;
  void *v3;

  v2 = (GPUTools::FD::Function *)*((_QWORD *)this + 65);
  if (!v2)
  {
    v3 = (void *)*((_QWORD *)this + 56);
    if (!v3)
      return;
LABEL_5:
    free(v3);
    return;
  }
  GPUTools::FD::Function::~Function(v2);
  MEMORY[0x242622C98]();
  v3 = (void *)*((_QWORD *)this + 56);
  if (v3)
    goto LABEL_5;
}

uint64_t GPUTools::FD::Function::operator=(uint64_t a1, uint64_t a2)
{
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  GPUTools::FD::Function *v22;
  uint64_t v23;

  if (a1 != a2)
  {
    v4 = *(void **)(a1 + 448);
    if (v4)
      free(v4);
    *(_OWORD *)(a1 + 440) = *(_OWORD *)(a2 + 440);
    *(_DWORD *)(a1 + 436) = *(_DWORD *)(a2 + 436);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_WORD *)(a1 + 10) = *(_WORD *)(a2 + 10);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    v5 = *(_OWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = v5;
    v6 = *(_OWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = v6;
    v7 = *(_OWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 72) = v7;
    v8 = *(_OWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = v8;
    v9 = *(_OWORD *)(a2 + 120);
    *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
    *(_OWORD *)(a1 + 120) = v9;
    v10 = *(_OWORD *)(a2 + 144);
    *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 144) = v10;
    v11 = *(_OWORD *)(a2 + 168);
    *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
    *(_OWORD *)(a1 + 168) = v11;
    v12 = *(_OWORD *)(a2 + 192);
    *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
    *(_OWORD *)(a1 + 192) = v12;
    v13 = *(_OWORD *)(a2 + 216);
    *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
    *(_OWORD *)(a1 + 216) = v13;
    v14 = *(_OWORD *)(a2 + 240);
    *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
    *(_OWORD *)(a1 + 240) = v14;
    v15 = *(_OWORD *)(a2 + 264);
    *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
    *(_OWORD *)(a1 + 264) = v15;
    v16 = *(_OWORD *)(a2 + 288);
    *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
    *(_OWORD *)(a1 + 288) = v16;
    v17 = *(_OWORD *)(a2 + 312);
    *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
    *(_OWORD *)(a1 + 312) = v17;
    v18 = *(_OWORD *)(a2 + 336);
    *(_QWORD *)(a1 + 352) = *(_QWORD *)(a2 + 352);
    *(_OWORD *)(a1 + 336) = v18;
    v19 = *(_OWORD *)(a2 + 360);
    *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);
    *(_OWORD *)(a1 + 360) = v19;
    v20 = *(_OWORD *)(a2 + 384);
    *(_QWORD *)(a1 + 400) = *(_QWORD *)(a2 + 400);
    *(_OWORD *)(a1 + 384) = v20;
    v21 = *(_OWORD *)(a2 + 408);
    *(_QWORD *)(a1 + 424) = *(_QWORD *)(a2 + 424);
    *(_OWORD *)(a1 + 408) = v21;
    *(_DWORD *)(a1 + 432) = *(_DWORD *)(a2 + 432);
    *(_DWORD *)a2 = -1;
    *(_QWORD *)(a2 + 440) = 0;
    *(_QWORD *)(a2 + 448) = 0;
    *(_QWORD *)(a2 + 432) = 0;
    v22 = *(GPUTools::FD::Function **)(a1 + 520);
    if (v22)
    {
      GPUTools::FD::Function::~Function(v22);
      MEMORY[0x242622C98]();
    }
    *(_QWORD *)(a1 + 520) = *(_QWORD *)(a2 + 520);
    *(_OWORD *)(a1 + 456) = *(_OWORD *)(a2 + 456);
    *(_QWORD *)(a1 + 472) = *(_QWORD *)(a2 + 472);
    *(_DWORD *)(a1 + 480) = *(_DWORD *)(a2 + 480);
    *(_DWORD *)(a1 + 484) = *(_DWORD *)(a2 + 484);
    *(_QWORD *)(a1 + 488) = *(_QWORD *)(a2 + 488);
    v23 = *(_QWORD *)(a2 + 512);
    *(_QWORD *)(a1 + 504) = *(_QWORD *)(a2 + 504);
    *(_QWORD *)(a1 + 512) = v23;
    *(_QWORD *)(a1 + 496) = *(_QWORD *)(a2 + 496);
    *(_QWORD *)(a1 + 528) = *(_QWORD *)(a2 + 528);
    *(_QWORD *)(a2 + 520) = 0;
  }
  return a1;
}

void GTFunctionDecoder::GTFunctionDecoder(GTFunctionDecoder *this)
{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = malloc_type_malloc(0x100uLL, 0x10C004028F705ECuLL);
}

{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = malloc_type_malloc(0x100uLL, 0x10C004028F705ECuLL);
}

void GTFunctionDecoder::~GTFunctionDecoder(void **this)
{
  free(*this);
  free(this[2]);
}

{
  free(*this);
  free(this[2]);
}

uint64_t GTFunctionDecoder::_push(GTFunctionDecoder *this)
{
  int v2;
  int v3;
  void *v4;
  unsigned int v5;

  v2 = *((_DWORD *)this + 2);
  v3 = *((_DWORD *)this + 3);
  v4 = *(void **)this;
  if (v2 == v3)
  {
    if (v2 >= 1)
      v5 = 2 * v2;
    else
      v5 = 32;
    *((_DWORD *)this + 3) = v5;
    v4 = malloc_type_realloc(v4, 536 * v5, 0x10B0040F47DA5FCuLL);
    *(_QWORD *)this = v4;
    v2 = *((_DWORD *)this + 2);
  }
  *((_DWORD *)this + 2) = v2 + 1;
  return (uint64_t)v4 + 536 * v2;
}

void GTFunctionDecoder::_decode(_DWORD *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7;
  unint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  char *v14;
  int v15;
  char v16;
  __int16 v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;

  v21 = 0;
  v7 = a2 + 36;
  v8 = a4;
  FBDecoder_DecodeArguments((unsigned int *)&v21, a2 + 36, (*(_DWORD *)a2 - 36), a3, a4);
  bzero(a1, 0x218uLL);
  *(_OWORD *)(a1 + 114) = *(_OWORD *)(a2 + 16);
  *((_QWORD *)a1 + 64) = *(_QWORD *)(a2 + 8);
  *((_QWORD *)a1 + 55) = a2;
  v9 = *(_DWORD *)(a2 + 4);
  a1[108] = *(_DWORD *)a2;
  v10 = *(_DWORD *)(a2 + 32);
  *a1 = v9;
  a1[1] = v10;
  v11 = HIDWORD(v21);
  *((_WORD *)a1 + 5) = WORD2(v21);
  if ((_DWORD)v11)
  {
    if (*(_BYTE *)(a3 + 10) == 67)
      v12 = **(_QWORD **)a3;
    else
      v12 = 0;
    *((_QWORD *)a1 + 2) = v12;
    v13 = a1 + 12;
    v14 = (char *)(a3 + 11);
    do
    {
      *(_QWORD *)v13 = *(_QWORD *)(v14 - 11);
      v15 = *(v14 - 1);
      v13[2] = core_type(*(v14 - 1));
      *(_QWORD *)(v13 + 3) = sem_type(v15);
      *((_WORD *)v13 + 10) = *(_WORD *)(v14 - 3);
      v16 = *v14;
      v14 += 16;
      v17 = v16 & 1;
      if (v15 == 85)
        v18 = v17 | 8;
      else
        v18 = v17;
      *((_WORD *)v13 + 11) = v18;
      v13 += 6;
      --v11;
    }
    while (v11);
  }
  else
  {
    *((_QWORD *)a1 + 2) = 0;
  }
  if ((*(_BYTE *)(a2 + 32) & 1) != 0)
  {
    HIDWORD(v21) = 0;
    FBDecoder_DecodeArguments((unsigned int *)&v21, v7, (*(_DWORD *)a2 - 36), a3, v8);
    *((_QWORD *)a1 + 3) = *(_QWORD *)a3;
    v19 = *(unsigned __int8 *)(a3 + 10);
    a1[8] = core_type(*(_BYTE *)(a3 + 10));
    *(_QWORD *)(a1 + 9) = sem_type(v19);
    *((_WORD *)a1 + 22) = *(_WORD *)(a3 + 8);
    if (v19 == 85)
      v20 = *(_BYTE *)(a3 + 11) & 1 | 8;
    else
      v20 = *(_BYTE *)(a3 + 11) & 1;
    *((_WORD *)a1 + 23) = v20;
  }
}

uint64_t core_type(char a1)
{
  int v1;
  uint64_t result;

  v1 = a1 - 67;
  result = 1;
  switch(v1)
  {
    case 0:
    case 45:
    case 52:
      result = 7;
      break;
    case 16:
    case 18:
      result = 13;
      break;
    case 31:
      return result;
    case 33:
      result = 10;
      break;
    case 35:
      result = 9;
      break;
    case 38:
      result = 5;
      break;
    case 41:
    case 49:
      result = 11;
      break;
    case 48:
      result = 3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t sem_type(char a1)
{
  int v1;
  uint64_t result;

  v1 = a1 - 67;
  result = 1;
  switch(v1)
  {
    case 0:
      result = 15;
      break;
    case 16:
      result = 14;
      break;
    case 31:
      return result;
    case 33:
      result = 10;
      break;
    case 35:
      result = 9;
      break;
    case 38:
      result = 5;
      break;
    case 41:
      result = 11;
      break;
    case 45:
    case 49:
      result = 13;
      break;
    case 48:
      result = 3;
      break;
    case 52:
      result = 7;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

_QWORD *GTFunctionDecoder::Decode(uint64_t a1, unsigned int *a2)
{
  int v4;
  _QWORD *v5;
  int v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _QWORD *v12;
  unsigned int v13;
  char *v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;

  *(_DWORD *)(a1 + 8) = 0;
  v4 = *(_DWORD *)(a1 + 12);
  v5 = *(_QWORD **)a1;
  if (v4)
  {
    v6 = 0;
  }
  else
  {
    *(_DWORD *)(a1 + 12) = 32;
    v5 = malloc_type_realloc(v5, 0x4300uLL, 0x10B0040F47DA5FCuLL);
    *(_QWORD *)a1 = v5;
    v6 = *(_DWORD *)(a1 + 8);
  }
  *(_DWORD *)(a1 + 8) = v6 + 1;
  GTFunctionDecoder::_decode(&v5[67 * v6], (uint64_t)a2, *(_QWORD *)(a1 + 16), 16);
  if ((*((_BYTE *)a2 + 33) & 0x10) != 0)
  {
    do
    {
      v10 = *a2;
      v11 = *(_DWORD *)(a1 + 8);
      v12 = *(_QWORD **)a1;
      if (v11 == *(_DWORD *)(a1 + 12))
      {
        if (v11 >= 1)
          v13 = 2 * v11;
        else
          v13 = 32;
        *(_DWORD *)(a1 + 12) = v13;
        v12 = malloc_type_realloc(v12, 536 * v13, 0x10B0040F47DA5FCuLL);
        *(_QWORD *)a1 = v12;
        v11 = *(_DWORD *)(a1 + 8);
      }
      a2 = (unsigned int *)((char *)a2 + v10);
      *(_DWORD *)(a1 + 8) = v11 + 1;
      GTFunctionDecoder::_decode(&v12[67 * v11], (uint64_t)a2, *(_QWORD *)(a1 + 16), 16);
    }
    while ((*((_BYTE *)a2 + 33) & 0x20) == 0);
  }
  v7 = *(unsigned int *)(a1 + 8);
  result = *(_QWORD **)a1;
  if ((int)v7 >= 2)
  {
    if ((_DWORD)v7 == 2)
    {
      v9 = 1;
LABEL_18:
      v16 = (char *)&result[67 * v9];
      v17 = v7 - v9;
      do
      {
        *((_QWORD *)v16 - 2) = v16;
        v16 += 536;
        --v17;
      }
      while (v17);
      goto LABEL_20;
    }
    v9 = (v7 - 1) | 1;
    v14 = (char *)(result + 67);
    v15 = (v7 - 1) & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      *((_QWORD *)v14 - 2) = v14;
      *((_QWORD *)v14 + 65) = v14 + 536;
      v14 += 1072;
      v15 -= 2;
    }
    while (v15);
    if (v7 - 1 != ((v7 - 1) & 0xFFFFFFFFFFFFFFFELL))
      goto LABEL_18;
  }
LABEL_20:
  result[67 * (int)v7 - 2] = 0;
  return result;
}

void sub_23C6EEC90(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x242622C98](v1, 0x10A0C408EF24B1CLL);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<long long,objc_object  {objcproto8NSObject}*>::unordered_map(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  BOOL v5;
  unint64_t v6;
  uint8x8_t v7;
  uint64_t v8;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (__n == 1)
  {
    prime = 2;
LABEL_17:
    std::__hash_table<std::__hash_value_type<long long,objc_object  {objcproto8NSObject}*>,std::__unordered_map_hasher<long long,objc_object  {objcproto8NSObject}*,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,objc_object  {objcproto8NSObject}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto8NSObject}*>>::__do_rehash<true>(a1, prime);
    return a1;
  }
  prime = __n;
  if ((__n & (__n - 1)) != 0)
  {
    prime = std::__next_prime(__n);
    v4 = *(int8x8_t *)(a1 + 8);
    v5 = prime >= *(_QWORD *)&v4;
    if (prime > *(_QWORD *)&v4)
      goto LABEL_17;
  }
  else
  {
    v4 = 0;
    v5 = 1;
    if (__n)
      goto LABEL_17;
  }
  if (!v5)
  {
    v6 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v7 = (uint8x8_t)vcnt_s8(v4), v7.i16[0] = vaddlv_u8(v7), v7.u32[0] > 1uLL))
    {
      v6 = std::__next_prime(v6);
    }
    else
    {
      v8 = 1 << -(char)__clz(v6 - 1);
      if (v6 >= 2)
        v6 = v8;
    }
    if (prime <= v6)
      prime = v6;
    if (prime < *(_QWORD *)&v4)
      goto LABEL_17;
  }
  return a1;
}

void sub_23C6EF618(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<long long,objc_object  {objcproto8NSObject}*>,std::__unordered_map_hasher<long long,objc_object  {objcproto8NSObject}*,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,objc_object  {objcproto8NSObject}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto8NSObject}*>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<long long,objc_object  {objcproto8NSObject}*>,std::__unordered_map_hasher<long long,objc_object  {objcproto8NSObject}*,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,objc_object  {objcproto8NSObject}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto8NSObject}*>>::~__hash_table(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

void std::__hash_table<std::__hash_value_type<long long,objc_object  {objcproto8NSObject}*>,std::__unordered_map_hasher<long long,objc_object  {objcproto8NSObject}*,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,objc_object  {objcproto8NSObject}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto8NSObject}*>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;

  if (!a2)
  {
    v15 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v15)
      operator delete(v15);
    *(_QWORD *)(a1 + 8) = 0;
    return;
  }
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v4 = operator new(8 * a2);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v4;
  if (v5)
    operator delete(v5);
  v6 = 0;
  *(_QWORD *)(a1 + 8) = a2;
  do
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
  while (a2 != v6);
  v8 = a1 + 16;
  v7 = *(_QWORD **)(a1 + 16);
  if (v7)
  {
    v9 = v7[1];
    v10 = a2 - 1;
    if ((a2 & (a2 - 1)) == 0)
    {
      v11 = v9 & v10;
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v11) = v8;
      while (1)
      {
        v12 = (_QWORD *)*v7;
        if (!*v7)
          break;
        v13 = v12[1] & v10;
        if (v13 == v11)
        {
          v7 = (_QWORD *)*v7;
        }
        else if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v13))
        {
          *v7 = *v12;
          v14 = 8 * v13;
          *v12 = **(_QWORD **)(*(_QWORD *)a1 + v14);
          **(_QWORD **)(*(_QWORD *)a1 + v14) = v12;
        }
        else
        {
          *(_QWORD *)(*(_QWORD *)a1 + 8 * v13) = v7;
          v7 = v12;
          v11 = v13;
        }
      }
      return;
    }
    if (v9 >= a2)
      v9 %= a2;
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v9) = v8;
    v16 = (_QWORD *)*v7;
    if (*v7)
    {
      while (1)
      {
        v18 = v16[1];
        if (v18 >= a2)
          v18 %= a2;
        if (v18 == v9)
          goto LABEL_25;
        if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v18))
        {
          *v7 = *v16;
          v17 = 8 * v18;
          *v16 = **(_QWORD **)(*(_QWORD *)a1 + v17);
          **(_QWORD **)(*(_QWORD *)a1 + v17) = v16;
          v16 = v7;
LABEL_25:
          v7 = v16;
          v16 = (_QWORD *)*v16;
          if (!v16)
            return;
        }
        else
        {
          *(_QWORD *)(*(_QWORD *)a1 + 8 * v18) = v7;
          v7 = v16;
          v16 = (_QWORD *)*v16;
          v9 = v18;
          if (!v16)
            return;
        }
      }
    }
  }
}

_QWORD *std::__hash_table<std::__hash_value_type<long long,objc_object  {objcproto8NSObject}*>,std::__unordered_map_hasher<long long,objc_object  {objcproto8NSObject}*,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,objc_object  {objcproto8NSObject}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto8NSObject}*>>::__emplace_unique_key_args<long long,std::pair<long long const,objc_object  {objcproto8NSObject}>>(uint64_t a1, unint64_t *a2, _OWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD *v9;
  _QWORD *v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v14;
  float v15;
  float v16;
  uint64_t v17;
  _QWORD *v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t prime;
  unint64_t v23;
  uint8x8_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v6 >= v7)
        v3 = v6 % v7;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
    v9 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = (_QWORD *)*v9;
      if (*v9)
      {
        if (v8.u32[0] < 2uLL)
        {
          while (1)
          {
            v12 = v10[1];
            if (v12 == v6)
            {
              if (v10[2] == v6)
                return v10;
            }
            else if ((v12 & (v7 - 1)) != v3)
            {
              goto LABEL_23;
            }
            v10 = (_QWORD *)*v10;
            if (!v10)
              goto LABEL_23;
          }
        }
        do
        {
          v11 = v10[1];
          if (v11 == v6)
          {
            if (v10[2] == v6)
              return v10;
          }
          else
          {
            if (v11 >= v7)
              v11 %= v7;
            if (v11 != v3)
              break;
          }
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
    }
  }
LABEL_23:
  v14 = operator new(0x20uLL);
  *v14 = 0;
  v14[1] = v6;
  *((_OWORD *)v14 + 1) = *a3;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (v7 && (float)(v16 * (float)v7) >= v15)
  {
    v17 = *(_QWORD *)a1;
    v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
    if (v18)
    {
LABEL_26:
      *v14 = *v18;
LABEL_61:
      *v18 = v14;
      goto LABEL_62;
    }
  }
  else
  {
    v19 = 1;
    if (v7 >= 3)
      v19 = (v7 & (v7 - 1)) != 0;
    v20 = v19 | (2 * v7);
    v21 = vcvtps_u32_f32(v15 / v16);
    if (v20 <= v21)
      prime = v21;
    else
      prime = v20;
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
      v7 = *(_QWORD *)(a1 + 8);
    }
    if (prime > v7)
      goto LABEL_37;
    if (prime < v7)
    {
      v23 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v7 < 3 || (v24 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v24.i16[0] = vaddlv_u8(v24), v24.u32[0] > 1uLL))
      {
        v23 = std::__next_prime(v23);
      }
      else
      {
        v25 = 1 << -(char)__clz(v23 - 1);
        if (v23 >= 2)
          v23 = v25;
      }
      if (prime <= v23)
        prime = v23;
      if (prime < v7)
LABEL_37:
        std::__hash_table<std::__hash_value_type<long long,objc_object  {objcproto8NSObject}*>,std::__unordered_map_hasher<long long,objc_object  {objcproto8NSObject}*,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,objc_object  {objcproto8NSObject}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto8NSObject}*>>::__do_rehash<true>(a1, prime);
    }
    v7 = *(_QWORD *)(a1 + 8);
    v26 = v7 - 1;
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
      {
        v3 = v6 % v7;
        v17 = *(_QWORD *)a1;
        v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v6 % v7));
        if (v18)
          goto LABEL_26;
      }
      else
      {
        v3 = v6;
        v17 = *(_QWORD *)a1;
        v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v6);
        if (v18)
          goto LABEL_26;
      }
    }
    else
    {
      v3 = v26 & v6;
      v17 = *(_QWORD *)a1;
      v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v26 & v6));
      if (v18)
        goto LABEL_26;
    }
  }
  *v14 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v14;
  *(_QWORD *)(v17 + 8 * v3) = a1 + 16;
  if (*v14)
  {
    v27 = *(_QWORD *)(*v14 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v27 >= v7)
        v27 %= v7;
    }
    else
    {
      v27 &= v7 - 1;
    }
    v18 = (_QWORD *)(*(_QWORD *)a1 + 8 * v27);
    goto LABEL_61;
  }
LABEL_62:
  ++*(_QWORD *)(a1 + 24);
  return v14;
}

void sub_23C6EFB2C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

unint64_t GPUTools::VMBuffer::round_size(unint64_t this)
{
  if (3 * *MEMORY[0x24BDB03C8] <= this)
    return (this + *MEMORY[0x24BDB03C8] - 1) & -*MEMORY[0x24BDB03C8];
  else
    return 3 * *MEMORY[0x24BDB03C8];
}

GPUTools::VMBuffer *GPUTools::VMBuffer::VMBuffer(GPUTools::VMBuffer *this, unint64_t a2, uint64_t a3)
{
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 1;
  GPUTools::VMBuffer::_dealloc(this);
  GPUTools::VMBuffer::_alloc(this, a2, a3);
  return this;
}

{
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 1;
  GPUTools::VMBuffer::_dealloc(this);
  GPUTools::VMBuffer::_alloc(this, a2, a3);
  return this;
}

uint64_t GPUTools::VMBuffer::alloc(GPUTools::VMBuffer *this, unint64_t a2, uint64_t a3)
{
  GPUTools::VMBuffer::_dealloc(this);
  return GPUTools::VMBuffer::_alloc(this, a2, a3);
}

void GPUTools::VMBuffer::~VMBuffer(GPUTools::VMBuffer *this)
{
  GPUTools::VMBuffer::_dealloc(this);
}

{
  GPUTools::VMBuffer::_dealloc(this);
}

_QWORD *GPUTools::VMBuffer::_dealloc(_QWORD *this)
{
  _QWORD *v1;

  if (*this)
  {
    v1 = this;
    this = (_QWORD *)MEMORY[0x2426236E8](*MEMORY[0x24BDAEC58], *this, *MEMORY[0x24BDB03C8] + this[1] + this[1] * this[2]);
    v1[1] = 0;
    v1[2] = 0;
    *v1 = 0;
  }
  return this;
}

GPUTools::VMBuffer *GPUTools::VMBuffer::operator=(GPUTools::VMBuffer *this, uint64_t a2)
{
  if (this != (GPUTools::VMBuffer *)a2)
  {
    GPUTools::VMBuffer::_dealloc(this);
    *(_OWORD *)this = *(_OWORD *)a2;
    *((_OWORD *)this + 1) = *(_OWORD *)(a2 + 16);
    *((_OWORD *)this + 2) = *(_OWORD *)(a2 + 32);
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
  }
  return this;
}

uint64_t GPUTools::VMBuffer::_alloc(GPUTools::VMBuffer *this, unint64_t a2, uint64_t a3)
{
  char v3;
  int v4;
  _QWORD *v5;
  vm_size_t v6;
  vm_size_t v7;
  vm_map_t *v8;
  uint64_t v9;
  vm_size_t v10;
  mach_error_t v11;
  vm_address_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  vm_address_t address;
  uint64_t cur_protection;
  vm_address_t target_address;

  v3 = (char)this;
  v4 = 0;
  address = 0;
  v5 = (_QWORD *)MEMORY[0x24BDB03C8];
  if (3 * *MEMORY[0x24BDB03C8] <= a2)
    v6 = (a2 + *MEMORY[0x24BDB03C8] - 1) & -*MEMORY[0x24BDB03C8];
  else
    v6 = 3 * *MEMORY[0x24BDB03C8];
  v7 = v6 + v6 * a3;
  v8 = (vm_map_t *)MEMORY[0x24BDAEC58];
  do
  {
    v9 = *v8;
    v10 = *v5 + v7;
    v11 = vm_allocate(*v8, &address, v10, 1);
    if (!v11)
    {
      v12 = address;
      target_address = address + v6;
      v13 = a3;
      if (a3)
      {
        while (1)
        {
          v11 = MEMORY[0x2426236E8](v9);
          if (v11)
            break;
          cur_protection = 0;
          v11 = vm_remap(v9, &target_address, v6, 0, 0, v9, address, 0, (vm_prot_t *)&cur_protection + 1, (vm_prot_t *)&cur_protection, 2u);
          if (v11)
            break;
          target_address += v6;
          if (!--v13)
          {
            v12 = address;
            goto LABEL_11;
          }
        }
        v3 = (char)this;
        v8 = (vm_map_t *)MEMORY[0x24BDAEC58];
      }
      else
      {
LABEL_11:
        v11 = MEMORY[0x242623700](v9, v12 + v10 - *v5, *v5, 0, 0);
        v3 = (char)this;
        v8 = (vm_map_t *)MEMORY[0x24BDAEC58];
        if (!v11)
        {
          *(_QWORD *)this = address;
          *((_QWORD *)this + 1) = v6;
          *((_QWORD *)this + 2) = a3;
          return 1;
        }
      }
    }
    mach_error_string(v11);
    DYLog(3, "<VMBuffer: %p> allocation failed: %s", v14, v15, v16, v17, v18, v19, v3);
    MEMORY[0x2426236E8](*v8, address, *v5 + v7);
    ++v4;
  }
  while (v4 != 5);
  return 0;
}

uint64_t GPUTools::VMBuffer::resize(GPUTools::VMBuffer *this, unint64_t a2)
{
  vm_address_t v3;
  vm_size_t v4;
  uint64_t v5;
  uint64_t result;
  vm_size_t v7;
  unsigned int *v8;
  mach_error_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = *(_QWORD *)this;
  v4 = *((_QWORD *)this + 1);
  v5 = *((_QWORD *)this + 2);
  result = GPUTools::VMBuffer::_alloc(this, a2, v5);
  if ((_DWORD)result)
  {
    if (v4 >= *((_QWORD *)this + 1))
      v7 = *((_QWORD *)this + 1);
    else
      v7 = v4;
    v8 = (unsigned int *)MEMORY[0x24BDAEC58];
    v9 = vm_copy(*MEMORY[0x24BDAEC58], v3, v7, *(_QWORD *)this);
    if (v9)
    {
      mach_error_string(v9);
      DYLog(3, "<VMBuffer: %p> vm_copy failed: %s", v10, v11, v12, v13, v14, v15, (char)this);
      GPUTools::VMBuffer::_dealloc(this);
      return 0;
    }
    else
    {
      MEMORY[0x2426236E8](*v8, v3, *MEMORY[0x24BDB03C8] + v4 + v4 * v5);
      return 1;
    }
  }
  return result;
}

BOOL GPUTools::VMBuffer::protect_readonly(GPUTools::VMBuffer *this)
{
  return MEMORY[0x242623700](*MEMORY[0x24BDAEC58], *(_QWORD *)this, *((_QWORD *)this + 2) * *((_QWORD *)this + 1), 0, 1) == 0;
}

const char *dy_fenum_to_function_name_nsstring(int a1, __int16 a2, int a3)
{
  const char *result;

  result = dy_fenum_to_function_name(a1, a2, a3);
  if (result)
    return (const char *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", result, strlen(result), 1, 0);
  return result;
}

_QWORD *GPUTools::FB::VAListArgumentProvider::VAListArgumentProvider(_QWORD *this, char *a2)
{
  *this = &off_250D63408;
  this[1] = a2;
  return this;
}

{
  *this = &off_250D63408;
  this[1] = a2;
  return this;
}

void GPUTools::FB::VAListArgumentProvider::~VAListArgumentProvider(GPUTools::FB::VAListArgumentProvider *this)
{
  *(_QWORD *)this = &off_250D63408;
}

{
  *(_QWORD *)this = &off_250D63408;
}

{
  *(_QWORD *)this = &off_250D63408;
  JUMPOUT(0x242622C98);
}

uint64_t GPUTools::FB::FunctionArgumentProvider::GenFormatString(GPUTools::FB::FunctionArgumentProvider *this, const GPUTools::FD::Argument *a2)
{
  __int16 v3;
  __int16 v4;
  int v5;
  const char *v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  _QWORD v12[2];
  _QWORD v13[11];
  char v14;
  uint64_t v15;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v12);
  v3 = *((_WORD *)this + 11);
  if ((v3 & 1) != 0 || (v3 & 2) != 0)
  {
    std::ostream::put();
    std::ostream::operator<<();
  }
  v4 = *((_WORD *)this + 11);
  if ((v4 & 4) != 0)
  {
    std::ostream::put();
    v4 = *((_WORD *)this + 11);
  }
  if ((v4 & 8) != 0)
  {
    std::ostream::put();
    if (*((_DWORD *)this + 3))
    {
      std::ostream::put();
      goto LABEL_11;
    }
  }
  else if ((v4 & 0x10) != 0)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"V<", 2);
LABEL_11:
    v5 = 1;
    goto LABEL_13;
  }
  v5 = 0;
LABEL_13:
  v6 = "ub";
  switch(*((_DWORD *)this + 3))
  {
    case 0:
      if (*((_DWORD *)this + 2) != 13)
        __assert_rtn("static std::string GPUTools::FB::FunctionArgumentProvider::GenFormatString(const GPUTools::FD::Argument &)", "", 0, "argument.core_type == Argument::Type::Pointer");
      break;
    case 1:
    case 3:
    case 5:
    case 7:
    case 9:
    case 0xA:
    case 0xB:
    case 0xD:
    case 0xE:
    case 0xF:
    case 0x13:
    case 0x21:
    case 0x22:
    case 0x23:
    case 0x24:
    case 0x25:
    case 0x26:
    case 0x27:
    case 0x2A:
    case 0x2B:
    case 0x2C:
    case 0x2D:
    case 0x2E:
    case 0x2F:
      goto LABEL_32;
    case 2:
    case 0x11:
      goto LABEL_27;
    case 4:
      v6 = "us";
      goto LABEL_27;
    case 6:
    case 0x14:
    case 0x15:
    case 0x16:
    case 0x17:
    case 0x18:
    case 0x19:
      v6 = "ui";
      goto LABEL_27;
    case 8:
    case 0x1A:
      v6 = "uw";
      goto LABEL_27;
    case 0xC:
      v6 = "ul";
LABEL_27:
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)v6, 2);
      break;
    case 0x10:
      dy_abort("objc objects cannot be encoded in function buffers", 98);
    case 0x12:
    case 0x1B:
    case 0x1C:
    case 0x1D:
    case 0x1E:
    case 0x1F:
    case 0x20:
      v7 = *((_DWORD *)this + 2);
      if (v7 != 6 && v7 != 9 && v7 != 8)
        dy_abort("invalid core type for GL enum: %u", 98);
      goto LABEL_32;
    case 0x28:
      v9 = *((_DWORD *)this + 2);
      if (v9 != 12 && v9 != 6)
        dy_abort("invalid core type for GL shader: %u", 98);
      goto LABEL_32;
    case 0x29:
      v8 = *((_DWORD *)this + 2);
      if (v8 != 12 && v8 != 6)
        dy_abort("invalid core type for GL program: %u", 98);
LABEL_32:
      std::ostream::put();
      break;
    default:
      break;
  }
  if (v5)
    std::ostream::put();
  std::stringbuf::str();
  v12[0] = *MEMORY[0x24BEDB7F0];
  v10 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v12 + *(_QWORD *)(v12[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v13[0] = v10;
  v13[1] = MEMORY[0x24BEDB848] + 16;
  if (v14 < 0)
    operator delete((void *)v13[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x242622C5C](&v15);
}

void sub_23C6F0F24(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  std::ios_base *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = MEMORY[0x24BEDB858];
  v3 = MEMORY[0x24BEDB858] + 104;
  *(_QWORD *)(a1 + 128) = MEMORY[0x24BEDB858] + 104;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  v4 = a1 + 16;
  v5 = (_QWORD *)MEMORY[0x24BEDB7F0];
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 16);
  v7 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 24);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + *(_QWORD *)(v6 - 24)) = v7;
  *(_QWORD *)(a1 + 8) = 0;
  v8 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  v9 = v5[4];
  v10 = v5[5];
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(v4 + *(_QWORD *)(v9 - 24)) = v10;
  v11 = v5[1];
  *(_QWORD *)a1 = v11;
  *(_QWORD *)(a1 + *(_QWORD *)(v11 - 24)) = v5[6];
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 128) = v3;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_23C6F103C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x242622C5C](v1);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = MEMORY[0x24BEDB7F0];
  v3 = *MEMORY[0x24BEDB7F0];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB7F0];
  v4 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_QWORD *)(a1 + 16) = v4;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x242622C5C](a1 + 128);
  return a1;
}

GPUTools::FB::FunctionArgumentProvider *GPUTools::FB::FunctionArgumentProvider::FunctionArgumentProvider(GPUTools::FB::FunctionArgumentProvider *this, const GPUTools::FD::CoreFunction *a2, int a3)
{
  void ***v3;
  void **v5;
  std::string *v6;
  unsigned __int16 v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  GPUTools::FB::FunctionArgumentProvider *v12;
  void **v13;
  std::string::size_type v14;
  __int16 v15;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  _WORD *v24;
  unsigned int v25;
  std::string *v26;
  _DWORD *v27;
  unint64_t CoreTypeSize;
  unint64_t v29;
  uint64_t v30;
  void ***v31;
  uint64_t v32;
  void **v33;
  uint64_t v34;
  char *v35;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  _WORD *v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  void **v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  char *v55;
  char *v56;
  char *v57;
  char *v58;
  char *v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  char *v66;
  char *v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char *v76;
  char *v77;
  char *v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  char *v83;
  char *v85;
  void **v86;
  void *__p[2];
  unsigned __int8 v88;

  *(_QWORD *)this = &off_250D63470;
  *((_QWORD *)this + 1) = 0;
  v5 = (void **)((char *)this + 8);
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = a2;
  *(_OWORD *)((char *)this + 40) = 0u;
  v6 = (std::string *)((char *)this + 40);
  *(_OWORD *)((char *)this + 56) = 0u;
  v7 = *((_WORD *)a2 + 5);
  if (a3)
  {
    v7 = 1;
    v8 = (char *)a2 + 24;
  }
  else
  {
    v8 = (char *)a2 + 48;
  }
  v9 = v7;
  v86 = v5;
  std::vector<std::pair<dy_polymorphic_scalar_t,BOOL>>::reserve(v5, v7);
  if ((_DWORD)v9)
  {
    v11 = 0;
    v85 = (char *)this + 24;
    do
    {
      v12 = (GPUTools::FB::FunctionArgumentProvider *)&v8[24 * v11];
      GPUTools::FB::FunctionArgumentProvider::GenFormatString((uint64_t *)__p, v12, (const GPUTools::FD::Argument *)v10);
      if ((v88 & 0x80u) == 0)
        v13 = __p;
      else
        v13 = (void **)__p[0];
      if ((v88 & 0x80u) == 0)
        v14 = v88;
      else
        v14 = (std::string::size_type)__p[1];
      std::string::append(v6, (const std::string::value_type *)v13, v14);
      v15 = *(_WORD *)&v8[24 * v11 + 22];
      if ((v15 & 2) != 0)
      {
        v23 = &v8[24 * v11];
        v25 = *((unsigned __int16 *)v23 + 10);
        v24 = v23 + 20;
        v3 = (void ***)malloc_type_malloc(8 * v25, 0x80040B8603338uLL);
        if (!v3)
          __assert_rtn("GPUTools::FB::FunctionArgumentProvider::FunctionArgumentProvider(const GPUTools::FD::CoreFunction &, BOOL)", "", 0, "ppArrays");
        v26 = v6;
        v27 = malloc_type_malloc(4 * (unsigned __int16)*v24, 0x100004052888210uLL);
        if (!v27)
          __assert_rtn("GPUTools::FB::FunctionArgumentProvider::FunctionArgumentProvider(const GPUTools::FD::CoreFunction &, BOOL)", "", 0, "pLengths");
        CoreTypeSize = GPUTools::FD::Argument::GetCoreTypeSize(*(_DWORD *)&v8[24 * v11 + 8]);
        v29 = (unsigned __int16)*v24;
        if (*v24)
        {
          v30 = 0;
          v31 = *(void ****)v12;
          v32 = *(_QWORD *)v12 + 4;
          do
          {
            v33 = (void **)(*(unsigned int *)(v32 - 4) + *(_QWORD *)v12);
            v3[v30] = v33;
            v34 = v30 + 1;
            if (v30 + 1 >= v29)
              v35 = &v8[24 * v11 + 16];
            else
              v35 = (char *)v32;
            v27[v30] = ((char *)v31 + *(unsigned int *)v35 - (char *)v33) / CoreTypeSize;
            v32 += 4;
            ++v30;
          }
          while (v29 != v34);
        }
        v37 = *((_QWORD *)this + 2);
        v36 = *((_QWORD *)this + 3);
        if (v37 >= v36)
        {
          v39 = (uint64_t)(v37 - (_QWORD)*v86) >> 4;
          v40 = v39 + 1;
          if ((unint64_t)(v39 + 1) >> 60)
            std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
          v41 = v36 - (_QWORD)*v86;
          if (v41 >> 3 > v40)
            v40 = v41 >> 3;
          if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF0)
            v10 = 0xFFFFFFFFFFFFFFFLL;
          else
            v10 = v40;
          if (v10)
            v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<dy_polymorphic_scalar_t,BOOL>>>((uint64_t)v85, v10);
          else
            v42 = 0;
          v56 = &v42[16 * v39];
          *(_QWORD *)v56 = v27;
          v56[8] = 1;
          v58 = (char *)*((_QWORD *)this + 1);
          v57 = (char *)*((_QWORD *)this + 2);
          v59 = v56;
          v6 = v26;
          if (v57 != v58)
          {
            do
            {
              *((_OWORD *)v59 - 1) = *((_OWORD *)v57 - 1);
              v59 -= 16;
              v57 -= 16;
            }
            while (v57 != v58);
            v57 = (char *)*v86;
          }
          v38 = v56 + 16;
          *((_QWORD *)this + 1) = v59;
          *((_QWORD *)this + 2) = v56 + 16;
          *((_QWORD *)this + 3) = &v42[16 * v10];
          if (v57)
            operator delete(v57);
        }
        else
        {
          *(_QWORD *)v37 = v27;
          *(_BYTE *)(v37 + 8) = 1;
          v38 = (char *)(v37 + 16);
          v6 = v26;
        }
        *((_QWORD *)this + 2) = v38;
        v60 = *((_QWORD *)this + 3);
        if ((unint64_t)v38 >= v60)
        {
          v61 = (v38 - (_BYTE *)*v86) >> 4;
          if ((unint64_t)(v61 + 1) >> 60)
            std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
          v62 = v60 - (_QWORD)*v86;
          v63 = v62 >> 3;
          if (v62 >> 3 <= (unint64_t)(v61 + 1))
            v63 = v61 + 1;
          if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF0)
            v10 = 0xFFFFFFFFFFFFFFFLL;
          else
            v10 = v63;
          if (v10)
            v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<dy_polymorphic_scalar_t,BOOL>>>((uint64_t)v85, v10);
          else
            v22 = 0;
          v64 = &v22[16 * v61];
          *(_QWORD *)v64 = v3;
          v64[8] = 1;
          v66 = (char *)*((_QWORD *)this + 1);
          v65 = (char *)*((_QWORD *)this + 2);
          v67 = v64;
          if (v65 != v66)
          {
            do
            {
              *((_OWORD *)v67 - 1) = *((_OWORD *)v65 - 1);
              v67 -= 16;
              v65 -= 16;
            }
            while (v65 != v66);
LABEL_125:
            v65 = (char *)*v86;
          }
LABEL_126:
          v55 = v64 + 16;
          *((_QWORD *)this + 1) = v67;
          *((_QWORD *)this + 2) = v64 + 16;
          *((_QWORD *)this + 3) = &v22[16 * v10];
          if (v65)
            operator delete(v65);
          goto LABEL_128;
        }
        *(_QWORD *)v38 = v3;
        v38[8] = 1;
        v55 = v38 + 16;
      }
      else
      {
        if (*(_DWORD *)&v8[24 * v11 + 12] != 14 && (v15 & 0x18) == 0)
        {
          if ((v15 & 1) == 0)
          {
            switch(*(_DWORD *)&v8[24 * v11 + 8])
            {
              case 1:
              case 2:
                v74 = **(unsigned __int8 **)v12;
                v75 = (unint64_t)v3 & 0xFFFFFFFFFFFFFF00;
                goto LABEL_110;
              case 3:
              case 4:
                v74 = **(unsigned __int16 **)v12;
                v75 = (unint64_t)v3 & 0xFFFFFFFFFFFF0000;
                goto LABEL_110;
              case 5:
              case 6:
              case 9:
                v74 = **(unsigned int **)v12;
                v75 = (unint64_t)v3 & 0xFFFFFFFF00000000;
LABEL_110:
                v3 = (void ***)(v75 | v74);
                break;
              case 7:
              case 8:
              case 0xA:
              case 0xB:
              case 0xC:
                v3 = **(void *****)v12;
                break;
              case 0xD:
                v3 = *(void ****)v12;
                break;
              default:
                dy_abort("invalid core type: %u", *(_DWORD *)&v8[24 * v11 + 8]);
            }
            v53 = *((_QWORD *)this + 2);
            v79 = *((_QWORD *)this + 3);
            if (v53 >= v79)
            {
              v80 = (uint64_t)(v53 - (_QWORD)*v86) >> 4;
              v81 = v80 + 1;
              if ((unint64_t)(v80 + 1) >> 60)
                std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
              v82 = v79 - (_QWORD)*v86;
              if (v82 >> 3 > v81)
                v81 = v82 >> 3;
              if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFF0)
                v10 = 0xFFFFFFFFFFFFFFFLL;
              else
                v10 = v81;
              if (v10)
                v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<dy_polymorphic_scalar_t,BOOL>>>((uint64_t)v85, v10);
              else
                v22 = 0;
              v64 = &v22[16 * v80];
              *(_QWORD *)v64 = v3;
              v64[8] = 0;
              v83 = (char *)*((_QWORD *)this + 1);
              v65 = (char *)*((_QWORD *)this + 2);
              v67 = v64;
              if (v65 != v83)
              {
                do
                {
                  *((_OWORD *)v67 - 1) = *((_OWORD *)v65 - 1);
                  v67 -= 16;
                  v65 -= 16;
                }
                while (v65 != v83);
                goto LABEL_125;
              }
              goto LABEL_126;
            }
            *(_QWORD *)v53 = v3;
            *(_BYTE *)(v53 + 8) = 0;
            goto LABEL_113;
          }
          v3 = *(void ****)v12;
          v17 = *((_QWORD *)this + 2);
          v54 = *((_QWORD *)this + 3);
          if (v17 >= v54)
          {
            v68 = (uint64_t)(v17 - (_QWORD)*v86) >> 4;
            v69 = v68 + 1;
            if ((unint64_t)(v68 + 1) >> 60)
              std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
            v70 = v54 - (_QWORD)*v86;
            if (v70 >> 3 > v69)
              v69 = v70 >> 3;
            if ((unint64_t)v70 >= 0x7FFFFFFFFFFFFFF0)
              v10 = 0xFFFFFFFFFFFFFFFLL;
            else
              v10 = v69;
            if (v10)
              v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<dy_polymorphic_scalar_t,BOOL>>>((uint64_t)v85, v10);
            else
              v22 = 0;
            v64 = &v22[16 * v68];
            *(_QWORD *)v64 = v3;
            v64[8] = 0;
            v77 = (char *)*((_QWORD *)this + 1);
            v65 = (char *)*((_QWORD *)this + 2);
            v67 = v64;
            if (v65 != v77)
            {
              do
              {
                *((_OWORD *)v67 - 1) = *((_OWORD *)v65 - 1);
                v67 -= 16;
                v65 -= 16;
              }
              while (v65 != v77);
              goto LABEL_125;
            }
            goto LABEL_126;
          }
        }
        else
        {
          if ((v15 & 0x40) != 0)
          {
            v43 = &v8[24 * v11];
            v45 = *((unsigned __int16 *)v43 + 10);
            v44 = v43 + 20;
            v3 = (void ***)malloc_type_malloc(8 * v45, 0x10040436913F5uLL);
            if (!v3)
              __assert_rtn("GPUTools::FB::FunctionArgumentProvider::FunctionArgumentProvider(const GPUTools::FD::CoreFunction &, BOOL)", "", 0, "ppStrings");
            v46 = GPUTools::FD::Argument::ViewAsCStringArray((GPUTools::FD::Argument *)&v8[24 * v11]);
            v47 = (unsigned __int16)*v44;
            if (*v44)
            {
              v48 = 0;
              v49 = *(_WORD *)(v46 + 22);
              do
              {
                v50 = *(_QWORD *)v46;
                if ((v49 & 0x40) != 0)
                  v51 = (void **)(*(unsigned int *)(v50 + 4 * v48) + v50);
                else
                  v51 = *(void ***)(v50 + 8 * v48);
                v3[v48++] = v51;
              }
              while (v47 != v48);
            }
            v53 = *((_QWORD *)this + 2);
            v52 = *((_QWORD *)this + 3);
            if (v53 >= v52)
            {
              v71 = (uint64_t)(v53 - (_QWORD)*v86) >> 4;
              v72 = v71 + 1;
              if ((unint64_t)(v71 + 1) >> 60)
                std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
              v73 = v52 - (_QWORD)*v86;
              if (v73 >> 3 > v72)
                v72 = v73 >> 3;
              if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFF0)
                v10 = 0xFFFFFFFFFFFFFFFLL;
              else
                v10 = v72;
              if (v10)
                v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<dy_polymorphic_scalar_t,BOOL>>>((uint64_t)v85, v10);
              else
                v22 = 0;
              v64 = &v22[16 * v71];
              *(_QWORD *)v64 = v3;
              v64[8] = 1;
              v78 = (char *)*((_QWORD *)this + 1);
              v65 = (char *)*((_QWORD *)this + 2);
              v67 = v64;
              if (v65 != v78)
              {
                do
                {
                  *((_OWORD *)v67 - 1) = *((_OWORD *)v65 - 1);
                  v67 -= 16;
                  v65 -= 16;
                }
                while (v65 != v78);
                goto LABEL_125;
              }
              goto LABEL_126;
            }
            *(_QWORD *)v53 = v3;
            *(_BYTE *)(v53 + 8) = 1;
LABEL_113:
            v55 = (char *)(v53 + 16);
            goto LABEL_128;
          }
          v3 = *(void ****)v12;
          v17 = *((_QWORD *)this + 2);
          v18 = *((_QWORD *)this + 3);
          if (v17 >= v18)
          {
            v19 = (uint64_t)(v17 - (_QWORD)*v86) >> 4;
            v20 = v19 + 1;
            if ((unint64_t)(v19 + 1) >> 60)
              std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
            v21 = v18 - (_QWORD)*v86;
            if (v21 >> 3 > v20)
              v20 = v21 >> 3;
            if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF0)
              v10 = 0xFFFFFFFFFFFFFFFLL;
            else
              v10 = v20;
            if (v10)
              v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<dy_polymorphic_scalar_t,BOOL>>>((uint64_t)v85, v10);
            else
              v22 = 0;
            v64 = &v22[16 * v19];
            *(_QWORD *)v64 = v3;
            v64[8] = 0;
            v76 = (char *)*((_QWORD *)this + 1);
            v65 = (char *)*((_QWORD *)this + 2);
            v67 = v64;
            if (v65 != v76)
            {
              do
              {
                *((_OWORD *)v67 - 1) = *((_OWORD *)v65 - 1);
                v67 -= 16;
                v65 -= 16;
              }
              while (v65 != v76);
              goto LABEL_125;
            }
            goto LABEL_126;
          }
        }
        *(_QWORD *)v17 = v3;
        *(_BYTE *)(v17 + 8) = 0;
        v55 = (char *)(v17 + 16);
      }
LABEL_128:
      *((_QWORD *)this + 2) = v55;
      if ((char)v88 < 0)
        operator delete(__p[0]);
      ++v11;
    }
    while (v11 != v9);
  }
  return this;
}

void sub_23C6F18C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void **a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;
  void **v18;
  void *v20;

  if (a17 < 0)
    operator delete(__p);
  if (*(char *)(v17 + 63) < 0)
    operator delete(*v18);
  v20 = *a11;
  if (*a11)
  {
    *(_QWORD *)(v17 + 16) = v20;
    operator delete(v20);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<std::pair<dy_polymorphic_scalar_t,BOOL>>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 4)
  {
    if (a2 >> 60)
      std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<dy_polymorphic_scalar_t,BOOL>>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    v9 = &v6[16 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void GPUTools::FB::FunctionArgumentProvider::~FunctionArgumentProvider(GPUTools::FB::FunctionArgumentProvider *this)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  *(_QWORD *)this = &off_250D63470;
  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  while (v2 != v3)
  {
    if ((*(_BYTE *)(v2 + 8) & 1) != 0)
      free(*(void **)v2);
    v2 += 16;
  }
  if (*((char *)this + 63) < 0)
    operator delete(*((void **)this + 5));
  v4 = (void *)*((_QWORD *)this + 1);
  if (v4)
  {
    *((_QWORD *)this + 2) = v4;
    operator delete(v4);
  }
}

{
  GPUTools::FB::FunctionArgumentProvider::~FunctionArgumentProvider(this);
  JUMPOUT(0x242622C98);
}

void GPUTools::FB::FIFOArgumentProvider::~FIFOArgumentProvider(GPUTools::FB::FIFOArgumentProvider *this)
{
  *(_QWORD *)this = &off_250D634D8;
  std::deque<dy_polymorphic_scalar_t>::~deque[abi:ne180100]((_QWORD *)this + 1);
}

{
  *(_QWORD *)this = &off_250D634D8;
  std::deque<dy_polymorphic_scalar_t>::~deque[abi:ne180100]((_QWORD *)this + 1);
}

{
  *(_QWORD *)this = &off_250D634D8;
  std::deque<dy_polymorphic_scalar_t>::~deque[abi:ne180100]((_QWORD *)this + 1);
  JUMPOUT(0x242622C98);
}

void GPUTools::FB::FIFOArgumentProvider::push(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = a2;
  std::deque<dy_polymorphic_scalar_t>::push_back((_QWORD *)(a1 + 8), &v2);
}

void GPUTools::FB::FIFOArgumentProvider::push(GPUTools::FB::FIFOArgumentProvider *this, unsigned int a2)
{
  uint64_t v2;

  v2 = a2;
  std::deque<dy_polymorphic_scalar_t>::push_back((_QWORD *)this + 1, &v2);
}

{
  uint64_t v2;

  v2 = a2;
  std::deque<dy_polymorphic_scalar_t>::push_back((_QWORD *)this + 1, &v2);
}

void GPUTools::FB::FIFOArgumentProvider::push(GPUTools::FB::FIFOArgumentProvider *this, uint64_t a2)
{
  uint64_t v2;

  v2 = a2;
  std::deque<dy_polymorphic_scalar_t>::push_back((_QWORD *)this + 1, &v2);
}

{
  uint64_t v2;

  v2 = a2;
  std::deque<dy_polymorphic_scalar_t>::push_back((_QWORD *)this + 1, &v2);
}

void GPUTools::FB::FIFOArgumentProvider::push(GPUTools::FB::FIFOArgumentProvider *this, float a2)
{
  uint64_t v2;

  v2 = LODWORD(a2);
  std::deque<dy_polymorphic_scalar_t>::push_back((_QWORD *)this + 1, &v2);
}

void GPUTools::FB::FIFOArgumentProvider::push(GPUTools::FB::FIFOArgumentProvider *this, double a2)
{
  double v2;

  v2 = a2;
  std::deque<dy_polymorphic_scalar_t>::push_back((_QWORD *)this + 1, &v2);
}

void GPUTools::FB::FIFOArgumentProvider::push(GPUTools::FB::FIFOArgumentProvider *this, void *a2)
{
  void *v2;

  v2 = a2;
  std::deque<dy_polymorphic_scalar_t>::push_back((_QWORD *)this + 1, &v2);
}

uint64_t GPUTools::FB::FIFOArgumentProvider::size(GPUTools::FB::FIFOArgumentProvider *this)
{
  return *((_QWORD *)this + 6);
}

void GPUTools::FB::FIFOPointerArgumentProvider::~FIFOPointerArgumentProvider(GPUTools::FB::FIFOPointerArgumentProvider *this)
{
  *(_QWORD *)this = &off_250D63540;
  std::deque<dy_polymorphic_scalar_t>::~deque[abi:ne180100]((_QWORD *)this + 1);
}

{
  *(_QWORD *)this = &off_250D63540;
  std::deque<dy_polymorphic_scalar_t>::~deque[abi:ne180100]((_QWORD *)this + 1);
}

{
  *(_QWORD *)this = &off_250D63540;
  std::deque<dy_polymorphic_scalar_t>::~deque[abi:ne180100]((_QWORD *)this + 1);
  JUMPOUT(0x242622C98);
}

void GPUTools::FB::FIFOPointerArgumentProvider::push(GPUTools::FB::FIFOPointerArgumentProvider *this, void *a2)
{
  void *v2;

  v2 = a2;
  std::deque<dy_polymorphic_vector_t>::push_back((_QWORD *)this + 1, &v2);
}

uint64_t GPUTools::FB::FIFOPointerArgumentProvider::size(GPUTools::FB::FIFOPointerArgumentProvider *this)
{
  return *((_QWORD *)this + 6);
}

uint64_t GPUTools::FB::FIFOArgumentProvider::GetUInt8(GPUTools::FB::FIFOArgumentProvider *this)
{
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(*((_QWORD *)this + 2) + ((*((_QWORD *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                          + 8 * (*((_QWORD *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_23C70CC50);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOArgumentProvider::GetUInt16(GPUTools::FB::FIFOArgumentProvider *this)
{
  uint64_t v1;

  v1 = *(unsigned __int16 *)(*(_QWORD *)(*((_QWORD *)this + 2) + ((*((_QWORD *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                           + 8 * (*((_QWORD *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_23C70CC50);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOArgumentProvider::GetUInt32(GPUTools::FB::FIFOArgumentProvider *this)
{
  uint64_t v1;

  v1 = *(unsigned int *)(*(_QWORD *)(*((_QWORD *)this + 2) + ((*((_QWORD *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                       + 8 * (*((_QWORD *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_23C70CC50);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOArgumentProvider::GetUInt64(GPUTools::FB::FIFOArgumentProvider *this)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 2) + ((*((_QWORD *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                 + 8 * (*((_QWORD *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_23C70CC50);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOArgumentProvider::GetUIntPtr(GPUTools::FB::FIFOArgumentProvider *this)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 2) + ((*((_QWORD *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                 + 8 * (*((_QWORD *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_23C70CC50);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

float GPUTools::FB::FIFOArgumentProvider::GetFloat(GPUTools::FB::FIFOArgumentProvider *this)
{
  float v1;

  v1 = *(float *)(*(_QWORD *)(*((_QWORD *)this + 2) + ((*((_QWORD *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                + 8 * (*((_QWORD *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_23C70CC50);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

double GPUTools::FB::FIFOArgumentProvider::GetDouble(GPUTools::FB::FIFOArgumentProvider *this)
{
  double v1;

  v1 = *(double *)(*(_QWORD *)(*((_QWORD *)this + 2) + ((*((_QWORD *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                 + 8 * (*((_QWORD *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_23C70CC50);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOArgumentProvider::GetVoidPointer(GPUTools::FB::FIFOArgumentProvider *this)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 2) + ((*((_QWORD *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                 + 8 * (*((_QWORD *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_23C70CC50);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOArgumentProvider::GetCharPointer(GPUTools::FB::FIFOArgumentProvider *this)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 2) + ((*((_QWORD *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                 + 8 * (*((_QWORD *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_23C70CC50);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::VAListArgumentProvider::GetUInt8(GPUTools::FB::VAListArgumentProvider *this)
{
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v1 + 8;
  return *v1;
}

uint64_t GPUTools::FB::VAListArgumentProvider::GetUInt16(GPUTools::FB::VAListArgumentProvider *this)
{
  unsigned __int16 *v1;

  v1 = (unsigned __int16 *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v1 + 4;
  return *v1;
}

uint64_t GPUTools::FB::VAListArgumentProvider::GetUInt32(GPUTools::FB::VAListArgumentProvider *this)
{
  unsigned int *v1;

  v1 = (unsigned int *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v1 + 2;
  return *v1;
}

uint64_t GPUTools::FB::VAListArgumentProvider::GetUInt64(GPUTools::FB::VAListArgumentProvider *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v1 + 8;
  return *(_QWORD *)v1;
}

uint64_t GPUTools::FB::VAListArgumentProvider::GetUIntPtr(GPUTools::FB::VAListArgumentProvider *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v1 + 8;
  return *(_QWORD *)v1;
}

float GPUTools::FB::VAListArgumentProvider::GetFloat(GPUTools::FB::VAListArgumentProvider *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v1 + 8;
  return *(double *)v1;
}

double GPUTools::FB::VAListArgumentProvider::GetDouble(GPUTools::FB::VAListArgumentProvider *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v1 + 8;
  return *(double *)v1;
}

uint64_t GPUTools::FB::VAListArgumentProvider::GetVoidPointer(GPUTools::FB::VAListArgumentProvider *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v1 + 8;
  return *(_QWORD *)v1;
}

uint64_t GPUTools::FB::VAListArgumentProvider::GetCharPointer(GPUTools::FB::VAListArgumentProvider *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v1 + 8;
  return *(_QWORD *)v1;
}

uint64_t GPUTools::FB::FunctionArgumentProvider::GetUInt8(GPUTools::FB::FunctionArgumentProvider *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = v1 + 1;
  return *(unsigned __int8 *)(*((_QWORD *)this + 1) + 16 * v1);
}

uint64_t GPUTools::FB::FunctionArgumentProvider::GetUInt16(GPUTools::FB::FunctionArgumentProvider *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = v1 + 1;
  return *(unsigned __int16 *)(*((_QWORD *)this + 1) + 16 * v1);
}

uint64_t GPUTools::FB::FunctionArgumentProvider::GetUInt32(GPUTools::FB::FunctionArgumentProvider *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = v1 + 1;
  return *(unsigned int *)(*((_QWORD *)this + 1) + 16 * v1);
}

uint64_t GPUTools::FB::FunctionArgumentProvider::GetUInt64(GPUTools::FB::FunctionArgumentProvider *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = v1 + 1;
  return *(_QWORD *)(*((_QWORD *)this + 1) + 16 * v1);
}

uint64_t GPUTools::FB::FunctionArgumentProvider::GetUIntPtr(GPUTools::FB::FunctionArgumentProvider *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = v1 + 1;
  return *(_QWORD *)(*((_QWORD *)this + 1) + 16 * v1);
}

float GPUTools::FB::FunctionArgumentProvider::GetFloat(GPUTools::FB::FunctionArgumentProvider *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = v1 + 1;
  return *(float *)(*((_QWORD *)this + 1) + 16 * v1);
}

double GPUTools::FB::FunctionArgumentProvider::GetDouble(GPUTools::FB::FunctionArgumentProvider *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = v1 + 1;
  return *(double *)(*((_QWORD *)this + 1) + 16 * v1);
}

uint64_t GPUTools::FB::FunctionArgumentProvider::GetVoidPointer(GPUTools::FB::FunctionArgumentProvider *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = v1 + 1;
  return *(_QWORD *)(*((_QWORD *)this + 1) + 16 * v1);
}

uint64_t GPUTools::FB::FunctionArgumentProvider::GetCharPointer(GPUTools::FB::FunctionArgumentProvider *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = v1 + 1;
  return *(_QWORD *)(*((_QWORD *)this + 1) + 16 * v1);
}

uint64_t GPUTools::FB::FIFOPointerArgumentProvider::GetUInt8(GPUTools::FB::FIFOPointerArgumentProvider *this)
{
  uint64_t v1;

  v1 = **(unsigned __int8 **)(*(_QWORD *)(*((_QWORD *)this + 2) + ((*((_QWORD *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                            + 8 * (*((_QWORD *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_23C70CC50);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOPointerArgumentProvider::GetUInt16(GPUTools::FB::FIFOPointerArgumentProvider *this)
{
  uint64_t v1;

  v1 = **(unsigned __int16 **)(*(_QWORD *)(*((_QWORD *)this + 2) + ((*((_QWORD *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                             + 8 * (*((_QWORD *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_23C70CC50);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOPointerArgumentProvider::GetUInt32(GPUTools::FB::FIFOPointerArgumentProvider *this)
{
  uint64_t v1;

  v1 = **(unsigned int **)(*(_QWORD *)(*((_QWORD *)this + 2) + ((*((_QWORD *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                         + 8 * (*((_QWORD *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_23C70CC50);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOPointerArgumentProvider::GetUInt64(GPUTools::FB::FIFOPointerArgumentProvider *this)
{
  uint64_t v1;

  v1 = **(_QWORD **)(*(_QWORD *)(*((_QWORD *)this + 2) + ((*((_QWORD *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                   + 8 * (*((_QWORD *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_23C70CC50);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOPointerArgumentProvider::GetUIntPtr(GPUTools::FB::FIFOPointerArgumentProvider *this)
{
  uint64_t v1;

  v1 = **(_QWORD **)(*(_QWORD *)(*((_QWORD *)this + 2) + ((*((_QWORD *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                   + 8 * (*((_QWORD *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_23C70CC50);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

float GPUTools::FB::FIFOPointerArgumentProvider::GetFloat(GPUTools::FB::FIFOPointerArgumentProvider *this)
{
  float v1;

  v1 = **(float **)(*(_QWORD *)(*((_QWORD *)this + 2) + ((*((_QWORD *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                  + 8 * (*((_QWORD *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_23C70CC50);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

double GPUTools::FB::FIFOPointerArgumentProvider::GetDouble(GPUTools::FB::FIFOPointerArgumentProvider *this)
{
  double v1;

  v1 = **(double **)(*(_QWORD *)(*((_QWORD *)this + 2) + ((*((_QWORD *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                   + 8 * (*((_QWORD *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_23C70CC50);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOPointerArgumentProvider::GetVoidPointer(GPUTools::FB::FIFOPointerArgumentProvider *this)
{
  uint64_t v1;

  v1 = **(_QWORD **)(*(_QWORD *)(*((_QWORD *)this + 2) + ((*((_QWORD *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                   + 8 * (*((_QWORD *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_23C70CC50);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOPointerArgumentProvider::GetCharPointer(GPUTools::FB::FIFOPointerArgumentProvider *this)
{
  uint64_t v1;

  v1 = **(_QWORD **)(*(_QWORD *)(*((_QWORD *)this + 2) + ((*((_QWORD *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                   + 8 * (*((_QWORD *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_23C70CC50);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t std::deque<dy_polymorphic_scalar_t>::~deque[abi:ne180100](_QWORD *a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = (void **)a1[1];
  v3 = (void **)a1[2];
  a1[5] = 0;
  v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = (void **)a1[2];
      v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v5 = v4 >> 3;
  if (v5 == 1)
  {
    v6 = 256;
  }
  else
  {
    if (v5 != 2)
      goto LABEL_9;
    v6 = 512;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    v7 = *v2++;
    operator delete(v7);
  }
  return std::__split_buffer<dy_polymorphic_scalar_t *>::~__split_buffer((uint64_t)a1);
}

uint64_t std::__split_buffer<dy_polymorphic_scalar_t *>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != v3)
    *(_QWORD *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  v4 = *(void **)a1;
  if (*(_QWORD *)a1)
    operator delete(v4);
  return a1;
}

uint64_t std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100](uint64_t a1, int a2)
{
  unint64_t v2;
  int v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 < 0x200)
    a2 = 1;
  if (v2 < 0x400)
    v4 = a2;
  else
    v4 = 0;
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(_QWORD *)(a1 + 8) += 8;
    *(_QWORD *)(a1 + 32) -= 512;
  }
  return v4 ^ 1u;
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x242622B48](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x242622B54](v13);
  return a1;
}

void sub_23C6F281C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x242622B54](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x23C6F27FCLL);
}

void sub_23C6F2864(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_23C6F2998(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<dy_polymorphic_scalar_t,BOOL>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

void std::deque<dy_polymorphic_scalar_t>::push_back(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = a1[2];
  v5 = a1[1];
  v6 = ((v4 - v5) << 6) - 1;
  if (v4 == v5)
    v6 = 0;
  v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    std::deque<dy_polymorphic_scalar_t>::__add_back_capacity(a1);
    v5 = a1[1];
    v7 = a1[5] + a1[4];
  }
  *(_QWORD *)(*(_QWORD *)(v5 + ((v7 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v7 & 0x1FF)) = *a2;
  ++a1[5];
}

void std::deque<dy_polymorphic_scalar_t>::__add_back_capacity(_QWORD *a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  _QWORD *v56;

  v2 = a1[4];
  v3 = v2 >= 0x200;
  v4 = v2 - 512;
  if (v3)
  {
    v5 = (uint64_t)(a1 + 3);
    v6 = (char *)a1[3];
    a1[4] = v4;
    v7 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v11 = *v7;
    v9 = (char *)(v7 + 1);
    v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(_QWORD *)v8 = v10;
      a1[2] += 8;
      return;
    }
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v33 = 1;
      else
        v33 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>(v5, v33);
      v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      v8 = v35;
      v39 = a1[2] - (_QWORD)v38;
      if (v39)
      {
        v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          v42 = *v38++;
          *(_QWORD *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    v13 = v12 >> 3;
    v14 = v12 >> 3 < -1;
    v15 = (v12 >> 3) + 2;
    if (v14)
      v16 = v15;
    else
      v16 = v13 + 1;
    v17 = -(v16 >> 1);
    v18 = v16 >> 1;
    v19 = &v9[-8 * v18];
    v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      v9 = (char *)a1[1];
    }
    v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  v21 = a1[2];
  v22 = (v21 - a1[1]) >> 3;
  v23 = a1[3];
  v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(_QWORD *)&v54 = operator new(0x1000uLL);
      std::__split_buffer<dy_polymorphic_scalar_t *>::push_back(a1, &v54);
      return;
    }
    *(_QWORD *)&v54 = operator new(0x1000uLL);
    std::__split_buffer<dy_polymorphic_scalar_t *>::push_front((uint64_t)a1, &v54);
    v44 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v45 = *v44;
    v9 = (char *)(v44 + 1);
    v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3])
      goto LABEL_33;
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v46 = 1;
      else
        v46 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>((uint64_t)(a1 + 3), v46);
      v35 = &v34[8 * (v46 >> 2)];
      v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      v8 = v35;
      v49 = a1[2] - (_QWORD)v48;
      if (v49)
      {
        v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          v52 = *v48++;
          *(_QWORD *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1)
    v25 = 1;
  else
    v25 = v24 >> 2;
  v56 = a1 + 3;
  *(_QWORD *)&v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>((uint64_t)(a1 + 3), v25);
  *((_QWORD *)&v54 + 1) = v54 + 8 * v22;
  *(_QWORD *)&v55 = *((_QWORD *)&v54 + 1);
  *((_QWORD *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0x1000uLL);
  std::__split_buffer<dy_polymorphic_scalar_t *>::push_back(&v54, &v53);
  v27 = (_QWORD *)a1[2];
  v28 = -7 - (_QWORD)v27;
  while (v27 != (_QWORD *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<dy_polymorphic_scalar_t *>::push_front((uint64_t)&v54, v27);
  }
  v29 = (char *)*a1;
  v30 = v54;
  v31 = v55;
  *(_QWORD *)&v54 = *a1;
  *((_QWORD *)&v54 + 1) = v27;
  v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  v55 = v32;
  if (v27 != (_QWORD *)v32)
    *(_QWORD *)&v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  if (v29)
    operator delete(v29);
}

void sub_23C6F2DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  void *v13;

  operator delete(v13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void std::__split_buffer<dy_polymorphic_scalar_t *>::push_back(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int64_t v16;
  char *v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;

  v5 = (char *)a1[3];
  v4 = (uint64_t)(a1 + 3);
  v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    v7 = (char *)a1[1];
    v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1)
        v18 = 1;
      else
        v18 = (uint64_t)&v6[-*a1] >> 2;
      v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>(v4, v18);
      v21 = &v19[8 * (v18 >> 2)];
      v22 = (uint64_t *)a1[1];
      v6 = v21;
      v23 = a1[2] - (_QWORD)v22;
      if (v23)
      {
        v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        v24 = 8 * (v23 >> 3);
        v25 = &v19[8 * (v18 >> 2)];
        do
        {
          v26 = *v22++;
          *(_QWORD *)v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        v6 = (char *)a1[2];
      }
    }
    else
    {
      v9 = v8 >> 3;
      v10 = v8 >> 3 < -1;
      v11 = (v8 >> 3) + 2;
      if (v10)
        v12 = v11;
      else
        v12 = v9 + 1;
      v13 = -(v12 >> 1);
      v14 = v12 >> 1;
      v15 = &v7[-8 * v14];
      v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        v6 = (char *)a1[1];
      }
      v17 = &v6[8 * v13];
      v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(_QWORD *)v6 = *a2;
  a1[2] += 8;
}

{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    v5 = (char *)a1[1];
    v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1)
        v16 = 1;
      else
        v16 = (uint64_t)&v4[-*a1] >> 2;
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>(a1[4], v16);
      v19 = &v17[8 * (v16 >> 2)];
      v20 = (uint64_t *)a1[1];
      v4 = v19;
      v21 = a1[2] - (_QWORD)v20;
      if (v21)
      {
        v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        v22 = 8 * (v21 >> 3);
        v23 = &v17[8 * (v16 >> 2)];
        do
        {
          v24 = *v20++;
          *(_QWORD *)v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        v4 = (char *)a1[2];
      }
    }
    else
    {
      v7 = v6 >> 3;
      v8 = v6 >> 3 < -1;
      v9 = (v6 >> 3) + 2;
      if (v8)
        v10 = v9;
      else
        v10 = v7 + 1;
      v11 = -(v10 >> 1);
      v12 = v10 >> 1;
      v13 = &v5[-8 * v12];
      v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        v4 = (char *)a1[1];
      }
      v15 = &v4[8 * v11];
      v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(_QWORD *)v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<dy_polymorphic_scalar_t *>::push_front(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = a1 + 24;
    v7 = *(_BYTE **)(a1 + 24);
    v8 = *(_BYTE **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4)
        v12 = 1;
      else
        v12 = (v7 - v4) >> 2;
      v13 = 2 * v12;
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>(v6, v12);
      v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      v16 = *(uint64_t **)(a1 + 8);
      v17 = v5;
      v18 = *(_QWORD *)(a1 + 16) - (_QWORD)v16;
      if (v18)
      {
        v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        v19 = 8 * (v18 >> 3);
        v20 = v5;
        do
        {
          v21 = *v16++;
          *(_QWORD *)v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      v22 = *(char **)a1;
      *(_QWORD *)a1 = v14;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v17;
      *(_QWORD *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v9 = (v7 - v8) >> 3;
      if (v9 >= -1)
        v10 = v9 + 1;
      else
        v10 = v9 + 2;
      v11 = v10 >> 1;
      v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

{
  char *v4;
  char *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = *(_BYTE **)(a1 + 16);
    v7 = *(_BYTE **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4)
        v11 = 1;
      else
        v11 = (v7 - v4) >> 2;
      v12 = 2 * v11;
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>(*(_QWORD *)(a1 + 32), v11);
      v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      v15 = *(uint64_t **)(a1 + 8);
      v16 = v5;
      v17 = *(_QWORD *)(a1 + 16) - (_QWORD)v15;
      if (v17)
      {
        v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        v18 = 8 * (v17 >> 3);
        v19 = v5;
        do
        {
          v20 = *v15++;
          *(_QWORD *)v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      v21 = *(char **)a1;
      *(_QWORD *)a1 = v13;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v16;
      *(_QWORD *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v8 = (v7 - v6) >> 3;
      if (v8 >= -1)
        v9 = v8 + 1;
      else
        v9 = v8 + 2;
      v10 = v9 >> 1;
      v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

void std::deque<dy_polymorphic_vector_t>::push_back(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = a1[2];
  v5 = a1[1];
  v6 = ((v4 - v5) << 6) - 1;
  if (v4 == v5)
    v6 = 0;
  v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    std::deque<dy_polymorphic_vector_t>::__add_back_capacity(a1);
    v5 = a1[1];
    v7 = a1[5] + a1[4];
  }
  *(_QWORD *)(*(_QWORD *)(v5 + ((v7 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v7 & 0x1FF)) = *a2;
  ++a1[5];
}

void std::deque<dy_polymorphic_vector_t>::__add_back_capacity(_QWORD *a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  _QWORD *v56;

  v2 = a1[4];
  v3 = v2 >= 0x200;
  v4 = v2 - 512;
  if (v3)
  {
    v5 = (uint64_t)(a1 + 3);
    v6 = (char *)a1[3];
    a1[4] = v4;
    v7 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v11 = *v7;
    v9 = (char *)(v7 + 1);
    v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(_QWORD *)v8 = v10;
      a1[2] += 8;
      return;
    }
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v33 = 1;
      else
        v33 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>(v5, v33);
      v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      v8 = v35;
      v39 = a1[2] - (_QWORD)v38;
      if (v39)
      {
        v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          v42 = *v38++;
          *(_QWORD *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    v13 = v12 >> 3;
    v14 = v12 >> 3 < -1;
    v15 = (v12 >> 3) + 2;
    if (v14)
      v16 = v15;
    else
      v16 = v13 + 1;
    v17 = -(v16 >> 1);
    v18 = v16 >> 1;
    v19 = &v9[-8 * v18];
    v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      v9 = (char *)a1[1];
    }
    v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  v21 = a1[2];
  v22 = (v21 - a1[1]) >> 3;
  v23 = a1[3];
  v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(_QWORD *)&v54 = operator new(0x1000uLL);
      std::__split_buffer<dy_polymorphic_scalar_t *>::push_back(a1, &v54);
      return;
    }
    *(_QWORD *)&v54 = operator new(0x1000uLL);
    std::__split_buffer<dy_polymorphic_scalar_t *>::push_front((uint64_t)a1, &v54);
    v44 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v45 = *v44;
    v9 = (char *)(v44 + 1);
    v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3])
      goto LABEL_33;
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v46 = 1;
      else
        v46 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>((uint64_t)(a1 + 3), v46);
      v35 = &v34[8 * (v46 >> 2)];
      v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      v8 = v35;
      v49 = a1[2] - (_QWORD)v48;
      if (v49)
      {
        v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          v52 = *v48++;
          *(_QWORD *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1)
    v25 = 1;
  else
    v25 = v24 >> 2;
  v56 = a1 + 3;
  *(_QWORD *)&v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>((uint64_t)(a1 + 3), v25);
  *((_QWORD *)&v54 + 1) = v54 + 8 * v22;
  *(_QWORD *)&v55 = *((_QWORD *)&v54 + 1);
  *((_QWORD *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0x1000uLL);
  std::__split_buffer<dy_polymorphic_scalar_t *>::push_back(&v54, &v53);
  v27 = (_QWORD *)a1[2];
  v28 = -7 - (_QWORD)v27;
  while (v27 != (_QWORD *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<dy_polymorphic_scalar_t *>::push_front((uint64_t)&v54, v27);
  }
  v29 = (char *)*a1;
  v30 = v54;
  v31 = v55;
  *(_QWORD *)&v54 = *a1;
  *((_QWORD *)&v54 + 1) = v27;
  v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  v55 = v32;
  if (v27 != (_QWORD *)v32)
    *(_QWORD *)&v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  if (v29)
    operator delete(v29);
}

void sub_23C6F35D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  void *v13;

  operator delete(v13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

float *DYVec3Set(float *result, float a2, float a3, float a4)
{
  *result = a2;
  result[1] = a3;
  result[2] = a4;
  return result;
}

float32_t DYVec3Scale(float32x2_t *a1, float32x2_t *a2, float a3)
{
  float32_t result;

  *a2 = vmul_n_f32(*a1, a3);
  result = a1[1].f32[0] * a3;
  a2[1].f32[0] = result;
  return result;
}

float32_t DYVec3Add(float32x2_t *a1, float32x2_t *a2, float32x2_t *a3)
{
  float32_t result;

  *a3 = vadd_f32(*a1, *a2);
  result = a1[1].f32[0] + a2[1].f32[0];
  a3[1].f32[0] = result;
  return result;
}

float32_t DYVec3Subtract(float32x2_t *a1, float32x2_t *a2, float32x2_t *a3)
{
  float32_t result;

  *a3 = vsub_f32(*a1, *a2);
  result = a1[1].f32[0] - a2[1].f32[0];
  a3[1].f32[0] = result;
  return result;
}

float DYVec3Normalize(float *a1, float *a2)
{
  float v2;
  float v3;
  float v4;
  float result;

  v2 = a1[1];
  v3 = a1[2];
  v4 = sqrtf((float)((float)(v2 * v2) + (float)(*a1 * *a1)) + (float)(v3 * v3));
  *a2 = *a1 / v4;
  a2[1] = v2 / v4;
  result = v3 / v4;
  a2[2] = v3 / v4;
  return result;
}

float DYVec3Length(float *a1)
{
  return sqrtf((float)((float)(a1[1] * a1[1]) + (float)(*a1 * *a1)) + (float)(a1[2] * a1[2]));
}

float DYVec3LengthSquared(float *a1)
{
  return (float)((float)(a1[1] * a1[1]) + (float)(*a1 * *a1)) + (float)(a1[2] * a1[2]);
}

float DYVec3DotProduct(float *a1, float *a2)
{
  return (float)((float)(a1[1] * a2[1]) + (float)(*a1 * *a2)) + (float)(a1[2] * a2[2]);
}

float DYVec3Distance(float *a1, float *a2)
{
  float v2;
  float v3;

  v2 = a1[1] - a2[1];
  v3 = a1[2] - a2[2];
  return sqrtf((float)((float)(v2 * v2) + (float)((float)(*a1 - *a2) * (float)(*a1 - *a2))) + (float)(v3 * v3));
}

float DYVec3DistanceSquared(float *a1, float *a2)
{
  float v2;
  float v3;

  v2 = a1[1] - a2[1];
  v3 = a1[2] - a2[2];
  return (float)((float)(v2 * v2) + (float)((float)(*a1 - *a2) * (float)(*a1 - *a2))) + (float)(v3 * v3);
}

float DYVec3CrossProduct(float *a1, float *a2, float *a3)
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float result;
  float v9;

  v4 = a2[1];
  v3 = a2[2];
  v6 = a1[1];
  v5 = a1[2];
  v7 = (float)(v6 * v3) - (float)(v4 * v5);
  result = (float)(*a2 * v5) - (float)(*a1 * v3);
  v9 = (float)(*a1 * v4) - (float)(*a2 * v6);
  *a3 = v7;
  a3[1] = result;
  a3[2] = v9;
  return result;
}

float32_t DYVec3Lerp(float32x2_t *a1, float32x2_t *a2, float32x2_t *a3, float a4)
{
  float32_t result;

  *a3 = vmla_n_f32(*a1, vsub_f32(*a2, *a1), a4);
  result = a1[1].f32[0] + (float)((float)(a2[1].f32[0] - a1[1].f32[0]) * a4);
  a3[1].f32[0] = result;
  return result;
}

float DYVec3Reflect(float *a1, float *a2, float *a3)
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float result;

  v3 = a2[1];
  v4 = a2[2];
  v5 = sqrtf((float)((float)(v3 * v3) + (float)(*a2 * *a2)) + (float)(v4 * v4));
  v6 = *a2 / v5;
  v7 = v3 / v5;
  v8 = v4 / v5;
  v9 = a1[1];
  v10 = a1[2];
  v11 = (float)((float)(v9 * v7) + (float)(v6 * *a1)) + (float)(v8 * v10);
  v12 = v11 + v11;
  *a3 = *a1 - (float)(v6 * v12);
  a3[1] = v9 - (float)(v7 * v12);
  result = v10 - (float)(v8 * v12);
  a3[2] = result;
  return result;
}

float DYVec3Project(float *a1, float *a2, float *a3)
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float result;

  v3 = a2[1];
  v4 = a2[2];
  v5 = sqrtf((float)((float)(v3 * v3) + (float)(*a2 * *a2)) + (float)(v4 * v4));
  v6 = *a2 / v5;
  v7 = v3 / v5;
  v8 = v4 / v5;
  v9 = (float)((float)(a1[1] * v7) + (float)(v6 * *a1)) + (float)(v8 * a1[2]);
  *a3 = v6 * v9;
  a3[1] = v7 * v9;
  result = v8 * v9;
  a3[2] = v8 * v9;
  return result;
}

void *PrettifyFenumString(void *result, int a2, int a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;

  if (result)
  {
    v5 = result;
    if (objc_msgSend(result, "hasPrefix:", CFSTR("kDYFE")))
      v5 = (void *)objc_msgSend(v5, "substringFromIndex:", 5);
    v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("_"));
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      v5 = (void *)objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("_"), CFSTR(" "), 0, v6, v7);
    v8 = objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR(":"));
    v9 = CFSTR("+");
    if (!a2)
      v9 = CFSTR("-");
    if (a3)
      v10 = CFSTR(":");
    else
      v10 = &stru_250D63BC0;
    return (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@[%@%@]"), v9, v8, v10);
  }
  return result;
}

double DYMtxIdentity(_OWORD *a1)
{
  double result;

  *a1 = xmmword_23C70CC60;
  a1[1] = xmmword_23C70CC70;
  result = 0.0;
  a1[2] = xmmword_23C70CC80;
  a1[3] = xmmword_23C70CC90;
  return result;
}

double DYMtxScale(uint64_t a1, float a2, float a3, float a4)
{
  double result;

  *(float *)a1 = a2;
  *(float *)(a1 + 20) = a3;
  *(float *)(a1 + 40) = a4;
  result = 0.0;
  *(_OWORD *)(a1 + 4) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 44) = 0u;
  *(_DWORD *)(a1 + 60) = 1065353216;
  return result;
}

double DYMtxTranslate(uint64_t a1, float a2, float a3, float a4)
{
  double result;

  *(float *)(a1 + 48) = a2;
  *(float *)(a1 + 52) = a3;
  *(float *)(a1 + 56) = a4;
  *(_OWORD *)a1 = xmmword_23C70CC60;
  *(_OWORD *)(a1 + 16) = xmmword_23C70CC70;
  result = 0.0;
  *(_OWORD *)(a1 + 32) = xmmword_23C70CC80;
  *(_DWORD *)(a1 + 60) = 1065353216;
  return result;
}

double DYMtxRotateZ(uint64_t a1, float a2)
{
  __float2 v3;
  double result;

  v3 = __sincosf_stret((float)(a2 * 3.1416) / 180.0);
  *(float *)a1 = v3.__cosval;
  *(float *)(a1 + 4) = v3.__sinval;
  *(float *)(a1 + 16) = -v3.__sinval;
  *(float *)(a1 + 20) = v3.__cosval;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_OWORD *)(a1 + 40) = xmmword_23C70CC60;
  result = 0.0078125;
  *(_QWORD *)(a1 + 56) = 0x3F80000000000000;
  return result;
}

float DYMtxRotateAxis(uint64_t a1, float a2, float a3, float a4, float a5)
{
  __float2 v9;
  uint64_t v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float result;
  uint64_t v17;
  int v18;
  uint64_t v19;
  float v20;

  v9 = __sincosf_stret((float)(a2 * 3.1416) / 180.0);
  v20 = 0.0;
  v19 = 0;
  v18 = 0;
  v17 = 0;
  DYVec3Set((float *)&v17, a3, a4, a5);
  DYVec3Normalize((float *)&v17, (float *)&v19);
  v10 = v19;
  v11 = v20;
  v12 = (float)((float)(*(float *)&v19 * *((float *)&v19 + 1)) * (float)(1.0 - v9.__cosval))
      - (float)(v20 * v9.__sinval);
  v13 = *(float *)&v19 * v20;
  v14 = (float)(v9.__sinval * v20)
      + (float)((float)(*(float *)&v19 * *((float *)&v19 + 1)) * (float)(1.0 - v9.__cosval));
  v15 = (float)(v9.__sinval * *((float *)&v19 + 1))
      + (float)((float)(*(float *)&v19 * v20) * (float)(1.0 - v9.__cosval));
  *(float *)a1 = v9.__cosval + (float)((float)(*(float *)&v19 * *(float *)&v19) * (float)(1.0 - v9.__cosval));
  *(float *)(a1 + 4) = v14;
  *(float *)(a1 + 16) = v12;
  *(float *)(a1 + 20) = v9.__cosval
                      + (float)((float)(*((float *)&v10 + 1) * *((float *)&v10 + 1)) * (float)(1.0 - v9.__cosval));
  *(float *)(a1 + 32) = v15;
  *(float *)(a1 + 36) = (float)((float)(*((float *)&v10 + 1) * v11) * (float)(1.0 - v9.__cosval))
                      - (float)(*(float *)&v10 * v9.__sinval);
  *(float *)(a1 + 8) = (float)(v13 * (float)(1.0 - v9.__cosval)) - (float)(*((float *)&v10 + 1) * v9.__sinval);
  *(float *)(a1 + 24) = (float)(v9.__sinval * *(float *)&v10)
                      + (float)((float)(*((float *)&v10 + 1) * v11) * (float)(1.0 - v9.__cosval));
  result = v9.__cosval + (float)((float)(v11 * v11) * (float)(1.0 - v9.__cosval));
  *(float *)(a1 + 40) = result;
  *(_DWORD *)(a1 + 12) = 0;
  *(_DWORD *)(a1 + 28) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 44) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  *(_DWORD *)(a1 + 60) = 1065353216;
  return result;
}

float DYMtxTranspose(uint64_t a1, _DWORD *a2)
{
  float result;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;

  result = *(float *)a1;
  v3 = *(_DWORD *)(a1 + 4);
  v4 = *(_DWORD *)(a1 + 8);
  v5 = *(_DWORD *)(a1 + 12);
  v6 = *(_DWORD *)(a1 + 16);
  v7 = *(_DWORD *)(a1 + 20);
  v8 = *(_DWORD *)(a1 + 24);
  v9 = *(_DWORD *)(a1 + 28);
  v10 = *(_DWORD *)(a1 + 32);
  v11 = *(_DWORD *)(a1 + 36);
  v12 = *(_DWORD *)(a1 + 40);
  v13 = *(_DWORD *)(a1 + 44);
  v14 = *(_DWORD *)(a1 + 48);
  v15 = *(_DWORD *)(a1 + 52);
  v16 = *(_DWORD *)(a1 + 56);
  v17 = *(_DWORD *)(a1 + 60);
  *a2 = *(_DWORD *)a1;
  a2[1] = v6;
  a2[2] = v10;
  a2[3] = v14;
  a2[4] = v3;
  a2[5] = v7;
  a2[6] = v11;
  a2[7] = v15;
  a2[8] = v4;
  a2[9] = v8;
  a2[10] = v12;
  a2[11] = v16;
  a2[12] = v5;
  a2[13] = v9;
  a2[14] = v13;
  a2[15] = v17;
  return result;
}

float DYMtxSubtract(float *a1, float *a2, float *a3)
{
  float result;

  *a3 = *a1 - *a2;
  a3[4] = a1[4] - a2[4];
  a3[8] = a1[8] - a2[8];
  a3[12] = a1[12] - a2[12];
  a3[1] = a1[1] - a2[1];
  a3[5] = a1[5] - a2[5];
  a3[9] = a1[9] - a2[9];
  a3[13] = a1[13] - a2[13];
  a3[2] = a1[2] - a2[2];
  a3[6] = a1[6] - a2[6];
  a3[10] = a1[10] - a2[10];
  a3[14] = a1[14] - a2[14];
  a3[3] = a1[3] - a2[3];
  a3[7] = a1[7] - a2[7];
  a3[11] = a1[11] - a2[11];
  result = a1[15] - a2[15];
  a3[15] = result;
  return result;
}

float DYMtxConcat(float *a1, float *a2, float *a3)
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float result;
  float v51;
  float v52;

  v3 = a2[1];
  v4 = a1[1];
  v5 = a1[4];
  v6 = a1[5];
  v7 = a2[2];
  v8 = a2[3];
  v9 = a1[8];
  v10 = a1[9];
  v11 = a1[12];
  v12 = a1[13];
  v13 = (float)((float)((float)((float)(*a1 * *a2) + 0.0) + (float)(v5 * v3)) + (float)(v9 * v7)) + (float)(v11 * v8);
  v14 = a2[4];
  v15 = a2[5];
  v16 = a2[6];
  v17 = a2[7];
  v18 = (float)((float)((float)((float)(*a1 * v14) + 0.0) + (float)(v5 * v15)) + (float)(v9 * v16)) + (float)(v11 * v17);
  v19 = a2[8];
  v20 = a2[9];
  v21 = a2[10];
  v22 = a2[11];
  v23 = (float)((float)((float)((float)(*a1 * v19) + 0.0) + (float)(v5 * v20)) + (float)(v9 * v21)) + (float)(v11 * v22);
  v24 = a2[12];
  v25 = a2[13];
  v26 = (float)((float)(*a1 * v24) + 0.0) + (float)(v5 * v25);
  v27 = a2[14];
  v28 = a2[15];
  v51 = (float)(v26 + (float)(v9 * v27)) + (float)(v11 * v28);
  v52 = v13;
  v29 = (float)((float)((float)((float)(v4 * *a2) + 0.0) + (float)(v6 * v3)) + (float)(v10 * v7)) + (float)(v12 * v8);
  v30 = (float)((float)((float)((float)(v4 * v14) + 0.0) + (float)(v6 * v15)) + (float)(v10 * v16)) + (float)(v12 * v17);
  v31 = (float)((float)((float)((float)(v4 * v19) + 0.0) + (float)(v6 * v20)) + (float)(v10 * v21)) + (float)(v12 * v22);
  v32 = (float)((float)((float)((float)(v4 * v24) + 0.0) + (float)(v6 * v25)) + (float)(v10 * v27)) + (float)(v12 * v28);
  v33 = a1[2];
  v34 = a1[3];
  v35 = a1[6];
  v36 = a1[7];
  v37 = (float)((float)(v33 * *a2) + 0.0) + (float)(v35 * v3);
  v38 = (float)((float)(v33 * v14) + 0.0) + (float)(v35 * v15);
  v39 = (float)((float)(v33 * v19) + 0.0) + (float)(v35 * v20);
  v40 = (float)((float)(v33 * v24) + 0.0) + (float)(v35 * v25);
  v42 = a1[10];
  v41 = a1[11];
  v43 = v37 + (float)(v42 * v7);
  v44 = v38 + (float)(v42 * v16);
  v45 = v39 + (float)(v42 * v21);
  v46 = v40 + (float)(v42 * v27);
  v48 = a1[14];
  v47 = a1[15];
  v49 = (float)((float)((float)((float)(v34 * *a2) + 0.0) + (float)(v36 * a2[1])) + (float)(v41 * v7))
      + (float)(v47 * v8);
  *a3 = v52;
  a3[1] = v29;
  a3[2] = v43 + (float)(v48 * v8);
  a3[3] = v49;
  a3[4] = v18;
  a3[5] = v30;
  a3[6] = v44 + (float)(v48 * v17);
  a3[7] = (float)((float)((float)((float)(v34 * v14) + 0.0) + (float)(v36 * v15)) + (float)(v41 * v16))
        + (float)(v47 * v17);
  a3[8] = v23;
  a3[9] = v31;
  a3[10] = v45 + (float)(v48 * v22);
  a3[11] = (float)((float)((float)((float)(v34 * v19) + 0.0) + (float)(v36 * v20)) + (float)(v41 * v21))
         + (float)(v47 * v22);
  a3[12] = v51;
  a3[13] = v32;
  result = (float)((float)((float)((float)(v34 * v24) + 0.0) + (float)(v36 * v25)) + (float)(v41 * v27))
         + (float)(v47 * v28);
  a3[14] = v46 + (float)(v48 * v28);
  a3[15] = result;
  return result;
}

float32x2_t DYMtxMultVec3(float32x2_t *a1, float *a2, float32x2_t *a3)
{
  float v3;
  float v4;
  float32_t v5;
  float32x2_t result;

  v3 = a2[1];
  v4 = a2[2];
  v5 = a1[7].f32[0]
     + (float)((float)((float)(v3 * a1[3].f32[0]) + (float)(a1[1].f32[0] * *a2)) + (float)(a1[5].f32[0] * v4));
  result = vadd_f32(vmla_n_f32(vmla_n_f32(vmul_n_f32(a1[2], v3), *a1, *a2), a1[4], v4), a1[6]);
  *a3 = result;
  a3[1].f32[0] = v5;
  return result;
}

float32x2_t DYMtxMult3x3Vec3(float32x2_t *a1, float *a2, float32x2_t *a3)
{
  float v3;
  float v4;
  float32_t v5;
  float32x2_t result;

  v3 = a2[1];
  v4 = a2[2];
  v5 = (float)((float)(v3 * a1[3].f32[0]) + (float)(a1[1].f32[0] * *a2)) + (float)(a1[5].f32[0] * v4);
  result = a1[4];
  *a3 = vmla_n_f32(vmla_n_f32(vmul_n_f32(a1[2], v3), *a1, *a2), result, v4);
  a3[1].f32[0] = v5;
  return result;
}

float32x4_t DYMtxMultVec4(float32x4_t *a1, float *a2, float32x4_t *a3)
{
  float32x4_t result;

  result = a1[2];
  *a3 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(a1[1], a2[1]), *a1, *a2), result, a2[2]), a1[3], a2[3]);
  return result;
}

float DYMtxFrobeniusNorm(float *a1)
{
  float v1;
  float v2;
  float v3;
  float v4;
  float v5;

  v1 = a1[3];
  v2 = a1[7];
  v3 = a1[11];
  v4 = a1[14];
  v5 = a1[15];
  return sqrtf((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(*a1 * *a1) + 0.0) + (float)(a1[4] * a1[4])) + (float)(a1[8] * a1[8])) + (float)(a1[12] * a1[12]))+ (float)(a1[1] * a1[1]))+ (float)(a1[5] * a1[5]))+ (float)(a1[9] * a1[9]))+ (float)(a1[13] * a1[13]))+ (float)(a1[2] * a1[2]))+ (float)(a1[6] * a1[6]))+ (float)(a1[10] * a1[10]))+ (float)(v4 * v4))+ (float)(v1 * v1))+ (float)(v2 * v2))+ (float)(v3 * v3))+ (float)(v5 * v5));
}

double DYMtxFrustum(uint64_t a1, float a2, float a3, float a4, float a5, float a6, float a7)
{
  double result;

  *(float *)a1 = (float)(a6 + a6) / (float)(a3 - a2);
  *(float *)(a1 + 20) = (float)(a6 + a6) / (float)(a5 - a4);
  *(float *)(a1 + 32) = (float)(a2 + a3) / (float)(a3 - a2);
  *(float *)(a1 + 36) = (float)(a4 + a5) / (float)(a5 - a4);
  *(_DWORD *)(a1 + 52) = 0;
  *(float *)(a1 + 40) = (float)-(float)(a6 + a7) / (float)(a7 - a6);
  *(float *)(a1 + 56) = (float)((float)(a7 * -2.0) * a6) / (float)(a7 - a6);
  *(_DWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 4) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)&result = 3212836864;
  *(_QWORD *)(a1 + 44) = 3212836864;
  *(_DWORD *)(a1 + 60) = 0;
  return result;
}

double DYMtxOrtho(uint64_t a1, float a2, float a3, float a4, float a5, float a6, float a7)
{
  double result;

  *(float *)a1 = 2.0 / (float)(a3 - a2);
  *(float *)(a1 + 20) = 2.0 / (float)(a5 - a4);
  *(float *)(a1 + 48) = (float)-(float)(a2 + a3) / (float)(a3 - a2);
  *(float *)(a1 + 52) = (float)-(float)(a4 + a5) / (float)(a5 - a4);
  *(float *)(a1 + 40) = -2.0 / (float)(a7 - a6);
  *(float *)(a1 + 56) = (float)-(float)(a6 + a7) / (float)(a7 - a6);
  result = 0.0;
  *(_OWORD *)(a1 + 4) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 44) = 0;
  *(_DWORD *)(a1 + 60) = 1065353216;
  return result;
}

float DYMtxGetColumnMajor(uint64_t a1, uint64_t a2)
{
  float result;

  *(_DWORD *)a2 = *(_DWORD *)a1;
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(a1 + 4);
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(a1 + 8);
  *(_DWORD *)(a2 + 12) = *(_DWORD *)(a1 + 12);
  *(_DWORD *)(a2 + 16) = *(_DWORD *)(a1 + 16);
  *(_DWORD *)(a2 + 20) = *(_DWORD *)(a1 + 20);
  *(_DWORD *)(a2 + 24) = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a2 + 28) = *(_DWORD *)(a1 + 28);
  *(_DWORD *)(a2 + 32) = *(_DWORD *)(a1 + 32);
  *(_DWORD *)(a2 + 36) = *(_DWORD *)(a1 + 36);
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a1 + 40);
  *(_DWORD *)(a2 + 44) = *(_DWORD *)(a1 + 44);
  *(_DWORD *)(a2 + 48) = *(_DWORD *)(a1 + 48);
  *(_DWORD *)(a2 + 52) = *(_DWORD *)(a1 + 52);
  *(_DWORD *)(a2 + 56) = *(_DWORD *)(a1 + 56);
  result = *(float *)(a1 + 60);
  *(float *)(a2 + 60) = result;
  return result;
}

float DYMtxSetColumnMajor(uint64_t a1, uint64_t a2)
{
  float result;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  result = *(float *)(a2 + 60);
  *(float *)(a1 + 60) = result;
  return result;
}

float *DYMtxInverse(float *result, int a2, uint64_t a3, double a4, double a5, double a6)
{
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float32_t v27;
  float v28;
  float32_t v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float32_t v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float32_t v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float32x2_t v87;
  float32x2_t v88;
  float v89;
  float v90;
  float32x4_t v91;
  float32x4_t v92;
  float32x2_t v93;
  float v94;

  v6 = result[10];
  v7 = result[14];
  v8 = result[5];
  v9 = result[6];
  v10 = result[9];
  v11 = result[13];
  v12 = result[1];
  v13 = result[2];
  v14 = result[15];
  v15 = result[11];
  v16 = (float)(v6 * v14) - (float)(v15 * v7);
  v17 = result[7];
  v18 = (float)(v9 * v14) - (float)(v17 * v7);
  v19 = (float)(v9 * v15) - (float)(v17 * v6);
  v20 = (float)((float)((float)(v8 * v16) + 0.0) - (float)(v10 * v18)) + (float)(v11 * v19);
  v21 = result[3];
  v22 = (float)(v13 * v14) - (float)(v21 * v7);
  v23 = (float)(v13 * v15) - (float)(v21 * v6);
  v24 = (float)((float)((float)(v12 * v16) + 0.0) - (float)(v10 * v22)) + (float)(v11 * v23);
  v25 = -v24;
  v26 = (float)(v13 * v17) - (float)(v21 * v9);
  v27 = (float)((float)((float)(v12 * v18) + 0.0) - (float)(v8 * v22)) + (float)(v11 * v26);
  v28 = (float)((float)((float)(v12 * v19) + 0.0) - (float)(v8 * v23)) + (float)(v10 * v26);
  v29 = -v28;
  v30 = (float)((float)((float)((float)(v20 * *result) + 0.0) - (float)(v24 * result[4])) + (float)(v27 * result[8]))
      - (float)(v28 * result[12]);
  v31 = result[10];
  v32 = result[14];
  v33 = result[6];
  v34 = result[15];
  v35 = result[11];
  v36 = (float)(v31 * v34) - (float)(v35 * v32);
  v37 = result[4];
  v38 = result[7];
  v39 = (float)(v33 * v34) - (float)(v38 * v32);
  v40 = result[8];
  v41 = (float)(v33 * v35) - (float)(v38 * v31);
  v42 = result[12];
  v43 = -(float)((float)((float)((float)(v37 * v36) + 0.0) - (float)(v40 * v39)) + (float)(v42 * v41));
  v44 = result[3];
  v45 = (float)(v13 * v34) - (float)(v44 * v32);
  v46 = (float)(v13 * v35) - (float)(v44 * v31);
  v47 = (float)((float)((float)(*result * v36) + 0.0) - (float)(v40 * v45)) + (float)(v42 * v46);
  v48 = (float)(v13 * v38) - (float)(v44 * v33);
  v91.f32[3] = v27;
  v92.f32[0] = -(float)((float)((float)((float)(*result * v39) + 0.0) - (float)(v37 * v45)) + (float)(v42 * v48));
  v49 = result[9];
  v50 = result[13];
  v51 = v37;
  v52 = result[5];
  v53 = (float)((float)((float)(*result * v41) + 0.0) - (float)(v37 * v46)) + (float)(v40 * v48);
  v54 = v40;
  v55 = v42;
  v92.f32[3] = v29;
  v93.f32[0] = v53;
  v56 = result[1];
  v57 = result[15];
  v58 = result[11];
  v59 = (float)(v49 * v57) - (float)(v58 * v50);
  v60 = result[7];
  v61 = (float)(v52 * v57) - (float)(v60 * v50);
  v62 = (float)(v52 * v58) - (float)(v60 * v49);
  v88.f32[0] = v43;
  v88.f32[1] = (float)((float)((float)(v51 * v59) + 0.0) - (float)(v40 * v61)) + (float)(v55 * v62);
  v63 = result[3];
  v64 = (float)(v56 * v57) - (float)(v63 * v50);
  v65 = (float)(v56 * v58) - (float)(v63 * v49);
  v66 = result[4];
  v67 = v52;
  v68 = result[6];
  v91.f32[0] = v47;
  v91.f32[1] = -(float)((float)((float)((float)(*result * v59) + 0.0) - (float)(v54 * v64)) + (float)(v55 * v65));
  v69 = (float)(v56 * v60) - (float)(v63 * v52);
  v70 = (float)((float)((float)(*result * v61) + 0.0) - (float)(v51 * v64)) + (float)(v55 * v69);
  v71 = -(float)((float)((float)((float)(*result * v62) + 0.0) - (float)(v51 * v65)) + (float)(v54 * v69));
  v72 = result[9];
  v73 = result[14];
  v74 = result[10];
  v75 = result[13];
  v76 = (float)(v72 * v73) - (float)(v74 * v75);
  v77 = (float)(v67 * v73) - (float)(v68 * v75);
  v78 = result[8];
  v79 = (float)(v67 * v74) - (float)(v68 * v72);
  v80 = result[12];
  v81 = result[1];
  v89 = -(float)((float)((float)((float)(v66 * v76) + 0.0) - (float)(v78 * v77)) + (float)(v80 * v79));
  v90 = v25;
  v82 = result[2];
  v83 = (float)(v81 * v73) - (float)(v82 * v75);
  v84 = (float)(v81 * v74) - (float)(v82 * v72);
  v91.f32[2] = (float)((float)((float)(*result * v76) + 0.0) - (float)(v78 * v83)) + (float)(v80 * v84);
  v85 = (float)(v81 * v68) - (float)(v82 * v67);
  v92.f32[1] = v70;
  v92.f32[2] = -(float)((float)((float)((float)(*result * v77) + 0.0) - (float)(v66 * v83)) + (float)(v80 * v85));
  v93.f32[1] = v71;
  v94 = (float)((float)((float)(*result * v79) + 0.0) - (float)(v66 * v84)) + (float)(v78 * v85);
  if (v30 != 0.0)
  {
    *(float *)&a6 = 1.0 / v30;
    *(float *)a3 = (float)(1.0 / v30) * v20;
    v86 = (float)(1.0 / v30) * v90;
    if (a2)
    {
      v87 = (float32x2_t)vdupq_lane_s32(*(int32x2_t *)&a6, 0).u64[0];
      *(float32x2_t *)(a3 + 4) = vmul_f32(v87, v88);
      *(float32x2_t *)(a3 + 52) = vmul_f32(v87, v93);
      *(float *)(a3 + 12) = *(float *)&a6 * v89;
      *(float *)(a3 + 16) = v86;
      *(float32x4_t *)(a3 + 20) = vmulq_n_f32(v91, *(float *)&a6);
      *(float32x4_t *)(a3 + 36) = vmulq_n_f32(v92, *(float *)&a6);
    }
    else
    {
      *(float *)(a3 + 4) = v86;
      *(float *)(a3 + 8) = *(float *)&a6 * v91.f32[3];
      *(float *)(a3 + 12) = *(float *)&a6 * v92.f32[3];
      *(float *)(a3 + 16) = *(float *)&a6 * v88.f32[0];
      *(float *)(a3 + 20) = *(float *)&a6 * v47;
      *(float *)(a3 + 24) = *(float *)&a6 * v92.f32[0];
      *(float *)(a3 + 28) = *(float *)&a6 * v93.f32[0];
      *(float *)(a3 + 32) = *(float *)&a6 * v88.f32[1];
      *(float *)(a3 + 36) = *(float *)&a6 * v91.f32[1];
      *(float *)(a3 + 40) = *(float *)&a6 * v70;
      *(float *)(a3 + 44) = *(float *)&a6 * v71;
      *(float *)(a3 + 48) = *(float *)&a6 * v89;
      *(float *)(a3 + 52) = *(float *)&a6 * v91.f32[2];
      *(float *)(a3 + 56) = *(float *)&a6 * v92.f32[2];
    }
    *(float *)(a3 + 60) = *(float *)&a6 * v94;
  }
  return result;
}

float DYMtxNormalizedFrobeniusNormDelta(float *a1, float *a2)
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v33;
  float v34;
  float v35;

  v2 = *a1;
  v3 = a1[1];
  v35 = *a2;
  v4 = a1[4];
  v5 = a1[5];
  v6 = a2[4];
  v33 = a2[1];
  v34 = a2[5];
  v7 = a1[8];
  v8 = a1[9];
  v10 = a2[8];
  v9 = a2[9];
  v11 = a1[12];
  v12 = a1[13];
  v14 = a2[12];
  v13 = a2[13];
  v15 = a1[2];
  v16 = a1[3];
  v17 = a2[2];
  v18 = a2[3];
  v19 = a1[6];
  v20 = a1[7];
  v21 = a2[6];
  v22 = a2[7];
  v23 = a1[10];
  v24 = a1[11];
  v25 = a2[10];
  v26 = a2[11];
  v28 = a1[14];
  v27 = a1[15];
  v29 = a2[14];
  v30 = a2[15];
  v31 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v2 - v35) * (float)(v2 - v35)) + 0.0) + (float)((float)(v4 - v6) * (float)(v4 - v6))) + (float)((float)(v7 - v10) * (float)(v7 - v10))) + (float)((float)(v11 - v14) * (float)(v11 - v14)))
                                                                                              + (float)((float)(v3 - v33) * (float)(v3 - v33)))
                                                                                      + (float)((float)(v5 - v34)
                                                                                              * (float)(v5 - v34)))
                                                                              + (float)((float)(v8 - v9)
                                                                                      * (float)(v8 - v9)))
                                                                      + (float)((float)(v12 - v13) * (float)(v12 - v13)))
                                                              + (float)((float)(v15 - v17) * (float)(v15 - v17)))
                                                      + (float)((float)(v19 - v21) * (float)(v19 - v21)))
                                              + (float)((float)(v23 - v25) * (float)(v23 - v25)))
                                      + (float)((float)(v28 - v29) * (float)(v28 - v29)))
                              + (float)((float)(v16 - v18) * (float)(v16 - v18)))
                      + (float)((float)(v20 - v22) * (float)(v20 - v22)))
              + (float)((float)(v24 - v26) * (float)(v24 - v26)))
      + (float)((float)(v27 - v30) * (float)(v27 - v30));
  return sqrtf(v31)
       / (float)((float)(sqrtf((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v2 * v2) + 0.0) + (float)(v4 * v4)) + (float)(v7 * v7)) + (float)(v11 * v11)) + (float)(v3 * v3)) + (float)(v5 * v5))+ (float)(v8 * v8))+ (float)(v12 * v12))+ (float)(v15 * v15))+ (float)(v19 * v19))+ (float)(v23 * v23))+ (float)(v28 * v28))+ (float)(v16 * v16))+ (float)(v20 * v20))+ (float)(v24 * v24))+ (float)(v27 * v27))+ sqrtf((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v35 * v35) + 0.0) + (float)(v6 * v6)) + (float)(v10 * v10)) + (float)(v14 * v14)) + (float)(v33 * v33)) + (float)(v34 * v34))+ (float)(v9 * v9))+ (float)(v13 * v13))+ (float)(v17 * v17))+ (float)(v21 * v21))+ (float)(v25 * v25))+ (float)(v29 * v29))
                                                 + (float)(v18 * v18))
                                         + (float)(v22 * v22))
                                 + (float)(v26 * v26))
                         + (float)(v30 * v30)))
               * 0.5);
}

BOOL DYMtxDecomposition(float *a1, uint64_t a2, uint64_t a3, uint64_t a4, float *a5, double a6, double a7, double a8)
{
  float v13;
  float v14;
  float v15;
  float v16;
  __int128 v17;
  double v18;
  _BOOL8 result;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  int v25;
  double v26;
  __int128 v27;
  double v28;
  int v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float v104;
  float v105;
  float v106;
  float v107;
  float v108;
  float v109;
  float v110;
  float v111;
  float v112;
  float v113;
  float v114;
  float v115;
  float v116;
  float v117;
  float v118;
  float v119;
  float v120;
  float v121;
  float v122;
  float v123;
  float v124;
  float v125;
  float v126;
  float v127;
  float v128;
  float v129;
  float v130;
  float v131;
  float v132;
  float v133;
  float v134;
  float v135;
  float v136;
  float v137;
  float v138;
  float v139;
  float v140;
  float v141;
  float v142;
  float v143;
  float v144;
  float v145;
  float v146;
  float v147;
  float v148;
  float v149;
  float v150;
  float v151;
  float v152;
  float v153;
  float v154;
  float v155;
  float v156;
  float v157;
  float v158;
  float v159;
  float v160;
  float v161;
  float v162;
  float v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  _BYTE v174[32];
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;

  v177 = 0u;
  v178 = 0u;
  v175 = 0u;
  v176 = 0u;
  v13 = a1[3];
  v14 = a1[7];
  v15 = a1[11];
  v16 = a1[15];
  v17 = *((_OWORD *)a1 + 1);
  v172 = *(_OWORD *)a1;
  v173 = v17;
  *(_OWORD *)v174 = *((_OWORD *)a1 + 2);
  *(_OWORD *)&v174[12] = *(_OWORD *)(a1 + 11);
  v18 = *(double *)&v174[12];
  HIDWORD(v172) = 0;
  HIDWORD(v173) = 0;
  *(_DWORD *)&v174[12] = 0;
  *(_DWORD *)&v174[28] = 1065353216;
  DYMtxInverse((float *)&v172, 1, (uint64_t)&v175, v18, *(double *)&v17, a8);
  result = 0;
  if (fabsf(v20) >= 0.0001)
  {
    v21 = (float)((float)((float)(*(float *)&v176 * v14) + (float)(*(float *)&v175 * v13))
                + (float)(*(float *)&v177 * v15))
        + (float)(*(float *)&v178 * v16);
    v22 = (float)((float)((float)(v14 * *((float *)&v176 + 1)) + (float)(*((float *)&v175 + 1) * v13))
                + (float)(*((float *)&v177 + 1) * v15))
        + (float)(*((float *)&v178 + 1) * v16);
    v23 = (float)((float)((float)(v14 * *((float *)&v176 + 2)) + (float)(*((float *)&v175 + 2) * v13))
                + (float)(*((float *)&v177 + 2) * v15))
        + (float)(*((float *)&v178 + 2) * v16);
    v24 = (float)((float)((float)(v14 * *((float *)&v176 + 3)) + (float)(*((float *)&v175 + 3) * v13))
                + (float)(*((float *)&v177 + 3) * v15))
        + (float)(*((float *)&v178 + 3) * v16);
    *(_QWORD *)a2 = 1065353216;
    *(_QWORD *)(a2 + 16) = 0x3F80000000000000;
    *(_QWORD *)(a2 + 32) = 0;
    *(_QWORD *)(a2 + 48) = 0;
    *(_DWORD *)(a2 + 8) = 0;
    *(_DWORD *)(a2 + 24) = 0;
    *(_DWORD *)(a2 + 40) = 1065353216;
    *(_DWORD *)(a2 + 56) = 0;
    *(float *)(a2 + 12) = v21;
    *(float *)(a2 + 28) = v22;
    *(float *)(a2 + 44) = v23;
    *(float *)(a2 + 60) = v24;
    v25 = *(_DWORD *)&v174[24];
    v26 = 0.0078125;
    *(_OWORD *)a3 = xmmword_23C70CC60;
    *(_OWORD *)(a3 + 16) = xmmword_23C70CC70;
    *(_OWORD *)(a3 + 32) = xmmword_23C70CC80;
    *(_QWORD *)(a3 + 48) = *(_QWORD *)&v174[16];
    *(_DWORD *)(a3 + 56) = v25;
    *(_DWORD *)(a3 + 60) = 1065353216;
    *(_OWORD *)&v174[16] = xmmword_23C70CC90;
    *(_OWORD *)(a4 + 32) = *(_OWORD *)v174;
    *(_OWORD *)(a4 + 48) = xmmword_23C70CC90;
    v28 = *(double *)&v172;
    v27 = v173;
    *(_OWORD *)a4 = v172;
    *(_OWORD *)(a4 + 16) = v27;
    v29 = 19;
    do
    {
      v170 = 0u;
      v171 = 0u;
      v168 = 0u;
      v169 = 0u;
      DYMtxInverse((float *)a4, 1, (uint64_t)&v168, 0.0, v28, v26);
      v30 = *(float *)(a4 + 4);
      v31 = *(float *)(a4 + 16);
      LODWORD(v28) = *(_DWORD *)(a4 + 20);
      v33 = *(float *)(a4 + 32);
      v32 = *(float *)(a4 + 36);
      v35 = *(float *)(a4 + 48);
      v34 = *(float *)(a4 + 52);
      v36 = *(float *)(a4 + 8);
      v37 = *(float *)(a4 + 12);
      v39 = *(float *)(a4 + 24);
      v38 = *(float *)(a4 + 28);
      v40 = (float)(*(float *)a4 + *(float *)&v168) * 0.5;
      *(float *)&v26 = (float)(v31 + *(float *)&v169) * 0.5;
      v41 = (float)(v33 + *(float *)&v170) * 0.5;
      v42 = (float)((float)((float)((float)(v40 - *(float *)a4) * (float)(v40 - *(float *)a4)) + 0.0)
                  + (float)((float)(*(float *)&v26 - v31) * (float)(*(float *)&v26 - v31)))
          + (float)((float)(v41 - v33) * (float)(v41 - v33));
      v43 = (float)(v35 + *(float *)&v171) * 0.5;
      v44 = (float)(v30 + *((float *)&v168 + 1)) * 0.5;
      v45 = (float)(v42 + (float)((float)(v43 - v35) * (float)(v43 - v35)))
          + (float)((float)(v44 - v30) * (float)(v44 - v30));
      v46 = *(float *)(a4 + 40);
      v47 = *(float *)(a4 + 44);
      v48 = (float)(*(float *)&v28 + *((float *)&v169 + 1)) * 0.5;
      v49 = (float)(v32 + *((float *)&v170 + 1)) * 0.5;
      v50 = (float)(v34 + *((float *)&v171 + 1)) * 0.5;
      v51 = (float)(v36 + *((float *)&v168 + 2)) * 0.5;
      *(float *)&v28 = (float)((float)((float)(v45
                                             + (float)((float)(v48 - *(float *)&v28) * (float)(v48 - *(float *)&v28)))
                                     + (float)((float)(v49 - v32) * (float)(v49 - v32)))
                             + (float)((float)(v50 - v34) * (float)(v50 - v34)))
                     + (float)((float)(v51 - v36) * (float)(v51 - v36));
      v52 = *(float *)(a4 + 56);
      v53 = *(float *)(a4 + 60);
      v54 = (float)(v39 + *((float *)&v169 + 2)) * 0.5;
      v55 = (float)(v46 + *((float *)&v170 + 2)) * 0.5;
      *(float *)&v28 = (float)(*(float *)&v28 + (float)((float)(v54 - v39) * (float)(v54 - v39)))
                     + (float)((float)(v55 - v46) * (float)(v55 - v46));
      v56 = (float)(v52 + *((float *)&v171 + 2)) * 0.5;
      *(float *)&v28 = *(float *)&v28 + (float)((float)(v56 - v52) * (float)(v56 - v52));
      v57 = (float)(v37 + *((float *)&v168 + 3)) * 0.5;
      *(float *)&v28 = *(float *)&v28 + (float)((float)(v57 - v37) * (float)(v57 - v37));
      v58 = (float)(v38 + *((float *)&v169 + 3)) * 0.5;
      v59 = (float)(v47 + *((float *)&v170 + 3)) * 0.5;
      *(float *)&v28 = (float)(*(float *)&v28 + (float)((float)(v58 - v38) * (float)(v58 - v38)))
                     + (float)((float)(v59 - v47) * (float)(v59 - v47));
      v60 = (float)(v53 + *((float *)&v171 + 3)) * 0.5;
      *(float *)&v28 = sqrtf(*(float *)&v28 + (float)((float)(v60 - v53) * (float)(v60 - v53)));
      *(float *)a4 = v40;
      *(float *)(a4 + 4) = v44;
      *(float *)(a4 + 8) = v51;
      *(float *)(a4 + 12) = v57;
      *(_DWORD *)(a4 + 16) = LODWORD(v26);
      *(float *)(a4 + 20) = v48;
      *(float *)(a4 + 24) = v54;
      *(float *)(a4 + 28) = v58;
      *(float *)(a4 + 32) = v41;
      *(float *)(a4 + 36) = v49;
      *(float *)(a4 + 40) = v55;
      *(float *)(a4 + 44) = v59;
      *(float *)(a4 + 48) = v43;
      *(float *)(a4 + 52) = v50;
      *(float *)(a4 + 56) = v56;
      *(float *)(a4 + 60) = v60;
    }
    while (*(float *)&v28 >= 0.000001 && v29-- != 0);
    v170 = 0u;
    v171 = 0u;
    v168 = 0u;
    v169 = 0u;
    DYMtxInverse((float *)a4, 0, (uint64_t)&v168, 0.0, v28, v26);
    v62 = (float)((float)((float)((float)(*(float *)&v168 * *(float *)&v173) + 0.0)
                        + (float)(*(float *)&v169 * *((float *)&v173 + 1)))
                + (float)(*(float *)&v170 * *((float *)&v173 + 2)))
        + (float)(*(float *)&v171 * 0.0);
    v63 = (float)((float)((float)((float)(*(float *)&v168 * *(float *)v174) + 0.0)
                        + (float)(*(float *)&v169 * *(float *)&v174[4]))
                + (float)(*(float *)&v170 * *(float *)&v174[8]))
        + (float)(*(float *)&v171 * 0.0);
    v64 = *(float *)&v171
        + (float)((float)((float)((float)(*(float *)&v168 * *(float *)&v174[16]) + 0.0) + (float)(*(float *)&v169 * 0.0))
                + (float)(*(float *)&v170 * 0.0));
    v65 = (float)((float)((float)((float)(*((float *)&v168 + 1) * *(float *)&v172) + 0.0)
                        + (float)(*((float *)&v169 + 1) * *((float *)&v172 + 1)))
                + (float)(*((float *)&v170 + 1) * *((float *)&v172 + 2)))
        + (float)(*((float *)&v171 + 1) * *((float *)&v172 + 3));
    v66 = (float)((float)((float)((float)(*((float *)&v168 + 1) * *(float *)&v173) + 0.0)
                        + (float)(*((float *)&v169 + 1) * *((float *)&v173 + 1)))
                + (float)(*((float *)&v170 + 1) * *((float *)&v173 + 2)))
        + (float)(*((float *)&v171 + 1) * 0.0);
    v67 = (float)((float)((float)((float)(*((float *)&v168 + 1) * *(float *)v174) + 0.0)
                        + (float)(*((float *)&v169 + 1) * *(float *)&v174[4]))
                + (float)(*((float *)&v170 + 1) * *(float *)&v174[8]))
        + (float)(*((float *)&v171 + 1) * 0.0);
    v68 = *((float *)&v171 + 1)
        + (float)((float)((float)((float)(*((float *)&v168 + 1) * *(float *)&v174[16]) + 0.0)
                        + (float)(*((float *)&v169 + 1) * 0.0))
                + (float)(*((float *)&v170 + 1) * 0.0));
    v69 = *((float *)&v170 + 3);
    v70 = *((float *)&v171 + 3);
    v71 = (float)((float)((float)((float)(*((float *)&v168 + 2) * *(float *)&v172) + 0.0)
                        + (float)(*((float *)&v169 + 2) * *((float *)&v172 + 1)))
                + (float)(*((float *)&v170 + 2) * *((float *)&v172 + 2)))
        + (float)(*((float *)&v171 + 2) * *((float *)&v172 + 3));
    v72 = (float)((float)((float)((float)(*((float *)&v168 + 2) * *(float *)&v173) + 0.0)
                        + (float)(*((float *)&v169 + 2) * *((float *)&v173 + 1)))
                + (float)(*((float *)&v170 + 2) * *((float *)&v173 + 2)))
        + (float)(*((float *)&v171 + 2) * 0.0);
    v73 = (float)((float)((float)((float)(*((float *)&v168 + 2) * *(float *)v174) + 0.0)
                        + (float)(*((float *)&v169 + 2) * *(float *)&v174[4]))
                + (float)(*((float *)&v170 + 2) * *(float *)&v174[8]))
        + (float)(*((float *)&v171 + 2) * 0.0);
    v74 = *((float *)&v171 + 2)
        + (float)((float)((float)((float)(*((float *)&v168 + 2) * *(float *)&v174[16]) + 0.0)
                        + (float)(*((float *)&v169 + 2) * 0.0))
                + (float)(*((float *)&v170 + 2) * 0.0));
    v75 = (float)((float)((float)((float)(*((float *)&v168 + 3) * *(float *)&v172) + 0.0)
                        + (float)(*((float *)&v169 + 3) * *((float *)&v172 + 1)))
                + (float)(*((float *)&v170 + 3) * *((float *)&v172 + 2)))
        + (float)(*((float *)&v171 + 3) * *((float *)&v172 + 3));
    v76 = (float)((float)((float)((float)(*((float *)&v168 + 3) * *(float *)&v173) + 0.0)
                        + (float)(*((float *)&v169 + 3) * *((float *)&v173 + 1)))
                + (float)(*((float *)&v170 + 3) * *((float *)&v173 + 2)))
        + (float)(*((float *)&v171 + 3) * 0.0);
    v77 = (float)((float)((float)((float)(*((float *)&v168 + 3) * *(float *)v174) + 0.0)
                        + (float)(*((float *)&v169 + 3) * *(float *)&v174[4]))
                + (float)(*((float *)&v170 + 3) * *(float *)&v174[8]))
        + (float)(*((float *)&v171 + 3) * 0.0);
    v78 = (float)((float)(*((float *)&v168 + 3) * *(float *)&v174[16]) + 0.0) + (float)(*((float *)&v169 + 3) * 0.0);
    *a5 = (float)((float)((float)((float)(*(float *)&v168 * *(float *)&v172) + 0.0)
                        + (float)(*(float *)&v169 * *((float *)&v172 + 1)))
                + (float)(*(float *)&v170 * *((float *)&v172 + 2)))
        + (float)(*(float *)&v171 * *((float *)&v172 + 3));
    a5[1] = v65;
    a5[2] = v71;
    a5[3] = v75;
    a5[4] = v62;
    a5[5] = v66;
    a5[6] = v72;
    a5[7] = v76;
    a5[8] = v63;
    a5[9] = v67;
    a5[10] = v73;
    a5[11] = v77;
    a5[12] = v64;
    a5[13] = v68;
    a5[14] = v74;
    a5[15] = v70 + (float)(v78 + (float)(v69 * 0.0));
    v166 = 0u;
    v167 = 0u;
    v164 = 0u;
    v165 = 0u;
    DYMtxConcat((float *)a4, a5, (float *)&v164);
    v79 = *(float *)(a3 + 4);
    v80 = *(float *)(a3 + 16);
    v81 = *(float *)(a3 + 20);
    v82 = *(float *)(a3 + 32);
    v83 = *(float *)(a3 + 36);
    v84 = *(float *)(a3 + 48);
    v85 = *(float *)(a3 + 52);
    v160 = (float)((float)((float)((float)(*(float *)a3 * *(float *)&v164) + 0.0) + (float)(v80 * *((float *)&v164 + 1)))
                 + (float)(v82 * *((float *)&v164 + 2)))
         + (float)(v84 * *((float *)&v164 + 3));
    v162 = (float)((float)((float)((float)(*(float *)a3 * *(float *)&v165) + 0.0) + (float)(v80 * *((float *)&v165 + 1)))
                 + (float)(v82 * *((float *)&v165 + 2)))
         + (float)(v84 * *((float *)&v165 + 3));
    v161 = (float)((float)((float)((float)(*(float *)a3 * *(float *)&v166) + 0.0) + (float)(v80 * *((float *)&v166 + 1)))
                 + (float)(v82 * *((float *)&v166 + 2)))
         + (float)(v84 * *((float *)&v166 + 3));
    v86 = (float)((float)((float)((float)(*(float *)a3 * *(float *)&v167) + 0.0) + (float)(v80 * *((float *)&v167 + 1)))
                + (float)(v82 * *((float *)&v167 + 2)))
        + (float)(v84 * *((float *)&v167 + 3));
    v87 = (float)((float)((float)((float)(v79 * *(float *)&v164) + 0.0) + (float)(v81 * *((float *)&v164 + 1)))
                + (float)(v83 * *((float *)&v164 + 2)))
        + (float)(v85 * *((float *)&v164 + 3));
    v158 = (float)((float)((float)((float)(v79 * *(float *)&v165) + 0.0) + (float)(v81 * *((float *)&v165 + 1)))
                 + (float)(v83 * *((float *)&v165 + 2)))
         + (float)(v85 * *((float *)&v165 + 3));
    v159 = v86;
    v88 = (float)((float)((float)((float)(v79 * *(float *)&v166) + 0.0) + (float)(v81 * *((float *)&v166 + 1)))
                + (float)(v83 * *((float *)&v166 + 2)))
        + (float)(v85 * *((float *)&v166 + 3));
    v89 = (float)((float)((float)((float)(v79 * *(float *)&v167) + 0.0) + (float)(v81 * *((float *)&v167 + 1)))
                + (float)(v83 * *((float *)&v167 + 2)))
        + (float)(v85 * *((float *)&v167 + 3));
    v90 = *(float *)(a3 + 8);
    v91 = *(float *)(a3 + 12);
    v93 = *(float *)(a3 + 24);
    v92 = *(float *)(a3 + 28);
    v94 = (float)((float)(v90 * *(float *)&v164) + 0.0) + (float)(v93 * *((float *)&v164 + 1));
    v95 = (float)((float)(v90 * *(float *)&v165) + 0.0) + (float)(v93 * *((float *)&v165 + 1));
    v96 = (float)((float)(v90 * *(float *)&v166) + 0.0) + (float)(v93 * *((float *)&v166 + 1));
    v97 = (float)((float)(v90 * *(float *)&v167) + 0.0) + (float)(v93 * *((float *)&v167 + 1));
    v99 = *(float *)(a3 + 40);
    v98 = *(float *)(a3 + 44);
    v100 = v94 + (float)(v99 * *((float *)&v164 + 2));
    v101 = v95 + (float)(v99 * *((float *)&v165 + 2));
    v102 = v96 + (float)(v99 * *((float *)&v166 + 2));
    v103 = v97 + (float)(v99 * *((float *)&v167 + 2));
    v105 = *(float *)(a3 + 56);
    v104 = *(float *)(a3 + 60);
    v106 = v100 + (float)(v105 * *((float *)&v164 + 3));
    v107 = v101 + (float)(v105 * *((float *)&v165 + 3));
    v108 = v102 + (float)(v105 * *((float *)&v166 + 3));
    v109 = v103 + (float)(v105 * *((float *)&v167 + 3));
    v110 = (float)((float)((float)((float)(v91 * *(float *)&v164) + 0.0) + (float)(v92 * *((float *)&v164 + 1)))
                 + (float)(v98 * *((float *)&v164 + 2)))
         + (float)(v104 * *((float *)&v164 + 3));
    v111 = (float)((float)((float)((float)(v91 * *(float *)&v165) + 0.0) + (float)(v92 * *((float *)&v165 + 1)))
                 + (float)(v98 * *((float *)&v165 + 2)))
         + (float)(v104 * *((float *)&v165 + 3));
    v112 = (float)((float)((float)((float)(v91 * *(float *)&v166) + 0.0) + (float)(v92 * *((float *)&v166 + 1)))
                 + (float)(v98 * *((float *)&v166 + 2)))
         + (float)(v104 * *((float *)&v166 + 3));
    v113 = (float)((float)((float)((float)(v91 * *(float *)&v167) + 0.0) + (float)(v92 * *((float *)&v167 + 1)))
                 + (float)(v98 * *((float *)&v167 + 2)))
         + (float)(v104 * *((float *)&v167 + 3));
    v114 = *(float *)(a2 + 4);
    v115 = *(float *)(a2 + 16);
    v116 = *(float *)(a2 + 20);
    v118 = *(float *)(a2 + 32);
    v117 = *(float *)(a2 + 36);
    v120 = *(float *)(a2 + 48);
    v119 = *(float *)(a2 + 52);
    v155 = (float)((float)((float)((float)(*(float *)a2 * v160) + 0.0) + (float)(v115 * v87)) + (float)(v118 * v106))
         + (float)(v120 * v110);
    v157 = (float)((float)((float)((float)(*(float *)a2 * v162) + 0.0) + (float)(v115 * v158)) + (float)(v118 * v107))
         + (float)(v120 * v111);
    v156 = (float)((float)((float)((float)(*(float *)a2 * v161) + 0.0) + (float)(v115 * v88)) + (float)(v118 * v108))
         + (float)(v120 * v112);
    v163 = (float)((float)((float)((float)(*(float *)a2 * v159) + 0.0) + (float)(v115 * v89)) + (float)(v118 * v109))
         + (float)(v120 * v113);
    v121 = (float)((float)((float)((float)(v114 * v160) + 0.0) + (float)(v116 * v87)) + (float)(v117 * v106))
         + (float)(v119 * v110);
    v122 = (float)((float)((float)((float)(v114 * v162) + 0.0) + (float)(v116 * v158)) + (float)(v117 * v107))
         + (float)(v119 * v111);
    v123 = (float)((float)((float)((float)(v114 * v161) + 0.0) + (float)(v116 * v88)) + (float)(v117 * v108))
         + (float)(v119 * v112);
    v124 = (float)((float)((float)((float)(v114 * v159) + 0.0) + (float)(v116 * v89)) + (float)(v117 * v109))
         + (float)(v119 * v113);
    v125 = *(float *)(a2 + 8);
    v126 = *(float *)(a2 + 12);
    v127 = *(float *)(a2 + 24);
    v128 = *(float *)(a2 + 28);
    v129 = (float)((float)(v125 * v160) + 0.0) + (float)(v127 * v87);
    v130 = (float)((float)(v125 * v162) + 0.0) + (float)(v127 * v158);
    v131 = (float)((float)(v125 * v161) + 0.0) + (float)(v127 * v88);
    v132 = (float)((float)(v125 * v159) + 0.0) + (float)(v127 * v89);
    v133 = *(float *)(a2 + 40);
    v134 = *(float *)(a2 + 44);
    v135 = v129 + (float)(v133 * v106);
    v136 = v130 + (float)(v133 * v107);
    v137 = v131 + (float)(v133 * v108);
    v138 = v132 + (float)(v133 * v109);
    v140 = *(float *)(a2 + 56);
    v139 = *(float *)(a2 + 60);
    v141 = v135 + (float)(v140 * v110);
    v142 = v136 + (float)(v140 * v111);
    v143 = v137 + (float)(v140 * v112);
    v144 = v138 + (float)(v140 * v113);
    v145 = (float)((float)((float)((float)(v126 * v160) + 0.0) + (float)(v128 * v87)) + (float)(v134 * v106))
         + (float)(v139 * v110);
    v146 = (float)((float)((float)((float)(v126 * v162) + 0.0) + (float)(v128 * v158)) + (float)(v134 * v107))
         + (float)(v139 * v111);
    v147 = (float)((float)((float)((float)(v126 * v161) + 0.0) + (float)(v128 * v88)) + (float)(v134 * v108))
         + (float)(v139 * v112);
    v148 = (float)((float)((float)((float)(v126 * v159) + 0.0) + (float)(v128 * v89)) + (float)(v134 * v109))
         + (float)(v139 * v113);
    v149 = a1[3];
    v150 = v141 - a1[2];
    v151 = a1[7];
    v152 = a1[11];
    v153 = a1[15];
    v154 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v155 - *a1) * (float)(v155 - *a1)) + 0.0) + (float)((float)(v157 - a1[4]) * (float)(v157 - a1[4]))) + (float)((float)(v156 - a1[8]) * (float)(v156 - a1[8]))) + (float)((float)(v163 - a1[12]) * (float)(v163 - a1[12])))
                                                                                                 + (float)((float)(v121 - a1[1]) * (float)(v121 - a1[1])))
                                                                                         + (float)((float)(v122 - a1[5])
                                                                                                 * (float)(v122 - a1[5])))
                                                                                 + (float)((float)(v123 - a1[9])
                                                                                         * (float)(v123 - a1[9])))
                                                                         + (float)((float)(v124 - a1[13])
                                                                                 * (float)(v124 - a1[13])))
                                                                 + (float)(v150 * v150))
                                                         + (float)((float)(v142 - a1[6]) * (float)(v142 - a1[6])))
                                                 + (float)((float)(v143 - a1[10]) * (float)(v143 - a1[10])))
                                         + (float)((float)(v144 - a1[14]) * (float)(v144 - a1[14])))
                                 + (float)((float)(v145 - v149) * (float)(v145 - v149)))
                         + (float)((float)(v146 - v151) * (float)(v146 - v151)))
                 + (float)((float)(v147 - v152) * (float)(v147 - v152)))
         + (float)((float)(v148 - v153) * (float)(v148 - v153));
    return (float)(sqrtf(v154)
                 / sqrtf((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v155 * v155) + 0.0) + (float)(v157 * v157)) + (float)(v156 * v156)) + (float)(v163 * v163)) + (float)(v121 * v121)) + (float)(v122 * v122))+ (float)(v123 * v123))+ (float)(v124 * v124))+ (float)(v141 * v141))+ (float)(v142 * v142))+ (float)(v143 * v143))+ (float)(v144 * v144))+ (float)(v145 * v145))+ (float)(v146 * v146))+ (float)(v147 * v147))+ (float)(v148 * v148))) <= 0.0001;
  }
  return result;
}

uint64_t DYMtxTridiagonalDecomposition(float *a1, float *a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9, int32x4_t _Q6)
{
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;
  char v19;
  uint64_t v20;
  float v21;
  float v22;
  float v23;
  float v24;
  unsigned int v58;
  float v71;
  float v107;
  float v118;
  float v129;
  float v139;
  float v140;
  float v141;
  float v142;
  float v143;
  float v144;
  float v145;
  unsigned int v146;
  unsigned int v147;
  unsigned int v148;
  unsigned int v149;
  unsigned int v150;
  unsigned int v151;
  unsigned int v152;
  float v153;
  unsigned int v154;
  unsigned int v155;
  float v156;
  uint64_t result;
  float v158;
  float v159;
  float v160;
  float v161;
  float v162;
  float v163;
  float v164;
  float v165;
  float v166;
  float v167;
  float v168;
  float v169;
  float v170;
  float v171;
  float v172;
  float v173;
  float v174;
  float v175;
  unsigned int v176;
  int32x4_t v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  float32x4_t v181;
  __int128 v182;
  __int128 v183;
  float v184[6];
  uint64_t v185;

  v13 = 0;
  v14 = 0;
  v185 = *MEMORY[0x24BDAC8D0];
  v179 = 0u;
  v180 = 0u;
  v177 = 0u;
  v178 = 0u;
  v15 = *((_OWORD *)a1 + 3);
  v17 = *(_OWORD *)a1;
  v16 = *((_OWORD *)a1 + 1);
  *(_OWORD *)(a3 + 32) = *((_OWORD *)a1 + 2);
  *(_OWORD *)(a3 + 48) = v15;
  *(_OWORD *)a3 = v17;
  *(_OWORD *)(a3 + 16) = v16;
  *(_OWORD *)a2 = xmmword_23C70CC60;
  *((_OWORD *)a2 + 1) = xmmword_23C70CC70;
  v18 = 1;
  *((_OWORD *)a2 + 2) = xmmword_23C70CC80;
  *((_OWORD *)a2 + 3) = xmmword_23C70CC90;
  do
  {
    v19 = v18;
    v181 = 0uLL;
    v20 = a3 + 4 * v14 + 1 * v13;
    v21 = *(float *)(v20 + 16);
    v181.f32[v13 + 1] = v21;
    v22 = (float)(v21 * v21) + 0.0;
    if (v13 != 2)
    {
      v23 = *(float *)(v20 + 32);
      v181.f32[v13 + 2] = v23;
      v22 = v22 + (float)(v23 * v23);
      if (v13 != 1)
      {
        v24 = *(float *)(a3 + 4 * v14 + 1 * v13 + 48);
        v181.f32[v13 + 3] = v24;
        v22 = v22 + (float)(v24 * v24);
      }
    }
    v181.f32[v14 + 1] = sqrtf(v22) + v181.f32[v14 + 1];
    _S1 = v181.i32[1];
    __asm { FMLA            S3, S1, V2.S[1] }
    _S0 = v181.i32[2];
    __asm { FMLA            S3, S0, V2.S[2] }
    _S0 = v181.i32[3];
    __asm { FMLA            S3, S0, V2.S[3] }
    if (_S3 >= 1.0e-10)
    {
      *(float *)&a8 = _S3 * 0.5;
      _Q7 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a8, 0);
      _Q0 = (int32x4_t)vsubq_f32((float32x4_t)xmmword_23C70CC60, vdivq_f32(vmulq_n_f32(v181, v181.f32[0]), _Q7));
      _Q6.i32[0] = *(_DWORD *)a3;
      _S29 = *(_DWORD *)(a3 + 4);
      __asm { FMLA            S3, S29, V0.S[1] }
      _S22 = *(_DWORD *)(a3 + 8);
      _S20 = *(float *)(a3 + 12);
      __asm
      {
        FMLA            S3, S22, V0.S[2]
        FMLA            S3, S20, V0.S[3]
      }
      _S24 = *(_DWORD *)(a3 + 16);
      _S21 = *(_DWORD *)(a3 + 20);
      __asm { FMLA            S5, S21, V0.S[1] }
      _S23 = *(_DWORD *)(a3 + 24);
      _S27 = *(float *)(a3 + 28);
      __asm
      {
        FMLA            S5, S23, V0.S[2]
        FMLA            S5, S27, V0.S[3]
      }
      _S30 = *(_DWORD *)(a3 + 32);
      _S28 = *(_DWORD *)(a3 + 36);
      __asm { FMLA            S17, S28, V0.S[1] }
      _S25 = *(_DWORD *)(a3 + 40);
      _S26 = *(float *)(a3 + 44);
      __asm
      {
        FMLA            S17, S25, V0.S[2]
        FMLA            S17, S26, V0.S[3]
        FMLA            S16, S6, V0.S[1]
      }
      *(float *)&v58 = 1.0 - (float)((float)(v181.f32[1] * v181.f32[1]) / *(float *)&a8);
      __asm
      {
        FMLA            S16, S6, V0.S[2]
        FMLA            S31, S6, V0.S[3]
      }
      _D13 = (float32x2_t)vextq_s8((int8x16_t)v181, (int8x16_t)v181, 8uLL).u64[0];
      *(float32x2_t *)_Q6.i8 = vsub_f32(0, vdiv_f32(vmul_lane_f32(_D13, *(float32x2_t *)v181.f32, 1), *(float32x2_t *)_Q7.f32));
      __asm { FMLA            S31, S29, V6.S[1] }
      _S15 = *(_DWORD *)(a3 + 48);
      _S9 = *(_DWORD *)(a3 + 52);
      __asm { FMLA            S14, S9, V0.S[1] }
      _D2 = (int32x2_t)vsub_f32((float32x2_t)1065353216, vdiv_f32(vmul_laneq_f32(_D13, v181, 2), *(float32x2_t *)_Q7.f32));
      __asm
      {
        FMLA            S18, S20, V6.S[1]
        FMLA            S31, S22, V2.S[1]
        FMLA            S7, S24, V0.S[1]
        FMLA            S13, S27, V6.S[1]
        FMLA            S16, S20, V2.S[1]
        FMLA            S29, S24, V0.S[2]
      }
      v71 = 1.0 - (float)((float)(v181.f32[3] * v181.f32[3]) / *(float *)&a8);
      _Q7.f32[0] = _S31 + (float)(v71 * _S20);
      __asm
      {
        FMLA            S19, S24, V0.S[3]
        FMLA            S20, S30, V0.S[1]
        FMLA            S29, S27, V2.S[1]
        FMLA            S19, S21, V6.S[1]
        FMLA            S31, S30, V0.S[2]
        FMLA            S19, S23, V2.S[1]
      }
      _S19 = _S19 + (float)(v71 * _S27);
      __asm { FMLA            S21, S30, V0.S[3] }
      _S22 = *(_DWORD *)(a3 + 56);
      _S23 = *(float *)(a3 + 60);
      __asm
      {
        FMLA            S14, S22, V0.S[2]
        FMLA            S14, S23, V0.S[3]
        FMLA            S30, S26, V6.S[1]
        FMLA            S21, S28, V6.S[1]
        FMLA            S20, S15, V0.S[1]
        FMLA            S28, S23, V6.S[1]
        FMLA            S31, S26, V2.S[1]
        FMLA            S21, S25, V2.S[1]
        FMLA            S27, S15, V0.S[2]
        FMLA            S27, S23, V2.S[1]
      }
      _S20 = _S21 + (float)(v71 * _S26);
      __asm
      {
        FMLA            S21, S15, V0.S[3]
        FMLA            S21, S9, V6.S[1]
        FMLA            S21, S22, V2.S[1]
      }
      _S22 = _S21 + (float)(v71 * _S23);
      __asm
      {
        FMLA            S21, S5, V0.S[1]
        FMLA            S21, S17, V0.S[2]
        FMLA            S21, S14, V0.S[3]
        FMLA            S23, S3, V0.S[1]
      }
      *(_QWORD *)&v178 = __PAIR64__(v58, _Q0.u32[1]);
      __asm
      {
        FMLA            S23, S14, V6.S[1]
        FMLA            S24, S3, V0.S[2]
      }
      *(int32x2_t *)((char *)&v180 + 4) = vzip2_s32(*(int32x2_t *)_Q6.i8, _D2);
      __asm
      {
        FMLA            S24, S14, V2.S[1]
        FMLA            S25, S3, V0.S[3]
        FMLA            S25, S5, V6.S[1]
        FMLA            S25, S17, V2.S[1]
      }
      v107 = _S25 + (float)(_S14 * v71);
      __asm
      {
        FMLA            S5, S13, V0.S[1]
        FMLA            S5, S30, V0.S[2]
        FMLA            S5, S28, V0.S[3]
        FMLA            S17, S18, V0.S[1]
        FMLA            S17, S28, V6.S[1]
        FMLA            S25, S18, V0.S[2]
        FMLA            S25, S28, V2.S[1]
        FMLA            S26, S18, V0.S[3]
        FMLA            S26, S13, V6.S[1]
        FMLA            S26, S30, V2.S[1]
      }
      v118 = _S26 + (float)(_S28 * v71);
      __asm
      {
        FMLA            S26, S29, V0.S[1]
        FMLA            S26, S31, V0.S[2]
        FMLA            S26, S27, V0.S[3]
        FMLA            S28, S16, V0.S[1]
        FMLA            S28, S27, V6.S[1]
        FMLA            S30, S16, V0.S[2]
        FMLA            S30, S27, V2.S[1]
        FMLA            S9, S16, V0.S[3]
        FMLA            S9, S29, V6.S[1]
        FMLA            S9, S31, V2.S[1]
      }
      v129 = _S9 + (float)(_S27 * v71);
      __asm
      {
        FMLA            S29, S7, V0.S[1]
        FMLA            S31, S7, V0.S[2]
        FMLA            S9, S7, V0.S[3]
      }
      v177 = _Q0;
      LODWORD(v180) = _Q0.i32[3];
      __asm
      {
        FMLA            S27, S19, V0.S[1]
        FMLA            S27, S20, V0.S[2]
        FMLA            S27, S22, V0.S[3]
        FMLA            S9, S19, V6.S[1]
      }
      *((_QWORD *)&v178 + 1) = _Q6.i64[0];
      *(_QWORD *)&v179 = vzip2q_s32(_Q0, vuzp1q_s32(_Q0, _Q6)).u64[0];
      __asm
      {
        FMLA            S0, S22, V6.S[1]
        FMLA            S9, S20, V2.S[1]
      }
      *((int32x2_t *)&v179 + 1) = _D2;
      __asm { FMLA            S31, S22, V2.S[1] }
      *((float *)&v180 + 3) = v71;
      *(_DWORD *)a3 = _S21;
      *(_DWORD *)(a3 + 4) = _S5;
      *(_DWORD *)(a3 + 8) = _S26;
      *(_DWORD *)(a3 + 12) = _S27;
      *(_DWORD *)(a3 + 16) = _S23;
      *(_DWORD *)(a3 + 20) = _S17;
      *(_DWORD *)(a3 + 24) = _S28;
      *(_DWORD *)(a3 + 28) = _Q0.i32[0];
      *(_DWORD *)(a3 + 32) = _S24;
      *(_DWORD *)(a3 + 36) = _S25;
      *(_DWORD *)(a3 + 40) = _S30;
      *(_DWORD *)(a3 + 44) = _S31;
      *(float *)(a3 + 48) = v107;
      *(float *)(a3 + 52) = v118;
      *(float *)(a3 + 56) = v129;
      *(float *)(a3 + 60) = _S9 + (float)(_S22 * v71);
      DYMtxConcat(a2, (float *)v177.i32, a2);
    }
    v18 = 0;
    ++v13;
    v14 = 1;
  }
  while ((v19 & 1) != 0);
  v183 = 0u;
  *(_OWORD *)v184 = 0u;
  v181 = 0u;
  v182 = 0u;
  v174 = a2[2];
  v175 = a2[3];
  v168 = a2[4];
  v169 = *a2;
  v170 = a2[5];
  v171 = a2[6];
  v172 = a2[1];
  v139 = a2[8];
  v173 = a2[7];
  v141 = a2[9];
  v140 = a2[10];
  v143 = a2[11];
  v142 = a2[12];
  v144 = a2[13];
  v145 = a2[14];
  v167 = a2[15];
  DYMtxConcat(a2, (float *)a3, v181.f32);
  *(float *)&v146 = (float)((float)((float)((float)(v181.f32[0] * v172) + 0.0) + (float)(*(float *)&v182 * v170))
                          + (float)(*(float *)&v183 * v141))
                  + (float)(v184[0] * v144);
  *(float *)&v147 = (float)((float)((float)((float)(v181.f32[0] * v174) + 0.0) + (float)(*(float *)&v182 * v171))
                          + (float)(*(float *)&v183 * v140))
                  + (float)(v184[0] * v145);
  *(float *)&v176 = (float)((float)((float)((float)(v181.f32[0] * v175) + 0.0) + (float)(*(float *)&v182 * v173))
                          + (float)(*(float *)&v183 * v143))
                  + (float)(v184[0] * v167);
  *(float *)&v148 = (float)((float)((float)((float)(v181.f32[1] * v172) + 0.0) + (float)(*((float *)&v182 + 1) * v170))
                          + (float)(*((float *)&v183 + 1) * v141))
                  + (float)(v184[1] * v144);
  *(float *)&v149 = (float)((float)((float)((float)(v181.f32[1] * v174) + 0.0) + (float)(*((float *)&v182 + 1) * v171))
                          + (float)(*((float *)&v183 + 1) * v140))
                  + (float)(v184[1] * v145);
  *(float *)&v150 = (float)((float)((float)((float)(v181.f32[1] * v175) + 0.0) + (float)(*((float *)&v182 + 1) * v173))
                          + (float)(*((float *)&v183 + 1) * v143))
                  + (float)(v184[1] * v167);
  *(float *)&v151 = (float)((float)((float)((float)(v181.f32[2] * v172) + 0.0) + (float)(*((float *)&v182 + 2) * v170))
                          + (float)(*((float *)&v183 + 2) * v141))
                  + (float)(v184[2] * v144);
  *(float *)&v152 = (float)((float)((float)((float)(v181.f32[2] * v174) + 0.0) + (float)(*((float *)&v182 + 2) * v171))
                          + (float)(*((float *)&v183 + 2) * v140))
                  + (float)(v184[2] * v145);
  v153 = (float)((float)((float)((float)(v181.f32[2] * v175) + 0.0) + (float)(*((float *)&v182 + 2) * v173))
               + (float)(*((float *)&v183 + 2) * v143))
       + (float)(v184[2] * v167);
  *(float *)&v154 = (float)((float)((float)((float)(v181.f32[3] * v172) + 0.0) + (float)(*((float *)&v182 + 3) * v170))
                          + (float)(*((float *)&v183 + 3) * v141))
                  + (float)(v184[3] * v144);
  *(float *)&v155 = (float)((float)((float)((float)(v181.f32[3] * v174) + 0.0) + (float)(*((float *)&v182 + 3) * v171))
                          + (float)(*((float *)&v183 + 3) * v140))
                  + (float)(v184[3] * v145);
  v156 = (float)((float)((float)(v181.f32[3] * v175) + 0.0) + (float)(*((float *)&v182 + 3) * v173))
       + (float)(*((float *)&v183 + 3) * v143);
  v181.f32[0] = (float)((float)((float)((float)(v181.f32[0] * v169) + 0.0) + (float)(*(float *)&v182 * v168))
                      + (float)(*(float *)&v183 * v139))
              + (float)(v184[0] * v142);
  v181.f32[1] = (float)((float)((float)((float)(v181.f32[1] * v169) + 0.0) + (float)(*((float *)&v182 + 1) * v168))
                      + (float)(*((float *)&v183 + 1) * v139))
              + (float)(v184[1] * v142);
  v181.f32[2] = (float)((float)((float)((float)(v181.f32[2] * v169) + 0.0) + (float)(*((float *)&v182 + 2) * v168))
                      + (float)(*((float *)&v183 + 2) * v139))
              + (float)(v184[2] * v142);
  v181.f32[3] = (float)((float)((float)((float)(v181.f32[3] * v169) + 0.0) + (float)(*((float *)&v182 + 3) * v168))
                      + (float)(*((float *)&v183 + 3) * v139))
              + (float)(v184[3] * v142);
  *(_QWORD *)&v182 = __PAIR64__(v148, v146);
  *((_QWORD *)&v182 + 1) = __PAIR64__(v154, v151);
  *(_QWORD *)&v183 = __PAIR64__(v149, v147);
  *((_QWORD *)&v183 + 1) = __PAIR64__(v155, v152);
  *(_QWORD *)v184 = __PAIR64__(v150, v176);
  v184[2] = v153;
  v184[3] = v156 + (float)(v184[3] * v167);
  if (DYMtxNormalizedFrobeniusNormDelta(a1, v181.f32) > 0.0001)
    return 0;
  v158 = *(float *)(a3 + 32);
  v160 = *(float *)(a3 + 48);
  v159 = *(float *)(a3 + 52);
  v162 = *(float *)(a3 + 8);
  v161 = *(float *)(a3 + 12);
  v163 = *(float *)(a3 + 28);
  v164 = *(float *)(a3 + 44);
  v165 = *(float *)(a3 + 60);
  v166 = sqrtf((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(*(float *)a3 * *(float *)a3) + 0.0) + (float)(*(float *)(a3 + 16) * *(float *)(a3 + 16))) + (float)(v158 * v158)) + (float)(v160 * v160))+ (float)(*(float *)(a3 + 4) * *(float *)(a3 + 4)))+ (float)(*(float *)(a3 + 20)* *(float *)(a3 + 20)))+ (float)(*(float *)(a3 + 36)* *(float *)(a3 + 36)))+ (float)(v159 * v159))+ (float)(v162 * v162))+ (float)(*(float *)(a3 + 24) * *(float *)(a3 + 24)))+ (float)(*(float *)(a3 + 40) * *(float *)(a3 + 40)))+ (float)(*(float *)(a3 + 56) * *(float *)(a3 + 56)))+ (float)(v161 * v161))+ (float)(v163 * v163))+ (float)(v164 * v164))+ (float)(v165 * v165));
  result = 0;
  if ((float)(fabsf(v158) / v166) <= 0.0001)
  {
    *(_DWORD *)(a3 + 32) = 0;
    if ((float)(fabsf(v160) / v166) <= 0.0001)
    {
      result = 0;
      *(_DWORD *)(a3 + 48) = 0;
      if ((float)(fabsf(v159) / v166) <= 0.0001)
      {
        result = 0;
        *(_DWORD *)(a3 + 52) = 0;
        if ((float)(fabsf(v162) / v166) <= 0.0001)
        {
          result = 0;
          *(_DWORD *)(a3 + 8) = 0;
          if ((float)(fabsf(v161) / v166) <= 0.0001)
          {
            result = 0;
            *(_DWORD *)(a3 + 12) = 0;
            if ((float)(fabsf(v163) / v166) <= 0.0001)
            {
              *(_DWORD *)(a3 + 28) = 0;
              return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DYMtxEigenDecomposition(float *a1, _OWORD *a2, _DWORD *a3, double a4, double a5, double a6, double a7, double a8, double a9, int32x4_t a10)
{
  uint64_t result;
  int v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  uint64_t i;
  uint64_t v39;
  uint64_t v40;
  float v41;
  uint64_t v42;
  _OWORD *v43;
  uint64_t v44;
  float v45;
  uint64_t v46;
  _OWORD *v47;
  uint64_t v48;
  float v49;
  float v50;
  float v51;
  float v52;
  char *v53;
  char *v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;
  unsigned int v83;
  float v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float v104;
  float v105;
  float v106;
  float v107;
  float v108;
  float v109;
  float v110;
  float v111;
  float v112;
  float v113;
  float v114;
  float v115;
  float v116;
  float v117;
  float v118;
  float v119;
  float v120;
  float v121;
  float v122;
  float v123;
  float v124;
  float v125;
  float v126;
  float v127;
  float v128;
  float v129;
  float v130;
  int v131;
  float v132;
  float v133;
  float v134;
  float v135;
  float v136;
  float v137;
  float v138;
  float v139;
  float v140;
  float v141;
  float v142;
  float v143;
  float v144;
  float v145;
  float v146;
  float v147;
  float v148;
  float v149;
  float v150;
  float v151;
  float v152;
  float v153;
  __int128 v154;
  int v155;
  float v156;
  unsigned int v157;
  unsigned int v158;
  unsigned int v159;
  float v160;
  unsigned int v161;
  unsigned int v162;
  unsigned int v163;
  unsigned int v164;
  float v165;
  float v166;
  float v167;
  unsigned int v168;
  float v169;
  float v170;
  unsigned int v171;
  __int128 v172;
  float v173;
  float v174;
  float v175;
  float v176;
  float v177;
  float v178;
  float v179;
  float v180;
  float v181;
  float v182;
  float v183;
  float v184;
  float v185;
  float v186;
  float v187;
  float v188;
  float v189;
  float v190;
  float v191;
  float v192;
  float v193;
  float v194;
  float v195;
  unsigned int v196;
  float v197;
  float v198;
  unsigned int v199;
  float v200;
  float v201;
  float v202;
  float v203;
  float v204;
  float v205;
  uint64_t v206;
  uint64_t v207;
  float v208;
  float v209;
  float v210;
  float v211;
  float v212;
  int v213;
  float v214;
  int v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  _OWORD v220[4];
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;

  v223 = 0u;
  v224 = 0u;
  v221 = 0u;
  v222 = 0u;
  memset(v220, 0, sizeof(v220));
  result = DYMtxTridiagonalDecomposition(a1, (float *)&v221, (uint64_t)v220, 0.0, a5, a6, a7, a8, a9, a10);
  if ((_DWORD)result)
  {
    v14 = 0;
    v16 = *((float *)v220 + 1);
    v15 = *(float *)v220;
    v18 = *((float *)&v220[2] + 1);
    v17 = *(float *)&v220[2];
    v20 = *((float *)&v220[3] + 1);
    v19 = *(float *)&v220[3];
    v21 = *((float *)v220 + 2);
    v22 = *((float *)&v220[1] + 2);
    v23 = *((float *)&v220[1] + 1);
    v24 = *(float *)&v220[1];
    v210 = *((float *)&v220[1] + 3);
    v212 = *((float *)&v220[2] + 3);
    v208 = *((float *)&v220[3] + 3);
    v25 = *((float *)&v220[3] + 2);
    v209 = *((float *)&v220[2] + 2);
    v27 = *((float *)&v221 + 1);
    v26 = *(float *)&v221;
    v29 = *((float *)&v222 + 1);
    v28 = *(float *)&v222;
    v31 = *((float *)&v223 + 1);
    v30 = *(float *)&v223;
    v32 = *((float *)&v223 + 3);
    v207 = v224;
    v204 = *((float *)&v221 + 3);
    v205 = *((float *)&v221 + 2);
    v34 = *((float *)&v222 + 3);
    v33 = *((float *)&v222 + 2);
    v35 = *((float *)&v223 + 2);
    v206 = *((_QWORD *)&v224 + 1);
    v36 = *((float *)v220 + 3);
    do
    {
      v37 = sqrtf((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v24 * v24) + 0.0)+ (float)(v17 * v17))+ (float)(v19 * v19))+ (float)(v16 * v16))+ (float)(v18 * v18))+ (float)(v20 * v20))+ (float)(v21 * v21))+ (float)(v22 * v22))+ (float)(v25 * v25))+ (float)(v36 * v36))+ (float)(v210 * v210))+ (float)(v212 * v212));
      if (v37 < 0.0000001
        && (float)(v37
                 / sqrtf((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v15 * v15) + 0.0) + (float)(v24 * v24)) + (float)(v17 * v17)) + (float)(v19 * v19)) + (float)(v16 * v16)) + (float)(v23 * v23))+ (float)(v18 * v18))+ (float)(v20 * v20))+ (float)(v21 * v21))+ (float)(v22 * v22))+ (float)(v209 * v209))+ (float)(v25 * v25))+ (float)(v36 * v36))+ (float)(v210 * v210))+ (float)(v212 * v212))+ (float)(v208 * v208))) < 0.0000001)
      {
        break;
      }
      v214 = v19;
      for (i = 0; i != 48; i += 8)
      {
        v39 = *(int *)((char *)&unk_23C70CCC8 + i);
        v40 = *(int *)((char *)&unk_23C70CCC8 + i + 4);
        v41 = *((float *)&v220[v40] + v39);
        if (fabsf(v41) >= 0.0000001)
        {
          v42 = 16 * v40;
          v43 = &v220[v40];
          v44 = 4 * v40;
          v45 = *(float *)((char *)v43 + v44);
          v46 = 16 * v39;
          v47 = &v220[v39];
          v48 = 4 * v39;
          v49 = (float)(v45 - *(float *)((char *)v47 + v48)) / (float)(v41 + v41);
          v50 = 1.0 / (float)(fabsf(v49) + sqrtf((float)(v49 * v49) + 1.0));
          if (v49 >= 0.0)
            v51 = v50;
          else
            v51 = -v50;
          v52 = 1.0 / sqrtf((float)(v51 * v51) + 1.0);
          v216 = xmmword_23C70CC60;
          v217 = xmmword_23C70CC70;
          v218 = xmmword_23C70CC80;
          v219 = xmmword_23C70CC90;
          v53 = (char *)&v216 + v46;
          *(float *)&v53[v48] = v52;
          v54 = (char *)&v216 + v42;
          *(float *)&v54[v44] = v52;
          *(float *)&v54[v48] = v51 * v52;
          *(float *)&v53[v44] = -(float)(v51 * v52);
          v198 = v25;
          v201 = v30;
          v189 = v28;
          v192 = v35;
          v55 = (float)((float)(*(float *)&v216 * v15) + 0.0) + (float)(*((float *)&v216 + 1) * v16);
          v179 = v33;
          v180 = v26;
          v56 = (float)((float)(*(float *)&v217 * v15) + 0.0) + (float)(*((float *)&v217 + 1) * v16);
          v57 = (float)((float)(*(float *)&v218 * v15) + 0.0) + (float)(*((float *)&v218 + 1) * v16);
          v194 = v32;
          v195 = v31;
          v58 = (float)((float)(*(float *)&v219 * v15) + 0.0) + (float)(*((float *)&v219 + 1) * v16);
          v59 = (float)(v55 + (float)(*((float *)&v216 + 2) * v21)) + (float)(*((float *)&v216 + 3) * v36);
          v60 = (float)(v56 + (float)(*((float *)&v217 + 2) * v21)) + (float)(*((float *)&v217 + 3) * v36);
          v61 = (float)(v57 + (float)(*((float *)&v218 + 2) * v21)) + (float)(*((float *)&v218 + 3) * v36);
          v62 = (float)(v58 + (float)(*((float *)&v219 + 2) * v21)) + (float)(*((float *)&v219 + 3) * v36);
          v183 = v34;
          v63 = (float)((float)((float)((float)(*(float *)&v216 * v24) + 0.0) + (float)(*((float *)&v216 + 1) * v23))
                      + (float)(*((float *)&v216 + 2) * v22))
              + (float)(*((float *)&v216 + 3) * v210);
          v64 = (float)((float)((float)((float)(*(float *)&v217 * v24) + 0.0) + (float)(*((float *)&v217 + 1) * v23))
                      + (float)(*((float *)&v217 + 2) * v22))
              + (float)(*((float *)&v217 + 3) * v210);
          v65 = (float)((float)((float)((float)(*(float *)&v218 * v24) + 0.0) + (float)(*((float *)&v218 + 1) * v23))
                      + (float)(*((float *)&v218 + 2) * v22))
              + (float)(*((float *)&v218 + 3) * v210);
          v66 = (float)((float)((float)((float)(*(float *)&v219 * v24) + 0.0) + (float)(*((float *)&v219 + 1) * v23))
                      + (float)(*((float *)&v219 + 2) * v22))
              + (float)(*((float *)&v219 + 3) * v210);
          v181 = (float)((float)(v60 * *(float *)&v217) + 0.0) + (float)(v64 * *((float *)&v217 + 1));
          v182 = (float)((float)(v60 * *(float *)&v216) + 0.0) + (float)(v64 * *((float *)&v216 + 1));
          v67 = (float)((float)(v60 * *(float *)&v218) + 0.0) + (float)(v64 * *((float *)&v218 + 1));
          v68 = (float)((float)(v60 * *(float *)&v219) + 0.0) + (float)(v64 * *((float *)&v219 + 1));
          v178 = (float)((float)(v61 * *(float *)&v219) + 0.0) + (float)(v65 * *((float *)&v219 + 1));
          v176 = (float)((float)(v62 * *(float *)&v217) + 0.0) + (float)(v66 * *((float *)&v217 + 1));
          v177 = (float)((float)(v62 * *(float *)&v216) + 0.0) + (float)(v66 * *((float *)&v216 + 1));
          v174 = (float)((float)(v62 * *(float *)&v219) + 0.0) + (float)(v66 * *((float *)&v219 + 1));
          v175 = (float)((float)(v62 * *(float *)&v218) + 0.0) + (float)(v66 * *((float *)&v218 + 1));
          v173 = (float)((float)(v180 * *(float *)&v216) + 0.0) + (float)(v189 * *((float *)&v216 + 1));
          v69 = (float)((float)((float)((float)(*(float *)&v216 * v17) + 0.0) + (float)(*((float *)&v216 + 1) * v18))
                      + (float)(*((float *)&v216 + 2) * v209))
              + (float)(*((float *)&v216 + 3) * v212);
          v70 = (float)((float)((float)((float)(*(float *)&v217 * v17) + 0.0) + (float)(*((float *)&v217 + 1) * v18))
                      + (float)(*((float *)&v217 + 2) * v209))
              + (float)(*((float *)&v217 + 3) * v212);
          v71 = (float)((float)((float)((float)(*(float *)&v218 * v17) + 0.0) + (float)(*((float *)&v218 + 1) * v18))
                      + (float)(*((float *)&v218 + 2) * v209))
              + (float)(*((float *)&v218 + 3) * v212);
          v72 = (float)((float)((float)((float)(*(float *)&v219 * v17) + 0.0) + (float)(*((float *)&v219 + 1) * v18))
                      + (float)(*((float *)&v219 + 2) * v209))
              + (float)(*((float *)&v219 + 3) * v212);
          v73 = (float)((float)((float)(v180 * *(float *)&v217) + 0.0) + (float)(v189 * *((float *)&v217 + 1)))
              + (float)(v30 * *((float *)&v217 + 2));
          v74 = (float)((float)((float)(v180 * *(float *)&v218) + 0.0) + (float)(v189 * *((float *)&v218 + 1)))
              + (float)(v30 * *((float *)&v218 + 2));
          v75 = (float)((float)((float)(v180 * *(float *)&v219) + 0.0) + (float)(v189 * *((float *)&v219 + 1)))
              + (float)(v30 * *((float *)&v219 + 2));
          v190 = (float)((float)((float)(v27 * *(float *)&v216) + 0.0) + (float)(v29 * *((float *)&v216 + 1)))
               + (float)(v195 * *((float *)&v216 + 2));
          v185 = (float)((float)((float)(v27 * *(float *)&v218) + 0.0) + (float)(v29 * *((float *)&v218 + 1)))
               + (float)(v195 * *((float *)&v218 + 2));
          v186 = (float)((float)((float)(v27 * *(float *)&v217) + 0.0) + (float)(v29 * *((float *)&v217 + 1)))
               + (float)(v195 * *((float *)&v217 + 2));
          v184 = (float)((float)((float)(v27 * *(float *)&v219) + 0.0) + (float)(v29 * *((float *)&v219 + 1)))
               + (float)(v195 * *((float *)&v219 + 2));
          v76 = (float)((float)((float)((float)(*(float *)&v216 * v214) + 0.0) + (float)(*((float *)&v216 + 1) * v20))
                      + (float)(*((float *)&v216 + 2) * v198))
              + (float)(*((float *)&v216 + 3) * v208);
          v77 = (float)((float)((float)((float)(*(float *)&v217 * v214) + 0.0) + (float)(*((float *)&v217 + 1) * v20))
                      + (float)(*((float *)&v217 + 2) * v198))
              + (float)(*((float *)&v217 + 3) * v208);
          v78 = (float)((float)((float)((float)(*(float *)&v218 * v214) + 0.0) + (float)(*((float *)&v218 + 1) * v20))
                      + (float)(*((float *)&v218 + 2) * v198))
              + (float)(*((float *)&v218 + 3) * v208);
          v79 = (float)((float)((float)((float)(*(float *)&v219 * v214) + 0.0) + (float)(*((float *)&v219 + 1) * v20))
                      + (float)(*((float *)&v219 + 2) * v198))
              + (float)(*((float *)&v219 + 3) * v208);
          *(float *)&v80 = (float)((float)((float)((float)(v59 * *(float *)&v216) + 0.0)
                                         + (float)(v63 * *((float *)&v216 + 1)))
                                 + (float)(v69 * *((float *)&v216 + 2)))
                         + (float)(v76 * *((float *)&v216 + 3));
          *(float *)&v199 = (float)((float)((float)((float)(v59 * *(float *)&v217) + 0.0)
                                          + (float)(v63 * *((float *)&v217 + 1)))
                                  + (float)(v69 * *((float *)&v217 + 2)))
                          + (float)(v76 * *((float *)&v217 + 3));
          *(float *)&v81 = (float)((float)((float)((float)(v59 * *(float *)&v218) + 0.0)
                                         + (float)(v63 * *((float *)&v218 + 1)))
                                 + (float)(v69 * *((float *)&v218 + 2)))
                         + (float)(v76 * *((float *)&v218 + 3));
          *(float *)&v82 = (float)((float)((float)((float)(v59 * *(float *)&v219) + 0.0)
                                         + (float)(v63 * *((float *)&v219 + 1)))
                                 + (float)(v69 * *((float *)&v219 + 2)))
                         + (float)(v76 * *((float *)&v219 + 3));
          *(float *)&v196 = (float)(v182 + (float)(v70 * *((float *)&v216 + 2))) + (float)(v77 * *((float *)&v216 + 3));
          *(float *)&v83 = (float)(v181 + (float)(v70 * *((float *)&v217 + 2))) + (float)(v77 * *((float *)&v217 + 3));
          v84 = (float)(v67 + (float)(v70 * *((float *)&v218 + 2))) + (float)(v77 * *((float *)&v218 + 3));
          v20 = (float)(v68 + (float)(v70 * *((float *)&v219 + 2))) + (float)(v77 * *((float *)&v219 + 3));
          v21 = (float)((float)((float)((float)(v61 * *(float *)&v216) + 0.0) + (float)(v65 * *((float *)&v216 + 1)))
                      + (float)(v71 * *((float *)&v216 + 2)))
              + (float)(v78 * *((float *)&v216 + 3));
          v22 = (float)((float)((float)((float)(v61 * *(float *)&v217) + 0.0) + (float)(v65 * *((float *)&v217 + 1)))
                      + (float)(v71 * *((float *)&v217 + 2)))
              + (float)(v78 * *((float *)&v217 + 3));
          *(float *)&v85 = (float)((float)((float)((float)(v61 * *(float *)&v218) + 0.0)
                                         + (float)(v65 * *((float *)&v218 + 1)))
                                 + (float)(v71 * *((float *)&v218 + 2)))
                         + (float)(v78 * *((float *)&v218 + 3));
          *(float *)&v86 = (float)(v178 + (float)(v71 * *((float *)&v219 + 2))) + (float)(v78 * *((float *)&v219 + 3));
          *(float *)&v87 = (float)(v177 + (float)(v72 * *((float *)&v216 + 2))) + (float)(v79 * *((float *)&v216 + 3));
          *(float *)&v88 = (float)(v176 + (float)(v72 * *((float *)&v217 + 2))) + (float)(v79 * *((float *)&v217 + 3));
          v210 = *(float *)&v88;
          *(float *)&v89 = (float)(v175 + (float)(v72 * *((float *)&v218 + 2))) + (float)(v79 * *((float *)&v218 + 3));
          *(float *)&v90 = (float)(v174 + (float)(v72 * *((float *)&v219 + 2))) + (float)(v79 * *((float *)&v219 + 3));
          v202 = (float)(v173 + (float)(v201 * *((float *)&v216 + 2)))
               + (float)(*(float *)&v207 * *((float *)&v216 + 3));
          v91 = v73 + (float)(*(float *)&v207 * *((float *)&v217 + 3));
          v18 = v84;
          v92 = v74 + (float)(*(float *)&v207 * *((float *)&v218 + 3));
          v93 = v75 + (float)(*(float *)&v207 * *((float *)&v219 + 3));
          v94 = v190 + (float)(*((float *)&v207 + 1) * *((float *)&v216 + 3));
          v95 = v186 + (float)(*((float *)&v207 + 1) * *((float *)&v217 + 3));
          v96 = v185 + (float)(*((float *)&v207 + 1) * *((float *)&v218 + 3));
          *(float *)&v207 = v93;
          *((float *)&v207 + 1) = v184 + (float)(*((float *)&v207 + 1) * *((float *)&v219 + 3));
          v97 = (float)((float)((float)((float)(v205 * *(float *)&v216) + 0.0) + (float)(v179 * *((float *)&v216 + 1)))
                      + (float)(v192 * *((float *)&v216 + 2)))
              + (float)(*(float *)&v206 * *((float *)&v216 + 3));
          v98 = (float)((float)((float)((float)(v205 * *(float *)&v217) + 0.0) + (float)(v179 * *((float *)&v217 + 1)))
                      + (float)(v192 * *((float *)&v217 + 2)))
              + (float)(*(float *)&v206 * *((float *)&v217 + 3));
          v99 = (float)((float)((float)((float)(v205 * *(float *)&v218) + 0.0) + (float)(v179 * *((float *)&v218 + 1)))
                      + (float)(v192 * *((float *)&v218 + 2)))
              + (float)(*(float *)&v206 * *((float *)&v218 + 3));
          *(float *)&v206 = (float)((float)((float)((float)(v205 * *(float *)&v219) + 0.0)
                                          + (float)(v179 * *((float *)&v219 + 1)))
                                  + (float)(v192 * *((float *)&v219 + 2)))
                          + (float)(*(float *)&v206 * *((float *)&v219 + 3));
          v100 = (float)((float)((float)((float)(v204 * *(float *)&v216) + 0.0) + (float)(v183 * *((float *)&v216 + 1)))
                       + (float)(v32 * *((float *)&v216 + 2)))
               + (float)(*((float *)&v206 + 1) * *((float *)&v216 + 3));
          v34 = (float)((float)((float)((float)(v204 * *(float *)&v217) + 0.0) + (float)(v183 * *((float *)&v217 + 1)))
                      + (float)(v32 * *((float *)&v217 + 2)))
              + (float)(*((float *)&v206 + 1) * *((float *)&v217 + 3));
          v17 = *(float *)&v81;
          v32 = (float)((float)((float)((float)(v204 * *(float *)&v218) + 0.0) + (float)(v183 * *((float *)&v218 + 1)))
                      + (float)(v32 * *((float *)&v218 + 2)))
              + (float)(*((float *)&v206 + 1) * *((float *)&v218 + 3));
          *((float *)&v206 + 1) = (float)((float)((float)((float)(v204 * *(float *)&v219) + 0.0)
                                                + (float)(v183 * *((float *)&v219 + 1)))
                                        + (float)(v194 * *((float *)&v219 + 2)))
                                + (float)(*((float *)&v206 + 1) * *((float *)&v219 + 3));
          v16 = *(float *)&v196;
          v36 = *(float *)&v87;
          *(_QWORD *)&v220[0] = __PAIR64__(v196, v80);
          *((_QWORD *)&v220[0] + 1) = __PAIR64__(v87, LODWORD(v21));
          *(_QWORD *)&v220[1] = __PAIR64__(v83, v199);
          *((_QWORD *)&v220[1] + 1) = __PAIR64__(v88, LODWORD(v22));
          *(_QWORD *)&v220[2] = __PAIR64__(LODWORD(v18), v81);
          v208 = *(float *)&v90;
          v209 = *(float *)&v85;
          *((_QWORD *)&v220[2] + 1) = __PAIR64__(v89, v85);
          v212 = *(float *)&v89;
          v214 = *(float *)&v82;
          v204 = v100;
          v205 = v97;
          v35 = v99;
          *(_QWORD *)&v220[3] = __PAIR64__(LODWORD(v20), v82);
          v15 = *(float *)&v80;
          v33 = v98;
          v31 = v96;
          v29 = v95;
          v25 = *(float *)&v86;
          *((_QWORD *)&v220[3] + 1) = __PAIR64__(v90, v86);
          v23 = *(float *)&v83;
          v27 = v94;
          v24 = *(float *)&v199;
          v30 = v92;
          v28 = v91;
          v26 = v202;
        }
      }
      ++v14;
      v19 = v214;
    }
    while (v14 != 50);
    *(_OWORD *)((char *)v220 + 4) = 0uLL;
    v101 = v28;
    v102 = (float)((float)((float)((float)(v26 * *(float *)v220) + 0.0) + (float)(v28 * 0.0)) + (float)(v30 * 0.0))
         + (float)(*(float *)&v207 * 0.0);
    v203 = v30;
    *((_QWORD *)&v220[1] + 1) = 0;
    *(_QWORD *)&v220[2] = 0;
    v103 = (float)((float)((float)((float)(v26 * 0.0) + 0.0) + (float)(v28 * *((float *)&v220[1] + 1)))
                 + (float)(v30 * 0.0))
         + (float)(*(float *)&v207 * 0.0);
    v213 = DWORD1(v220[1]);
    v215 = v220[0];
    v104 = v33;
    v211 = (float)((float)(v26 * 0.0) + 0.0) + (float)(v28 * 0.0);
    *(_OWORD *)((char *)&v220[2] + 12) = 0uLL;
    v105 = (float)((float)((float)((float)(v27 * *(float *)v220) + 0.0) + (float)(v29 * 0.0)) + (float)(v31 * 0.0))
         + (float)(*((float *)&v207 + 1) * 0.0);
    v106 = (float)((float)((float)(v204 * *(float *)v220) + 0.0) + (float)(v34 * 0.0)) + (float)(v32 * 0.0);
    v107 = v32;
    v108 = (float)((float)((float)((float)(v27 * 0.0) + 0.0) + (float)(v29 * *((float *)&v220[1] + 1)))
                 + (float)(v31 * 0.0))
         + (float)(*((float *)&v207 + 1) * 0.0);
    v109 = (float)((float)((float)((float)(v205 * *(float *)v220) + 0.0) + (float)(v33 * 0.0)) + (float)(v35 * 0.0))
         + (float)(*(float *)&v206 * 0.0);
    v191 = v106 + (float)(*((float *)&v206 + 1) * 0.0);
    v110 = v27;
    v111 = (float)((float)((float)((float)(v205 * 0.0) + 0.0) + (float)(v33 * *((float *)&v220[1] + 1)))
                 + (float)(v35 * 0.0))
         + (float)(*(float *)&v206 * 0.0);
    v187 = (float)((float)((float)((float)(v204 * 0.0) + 0.0) + (float)(v34 * *((float *)&v220[1] + 1)))
                 + (float)(v107 * 0.0))
         + (float)(*((float *)&v206 + 1) * 0.0);
    v200 = (float)((float)(v205 * 0.0) + 0.0) + (float)(v33 * 0.0);
    v197 = (float)((float)(v204 * 0.0) + 0.0) + (float)(v34 * 0.0);
    v112 = v26;
    v113 = (float)((float)(v26 * 0.0) + 0.0) + (float)(v101 * 0.0);
    v114 = (float)((float)(v27 * 0.0) + 0.0) + (float)(v29 * 0.0);
    v193 = (float)((float)(v102 * v26) + 0.0) + (float)(v103 * v101);
    v115 = v101;
    v116 = (float)((float)(v102 * v27) + 0.0) + (float)(v103 * v29);
    v117 = v34;
    v118 = (float)((float)(v102 * v205) + 0.0) + (float)(v103 * v104);
    v119 = (float)((float)(v102 * v204) + 0.0) + (float)(v103 * v117);
    v188 = (float)((float)(v105 * v112) + 0.0) + (float)(v108 * v101);
    v120 = (float)((float)(v105 * v27) + 0.0) + (float)(v108 * v29);
    v121 = (float)((float)(v105 * v205) + 0.0) + (float)(v108 * v104);
    v122 = (float)((float)(v105 * v204) + 0.0) + (float)(v108 * v117);
    v123 = (float)((float)(v109 * v112) + 0.0) + (float)(v111 * v115);
    v124 = (float)((float)(v109 * v27) + 0.0) + (float)(v111 * v29);
    v125 = (float)((float)(v109 * v205) + 0.0) + (float)(v111 * v104);
    v126 = (float)((float)(v109 * v204) + 0.0) + (float)(v111 * v117);
    *((float *)&v221 + 3) = v204;
    v127 = (float)((float)(v191 * v112) + 0.0) + (float)(v187 * v115);
    *(_QWORD *)&v222 = __PAIR64__(LODWORD(v29), LODWORD(v115));
    v128 = (float)((float)(v191 * v110) + 0.0) + (float)(v187 * v29);
    v129 = (float)((float)(v191 * v205) + 0.0) + (float)(v187 * v104);
    v130 = (float)((float)(v191 * v204) + 0.0) + (float)(v187 * v117);
    *((_QWORD *)&v222 + 1) = __PAIR64__(LODWORD(v117), LODWORD(v104));
    *(float *)&v221 = v112;
    *(_QWORD *)((char *)&v221 + 4) = __PAIR64__(LODWORD(v205), LODWORD(v110));
    v131 = DWORD2(v220[2]);
    v132 = (float)(v211 + (float)(v203 * *((float *)&v220[2] + 2))) + (float)(*(float *)&v207 * 0.0);
    v133 = (float)(v114 + (float)(v31 * *((float *)&v220[2] + 2))) + (float)(*((float *)&v207 + 1) * 0.0);
    v134 = (float)(v200 + (float)(v35 * *((float *)&v220[2] + 2))) + (float)(*(float *)&v206 * 0.0);
    v135 = (float)(v197 + (float)(v107 * *((float *)&v220[2] + 2))) + (float)(*((float *)&v206 + 1) * 0.0);
    v136 = v114 + (float)(v31 * 0.0);
    v137 = v200 + (float)(v35 * 0.0);
    v138 = v193 + (float)(v132 * v203);
    v139 = v116 + (float)(v132 * v31);
    v140 = v118 + (float)(v132 * v35);
    v141 = v119 + (float)(v132 * v107);
    v142 = v188 + (float)(v133 * v203);
    v143 = v120 + (float)(v133 * v31);
    v144 = v121 + (float)(v133 * v35);
    v145 = v122 + (float)(v133 * v107);
    v146 = v123 + (float)(v134 * v203);
    v147 = v124 + (float)(v134 * v31);
    v148 = v125 + (float)(v134 * v35);
    v149 = v126 + (float)(v134 * v107);
    v150 = v127 + (float)(v135 * v203);
    *(_QWORD *)&v223 = __PAIR64__(LODWORD(v31), LODWORD(v203));
    v151 = v128 + (float)(v135 * v31);
    *((_QWORD *)&v223 + 1) = __PAIR64__(LODWORD(v107), LODWORD(v35));
    v152 = v129 + (float)(v135 * v35);
    *(_QWORD *)&v224 = v207;
    *((_QWORD *)&v224 + 1) = v206;
    v153 = v130 + (float)(v135 * v107);
    v154 = v224;
    a2[2] = v223;
    a2[3] = v154;
    v155 = HIDWORD(v220[3]);
    v156 = (float)(v113 + (float)(v203 * 0.0)) + (float)(*(float *)&v207 * *((float *)&v220[3] + 3));
    *(float *)&v157 = v138 + (float)(v156 * *(float *)&v207);
    *(float *)&v158 = v139 + (float)(v156 * *((float *)&v207 + 1));
    *(float *)&v154 = v140 + (float)(v156 * *(float *)&v206);
    *(float *)&v159 = v141 + (float)(v156 * *((float *)&v206 + 1));
    v160 = v136 + (float)(*((float *)&v207 + 1) * *((float *)&v220[3] + 3));
    *(float *)&v161 = v142 + (float)(v160 * *(float *)&v207);
    *(float *)&v162 = v143 + (float)(v160 * *((float *)&v207 + 1));
    *(float *)&v163 = v144 + (float)(v160 * *(float *)&v206);
    *(float *)&v164 = v145 + (float)(v160 * *((float *)&v206 + 1));
    v165 = v137 + (float)(*(float *)&v206 * *((float *)&v220[3] + 3));
    v166 = v146 + (float)(v165 * *(float *)&v207);
    v167 = v147 + (float)(v165 * *((float *)&v207 + 1));
    *(float *)&v168 = v148 + (float)(v165 * *(float *)&v206);
    v169 = v149 + (float)(v165 * *((float *)&v206 + 1));
    v170 = (float)(v197 + (float)(v107 * 0.0)) + (float)(*((float *)&v206 + 1) * *((float *)&v220[3] + 3));
    *(float *)&v171 = v152 + (float)(v170 * *(float *)&v206);
    v172 = v222;
    *a2 = v221;
    a2[1] = v172;
    *a3 = v215;
    a3[1] = v213;
    a3[2] = v131;
    a3[3] = v155;
    *(_QWORD *)&v216 = __PAIR64__(v161, v157);
    *((float *)&v216 + 2) = v166;
    *((float *)&v216 + 3) = v150 + (float)(v170 * *(float *)&v207);
    *(_QWORD *)&v217 = __PAIR64__(v162, v158);
    *((float *)&v217 + 2) = v167;
    *((float *)&v217 + 3) = v151 + (float)(v170 * *((float *)&v207 + 1));
    *(_QWORD *)&v218 = __PAIR64__(v163, v154);
    *((_QWORD *)&v218 + 1) = __PAIR64__(v171, v168);
    *(_QWORD *)&v219 = __PAIR64__(v164, v159);
    *((float *)&v219 + 2) = v169;
    *((float *)&v219 + 3) = v153 + (float)(v170 * *((float *)&v206 + 1));
    return DYMtxNormalizedFrobeniusNormDelta(a1, (float *)&v216) <= 0.0001;
  }
  return result;
}

void DYAddInternalDataNameEntries(uint64_t a1, uint64_t a2)
{
  _QWORD v4[6];

  if (sInternalDataNameTableOnce != -1)
    dispatch_once_f(&sInternalDataNameTableOnce, 0, (dispatch_function_t)_BuildInternalDataNameTable);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = __DYAddInternalDataNameEntries_block_invoke;
  v4[3] = &__block_descriptor_tmp_2;
  v4[4] = a2;
  v4[5] = a1;
  dispatch_sync((dispatch_queue_t)sInternalDataNameTableQueue, v4);
}

uint64_t *_BuildInternalDataNameTable(void *a1)
{
  uint64_t v1;
  int v3;

  sInternalDataNameTableQueue = (uint64_t)dispatch_queue_create("gputools.sInternalDataNameTableQueue", 0);
  v1 = operator new();
  *(_OWORD *)v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_DWORD *)(v1 + 32) = 1065353216;
  spInternalDataNameMap = v1;
  std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(v1, 0x40uLL);
  v3 = 0;
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[8]>(spInternalDataNameMap, &v3, &v3, "INVALID");
  v3 = 1;
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[20]>(spInternalDataNameMap, &v3, &v3, "RenderbufferStorage");
  v3 = 2;
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[21]>(spInternalDataNameMap, &v3, &v3, "AttributeSizeAndType");
  v3 = 3;
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[16]>(spInternalDataNameMap, &v3, &v3, "UniformLocation");
  v3 = 4;
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[15]>(spInternalDataNameMap, &v3, &v3, "AttachedShader");
  v3 = 5;
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[21]>(spInternalDataNameMap, &v3, &v3, "OriginalGLSLObjectID");
  v3 = 6;
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[34]>(spInternalDataNameMap, &v3, &v3, "ImplementationColorReadFormatType");
  v3 = 7;
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[17]>(spInternalDataNameMap, &v3, &v3, "HarvesterVersion");
  v3 = 8;
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[20]>(spInternalDataNameMap, &v3, &v3, "UIDeviceOrientation");
  v3 = 9;
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[12]>(spInternalDataNameMap, &v3, &v3, "UniformInfo");
  v3 = 10;
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[16]>(spInternalDataNameMap, &v3, &v3, "QueryObjectInfo");
  v3 = 11;
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[20]>(spInternalDataNameMap, &v3, &v3, "ActiveAttributeInfo");
  v3 = 12;
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[12]>(spInternalDataNameMap, &v3, &v3, "ProgramInfo");
  v3 = 13;
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[11]>(spInternalDataNameMap, &v3, &v3, "ShaderInfo");
  v3 = 14;
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[20]>(spInternalDataNameMap, &v3, &v3, "ProgramPipelineInfo");
  v3 = 15;
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[31]>(spInternalDataNameMap, &v3, &v3, "ProgramPipelineAttachmentsInfo");
  v3 = 16;
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[23]>(spInternalDataNameMap, &v3, &v3, "TextureImageUploadInfo");
  v3 = 17;
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[13]>(spInternalDataNameMap, &v3, &v3, "ShaderSource");
  v3 = 18;
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[17]>(spInternalDataNameMap, &v3, &v3, "UniformBlockInfo");
  v3 = 19;
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[29]>(spInternalDataNameMap, &v3, &v3, "TransformFeedbackVaryingInfo");
  v3 = 20;
  return std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[15]>(spInternalDataNameMap, &v3, &v3, "DefaultLibrary");
}

void DYInternalDataTypeAsString(int a1@<W0>, std::string *a2@<X8>)
{
  __int128 v4;
  _QWORD v5[5];
  int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  __n128 (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  void *__p;
  uint64_t v13;
  uint64_t v14;

  if (sInternalDataNameTableOnce != -1)
    dispatch_once_f(&sInternalDataNameTableOnce, 0, (dispatch_function_t)_BuildInternalDataNameTable);
  v7 = 0;
  v8 = &v7;
  v9 = 0x4002000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v13 = 0;
  v14 = 0;
  __p = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 0x40000000;
  v5[2] = ___Z26DYInternalDataTypeAsStringi_block_invoke;
  v5[3] = &unk_250D63700;
  v6 = a1;
  v5[4] = &v7;
  dispatch_sync((dispatch_queue_t)sInternalDataNameTableQueue, v5);
  if (*((char *)v8 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(a2, (const std::string::value_type *)v8[5], v8[6]);
  }
  else
  {
    v4 = *(_OWORD *)(v8 + 5);
    a2->__r_.__value_.__r.__words[2] = v8[7];
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = v4;
  }
  _Block_object_dispose(&v7, 8);
  if (SHIBYTE(v14) < 0)
    operator delete(__p);
}

void sub_23C6F6944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  _Block_object_dispose(&a15, 8);
  if (a25 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[8]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  uint64_t **v9;
  uint64_t *result;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD v20[3];

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 <= v6)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      for (result = *v9; result; result = (uint64_t *)*result)
      {
        v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == (_DWORD)v6)
            return result;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[8]>(a1, *a2, a3, a4, (uint64_t)v20);
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v18)
  {
    *(_QWORD *)v20[0] = *v18;
    *v18 = v20[0];
  }
  else
  {
    *(_QWORD *)v20[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v20[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v20[0])
    {
      v19 = *(_QWORD *)(*(_QWORD *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7)
          v19 %= v7;
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v19) = v20[0];
    }
  }
  result = (uint64_t *)v20[0];
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_23C6F6BF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[8]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  _QWORD *v10;
  _QWORD *result;

  v9 = a1 + 16;
  v10 = operator new(0x30uLL);
  *(_QWORD *)a5 = v10;
  *(_QWORD *)(a5 + 8) = v9;
  *(_BYTE *)(a5 + 16) = 0;
  *v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(_BYTE *)(a5 + 16) = 1;
  return result;
}

void sub_23C6F6C9C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 47) < 0)
      operator delete(__p[3]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[20]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  uint64_t **v9;
  uint64_t *result;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD v20[3];

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 <= v6)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      for (result = *v9; result; result = (uint64_t *)*result)
      {
        v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == (_DWORD)v6)
            return result;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[20]>(a1, *a2, a3, a4, (uint64_t)v20);
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v18)
  {
    *(_QWORD *)v20[0] = *v18;
    *v18 = v20[0];
  }
  else
  {
    *(_QWORD *)v20[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v20[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v20[0])
    {
      v19 = *(_QWORD *)(*(_QWORD *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7)
          v19 %= v7;
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v19) = v20[0];
    }
  }
  result = (uint64_t *)v20[0];
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_23C6F6F14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[20]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  _QWORD *v10;
  _QWORD *result;

  v9 = a1 + 16;
  v10 = operator new(0x30uLL);
  *(_QWORD *)a5 = v10;
  *(_QWORD *)(a5 + 8) = v9;
  *(_BYTE *)(a5 + 16) = 0;
  *v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(_BYTE *)(a5 + 16) = 1;
  return result;
}

void sub_23C6F6FB8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[21]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  uint64_t **v9;
  uint64_t *result;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD v20[3];

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 <= v6)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      for (result = *v9; result; result = (uint64_t *)*result)
      {
        v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == (_DWORD)v6)
            return result;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[21]>(a1, *a2, a3, a4, (uint64_t)v20);
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v18)
  {
    *(_QWORD *)v20[0] = *v18;
    *v18 = v20[0];
  }
  else
  {
    *(_QWORD *)v20[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v20[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v20[0])
    {
      v19 = *(_QWORD *)(*(_QWORD *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7)
          v19 %= v7;
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v19) = v20[0];
    }
  }
  result = (uint64_t *)v20[0];
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_23C6F71E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[21]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  _QWORD *v10;
  _QWORD *result;

  v9 = a1 + 16;
  v10 = operator new(0x30uLL);
  *(_QWORD *)a5 = v10;
  *(_QWORD *)(a5 + 8) = v9;
  *(_BYTE *)(a5 + 16) = 0;
  *v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(_BYTE *)(a5 + 16) = 1;
  return result;
}

void sub_23C6F7288(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[16]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  uint64_t **v9;
  uint64_t *result;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD v20[3];

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 <= v6)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      for (result = *v9; result; result = (uint64_t *)*result)
      {
        v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == (_DWORD)v6)
            return result;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[16]>(a1, *a2, a3, a4, (uint64_t)v20);
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v18)
  {
    *(_QWORD *)v20[0] = *v18;
    *v18 = v20[0];
  }
  else
  {
    *(_QWORD *)v20[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v20[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v20[0])
    {
      v19 = *(_QWORD *)(*(_QWORD *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7)
          v19 %= v7;
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v19) = v20[0];
    }
  }
  result = (uint64_t *)v20[0];
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_23C6F74B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[16]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  _QWORD *v10;
  _QWORD *result;

  v9 = a1 + 16;
  v10 = operator new(0x30uLL);
  *(_QWORD *)a5 = v10;
  *(_QWORD *)(a5 + 8) = v9;
  *(_BYTE *)(a5 + 16) = 0;
  *v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(_BYTE *)(a5 + 16) = 1;
  return result;
}

void sub_23C6F7558(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[15]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  uint64_t **v9;
  uint64_t *result;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD v20[3];

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 <= v6)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      for (result = *v9; result; result = (uint64_t *)*result)
      {
        v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == (_DWORD)v6)
            return result;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[15]>(a1, *a2, a3, a4, (uint64_t)v20);
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v18)
  {
    *(_QWORD *)v20[0] = *v18;
    *v18 = v20[0];
  }
  else
  {
    *(_QWORD *)v20[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v20[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v20[0])
    {
      v19 = *(_QWORD *)(*(_QWORD *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7)
          v19 %= v7;
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v19) = v20[0];
    }
  }
  result = (uint64_t *)v20[0];
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_23C6F7784(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[15]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  _QWORD *v10;
  _QWORD *result;

  v9 = a1 + 16;
  v10 = operator new(0x30uLL);
  *(_QWORD *)a5 = v10;
  *(_QWORD *)(a5 + 8) = v9;
  *(_BYTE *)(a5 + 16) = 0;
  *v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(_BYTE *)(a5 + 16) = 1;
  return result;
}

void sub_23C6F7828(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[34]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  uint64_t **v9;
  uint64_t *result;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD v20[3];

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 <= v6)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      for (result = *v9; result; result = (uint64_t *)*result)
      {
        v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == (_DWORD)v6)
            return result;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[34]>(a1, *a2, a3, a4, (uint64_t)v20);
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v18)
  {
    *(_QWORD *)v20[0] = *v18;
    *v18 = v20[0];
  }
  else
  {
    *(_QWORD *)v20[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v20[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v20[0])
    {
      v19 = *(_QWORD *)(*(_QWORD *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7)
          v19 %= v7;
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v19) = v20[0];
    }
  }
  result = (uint64_t *)v20[0];
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_23C6F7A54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[34]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  _QWORD *v10;
  _QWORD *result;

  v9 = a1 + 16;
  v10 = operator new(0x30uLL);
  *(_QWORD *)a5 = v10;
  *(_QWORD *)(a5 + 8) = v9;
  *(_BYTE *)(a5 + 16) = 0;
  *v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(_BYTE *)(a5 + 16) = 1;
  return result;
}

void sub_23C6F7AF8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[17]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  uint64_t **v9;
  uint64_t *result;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD v20[3];

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 <= v6)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      for (result = *v9; result; result = (uint64_t *)*result)
      {
        v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == (_DWORD)v6)
            return result;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[17]>(a1, *a2, a3, a4, (uint64_t)v20);
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v18)
  {
    *(_QWORD *)v20[0] = *v18;
    *v18 = v20[0];
  }
  else
  {
    *(_QWORD *)v20[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v20[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v20[0])
    {
      v19 = *(_QWORD *)(*(_QWORD *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7)
          v19 %= v7;
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v19) = v20[0];
    }
  }
  result = (uint64_t *)v20[0];
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_23C6F7D24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[17]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  _QWORD *v10;
  _QWORD *result;

  v9 = a1 + 16;
  v10 = operator new(0x30uLL);
  *(_QWORD *)a5 = v10;
  *(_QWORD *)(a5 + 8) = v9;
  *(_BYTE *)(a5 + 16) = 0;
  *v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(_BYTE *)(a5 + 16) = 1;
  return result;
}

void sub_23C6F7DC8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[12]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  uint64_t **v9;
  uint64_t *result;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD v20[3];

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 <= v6)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      for (result = *v9; result; result = (uint64_t *)*result)
      {
        v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == (_DWORD)v6)
            return result;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[12]>(a1, *a2, a3, a4, (uint64_t)v20);
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v18)
  {
    *(_QWORD *)v20[0] = *v18;
    *v18 = v20[0];
  }
  else
  {
    *(_QWORD *)v20[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v20[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v20[0])
    {
      v19 = *(_QWORD *)(*(_QWORD *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7)
          v19 %= v7;
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v19) = v20[0];
    }
  }
  result = (uint64_t *)v20[0];
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_23C6F7FF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[12]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  _QWORD *v10;
  _QWORD *result;

  v9 = a1 + 16;
  v10 = operator new(0x30uLL);
  *(_QWORD *)a5 = v10;
  *(_QWORD *)(a5 + 8) = v9;
  *(_BYTE *)(a5 + 16) = 0;
  *v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(_BYTE *)(a5 + 16) = 1;
  return result;
}

void sub_23C6F8098(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[11]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  uint64_t **v9;
  uint64_t *result;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD v20[3];

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 <= v6)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      for (result = *v9; result; result = (uint64_t *)*result)
      {
        v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == (_DWORD)v6)
            return result;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[11]>(a1, *a2, a3, a4, (uint64_t)v20);
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v18)
  {
    *(_QWORD *)v20[0] = *v18;
    *v18 = v20[0];
  }
  else
  {
    *(_QWORD *)v20[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v20[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v20[0])
    {
      v19 = *(_QWORD *)(*(_QWORD *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7)
          v19 %= v7;
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v19) = v20[0];
    }
  }
  result = (uint64_t *)v20[0];
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_23C6F82C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[11]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  _QWORD *v10;
  _QWORD *result;

  v9 = a1 + 16;
  v10 = operator new(0x30uLL);
  *(_QWORD *)a5 = v10;
  *(_QWORD *)(a5 + 8) = v9;
  *(_BYTE *)(a5 + 16) = 0;
  *v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(_BYTE *)(a5 + 16) = 1;
  return result;
}

void sub_23C6F8368(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[31]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  uint64_t **v9;
  uint64_t *result;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD v20[3];

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 <= v6)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      for (result = *v9; result; result = (uint64_t *)*result)
      {
        v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == (_DWORD)v6)
            return result;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[31]>(a1, *a2, a3, a4, (uint64_t)v20);
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v18)
  {
    *(_QWORD *)v20[0] = *v18;
    *v18 = v20[0];
  }
  else
  {
    *(_QWORD *)v20[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v20[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v20[0])
    {
      v19 = *(_QWORD *)(*(_QWORD *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7)
          v19 %= v7;
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v19) = v20[0];
    }
  }
  result = (uint64_t *)v20[0];
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_23C6F8594(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[31]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  _QWORD *v10;
  _QWORD *result;

  v9 = a1 + 16;
  v10 = operator new(0x30uLL);
  *(_QWORD *)a5 = v10;
  *(_QWORD *)(a5 + 8) = v9;
  *(_BYTE *)(a5 + 16) = 0;
  *v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(_BYTE *)(a5 + 16) = 1;
  return result;
}

void sub_23C6F8638(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[23]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  uint64_t **v9;
  uint64_t *result;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD v20[3];

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 <= v6)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      for (result = *v9; result; result = (uint64_t *)*result)
      {
        v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == (_DWORD)v6)
            return result;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[23]>(a1, *a2, a3, a4, (uint64_t)v20);
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v18)
  {
    *(_QWORD *)v20[0] = *v18;
    *v18 = v20[0];
  }
  else
  {
    *(_QWORD *)v20[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v20[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v20[0])
    {
      v19 = *(_QWORD *)(*(_QWORD *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7)
          v19 %= v7;
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v19) = v20[0];
    }
  }
  result = (uint64_t *)v20[0];
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_23C6F8864(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[23]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  _QWORD *v10;
  _QWORD *result;

  v9 = a1 + 16;
  v10 = operator new(0x30uLL);
  *(_QWORD *)a5 = v10;
  *(_QWORD *)(a5 + 8) = v9;
  *(_BYTE *)(a5 + 16) = 0;
  *v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(_BYTE *)(a5 + 16) = 1;
  return result;
}

void sub_23C6F8908(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[13]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  uint64_t **v9;
  uint64_t *result;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD v20[3];

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 <= v6)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      for (result = *v9; result; result = (uint64_t *)*result)
      {
        v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == (_DWORD)v6)
            return result;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[13]>(a1, *a2, a3, a4, (uint64_t)v20);
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v18)
  {
    *(_QWORD *)v20[0] = *v18;
    *v18 = v20[0];
  }
  else
  {
    *(_QWORD *)v20[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v20[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v20[0])
    {
      v19 = *(_QWORD *)(*(_QWORD *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7)
          v19 %= v7;
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v19) = v20[0];
    }
  }
  result = (uint64_t *)v20[0];
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_23C6F8B34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[13]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  _QWORD *v10;
  _QWORD *result;

  v9 = a1 + 16;
  v10 = operator new(0x30uLL);
  *(_QWORD *)a5 = v10;
  *(_QWORD *)(a5 + 8) = v9;
  *(_BYTE *)(a5 + 16) = 0;
  *v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(_BYTE *)(a5 + 16) = 1;
  return result;
}

void sub_23C6F8BD8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[29]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  uint64_t **v9;
  uint64_t *result;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD v20[3];

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 <= v6)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      for (result = *v9; result; result = (uint64_t *)*result)
      {
        v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == (_DWORD)v6)
            return result;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[29]>(a1, *a2, a3, a4, (uint64_t)v20);
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v18)
  {
    *(_QWORD *)v20[0] = *v18;
    *v18 = v20[0];
  }
  else
  {
    *(_QWORD *)v20[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v20[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v20[0])
    {
      v19 = *(_QWORD *)(*(_QWORD *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7)
          v19 %= v7;
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v19) = v20[0];
    }
  }
  result = (uint64_t *)v20[0];
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_23C6F8E04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[29]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  _QWORD *v10;
  _QWORD *result;

  v9 = a1 + 16;
  v10 = operator new(0x30uLL);
  *(_QWORD *)a5 = v10;
  *(_QWORD *)(a5 + 8) = v9;
  *(_BYTE *)(a5 + 16) = 0;
  *v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(_BYTE *)(a5 + 16) = 1;
  return result;
}

void sub_23C6F8EA8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int const&,char const* const&>(uint64_t a1, int *a2, _DWORD *a3, char **a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  uint64_t **v9;
  uint64_t *result;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD v20[3];

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 <= v6)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      for (result = *v9; result; result = (uint64_t *)*result)
      {
        v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == (_DWORD)v6)
            return result;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int const&,char const* const&>(a1, *a2, a3, a4, (uint64_t)v20);
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v18)
  {
    *(_QWORD *)v20[0] = *v18;
    *v18 = v20[0];
  }
  else
  {
    *(_QWORD *)v20[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v20[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v20[0])
    {
      v19 = *(_QWORD *)(*(_QWORD *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7)
          v19 %= v7;
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v19) = v20[0];
    }
  }
  result = (uint64_t *)v20[0];
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_23C6F90D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int const&,char const* const&>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char **a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  _QWORD *v10;
  _QWORD *result;

  v9 = a1 + 16;
  v10 = operator new(0x30uLL);
  *(_QWORD *)a5 = v10;
  *(_QWORD *)(a5 + 8) = v9;
  *(_BYTE *)(a5 + 16) = 0;
  *v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, *a4);
  *(_BYTE *)(a5 + 16) = 1;
  return result;
}

void sub_23C6F9178(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::find<int>(_QWORD *a1, int *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  uint64_t **v6;
  uint64_t *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2;
    if (*(_QWORD *)&v2 <= v3)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (*(_QWORD *)&v2 - 1) & v3;
  }
  v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  for (result = *v6; result; result = (uint64_t *)*result)
  {
    v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == (_DWORD)v3)
        return result;
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(_QWORD *)&v2)
          v8 %= *(_QWORD *)&v2;
      }
      else
      {
        v8 &= *(_QWORD *)&v2 - 1;
      }
      if (v8 != v5)
        return 0;
    }
  }
  return result;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

uint64_t _log_assert(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  NSObject *v9;
  char v11[512];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  __vsprintf_chk(v11, 0, 0x200uLL, a4, &a9);
  if (_log_assert_once != -1)
    dispatch_once(&_log_assert_once, &__block_literal_global_10);
  v9 = _log_assert_assertLogger;
  if (os_log_type_enabled((os_log_t)_log_assert_assertLogger, OS_LOG_TYPE_ERROR))
    _log_assert_cold_1((uint64_t)v11, v9);
  return 1;
}

void ___log_assert_block_invoke()
{
  uint64_t v0;

  _log_assert_assertLogger = (uint64_t)os_log_create("com.apple.gdt", "assertions");
  if (!_log_assert_assertLogger)
  {
    v0 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ___log_assert_block_invoke_cold_1();
    _log_assert_assertLogger = v0;
  }
}

char *DYArgumentsCLIDecode(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char **v18;
  size_t v19;
  int v20;
  const char *v21;
  size_t v22;
  _BOOL4 v23;
  BOOL v24;
  int v25;
  const char *v26;
  size_t v27;
  uint64_t v28;
  char *v29;
  malloc_type_id_t v31;

  v7 = *(unsigned int *)(a3 + 8);
  if ((int)v7 >= 1)
  {
    v8 = 0;
    do
    {
      v9 = *(_QWORD *)(a3 + 16) + v8;
      v10 = *(_DWORD *)(v9 + 32);
      v13 = v9 + 40;
      v12 = *(_QWORD *)(v9 + 40);
      v11 = *(_QWORD *)(v13 + 8);
      if (v10)
      {
        if (v10 == 2 || v10 == 1)
          *(_QWORD *)(v11 + a4) = v12;
      }
      else
      {
        *(_BYTE *)(v11 + a4) = v12 != 0;
      }
      v8 += 56;
    }
    while (56 * v7 != v8);
  }
  if (a1 <= 1)
    return 0;
  LODWORD(v14) = 1;
  while ((int)v7 < 1)
  {
LABEL_33:
    LODWORD(v14) = v14 + 1;
    if ((int)v14 >= a1)
      return 0;
  }
  v15 = 0;
  while (1)
  {
    v16 = *(const char **)(a2 + 8 * (int)v14);
    v17 = *(_QWORD *)(a3 + 16);
    v18 = (const char **)(v17 + 56 * v15);
    v19 = strlen(*v18);
    v20 = strncmp(v16, *v18, v19);
    v21 = v18[1];
    if (v21)
    {
      v22 = strlen(v21);
      v23 = strncmp(v16, v21, v22) == 0;
    }
    else
    {
      v23 = 0;
    }
    if (v20)
      v24 = !v23;
    else
      v24 = 0;
    if (v24)
      goto LABEL_32;
    v25 = *(_DWORD *)(v17 + 56 * v15 + 32);
    if (!v25)
    {
      *(_BYTE *)(*(_QWORD *)(v17 + 56 * v15 + 48) + a4) = 1;
      goto LABEL_32;
    }
    if (v25 == 2)
      break;
    if (v25 == 1)
    {
      v14 = (int)v14 + 1;
      if ((_DWORD)v14 == a1)
      {
        v31 = 4052541127;
LABEL_39:
        v29 = (char *)malloc_type_calloc(0x400uLL, 1uLL, v31);
        snprintf(v29, 0x400uLL, "missing argument for %s");
        return v29;
      }
      *(_QWORD *)(*(_QWORD *)(v17 + 56 * v15 + 48) + a4) = *(_QWORD *)(a2 + 8 * v14);
    }
LABEL_32:
    if (++v15 == v7)
      goto LABEL_33;
  }
  v14 = (int)v14 + 1;
  if ((_DWORD)v14 == a1)
  {
    v31 = 3888998730;
    goto LABEL_39;
  }
  v26 = *(const char **)(a2 + 8 * v14);
  v27 = strlen(v26);
  if (!v27)
  {
LABEL_31:
    *(_QWORD *)(*(_QWORD *)(v17 + 56 * v15 + 48) + a4) = atoi(v26);
    goto LABEL_32;
  }
  v28 = 0;
  while ((v26[v28] - 48) < 0xA)
  {
    if (v27 == ++v28)
      goto LABEL_31;
  }
  v29 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xA607A53FuLL);
  snprintf(v29, 0x400uLL, "\"%s\" is not valid number for %s");
  return v29;
}

char *DYArgumentsCLIHelp(uint64_t a1)
{
  const char **v1;
  size_t v3;
  const char *v4;
  int v5;
  size_t v6;
  const char *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  size_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  const char **v23;
  const char *v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  const char *v29;
  int v31;
  char __str[1024];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v1 = *(const char ***)(a1 + 16);
  if (v1)
  {
    if (*(_DWORD *)(a1 + 8))
    {
      v3 = strlen(*v1);
      v4 = getprogname();
      v5 = snprintf(DYArgumentsCLIHelp_buffer, 0x10000uLL, "%s - %s\n\n", v4, *(const char **)a1);
      v6 = 0x10000 - v5;
      v7 = getprogname();
      v8 = snprintf(&DYArgumentsCLIHelp_buffer[v5], v6, "usage: %s ", v7);
      if (*(int *)(a1 + 8) < 1)
      {
        v19 = v5;
      }
      else
      {
        v9 = 0;
        v10 = 0;
        v11 = *(_QWORD *)(a1 + 16);
        v31 = v8;
        LODWORD(v12) = v8;
        do
        {
          v13 = &DYArgumentsCLIHelp_buffer[v5];
          v14 = snprintf(&v13[(int)v12], 0x10000 - v5, "[%s", *(const char **)(v11 + v9)) + (uint64_t)(int)v12;
          v15 = *(_QWORD *)(a1 + 16) + v9;
          if (*(_DWORD *)(v15 + 32))
            LODWORD(v14) = snprintf(&v13[v14], 0x10000 - v5, " %s", *(const char **)(v15 + 24)) + v14;
          v12 = snprintf(&v13[(int)v14], 0x10000 - v5, "] ") + (uint64_t)(int)v14;
          ++v10;
          if ((int)v12 > 80 || (v16 = *(unsigned int *)(a1 + 8), v10 == v16))
          {
            v17 = v5 + (uint64_t)snprintf(&v13[v12], 0x10000 - v5, "\n");
            v5 = snprintf(&DYArgumentsCLIHelp_buffer[v12 + v17], 0x10000 - v17, "%*s", v31, "") + v12 + v17;
            LODWORD(v16) = *(_DWORD *)(a1 + 8);
            LODWORD(v12) = 0;
          }
          v11 = *(_QWORD *)(a1 + 16);
          v18 = strlen(*(const char **)(v11 + v9));
          if (v18 > v3)
            v3 = v18;
          v9 += 56;
        }
        while (v10 < (int)v16);
        v19 = v5;
        v6 = 0x10000 - v5;
        v8 = v12;
      }
      v20 = snprintf(&DYArgumentsCLIHelp_buffer[v19 + v8], v6, "\noptions:\n") + v5;
      if (*(int *)(a1 + 8) >= 1)
      {
        v21 = 0;
        v22 = 0;
        do
        {
          v23 = (const char **)(*(_QWORD *)(a1 + 16) + v21);
          if (v23[1])
            v24 = v23[1];
          else
            v24 = "  ";
          v25 = strlen(*v23);
          v26 = snprintf(__str, 0x400uLL, "%s %s%*s %s", v24, *v23, v3 - v25, "", v23[2]);
          v27 = *(_QWORD *)(a1 + 16);
          v28 = *(_DWORD *)(v27 + v21 + 32);
          if (v28 == 2)
          {
            snprintf(&__str[v26], 0x400uLL, " [default = %zu]", *(_QWORD *)(v27 + v21 + 40));
          }
          else if (v28 == 1)
          {
            v29 = *(const char **)(v27 + v21 + 40);
            if (v29)
              snprintf(&__str[v26], 0x400uLL, " [default = \"%s\"]", v29);
          }
          v20 += snprintf(&DYArgumentsCLIHelp_buffer[v20], 0x10000 - v20, "\t%s\n", __str);
          ++v22;
          v21 += 56;
        }
        while (v22 < *(int *)(a1 + 8));
      }
      DYArgumentsCLIHelp_buffer[v20] = 10;
      v1 = (const char **)(v20 + 1);
    }
    else
    {
      v1 = 0;
    }
  }
  DYArgumentsCLIHelp_buffer[(_QWORD)v1] = 0;
  return DYArgumentsCLIHelp_buffer;
}

void sub_23C6FB26C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x242622C98](v1, 0x1000C40EED21634);
  _Unwind_Resume(a1);
}

void sub_23C6FB32C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x242622C98](v1, 0x1000C40EED21634);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::AlignmentBuffer::CopyAndAlign(GPUTools::AlignmentBuffer *this, const void *__src, size_t __n, uint64_t a4)
{
  size_t v7;
  uint64_t v8;
  unint64_t v9;
  size_t v10;
  char *v11;
  size_t v12;

  v7 = *((_QWORD *)this + 1);
  v8 = (a4 + *((_QWORD *)this + 2) - 1) & -a4;
  v9 = v8 + __n;
  if (v8 + __n <= v7)
  {
    v11 = *(char **)this;
  }
  else
  {
    if (v7)
    {
      if (v9 <= 2 * v7)
        v10 = 2 * v7;
      else
        v10 = v8 + __n;
      *((_QWORD *)this + 1) = v10;
      v11 = (char *)reallocf(*(void **)this, v10);
      *(_QWORD *)this = v11;
      if (!v11)
        dy_abort("failed to reallocate misaligned values buffer");
    }
    else
    {
      if (v9 <= *((_QWORD *)this + 3))
        v12 = *((_QWORD *)this + 3);
      else
        v12 = v8 + __n;
      *((_QWORD *)this + 1) = v12;
      v11 = (char *)malloc_type_malloc(v12, 0x5617A68CuLL);
      *(_QWORD *)this = v11;
      if (!v11)
        dy_abort("failed to allocate misaligned values buffer");
    }
    if ((v11 & 0xF) != 0)
      dy_abort("misaligned misaligned values buffer: %p, required alignment=16", v11);
  }
  memcpy(&v11[v8], __src, __n);
  *((_QWORD *)this + 2) = v9;
  return v8;
}

uint64_t GPUTools::Statistics::Statistics(uint64_t a1, _QWORD *a2, std::vector<unsigned int>::size_type __n)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  std::vector<unsigned int>::pointer begin;
  uint64_t v10;
  std::vector<unsigned int>::size_type v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  unint64_t v19;
  uint64_t v20;
  int64x2_t v21;
  int64x2_t v22;
  const double *v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t *v27;
  std::vector<unsigned int>::size_type v28;
  int64x2_t v29;
  int64x2_t v30;
  int64x2_t v31;
  int64x2_t v32;
  int64x2_t v33;
  int64x2_t v34;
  const double *v35;
  const double *v36;
  const double *v37;
  uint64_t v38;
  unint64_t v39;
  std::vector<unsigned int>::size_type v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  std::vector<unsigned int>::size_type v52;
  unint64_t v53;
  uint64_t v54;
  unsigned int *v55;
  unint64_t v56;
  _QWORD *v57;
  unint64_t v58;
  unsigned int *v59;
  unsigned int v60;
  _QWORD v62[5];
  std::vector<unsigned int> v63;
  float64x2x2_t v64;
  float64x2x2_t v65;
  float64x2x2_t v66;
  float64x2x2_t v67;

  *(_QWORD *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  if (!a2 || !__n)
    return a1;
  v6 = __n - 1;
  if (__n == 1)
  {
    v7 = *a2;
    *(_QWORD *)(a1 + 16) = *a2;
    *(_QWORD *)(a1 + 24) = v7;
    *(_QWORD *)a1 = v7;
    *(_QWORD *)(a1 + 8) = v7;
    *(_QWORD *)(a1 + 32) = v7;
    *(_QWORD *)(a1 + 40) = v7;
    v8 = 2 * a2[1];
    *(_QWORD *)(a1 + 48) = v8 * v7;
    *(_QWORD *)(a1 + 56) = v8;
    *(_QWORD *)(a1 + 64) = v7;
    return a1;
  }
  memset(&v63, 0, sizeof(v63));
  std::vector<unsigned int>::__append(&v63, __n);
  begin = v63.__begin_;
  v10 = *(_QWORD *)(a1 + 40);
  if (__n < 8)
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    goto LABEL_7;
  }
  v12 = 0;
  v11 = 0;
  if ((_DWORD)v6 == -1)
  {
    v13 = 0;
    do
    {
LABEL_7:
      begin[v11] = v12;
      v14 = a2[2 * v11 + 1];
      v13 += v14;
      v10 += a2[2 * v11] * v14;
      v11 = ++v12;
    }
    while (v12 < __n);
    goto LABEL_8;
  }
  v13 = 0;
  if (HIDWORD(v6))
    goto LABEL_7;
  v11 = __n & 0xFFFFFFFFFFFFFFF8;
  v12 = __n & 0xFFFFFFF8;
  v21 = 0uLL;
  v22 = (int64x2_t)*(unint64_t *)(a1 + 40);
  v23 = (const double *)(a2 + 8);
  v24.i64[0] = 0x400000004;
  v24.i64[1] = 0x400000004;
  v25.i64[0] = 0x800000008;
  v25.i64[1] = 0x800000008;
  v26 = (int32x4_t)xmmword_23C70CD40;
  v27 = (int32x4_t *)(v63.__begin_ + 4);
  v28 = __n & 0xFFFFFFFFFFFFFFF8;
  v29 = 0uLL;
  v30 = 0uLL;
  v31 = 0uLL;
  v32 = 0uLL;
  v33 = 0uLL;
  v34 = 0uLL;
  do
  {
    v27[-1] = v26;
    *v27 = vaddq_s32(v26, v24);
    v35 = v23 - 8;
    v64 = vld2q_f64(v35);
    v36 = v23 - 4;
    v65 = vld2q_f64(v36);
    v37 = v23;
    v66 = vld2q_f64(v37);
    v37 += 4;
    v67 = vld2q_f64(v37);
    v32 = vaddq_s64((int64x2_t)v65.val[1], v32);
    v31 = vaddq_s64((int64x2_t)v64.val[1], v31);
    v33 = vaddq_s64((int64x2_t)v66.val[1], v33);
    *(_QWORD *)&v64.val[0].f64[0] *= *(_QWORD *)&v64.val[1].f64[0];
    v34 = vaddq_s64((int64x2_t)v67.val[1], v34);
    *(_QWORD *)&v64.val[1].f64[0] = *(_QWORD *)&v65.val[0].f64[0] * *(_QWORD *)&v65.val[1].f64[0];
    *(_QWORD *)&v64.val[0].f64[1] *= *(_QWORD *)&v64.val[1].f64[1];
    *(_QWORD *)&v64.val[1].f64[1] = *(_QWORD *)&v65.val[0].f64[1] * *(_QWORD *)&v65.val[1].f64[1];
    *(_QWORD *)&v65.val[0].f64[0] = *(_QWORD *)&v67.val[0].f64[0] * *(_QWORD *)&v67.val[1].f64[0];
    *(_QWORD *)&v65.val[0].f64[1] = *(_QWORD *)&v67.val[0].f64[1] * *(_QWORD *)&v67.val[1].f64[1];
    *(_QWORD *)&v65.val[1].f64[0] = *(_QWORD *)&v66.val[0].f64[0] * *(_QWORD *)&v66.val[1].f64[0];
    *(_QWORD *)&v65.val[1].f64[1] = *(_QWORD *)&v66.val[0].f64[1] * *(_QWORD *)&v66.val[1].f64[1];
    v21 = vaddq_s64(v21, (int64x2_t)v64.val[1]);
    v22 = vaddq_s64(v22, (int64x2_t)v64.val[0]);
    v29 = vaddq_s64(v29, (int64x2_t)v65.val[1]);
    v30 = vaddq_s64(v30, (int64x2_t)v65.val[0]);
    v26 = vaddq_s32(v26, v25);
    v23 += 16;
    v27 += 2;
    v28 -= 8;
  }
  while (v28);
  v13 = vaddvq_s64(vaddq_s64(vaddq_s64(v33, v31), vaddq_s64(v34, v32)));
  v10 = vaddvq_s64(vaddq_s64(vaddq_s64(v29, v22), vaddq_s64(v30, v21)));
  if (v11 != __n)
    goto LABEL_7;
LABEL_8:
  v15 = MEMORY[0x24BDAC760];
  *(_QWORD *)(a1 + 40) = v10;
  v62[0] = v15;
  v62[1] = 0x40000000;
  v62[2] = ___ZN8GPUTools10StatisticsC2EPKNS0_7elementEm_block_invoke;
  v62[3] = &__block_descriptor_tmp_3;
  v62[4] = a2;
  qsort_b(begin, __n, 4uLL, v62);
  v16 = 0;
  v17 = 0;
  *(_QWORD *)(a1 + 40) = (*(_QWORD *)(a1 + 40) + (v13 >> 1)) / v13;
  v18 = v63.__begin_;
  *(_QWORD *)a1 = a2[2 * *v63.__begin_];
  *(_QWORD *)(a1 + 32) = a2[2 * v18[v6]];
  v19 = 2 * v13;
  while (1)
  {
    v20 = v18[v17];
    v16 += 4 * a2[2 * v20 + 1];
    if (v16 == v19)
    {
      v38 = (a2[2 * v18[v17 + 1]] + a2[2 * v20]) >> 1;
      goto LABEL_21;
    }
    if (v16 > v19)
      break;
    if (__n == ++v17)
      goto LABEL_22;
  }
  v38 = a2[2 * v20];
LABEL_21:
  *(_QWORD *)(a1 + 16) = v38;
LABEL_22:
  v39 = 0;
  v40 = 0;
  while (1)
  {
    v39 += 4 * a2[2 * v18[v40] + 1];
    v41 = v39 - v13;
    if (v39 > v13)
      break;
    if (__n == ++v40)
    {
      v40 = __n;
      break;
    }
  }
  if (v6 >= v40)
  {
    v42 = 0;
    do
    {
      v42 += 4 * a2[2 * v18[v6] + 1];
      if (v42 > v13)
        break;
      --v6;
    }
    while (v6 >= v40);
  }
  else
  {
    v42 = 0;
  }
  v43 = v42 - v13;
  v44 = v18[v40];
  if (v40 == v6)
  {
    v45 = &a2[2 * v44];
    v46 = *v45;
    *(_QWORD *)(a1 + 24) = *v45;
    *(_QWORD *)(a1 + 8) = v46;
    v19 = v43 + v41 - 4 * v45[1];
    *(_QWORD *)(a1 + 56) = v19;
    v47 = v19 * v46;
  }
  else
  {
    if (v41 == 4 * a2[2 * v44 + 1])
    {
      v48 = a2[2 * v44];
      v49 = (v48 + a2[2 * v18[v40 - 1]]) >> 1;
    }
    else
    {
      v48 = a2[2 * v44];
      v49 = v48;
    }
    *(_QWORD *)(a1 + 8) = v49;
    v50 = a2[2 * v18[v6]];
    v51 = v50;
    if (v43 == 4 * a2[2 * v18[v6] + 1])
      v51 = (a2[2 * v18[v6 + 1]] + v50) >> 1;
    *(_QWORD *)(a1 + 24) = v51;
    *(_QWORD *)(a1 + 56) = v19;
    v47 = v48 * v41 + v50 * v43;
    v52 = v40 + 1;
    if (v40 + 1 < v6)
    {
      v53 = v6 + ~v40;
      if (v53 < 2)
        goto LABEL_43;
      v54 = 0;
      v52 += v53 & 0xFFFFFFFFFFFFFFFELL;
      v55 = &v18[v40 + 2];
      v56 = v53 & 0xFFFFFFFFFFFFFFFELL;
      do
      {
        v57 = &a2[2 * *(v55 - 1)];
        v47 += 4 * *v57 * v57[1];
        v54 += 4 * a2[2 * *v55] * a2[2 * *v55 + 1];
        v55 += 2;
        v56 -= 2;
      }
      while (v56);
      v47 += v54;
      if (v53 != (v53 & 0xFFFFFFFFFFFFFFFELL))
      {
LABEL_43:
        v58 = v6 - v52;
        v59 = &v18[v52];
        do
        {
          v60 = *v59++;
          v47 += 4 * a2[2 * v60] * a2[2 * v60 + 1];
          --v58;
        }
        while (v58);
      }
    }
  }
  *(_QWORD *)(a1 + 48) = v47;
  *(_QWORD *)(a1 + 64) = (v47 + (v19 >> 1)) / v19;
  v63.__end_ = v18;
  operator delete(v18);
  return a1;
}

void sub_23C6FBABC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN8GPUTools10StatisticsC2EPKNS0_7elementEm_block_invoke(uint64_t a1, unsigned int *a2, unsigned int *a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  _BOOL4 v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 16 * *a2);
  v5 = *(_QWORD *)(v3 + 16 * *a3);
  v6 = v4 >= v5;
  v7 = v4 > v5;
  if (v6)
    return v7;
  else
    return 0xFFFFFFFFLL;
}

void std::vector<unsigned int>::__append(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  unsigned int *value;
  std::vector<unsigned int>::pointer end;
  unsigned int *v6;
  std::vector<unsigned int>::pointer begin;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  char *v14;
  size_t v15;
  unsigned int *v16;
  unsigned int *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _OWORD *v21;
  __int128 *v22;
  uint64_t v23;
  __int128 v24;
  int v25;

  end = this->__end_;
  value = this->__end_cap_.__value_;
  v6 = end;
  if (__n <= value - end)
  {
    if (__n)
    {
      bzero(end, 4 * __n);
      v6 = &end[__n];
    }
    this->__end_ = v6;
  }
  else
  {
    begin = this->__begin_;
    v8 = (char *)end - (char *)this->__begin_;
    v9 = v8 >> 2;
    v10 = (v8 >> 2) + __n;
    if (v10 >> 62)
      std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
    v11 = (char *)value - (char *)begin;
    if (v11 >> 1 > v10)
      v10 = v11 >> 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL)
      v12 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      if (v12 >> 62)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v13 = operator new(4 * v12);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[4 * v9];
    v15 = 4 * __n;
    v16 = (unsigned int *)&v13[4 * v12];
    bzero(v14, v15);
    v17 = (unsigned int *)&v14[v15];
    if (end != begin)
    {
      v18 = (char *)end - (char *)begin - 4;
      if (v18 < 0x2C)
        goto LABEL_29;
      if ((unint64_t)((char *)end - v13 - v8) < 0x20)
        goto LABEL_29;
      v19 = (v18 >> 2) + 1;
      v20 = 4 * (v19 & 0x7FFFFFFFFFFFFFF8);
      v6 = &end[v20 / 0xFFFFFFFFFFFFFFFCLL];
      v14 -= v20;
      v21 = &v13[4 * v9 - 16];
      v22 = (__int128 *)(end - 4);
      v23 = v19 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v24 = *v22;
        *(v21 - 1) = *(v22 - 1);
        *v21 = v24;
        v21 -= 2;
        v22 -= 2;
        v23 -= 8;
      }
      while (v23);
      if (v19 != (v19 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_29:
        do
        {
          v25 = *--v6;
          *((_DWORD *)v14 - 1) = v25;
          v14 -= 4;
        }
        while (v6 != begin);
      }
    }
    this->__begin_ = (std::vector<unsigned int>::pointer)v14;
    this->__end_ = v17;
    this->__end_cap_.__value_ = v16;
    if (begin)
      operator delete(begin);
  }
}

uint64_t GPUTools::SM::DecodeArgumentToString(std::string *a1, uint64_t a2, int a3, unsigned int a4)
{
  __int16 v8;
  const char *v9;
  const char *v10;
  size_t v11;
  void **v12;
  void **v13;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  size_t v18;
  void *__p[2];
  char v20;
  _QWORD v21[11];
  char v22;
  uint64_t v23;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v21);
  v8 = *(_WORD *)(a2 + 22);
  if ((v8 & 1) != 0)
  {
    if (*(unsigned __int16 *)(a2 + 20) <= a4)
      goto LABEL_3;
  }
  else if (a4)
  {
LABEL_3:
    if ((a3 & 1) != 0)
      goto LABEL_44;
    v9 = "";
LABEL_12:
    MEMORY[0x242622B18](a1, v9);
    goto LABEL_44;
  }
  v10 = *(const char **)a2;
  if (!*(_QWORD *)a2)
  {
    if (a3)
    {
      std::string::push_back(a1, 32);
      std::string::append(a1, "null");
      goto LABEL_44;
    }
    v9 = "null";
    goto LABEL_12;
  }
  switch(*(_DWORD *)(a2 + 8))
  {
    case 1:
    case 2:
      LOBYTE(__p[0]) = v10[a4];
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)__p, 1);
      goto LABEL_33;
    case 3:
      std::ostream::operator<<();
      goto LABEL_33;
    case 4:
      std::ostream::operator<<();
      goto LABEL_33;
    case 5:
      if (*(_DWORD *)(a2 + 12) == 19)
        goto LABEL_23;
      std::ostream::operator<<();
      goto LABEL_33;
    case 6:
      goto LABEL_32;
    case 7:
      std::ostream::operator<<();
      goto LABEL_33;
    case 8:
      std::ostream::operator<<();
      goto LABEL_33;
    case 9:
      std::ostream::operator<<();
      goto LABEL_33;
    case 0xA:
LABEL_23:
      std::ostream::operator<<();
      goto LABEL_33;
    case 0xB:
      std::ostream::operator<<();
      goto LABEL_33;
    case 0xC:
      std::ostream::operator<<();
      goto LABEL_33;
    case 0xD:
      if ((v8 & 0x10) != 0)
      {
        GPUTools::FD::Argument::ViewAsGLObjectName((const char **)a2);
LABEL_32:
        std::ostream::operator<<();
      }
      else if ((v8 & 0x18) != 0 || *(_DWORD *)(a2 + 12) == 14)
      {
        if ((v8 & 1) != 0)
        {
          v15 = GPUTools::FD::Argument::ViewAsCStringArray((GPUTools::FD::Argument *)a2);
          v16 = *(_QWORD *)v15;
          if ((*(_WORD *)(v15 + 22) & 0x40) != 0)
            v17 = (const char *)(*(unsigned int *)(v16 + 4 * a4) + v16);
          else
            v17 = *(const char **)(v16 + 8 * a4);
          v18 = strlen(v17);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)v17, v18);
        }
        else
        {
          v11 = strlen(*(const char **)a2);
LABEL_15:
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)v10, v11);
        }
      }
LABEL_33:
      if ((a3 & 1) != 0)
      {
        std::string::append(a1, " ");
        std::stringbuf::str();
        if (v20 >= 0)
          v12 = __p;
        else
          v12 = (void **)__p[0];
        std::string::append(a1, (const std::string::value_type *)v12);
      }
      else
      {
        std::stringbuf::str();
        if (v20 >= 0)
          v13 = __p;
        else
          v13 = (void **)__p[0];
        MEMORY[0x242622B18](a1, v13);
      }
      if (v20 < 0)
        operator delete(__p[0]);
      break;
    default:
      v10 = "UnknownParameterType";
      v11 = 20;
      goto LABEL_15;
  }
LABEL_44:
  v21[0] = *MEMORY[0x24BEDB800];
  *(_QWORD *)((char *)v21 + *(_QWORD *)(v21[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  v21[1] = MEMORY[0x24BEDB848] + 16;
  if (v22 < 0)
    operator delete((void *)v21[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x242622C5C](&v23);
}

void sub_23C6FBFF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  std::ios_base *v6;

  v2 = MEMORY[0x24BEDB870];
  v3 = MEMORY[0x24BEDB870] + 64;
  *(_QWORD *)(a1 + 112) = MEMORY[0x24BEDB870] + 64;
  v4 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  v5 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + *(_QWORD *)(v4 - 24)) = v5;
  v6 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v6, (void *)(a1 + 8));
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 112) = v3;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 8) = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_23C6FC0F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x242622C5C](v1);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 8) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x242622C5C](a1 + 112);
  return a1;
}

uint64_t GPUTools::SM::__DYDecodeArgumentSingleComponentDispatch(std::string *a1, uint64_t a2, unsigned int a3)
{
  return GPUTools::SM::DecodeArgumentToString(a1, a2, 0, a3);
}

uint64_t GPUTools::SM::__DYDecodeArgumentDispatch(std::string *a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  uint64_t v6;
  uint64_t result;
  unsigned int v8;

  v6 = a2 + 24 * a3 + 48;
  result = GPUTools::SM::DecodeArgumentToString(a1, v6, 0, 0);
  if (a4 >= 2)
  {
    v8 = 1;
    do
      result = GPUTools::SM::DecodeArgumentToString(a1, v6, 1, v8++);
    while (a4 != v8);
  }
  return result;
}

float GPUTools::SM::__DYDecodeArgumentDispatch(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  _OWORD v7[4];

  memset(v7, 0, sizeof(v7));
  GPUTools::SM::DYDecodeArgumentToVecNType<GPUTools::SM::VecN<float,16u>>(v7, a2, a3, a4, a5);
  return DYMtxSetColumnMajor(a1, (uint64_t)v7);
}

{
  float result;
  uint64_t v7;
  float v8;

  v8 = 0.0;
  v7 = 0;
  GPUTools::SM::DYDecodeArgumentToVecNType<GPUTools::SM::VecN<float,3u>>(&v7, a2, a3, a4, a5);
  *(_QWORD *)a1 = v7;
  result = v8;
  *(float *)(a1 + 8) = v8;
  return result;
}

void GPUTools::SM::DYDecodeArgumentToVecNType<GPUTools::SM::VecN<float,16u>>(_DWORD *a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  unsigned int v5;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v14;

  v5 = a3;
  v8 = a2 + 24 * a3;
  if ((*(_WORD *)(v8 + 70) & 1) != 0)
  {
    v11 = *(unsigned __int16 *)(a2 + 24 * a3 + 68);
    if (v11 >= 0x10)
      v11 = 16;
    if (v11 >= a4)
      v12 = a4;
    else
      v12 = v11;
    if ((_DWORD)v12)
    {
      v14 = v8 + 48;
      do
      {
        *a1++ = GPUTools::FD::Argument::ViewAsScalarArray<float>(v14, a5++).n128_u32[0];
        --v12;
      }
      while (v12);
    }
  }
  else
  {
    v9 = *(unsigned __int16 *)(a2 + 10) - a3;
    if (v9 >= a4)
      v9 = a4;
    if (v9 >= 0x10)
      v10 = 16;
    else
      v10 = v9;
    if ((_DWORD)v10)
    {
      do
      {
        *a1++ = GPUTools::FD::Argument::ViewAsScalarArray<float>(a2 + 24 * (unint64_t)v5++ + 48, 0).n128_u32[0];
        --v10;
      }
      while (v10);
    }
  }
}

double GPUTools::SM::__DYDecodeArgumentDispatch(_OWORD *a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  double result;
  __int128 v7;

  v7 = 0uLL;
  GPUTools::SM::DYDecodeArgumentToVecNType<GPUTools::SM::VecN<float,4u>>(&v7, a2, a3, a4, a5);
  result = *(double *)&v7;
  *a1 = v7;
  return result;
}

void GPUTools::SM::DYDecodeArgumentToVecNType<GPUTools::SM::VecN<float,4u>>(_DWORD *a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  unsigned int v5;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v14;

  v5 = a3;
  v8 = a2 + 24 * a3;
  if ((*(_WORD *)(v8 + 70) & 1) != 0)
  {
    v11 = *(unsigned __int16 *)(a2 + 24 * a3 + 68);
    if (v11 >= 4)
      v11 = 4;
    if (v11 >= a4)
      v12 = a4;
    else
      v12 = v11;
    if ((_DWORD)v12)
    {
      v14 = v8 + 48;
      do
      {
        *a1++ = GPUTools::FD::Argument::ViewAsScalarArray<float>(v14, a5++).n128_u32[0];
        --v12;
      }
      while (v12);
    }
  }
  else
  {
    v9 = *(unsigned __int16 *)(a2 + 10) - a3;
    if (v9 >= a4)
      v9 = a4;
    if (v9 >= 4)
      v10 = 4;
    else
      v10 = v9;
    if ((_DWORD)v10)
    {
      do
      {
        *a1++ = GPUTools::FD::Argument::ViewAsScalarArray<float>(a2 + 24 * (unint64_t)v5++ + 48, 0).n128_u32[0];
        --v10;
      }
      while (v10);
    }
  }
}

void GPUTools::SM::DYDecodeArgumentToVecNType<GPUTools::SM::VecN<float,3u>>(_DWORD *a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  unsigned int v5;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v14;

  v5 = a3;
  v8 = a2 + 24 * a3;
  if ((*(_WORD *)(v8 + 70) & 1) != 0)
  {
    v11 = *(unsigned __int16 *)(a2 + 24 * a3 + 68);
    if (v11 >= 3)
      v11 = 3;
    if (v11 >= a4)
      v12 = a4;
    else
      v12 = v11;
    if ((_DWORD)v12)
    {
      v14 = v8 + 48;
      do
      {
        *a1++ = GPUTools::FD::Argument::ViewAsScalarArray<float>(v14, a5++).n128_u32[0];
        --v12;
      }
      while (v12);
    }
  }
  else
  {
    v9 = *(unsigned __int16 *)(a2 + 10) - a3;
    if (v9 >= a4)
      v9 = a4;
    if (v9 >= 3)
      v10 = 3;
    else
      v10 = v9;
    if ((_DWORD)v10)
    {
      do
      {
        *a1++ = GPUTools::FD::Argument::ViewAsScalarArray<float>(a2 + 24 * (unint64_t)v5++ + 48, 0).n128_u32[0];
        --v10;
      }
      while (v10);
    }
  }
}

__n128 GPUTools::FD::Argument::ViewAsScalarArray<float>(uint64_t a1, unint64_t a2)
{
  __int16 v2;
  __n128 result;
  double v4;
  int v5;

  v2 = *(_WORD *)(a1 + 22);
  if ((v2 & 1) != 0)
  {
    result.n128_u32[0] = 0;
    if (*(unsigned __int16 *)(a1 + 20) <= a2)
      return result;
  }
  else
  {
    result.n128_u32[0] = 0;
    if (a2)
      return result;
  }
  switch(*(_DWORD *)(a1 + 8))
  {
    case 1:
      v5 = *(char *)(*(_QWORD *)a1 + a2);
      goto LABEL_18;
    case 2:
      result.n128_u8[0] = *(_BYTE *)(*(_QWORD *)a1 + a2);
      goto LABEL_20;
    case 3:
      v5 = *(__int16 *)(*(_QWORD *)a1 + 2 * a2);
      goto LABEL_18;
    case 4:
      result.n128_u16[0] = *(_WORD *)(*(_QWORD *)a1 + 2 * a2);
      goto LABEL_20;
    case 5:
      v5 = *(_DWORD *)(*(_QWORD *)a1 + 4 * a2);
      if (*(_DWORD *)(a1 + 12) == 19)
      {
        v4 = (double)v5 * 0.0000152587891;
LABEL_17:
        result.n128_f32[0] = v4;
      }
      else
      {
LABEL_18:
        result.n128_f32[0] = (float)v5;
      }
      break;
    case 6:
      result.n128_u32[0] = *(_DWORD *)(*(_QWORD *)a1 + 4 * a2);
LABEL_20:
      result.n128_f32[0] = (float)result.n128_u32[0];
      return result;
    case 7:
    case 0xB:
      result.n128_f32[0] = (float)*(uint64_t *)(*(_QWORD *)a1 + 8 * a2);
      return result;
    case 8:
    case 0xC:
      result.n128_f32[0] = (float)*(unint64_t *)(*(_QWORD *)a1 + 8 * a2);
      return result;
    case 9:
      result.n128_u32[0] = *(_DWORD *)(*(_QWORD *)a1 + 4 * a2);
      return result;
    case 0xA:
      v4 = *(double *)(*(_QWORD *)a1 + 8 * a2);
      goto LABEL_17;
    case 0xD:
      if ((v2 & 0x10) != 0)
        result.n128_f32[0] = (float)GPUTools::FD::Argument::ViewAsGLObjectName((const char **)a1);
      return result;
    default:
      return result;
  }
  return result;
}

uint64_t DYGetHostInfo(void)
{
  return gHostInfo;
}

uint64_t DYSetHostInfo(uint64_t result)
{
  gHostInfo = result;
  return result;
}

void sub_23C6FCE50(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

unint64_t handle_exit(void)
{
  unint64_t result;
  uint64_t v1;
  int v2;
  id v3;

  result = objc_msgSend((id)_gWeakAppClients, "count");
  if (result)
  {
    v1 = 0;
    v2 = 0;
    do
    {
      v3 = (id)objc_msgSend((id)_gWeakAppClients, "pointerAtIndex:", v1);
      objc_msgSend(v3, "atexit");

      v1 = ++v2;
      result = objc_msgSend((id)_gWeakAppClients, "count");
    }
    while (result > v2);
  }
  return result;
}

uint64_t GPUTools::FB::Stream::Flush(GPUTools::FB::Stream *this)
{
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t result;

  v2 = (unsigned int *)((char *)this + 56);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(1u, v2));
  if (v3 == 1)
  {
    do
    {
      while (*v2 == 1)
        ;
      do
        v4 = __ldaxr(v2);
      while (__stlxr(1u, v2));
    }
    while (v4 == 1);
  }
  result = (*(uint64_t (**)(void))(*((_QWORD *)this + 5) + 16))();
  *((_QWORD *)this + 2) = *((_QWORD *)this + 1) + 8;
  *((_BYTE *)this + 60) = 1;
  atomic_store(0, (unsigned int *)this + 14);
  return result;
}

void sub_23C6FD530(_Unwind_Exception *a1)
{
  unsigned int *v1;

  atomic_store(0, v1);
  _Unwind_Resume(a1);
}

void sub_23C6FDD34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<void const*,std::string>::unordered_map(uint64_t a1, uint64_t a2)
{
  _QWORD *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, *(_QWORD *)(a2 + 8));
  for (i = *(_QWORD **)(a2 + 16); i; i = (_QWORD *)*i)
    std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::__emplace_unique_key_args<void const*,std::pair<void const* const,std::string> const&>(a1, i + 2, (uint64_t)(i + 2));
  return a1;
}

void sub_23C6FEBB0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::__emplace_unique_key_args<void const*,std::pair<void const* const,std::string> const&>(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v5;
  unint64_t v6;
  std::string::size_type v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD *v10;
  _QWORD *result;
  unint64_t v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  _QWORD *v19;
  unint64_t v20;
  _QWORD *v21;

  v5 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  v6 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v5 >> 47) ^ v5);
  v7 = 0x9DDFEA08EB382D69 * (v6 ^ (v6 >> 47));
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v3 = 0x9DDFEA08EB382D69 * (v6 ^ (v6 >> 47));
      if (v7 >= v8)
        v3 = v7 % v8;
    }
    else
    {
      v3 = v7 & (v8 - 1);
    }
    v10 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
    if (v10)
    {
      result = (_QWORD *)*v10;
      if (*v10)
      {
        do
        {
          v12 = result[1];
          if (v12 == v7)
          {
            if (result[2] == *a2)
              return result;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v3)
              break;
          }
          result = (_QWORD *)*result;
        }
        while (result);
      }
    }
  }
  std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::__construct_node_hash<std::pair<void const* const,std::string> const&>(a1, v7, a3, (uint64_t)&v21);
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    v15 = 1;
    if (v8 >= 3)
      v15 = (v8 & (v8 - 1)) != 0;
    v16 = v15 | (2 * v8);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v18);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v3 = v7 % v8;
      else
        v3 = v7;
    }
    else
    {
      v3 = (v8 - 1) & v7;
    }
  }
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v19)
  {
    *v21 = *v19;
    *v19 = v21;
  }
  else
  {
    *v21 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v21;
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*v21)
    {
      v20 = *(_QWORD *)(*v21 + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v20 >= v8)
          v20 %= v8;
      }
      else
      {
        v20 &= v8 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v20) = v21;
    }
  }
  result = v21;
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_23C6FEE10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::__construct_node_hash<std::pair<void const* const,std::string> const&>(uint64_t a1@<X0>, std::string::size_type a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  std::string *v8;
  std::string *v9;

  v7 = a1 + 16;
  v8 = (std::string *)operator new(0x30uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  v8->__r_.__value_.__l.__size_ = a2;
  v8->__r_.__value_.__r.__words[2] = *(_QWORD *)a3;
  v9 = v8 + 1;
  if (*(char *)(a3 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)(a3 + 8), *(_QWORD *)(a3 + 16));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)(a3 + 8);
    v9->__r_.__value_.__r.__words[2] = *(_QWORD *)(a3 + 24);
  }
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_23C6FEEC8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::__deallocate_node(int a1, void **__p)
{
  void **v2;
  void **v3;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 47) < 0)
        operator delete(v2[3]);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::unordered_map<unsigned long long,std::string>::unordered_map(uint64_t a1, uint64_t a2)
{
  _QWORD *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, *(_QWORD *)(a2 + 8));
  for (i = *(_QWORD **)(a2 + 16); i; i = (_QWORD *)*i)
    std::__hash_table<std::__hash_value_type<unsigned long long,std::string>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::string>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::string>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::string>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long const,std::string> const&>(a1, i + 2, (uint64_t)(i + 2));
  return a1;
}

void sub_23C6FEFBC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,std::string>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::string>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::string>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::string>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long const,std::string> const&>(uint64_t a1, std::string::size_type *a2, uint64_t a3)
{
  std::string::size_type v3;
  std::string::size_type v5;
  unint64_t v6;
  uint8x8_t v7;
  _QWORD *v8;
  _QWORD *result;
  unint64_t v10;
  float v11;
  float v12;
  _BOOL8 v13;
  unint64_t v14;
  unint64_t v15;
  size_t v16;
  _QWORD *v17;
  unint64_t v18;
  _QWORD *v19;

  v5 = *a2;
  v6 = *(_QWORD *)(a1 + 8);
  if (v6)
  {
    v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v5 >= v6)
        v3 = v5 % v6;
    }
    else
    {
      v3 = (v6 - 1) & v5;
    }
    v8 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
    if (v8)
    {
      result = (_QWORD *)*v8;
      if (*v8)
      {
        do
        {
          v10 = result[1];
          if (v10 == v5)
          {
            if (result[2] == v5)
              return result;
          }
          else
          {
            if (v7.u32[0] > 1uLL)
            {
              if (v10 >= v6)
                v10 %= v6;
            }
            else
            {
              v10 &= v6 - 1;
            }
            if (v10 != v3)
              break;
          }
          result = (_QWORD *)*result;
        }
        while (result);
      }
    }
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,std::string>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::string>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::string>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::string>>>::__construct_node_hash<std::pair<unsigned long long const,std::string> const&>(a1, *a2, a3, (uint64_t)&v19);
  v11 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v12 = *(float *)(a1 + 32);
  if (!v6 || (float)(v12 * (float)v6) < v11)
  {
    v13 = 1;
    if (v6 >= 3)
      v13 = (v6 & (v6 - 1)) != 0;
    v14 = v13 | (2 * v6);
    v15 = vcvtps_u32_f32(v11 / v12);
    if (v14 <= v15)
      v16 = v15;
    else
      v16 = v14;
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v16);
    v6 = *(_QWORD *)(a1 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v5 >= v6)
        v3 = v5 % v6;
      else
        v3 = v5;
    }
    else
    {
      v3 = (v6 - 1) & v5;
    }
  }
  v17 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v17)
  {
    *v19 = *v17;
    *v17 = v19;
  }
  else
  {
    *v19 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v19;
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*v19)
    {
      v18 = *(_QWORD *)(*v19 + 8);
      if ((v6 & (v6 - 1)) != 0)
      {
        if (v18 >= v6)
          v18 %= v6;
      }
      else
      {
        v18 &= v6 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v18) = v19;
    }
  }
  result = v19;
  ++*(_QWORD *)(a1 + 24);
  return result;
}

void sub_23C6FF1E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<unsigned long long,std::string>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::string>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::string>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::string>>>::__construct_node_hash<std::pair<unsigned long long const,std::string> const&>(uint64_t a1@<X0>, std::string::size_type a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  std::string *v8;
  std::string *v9;

  v7 = a1 + 16;
  v8 = (std::string *)operator new(0x30uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  v8->__r_.__value_.__l.__size_ = a2;
  v8->__r_.__value_.__r.__words[2] = *(_QWORD *)a3;
  v9 = v8 + 1;
  if (*(char *)(a3 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)(a3 + 8), *(_QWORD *)(a3 + 16));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)(a3 + 8);
    v9->__r_.__value_.__r.__words[2] = *(_QWORD *)(a3 + 24);
  }
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_23C6FF29C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t dy_dispatch(uint64_t a1, uint64_t a2, int a3, uint64_t a4, _DWORD *a5, __n128 a6, __n128 a7, __n128 a8)
{
  uint64_t (*v9)(uint64_t, _QWORD);
  uint64_t (*v10)(uint64_t, _QWORD, _QWORD, _QWORD);
  uint64_t (*v11)(uint64_t, _QWORD, _QWORD);
  uint64_t result;
  uint64_t (*v13)(uint64_t, _QWORD, _QWORD, _QWORD);
  uint64_t (*v14)(uint64_t, float, float, float, float);
  uint64_t (*v15)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t (*v26)(uint64_t, _QWORD, _QWORD);
  uint64_t (*v27)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD);
  uint64_t (*v28)(uint64_t, _QWORD, _QWORD, _QWORD);
  uint64_t (*v29)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t (*v30)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t (*v31)(uint64_t, _QWORD, _QWORD, float);
  uint64_t (*v32)(uint64_t, float);
  uint64_t (*v33)(uint64_t, _QWORD);
  unsigned int *v34;
  float *v35;
  uint64_t (*v36)(uint64_t, _QWORD, __n128, __n128, float, float);
  uint64_t (*v37)(uint64_t, float, float);
  uint64_t (*v38)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t (*v39)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v40)(uint64_t, float, float, float);
  uint64_t (*v41)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t (*v42)(uint64_t, _QWORD, float, float);
  uint64_t (*v43)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  float *v48;
  uint64_t (*v49)(uint64_t, __n128, __n128, __n128, float, float, float);
  uint64_t (*v50)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t (*v51)(uint64_t, _QWORD, float);
  uint64_t (*v52)(uint64_t, _QWORD, _QWORD);
  uint64_t (*v53)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t (*v54)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t (*v55)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD);
  uint64_t (*v56)(uint64_t, _QWORD, float, float, float);
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  switch(a3)
  {
    case 2:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 2736);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 3:
      v51 = *(uint64_t (**)(uint64_t, _QWORD, float))(a1 + 8);
      return v51(a2, **(unsigned int **)(a4 + 8), **(float **)(a4 + 16));
    case 6:
      v52 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 4784);
      return v52(a2, **(_QWORD **)(a4 + 8), **(_QWORD **)(a4 + 16));
    case 9:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 5096);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 10:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 5568);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 11:
      v13 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 5040);
      return v13(a2, **(_QWORD **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 12:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 5136);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 13:
      v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 5560);
      goto LABEL_447;
    case 15:
      v53 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 5544);
      return v53(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(unsigned int **)(a4 + 24), **(_QWORD **)(a4 + 32), **(_QWORD **)(a4 + 40));
    case 17:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 5376);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 19:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 5328);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 20:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 40);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 23:
      v14 = *(uint64_t (**)(uint64_t, float, float, float, float))(a1 + 2696);
      return v14(a2, **(float **)(a4 + 8), **(float **)(a4 + 16), **(float **)(a4 + 24), **(float **)(a4 + 32));
    case 24:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 2704);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 25:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 3664);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 26:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 56);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 27:
      v38 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 2688);
      goto LABEL_428;
    case 28:
      v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6040);
      v17 = **(unsigned int **)(a4 + 8);
      v18 = **(unsigned int **)(a4 + 16);
      v19 = **(unsigned int **)(a4 + 24);
      v20 = **(unsigned int **)(a4 + 32);
      v21 = **(unsigned int **)(a4 + 40);
      v22 = **(unsigned int **)(a4 + 48);
      v23 = **(unsigned int **)(a4 + 56);
      v24 = **(_DWORD **)(a4 + 64);
      HIDWORD(v71) = **(_DWORD **)(a4 + 72);
      LODWORD(v72) = **(_DWORD **)(a4 + 80);
      goto LABEL_234;
    case 29:
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 5168))(a2, **(unsigned int **)(a4 + 8), **(_QWORD **)(a4 + 16), **(_QWORD **)(a4 + 24), **(unsigned int **)(a4 + 32));
    case 31:
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 5176))(a2, **(unsigned int **)(a4 + 8), **(_QWORD **)(a4 + 16), **(_QWORD **)(a4 + 24), **(_QWORD **)(a4 + 32));
    case 34:
      result = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 5400))(a2, **(unsigned int **)(a4 + 8));
      *a5 = result;
      return result;
    case 36:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 80);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 38:
      v14 = *(uint64_t (**)(uint64_t, float, float, float, float))(a1 + 96);
      return v14(a2, **(float **)(a4 + 8), **(float **)(a4 + 16), **(float **)(a4 + 24), **(float **)(a4 + 32));
    case 43:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 120);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 44:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 2728);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 66:
      v14 = *(uint64_t (**)(uint64_t, float, float, float, float))(a1 + 296);
      return v14(a2, **(float **)(a4 + 8), **(float **)(a4 + 16), **(float **)(a4 + 24), **(float **)(a4 + 32));
    case 72:
      v15 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 344);
      return v15(a2, **(unsigned __int8 **)(a4 + 8), **(unsigned __int8 **)(a4 + 16), **(unsigned __int8 **)(a4 + 24), **(unsigned __int8 **)(a4 + 32));
    case 78:
      v15 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 392);
      return v15(a2, **(unsigned __int8 **)(a4 + 8), **(unsigned __int8 **)(a4 + 16), **(unsigned __int8 **)(a4 + 24), **(unsigned __int8 **)(a4 + 32));
    case 81:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 408);
      goto LABEL_455;
    case 93:
      v33 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 4768);
      return v33(a2, **(_QWORD **)(a4 + 8));
    case 95:
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 3040))(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(unsigned int **)(a4 + 24), **(unsigned int **)(a4 + 32), **(unsigned int **)(a4 + 40), **(unsigned int **)(a4 + 48), **(unsigned int **)(a4 + 56), **(_QWORD **)(a4 + 64));
    case 96:
      v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 3032);
      goto LABEL_81;
    case 98:
      v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 3064);
      goto LABEL_81;
    case 99:
      v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 3056);
      goto LABEL_140;
    case 112:
      v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 432);
      goto LABEL_142;
    case 114:
      v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 448);
LABEL_142:
      v17 = **(unsigned int **)(a4 + 8);
      v18 = **(unsigned int **)(a4 + 16);
      v19 = **(unsigned int **)(a4 + 24);
      v20 = **(unsigned int **)(a4 + 32);
      v21 = **(unsigned int **)(a4 + 40);
      v22 = **(unsigned int **)(a4 + 48);
      v23 = **(unsigned int **)(a4 + 56);
      v24 = **(_DWORD **)(a4 + 64);
      goto LABEL_234;
    case 115:
      v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 3520);
      v17 = **(unsigned int **)(a4 + 8);
      v18 = **(unsigned int **)(a4 + 16);
      v19 = **(unsigned int **)(a4 + 24);
      v20 = **(unsigned int **)(a4 + 32);
      v21 = **(unsigned int **)(a4 + 40);
      v22 = **(unsigned int **)(a4 + 48);
      v23 = **(unsigned int **)(a4 + 56);
      v24 = **(_DWORD **)(a4 + 64);
      v25 = **(_DWORD **)(a4 + 72);
      goto LABEL_233;
    case 116:
      result = (*(uint64_t (**)(uint64_t))(a1 + 4776))(a2);
      *(_QWORD *)a5 = result;
      return result;
    case 117:
      result = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 4752))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_185;
    case 118:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 456);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 119:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 5144);
      goto LABEL_453;
    case 120:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 3712);
      goto LABEL_453;
    case 121:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 5384);
      goto LABEL_453;
    case 123:
      v33 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 4728);
      return v33(a2, **(_QWORD **)(a4 + 8));
    case 125:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 5080);
      goto LABEL_453;
    case 126:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 5336);
      goto LABEL_453;
    case 127:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 472);
      goto LABEL_453;
    case 130:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 480);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 131:
      return (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 488))(a2, **(unsigned __int8 **)(a4 + 8));
    case 133:
      v52 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 4744);
      return v52(a2, **(_QWORD **)(a4 + 8), **(_QWORD **)(a4 + 16));
    case 134:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 504);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 135:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 512);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 138:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 4104);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 139:
      v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 520);
      goto LABEL_447;
    case 141:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 5232);
      goto LABEL_453;
    case 143:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 536);
      goto LABEL_455;
    case 146:
      v43 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(a1 + 3240);
      v44 = **(unsigned int **)(a4 + 8);
      v45 = **(unsigned int **)(a4 + 16);
      v46 = **(unsigned int **)(a4 + 24);
      v47 = **(unsigned int **)(a4 + 32);
      return v43(a2, v44, v45, v46, v47, **(unsigned int **)(a4 + 40), **(_QWORD **)(a4 + 48));
    case 151:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 576);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 152:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 584);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 155:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 4096);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 159:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 5104);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 160:
      return (*(uint64_t (**)(uint64_t))(a1 + 5576))(a2);
    case 175:
      return (*(uint64_t (**)(uint64_t))(a1 + 712))(a2);
    case 176:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 3744);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 177:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 3760);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 179:
      return (*(uint64_t (**)(uint64_t))(a1 + 720))(a2);
    case 188:
      v51 = *(uint64_t (**)(uint64_t, _QWORD, float))(a1 + 728);
      return v51(a2, **(unsigned int **)(a4 + 8), **(float **)(a4 + 16));
    case 189:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 736);
      goto LABEL_453;
    case 192:
      v38 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 5432);
      goto LABEL_428;
    case 194:
      v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5416);
      goto LABEL_450;
    case 198:
      v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5528);
      goto LABEL_450;
    case 199:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 760);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 201:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 5152);
      goto LABEL_453;
    case 202:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 3704);
      goto LABEL_453;
    case 203:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 5392);
      goto LABEL_453;
    case 206:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 5072);
      goto LABEL_453;
    case 207:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 5344);
      goto LABEL_453;
    case 208:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 784);
      goto LABEL_453;
    case 210:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 5448);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 211:
      v54 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 5048);
      return v54(a2, **(_QWORD **)(a4 + 8), **(unsigned int **)(a4 + 16), **(unsigned int **)(a4 + 24), **(_QWORD **)(a4 + 32), **(_QWORD **)(a4 + 40), **(_QWORD **)(a4 + 48), **(_QWORD **)(a4 + 56));
    case 212:
      v54 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 5008);
      return v54(a2, **(_QWORD **)(a4 + 8), **(unsigned int **)(a4 + 16), **(unsigned int **)(a4 + 24), **(_QWORD **)(a4 + 32), **(_QWORD **)(a4 + 40), **(_QWORD **)(a4 + 48), **(_QWORD **)(a4 + 56));
    case 214:
      v29 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 6072);
      return v29(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24), **(_QWORD **)(a4 + 32));
    case 215:
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 5056))(a2, **(_QWORD **)(a4 + 8), **(_QWORD **)(a4 + 16));
      goto LABEL_168;
    case 217:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 792);
      goto LABEL_453;
    case 218:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 5208);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 219:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 5216);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 230:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 3080);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 235:
      result = (*(uint64_t (**)(uint64_t))(a1 + 816))(a2);
      *a5 = result;
      return result;
    case 238:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 824);
      goto LABEL_453;
    case 239:
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 5952))(a2, **(unsigned int **)(a4 + 8), **(_QWORD **)(a4 + 16));
      goto LABEL_328;
    case 240:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 5440);
      goto LABEL_455;
    case 246:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 5600);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 247:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 832);
      goto LABEL_453;
    case 248:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 840);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 253:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 880);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 264:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 920);
      goto LABEL_453;
    case 268:
      v29 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 5280);
      return v29(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24), **(_QWORD **)(a4 + 32));
    case 272:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 5264);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 274:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 5120);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 275:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 5128);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 276:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 5112);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 277:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 5360);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 279:
      v29 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 5272);
      return v29(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24), **(_QWORD **)(a4 + 32));
    case 280:
      v30 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 5032);
      return v30(a2, **(_QWORD **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24), **(_QWORD **)(a4 + 32));
    case 281:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 5256);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 282:
      result = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 936))(a2, **(unsigned int **)(a4 + 8));
LABEL_185:
      *(_QWORD *)a5 = result;
      return result;
    case 283:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 944);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 284:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 952);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 288:
      v55 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 984);
      goto LABEL_433;
    case 290:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 1000);
      goto LABEL_455;
    case 294:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 1008);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 295:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 1016);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 296:
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 5592))(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(unsigned int **)(a4 + 24), **(_QWORD **)(a4 + 32), **(_QWORD **)(a4 + 40), **(_QWORD **)(a4 + 48), **(_QWORD **)(a4 + 56));
    case 299:
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 5000))(a2, **(_QWORD **)(a4 + 8), **(_QWORD **)(a4 + 16));
LABEL_168:
      *a5 = result;
      return result;
    case 300:
      v13 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 5016);
      return v13(a2, **(_QWORD **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 301:
      v13 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 5024);
      return v13(a2, **(_QWORD **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 302:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 5936);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 303:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 5856);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 304:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 5864);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 305:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 4136);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 307:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 4120);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 308:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 4128);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 309:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 1024);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 325:
      result = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 5160))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_424;
    case 326:
      result = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 1144))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_424;
    case 328:
      result = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 3728))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_424;
    case 329:
      result = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 5368))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_424;
    case 331:
      result = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 5248))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_424;
    case 333:
      result = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 5088))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_424;
    case 334:
      result = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 5320))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_424;
    case 335:
      result = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 5240))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_424;
    case 336:
      result = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 1160))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_424;
    case 339:
      v51 = *(uint64_t (**)(uint64_t, _QWORD, float))(a1 + 1168);
      return v51(a2, **(unsigned int **)(a4 + 8), **(float **)(a4 + 16));
    case 340:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 1176);
      goto LABEL_453;
    case 343:
      v31 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, float))(a1 + 1200);
      return v31(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(float **)(a4 + 24));
    case 344:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 1208);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 348:
      v32 = *(uint64_t (**)(uint64_t, float))(a1 + 1240);
      return v32(a2, **(float **)(a4 + 8));
    case 349:
      v33 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 4792);
      return v33(a2, **(_QWORD **)(a4 + 8));
    case 351:
      return (*(uint64_t (**)(uint64_t))(a1 + 1256))(a2);
    case 353:
      v33 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 1272);
      return v33(a2, **(_QWORD **)(a4 + 8));
    case 358:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 1288);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 363:
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 5192))(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
      goto LABEL_354;
    case 372:
      v31 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, float))(a1 + 1360);
      return v31(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(float **)(a4 + 24));
    case 373:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 1368);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 376:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 1392);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 379:
      v33 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 1408);
      return v33(a2, **(_QWORD **)(a4 + 8));
    case 412:
      v34 = *(unsigned int **)(a4 + 8);
      a6.n128_u32[0] = **(_DWORD **)(a4 + 16);
      v35 = *(float **)(a4 + 32);
      a7.n128_u32[0] = **(_DWORD **)(a4 + 24);
      v36 = *(uint64_t (**)(uint64_t, _QWORD, __n128, __n128, float, float))(a1 + 2952);
      return v36(a2, *v34, a6, a7, *v35, **(float **)(a4 + 40));
    case 423:
      v40 = *(uint64_t (**)(uint64_t, float, float, float))(a1 + 1456);
      return v40(a2, **(float **)(a4 + 8), **(float **)(a4 + 16), **(float **)(a4 + 24));
    case 429:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 1504);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 438:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 1560);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 444:
      v51 = *(uint64_t (**)(uint64_t, _QWORD, float))(a1 + 4320);
      return v51(a2, **(unsigned int **)(a4 + 8), **(float **)(a4 + 16));
    case 445:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 4328);
      goto LABEL_453;
    case 448:
      v32 = *(uint64_t (**)(uint64_t, float))(a1 + 1592);
      return v32(a2, **(float **)(a4 + 8));
    case 450:
      v37 = *(uint64_t (**)(uint64_t, float, float))(a1 + 1608);
      return v37(a2, **(float **)(a4 + 8), **(float **)(a4 + 16));
    case 454:
      return (*(uint64_t (**)(uint64_t))(a1 + 1640))(a2);
    case 467:
      v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 5512);
      goto LABEL_447;
    case 471:
      return (*(uint64_t (**)(uint64_t))(a1 + 1680))(a2);
    case 497:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 1888);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 498:
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 1896))(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(unsigned int **)(a4 + 24), **(unsigned int **)(a4 + 32), **(unsigned int **)(a4 + 40), **(unsigned int **)(a4 + 48), **(_QWORD **)(a4 + 56));
    case 508:
      v38 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 5352);
      goto LABEL_428;
    case 509:
      v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6048);
      goto LABEL_450;
    case 513:
      v14 = *(uint64_t (**)(uint64_t, float, float, float, float))(a1 + 1984);
      return v14(a2, **(float **)(a4 + 8), **(float **)(a4 + 16), **(float **)(a4 + 24), **(float **)(a4 + 32));
    case 514:
      return (*(uint64_t (**)(uint64_t, _QWORD, float))(a1 + 3672))(a2, **(unsigned __int8 **)(a4 + 16), **(float **)(a4 + 8));
    case 517:
      v40 = *(uint64_t (**)(uint64_t, float, float, float))(a1 + 2000);
      return v40(a2, **(float **)(a4 + 8), **(float **)(a4 + 16), **(float **)(a4 + 24));
    case 518:
      v38 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 2008);
      goto LABEL_428;
    case 538:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 3720);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 539:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 2024);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 540:
      v30 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 4760);
      return v30(a2, **(_QWORD **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24), **(_QWORD **)(a4 + 32));
    case 541:
      v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 2032);
      goto LABEL_447;
    case 542:
      v38 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 5288);
      goto LABEL_428;
    case 544:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 2040);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 545:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 5296);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 546:
      v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 2048);
      goto LABEL_447;
    case 547:
      v38 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 4688);
      goto LABEL_428;
    case 548:
      result = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 3736))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_424;
    case 549:
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 3752))(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
      *(_BYTE *)a5 = result;
      return result;
    case 582:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 2312);
      goto LABEL_455;
    case 583:
      v31 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, float))(a1 + 2320);
      return v31(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(float **)(a4 + 24));
    case 584:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 2328);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 585:
      v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 2336);
      goto LABEL_447;
    case 586:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 2344);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 594:
      v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 2408);
      goto LABEL_81;
    case 595:
      v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 3504);
      v17 = **(unsigned int **)(a4 + 8);
      v18 = **(unsigned int **)(a4 + 16);
      v19 = **(unsigned int **)(a4 + 24);
      v20 = **(unsigned int **)(a4 + 32);
      v21 = **(unsigned int **)(a4 + 40);
      v22 = **(unsigned int **)(a4 + 48);
      v23 = **(unsigned int **)(a4 + 56);
      v24 = **(_DWORD **)(a4 + 64);
      v25 = **(_DWORD **)(a4 + 72);
      v72 = **(_QWORD **)(a4 + 80);
      goto LABEL_233;
    case 598:
      v31 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, float))(a1 + 2416);
      return v31(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(float **)(a4 + 24));
    case 599:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 2424);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 600:
      v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 2432);
      goto LABEL_447;
    case 601:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 2440);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 603:
      v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 2456);
LABEL_81:
      v17 = **(unsigned int **)(a4 + 8);
      v18 = **(unsigned int **)(a4 + 16);
      v19 = **(unsigned int **)(a4 + 24);
      v20 = **(unsigned int **)(a4 + 32);
      v21 = **(unsigned int **)(a4 + 40);
      v22 = **(unsigned int **)(a4 + 48);
      v23 = **(unsigned int **)(a4 + 56);
      v24 = **(_DWORD **)(a4 + 64);
      v72 = **(_QWORD **)(a4 + 72);
      goto LABEL_234;
    case 604:
      v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 3512);
LABEL_140:
      v17 = **(unsigned int **)(a4 + 8);
      v18 = **(unsigned int **)(a4 + 16);
      v19 = **(unsigned int **)(a4 + 24);
      v20 = **(unsigned int **)(a4 + 32);
      v21 = **(unsigned int **)(a4 + 40);
      v22 = **(unsigned int **)(a4 + 48);
      v23 = **(unsigned int **)(a4 + 56);
      v24 = **(_DWORD **)(a4 + 64);
      v25 = **(_DWORD **)(a4 + 72);
      v73 = **(_QWORD **)(a4 + 88);
      LODWORD(v72) = **(_DWORD **)(a4 + 80);
LABEL_233:
      HIDWORD(v71) = v25;
LABEL_234:
      LODWORD(v71) = v24;
      return v16(a2, v17, v18, v19, v20, v21, v22, v23, v71, v72, v73);
    case 606:
      v41 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 5584);
      return v41(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24), **(unsigned int **)(a4 + 32));
    case 608:
      v40 = *(uint64_t (**)(uint64_t, float, float, float))(a1 + 2472);
      return v40(a2, **(float **)(a4 + 8), **(float **)(a4 + 16), **(float **)(a4 + 24));
    case 609:
      v51 = *(uint64_t (**)(uint64_t, _QWORD, float))(a1 + 4816);
      return v51(a2, **(unsigned int **)(a4 + 8), **(float **)(a4 + 16));
    case 610:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 4880);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 611:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 4848);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 612:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 4912);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 613:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 5872);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 614:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 5904);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 615:
      v42 = *(uint64_t (**)(uint64_t, _QWORD, float, float))(a1 + 4824);
      return v42(a2, **(unsigned int **)(a4 + 8), **(float **)(a4 + 16), **(float **)(a4 + 24));
    case 616:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 4888);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 617:
      v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 4856);
      goto LABEL_447;
    case 618:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 4920);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 619:
      v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 5880);
      goto LABEL_447;
    case 620:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 5912);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 621:
      v56 = *(uint64_t (**)(uint64_t, _QWORD, float, float, float))(a1 + 4832);
      return v56(a2, **(unsigned int **)(a4 + 8), **(float **)(a4 + 16), **(float **)(a4 + 24), **(float **)(a4 + 32));
    case 622:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 4896);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 623:
      v38 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 4864);
      goto LABEL_428;
    case 624:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 4928);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 625:
      v38 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 5888);
      goto LABEL_428;
    case 626:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 5920);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 627:
      v34 = *(unsigned int **)(a4 + 8);
      a6.n128_u32[0] = **(_DWORD **)(a4 + 16);
      v35 = *(float **)(a4 + 32);
      a7.n128_u32[0] = **(_DWORD **)(a4 + 24);
      v36 = *(uint64_t (**)(uint64_t, _QWORD, __n128, __n128, float, float))(a1 + 4840);
      return v36(a2, *v34, a6, a7, *v35, **(float **)(a4 + 40));
    case 628:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 4904);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 629:
      v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 4872);
      goto LABEL_450;
    case 630:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 4936);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 631:
      v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5896);
      goto LABEL_450;
    case 632:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 5928);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 634:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 4944);
      goto LABEL_263;
    case 635:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 5992);
      goto LABEL_263;
    case 636:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6008);
      goto LABEL_263;
    case 637:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 4952);
      goto LABEL_263;
    case 638:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6000);
      goto LABEL_263;
    case 639:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6024);
      goto LABEL_263;
    case 640:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 4960);
      goto LABEL_263;
    case 641:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6016);
      goto LABEL_263;
    case 642:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6032);
LABEL_263:
      v57 = **(unsigned int **)(a4 + 8);
      v58 = **(unsigned int **)(a4 + 16);
      v59 = *(_QWORD **)(a4 + 32);
      v60 = **(unsigned __int8 **)(a4 + 24);
      return v27(a2, v57, v58, v60, *v59);
    case 644:
      result = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 5200))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_424;
    case 645:
      v33 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 4800);
      return v33(a2, **(_QWORD **)(a4 + 8));
    case 646:
      v33 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 4808);
      return v33(a2, **(_QWORD **)(a4 + 8));
    case 675:
      v51 = *(uint64_t (**)(uint64_t, _QWORD, float))(a1 + 3808);
      return v51(a2, **(unsigned int **)(a4 + 8), **(float **)(a4 + 16));
    case 676:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 3912);
      goto LABEL_453;
    case 681:
      v42 = *(uint64_t (**)(uint64_t, _QWORD, float, float))(a1 + 3832);
      return v42(a2, **(unsigned int **)(a4 + 8), **(float **)(a4 + 16), **(float **)(a4 + 24));
    case 682:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 3936);
      goto LABEL_453;
    case 687:
      v56 = *(uint64_t (**)(uint64_t, _QWORD, float, float, float))(a1 + 3856);
      return v56(a2, **(unsigned int **)(a4 + 8), **(float **)(a4 + 16), **(float **)(a4 + 24), **(float **)(a4 + 32));
    case 688:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 3960);
      goto LABEL_453;
    case 701:
      v34 = *(unsigned int **)(a4 + 8);
      a6.n128_u32[0] = **(_DWORD **)(a4 + 16);
      v35 = *(float **)(a4 + 32);
      a7.n128_u32[0] = **(_DWORD **)(a4 + 24);
      v36 = *(uint64_t (**)(uint64_t, _QWORD, __n128, __n128, float, float))(a1 + 3880);
      return v36(a2, *v34, a6, a7, *v35, **(float **)(a4 + 40));
    case 702:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 4024);
      goto LABEL_453;
    case 722:
      v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5712);
      goto LABEL_450;
    case 723:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 5776);
      goto LABEL_453;
    case 726:
      v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5744);
      goto LABEL_450;
    case 727:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 5808);
      goto LABEL_453;
    case 729:
      v55 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 5848);
      goto LABEL_433;
    case 730:
      v43 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(a1 + 4088);
      v44 = **(unsigned int **)(a4 + 8);
      v45 = **(unsigned int **)(a4 + 16);
      v46 = **(unsigned int **)(a4 + 24);
      v47 = **(unsigned __int8 **)(a4 + 32);
      return v43(a2, v44, v45, v46, v47, **(unsigned int **)(a4 + 40), **(_QWORD **)(a4 + 48));
    case 732:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 2672);
      goto LABEL_455;
    case 733:
      v38 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 2680);
      goto LABEL_428;
    case 759:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 7744);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 760:
      v38 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 7752);
      goto LABEL_428;
    case 761:
      v32 = *(uint64_t (**)(uint64_t, float))(a1 + 7024);
      return v32(a2, **(float **)(a4 + 8));
    case 762:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 7760);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 763:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 7768);
      goto LABEL_453;
    case 764:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 7776);
      goto LABEL_453;
    case 765:
      v38 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 7784);
      goto LABEL_428;
    case 766:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 8088);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 767:
      v37 = *(uint64_t (**)(uint64_t, float, float))(a1 + 7016);
      return v37(a2, **(float **)(a4 + 8), **(float **)(a4 + 16));
    case 768:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 7792);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 769:
      return (*(uint64_t (**)(uint64_t, float, float, float, float, float))(a1 + 8168))(a2, **(float **)(a4 + 8), **(float **)(a4 + 16), **(float **)(a4 + 24), **(float **)(a4 + 32), **(float **)(a4 + 40));
    case 770:
      v33 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 8176);
      return v33(a2, **(_QWORD **)(a4 + 8));
    case 771:
      v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8128);
      goto LABEL_450;
    case 772:
      v33 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 8152);
      return v33(a2, **(_QWORD **)(a4 + 8));
    case 773:
      v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8120);
      v61 = **(__int16 **)(a4 + 8);
      v62 = **(__int16 **)(a4 + 16);
      v63 = **(__int16 **)(a4 + 24);
      v64 = **(__int16 **)(a4 + 32);
      v65 = **(__int16 **)(a4 + 40);
      goto LABEL_451;
    case 774:
      v33 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 8144);
      return v33(a2, **(_QWORD **)(a4 + 8));
    case 775:
      v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8136);
      goto LABEL_450;
    case 776:
      v33 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 8160);
      return v33(a2, **(_QWORD **)(a4 + 8));
    case 777:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 7800);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 778:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 7808);
      goto LABEL_453;
    case 779:
      a6.n128_u32[0] = **(_DWORD **)(a4 + 8);
      a7.n128_u32[0] = **(_DWORD **)(a4 + 16);
      v48 = *(float **)(a4 + 32);
      a8.n128_u32[0] = **(_DWORD **)(a4 + 24);
      v49 = *(uint64_t (**)(uint64_t, __n128, __n128, __n128, float, float, float))(a1 + 7816);
      return v49(a2, a6, a7, a8, *v48, **(float **)(a4 + 40), **(float **)(a4 + 48));
    case 780:
      v50 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 7824);
      goto LABEL_431;
    case 781:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 7832);
      goto LABEL_453;
    case 782:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 7840);
      goto LABEL_453;
    case 783:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 7848);
      goto LABEL_453;
    case 784:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 7856);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 785:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 7864);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 786:
      v29 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 7008);
      return v29(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24), **(_QWORD **)(a4 + 32));
    case 787:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 7872);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 788:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 7880);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 789:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 7888);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 790:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 7896);
      goto LABEL_453;
    case 791:
      v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 7904);
      goto LABEL_447;
    case 792:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 7912);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 793:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 7920);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 794:
      v33 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 7928);
      return v33(a2, **(_QWORD **)(a4 + 8));
    case 795:
      return (*(uint64_t (**)(uint64_t))(a1 + 8096))(a2);
    case 796:
      v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 7936);
      goto LABEL_447;
    case 797:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 7944);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 798:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 8104);
      goto LABEL_455;
    case 799:
      v33 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 7952);
      return v33(a2, **(_QWORD **)(a4 + 8));
    case 800:
      v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8056);
      goto LABEL_450;
    case 801:
      v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 7960);
      goto LABEL_447;
    case 802:
      a6.n128_u32[0] = **(_DWORD **)(a4 + 8);
      a7.n128_u32[0] = **(_DWORD **)(a4 + 16);
      v48 = *(float **)(a4 + 32);
      a8.n128_u32[0] = **(_DWORD **)(a4 + 24);
      v49 = *(uint64_t (**)(uint64_t, __n128, __n128, __n128, float, float, float))(a1 + 7968);
      return v49(a2, a6, a7, a8, *v48, **(float **)(a4 + 40), **(float **)(a4 + 48));
    case 803:
      v50 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 7976);
      goto LABEL_431;
    case 804:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 8072);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 805:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 8080);
      goto LABEL_453;
    case 806:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 6176);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 807:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 7984);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 808:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 7992);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 810:
      v38 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 8000);
      goto LABEL_428;
    case 811:
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 8064))(a2, **(unsigned int **)(a4 + 8), **(unsigned __int8 **)(a4 + 16));
    case 812:
      v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 8008);
      goto LABEL_447;
    case 814:
      v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 8016);
      goto LABEL_447;
    case 815:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 8024);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 816:
      v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 8032);
      goto LABEL_447;
    case 817:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 8040);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 818:
      v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 8048);
      goto LABEL_447;
    case 819:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 8112);
      goto LABEL_455;
    case 823:
      v38 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 6096);
      goto LABEL_428;
    case 824:
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 6104))(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(unsigned int **)(a4 + 24), **(_QWORD **)(a4 + 32), **(unsigned int **)(a4 + 40));
    case 825:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 0x2000);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 826:
      v53 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 3568);
      return v53(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(unsigned int **)(a4 + 24), **(_QWORD **)(a4 + 32), **(_QWORD **)(a4 + 40));
    case 827:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 3560);
      goto LABEL_455;
    case 829:
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 3536))(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24), **(unsigned int **)(a4 + 32), **(_QWORD **)(a4 + 40));
    case 830:
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 3552))(a2, **(unsigned int **)(a4 + 8), **(_QWORD **)(a4 + 16));
LABEL_328:
      *a5 = result;
      return result;
    case 831:
      v29 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 3528);
      return v29(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24), **(_QWORD **)(a4 + 32));
    case 832:
      v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 3576);
      goto LABEL_447;
    case 833:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 6088);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 835:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 8184);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 837:
      return (*(uint64_t (**)(uint64_t))(a1 + 8208))(a2);
    case 838:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 6144);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 839:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 6152);
      goto LABEL_453;
    case 840:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 6160);
      goto LABEL_453;
    case 841:
      result = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 6168))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_424;
    case 850:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 6424);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 851:
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, float))(a1 + 6216))(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(unsigned int **)(a4 + 32), **(float **)(a4 + 24));
    case 852:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 6208);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 853:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 6192);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 854:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 6200);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 855:
      v66 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 6328);
      return v66(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24), **(_QWORD **)(a4 + 32), **(_QWORD **)(a4 + 40));
    case 856:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 6408);
      goto LABEL_453;
    case 857:
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 6368))(a2, **(unsigned int **)(a4 + 8), **(_QWORD **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 858:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 6400);
      goto LABEL_453;
    case 861:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 6488);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 862:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 6480);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 863:
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 6224))(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
      goto LABEL_354;
    case 864:
      result = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 6416))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_424;
    case 865:
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 6360))(a2, **(unsigned int **)(a4 + 8), **(_QWORD **)(a4 + 16), **(_QWORD **)(a4 + 24), **(unsigned int **)(a4 + 32));
      *(_QWORD *)a5 = result;
      return result;
    case 870:
      v31 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, float))(a1 + 6448);
      return v31(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(float **)(a4 + 24));
    case 871:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 6456);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 872:
      v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 6432);
      goto LABEL_447;
    case 873:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 6440);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 875:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 6392);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 876:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 6384);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 879:
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 6256))(a2, **(_QWORD **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
      *a5 = result;
      return result;
    case 880:
      v33 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 6248);
      return v33(a2, **(_QWORD **)(a4 + 8));
    case 881:
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 6232))(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
LABEL_354:
      *(_QWORD *)a5 = result;
      return result;
    case 882:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 6272);
      goto LABEL_453;
    case 883:
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 6280))(a2, **(_QWORD **)(a4 + 8), **(unsigned int **)(a4 + 16), **(unsigned int **)(a4 + 24), **(_QWORD **)(a4 + 32), **(_QWORD **)(a4 + 40));
    case 884:
      result = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 6240))(a2, **(_QWORD **)(a4 + 8));
      *(_BYTE *)a5 = result;
      return result;
    case 885:
      v13 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 6264);
      return v13(a2, **(_QWORD **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 886:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 6560);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 887:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 6576);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 888:
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 6568))(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
      *a5 = result;
      return result;
    case 889:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 6584);
      goto LABEL_453;
    case 890:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 6592);
      goto LABEL_453;
    case 891:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 8200);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 892:
      v53 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 6520);
      return v53(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(unsigned int **)(a4 + 24), **(_QWORD **)(a4 + 32), **(_QWORD **)(a4 + 40));
    case 893:
      v29 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 6624);
      return v29(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24), **(_QWORD **)(a4 + 32));
    case 894:
      v28 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 6608);
      return v28(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24));
    case 895:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 6528);
      goto LABEL_453;
    case 896:
      result = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 6600))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_424;
    case 897:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6512);
      goto LABEL_455;
    case 898:
      return (*(uint64_t (**)(uint64_t))(a1 + 6544))(a2);
    case 900:
      v31 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, float))(a1 + 6664);
      return v31(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(float **)(a4 + 24));
    case 901:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6728);
      goto LABEL_455;
    case 902:
      v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 6632);
      goto LABEL_447;
    case 903:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6696);
      goto LABEL_455;
    case 904:
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, float, float))(a1 + 6672))(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(float **)(a4 + 24), **(float **)(a4 + 32));
    case 905:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6736);
      goto LABEL_455;
    case 906:
      v38 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 6640);
      goto LABEL_428;
    case 907:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6704);
      goto LABEL_455;
    case 908:
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, float, float, float))(a1 + 6680))(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(float **)(a4 + 24), **(float **)(a4 + 32), **(float **)(a4 + 40));
    case 909:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6744);
      goto LABEL_455;
    case 910:
      v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6648);
      goto LABEL_450;
    case 911:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6712);
      goto LABEL_455;
    case 912:
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, float, float, float, float))(a1 + 6688))(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(float **)(a4 + 24), **(float **)(a4 + 32), **(float **)(a4 + 40), **(float **)(a4 + 48));
    case 913:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6752);
      goto LABEL_455;
    case 914:
      v50 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 6656);
      goto LABEL_431;
    case 915:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6720);
      goto LABEL_455;
    case 916:
      v55 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6760);
      goto LABEL_417;
    case 917:
      v55 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6768);
      goto LABEL_417;
    case 918:
      v55 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6776);
      goto LABEL_417;
    case 919:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 6536);
      goto LABEL_453;
    case 920:
      v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 6552);
      goto LABEL_447;
    case 921:
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 6616);
      return v9(a2, **(unsigned int **)(a4 + 8));
    case 934:
      v66 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 7096);
      return v66(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24), **(_QWORD **)(a4 + 32), **(_QWORD **)(a4 + 40));
    case 937:
      v41 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 7104);
      return v41(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24), **(unsigned int **)(a4 + 32));
    case 940:
      v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 6784);
      goto LABEL_447;
    case 941:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6816);
      goto LABEL_455;
    case 944:
      v38 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 6792);
      goto LABEL_428;
    case 945:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6824);
      goto LABEL_455;
    case 948:
      v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6800);
      goto LABEL_450;
    case 949:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6832);
      goto LABEL_455;
    case 952:
      v50 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 6808);
      goto LABEL_431;
    case 953:
      v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6840);
LABEL_455:
      v57 = **(unsigned int **)(a4 + 8);
      v58 = **(unsigned int **)(a4 + 16);
      v59 = *(_QWORD **)(a4 + 32);
      v60 = **(unsigned int **)(a4 + 24);
      return v27(a2, v57, v58, v60, *v59);
    case 956:
      v55 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6848);
      goto LABEL_417;
    case 958:
      v55 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6864);
      goto LABEL_417;
    case 961:
      v55 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6856);
      goto LABEL_417;
    case 963:
      v55 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6880);
      goto LABEL_417;
    case 966:
      v55 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6872);
      goto LABEL_417;
    case 968:
      v55 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6888);
LABEL_417:
      v67 = **(unsigned int **)(a4 + 8);
      v68 = **(unsigned int **)(a4 + 16);
      v69 = **(unsigned int **)(a4 + 24);
      v70 = **(unsigned __int8 **)(a4 + 32);
      goto LABEL_434;
    case 969:
      return (*(uint64_t (**)(uint64_t))(a1 + 6992))(a2);
    case 970:
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 7000))(a2, **(unsigned int **)(a4 + 8), **(_QWORD **)(a4 + 16), **(unsigned int **)(a4 + 24), **(_QWORD **)(a4 + 32), **(unsigned int **)(a4 + 40));
    case 980:
      v11 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 7232);
      return v11(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
    case 981:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 7248);
      goto LABEL_453;
    case 987:
      v26 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a1 + 7240);
LABEL_453:
      result = v26(a2, **(unsigned int **)(a4 + 8), **(_QWORD **)(a4 + 16));
      break;
    case 1000:
      result = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 7272))(a2, **(unsigned int **)(a4 + 8));
LABEL_424:
      *(_BYTE *)a5 = result;
      break;
    case 1004:
      result = (*(uint64_t (**)(uint64_t))(a1 + 7256))(a2);
      break;
    case 1005:
      result = (*(uint64_t (**)(uint64_t))(a1 + 7264))(a2);
      break;
    case 1039:
      v38 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 8216);
LABEL_428:
      result = v38(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(unsigned int **)(a4 + 24), **(unsigned int **)(a4 + 32));
      break;
    case 1040:
      v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8248);
LABEL_450:
      v61 = **(unsigned int **)(a4 + 8);
      v62 = **(unsigned int **)(a4 + 16);
      v63 = **(unsigned int **)(a4 + 24);
      v64 = **(unsigned int **)(a4 + 32);
      v65 = **(unsigned int **)(a4 + 40);
LABEL_451:
      result = v39(a2, v61, v62, v63, v64, v65);
      break;
    case 1042:
      v50 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 8256);
LABEL_431:
      result = v50(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(unsigned int **)(a4 + 24), **(unsigned int **)(a4 + 32), **(unsigned int **)(a4 + 40), **(unsigned int **)(a4 + 48));
      break;
    case 1043:
      v55 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 8232);
LABEL_433:
      v67 = **(unsigned int **)(a4 + 8);
      v68 = **(unsigned int **)(a4 + 16);
      v69 = **(unsigned int **)(a4 + 24);
      v70 = **(unsigned int **)(a4 + 32);
LABEL_434:
      result = v55(a2, v67, v68, v69, v70, **(_QWORD **)(a4 + 40));
      break;
    case 1044:
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 8224))(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(_QWORD **)(a4 + 24), **(unsigned int **)(a4 + 32), **(unsigned int **)(a4 + 40), **(unsigned int **)(a4 + 48), **(unsigned int **)(a4 + 56));
      break;
    case 1046:
      v10 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 8264);
LABEL_447:
      result = v10(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(unsigned int **)(a4 + 24));
      break;
    default:
      dy_abort("unknown fenum: %u", a3);
  }
  return result;
}

void dy_add_fenum_string_tables(uint64_t a1, uint64_t a2, int a3, int a4)
{
  _QWORD block[6];
  int v9;
  int v10;

  if (_MergedGlobals_2236 != -1)
    dispatch_once_f(&_MergedGlobals_2236, 0, (dispatch_function_t)_BuildTextTableEntries);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __dy_add_fenum_string_tables_block_invoke;
  block[3] = &__block_descriptor_tmp_4;
  block[4] = a1;
  block[5] = a2;
  v9 = a3;
  v10 = a4;
  dispatch_async((dispatch_queue_t)qword_256BC8D70, block);
}

void _BuildTextTableEntries(void *a1)
{
  void **v1;
  _QWORD *v2;
  char *v3;
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  __int128 v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  char *v29;
  __int128 v30;
  char *v31;
  char **v32;
  unint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  __int128 v45;
  char *v46;

  qword_256BC8D70 = (uint64_t)dispatch_queue_create("gputools.fenums.textTable", 0);
  v1 = (void **)operator new();
  v1[1] = 0;
  v1[2] = 0;
  *v1 = 0;
  qword_256BC8D78 = (uint64_t)v1;
  v2 = operator new(0xA0uLL);
  *v2 = gl_fenums_string_table;
  v2[1] = gl_fenums_compact_string_table;
  v2[2] = 0x41800000000;
  *((_DWORD *)v2 + 6) = 0;
  v3 = (char *)(v2 + 4);
  *v1 = v2;
  v1[1] = v2 + 4;
  v1[2] = v2 + 20;
  if (v2 + 4 >= v2 + 20)
  {
    v7 = (char *)*v1;
    v8 = (v3 - (_BYTE *)*v1) >> 5;
    v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 59)
      goto LABEL_45;
    v10 = (char *)(v2 + 20) - v7;
    if (v10 >> 4 > v9)
      v9 = v10 >> 4;
    v11 = (unint64_t)v10 >= 0x7FFFFFFFFFFFFFE0;
    v12 = 0x7FFFFFFFFFFFFFFLL;
    if (!v11)
      v12 = v9;
    if (v12 >> 59)
LABEL_44:
      std::__throw_bad_array_new_length[abi:ne180100]();
    v13 = 32 * v12;
    v14 = (char *)operator new(32 * v12);
    v15 = &v14[32 * v8];
    v16 = &v14[v13];
    *(_QWORD *)v15 = off_256BB7B68;
    *((_QWORD *)v15 + 1) = off_256BB7D00;
    *((_QWORD *)v15 + 2) = 0xFFFFF033FFFFF000;
    *((_DWORD *)v15 + 6) = 1048;
    v17 = v15 + 32;
    if (v3 == v7)
    {
      *v1 = v15;
      v1[1] = v17;
      v1[2] = v16;
      if (v7)
        goto LABEL_13;
    }
    else
    {
      do
      {
        v18 = *((_OWORD *)v3 - 1);
        v19 = v15 - 32;
        *((_OWORD *)v15 - 2) = *((_OWORD *)v3 - 2);
        *((_OWORD *)v15 - 1) = v18;
        v3 -= 32;
        v15 -= 32;
      }
      while (v3 != v7);
      *v1 = v19;
      v1[1] = v17;
      v1[2] = v16;
      if (v7)
      {
LABEL_13:
        operator delete(v7);
        v4 = qword_256BC8D78;
        v1[1] = v17;
        v6 = *(char **)(v4 + 8);
        v5 = *(char **)(v4 + 16);
        if (v6 >= v5)
          goto LABEL_17;
        goto LABEL_14;
      }
    }
    v4 = (uint64_t)v1;
    v1[1] = v17;
    v6 = (char *)v1[1];
    v5 = (char *)v1[2];
    if (v6 >= v5)
      goto LABEL_17;
LABEL_14:
    *(_QWORD *)v6 = _MergedGlobals;
    *((_QWORD *)v6 + 1) = off_256BB79C0;
    *((_QWORD *)v6 + 2) = 0xFFFFE00FFFFFE000;
    *((_DWORD *)v6 + 6) = 1099;
    v20 = v6 + 32;
    goto LABEL_27;
  }
  v2[4] = off_256BB7B68;
  v2[5] = off_256BB7D00;
  v2[6] = 0xFFFFF033FFFFF000;
  *((_DWORD *)v2 + 14) = 1048;
  v4 = (uint64_t)v1;
  v1[1] = v2 + 8;
  v6 = (char *)v1[1];
  v5 = (char *)v1[2];
  if (v6 < v5)
    goto LABEL_14;
LABEL_17:
  v21 = *(char **)v4;
  v22 = (uint64_t)&v6[-*(_QWORD *)v4] >> 5;
  v23 = v22 + 1;
  if ((unint64_t)(v22 + 1) >> 59)
    std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
  v24 = v5 - v21;
  if (v24 >> 4 > v23)
    v23 = v24 >> 4;
  v11 = (unint64_t)v24 >= 0x7FFFFFFFFFFFFFE0;
  v25 = 0x7FFFFFFFFFFFFFFLL;
  if (!v11)
    v25 = v23;
  if (v25 >> 59)
    goto LABEL_44;
  v26 = 32 * v25;
  v27 = (char *)operator new(32 * v25);
  v28 = &v27[32 * v22];
  v29 = &v27[v26];
  *(_QWORD *)v28 = _MergedGlobals;
  *((_QWORD *)v28 + 1) = off_256BB79C0;
  *((_QWORD *)v28 + 2) = 0xFFFFE00FFFFFE000;
  *((_DWORD *)v28 + 6) = 1099;
  v20 = v28 + 32;
  if (v6 == v21)
  {
    *(_QWORD *)v4 = v28;
    *(_QWORD *)(v4 + 8) = v20;
    *(_QWORD *)(v4 + 16) = v29;
    if (v21)
LABEL_26:
      operator delete(v21);
  }
  else
  {
    do
    {
      v30 = *((_OWORD *)v6 - 1);
      v31 = v28 - 32;
      *((_OWORD *)v28 - 2) = *((_OWORD *)v6 - 2);
      *((_OWORD *)v28 - 1) = v30;
      v6 -= 32;
      v28 -= 32;
    }
    while (v6 != v21);
    *(_QWORD *)v4 = v31;
    *(_QWORD *)(v4 + 8) = v20;
    *(_QWORD *)(v4 + 16) = v29;
    if (v21)
      goto LABEL_26;
  }
LABEL_27:
  *(_QWORD *)(v4 + 8) = v20;
  v32 = (char **)qword_256BC8D78;
  v34 = *(char **)(qword_256BC8D78 + 8);
  v33 = *(_QWORD *)(qword_256BC8D78 + 16);
  if ((unint64_t)v34 < v33)
  {
    *(_QWORD *)v34 = off_256BB7A38;
    *((_QWORD *)v34 + 1) = off_256BB7AD0;
    *((_QWORD *)v34 + 2) = 0xFFFFD013FFFFD000;
    *((_DWORD *)v34 + 6) = 1114;
    v35 = v34 + 32;
LABEL_29:
    v32[1] = v35;
    return;
  }
  v36 = *(char **)qword_256BC8D78;
  v37 = (uint64_t)&v34[-*(_QWORD *)qword_256BC8D78] >> 5;
  v38 = v37 + 1;
  if ((unint64_t)(v37 + 1) >> 59)
LABEL_45:
    std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
  v39 = v33 - (_QWORD)v36;
  if (v39 >> 4 > v38)
    v38 = v39 >> 4;
  v11 = (unint64_t)v39 >= 0x7FFFFFFFFFFFFFE0;
  v40 = 0x7FFFFFFFFFFFFFFLL;
  if (!v11)
    v40 = v38;
  if (v40 >> 59)
    goto LABEL_44;
  v41 = 32 * v40;
  v42 = (char *)operator new(32 * v40);
  v43 = &v42[32 * v37];
  v44 = &v42[v41];
  *(_QWORD *)v43 = off_256BB7A38;
  *((_QWORD *)v43 + 1) = off_256BB7AD0;
  *((_QWORD *)v43 + 2) = 0xFFFFD013FFFFD000;
  *((_DWORD *)v43 + 6) = 1114;
  v35 = v43 + 32;
  if (v34 == v36)
  {
    *v32 = v43;
    v32[1] = v35;
    v32[2] = v44;
    if (!v36)
      goto LABEL_29;
  }
  else
  {
    do
    {
      v45 = *((_OWORD *)v34 - 1);
      v46 = v43 - 32;
      *((_OWORD *)v43 - 2) = *((_OWORD *)v34 - 2);
      *((_OWORD *)v43 - 1) = v45;
      v34 -= 32;
      v43 -= 32;
    }
    while (v34 != v36);
    *v32 = v46;
    v32[1] = v35;
    v32[2] = v44;
    if (!v36)
      goto LABEL_29;
  }
  operator delete(v36);
  v32[1] = v35;
}

char *__dy_add_fenum_string_tables_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v16;

  v2 = *(_QWORD *)qword_256BC8D78;
  v1 = *(_QWORD *)(qword_256BC8D78 + 8);
  if (*(_QWORD *)qword_256BC8D78 == v1)
  {
    v4 = 0;
    goto LABEL_9;
  }
  v3 = v1 - v2 - 32;
  if (v3 < 0x20)
  {
    v4 = 0;
    v5 = *(_QWORD *)qword_256BC8D78;
    do
    {
LABEL_8:
      v4 += *(_DWORD *)(v5 + 20) - *(_DWORD *)(v5 + 16);
      v5 += 32;
    }
    while (v5 != v1);
    goto LABEL_9;
  }
  v6 = 0;
  v7 = 0;
  v8 = (v3 >> 5) + 1;
  v5 = v2 + 32 * (v8 & 0xFFFFFFFFFFFFFFELL);
  v9 = (int *)(v2 + 48);
  v10 = v8 & 0xFFFFFFFFFFFFFFELL;
  do
  {
    v11 = *(v9 - 8);
    v12 = *(v9 - 7);
    v14 = *v9;
    v13 = v9[1];
    v9 += 16;
    v6 += v12 - v11;
    v7 += v13 - v14;
    v10 -= 2;
  }
  while (v10);
  v4 = v7 + v6;
  if (v8 != (v8 & 0xFFFFFFFFFFFFFFELL))
    goto LABEL_8;
LABEL_9:
  v16 = v4;
  return std::vector<TextTableEntry>::emplace_back<char const** const&,char const** const&,unsigned int const&,unsigned int const&,unsigned int &>((char **)qword_256BC8D78, (_QWORD *)(a1 + 32), (uint64_t *)(a1 + 40), (int *)(a1 + 48), (int *)(a1 + 52), &v16);
}

char *std::vector<TextTableEntry>::emplace_back<char const** const&,char const** const&,unsigned int const&,unsigned int const&,unsigned int &>(char **a1, _QWORD *a2, uint64_t *a3, int *a4, int *a5, int *a6)
{
  unint64_t v12;
  char *v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  char *v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  BOOL v23;
  unint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  __int128 v33;
  char *v34;

  v13 = a1[1];
  v12 = (unint64_t)a1[2];
  if ((unint64_t)v13 < v12)
  {
    v14 = *a3;
    v15 = *a4;
    v16 = *a5;
    v17 = *a6;
    *(_QWORD *)v13 = *a2;
    *((_QWORD *)v13 + 1) = v14;
    *((_DWORD *)v13 + 4) = v15;
    *((_DWORD *)v13 + 5) = v16 + v15;
    *((_DWORD *)v13 + 6) = v17;
    v18 = v13 + 32;
    goto LABEL_13;
  }
  v19 = *a1;
  v20 = (v13 - *a1) >> 5;
  v21 = v20 + 1;
  if ((unint64_t)(v20 + 1) >> 59)
    std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
  v22 = v12 - (_QWORD)v19;
  if (v22 >> 4 > v21)
    v21 = v22 >> 4;
  v23 = (unint64_t)v22 >= 0x7FFFFFFFFFFFFFE0;
  v24 = 0x7FFFFFFFFFFFFFFLL;
  if (!v23)
    v24 = v21;
  if (v24 >> 59)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v25 = 32 * v24;
  v26 = (char *)operator new(32 * v24);
  v27 = &v26[32 * v20];
  v28 = &v26[v25];
  v29 = *a3;
  v30 = *a4;
  v31 = *a5;
  v32 = *a6;
  *(_QWORD *)v27 = *a2;
  *((_QWORD *)v27 + 1) = v29;
  *((_DWORD *)v27 + 4) = v30;
  *((_DWORD *)v27 + 5) = v31 + v30;
  *((_DWORD *)v27 + 6) = v32;
  v18 = v27 + 32;
  if (v13 == v19)
  {
    *a1 = v27;
    a1[1] = v18;
    a1[2] = v28;
    if (!v19)
      goto LABEL_13;
    goto LABEL_12;
  }
  do
  {
    v33 = *((_OWORD *)v13 - 1);
    v34 = v27 - 32;
    *((_OWORD *)v27 - 2) = *((_OWORD *)v13 - 2);
    *((_OWORD *)v27 - 1) = v33;
    v13 -= 32;
    v27 -= 32;
  }
  while (v13 != v19);
  *a1 = v34;
  a1[1] = v18;
  a1[2] = v28;
  if (v19)
LABEL_12:
    operator delete(v19);
LABEL_13:
  a1[1] = v18;
  return v18 - 32;
}

uint64_t dy_fenum_get_unified_index(int a1)
{
  unsigned int v2;
  uint64_t v3;
  _QWORD v5[5];
  int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  if (_MergedGlobals_2236 != -1)
    dispatch_once_f(&_MergedGlobals_2236, 0, (dispatch_function_t)_BuildTextTableEntries);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = -1;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 0x40000000;
  v5[2] = __dy_fenum_get_unified_index_block_invoke;
  v5[3] = &unk_250D63A10;
  v6 = a1;
  v5[4] = &v7;
  dispatch_sync((dispatch_queue_t)qword_256BC8D70, v5);
  v2 = *((_DWORD *)v8 + 6);
  if (v2 == -1)
    v3 = 0;
  else
    v3 = v2;
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __dy_fenum_get_unified_index_block_invoke(uint64_t result)
{
  _DWORD *v1;
  _DWORD *v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  BOOL v6;

  v1 = *(_DWORD **)qword_256BC8D78;
  v2 = *(_DWORD **)(qword_256BC8D78 + 8);
  if (*(_DWORD **)qword_256BC8D78 != v2)
  {
    v3 = *(_DWORD *)(result + 40);
    while (1)
    {
      v4 = v1[4];
      v6 = v3 >= v4;
      v5 = v3 - v4;
      v6 = !v6 || v3 >= v1[5];
      if (!v6)
        break;
      v1 += 8;
      if (v1 == v2)
        return result;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v5 + v1[6];
  }
  return result;
}

const char *dy_fenum_to_function_name(int a1, __int16 a2, int a3)
{
  char v3;
  uint64_t v5;
  const char *v7;
  _QWORD v9[5];
  int v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  if ((a2 & 0x4000) != 0)
  {
    v7 = "glDiscardFramebufferEXT";
    if (a3)
      v7 = "DiscardFramebuffer";
    if (a1 == 835)
      return v7;
    else
      return 0;
  }
  else if (a1 == -1)
  {
    return 0;
  }
  else
  {
    if (_MergedGlobals_2236 != -1)
      dispatch_once_f(&_MergedGlobals_2236, 0, (dispatch_function_t)_BuildTextTableEntries);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 0x40000000;
    v9[2] = ___ZL22fenum_to_function_namejb_block_invoke;
    v9[3] = &unk_250D63A38;
    v10 = a1;
    v9[4] = &v12;
    v11 = v3;
    dispatch_sync((dispatch_queue_t)qword_256BC8D70, v9);
    v5 = v13[3];
    _Block_object_dispose(&v12, 8);
    return (const char *)v5;
  }
}

uint64_t ___ZL22fenum_to_function_namejb_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  BOOL v6;

  v1 = *(_QWORD *)qword_256BC8D78;
  v2 = *(_QWORD *)(qword_256BC8D78 + 8);
  if (*(_QWORD *)qword_256BC8D78 != v2)
  {
    v3 = *(_DWORD *)(result + 40);
    while (1)
    {
      v4 = *(_DWORD *)(v1 + 16);
      v6 = v3 >= v4;
      v5 = v3 - v4;
      v6 = !v6 || v3 >= *(_DWORD *)(v1 + 20);
      if (!v6)
        break;
      v1 += 32;
      if (v1 == v2)
        return result;
    }
    if (*(_BYTE *)(result + 44))
      v1 += 8;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(*(_QWORD *)v1 + 8 * v5);
  }
  return result;
}

void xpc_dictionary_set_nsobject(void *a1, const char *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;

  if (a3)
  {
    v5 = (void *)MEMORY[0x24BDD1618];
    v8 = 0;
    v6 = a1;
    objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v8);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v6, a2, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));

  }
}

void xpc_dictionary_set_nsdata(void *a1, const char *a2, id a3)
{
  id v5;
  const void *v6;
  size_t v7;
  xpc_object_t xdict;

  if (a3)
  {
    v5 = objc_retainAutorelease(a3);
    xdict = a1;
    v6 = (const void *)objc_msgSend(v5, "bytes");
    v7 = objc_msgSend(v5, "length");

    xpc_dictionary_set_data(xdict, a2, v6, v7);
  }
}

const void *xpc_dictionary_get_nsdata(void *a1, const char *a2)
{
  const void *result;
  const void *v3;
  id v4;
  size_t length;

  length = 0;
  result = xpc_dictionary_get_data(a1, a2, &length);
  if (result)
  {
    v3 = result;
    v4 = objc_alloc(MEMORY[0x24BDBCE50]);
    return (const void *)objc_msgSend(v4, "initWithBytes:length:", v3, length);
  }
  return result;
}

const void *xpc_dictionary_get_nsdata_nocopy(void *a1, const char *a2)
{
  const void *result;
  const void *v3;
  id v4;
  size_t length;

  length = 0;
  result = xpc_dictionary_get_data(a1, a2, &length);
  if (result)
  {
    v3 = result;
    v4 = objc_alloc(MEMORY[0x24BDBCE50]);
    return (const void *)objc_msgSend(v4, "initWithBytesNoCopy:length:freeWhenDone:", v3, length, 0);
  }
  return result;
}

void *xpc_dictionary_get_nsobject(void *a1, const char *a2, uint64_t a3)
{
  void *nsdata_nocopy;
  void *v5;
  uint64_t v7;

  nsdata_nocopy = (void *)xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (!nsdata_nocopy)
    goto LABEL_5;
  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", a3, nsdata_nocopy, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    v5 = 0;
  }

  return v5;
}

uint64_t xpc_dictionary_get_nsobject_any(void *a1, const char *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t nsobject_classes;

  v2 = (objc_class *)MEMORY[0x24BDBCF20];
  v3 = a1;
  v4 = [v2 alloc];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = (void *)objc_msgSend(v4, "initWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  nsobject_classes = xpc_dictionary_get_nsobject_classes(v3, a2, v13);

  return nsobject_classes;
}

uint64_t xpc_dictionary_get_nsarray(void *a1, const char *a2, uint64_t a3)
{
  void *nsdata_nocopy;
  uint64_t v5;
  uint64_t v7;

  nsdata_nocopy = (void *)xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    v7 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedArrayOfObjectsOfClass:fromData:error:", a3, nsdata_nocopy, &v7);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t xpc_dictionary_get_nsdictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *nsdata_nocopy;
  uint64_t v7;
  uint64_t v9;

  nsdata_nocopy = (void *)xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:", a3, a4, nsdata_nocopy, &v9);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t xpc_dictionary_get_nsobject_classes(void *a1, const char *a2, void *a3)
{
  id v5;
  void *nsdata_nocopy;
  uint64_t v7;
  uint64_t v9;

  v5 = a3;
  nsdata_nocopy = (void *)xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v5, nsdata_nocopy, &v9);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id xpc_dictionary_get_nsarray_any(void *a1, const char *a2)
{
  void *nsobject_any;
  void *v3;
  id v4;

  nsobject_any = (void *)xpc_dictionary_get_nsobject_any(a1, a2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = nsobject_any;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

id xpc_dictionary_get_nsdictionary_any(void *a1, const char *a2)
{
  void *nsobject_any;
  void *v3;
  id v4;

  nsobject_any = (void *)xpc_dictionary_get_nsobject_any(a1, a2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = nsobject_any;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

const char *xpc_error_string(void *a1)
{
  const char *result;

  result = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x24BDACF40]);
  if (!result)
    return "Unknown";
  return result;
}

void xpc_dictionary_set_flag(void *a1, const char *a2, char a3)
{
  uint64_t uint64;
  xpc_object_t xdict;

  xdict = a1;
  uint64 = xpc_dictionary_get_uint64(xdict, a2);
  xpc_dictionary_set_uint64(xdict, a2, uint64 | (1 << a3));

}

uint64_t xpc_dictionary_get_flag(void *a1, const char *a2, char a3)
{
  return (xpc_dictionary_get_uint64(a1, a2) >> a3) & 1;
}

id xpc_array_pop(void *a1)
{
  id v1;
  size_t count;
  size_t v3;
  uint64_t v4;
  void *v5;
  xpc_object_t v6;

  v1 = a1;
  count = xpc_array_get_count(v1);
  if (count)
  {
    v3 = count - 1;
    v4 = MEMORY[0x24BDACFE0];
    while (1)
    {
      xpc_array_get_value(v1, v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (MEMORY[0x242623868]() != v4)
        break;

      if (--v3 == -1)
        goto LABEL_5;
    }
    v6 = xpc_null_create();
    xpc_array_set_value(v1, v3, v6);

  }
  else
  {
LABEL_5:
    v5 = 0;
  }

  return v5;
}

void xpc_dictionary_array_push(void *a1, const char *a2, void *a3)
{
  id v5;
  void *empty;
  xpc_object_t value;

  value = a3;
  v5 = a1;
  xpc_dictionary_get_array(v5, a2);
  empty = (void *)objc_claimAutoreleasedReturnValue();
  if (!empty)
    empty = xpc_array_create_empty();
  xpc_array_append_value(empty, value);
  xpc_dictionary_set_value(v5, a2, empty);

}

id xpc_dictionary_array_pop(void *a1, const char *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a1;
  xpc_dictionary_get_array(v3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    xpc_array_pop(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_value(v3, a2, v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

BOOL xpc_dictionary_string_array_contains(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  _BOOL8 v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  xpc_dictionary_get_array(a1, a2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4 && MEMORY[0x242623868](v4) == MEMORY[0x24BDACF78])
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __xpc_dictionary_string_array_contains_block_invoke;
    v8[3] = &unk_250D63A60;
    v8[4] = &v9;
    v8[5] = a3;
    xpc_array_apply(v5, v8);
    v6 = *((_BYTE *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __xpc_dictionary_string_array_contains_block_invoke(uint64_t a1, int a2, xpc_object_t xstring)
{
  const char *string_ptr;
  int v5;
  uint64_t result;

  string_ptr = xpc_string_get_string_ptr(xstring);
  if (!string_ptr)
    return 1;
  v5 = strcmp(*(const char **)(a1 + 40), string_ptr);
  result = 1;
  if (!v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  return result;
}

const void *xpc_array_get_nsdata_nocopy(void *a1, size_t a2)
{
  const void *result;
  const void *v3;
  id v4;
  size_t length;

  length = 0;
  result = xpc_array_get_data(a1, a2, &length);
  if (result)
  {
    v3 = result;
    v4 = objc_alloc(MEMORY[0x24BDBCE50]);
    return (const void *)objc_msgSend(v4, "initWithBytesNoCopy:length:freeWhenDone:", v3, length, 0);
  }
  return result;
}

uint64_t xpc_array_get_nsobject_classes(void *a1, size_t a2, void *a3)
{
  id v5;
  void *nsdata_nocopy;
  uint64_t v7;
  uint64_t v9;

  v5 = a3;
  nsdata_nocopy = (void *)xpc_array_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v5, nsdata_nocopy, &v9);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void *xpc_array_get_nsobject(void *a1, size_t a2, uint64_t a3)
{
  void *nsdata_nocopy;
  void *v5;
  uint64_t v7;

  nsdata_nocopy = (void *)xpc_array_get_nsdata_nocopy(a1, a2);
  if (!nsdata_nocopy)
    goto LABEL_5;
  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", a3, nsdata_nocopy, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    v5 = 0;
  }

  return v5;
}

void xpc_array_set_nsobject(void *a1, size_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;

  if (a3)
  {
    v5 = (void *)MEMORY[0x24BDD1618];
    v8 = 0;
    v6 = a1;
    objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v8);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_array_set_data(v6, a2, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));

  }
}

xpc_object_t xpc_nsobject_create(void *a1)
{
  id v1;
  xpc_object_t v2;
  uint64_t v4;

  if (a1)
  {
    v4 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, &v4);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v1 = objc_retainAutorelease(a1);
  v2 = xpc_data_create((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"));

  return v2;
}

xpc_object_t gt_xpc_dictionary_create_reply(void *a1)
{
  return xpc_dictionary_create_reply(a1);
}

char *__cdecl apr_cpystrn(char *dst, const char *src, apr_size_t dst_size)
{
  char *v3;
  apr_size_t v4;
  int v5;

  if (dst_size)
  {
    if (src && (v3 = &dst[dst_size - 1], v3 > dst))
    {
      v4 = dst_size - 1;
      while (1)
      {
        v5 = *(unsigned __int8 *)src;
        *dst = v5;
        if (!v5)
          break;
        ++dst;
        ++src;
        if (!--v4)
        {
          dst = v3;
          goto LABEL_8;
        }
      }
    }
    else
    {
LABEL_8:
      *dst = 0;
    }
  }
  return dst;
}

apr_status_t apr_tokenize_to_argv(const char *arg_str, char ***argv_out, apr_pool_t *token_context)
{
  int v6;
  int v7;
  const char *v8;
  const char *v9;
  _BOOL4 v10;
  BOOL v11;
  int v12;
  BOOL v13;
  BOOL v14;
  unsigned int v15;
  BOOL v16;
  uint64_t v17;
  char **v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  const char *v25;
  const char *v26;
  _BOOL4 v27;
  BOOL v28;
  const char *v29;
  int v30;
  BOOL v31;
  BOOL v32;
  unsigned int v33;
  uint64_t v34;
  char *v36;
  char *v37;
  int64_t v38;
  int v39;
  char *v40;
  int v41;
  int v42;
  unsigned __int8 *v43;
  int v44;

  while (1)
  {
    v6 = *(unsigned __int8 *)arg_str;
    if (v6 != 9 && v6 != 32)
      break;
    ++arg_str;
  }
  if (!*arg_str)
  {
    v7 = 1;
    goto LABEL_48;
  }
  v7 = 1;
  v8 = arg_str;
  do
  {
    if (v6 == 39)
      v9 = v8 + 1;
    else
      v9 = v8;
    if (v6 == 34)
      ++v8;
    else
      v8 = v9;
    v10 = v6 != 34 && v6 != 39;
    v11 = v6 != 34 && v6 == 39;
    while (1)
    {
      v12 = *(unsigned __int8 *)v8;
      if (v12 == 92)
      {
        v15 = *((unsigned __int8 *)v8 + 1);
        v16 = v15 > 0x27;
        v17 = (1 << v15) & 0x8500000200;
        if (!v16 && v17 != 0)
        {
          ++v8;
          goto LABEL_38;
        }
      }
      else if (!*v8)
      {
        break;
      }
      if (v10 && (v12 == 9 || v12 == 32))
        break;
      v13 = v12 == 39 && v11;
      v14 = v12 == 34 && v6 == 34;
      if (v14 || v13)
        break;
LABEL_38:
      ++v8;
    }
    if (*v8)
      ++v8;
    while (1)
    {
      v6 = *(unsigned __int8 *)v8;
      if (v6 != 32 && v6 != 9)
        break;
      ++v8;
    }
    ++v7;
  }
  while (*v8);
LABEL_48:
  v20 = (char **)apr_palloc(token_context, 8 * v7);
  *argv_out = v20;
  if (v7 < 2)
  {
    v22 = 0;
    goto LABEL_106;
  }
  v21 = 0;
  v22 = (v7 - 1);
  while (2)
  {
    while (1)
    {
      v23 = *(unsigned __int8 *)arg_str;
      if (v23 != 32 && v23 != 9)
        break;
      ++arg_str;
    }
    if (v23 == 39)
      v25 = arg_str + 1;
    else
      v25 = arg_str;
    if (v23 == 34)
      v26 = arg_str + 1;
    else
      v26 = v25;
    v27 = v23 != 34 && v23 != 39;
    v28 = v23 != 34 && v23 == 39;
    v29 = v26;
    while (2)
    {
      v30 = *(unsigned __int8 *)v29;
      if (v30 == 92)
      {
        v33 = *((unsigned __int8 *)v29 + 1);
        v16 = v33 > 0x27;
        v34 = (1 << v33) & 0x8500000200;
        if (v16 || v34 == 0)
          goto LABEL_71;
        ++v29;
LABEL_88:
        ++v29;
        continue;
      }
      break;
    }
    if (!*v29)
      goto LABEL_89;
LABEL_71:
    if (!v27 || v30 != 9 && v30 != 32)
    {
      v31 = v30 == 39 && v28;
      v32 = v30 == 34 && v23 == 34;
      if (!v32 && !v31)
        goto LABEL_88;
    }
LABEL_89:
    arg_str = v29 + 1;
    (*argv_out)[v21] = (char *)apr_palloc(token_context, v29 + 1 - v26);
    if (v29 + 1 != v26)
    {
      v36 = (*argv_out)[v21];
      v37 = &v36[v29 - v26];
      if (v37 <= v36)
      {
LABEL_95:
        *v36 = 0;
      }
      else
      {
        v38 = v29 - v26;
        while (1)
        {
          v39 = *(unsigned __int8 *)v26;
          *v36 = v39;
          if (!v39)
            break;
          ++v36;
          ++v26;
          if (!--v38)
          {
            v36 = v37;
            goto LABEL_95;
          }
        }
      }
    }
    v40 = (*argv_out)[v21];
    v41 = *v40;
    if (*v40)
    {
      v42 = 0;
      v43 = (unsigned __int8 *)(v40 + 1);
      do
      {
        if (v42 || v41 != 92)
        {
          v42 = 0;
          *v40++ = v41;
        }
        else
        {
          v42 = 1;
        }
        v44 = *v43++;
        v41 = v44;
      }
      while (v44);
    }
    *v40 = 0;
    if (++v21 != v22)
      continue;
    break;
  }
  v20 = *argv_out;
LABEL_106:
  v20[v22] = 0;
  return 0;
}

const char *__cdecl apr_filepath_name_get(const char *pathname)
{
  char *v2;

  v2 = strrchr((char *)pathname, 47);
  if (v2)
    return v2 + 1;
  else
    return pathname;
}

char *__cdecl apr_collapse_spaces(char *dest, const char *src)
{
  unsigned int v3;
  const char *v4;
  uint64_t v5;
  unsigned int v6;

  v3 = *(unsigned __int8 *)src;
  if (*src)
  {
    v4 = src + 1;
    v5 = MEMORY[0x24BDAC740];
    while ((v3 & 0x80) == 0)
    {
      if ((*(_DWORD *)(v5 + 4 * v3 + 60) & 0x4000) == 0)
        goto LABEL_5;
LABEL_6:
      v6 = *(unsigned __int8 *)v4++;
      v3 = v6;
      if (!v6)
        goto LABEL_10;
    }
    if (__maskrune(v3, 0x4000uLL))
      goto LABEL_6;
LABEL_5:
    *dest++ = v3;
    goto LABEL_6;
  }
LABEL_10:
  *dest = 0;
  return dest;
}

char *__cdecl apr_strerror(apr_status_t statcode, char *buf, apr_size_t bufsize)
{
  char *v5;
  char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  apr_size_t v11;
  char *v12;
  int v13;
  const char *v14;
  const char *v15;
  apr_size_t v16;
  char *v17;
  int v18;
  apr_size_t v19;
  char *v20;
  int v21;

  if (statcode <= 19999)
  {
    if ((strerror_r(statcode, buf, bufsize) & 0x80000000) == 0 || !bufsize)
      return buf;
    v5 = &buf[bufsize - 1];
    v6 = buf;
    if (v5 > buf)
    {
      v7 = 0;
      while (1)
      {
        buf[v7] = aAprDoesNotUnde[v7];
        if (v7 == 39)
          return buf;
        if (bufsize - 1 == ++v7)
          goto LABEL_39;
      }
    }
LABEL_89:
    *v6 = 0;
    return buf;
  }
  if (statcode >> 6 > 0x752)
  {
    if (statcode > 0xA392F)
    {
      if (statcode > 0xAFC7F)
      {
        if (!bufsize)
          return buf;
        v5 = &buf[bufsize - 1];
        v6 = buf;
        if (v5 <= buf)
          goto LABEL_89;
        v14 = "Unrecognized resolver error";
        if (statcode == 720004)
          v14 = "No address for host";
        if (statcode == 720001)
          v15 = "Unknown host";
        else
          v15 = v14;
        v16 = bufsize - 1;
        v17 = buf;
        while (1)
        {
          v18 = *(unsigned __int8 *)v15;
          *v17 = v18;
          if (!v18)
            break;
          ++v17;
          ++v15;
          if (!--v16)
          {
LABEL_39:
            v6 = v5;
            goto LABEL_89;
          }
        }
      }
      else
      {
        v10 = gai_strerror(statcode - 670000);
        if (!bufsize)
          return buf;
        v6 = buf;
        if (!v10)
          goto LABEL_89;
        v5 = &buf[bufsize - 1];
        v6 = buf;
        if (v5 <= buf)
          goto LABEL_89;
        v11 = bufsize - 1;
        v12 = buf;
        while (1)
        {
          v13 = *(unsigned __int8 *)v10;
          *v12 = v13;
          if (!v13)
            break;
          ++v12;
          ++v10;
          if (!--v11)
            goto LABEL_39;
        }
      }
    }
    else
    {
      if (!bufsize)
        return buf;
      v5 = &buf[bufsize - 1];
      v6 = buf;
      if (v5 <= buf)
        goto LABEL_89;
      v9 = 0;
      while (1)
      {
        buf[v9] = aAprDoesNotUnde[v9];
        if (v9 == 39)
          break;
        if (bufsize - 1 == ++v9)
          goto LABEL_39;
      }
    }
  }
  else
  {
    v8 = "Could not perform a stat on the file.";
    switch(statcode)
    {
      case 20001:
        break;
      case 20002:
        v8 = "A new pool could not be created.";
        break;
      case 20003:
      case 20018:
LABEL_70:
        v8 = "Error string not specified yet";
        break;
      case 20004:
        v8 = "An invalid date has been provided";
        break;
      case 20005:
        v8 = "An invalid socket was returned";
        break;
      case 20006:
        v8 = "No process was provided and one was required.";
        break;
      case 20007:
        v8 = "No time was provided and one was required.";
        break;
      case 20008:
        v8 = "No directory was provided and one was required.";
        break;
      case 20009:
        v8 = "No lock was provided and one was required.";
        break;
      case 20010:
        v8 = "No poll structure was provided and one was required.";
        break;
      case 20011:
        v8 = "No socket was provided and one was required.";
        break;
      case 20012:
        v8 = "No thread was provided and one was required.";
        break;
      case 20013:
        v8 = "No thread key structure was provided and one was required.";
        break;
      case 20014:
        v8 = "Internal error (specific information not available)";
        break;
      case 20015:
        v8 = "No shared memory is currently available";
        break;
      case 20016:
        v8 = "The specified IP address is invalid.";
        break;
      case 20017:
        v8 = "The specified network mask is invalid.";
        break;
      case 20019:
        v8 = "DSO load failed";
        break;
      case 20020:
        v8 = "The given path is absolute";
        break;
      case 20021:
        v8 = "The given path is relative";
        break;
      case 20022:
        v8 = "The given path is incomplete";
        break;
      case 20023:
        v8 = "The given path was above the root path";
        break;
      case 20024:
        v8 = "The given path is misformatted or contained invalid characters";
        break;
      case 20025:
        v8 = "The given path contained wildcard characters";
        break;
      case 20026:
        v8 = "Could not find the requested symbol.";
        break;
      case 20027:
        v8 = "The process is not recognized.";
        break;
      case 20028:
        v8 = "Not enough entropy to continue.";
        break;
      default:
        switch(statcode)
        {
          case 70001:
            v8 = "Your code just forked, and you are currently executing in the child process";
            break;
          case 70002:
            v8 = "Your code just forked, and you are currently executing in the parent process";
            break;
          case 70003:
            v8 = "The specified thread is detached";
            break;
          case 70004:
            v8 = "The specified thread is not detached";
            break;
          case 70005:
            v8 = "The specified child process is done executing";
            break;
          case 70006:
            v8 = "The specified child process is not done executing";
            break;
          case 70007:
            v8 = "The timeout specified has expired";
            break;
          case 70008:
            v8 = "Partial results are valid but processing is incomplete";
            break;
          case 70012:
            v8 = "Bad character specified on command line";
            break;
          case 70013:
            v8 = "Missing parameter for the specified command line option";
            break;
          case 70014:
            v8 = "End of file found";
            break;
          case 70015:
            v8 = "Could not find specified socket in poll list.";
            break;
          case 70019:
            v8 = "Shared memory is implemented anonymously";
            break;
          case 70020:
            v8 = "Shared memory is implemented using files";
            break;
          case 70021:
            v8 = "Shared memory is implemented using a key system";
            break;
          case 70022:
            v8 = "There is no error, this value signifies an initialized error code";
            break;
          case 70023:
            v8 = "This function has not been implemented on this platform";
            break;
          case 70024:
            v8 = "passwords do not match";
            break;
          case 70025:
            v8 = "The given lock was busy.";
            break;
          default:
            goto LABEL_70;
        }
        break;
    }
    if (!bufsize)
      return buf;
    v6 = buf;
    if (&buf[bufsize - 1] <= buf)
      goto LABEL_89;
    v19 = bufsize - 1;
    v20 = buf;
    while (1)
    {
      v21 = *(unsigned __int8 *)v8;
      *v20 = v21;
      if (!v21)
        break;
      ++v20;
      ++v8;
      if (!--v19)
      {
        v6 = &buf[bufsize - 1];
        goto LABEL_89;
      }
    }
  }
  return buf;
}

apr_hash_t *__cdecl apr_hash_make(apr_pool_t *pool)
{
  __darwin_time_t tv_sec;
  _QWORD *v3;
  _OWORD *v4;
  timeval v6;

  v6.tv_sec = 0;
  *(_QWORD *)&v6.tv_usec = 0;
  gettimeofday(&v6, 0);
  v6.tv_sec = v6.tv_usec + 1000000 * v6.tv_sec;
  tv_sec = v6.tv_sec;
  v3 = apr_palloc(pool, 0x50uLL);
  *v3 = pool;
  v3[9] = 0;
  v3[6] = 0xF00000000;
  *((_DWORD *)v3 + 14) = (&v6 ^ pool ^ v3 ^ tv_sec ^ HIDWORD(tv_sec)) - 1;
  v4 = apr_palloc(pool, 0x80uLL);
  if (v4)
  {
    v4[6] = 0u;
    v4[7] = 0u;
    v4[4] = 0u;
    v4[5] = 0u;
    v4[2] = 0u;
    v4[3] = 0u;
    *v4 = 0u;
    v4[1] = 0u;
  }
  v3[1] = v4;
  v3[8] = 0;
  return (apr_hash_t *)v3;
}

apr_hash_t *__cdecl apr_hash_make_custom(apr_pool_t *pool, apr_hashfunc_t hash_func)
{
  apr_hash_t *result;

  result = apr_hash_make(pool);
  *((_QWORD *)result + 8) = hash_func;
  return result;
}

apr_hash_index_t *__cdecl apr_hash_next(apr_hash_index_t *hi)
{
  _QWORD *v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;

  v1 = (_QWORD *)*((_QWORD *)hi + 2);
  *((_QWORD *)hi + 1) = v1;
  if (v1)
  {
LABEL_5:
    *((_QWORD *)hi + 2) = *v1;
  }
  else
  {
    v2 = *(_QWORD *)hi;
    v3 = *(_DWORD *)(*(_QWORD *)hi + 52);
    v4 = *((_DWORD *)hi + 6);
    while (v4 <= v3)
    {
      v1 = *(_QWORD **)(*(_QWORD *)(v2 + 8) + 8 * v4++);
      *((_DWORD *)hi + 6) = v4;
      *((_QWORD *)hi + 1) = v1;
      if (v1)
        goto LABEL_5;
    }
    return 0;
  }
  return hi;
}

apr_hash_index_t *__cdecl apr_hash_first(apr_pool_t *p, apr_hash_t *ht)
{
  char *v3;

  if (p)
    v3 = (char *)apr_palloc(p, 0x20uLL);
  else
    v3 = (char *)ht + 16;
  *((_QWORD *)v3 + 1) = 0;
  *((_QWORD *)v3 + 2) = 0;
  *(_QWORD *)v3 = ht;
  *((_DWORD *)v3 + 6) = 0;
  return apr_hash_next((apr_hash_index_t *)v3);
}

void apr_hash_this(apr_hash_index_t *hi, const void **key, apr_ssize_t *klen, void **val)
{
  if (key)
    *key = *(const void **)(*((_QWORD *)hi + 1) + 16);
  if (klen)
    *klen = *(_QWORD *)(*((_QWORD *)hi + 1) + 24);
  if (val)
    *val = *(void **)(*((_QWORD *)hi + 1) + 32);
}

const void *__cdecl apr_hash_this_key(apr_hash_index_t *hi)
{
  return *(const void **)(*((_QWORD *)hi + 1) + 16);
}

apr_ssize_t apr_hash_this_key_len(apr_hash_index_t *hi)
{
  return *(_QWORD *)(*((_QWORD *)hi + 1) + 24);
}

void *__cdecl apr_hash_this_val(apr_hash_index_t *hi)
{
  return *(void **)(*((_QWORD *)hi + 1) + 32);
}

unsigned int apr_hashfunc_default(const char *key, apr_ssize_t *klen)
{
  return hashfunc_default(key, klen, 0);
}

uint64_t hashfunc_default(_BYTE *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  int v5;
  _BYTE *v6;
  int v7;

  v3 = *a2;
  if (*a2 == -1)
  {
    v5 = *a1;
    if (*a1)
    {
      v6 = a1;
      do
      {
        a3 = (33 * a3 + v5);
        v7 = *++v6;
        v5 = v7;
      }
      while (v7);
    }
    else
    {
      v6 = a1;
    }
    *a2 = v6 - a1;
  }
  else
  {
    for (; v3; --v3)
    {
      v4 = *a1++;
      a3 = (33 * a3 + v4);
    }
  }
  return a3;
}

apr_hash_t *__cdecl apr_hash_copy(apr_pool_t *pool, const apr_hash_t *h)
{
  apr_hash_t *result;
  uint64_t v5;
  char **v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char **v10;
  uint64_t *v11;
  char **v12;
  char *v13;
  char *v14;
  char *v15;

  result = (apr_hash_t *)apr_palloc(pool, 40 * *((unsigned int *)h + 12) + 8 * (*((_DWORD *)h + 13) + 1) + 80);
  v5 = 0;
  v6 = 0;
  *((_DWORD *)result + 12) = *((_DWORD *)h + 12);
  v7 = *(_QWORD *)((char *)h + 52);
  *(_QWORD *)((char *)result + 52) = v7;
  *((_QWORD *)result + 8) = *((_QWORD *)h + 8);
  *((_QWORD *)result + 9) = 0;
  *(_QWORD *)result = pool;
  *((_QWORD *)result + 1) = (char *)result + 80;
  v8 = (char *)result + 8 * (*((_DWORD *)h + 13) + 1) + 80;
  if ((v7 + 1) > 1)
    v9 = (v7 + 1);
  else
    v9 = 1;
  do
  {
    v10 = (char **)(*((_QWORD *)result + 1) + 8 * v5);
    v11 = *(uint64_t **)(*((_QWORD *)h + 1) + 8 * v5);
    if (v11)
    {
      do
      {
        v12 = (char **)((_DWORD)v6 + 1);
        v13 = &v8[40 * v6];
        *v10 = v13;
        *((_DWORD *)v13 + 2) = *((_DWORD *)v11 + 2);
        v14 = (char *)v11[3];
        *((_QWORD *)v13 + 2) = v11[2];
        v6 = (char **)*v10;
        v15 = (char *)v11[4];
        v6[3] = v14;
        v6[4] = v15;
        v10 = (char **)*v10;
        v11 = (uint64_t *)*v11;
        LODWORD(v6) = (_DWORD)v12;
      }
      while (v11);
    }
    else
    {
      v12 = v6;
    }
    *v10 = 0;
    ++v5;
    v6 = v12;
  }
  while (v5 != v9);
  return result;
}

void *__cdecl apr_hash_get(apr_hash_t *ht, const void *key, apr_ssize_t klen)
{
  _QWORD *entry;

  entry = find_entry((uint64_t)ht, key, klen, 0);
  if (*entry)
    return *(void **)(*entry + 32);
  else
    return 0;
}

_QWORD *find_entry(uint64_t a1, _BYTE *a2, size_t a3, uint64_t a4)
{
  uint64_t (*v7)(_BYTE *, size_t *);
  unsigned int v8;
  unsigned int v9;
  _QWORD *v10;
  uint64_t v11;
  size_t v12;
  _QWORD *v13;
  _DWORD *v14;
  size_t v15;
  size_t __n;

  __n = a3;
  v7 = *(uint64_t (**)(_BYTE *, size_t *))(a1 + 64);
  if (v7)
    v8 = v7(a2, &__n);
  else
    v8 = hashfunc_default(a2, (uint64_t *)&__n, *(unsigned int *)(a1 + 56));
  v9 = v8;
  v10 = (_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * (*(_DWORD *)(a1 + 52) & v8));
  v11 = *v10;
  if (*v10)
  {
    v12 = __n;
    while (1)
    {
      v13 = v10;
      v10 = (_QWORD *)v11;
      if (*(_DWORD *)(v11 + 8) == v9 && *(_QWORD *)(v11 + 24) == v12 && !memcmp(*(const void **)(v11 + 16), a2, v12))
        break;
      v11 = *v10;
      if (!*v10)
        goto LABEL_10;
    }
  }
  else
  {
LABEL_10:
    if (a4)
    {
      v14 = *(_DWORD **)(a1 + 72);
      if (v14)
        *(_QWORD *)(a1 + 72) = *(_QWORD *)v14;
      else
        v14 = apr_palloc(*(apr_pool_t **)a1, 0x28uLL);
      *(_QWORD *)v14 = 0;
      v14[2] = v9;
      v15 = __n;
      *((_QWORD *)v14 + 2) = a2;
      *((_QWORD *)v14 + 3) = v15;
      *((_QWORD *)v14 + 4) = a4;
      *v10 = v14;
      ++*(_DWORD *)(a1 + 48);
    }
    return v10;
  }
  return v13;
}

void apr_hash_set(apr_hash_t *ht, const void *key, apr_ssize_t klen, const void *val)
{
  _QWORD *entry;
  _QWORD *v7;
  unsigned int v8;
  int v9;
  apr_size_t v10;
  _QWORD *v11;
  _QWORD *v12;
  apr_hash_index_t *v13;
  uint64_t v14;
  unsigned int v15;

  entry = find_entry((uint64_t)ht, key, klen, (uint64_t)val);
  v7 = (_QWORD *)*entry;
  if (*entry)
  {
    if (val)
    {
      v7[4] = val;
      v8 = *((_DWORD *)ht + 13);
      if (*((_DWORD *)ht + 12) > v8)
      {
        v9 = (2 * v8) | 1;
        v10 = 8 * (2 * v8 + 2);
        v11 = apr_palloc(*(apr_pool_t **)ht, v10);
        v12 = v11;
        if (v11)
          bzero(v11, v10);
        v13 = (apr_hash_t *)((char *)ht + 16);
        *((_QWORD *)ht + 3) = 0;
        *((_QWORD *)ht + 4) = 0;
        *((_QWORD *)ht + 2) = ht;
        *((_DWORD *)ht + 10) = 0;
        while (1)
        {
          v13 = apr_hash_next(v13);
          if (!v13)
            break;
          v14 = *((_QWORD *)v13 + 1);
          v15 = *(_DWORD *)(v14 + 8) & v9;
          *(_QWORD *)v14 = v12[v15];
          v12[v15] = v14;
        }
        *((_QWORD *)ht + 1) = v12;
        *((_DWORD *)ht + 13) = v9;
      }
    }
    else
    {
      *entry = *v7;
      *v7 = *((_QWORD *)ht + 9);
      *((_QWORD *)ht + 9) = v7;
      --*((_DWORD *)ht + 12);
    }
  }
}

unsigned int apr_hash_count(apr_hash_t *ht)
{
  return *((_DWORD *)ht + 12);
}

void apr_hash_clear(apr_hash_t *ht)
{
  apr_hash_index_t *v2;
  apr_hash_index_t *v3;

  *((_QWORD *)ht + 4) = 0;
  *((_QWORD *)ht + 2) = ht;
  *((_QWORD *)ht + 3) = 0;
  *((_DWORD *)ht + 10) = 0;
  v2 = apr_hash_next((apr_hash_t *)((char *)ht + 16));
  if (v2)
  {
    v3 = v2;
    do
    {
      apr_hash_set(ht, *(const void **)(*((_QWORD *)v3 + 1) + 16), *(_QWORD *)(*((_QWORD *)v3 + 1) + 24), 0);
      v3 = apr_hash_next(v3);
    }
    while (v3);
  }
}

apr_hash_t *__cdecl apr_hash_overlay(apr_pool_t *p, const apr_hash_t *overlay, const apr_hash_t *base)
{
  return apr_hash_merge(p, overlay, base, 0, 0);
}

apr_hash_t *__cdecl apr_hash_merge(apr_pool_t *p, const apr_hash_t *h1, const apr_hash_t *h2, void *(__cdecl *merger)(apr_pool_t *, const void *, apr_ssize_t, const void *, const void *, const void *), const void *data)
{
  _QWORD *v8;
  _QWORD *v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  apr_size_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  char *v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  int v23;
  unsigned int v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  _QWORD *i;
  uint64_t (*v30)(_BYTE *, _QWORD *);
  _BYTE *v31;
  unsigned int v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t **v36;
  size_t v37;
  const void *v38;
  char *v39;
  uint64_t *v40;
  const apr_hash_t *v42;
  unsigned int v43;
  apr_pool_t *v44;

  v8 = apr_palloc(p, 0x50uLL);
  v9 = v8;
  *v8 = p;
  v8[8] = *((_QWORD *)h2 + 8);
  v8[9] = 0;
  v10 = *((_DWORD *)h2 + 13);
  *((_DWORD *)v8 + 12) = *((_DWORD *)h2 + 12);
  v12 = *((_DWORD *)h1 + 12);
  v11 = *((_DWORD *)h1 + 13);
  if (v11 <= v10)
    v11 = v10;
  *((_DWORD *)v8 + 13) = v11;
  if (v12 + *((_DWORD *)h2 + 12) > v11)
  {
    v11 = (2 * v11) | 1;
    *((_DWORD *)v8 + 13) = v11;
  }
  *((_DWORD *)v8 + 14) = *((_DWORD *)h2 + 14);
  v13 = 8 * (v11 + 1);
  v14 = apr_palloc(p, v13);
  v15 = v14;
  if (v14)
    bzero(v14, v13);
  v9[1] = v15;
  v16 = *((_DWORD *)h1 + 12) + *((_DWORD *)h2 + 12);
  if (v16)
    v17 = (char *)apr_palloc(p, 40 * v16);
  else
    v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = *((_DWORD *)h2 + 13);
  if ((v20 + 1) > 1)
    v21 = (v20 + 1);
  else
    v21 = 1;
  do
  {
    v22 = *(uint64_t **)(*((_QWORD *)h2 + 1) + 8 * v18);
    if (v22)
    {
      v23 = *((_DWORD *)v9 + 13);
      do
      {
        v24 = *((_DWORD *)v22 + 2);
        v25 = &v17[40 * v19];
        *((_OWORD *)v25 + 1) = *((_OWORD *)v22 + 1);
        *((_QWORD *)v25 + 4) = v22[4];
        v26 = v9[1];
        v27 = *(_QWORD *)(v26 + 8 * (v23 & v24));
        *((_DWORD *)v25 + 2) = v24;
        *(_QWORD *)v25 = v27;
        *(_QWORD *)(v26 + 8 * (v23 & v24)) = v25;
        ++v19;
        v22 = (uint64_t *)*v22;
      }
      while (v22);
    }
    ++v18;
  }
  while (v18 != v21);
  v44 = p;
  v28 = 0;
  v42 = h1;
  do
  {
    v43 = v28;
    for (i = *(_QWORD **)(*((_QWORD *)h1 + 1) + 8 * v28); i; i = (_QWORD *)*i)
    {
      v30 = (uint64_t (*)(_BYTE *, _QWORD *))v9[8];
      v31 = (_BYTE *)i[2];
      if (v30)
        v32 = v30(v31, i + 3);
      else
        v32 = hashfunc_default(v31, i + 3, *((unsigned int *)v9 + 14));
      v33 = v32;
      v34 = *((_DWORD *)v9 + 13) & v32;
      v35 = v9[1];
      v36 = *(uint64_t ***)(v35 + 8 * v34);
      v37 = i[3];
      if (v36)
      {
        while (1)
        {
          if (v36[3] == (uint64_t *)v37)
          {
            v38 = (const void *)i[2];
            if (!memcmp(v36[2], v38, v37))
              break;
          }
          v36 = (uint64_t **)*v36;
          if (!v36)
            goto LABEL_26;
        }
        v40 = (uint64_t *)i[4];
        if (merger)
          v36[4] = (uint64_t *)((uint64_t (*)(apr_pool_t *, const void *, size_t, uint64_t *, uint64_t *, const void *))merger)(v44, v38, v37, v40, v36[4], data);
        else
          v36[4] = v40;
      }
      else
      {
LABEL_26:
        v39 = &v17[40 * v19];
        *((_QWORD *)v39 + 2) = i[2];
        *((_QWORD *)v39 + 3) = v37;
        *((_QWORD *)v39 + 4) = i[4];
        *((_DWORD *)v39 + 2) = v33;
        *(_QWORD *)v39 = *(_QWORD *)(v35 + 8 * v34);
        *(_QWORD *)(v35 + 8 * v34) = v39;
        ++*((_DWORD *)v9 + 12);
        ++v19;
      }
    }
    v28 = v43 + 1;
    h1 = v42;
  }
  while (v43 + 1 <= *((_DWORD *)v42 + 13));
  return (apr_hash_t *)v9;
}

int apr_hash_do(apr_hash_do_callback_fn_t *comp, void *rec, const apr_hash_t *ht)
{
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  _QWORD *v8;
  apr_hash_index_t *v9;
  int result;
  _QWORD v11[3];
  uint64_t v12;

  v5 = 0;
  v12 = 0;
  v11[0] = ht;
  v6 = *((_DWORD *)ht + 13);
  v7 = *((_QWORD *)ht + 1);
  while (1)
  {
    v8 = *(_QWORD **)(v7 + 8 * v5++);
    v11[1] = v8;
    if (v8)
      break;
    if (v5 > v6)
      return 1;
  }
  LODWORD(v12) = v5;
  v11[2] = *v8;
  v9 = (apr_hash_index_t *)v11;
  while (1)
  {
    result = ((uint64_t (*)(void *, _QWORD, _QWORD, _QWORD))comp)(rec, *(_QWORD *)(*((_QWORD *)v9 + 1) + 16), *(_QWORD *)(*((_QWORD *)v9 + 1) + 24), *(_QWORD *)(*((_QWORD *)v9 + 1) + 32));
    if (!result)
      break;
    v9 = apr_hash_next(v9);
    if (!v9)
      return 1;
  }
  return result;
}

apr_pool_t *__cdecl apr_hash_pool_get(const apr_hash_t *thehash)
{
  return *(apr_pool_t **)thehash;
}

uint64_t GTCoreAllocatorInit(uint64_t result)
{
  hideMemory = result & 1;
  return result;
}

uint64_t GTCoreAllocatorIsHiddingMemory()
{
  return hideMemory;
}

vm_address_t GTCoreAlloc(uint64_t a1, memory_object_size_t a2)
{
  vm_map_t *v3;
  mach_error_t memory_entry_64;
  mach_error_t v5;
  NSObject *v6;
  char *v7;
  const char *v8;
  mach_error_t v9;
  mach_error_t v10;
  char *v11;
  FILE *v12;
  kern_return_t v13;
  FILE *v15;
  _QWORD block[4];
  kern_return_t v17;
  memory_object_size_t size;
  mach_port_t object_handle;
  vm_address_t address;
  uint8_t buf[4];
  mach_error_t v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  address = 0;
  object_handle = 0;
  size = a2;
  v3 = (vm_map_t *)MEMORY[0x24BDAEC58];
  memory_entry_64 = mach_make_memory_entry_64(*MEMORY[0x24BDAEC58], &size, 0, 139267, &object_handle, 0);
  if (memory_entry_64)
  {
    v5 = memory_entry_64;
    if (!s_logUsingOsLog)
    {
      v12 = (FILE *)*MEMORY[0x24BDAC8D8];
      mach_error_string(memory_entry_64);
      fprintf(v12, "warning: failed to create memory entry error 0x%x (%s)\n");
      return 0;
    }
    v6 = gt_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = mach_error_string(v5);
      *(_DWORD *)buf = 67109378;
      v22 = v5;
      v23 = 2080;
      v24 = v7;
      v8 = "warning: failed to create memory entry error 0x%x (%s)";
LABEL_9:
      _os_log_error_impl(&dword_23C6D4000, v6, OS_LOG_TYPE_ERROR, v8, buf, 0x12u);
      return 0;
    }
    return 0;
  }
  v9 = vm_map(*v3, &address, a2, 0, 1, object_handle, 0, 0, 3, 3, 1u);
  if (v9)
  {
    v10 = v9;
    if (!s_logUsingOsLog)
    {
      v15 = (FILE *)*MEMORY[0x24BDAC8D8];
      mach_error_string(v9);
      fprintf(v15, "warning: failed to map memory error 0x%x (%s)\n");
      return 0;
    }
    v6 = gt_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11 = mach_error_string(v10);
      *(_DWORD *)buf = 67109378;
      v22 = v10;
      v23 = 2080;
      v24 = v11;
      v8 = "warning: failed to map memory error 0x%x (%s)";
      goto LABEL_9;
    }
    return 0;
  }
  if (hideMemory)
  {
    v13 = mach_memory_entry_ownership(object_handle, *v3, 4, 1);
    if (v13)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = __GTCoreAlloc_block_invoke;
      block[3] = &__block_descriptor_tmp_5;
      v17 = v13;
      if (GTCoreAlloc_onceToken != -1)
        dispatch_once(&GTCoreAlloc_onceToken, block);
    }
  }
  mach_port_deallocate(*v3, object_handle);
  return address;
}

_QWORD *GTCoreFree(_QWORD *result, uint64_t a2)
{
  _QWORD *v2;

  if (result)
  {
    v2 = result;
    result = (_QWORD *)MEMORY[0x2426236E8](*MEMORY[0x24BDAEC58], *result, a2);
    *v2 = 0;
  }
  return result;
}

apr_status_t apr_atomic_init(apr_pool_t *p)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  apr_status_t result;

  if (hash_mutex)
    return 0;
  v2 = apr_palloc(p, 0x38uLL);
  hash_mutex = (uint64_t)v2;
  v3 = (_QWORD *)*((_QWORD *)p + 5);
  if (v3)
    *((_QWORD *)p + 5) = *v3;
  else
    v3 = apr_palloc(p, 0x20uLL);
  v4 = 0;
  v3[2] = atomic_cleanup;
  v3[3] = apr_pool_cleanup_null;
  *v3 = *((_QWORD *)p + 4);
  v3[1] = v2;
  *((_QWORD *)p + 4) = v3;
  while (1)
  {
    result = apr_thread_mutex_create((apr_thread_mutex_t **)(hash_mutex + v4), 0, p);
    if (result)
      break;
    v4 += 8;
    if (v4 == 56)
      return 0;
  }
  return result;
}

uint64_t atomic_cleanup(uint64_t a1)
{
  if (hash_mutex == a1)
    hash_mutex = 0;
  return 0;
}

apr_uint32_t apr_atomic_read32(apr_uint32_t *mem)
{
  return *mem;
}

void apr_atomic_set32(apr_uint32_t *mem, apr_uint32_t val)
{
  pthread_mutex_t *v4;

  v4 = (pthread_mutex_t *)(*(_QWORD *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)mem / 0x1C) + ((unint64_t)mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v4) || (*mem = val, pthread_mutex_unlock(v4)))
    abort();
}

apr_uint32_t apr_atomic_add32(apr_uint32_t *mem, apr_uint32_t val)
{
  pthread_mutex_t *v4;
  apr_uint32_t v5;

  v4 = (pthread_mutex_t *)(*(_QWORD *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)mem / 0x1C) + ((unint64_t)mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v4) || (v5 = *mem, *mem += val, pthread_mutex_unlock(v4)))
    abort();
  return v5;
}

void apr_atomic_sub32(apr_uint32_t *mem, apr_uint32_t val)
{
  pthread_mutex_t *v4;

  v4 = (pthread_mutex_t *)(*(_QWORD *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)mem / 0x1C) + ((unint64_t)mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v4) || (*mem -= val, pthread_mutex_unlock(v4)))
    abort();
}

apr_uint32_t apr_atomic_inc32(apr_uint32_t *mem)
{
  return apr_atomic_add32(mem, 1u);
}

int apr_atomic_dec32(apr_uint32_t *mem)
{
  pthread_mutex_t *v2;
  apr_uint32_t v3;

  v2 = (pthread_mutex_t *)(*(_QWORD *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)mem / 0x1C) + ((unint64_t)mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v2) || (--*mem, v3 = *mem, pthread_mutex_unlock(v2)))
    abort();
  return v3;
}

apr_uint32_t apr_atomic_cas32(apr_uint32_t *mem, apr_uint32_t with, apr_uint32_t cmp)
{
  pthread_mutex_t *v6;
  apr_uint32_t v7;

  v6 = (pthread_mutex_t *)(*(_QWORD *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)mem / 0x1C) + ((unint64_t)mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v6))
    goto LABEL_6;
  v7 = *mem;
  if (*mem == cmp)
    *mem = with;
  if (pthread_mutex_unlock(v6))
LABEL_6:
    abort();
  return v7;
}

apr_uint32_t apr_atomic_xchg32(apr_uint32_t *mem, apr_uint32_t val)
{
  pthread_mutex_t *v4;
  apr_uint32_t v5;

  v4 = (pthread_mutex_t *)(*(_QWORD *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)mem / 0x1C) + ((unint64_t)mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v4) || (v5 = *mem, *mem = val, pthread_mutex_unlock(v4)))
    abort();
  return v5;
}

void *__cdecl apr_atomic_casptr(void **mem, void *with, const void *cmp)
{
  pthread_mutex_t *v6;
  void *v7;

  v6 = (pthread_mutex_t *)(*(_QWORD *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)*mem / 0x1C) + ((unint64_t)*mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v6))
    goto LABEL_6;
  v7 = *mem;
  if (*mem == cmp)
    *mem = with;
  if (pthread_mutex_unlock(v6))
LABEL_6:
    abort();
  return v7;
}

void *__cdecl apr_atomic_xchgptr(void **mem, void *with)
{
  pthread_mutex_t *v4;
  void *v5;

  v4 = (pthread_mutex_t *)(*(_QWORD *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)*mem / 0x1C) + ((unint64_t)*mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v4) || (v5 = *mem, *mem = with, pthread_mutex_unlock(v4)))
    abort();
  return v5;
}

void apr_pool_attribute_cleanup_destroy(apr_pool_t **a1)
{
  apr_pool_destroy(*a1);
}

void apr_pool_destroy(apr_pool_t *p)
{
  uint64_t i;
  apr_pool_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  uint64_t **v8;
  unint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  BOOL v19;
  unint64_t v20;
  unsigned int *v21;
  uint64_t *v22;

  for (i = *((_QWORD *)p + 14); i; i = *((_QWORD *)p + 14))
  {
    *((_QWORD *)p + 14) = *(_QWORD *)i;
    (*(void (**)(_QWORD))(i + 16))(*(_QWORD *)(i + 8));
  }
  *((_QWORD *)p + 14) = 0;
  while (1)
  {
    v3 = (apr_pool_t *)*((_QWORD *)p + 1);
    if (!v3)
      break;
    apr_pool_destroy(v3);
  }
  while (1)
  {
    v4 = *((_QWORD *)p + 4);
    if (!v4)
      break;
    *((_QWORD *)p + 4) = *(_QWORD *)v4;
    (*(void (**)(_QWORD))(v4 + 16))(*(_QWORD *)(v4 + 8));
  }
  free_proc_chain(*((_QWORD *)p + 7));
  if (*(_QWORD *)p)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)p + 48) + 24);
    if (v5)
      pthread_mutex_lock((pthread_mutex_t *)(v5 + 8));
    v6 = *((_QWORD *)p + 2);
    **((_QWORD **)p + 3) = v6;
    if (v6)
      *(_QWORD *)(*((_QWORD *)p + 2) + 24) = *((_QWORD *)p + 3);
    if (v5)
      pthread_mutex_unlock((pthread_mutex_t *)(v5 + 8));
  }
  v7 = (unint64_t *)*((_QWORD *)p + 6);
  v8 = (uint64_t **)*((_QWORD *)p + 12);
  *v8[1] = 0;
  if ((apr_pool_t *)v7[4] == p)
  {
    v7[3] = 0;
  }
  else
  {
    v9 = v7[3];
    if (v9)
      pthread_mutex_lock((pthread_mutex_t *)(v9 + 8));
  }
  v10 = 0;
  v11 = *v7;
  v12 = v7[1];
  v13 = v7[2];
  do
  {
    while (1)
    {
      while (1)
      {
        v14 = (uint64_t *)v8;
        v8 = (uint64_t **)*v8;
        v15 = *((unsigned int *)v14 + 4);
        if (!v12 || v13 > v15)
          break;
        *v14 = (uint64_t)v10;
        v10 = v14;
        if (!v8)
          goto LABEL_38;
      }
      if (v15 > 0x13)
        break;
      v16 = (uint64_t *)&v7[v15];
      v17 = v16[5];
      *v14 = v17;
      if (v11 < v15 && v17 == 0)
        v11 = v15;
      v16[5] = (uint64_t)v14;
      if (v13 <= v15)
      {
        v13 = 0;
        if (!v8)
          goto LABEL_38;
      }
      else
      {
        v13 += ~v15;
        if (!v8)
          goto LABEL_38;
      }
    }
    *v14 = v7[5];
    v7[5] = (unint64_t)v14;
    v19 = v13 > v15;
    v13 += ~v15;
    if (!v19)
      v13 = 0;
  }
  while (v8);
LABEL_38:
  *v7 = v11;
  v7[2] = v13;
  v20 = v7[3];
  if (v20)
    pthread_mutex_unlock((pthread_mutex_t *)(v20 + 8));
  if (v10)
  {
    v21 = (unsigned int *)MEMORY[0x24BDAEC58];
    do
    {
      v22 = (uint64_t *)*v10;
      MEMORY[0x2426236E8](*v21, v10, ((*((_DWORD *)v10 + 4) << 12) + 4096));
      v10 = v22;
    }
    while (v22);
  }
  if ((apr_pool_t *)v7[4] == p)
    apr_allocator_destroy((apr_allocator_t *)v7);
}

uint64_t free_proc_chain(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;

  if (!result)
    return result;
  v1 = result;
  v2 = result;
  do
  {
    result = apr_proc_wait(*(apr_proc_t **)v2, 0, 0, APR_NOWAIT);
    if ((_DWORD)result != 70006)
      *(_DWORD *)(v2 + 8) = 0;
    v2 = *(_QWORD *)(v2 + 16);
  }
  while (v2);
  v3 = v1;
  do
  {
    v4 = *(_DWORD *)(v3 + 8);
    if (v4 == 1)
    {
      result = apr_proc_kill(*(apr_proc_t **)v3, 9);
    }
    else if (v4 == 4 || v4 == 2)
    {
      result = apr_proc_kill(*(apr_proc_t **)v3, 15);
      if (!(_DWORD)result)
        LODWORD(v2) = 1;
    }
    v3 = *(_QWORD *)(v3 + 16);
  }
  while (v3);
  v6 = v1;
  if (!(_DWORD)v2)
    goto LABEL_29;
  v11 = xmmword_23C70D6E0;
  result = select(0, 0, 0, 0, (timeval *)&v11);
  v7 = 46875;
  while (2)
  {
    v8 = 0;
    v9 = v1;
    do
    {
      v10 = v8;
      if (*(_DWORD *)(v9 + 8) == 2)
      {
        v8 = 1;
        result = apr_proc_wait(*(apr_proc_t **)v9, 0, 0, APR_NOWAIT);
        if ((_DWORD)result == 70006)
          goto LABEL_24;
        *(_DWORD *)(v9 + 8) = 0;
      }
      v8 = v10;
LABEL_24:
      v9 = *(_QWORD *)(v9 + 16);
    }
    while (v9);
    if ((_DWORD)v8 && v7 <= 0x2DC6BF)
    {
      *(_QWORD *)&v11 = v7 / 0xF4240;
      *((_QWORD *)&v11 + 1) = v7 % 0xF4240;
      result = select(0, 0, 0, 0, (timeval *)&v11);
      v7 *= 2;
      continue;
    }
    break;
  }
  v6 = v1;
  do
  {
LABEL_29:
    if (*(_DWORD *)(v6 + 8) == 2)
      result = apr_proc_kill(*(apr_proc_t **)v6, 9);
    v6 = *(_QWORD *)(v6 + 16);
  }
  while (v6);
  do
  {
    if (*(_DWORD *)(v1 + 8))
      result = apr_proc_wait(*(apr_proc_t **)v1, 0, 0, APR_WAIT);
    v1 = *(_QWORD *)(v1 + 16);
  }
  while (v1);
  return result;
}

void apr_allocator_destroy(apr_allocator_t *allocator)
{
  uint64_t v2;
  unsigned int *v3;
  char *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;

  v2 = 0;
  v3 = (unsigned int *)MEMORY[0x24BDAEC58];
  while (1)
  {
    v4 = (char *)allocator + 8 * v2;
    v7 = (_QWORD *)*((_QWORD *)v4 + 5);
    v6 = v4 + 40;
    v5 = v7;
    if (v7)
    {
      do
      {
        *v6 = *v5;
        MEMORY[0x2426236E8](*v3);
        v5 = (_QWORD *)*v6;
      }
      while (*v6);
    }
    if (++v2 == 20)
      JUMPOUT(0x2426236E8);
  }
}

apr_status_t apr_allocator_create(apr_allocator_t **allocator)
{
  vm_address_t v2;
  vm_address_t v3;
  apr_status_t result;

  *allocator = 0;
  v2 = GTCoreAlloc((uint64_t)allocator, 0xC8uLL);
  if (!v2)
    return 12;
  v3 = v2;
  result = 0;
  *(_QWORD *)(v3 + 192) = 0;
  *(_OWORD *)(v3 + 160) = 0u;
  *(_OWORD *)(v3 + 176) = 0u;
  *(_OWORD *)(v3 + 128) = 0u;
  *(_OWORD *)(v3 + 144) = 0u;
  *(_OWORD *)(v3 + 96) = 0u;
  *(_OWORD *)(v3 + 112) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(_OWORD *)(v3 + 80) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)v3 = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *allocator = (apr_allocator_t *)v3;
  return result;
}

void apr_allocator_mutex_set(apr_allocator_t *allocator, apr_thread_mutex_t *mutex)
{
  *((_QWORD *)allocator + 3) = mutex;
}

apr_thread_mutex_t *__cdecl apr_allocator_mutex_get(apr_allocator_t *allocator)
{
  return (apr_thread_mutex_t *)*((_QWORD *)allocator + 3);
}

void apr_allocator_owner_set(apr_allocator_t *allocator, apr_pool_t *pool)
{
  *((_QWORD *)allocator + 4) = pool;
}

apr_pool_t *__cdecl apr_allocator_owner_get(apr_allocator_t *allocator)
{
  return (apr_pool_t *)*((_QWORD *)allocator + 4);
}

void apr_allocator_max_free_set(apr_allocator_t *allocator, apr_size_t size)
{
  uint64_t v4;
  apr_size_t v5;
  apr_size_t v6;

  v4 = *((_QWORD *)allocator + 3);
  if (v4)
    pthread_mutex_lock((pthread_mutex_t *)(v4 + 8));
  v5 = (size + 4095) >> 12;
  v6 = *((_QWORD *)allocator + 2) + v5 - *((_QWORD *)allocator + 1);
  *((_QWORD *)allocator + 1) = v5;
  *((_QWORD *)allocator + 2) = v6;
  if (v6 > v5)
    *((_QWORD *)allocator + 2) = v5;
  if (v4)
    pthread_mutex_unlock((pthread_mutex_t *)(v4 + 8));
}

unint64_t apr_allocator_align(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;

  v2 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  v3 = 0x2000;
  if (v2 > 0x2000)
    v3 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  if (v2 >= a2)
    return v3;
  else
    return 0;
}

vm_address_t allocator_alloc(uint64_t a1, unint64_t a2)
{
  vm_address_t v2;
  unint64_t v3;
  unint64_t v4;
  memory_object_size_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t *v15;
  _QWORD *v16;
  vm_address_t v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  vm_address_t v21;
  BOOL v22;
  unint64_t v23;
  vm_address_t v24;
  vm_address_t v25;
  _QWORD *v26;
  BOOL v28;
  unint64_t v29;
  unint64_t v30;

  v2 = 0;
  v3 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  v4 = 0x2000;
  if (v3 > 0x2000)
    v4 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  if (v3 >= a2)
    v5 = v4;
  else
    v5 = 0;
  if (v3 >= a2)
  {
    v6 = v4 >> 12;
    v7 = (v4 >> 12) - 1;
    if (HIDWORD(v7))
      return 0;
    v8 = (unint64_t *)a1;
    v9 = *(_QWORD *)a1;
    if (v7 <= *(_QWORD *)a1)
    {
      v14 = *(_QWORD *)(a1 + 24);
      if (v14)
      {
        a1 = pthread_mutex_lock((pthread_mutex_t *)(v14 + 8));
        v9 = *v8;
      }
      v15 = &v8[v7];
      v17 = v15[5];
      v16 = v15 + 5;
      v2 = v17;
      v18 = v17 == 0;
      v19 = v7 < v9;
      if (v17)
        v20 = 1;
      else
        v20 = v7 >= v9;
      if (!v20)
      {
        do
        {
          v21 = v16[1];
          ++v16;
          v2 = v21;
          v18 = v21 == 0;
          v19 = v6 < v9;
          if (v21)
            v22 = 1;
          else
            v22 = v6 >= v9;
          ++v6;
        }
        while (!v22);
      }
      if (!v18)
      {
        v25 = *(_QWORD *)v2;
        *v16 = *(_QWORD *)v2;
        if (v25)
          v19 = 1;
        if (!v19)
        {
          v26 = v16 - 1;
          do
          {
            if (*v26--)
              v28 = 1;
            else
              v28 = v9 == 1;
            --v9;
          }
          while (!v28);
          *v8 = v9;
        }
        v13 = (*(_DWORD *)(v2 + 16) + 1);
LABEL_43:
        v29 = v8[2] + v13;
        if (v29 >= v8[1])
          v29 = v8[1];
        v8[2] = v29;
        v30 = v8[3];
        if (v30)
          pthread_mutex_unlock((pthread_mutex_t *)(v30 + 8));
        goto LABEL_47;
      }
    }
    else
    {
      v2 = a1 + 40;
      if (!*(_QWORD *)(a1 + 40))
      {
LABEL_30:
        v24 = GTCoreAlloc(a1, v5);
        v2 = v24;
        if (!v24)
          return v2;
        *(_DWORD *)(v24 + 16) = v7;
        *(_QWORD *)(v24 + 32) = v24 + v5;
LABEL_47:
        *(_QWORD *)v2 = 0;
        *(_QWORD *)(v2 + 24) = v2 + 40;
        return v2;
      }
      v10 = *(_QWORD *)(a1 + 24);
      if (v10)
        a1 = pthread_mutex_lock((pthread_mutex_t *)(v10 + 8));
      while (1)
      {
        v11 = (_QWORD *)v2;
        v2 = *(_QWORD *)v2;
        if (!v2)
          break;
        v12 = *(unsigned int *)(v2 + 16);
        if (v7 <= v12)
        {
          *v11 = *(_QWORD *)v2;
          v13 = (v12 + 1);
          goto LABEL_43;
        }
      }
    }
    v23 = v8[3];
    if (v23)
      a1 = pthread_mutex_unlock((pthread_mutex_t *)(v23 + 8));
    goto LABEL_30;
  }
  return v2;
}

void apr_allocator_free(apr_allocator_t *allocator, apr_memnode_t *memnode)
{
  uint64_t v4;
  apr_memnode_t *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  apr_memnode_t *v9;
  unint64_t index;
  char *v11;
  apr_memnode_t *v12;
  BOOL v14;
  uint64_t v15;
  unsigned int *v16;
  apr_memnode_t *next;

  v4 = *((_QWORD *)allocator + 3);
  if (v4)
    pthread_mutex_lock((pthread_mutex_t *)(v4 + 8));
  v5 = 0;
  v6 = *(_QWORD *)allocator;
  v7 = *((_QWORD *)allocator + 1);
  v8 = *((_QWORD *)allocator + 2);
  do
  {
    while (1)
    {
      while (1)
      {
        v9 = memnode;
        memnode = memnode->next;
        index = v9->index;
        if (!v7 || v8 > index)
          break;
        v9->next = v5;
        v5 = v9;
        if (!memnode)
          goto LABEL_22;
      }
      if (index > 0x13)
        break;
      v11 = (char *)allocator + 8 * index;
      v12 = (apr_memnode_t *)*((_QWORD *)v11 + 5);
      v9->next = v12;
      if (v6 < index && v12 == 0)
        v6 = index;
      *((_QWORD *)v11 + 5) = v9;
      if (v8 <= index)
      {
        v8 = 0;
        if (!memnode)
          goto LABEL_22;
      }
      else
      {
        v8 += ~index;
        if (!memnode)
          goto LABEL_22;
      }
    }
    v9->next = (apr_memnode_t *)*((_QWORD *)allocator + 5);
    *((_QWORD *)allocator + 5) = v9;
    v14 = v8 > index;
    v8 += ~index;
    if (!v14)
      v8 = 0;
  }
  while (memnode);
LABEL_22:
  *(_QWORD *)allocator = v6;
  *((_QWORD *)allocator + 2) = v8;
  v15 = *((_QWORD *)allocator + 3);
  if (v15)
    pthread_mutex_unlock((pthread_mutex_t *)(v15 + 8));
  if (v5)
  {
    v16 = (unsigned int *)MEMORY[0x24BDAEC58];
    do
    {
      next = v5->next;
      MEMORY[0x2426236E8](*v16, v5, (v5->index << 12) + 4096);
      v5 = next;
    }
    while (next);
  }
}

apr_status_t apr_pool_initialize(void)
{
  uint64_t v0;
  apr_status_t v2;
  vm_address_t v4;
  apr_pool_t *v5;
  uint64_t v6;
  uint64_t v7;
  apr_thread_mutex_t *mutex;

  if ((apr_pools_shared_initialized & 1) != 0)
    return 0;
  if (apr_pools_initialized++)
    return 0;
  global_allocator = 0;
  v4 = GTCoreAlloc(v0, 0xC8uLL);
  if (v4)
  {
    *(_QWORD *)(v4 + 192) = 0;
    *(_OWORD *)(v4 + 160) = 0u;
    *(_OWORD *)(v4 + 176) = 0u;
    *(_OWORD *)(v4 + 128) = 0u;
    *(_OWORD *)(v4 + 144) = 0u;
    *(_OWORD *)(v4 + 96) = 0u;
    *(_OWORD *)(v4 + 112) = 0u;
    *(_OWORD *)(v4 + 64) = 0u;
    *(_OWORD *)(v4 + 80) = 0u;
    *(_OWORD *)(v4 + 32) = 0u;
    *(_OWORD *)(v4 + 48) = 0u;
    *(_OWORD *)v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    global_allocator = v4;
    apr_allocator_max_free_set((apr_allocator_t *)v4, 0x8000000uLL);
    if (apr_pool_create_ex((apr_pool_t **)&global_pool, 0, 0, (apr_allocator_t *)global_allocator))
      apr_allocator_destroy((apr_allocator_t *)global_allocator);
    v5 = (apr_pool_t *)global_pool;
    *(_QWORD *)(global_pool + 80) = "apr_global_pool";
    v2 = apr_atomic_init(v5);
    if (!v2)
    {
      mutex = 0;
      v2 = apr_thread_mutex_create(&mutex, 0, (apr_pool_t *)global_pool);
      if (!v2)
      {
        v6 = global_allocator;
        v7 = global_pool;
        *(_QWORD *)(global_allocator + 24) = mutex;
        *(_QWORD *)(v6 + 32) = v7;
      }
    }
  }
  else
  {
    apr_pools_initialized = 0;
    return 12;
  }
  return v2;
}

apr_status_t apr_pool_create_ex(apr_pool_t **newpool, apr_pool_t *parent, apr_abortfunc_t abort_fn, apr_allocator_t *allocator)
{
  apr_allocator_t *v4;
  apr_abortfunc_t v5;
  apr_pool_t *v7;
  apr_pool_t *v8;
  apr_pool_t **v9;
  uint64_t v10;
  apr_pool_t *v11;
  apr_pool_t ***v12;
  apr_pool_t *v13;
  apr_status_t v14;

  v4 = allocator;
  v5 = abort_fn;
  *newpool = 0;
  if (parent)
    v7 = parent;
  else
    v7 = (apr_pool_t *)global_pool;
  if (!abort_fn && v7)
    v5 = (apr_abortfunc_t)*((_QWORD *)v7 + 8);
  if (!allocator)
    v4 = (apr_allocator_t *)*((_QWORD *)v7 + 6);
  v8 = (apr_pool_t *)allocator_alloc((uint64_t)v4, 0x1FD8uLL);
  if (v8)
  {
    *(_QWORD *)v8 = v8;
    *((_QWORD *)v8 + 1) = v8;
    v9 = (apr_pool_t **)*((_QWORD *)v8 + 3);
    *((_QWORD *)v8 + 3) = v9 + 15;
    v9[12] = v8;
    v9[13] = (apr_pool_t *)(v9 + 15);
    v9[14] = 0;
    v9[6] = v4;
    v9[7] = 0;
    v9[4] = 0;
    v9[5] = 0;
    v9[10] = 0;
    v9[11] = v8;
    v9[8] = (apr_pool_t *)v5;
    v9[9] = 0;
    *v9 = v7;
    v9[1] = 0;
    if (v7)
    {
      v10 = *(_QWORD *)(*((_QWORD *)v7 + 6) + 24);
      if (v10)
        pthread_mutex_lock((pthread_mutex_t *)(v10 + 8));
      v13 = (apr_pool_t *)*((_QWORD *)v7 + 1);
      v12 = (apr_pool_t ***)((char *)v7 + 8);
      v11 = v13;
      v9[2] = v13;
      if (v13)
        *((_QWORD *)v11 + 3) = v9 + 2;
      *v12 = v9;
      v9[3] = (apr_pool_t *)v12;
      if (v10)
        pthread_mutex_unlock((pthread_mutex_t *)(v10 + 8));
    }
    else
    {
      v9[2] = 0;
      v9[3] = 0;
    }
    v14 = 0;
    *newpool = (apr_pool_t *)v9;
  }
  else
  {
    v14 = 12;
    if (v5)
      ((void (*)(uint64_t))v5)(12);
  }
  return v14;
}

void apr_pool_tag(apr_pool_t *pool, const char *tag)
{
  *((_QWORD *)pool + 10) = tag;
}

uint64_t apr_pool_shared_initialize(uint64_t a1)
{
  apr_pools_initialized = 1;
  apr_pools_shared_initialized = 1;
  global_pool = a1;
  global_allocator = *(_QWORD *)(a1 + 48);
  return 0;
}

void apr_pool_terminate(void)
{
  if ((apr_pools_shared_initialized & 1) == 0 && apr_pools_initialized && !--apr_pools_initialized)
  {
    apr_pool_destroy((apr_pool_t *)global_pool);
    global_pool = 0;
    global_allocator = 0;
  }
}

void *__cdecl apr_palloc(apr_pool_t *p, apr_size_t size)
{
  apr_size_t v3;
  void (*v4)(uint64_t);
  void *result;
  vm_address_t *v6;
  vm_address_t v7;
  vm_address_t *v8;
  unint64_t v9;
  vm_address_t v10;
  vm_address_t **v11;

  v3 = (size + 7) & 0xFFFFFFFFFFFFFFF8;
  if (v3 < size)
  {
LABEL_2:
    v4 = (void (*)(uint64_t))*((_QWORD *)p + 8);
    if (v4)
      v4(12);
    return 0;
  }
  v6 = (vm_address_t *)*((_QWORD *)p + 11);
  result = (void *)v6[3];
  if (v3 <= v6[4] - (unint64_t)result)
  {
    v6[3] = (vm_address_t)result + v3;
    return result;
  }
  v7 = *v6;
  if (v3 <= *(_QWORD *)(*v6 + 32) - *(_QWORD *)(*v6 + 24))
  {
    **(_QWORD **)(v7 + 8) = *(_QWORD *)v7;
    *(_QWORD *)(*(_QWORD *)v7 + 8) = *(_QWORD *)(v7 + 8);
  }
  else
  {
    v7 = allocator_alloc(*((_QWORD *)p + 6), (size + 7) & 0xFFFFFFFFFFFFFFF8);
    if (!v7)
      goto LABEL_2;
  }
  *(_DWORD *)(v7 + 20) = 0;
  result = *(void **)(v7 + 24);
  *(_QWORD *)(v7 + 24) = (char *)result + v3;
  v8 = (vm_address_t *)v6[1];
  *(_QWORD *)(v7 + 8) = v8;
  *v8 = v7;
  *(_QWORD *)v7 = v6;
  v6[1] = v7;
  *((_QWORD *)p + 11) = v7;
  v9 = (uint64_t)(v6[4] - v6[3]) >> 12;
  *((_DWORD *)v6 + 5) = v9;
  if (v9 < *(unsigned int *)(*v6 + 20))
  {
    v10 = *v6;
    do
      v10 = *(_QWORD *)v10;
    while (*(_DWORD *)(v10 + 20) > v9);
    *(_QWORD *)v7 = *v6;
    *(_QWORD *)(*v6 + 8) = v6[1];
    v11 = *(vm_address_t ***)(v10 + 8);
    v6[1] = (vm_address_t)v11;
    *v11 = v6;
    *v6 = v10;
    *(_QWORD *)(v10 + 8) = v6;
  }
  return result;
}

void *apr_pcalloc(apr_pool_t *a1, apr_size_t a2)
{
  void *v3;
  void *v4;

  v3 = apr_palloc(a1, a2);
  v4 = v3;
  if (v3)
    bzero(v3, a2);
  return v4;
}

void apr_pool_clear(apr_pool_t *p)
{
  uint64_t i;
  apr_pool_t *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  BOOL v20;
  unint64_t v21;
  unsigned int *v22;
  unint64_t *v23;

  for (i = *((_QWORD *)p + 14); i; i = *((_QWORD *)p + 14))
  {
    *((_QWORD *)p + 14) = *(_QWORD *)i;
    (*(void (**)(_QWORD))(i + 16))(*(_QWORD *)(i + 8));
  }
  *((_QWORD *)p + 14) = 0;
  while (1)
  {
    v3 = (apr_pool_t *)*((_QWORD *)p + 1);
    if (!v3)
      break;
    apr_pool_destroy(v3);
  }
  v5 = (uint64_t *)((char *)p + 32);
  v4 = *((_QWORD *)p + 4);
  if (v4)
  {
    do
    {
      *v5 = *(_QWORD *)v4;
      (*(void (**)(_QWORD))(v4 + 16))(*(_QWORD *)(v4 + 8));
      v4 = *v5;
    }
    while (*v5);
  }
  *v5 = 0;
  *((_QWORD *)p + 5) = 0;
  free_proc_chain(*((_QWORD *)p + 7));
  *((_QWORD *)p + 7) = 0;
  *((_QWORD *)p + 9) = 0;
  v7 = *((_QWORD *)p + 12);
  v6 = *((_QWORD *)p + 13);
  *((_QWORD *)p + 11) = v7;
  *(_QWORD *)(v7 + 24) = v6;
  if (*(_QWORD *)v7 != v7)
  {
    **(_QWORD **)(v7 + 8) = 0;
    v8 = (unint64_t *)*((_QWORD *)p + 6);
    v9 = *(unint64_t **)v7;
    v10 = v8[3];
    if (v10)
      pthread_mutex_lock((pthread_mutex_t *)(v10 + 8));
    v11 = 0;
    v12 = *v8;
    v13 = v8[1];
    v14 = v8[2];
    do
    {
      while (1)
      {
        while (1)
        {
          v15 = v9;
          v9 = (unint64_t *)*v9;
          v16 = *((unsigned int *)v15 + 4);
          if (!v13 || v14 > v16)
            break;
          *v15 = (unint64_t)v11;
          v11 = v15;
          if (!v9)
            goto LABEL_30;
        }
        if (v16 > 0x13)
          break;
        v17 = &v8[v16];
        v18 = v17[5];
        *v15 = v18;
        if (v12 < v16 && v18 == 0)
          v12 = v16;
        v17[5] = (unint64_t)v15;
        if (v14 <= v16)
        {
          v14 = 0;
          if (!v9)
            goto LABEL_30;
        }
        else
        {
          v14 += ~v16;
          if (!v9)
            goto LABEL_30;
        }
      }
      *v15 = v8[5];
      v8[5] = (unint64_t)v15;
      v20 = v14 > v16;
      v14 += ~v16;
      if (!v20)
        v14 = 0;
    }
    while (v9);
LABEL_30:
    *v8 = v12;
    v8[2] = v14;
    v21 = v8[3];
    if (v21)
      pthread_mutex_unlock((pthread_mutex_t *)(v21 + 8));
    if (v11)
    {
      v22 = (unsigned int *)MEMORY[0x24BDAEC58];
      do
      {
        v23 = (_QWORD *)*v11;
        MEMORY[0x2426236E8](*v22, v11, ((*((_DWORD *)v11 + 4) << 12) + 4096));
        v11 = v23;
      }
      while (v23);
    }
    *(_QWORD *)v7 = v7;
    *(_QWORD *)(v7 + 8) = v7;
  }
}

apr_status_t apr_pool_create_unmanaged_ex(apr_pool_t **newpool, apr_abortfunc_t abort_fn, apr_allocator_t *allocator)
{
  apr_allocator_t *v6;
  vm_address_t v7;
  _QWORD *v8;
  uint64_t v9;
  apr_status_t v10;

  *newpool = 0;
  if (!apr_pools_initialized)
    return 20002;
  v6 = allocator;
  if (!allocator)
  {
    v7 = GTCoreAlloc((uint64_t)newpool, 0xC8uLL);
    if (!v7)
      goto LABEL_10;
    v6 = (apr_allocator_t *)v7;
    *(_QWORD *)(v7 + 192) = 0;
    *(_OWORD *)(v7 + 160) = 0u;
    *(_OWORD *)(v7 + 176) = 0u;
    *(_OWORD *)(v7 + 128) = 0u;
    *(_OWORD *)(v7 + 144) = 0u;
    *(_OWORD *)(v7 + 96) = 0u;
    *(_OWORD *)(v7 + 112) = 0u;
    *(_OWORD *)(v7 + 64) = 0u;
    *(_OWORD *)(v7 + 80) = 0u;
    *(_OWORD *)(v7 + 32) = 0u;
    *(_OWORD *)(v7 + 48) = 0u;
    *(_OWORD *)v7 = 0u;
    *(_OWORD *)(v7 + 16) = 0u;
  }
  v8 = (_QWORD *)allocator_alloc((uint64_t)v6, 0x1FD8uLL);
  if (v8)
  {
    *v8 = v8;
    v8[1] = v8;
    v9 = v8[3];
    v8[3] = v9 + 120;
    *(_QWORD *)(v9 + 96) = v8;
    *(_QWORD *)(v9 + 104) = v9 + 120;
    *(_QWORD *)(v9 + 112) = 0;
    *(_QWORD *)(v9 + 48) = v6;
    *(_QWORD *)(v9 + 56) = 0;
    *(_OWORD *)v9 = 0u;
    *(_OWORD *)(v9 + 16) = 0u;
    *(_OWORD *)(v9 + 32) = 0u;
    *(_QWORD *)(v9 + 80) = 0;
    *(_QWORD *)(v9 + 88) = v8;
    *(_QWORD *)(v9 + 64) = abort_fn;
    *(_QWORD *)(v9 + 72) = 0;
    if (!allocator)
      *((_QWORD *)v6 + 4) = v9;
    v10 = 0;
    *newpool = (apr_pool_t *)v9;
    return v10;
  }
LABEL_10:
  v10 = 12;
  if (abort_fn)
    ((void (*)(uint64_t))abort_fn)(12);
  return v10;
}

char *__cdecl apr_pvsprintf(apr_pool_t *p, const char *fmt, va_list ap)
{
  char *v6;
  char *v7;
  char *v8;
  unint64_t *v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  BOOL v21;
  unint64_t v22;
  unsigned int *v23;
  unint64_t *v24;
  uint64_t *v25;
  _QWORD *v26;
  _QWORD *v27;
  unint64_t v28;
  uint64_t *v29;
  _QWORD *v30;
  void (*v31)(_QWORD);
  unint64_t *v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t *v39;
  unint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  unint64_t v44;
  unsigned int *v45;
  unint64_t *v46;
  apr_vformatter_buff_t v48;
  uint64_t v49;
  apr_pool_t *v50;
  uint64_t v51;
  unint64_t *v52;

  v51 = 0;
  v52 = 0;
  v49 = *((_QWORD *)p + 11);
  v50 = p;
  v6 = *(char **)(v49 + 32);
  v48.curpos = *(char **)(v49 + 24);
  v48.endpos = v6 - 1;
  if (v48.curpos == v6 && psprintf_flush((uint64_t)&v48) == -1
    || apr_vformatter((int (__cdecl *)(apr_vformatter_buff_t *))psprintf_flush, &v48, fmt, ap) == -1)
  {
    v31 = (void (*)(_QWORD))*((_QWORD *)p + 8);
    if (v31)
      v31(12);
    if ((_BYTE)v51)
    {
      v32 = (unint64_t *)v49;
      *(_QWORD *)v49 = v52;
      v33 = (unint64_t *)*((_QWORD *)p + 6);
      v34 = v33[3];
      if (v34)
        pthread_mutex_lock((pthread_mutex_t *)(v34 + 8));
      v35 = 0;
      v36 = *v33;
      v37 = v33[1];
      v38 = v33[2];
      do
      {
        while (1)
        {
          while (1)
          {
            v39 = v32;
            v32 = (unint64_t *)*v32;
            v40 = *((unsigned int *)v39 + 4);
            if (!v37 || v38 > v40)
              break;
            *v39 = (unint64_t)v35;
            v35 = v39;
            if (!v32)
              goto LABEL_60;
          }
          if (v40 > 0x13)
            break;
          v41 = &v33[v40];
          v42 = v41[5];
          *v39 = v42;
          if (v36 < v40 && v42 == 0)
            v36 = v40;
          v41[5] = (unint64_t)v39;
          if (v38 <= v40)
          {
            v38 = 0;
            if (!v32)
              goto LABEL_60;
          }
          else
          {
            v38 += ~v40;
            if (!v32)
              goto LABEL_60;
          }
        }
        *v39 = v33[5];
        v33[5] = (unint64_t)v39;
        v21 = v38 > v40;
        v38 += ~v40;
        if (!v21)
          v38 = 0;
      }
      while (v32);
LABEL_60:
      *v33 = v36;
      v33[2] = v38;
      v44 = v33[3];
      if (v44)
        pthread_mutex_unlock((pthread_mutex_t *)(v44 + 8));
      if (v35)
      {
        v45 = (unsigned int *)MEMORY[0x24BDAEC58];
        do
        {
          v46 = (_QWORD *)*v35;
          MEMORY[0x2426236E8](*v45, v35, ((*((_DWORD *)v35 + 4) << 12) + 4096));
          v35 = v46;
        }
        while (v46);
      }
    }
    return 0;
  }
  else
  {
    v7 = v48.curpos++;
    *v7 = 0;
    v8 = *(char **)(v49 + 24);
    *(_QWORD *)(v49 + 24) = &v8[(v48.curpos - v8 + 7) & 0xFFFFFFFFFFFFFFF8];
    v9 = v52;
    if (v52)
    {
      v10 = (unint64_t *)*((_QWORD *)p + 6);
      v11 = v10[3];
      if (v11)
        pthread_mutex_lock((pthread_mutex_t *)(v11 + 8));
      v12 = 0;
      v13 = *v10;
      v14 = v10[1];
      v15 = v10[2];
      do
      {
        while (1)
        {
          while (1)
          {
            v16 = v9;
            v9 = (unint64_t *)*v9;
            v17 = *((unsigned int *)v16 + 4);
            if (!v14 || v15 > v17)
              break;
            *v16 = (unint64_t)v12;
            v12 = v16;
            if (!v9)
              goto LABEL_26;
          }
          if (v17 > 0x13)
            break;
          v18 = &v10[v17];
          v19 = v18[5];
          *v16 = v19;
          if (v13 < v17 && v19 == 0)
            v13 = v17;
          v18[5] = (unint64_t)v16;
          if (v15 <= v17)
          {
            v15 = 0;
            if (!v9)
              goto LABEL_26;
          }
          else
          {
            v15 += ~v17;
            if (!v9)
              goto LABEL_26;
          }
        }
        *v16 = v10[5];
        v10[5] = (unint64_t)v16;
        v21 = v15 > v17;
        v15 += ~v17;
        if (!v21)
          v15 = 0;
      }
      while (v9);
LABEL_26:
      *v10 = v13;
      v10[2] = v15;
      v22 = v10[3];
      if (v22)
        pthread_mutex_unlock((pthread_mutex_t *)(v22 + 8));
      if (v12)
      {
        v23 = (unsigned int *)MEMORY[0x24BDAEC58];
        do
        {
          v24 = (_QWORD *)*v12;
          MEMORY[0x2426236E8](*v23, v12, ((*((_DWORD *)v12 + 4) << 12) + 4096));
          v12 = v24;
        }
        while (v24);
      }
    }
    if ((_BYTE)v51)
    {
      v25 = (uint64_t *)*((_QWORD *)p + 11);
      v26 = (_QWORD *)v49;
      *(_DWORD *)(v49 + 20) = 0;
      v27 = (_QWORD *)v25[1];
      v26[1] = v27;
      *v27 = v26;
      *v26 = v25;
      v25[1] = (uint64_t)v26;
      *((_QWORD *)p + 11) = v26;
      v28 = (v25[4] - v25[3]) >> 12;
      *((_DWORD *)v25 + 5) = v28;
      if (v28 < *(unsigned int *)(*v25 + 20))
      {
        v29 = (uint64_t *)*v25;
        do
          v29 = (uint64_t *)*v29;
        while (*((_DWORD *)v29 + 5) > v28);
        *v26 = *v25;
        *(_QWORD *)(*v25 + 8) = v25[1];
        v30 = (_QWORD *)v29[1];
        v25[1] = (uint64_t)v30;
        *v30 = v25;
        *v25 = (uint64_t)v29;
        v29[1] = (uint64_t)v25;
      }
    }
  }
  return v8;
}

uint64_t psprintf_flush(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  size_t v4;
  unint64_t v5;
  vm_address_t v6;
  vm_address_t v7;
  uint64_t result;
  uint64_t v9;
  vm_address_t *v10;
  unint64_t v11;
  vm_address_t v12;
  _QWORD *v13;

  v3 = *(_QWORD *)(a1 + 16);
  v2 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)a1 - *(_QWORD *)(v3 + 24);
  if (2 * v4 <= 0x20)
    v5 = 32;
  else
    v5 = 2 * v4;
  if (!*(_BYTE *)(a1 + 32))
  {
    v6 = *(_QWORD *)v3;
    if (v5 <= *(_QWORD *)(*(_QWORD *)v3 + 32) - *(_QWORD *)(*(_QWORD *)v3 + 24))
    {
      **(_QWORD **)(v6 + 8) = *(_QWORD *)v6;
      *(_QWORD *)(*(_QWORD *)v6 + 8) = *(_QWORD *)(v6 + 8);
      v10 = *(vm_address_t **)(v3 + 8);
      *(_QWORD *)(v6 + 8) = v10;
      *v10 = v6;
      *(_QWORD *)v6 = v3;
      *(_QWORD *)(v3 + 8) = v6;
      *(_DWORD *)(v6 + 20) = 0;
      *(_QWORD *)(v2 + 88) = v6;
      v11 = (uint64_t)(*(_QWORD *)(v3 + 32) - *(_QWORD *)(v3 + 24)) >> 12;
      *(_DWORD *)(v3 + 20) = v11;
      if (v11 < *(unsigned int *)(*(_QWORD *)v3 + 20))
      {
        v12 = *(_QWORD *)v3;
        do
          v12 = *(_QWORD *)v12;
        while (*(_DWORD *)(v12 + 20) > v11);
        *(_QWORD *)v6 = *(_QWORD *)v3;
        *(_QWORD *)(*(_QWORD *)v3 + 8) = *(_QWORD *)(v3 + 8);
        v13 = *(_QWORD **)(v12 + 8);
        *(_QWORD *)(v3 + 8) = v13;
        *v13 = v3;
        *(_QWORD *)v3 = v12;
        *(_QWORD *)(v12 + 8) = v3;
        v6 = *(_QWORD *)(v2 + 88);
      }
      goto LABEL_10;
    }
  }
  v7 = allocator_alloc(*(_QWORD *)(v2 + 48), v5);
  if (v7)
  {
    v6 = v7;
    if (*(_BYTE *)(a1 + 32))
    {
      *(_QWORD *)v3 = *(_QWORD *)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v3;
    }
    *(_BYTE *)(a1 + 32) = 1;
LABEL_10:
    memcpy(*(void **)(v6 + 24), *(const void **)(v3 + 24), v4);
    result = 0;
    *(_QWORD *)(a1 + 16) = v6;
    v9 = *(_QWORD *)(v6 + 32) - 1;
    *(_QWORD *)a1 = *(_QWORD *)(v6 + 24) + v4;
    *(_QWORD *)(a1 + 8) = v9;
    return result;
  }
  return 0xFFFFFFFFLL;
}

char *apr_psprintf(apr_pool_t *p, const char *fmt, ...)
{
  va_list va;

  va_start(va, fmt);
  return apr_pvsprintf(p, fmt, va);
}

void apr_pool_abort_set(apr_abortfunc_t abortfunc, apr_pool_t *pool)
{
  *((_QWORD *)pool + 8) = abortfunc;
}

apr_abortfunc_t apr_pool_abort_get(apr_pool_t *pool)
{
  return (apr_abortfunc_t)*((_QWORD *)pool + 8);
}

apr_pool_t *__cdecl apr_pool_parent_get(apr_pool_t *pool)
{
  return *(apr_pool_t **)pool;
}

apr_allocator_t *__cdecl apr_pool_allocator_get(apr_pool_t *pool)
{
  return (apr_allocator_t *)*((_QWORD *)pool + 6);
}

int apr_pool_is_ancestor(apr_pool_t *a, apr_pool_t *b)
{
  if (a)
  {
    if (!b)
      return 0;
    while (b != a)
    {
      b = *(apr_pool_t **)b;
      if (!b)
        return 0;
    }
  }
  return 1;
}

apr_status_t apr_pool_userdata_set(const void *data, const char *key, apr_status_t (__cdecl *cleanup)(void *), apr_pool_t *pool)
{
  apr_hash_t *v8;
  uint64_t v9;
  apr_hash_t *v10;
  const char *v11;
  apr_size_t v12;
  void *v13;
  _QWORD *v14;

  v8 = (apr_hash_t *)*((_QWORD *)pool + 9);
  if (!v8)
  {
    v8 = apr_hash_make(pool);
    *((_QWORD *)pool + 9) = v8;
  }
  v9 = *find_entry((uint64_t)v8, key, 0xFFFFFFFFFFFFFFFFLL, 0);
  if (v9 && *(_QWORD *)(v9 + 32))
  {
    v10 = (apr_hash_t *)*((_QWORD *)pool + 9);
    v11 = key;
  }
  else
  {
    v12 = strlen(key) + 1;
    v13 = apr_palloc(pool, v12);
    memcpy(v13, key, v12);
    v10 = (apr_hash_t *)*((_QWORD *)pool + 9);
    v11 = (const char *)v13;
  }
  apr_hash_set(v10, v11, -1, data);
  if (cleanup)
  {
    v14 = (_QWORD *)*((_QWORD *)pool + 5);
    if (v14)
      *((_QWORD *)pool + 5) = *v14;
    else
      v14 = apr_palloc(pool, 0x20uLL);
    v14[2] = cleanup;
    v14[3] = cleanup;
    *v14 = *((_QWORD *)pool + 4);
    v14[1] = data;
    *((_QWORD *)pool + 4) = v14;
  }
  return 0;
}

void apr_pool_cleanup_register(apr_pool_t *p, const void *data, apr_status_t (__cdecl *plain_cleanup)(void *), apr_status_t (__cdecl *child_cleanup)(void *))
{
  _QWORD *v8;

  if (p)
  {
    v8 = (_QWORD *)*((_QWORD *)p + 5);
    if (v8)
      *((_QWORD *)p + 5) = *v8;
    else
      v8 = apr_palloc(p, 0x20uLL);
    v8[2] = plain_cleanup;
    v8[3] = child_cleanup;
    *v8 = *((_QWORD *)p + 4);
    v8[1] = data;
    *((_QWORD *)p + 4) = v8;
  }
}

apr_status_t apr_pool_userdata_setn(const void *data, const char *key, apr_status_t (__cdecl *cleanup)(void *), apr_pool_t *pool)
{
  apr_hash_t *v8;
  _QWORD *v9;

  v8 = (apr_hash_t *)*((_QWORD *)pool + 9);
  if (!v8)
  {
    v8 = apr_hash_make(pool);
    *((_QWORD *)pool + 9) = v8;
  }
  apr_hash_set(v8, key, -1, data);
  if (cleanup)
  {
    v9 = (_QWORD *)*((_QWORD *)pool + 5);
    if (v9)
      *((_QWORD *)pool + 5) = *v9;
    else
      v9 = apr_palloc(pool, 0x20uLL);
    v9[2] = cleanup;
    v9[3] = cleanup;
    *v9 = *((_QWORD *)pool + 4);
    v9[1] = data;
    *((_QWORD *)pool + 4) = v9;
  }
  return 0;
}

apr_status_t apr_pool_userdata_get(void **data, const char *key, apr_pool_t *pool)
{
  uint64_t v4;
  _QWORD *v5;

  v4 = *((_QWORD *)pool + 9);
  if (v4)
  {
    v5 = (_QWORD *)*find_entry(v4, key, 0xFFFFFFFFFFFFFFFFLL, 0);
    if (v5)
      v5 = (_QWORD *)v5[4];
  }
  else
  {
    v5 = 0;
  }
  *data = v5;
  return 0;
}

void apr_pool_pre_cleanup_register(apr_pool_t *p, const void *data, apr_status_t (__cdecl *plain_cleanup)(void *))
{
  _QWORD *v6;

  if (p)
  {
    v6 = (_QWORD *)*((_QWORD *)p + 5);
    if (v6)
      *((_QWORD *)p + 5) = *v6;
    else
      v6 = apr_palloc(p, 0x20uLL);
    v6[2] = plain_cleanup;
    *v6 = *((_QWORD *)p + 14);
    v6[1] = data;
    *((_QWORD *)p + 14) = v6;
  }
}

void apr_pool_cleanup_kill(apr_pool_t *p, const void *data, apr_status_t (__cdecl *cleanup)(void *))
{
  _QWORD *v3;
  uint64_t *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t *v7;
  _QWORD *v8;

  if (p)
  {
    v3 = (_QWORD *)((char *)p + 32);
    v4 = (uint64_t *)*((_QWORD *)p + 4);
    if (v4)
    {
      while (1)
      {
        v5 = v4;
        if ((const void *)v4[1] == data && (apr_status_t (__cdecl *)(void *))v4[2] == cleanup)
          break;
        v4 = (uint64_t *)*v4;
        v3 = v5;
        if (!*v5)
          goto LABEL_8;
      }
      *v3 = *v4;
      *v4 = *((_QWORD *)p + 5);
      *((_QWORD *)p + 5) = v4;
    }
LABEL_8:
    v6 = (_QWORD *)((char *)p + 112);
    v7 = (uint64_t *)*((_QWORD *)p + 14);
    if (v7)
    {
      while (1)
      {
        v8 = v7;
        if ((const void *)v7[1] == data && (apr_status_t (__cdecl *)(void *))v7[2] == cleanup)
          break;
        v7 = (uint64_t *)*v7;
        v6 = v8;
        if (!*v8)
          return;
      }
      *v6 = *v7;
      *v7 = *((_QWORD *)p + 5);
      *((_QWORD *)p + 5) = v7;
    }
  }
}

void apr_pool_child_cleanup_set(apr_pool_t *p, const void *data, apr_status_t (__cdecl *plain_cleanup)(void *), apr_status_t (__cdecl *child_cleanup)(void *))
{
  uint64_t **v4;

  if (p)
  {
    v4 = (uint64_t **)*((_QWORD *)p + 4);
    if (v4)
    {
      while (v4[1] != data || v4[2] != (uint64_t *)plain_cleanup)
      {
        v4 = (uint64_t **)*v4;
        if (!v4)
          return;
      }
      v4[3] = (uint64_t *)child_cleanup;
    }
  }
}

apr_status_t apr_pool_cleanup_run(apr_pool_t *p, void *data, apr_status_t (__cdecl *cleanup)(void *))
{
  apr_pool_cleanup_kill(p, data, cleanup);
  return ((uint64_t (*)(void *))cleanup)(data);
}

void apr_pool_cleanup_for_exec(void)
{
  cleanup_pool_for_exec(global_pool);
}

uint64_t cleanup_pool_for_exec(uint64_t result)
{
  uint64_t v1;
  uint64_t i;
  uint64_t j;

  v1 = result;
  for (i = *(_QWORD *)(result + 32); i; i = *(_QWORD *)(v1 + 32))
  {
    *(_QWORD *)(v1 + 32) = *(_QWORD *)i;
    result = (*(uint64_t (**)(_QWORD))(i + 24))(*(_QWORD *)(i + 8));
  }
  for (j = *(_QWORD *)(v1 + 8); j; j = *(_QWORD *)(j + 16))
    result = cleanup_pool_for_exec(j);
  return result;
}

apr_status_t apr_pool_cleanup_null(void *data)
{
  return 0;
}

void apr_pool_note_subprocess(apr_pool_t *a, apr_proc_t *proc, apr_kill_conditions_e how)
{
  _DWORD *v6;

  v6 = apr_palloc(a, 0x18uLL);
  *(_QWORD *)v6 = proc;
  v6[2] = how;
  *((_QWORD *)v6 + 2) = *((_QWORD *)a + 7);
  *((_QWORD *)a + 7) = v6;
}

void *__cdecl apr_pcalloc_debug(apr_pool_t *p, apr_size_t size, const char *file_line)
{
  void *v4;
  void *v5;

  v4 = apr_palloc(p, size);
  v5 = v4;
  if (v4)
    bzero(v4, size);
  return v5;
}

apr_status_t apr_procattr_create(apr_procattr_t **new_attr, apr_pool_t *cont)
{
  char *v4;
  char *v5;
  apr_status_t result;
  apr_procattr_t *v7;

  v4 = (char *)apr_palloc(cont, 0x88uLL);
  if (v4)
  {
    v5 = v4;
    result = 0;
    *(_OWORD *)(v5 + 120) = 0u;
    *(_OWORD *)(v5 + 104) = 0u;
    *(_OWORD *)(v5 + 88) = 0u;
    *(_OWORD *)(v5 + 72) = 0u;
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    *(_OWORD *)(v5 + 24) = 0u;
    *(_OWORD *)(v5 + 8) = 0u;
    *new_attr = (apr_procattr_t *)v5;
    *(_QWORD *)v5 = cont;
    v7 = *new_attr;
    *((_DWORD *)v7 + 16) = 1;
    *(_QWORD *)((char *)v7 + 116) = -1;
  }
  else
  {
    *new_attr = 0;
    return 12;
  }
  return result;
}

apr_status_t apr_procattr_io_set(apr_procattr_t *attr, apr_int32_t in, apr_int32_t out, apr_int32_t err)
{
  return 0;
}

apr_status_t apr_procattr_child_in_set(apr_procattr_t *attr, apr_file_t *child_in, apr_file_t *parent_in)
{
  return 0;
}

apr_status_t apr_procattr_child_out_set(apr_procattr_t *attr, apr_file_t *child_out, apr_file_t *parent_out)
{
  return 0;
}

apr_status_t apr_procattr_child_err_set(apr_procattr_t *attr, apr_file_t *child_err, apr_file_t *parent_err)
{
  return 0;
}

apr_status_t apr_procattr_dir_set(apr_procattr_t *attr, const char *dir)
{
  char *v3;

  v3 = apr_pstrdup(*(apr_pool_t **)attr, dir);
  *((_QWORD *)attr + 7) = v3;
  if (v3)
    return 0;
  else
    return 12;
}

apr_status_t apr_procattr_cmdtype_set(apr_procattr_t *attr, apr_cmdtype_e cmd)
{
  *((_DWORD *)attr + 16) = cmd;
  return 0;
}

apr_status_t apr_procattr_detach_set(apr_procattr_t *attr, apr_int32_t detach)
{
  *((_DWORD *)attr + 17) = detach;
  return 0;
}

apr_status_t apr_proc_fork(apr_proc_t *proc, apr_pool_t *cont)
{
  pid_t v3;
  apr_status_t v4;

  *(_OWORD *)&proc->pid = 0u;
  *(_OWORD *)&proc->out = 0u;
  v3 = fork();
  if (v3 < 0)
    return *__error();
  v4 = 70001;
  if (v3)
  {
    proc->pid = v3;
    return 70002;
  }
  else
  {
    proc->pid = getpid();
    apr_random_after_fork(proc);
  }
  return v4;
}

apr_status_t apr_procattr_child_errfn_set(apr_procattr_t *attr, apr_child_errfn_t *errfn)
{
  *((_QWORD *)attr + 13) = errfn;
  return 0;
}

apr_status_t apr_procattr_error_check_set(apr_procattr_t *attr, apr_int32_t chk)
{
  *((_DWORD *)attr + 28) = chk;
  return 0;
}

apr_status_t apr_procattr_addrspace_set(apr_procattr_t *attr, apr_int32_t addrspace)
{
  return 0;
}

apr_status_t apr_procattr_user_set(apr_procattr_t *attr, const char *username, const char *password)
{
  return 0;
}

apr_status_t apr_procattr_group_set(apr_procattr_t *attr, const char *groupname)
{
  return 0;
}

apr_status_t apr_proc_create(apr_proc_t *new_proc, const char *progname, const char *const *args, const char *const *env, apr_procattr_t *attr, apr_pool_t *pool)
{
  return 0;
}

apr_status_t apr_proc_wait_all_procs(apr_proc_t *proc, int *exitcode, apr_exit_why_e *exitwhy, apr_wait_how_e waithow, apr_pool_t *p)
{
  proc->pid = -1;
  return apr_proc_wait(proc, exitcode, exitwhy, waithow);
}

apr_status_t apr_proc_wait(apr_proc_t *proc, int *exitcode, apr_exit_why_e *exitwhy, apr_wait_how_e waithow)
{
  int v7;
  pid_t v8;
  apr_status_t result;
  pid_t v10;
  unsigned __int8 v11;
  int v12;
  apr_exit_why_e v13;
  int v14;

  v14 = 0;
  if (waithow)
    v7 = 3;
  else
    v7 = 2;
  while (1)
  {
    v8 = waitpid(proc->pid, &v14, v7);
    if ((v8 & 0x80000000) == 0)
      break;
    if (*__error() != 4)
      return *__error();
  }
  v10 = v8;
  result = 70005;
  if (!v10)
    return 70006;
  proc->pid = v10;
  v11 = BYTE1(v14);
  v12 = v14 & 0x7F;
  if (v12 == 127)
    return 20014;
  if ((v14 & 0x7F) != 0)
  {
    if (exitwhy)
    {
      if ((v14 & 0x80) != 0)
        v13 = APR_PROC_SIGNAL_CORE|APR_PROC_SIGNAL;
      else
        v13 = APR_PROC_SIGNAL;
      *exitwhy = v13;
    }
  }
  else
  {
    if (exitwhy)
      *exitwhy = APR_PROC_EXIT;
    v12 = v11;
  }
  if (exitcode)
    *exitcode = v12;
  return result;
}

uint64_t apr_procattr_perms_set_register(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  _QWORD *v8;

  v8 = apr_palloc(*(apr_pool_t **)a1, 0x20uLL);
  v8[3] = a3;
  *((_DWORD *)v8 + 4) = a4;
  *v8 = *(_QWORD *)(a1 + 128);
  v8[1] = a2;
  *(_QWORD *)(a1 + 128) = v8;
  return 0;
}

void apr_random_init(apr_random_t *g, apr_pool_t *p, apr_crypto_hash_t *pool_hash, apr_crypto_hash_t *key_hash, apr_crypto_hash_t *prng_hash)
{
  void *v7;
  uint64_t v8;
  apr_size_t v9;
  void *v10;
  void *v11;
  apr_size_t v12;
  void *v13;
  void *v14;
  _QWORD *v15;

  *(_QWORD *)g = p;
  *((_QWORD *)g + 1) = pool_hash;
  *((_QWORD *)g + 7) = key_hash;
  *((_QWORD *)g + 8) = prng_hash;
  *((_DWORD *)g + 4) = 32;
  v7 = apr_palloc(p, 0x200uLL);
  *((_QWORD *)g + 3) = v7;
  v8 = *((unsigned int *)g + 4);
  if ((_DWORD)v8)
    bzero(v7, 16 * v8);
  *((_QWORD *)g + 4) = 0;
  *((_QWORD *)g + 5) = 2
                     * *(_QWORD *)(*((_QWORD *)g + 1) + 24)
                     * (((unint64_t)(2 * *(_QWORD *)(*((_QWORD *)g + 1) + 24) + 1023)
                       / *(_QWORD *)(*((_QWORD *)g + 1) + 24)) >> 1);
  *((_QWORD *)g + 6) = 32;
  v9 = *(_QWORD *)(*((_QWORD *)g + 7) + 24) + *(_QWORD *)(*((_QWORD *)g + 8) + 24);
  v10 = apr_palloc(p, v9);
  v11 = v10;
  if (v10)
    bzero(v10, v9);
  *((_QWORD *)g + 9) = v11;
  v12 = *(_QWORD *)(*((_QWORD *)g + 7) + 24) + *(_QWORD *)(*((_QWORD *)g + 8) + 24);
  v13 = apr_palloc(p, v12);
  v14 = v13;
  if (v13)
    bzero(v13, v12);
  *((_QWORD *)g + 10) = v14;
  *((_QWORD *)g + 11) = apr_palloc(p, *(_QWORD *)(*((_QWORD *)g + 8) + 24));
  *((_QWORD *)g + 12) = 0;
  *((_DWORD *)g + 28) = 0;
  *((_QWORD *)g + 13) = 0x14000000020;
  *((_BYTE *)g + 116) &= 0xFCu;
  *((_QWORD *)g + 15) = all_random;
  all_random = (uint64_t)g;
  v15 = (_QWORD *)*((_QWORD *)p + 5);
  if (v15)
    *((_QWORD *)p + 5) = *v15;
  else
    v15 = apr_palloc(p, 0x20uLL);
  v15[2] = random_cleanup;
  v15[3] = apr_pool_cleanup_null;
  *v15 = *((_QWORD *)p + 4);
  v15[1] = g;
  *((_QWORD *)p + 4) = v15;
}

uint64_t random_cleanup(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;

  v1 = all_random;
  if (all_random)
  {
    if (all_random == a1)
    {
      v3 = &all_random;
LABEL_7:
      *v3 = *(_QWORD *)(a1 + 120);
    }
    else
    {
      while (1)
      {
        v2 = v1;
        v1 = *(_QWORD *)(v1 + 120);
        if (!v1)
          break;
        if (v1 == a1)
        {
          v3 = (uint64_t *)(v2 + 120);
          goto LABEL_7;
        }
      }
    }
  }
  return 0;
}

void apr_random_after_fork(apr_proc_t *proc)
{
  uint64_t i;
  uint64_t v2;
  uint64_t v3;

  for (i = all_random; i; i = *(_QWORD *)(i + 120))
  {
    if ((*(_BYTE *)(i + 116) & 3) == 1)
      v2 = 80;
    else
      v2 = 72;
    v3 = *(_QWORD *)(i + v2);
    mix_pid(i);
    if (v3 != *(_QWORD *)(i + 72))
      mix_pid(i);
    --*(_DWORD *)(i + 36);
    *(_QWORD *)(i + 96) = 0;
  }
}

uint64_t mix_pid(uint64_t a1)
{
  (**(void (***)(void))(a1 + 56))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 8))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 8))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

apr_random_t *__cdecl apr_random_standard_new(apr_pool_t *p)
{
  return (apr_random_t *)apr_palloc(p, 0x80uLL);
}

void apr_random_add_entropy(apr_random_t *g, const void *entropy_, apr_size_t bytes)
{
  uint64_t v6;
  unsigned int i;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  unsigned int *v12;
  unsigned int v13;
  void *v14;
  char v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unsigned int v22;
  char v23;
  char v24;

  if (bytes)
  {
    v6 = 0;
    for (i = 0; i < bytes; v6 = ++i)
    {
      v8 = *((unsigned int *)g + 8);
      v9 = *((_QWORD *)g + 3) + 16 * v8;
      if ((_DWORD)v8 + 1 == *((_DWORD *)g + 4))
        v10 = 0;
      else
        v10 = v8 + 1;
      *((_DWORD *)g + 8) = v10;
      v12 = (unsigned int *)(v9 + 8);
      v11 = *(_DWORD *)(v9 + 8);
      v13 = v11 + 1;
      if (*(_DWORD *)(v9 + 12) >= v11 + 1)
      {
        v14 = *(void **)v9;
      }
      else
      {
        v14 = apr_palloc(*(apr_pool_t **)g, 2 * v13);
        memcpy(v14, *(const void **)v9, *v12);
        *(_QWORD *)v9 = v14;
        v11 = *v12;
        *(_DWORD *)(v9 + 12) = 2 * *v12 + 2;
        v13 = v11 + 1;
      }
      v15 = *((_BYTE *)entropy_ + v6);
      *v12 = v13;
      *((_BYTE *)v14 + v11) = v15;
      v16 = *v12;
      if (*((_QWORD *)g + 5) == v16)
      {
        if (v16 >= 2)
        {
          v17 = 0;
          v18 = *((_QWORD *)g + 1);
          do
          {
            (*(void (**)(void))v18)();
            (*(void (**)(void))(*((_QWORD *)g + 1) + 8))();
            (*(void (**)(void))(*((_QWORD *)g + 1) + 16))();
            v18 = *((_QWORD *)g + 1);
            v17 += *(_QWORD *)(v18 + 24);
            v19 = *v12;
          }
          while (v17 < v19 >> 1);
          v16 = v19 >> 1;
        }
        else
        {
          LODWORD(v16) = v16 >> 1;
        }
        *v12 = v16;
      }
    }
  }
  if (*((_QWORD *)g + 6) <= (unint64_t)*(unsigned int *)(*((_QWORD *)g + 3) + 8))
  {
    (**((void (***)(void))g + 7))();
    (*(void (**)(void))(*((_QWORD *)g + 7) + 8))();
    if (*((_DWORD *)g + 4))
    {
      v20 = 0;
      v21 = 0;
      do
      {
        if (v21 && ((*((_DWORD *)g + 9) >> (v21 - 1)) & 1) == 0)
          break;
        (*(void (**)(void))(*((_QWORD *)g + 7) + 8))();
        *(_DWORD *)(*((_QWORD *)g + 3) + v20 + 8) = 0;
        ++v21;
        v20 += 16;
      }
      while (v21 < *((unsigned int *)g + 4));
    }
    (*(void (**)(void))(*((_QWORD *)g + 7) + 16))();
    v22 = *((_DWORD *)g + 9) + 1;
    *((_DWORD *)g + 9) = v22;
    v23 = *((_BYTE *)g + 116);
    if ((v23 & 1) != 0 || v22 <= *((_DWORD *)g + 26))
    {
      v24 = *((_BYTE *)g + 116);
      if ((v24 & 2) != 0)
        return;
    }
    else
    {
      v24 = v23 | 1;
      *((_BYTE *)g + 116) = v23 | 1;
      if ((v23 & 2) == 0)
      {
        memcpy(*((void **)g + 10), *((const void **)g + 9), *(_QWORD *)(*((_QWORD *)g + 7) + 24) + *(_QWORD *)(*((_QWORD *)g + 8) + 24));
        v22 = *((_DWORD *)g + 9);
        *((_DWORD *)g + 28) = v22;
        v24 = *((_BYTE *)g + 116);
      }
      if ((v24 & 2) != 0)
        return;
    }
    if (v22 > *((_DWORD *)g + 27) + *((_DWORD *)g + 28))
    {
      *((_BYTE *)g + 116) = v24 | 2;
      memcpy(*((void **)g + 9), *((const void **)g + 10), *(_QWORD *)(*((_QWORD *)g + 7) + 24) + *(_QWORD *)(*((_QWORD *)g + 8) + 24));
    }
  }
}

apr_status_t apr_random_secure_bytes(apr_random_t *g, void *random, apr_size_t bytes)
{
  if ((*((_BYTE *)g + 116) & 2) == 0)
    return 20028;
  apr_random_bytes(g, (uint64_t)random, bytes);
  return 0;
}

_QWORD *apr_random_bytes(_QWORD *result, uint64_t a2, unint64_t a3)
{
  _QWORD *v5;
  unint64_t v6;
  size_t v7;
  uint64_t v8;
  size_t v9;
  size_t v10;

  if (a3)
  {
    v5 = result;
    v6 = 0;
    v7 = result[12];
    do
    {
      v8 = v5[8];
      if (v7)
      {
        v9 = *(_QWORD *)(v8 + 24);
      }
      else
      {
        (*(void (**)(void))v8)();
        (*(void (**)(void))(v5[8] + 8))();
        (*(void (**)(void))(v5[8] + 16))();
        (*(void (**)(void))v5[8])();
        (*(void (**)(_QWORD, _QWORD, _QWORD))(v5[8] + 8))(v5[8], v5[9], *(_QWORD *)(v5[8] + 24));
        (*(void (**)(void))(v5[8] + 16))();
        v9 = *(_QWORD *)(v5[8] + 24);
        v5[12] = v9;
        v7 = v9;
      }
      if (a3 - v6 >= v7)
        v10 = v7;
      else
        v10 = a3 - v6;
      result = memcpy((void *)(a2 + v6), (const void *)(v5[11] + v9 - v7), v10);
      v7 = v5[12] - v10;
      v5[12] = v7;
      v6 += v10;
    }
    while (v6 < a3);
  }
  return result;
}

apr_status_t apr_random_insecure_bytes(apr_random_t *g, void *random, apr_size_t bytes)
{
  if ((*((_BYTE *)g + 116) & 1) == 0)
    return 20028;
  apr_random_bytes(g, (uint64_t)random, bytes);
  return 0;
}

void apr_random_barrier(apr_random_t *g)
{
  *((_BYTE *)g + 116) &= ~2u;
  *((_DWORD *)g + 28) = *((_DWORD *)g + 9);
}

apr_status_t apr_random_secure_ready(apr_random_t *r)
{
  if ((*((_BYTE *)r + 116) & 2) != 0)
    return 0;
  else
    return 20028;
}

apr_status_t apr_random_insecure_ready(apr_random_t *r)
{
  if ((*((_BYTE *)r + 116) & 1) != 0)
    return 0;
  else
    return 20028;
}

int apr_vformatter(int (__cdecl *flush_func)(apr_vformatter_buff_t *), apr_vformatter_buff_t *c, const char *fmt, va_list ap)
{
  apr_vformatter_buff_t *v5;
  unint64_t v6;
  char *p_n_4;
  int v8;
  char *curpos;
  int v10;
  const char *v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int *v23;
  uint64_t v24;
  unsigned int v25;
  int v26;
  int v27;
  char v28;
  int v29;
  uint64_t v30;
  int v31;
  int v32;
  _BOOL4 v33;
  const char *v34;
  BOOL v35;
  unsigned int *v36;
  int v37;
  int v38;
  int v39;
  _DWORD *v40;
  int (__cdecl *v41)(apr_vformatter_buff_t *);
  int v42;
  unsigned int **v43;
  unsigned int v44;
  unsigned int v45;
  _BYTE *v46;
  _BYTE *v47;
  _BYTE *v48;
  _BYTE *v49;
  _BYTE *v50;
  unsigned int v51;
  _BYTE *v52;
  unsigned int v53;
  unsigned int v54;
  char *v55;
  apr_status_t **v56;
  apr_status_t *v57;
  size_t v58;
  double *v59;
  long double v60;
  int v61;
  int v62;
  int v63;
  int v64;
  unint64_t *v65;
  unint64_t v66;
  const char *v67;
  BOOL v68;
  unint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  long double v75;
  char *v76;
  uint64_t v77;
  int v78;
  BOOL v79;
  int v80;
  char *v82;
  char v83;
  unint64_t *v84;
  unint64_t v85;
  uint64_t v86;
  int v87;
  _DWORD *v88;
  _QWORD **v89;
  unint64_t *v90;
  unint64_t v91;
  const char *v92;
  const char **v93;
  size_t v94;
  unint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  unsigned int *v98;
  unsigned int v99;
  unsigned int v100;
  unsigned int v101;
  unint64_t v102;
  int v103;
  char v104;
  unsigned int *v105;
  unsigned int v106;
  const char *v107;
  unsigned int **v108;
  unsigned int *v109;
  apr_off_t v110;
  apr_off_t **v111;
  apr_off_t *v112;
  size_t v113;
  unsigned int **v114;
  size_t v115;
  unint64_t v116;
  int v117;
  unsigned int **v118;
  int v119;
  unsigned int **v120;
  unint64_t v121;
  int v122;
  uint64_t v123;
  char *v124;
  char *p_n_6;
  _WORD **v126;
  unsigned int *v127;
  unsigned int v128;
  const char *v129;
  unsigned int *v130;
  unsigned int v131;
  unsigned int v132;
  unint64_t v133;
  unint64_t v134;
  char v135;
  size_t v136;
  _BYTE *v137;
  int v138;
  _BYTE *v139;
  uint64_t v140;
  unint64_t v141;
  _DWORD **v142;
  int v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  char *v147;
  int v149;
  size_t v150;
  size_t v151;
  char *v152;
  char v153;
  unsigned __int8 *v154;
  int v155;
  int v156;
  int v157;
  unsigned int v158;
  uint64_t v159;
  _BYTE *v160;
  uint64_t v161;
  char v162;
  char *v163;
  _BYTE *v164;
  size_t v165;
  char v166;
  char v167;
  int v169;
  int v170;
  apr_vformatter_buff_t *v171;
  unsigned int v172;
  unint64_t v174;
  char *endpos;
  int v176;
  int v177;
  unsigned int v178;
  _BYTE v179[2];
  size_t v180;
  va_list v181;
  int __n;
  char __n_4;
  _BYTE __n_5[64];
  char __n_6;
  _BYTE __n_7[506];
  _BYTE v187[11];
  _BYTE v188[2];
  char __s[80];
  uint64_t v190;

  v5 = c;
  v174 = 0;
  v172 = 0;
  v6 = 0;
  p_n_4 = 0;
  v8 = 0;
  v190 = *MEMORY[0x24BDAC8D0];
  v180 = 0;
  v181 = ap;
  v178 = 0;
  curpos = c->curpos;
  endpos = c->endpos;
LABEL_2:
  LOBYTE(v10) = *fmt;
  while (1)
  {
LABEL_3:
    if (v10 != 37)
    {
      v55 = endpos;
      if (!(_BYTE)v10)
      {
        v5->curpos = curpos;
        return v8;
      }
      if (curpos)
      {
        if (curpos >= endpos)
        {
          v5->curpos = curpos;
          if (((unsigned int (*)(apr_vformatter_buff_t *))flush_func)(v5))
            return -1;
          curpos = v5->curpos;
          v55 = v5->endpos;
          LOBYTE(v10) = *fmt;
        }
        *curpos++ = v10;
      }
      ++v8;
LABEL_426:
      endpos = v55;
      ++fmt;
      goto LABEL_2;
    }
    v12 = fmt[1];
    v11 = fmt + 1;
    v13 = v12;
    if (v12 < 0)
    {
      if (__maskrune(v13, 0x1000uLL))
      {
LABEL_6:
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 1;
        v18 = 32;
        v176 = 0;
        v177 = 1;
        goto LABEL_41;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v13 + 60) & 0x1000) != 0)
    {
      goto LABEL_6;
    }
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v19 = 1;
    v18 = 32;
    while (1)
    {
      v20 = *(unsigned __int8 *)v11;
      if (v20 <= 0x2A)
        break;
      switch(v20)
      {
        case '0':
          v18 = 48;
          break;
        case '-':
          v19 = 0;
          break;
        case '+':
          v15 = 1;
          break;
        default:
          goto LABEL_21;
      }
LABEL_20:
      ++v11;
    }
    if (v20 == 32)
    {
      v14 = 1;
      goto LABEL_20;
    }
    if (v20 == 35)
    {
      v16 = 1;
      goto LABEL_20;
    }
LABEL_21:
    v177 = v19;
    if (v20 - 48 <= 9)
    {
      v6 = *v11 - 48;
      v21 = *(unsigned __int8 *)++v11;
      v20 = v21;
      if (v21 - 48 <= 9)
      {
        do
        {
          v6 = 10 * v6 + (char)v20 - 48;
          v22 = *(unsigned __int8 *)++v11;
          v20 = v22;
        }
        while (v22 - 48 < 0xA);
      }
      goto LABEL_31;
    }
    if (v20 == 42)
    {
      v23 = (unsigned int *)v181;
      v181 += 8;
      v24 = *v23;
      v25 = *(unsigned __int8 *)++v11;
      v20 = v25;
      v26 = v19;
      if ((int)v24 < 0)
        v26 = 0;
      v177 = v26;
      v6 = (int)v24 >= 0 ? v24 : -(int)v24;
LABEL_31:
      v176 = 1;
    }
    else
    {
      v176 = 0;
    }
    if (v20 == 46)
    {
      v27 = *((unsigned __int8 *)v11 + 1);
      if ((v27 - 48) > 9)
      {
        v17 = 0;
        if ((char)v27 == 42)
        {
          v40 = v181;
          v181 += 8;
          v11 += 2;
          v174 = *v40 & ~((int)*v40 >> 31);
        }
        else
        {
          v174 = 0;
          ++v11;
        }
      }
      else
      {
        v29 = *((unsigned __int8 *)v11 + 2);
        v11 += 2;
        v28 = v29;
        v174 = (char)v27 - 48;
        if ((v29 - 48) <= 9)
        {
          v30 = (char)v27 - 48;
          do
          {
            v31 = *(unsigned __int8 *)++v11;
            v30 = 10 * v30 + v28 - 48;
            v28 = v31;
          }
          while ((v31 - 48) < 0xA);
          v174 = v30;
        }
        v17 = 0;
      }
    }
    else
    {
      v17 = 1;
    }
LABEL_41:
    v32 = *(unsigned __int8 *)v11;
    v33 = v32 == 108;
    if (v32 == 108)
      v34 = v11 + 1;
    else
      v34 = v11;
    if (v32 == 113)
    {
      v33 = 1;
      v34 = v11 + 1;
    }
    v35 = v32 == 104;
    if (v32 == 104)
      v33 = 0;
    LODWORD(v36) = v32 == 104;
    fmt = v35 ? v11 + 1 : v34;
    v37 = *fmt;
    if (v37 > 70)
      break;
    LOBYTE(v10) = *fmt;
    if (*fmt)
    {
      if (v37 == 37)
      {
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        LOBYTE(v87) = 37;
LABEL_140:
        v179[0] = v87;
        v86 = 1;
      }
      else
      {
        if (v37 == 69)
        {
LABEL_86:
          v59 = (double *)v181;
          v181 += 8;
          v60 = *v59;
          v42 = v177;
          if (fabs(*v59) == INFINITY)
          {
            LOBYTE(v36) = 0;
            LOBYTE(v16) = 0;
            v180 = 3;
            p_n_4 = "inf";
            v41 = flush_func;
            goto LABEL_384;
          }
          v61 = *(unsigned __int8 *)fmt;
          if ((_DWORD)v17)
            v62 = 6;
          else
            v62 = v174;
          __n = 0;
          v169 = v61;
          v171 = v5;
          if (v61 == 102)
          {
            v63 = v62;
            v64 = 0;
          }
          else
          {
            v63 = v62 + 1;
            v64 = 1;
          }
          apr_cvt(v63, &__n, &v178, v64, __s, v60);
          v104 = __s[0];
          if (__s[0] < 0)
          {
            if (__maskrune(__s[0], 0x100uLL))
              goto LABEL_174;
          }
          else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * __s[0] + 60) & 0x100) != 0)
          {
LABEL_174:
            v180 = strlen(__s);
            p_n_4 = __n_5;
            __memcpy_chk();
            v178 = 0;
            v42 = v177;
            goto LABEL_175;
          }
          v122 = v169;
          if (v169 == 102)
          {
            if (__n < 1)
            {
              __n_5[0] = 48;
              if (v62 < 1)
              {
                if (v16)
                {
                  __n_6 = 46;
                  v124 = __s;
                  p_n_6 = __n_7;
                }
                else
                {
                  v124 = __s;
                  p_n_6 = &__n_6;
                }
              }
              else
              {
                __n_6 = 46;
                p_n_6 = __n_7;
                if (__n < 0)
                {
                  v144 = ~__n;
                  memset(__n_7, 48, v144 + 1);
                  v122 = 102;
                  p_n_6 = &__n_5[v144 + 3];
                }
                __n = 1;
                v124 = __s;
              }
            }
            else
            {
              v123 = __n;
              memcpy(__n_5, __s, __n);
              v124 = &__s[v123];
              p_n_6 = &__n_5[v123];
              __n = -1;
              if (v16 || v62 > 0)
              {
                *p_n_6 = 46;
                p_n_6 = &__n_7[(v123 - 1)];
              }
              v122 = 102;
            }
          }
          else
          {
            __n_5[0] = v104;
            if (v16 || (p_n_6 = &__n_6, v124 = &__s[1], v62 >= 1))
            {
              __n_6 = 46;
              p_n_6 = __n_7;
              v124 = &__s[1];
            }
          }
          v153 = *v124;
          if (*v124)
          {
            v154 = (unsigned __int8 *)(v124 + 1);
            do
            {
              *p_n_6++ = v153;
              v155 = *v154++;
              v153 = v155;
            }
            while (v155);
          }
          p_n_4 = __n_5;
          if (v122 != 102)
          {
            *p_n_6 = v122;
            v156 = __n;
            v157 = --__n;
            if (__n)
            {
              if (v157 >= 0)
                v158 = v157;
              else
                v158 = -v157;
              v159 = -1;
              v160 = v188;
              do
              {
                v161 = v159;
                *--v160 = v158 % 0xA + 48;
                --v159;
                v79 = v158 > 9;
                v158 /= 0xAu;
              }
              while (v79);
              if (v156 <= 0)
                v162 = 45;
              else
                v162 = 43;
              v163 = p_n_6 + 2;
              p_n_6[1] = v162;
              v164 = (_BYTE *)(v188 - v160);
              if (v164)
              {
                if (v164 == (_BYTE *)1)
                {
                  v163 = p_n_6 + 3;
                  p_n_6[2] = 48;
                }
                do
                {
                  *v163++ = v188[v161];
                  v68 = __CFADD__(v161++, 1);
                }
                while (!v68);
              }
            }
            else
            {
              *(_WORD *)(p_n_6 + 1) = 12331;
              v163 = p_n_6 + 4;
              p_n_6[3] = 48;
            }
            p_n_6 = v163;
          }
          v180 = p_n_6 - __n_5;
          v42 = v177;
          if (v178)
          {
            v103 = 45;
LABEL_379:
            v41 = flush_func;
            goto LABEL_380;
          }
LABEL_175:
          if (v15)
            v103 = 43;
          else
            v103 = 32 * (v14 != 0);
          goto LABEL_379;
        }
LABEL_137:
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        v179[0] = 37;
        v179[1] = *fmt;
        v86 = 2;
      }
      v180 = v86;
      p_n_4 = v179;
LABEL_142:
      v18 = 32;
LABEL_297:
      v41 = flush_func;
LABEL_313:
      v42 = v177;
      goto LABEL_384;
    }
  }
  switch(*fmt)
  {
    case 'c':
      LOBYTE(v36) = 0;
      LOBYTE(v16) = 0;
      v88 = v181;
      v181 += 8;
      v87 = *v88;
      goto LABEL_140;
    case 'd':
    case 'i':
      if (v33)
      {
        v69 = (unint64_t *)v181;
        v181 += 8;
        v70 = v17;
        v71 = conv_10_quad(*v69, 0, &v178, (uint64_t)&v187[3], &v180);
        v17 = v70;
        p_n_4 = (char *)v71;
        if ((v70 & 1) != 0)
          goto LABEL_169;
LABEL_165:
        v102 = 511;
        if (v174 + 1 < 0x200)
          v102 = v174;
        for (; v180 < v102; ++v180)
          *--p_n_4 = 48;
        goto LABEL_169;
      }
      v98 = (unsigned int *)v181;
      v181 += 8;
      v99 = *v98;
      if ((_DWORD)v36)
        v100 = (__int16)v99;
      else
        v100 = v99;
      v101 = v100 >> 31;
      if ((v100 & 0x80000000) != 0)
        v100 = -v100;
      v178 = v101;
      p_n_4 = &v187[3];
      do
      {
        *--p_n_4 = v100 % 0xA + 48;
        v79 = v100 > 9;
        v100 /= 0xAu;
      }
      while (v79);
      v180 = &v187[3] - p_n_4;
      if ((v17 & 1) == 0)
        goto LABEL_165;
LABEL_169:
      v171 = v5;
      if (v178)
      {
        v103 = 45;
      }
      else if (v15)
      {
        v103 = 43;
      }
      else
      {
        v103 = 32 * (v14 != 0);
      }
      v41 = flush_func;
LABEL_348:
      v42 = v177;
      break;
    case 'e':
    case 'f':
      goto LABEL_86;
    case 'g':
      goto LABEL_104;
    case 'h':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'q':
    case 'r':
    case 't':
    case 'v':
    case 'w':
      goto LABEL_137;
    case 'n':
      if (v33)
      {
        LOBYTE(v36) = 0;
        v89 = (_QWORD **)v181;
        v181 += 8;
        **v89 = v8;
      }
      else if ((_DWORD)v36)
      {
        LOBYTE(v36) = 0;
        v126 = (_WORD **)v181;
        v181 += 8;
        **v126 = v8;
      }
      else
      {
        v142 = (_DWORD **)v181;
        v181 += 8;
        **v142 = v8;
      }
      LOBYTE(v16) = 1;
      goto LABEL_297;
    case 'o':
      if (v33)
      {
        v90 = (unint64_t *)v181;
        v181 += 8;
        v91 = *v90;
        v92 = "0123456789abcdef";
        if (*fmt == 88)
          v92 = "0123456789ABCDEF";
        if (HIDWORD(v91))
        {
          p_n_4 = &v187[3];
          v41 = flush_func;
          do
          {
            *--p_n_4 = v92[v91 & 7];
            v68 = v91 >= 8;
            v91 >>= 3;
          }
          while (v68);
        }
        else
        {
          p_n_4 = &v187[3];
          v41 = flush_func;
          do
          {
            *--p_n_4 = v92[v91 & 7];
            v68 = v91 >= 8;
            LODWORD(v91) = v91 >> 3;
          }
          while (v68);
        }
      }
      else
      {
        v127 = (unsigned int *)v181;
        v181 += 8;
        v128 = *v127;
        if ((_DWORD)v36)
          v128 = (unsigned __int16)v128;
        v129 = "0123456789abcdef";
        if (*fmt == 88)
          v129 = "0123456789ABCDEF";
        v172 = v128;
        p_n_4 = &v187[3];
        do
        {
          *--p_n_4 = v129[v128 & 7];
          v79 = v128 > 7;
          v128 >>= 3;
        }
        while (v79);
        v41 = flush_func;
      }
      v42 = v177;
      v180 = &v187[3] - p_n_4;
      if ((v17 & 1) == 0)
      {
        v141 = 511;
        if (v174 + 1 < 0x200)
          v141 = v174;
        if (&v187[3] - p_n_4 >= v141)
        {
          v42 = v177;
        }
        else
        {
          v42 = v177;
          do
          {
            *--p_n_4 = 48;
            ++v180;
          }
          while (v180 < v141);
        }
      }
      if (!v16)
      {
        LOBYTE(v36) = 0;
        goto LABEL_384;
      }
      if (*p_n_4 == 48)
        goto LABEL_301;
      LOBYTE(v36) = 0;
      LOBYTE(v16) = 0;
      *--p_n_4 = 48;
      v136 = v180 + 1;
      goto LABEL_304;
    case 'p':
      v39 = *++fmt;
      v38 = v39;
      v10 = v39;
      if (!v39)
        goto LABEL_3;
      if (v38 <= 83)
      {
        v41 = flush_func;
        v42 = v177;
        switch(v38)
        {
          case 'A':
            v43 = (unsigned int **)v181;
            v181 += 8;
            v36 = *v43;
            if (!v36)
              goto LABEL_211;
            v44 = bswap32(*v36);
            v45 = v44;
            v46 = v187;
            v47 = &v187[2];
            v48 = &v187[4];
            do
            {
              v49 = v47;
              v50 = v46;
              *(v48 - 2) = v45 % 0xA + 48;
              --v48;
              --v47;
              --v46;
              v79 = v45 > 9;
              v45 /= 0xAu;
            }
            while (v79);
            *(v48 - 2) = 46;
            v51 = BYTE1(v44);
            do
            {
              v52 = v50;
              *(v49 - 2) = v51 % 0xA + 48;
              --v49;
              --v50;
              v79 = v51 > 9;
              v51 /= 0xAu;
            }
            while (v79);
            *(v49 - 2) = 46;
            v53 = BYTE2(v44);
            do
            {
              *(v52 - 2) = v53 % 0xA + 48;
              --v52;
              v79 = v53 > 9;
              v53 /= 0xAu;
            }
            while (v79);
            *(v52 - 2) = 46;
            p_n_4 = v52 - 2;
            v54 = HIBYTE(v44);
            do
            {
              *--p_n_4 = v54 % 0xA + 48;
              v79 = v54 > 9;
              v54 /= 0xAu;
            }
            while (v79);
            goto LABEL_307;
          case 'B':
          case 'F':
            goto LABEL_191;
          case 'C':
          case 'D':
          case 'E':
          case 'G':
          case 'H':
            goto LABEL_202;
          case 'I':
            v114 = (unsigned int **)v181;
            v181 += 8;
            v36 = *v114;
            if (!v36)
              goto LABEL_211;
            LOBYTE(v36) = 0;
            LOBYTE(v16) = 0;
            p_n_4 = 0;
            v115 = v180;
            v116 = v174;
            if (v174 >= v180)
              v117 = 1;
            else
              v117 = v17;
            goto LABEL_207;
          default:
            v41 = flush_func;
            v42 = v177;
            if (v38 != 83)
              goto LABEL_202;
LABEL_191:
            if (v10 == 66)
            {
              v108 = (unsigned int **)v181;
              v181 += 8;
              v109 = *v108;
              if (v109)
              {
                v110 = *v109;
                goto LABEL_197;
              }
            }
            else
            {
              v111 = (apr_off_t **)v181;
              v181 += 8;
              v112 = *v111;
              if (v112)
              {
                v110 = *v112;
                goto LABEL_197;
              }
            }
            v110 = 0;
LABEL_197:
            p_n_4 = __s;
            apr_strfsize(v110, __s);
            v113 = strlen(__s);
            LOBYTE(v36) = 0;
            LOBYTE(v16) = 0;
            v180 = v113;
            v18 = 32;
            break;
        }
        goto LABEL_313;
      }
      if (v38 <= 111)
      {
        v42 = v177;
        if (v38 == 84)
        {
          v118 = (unsigned int **)v181;
          v181 += 8;
          v36 = *v118;
          v41 = flush_func;
          if (!v36)
          {
LABEL_211:
            LOBYTE(v16) = 0;
            v180 = 6;
            v18 = 32;
            p_n_4 = "(null)";
            goto LABEL_384;
          }
          v119 = v17;
          p_n_4 = (char *)conv_10_quad(*(_QWORD *)v36, 1, __s, (uint64_t)&v187[3], &v180);
          LOBYTE(v36) = 0;
          LOBYTE(v16) = 0;
          v115 = v180;
          v116 = v174;
          if (v174 >= v180)
            v117 = 1;
          else
            v117 = v119;
LABEL_207:
          v35 = v117 == 0;
          v42 = v177;
          if (v35)
            v115 = v116;
          v180 = v115;
        }
        else
        {
          v41 = flush_func;
          if (v38 != 109)
            goto LABEL_202;
          v56 = (apr_status_t **)v181;
          v181 += 8;
          v57 = *v56;
          if (v57)
          {
            p_n_4 = &__n_4;
            apr_strerror(*v57, &__n_4, 0x1FFuLL);
            v58 = strlen(&__n_4);
            v42 = v177;
          }
          else
          {
            v58 = 6;
            p_n_4 = "(null)";
          }
          LOBYTE(v36) = 0;
          LOBYTE(v16) = 0;
          v180 = v58;
        }
LABEL_352:
        v18 = 32;
        goto LABEL_384;
      }
      v42 = v177;
      if (v38 == 116)
      {
        v120 = (unsigned int **)v181;
        v181 += 8;
        v36 = *v120;
        v41 = flush_func;
        if (!v36)
        {
          LOBYTE(v16) = 0;
          v180 = 6;
          v18 = 32;
          p_n_4 = "(null)";
          goto LABEL_313;
        }
        v121 = *(_QWORD *)v36;
        if (HIDWORD(v121))
        {
          p_n_4 = &v187[3];
          do
          {
            *--p_n_4 = conv_p2_low_digits[v121 & 0xF];
            v79 = v121 > 0xF;
            v121 >>= 4;
          }
          while (v79);
        }
        else
        {
          p_n_4 = &v187[3];
          do
          {
            *--p_n_4 = conv_p2_low_digits[v121 & 0xF];
            v68 = v121 >= 0x10;
            LODWORD(v121) = v121 >> 4;
          }
          while (v68);
        }
LABEL_307:
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        v137 = (_BYTE *)(&v187[3] - p_n_4);
        if (v174 >= &v187[3] - p_n_4)
          v143 = 1;
        else
          v143 = v17;
        if (!v143)
          v137 = (_BYTE *)v174;
      }
      else
      {
        v41 = flush_func;
        if (v38 != 112)
        {
LABEL_202:
          LOBYTE(v36) = 0;
          LOBYTE(v16) = 0;
          v180 = 8;
          v181 += 8;
          p_n_4 = "bogus %p";
          goto LABEL_384;
        }
        v84 = (unint64_t *)v181;
        v181 += 8;
        v85 = *v84;
        if (HIDWORD(v85))
        {
          p_n_4 = &v187[3];
          do
          {
            *--p_n_4 = conv_p2_low_digits[v85 & 0xF];
            v79 = v85 > 0xF;
            v85 >>= 4;
          }
          while (v79);
        }
        else
        {
          p_n_4 = &v187[3];
          do
          {
            *--p_n_4 = conv_p2_low_digits[v85 & 0xF];
            v68 = v85 >= 0x10;
            LODWORD(v85) = v85 >> 4;
          }
          while (v68);
        }
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        v137 = (_BYTE *)(&v187[3] - p_n_4);
      }
      v180 = (size_t)v137;
      v18 = 32;
      goto LABEL_313;
    case 's':
      v93 = (const char **)v181;
      v181 += 8;
      p_n_4 = (char *)*v93;
      if (!*v93)
      {
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        v180 = 6;
        v18 = 32;
        p_n_4 = "(null)";
        goto LABEL_297;
      }
      if ((v17 & 1) != 0)
      {
        v94 = strlen(*v93);
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        v180 = v94;
        goto LABEL_142;
      }
      v180 = 0;
      v41 = flush_func;
      LOBYTE(v36) = v174;
      v42 = v177;
      if (v174)
      {
        v140 = 0;
        while (p_n_4[v140])
        {
          v180 = ++v140;
          v18 = 32;
          if (v174 == v140)
          {
LABEL_301:
            LOBYTE(v36) = 0;
            LOBYTE(v16) = 0;
            goto LABEL_384;
          }
        }
        LOBYTE(v36) = 0;
      }
      else
      {
        v174 = 0;
      }
      LOBYTE(v16) = 0;
      goto LABEL_352;
    case 'u':
      if (v33)
      {
        v95 = (unint64_t *)v181;
        v181 += 8;
        v96 = v17;
        v97 = conv_10_quad(*v95, 1, &v178, (uint64_t)&v187[3], &v180);
        v17 = v96;
        p_n_4 = (char *)v97;
      }
      else
      {
        v130 = (unsigned int *)v181;
        v181 += 8;
        v131 = *v130;
        if ((_DWORD)v36)
          v132 = (unsigned __int16)v131;
        else
          v132 = v131;
        v178 = 0;
        p_n_4 = &v187[3];
        do
        {
          *--p_n_4 = v132 % 0xA + 48;
          v79 = v132 > 9;
          v132 /= 0xAu;
        }
        while (v79);
        v180 = &v187[3] - p_n_4;
      }
      v41 = flush_func;
      if ((v17 & 1) != 0)
      {
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
      }
      else
      {
        v133 = 511;
        if (v174 + 1 < 0x200)
          v133 = v174;
        for (; v180 < v133; ++v180)
          *--p_n_4 = 48;
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
      }
      goto LABEL_313;
    case 'x':
      goto LABEL_94;
    default:
      if (v37 == 71)
      {
LABEL_104:
        v171 = v5;
        v72 = v174;
        if (v174 <= 1)
          v72 = 1;
        if ((_DWORD)v17)
          v73 = 6;
        else
          v73 = v72;
        v74 = v181;
        v181 += 8;
        v75 = *(double *)v74;
        *(_DWORD *)&v187[3] = 0;
        __n = 0;
        apr_cvt(v73, &__n, &v187[3], 1, __s, v75);
        v76 = __n_5;
        if (*(_DWORD *)&v187[3])
        {
          __n_5[0] = 45;
          v76 = &__n_6;
        }
        v174 = v73;
        if ((int)v73 >= 2)
        {
          v73 = v73;
          do
          {
            v77 = v73 - 1;
            if (__s[(v73 - 1)] != 48)
              goto LABEL_116;
            --v73;
          }
          while ((unint64_t)(v77 + 1) > 2);
          LODWORD(v73) = 1;
        }
LABEL_116:
        v78 = __n;
        v79 = __n < 0 || __n - (int)v73 <= 4;
        v80 = !v79;
        if (__n >= -3 && v80 == 0)
        {
          if (__n <= 0)
          {
            if (__s[0] != 48)
              *v76++ = 46;
            if (v78 < 0)
            {
              do
              {
                __n = v78 + 1;
                *v76++ = 48;
                v78 = __n;
              }
              while (__n < 0);
            }
            else
            {
              v78 = 0;
            }
          }
          if ((int)v73 >= 1)
          {
            v145 = 0;
            do
            {
              *v76 = __s[v145];
              if ((_DWORD)v145 + 1 == __n)
              {
                v76[1] = 46;
                v76 += 2;
              }
              else
              {
                ++v76;
              }
              ++v145;
            }
            while ((v73 - 1) + 1 != v145);
            v78 = __n;
          }
          if ((int)v73 < v78)
          {
            do
            {
              v146 = v76;
              LODWORD(v73) = v73 + 1;
              *v76++ = 48;
            }
            while ((int)v73 < __n);
            *v76 = 46;
            v76 = v146 + 2;
          }
        }
        else
        {
          --__n;
          *v76 = __s[0];
          v82 = v76 + 2;
          v76[1] = 46;
          if ((int)v73 > 1)
          {
            v170 = v78;
            memcpy(v82, &__s[1], (v73 - 1));
            v78 = v170;
            v82 = &v76[(v73 - 2) + 3];
          }
          *v82 = 101;
          if (v78 < 1)
          {
            __n = 1 - v78;
            v83 = 45;
          }
          else
          {
            v83 = 43;
          }
          v82[1] = v83;
          v138 = __n;
          if (__n < 100)
          {
            v139 = v82 + 2;
          }
          else
          {
            v139 = v82 + 3;
            v82[2] = __n / 0x64u + 48;
            v138 = __n;
          }
          if (v138 >= 10)
          {
            *v139++ = ((103 * (v138 % 0x64u)) >> 10) | 0x30;
            v138 = __n;
          }
          *v139 = v138 % 10 + 48;
          v76 = v139 + 1;
        }
        v147 = v76 - 1;
        if (*(v76 - 1) != 46 || v16 != 0)
          v147 = v76;
        *v147 = 0;
        v149 = 32 * (v14 != 0);
        if (v15)
          v149 = 43;
        if (__n_5[0] == 45)
          v103 = 45;
        else
          v103 = v149;
        if (__n_5[0] == 45)
          p_n_4 = &__n_6;
        else
          p_n_4 = __n_5;
        v150 = strlen(p_n_4);
        v180 = v150;
        if (v16)
        {
          v151 = v150;
          if (!strchr(p_n_4, 46))
          {
            v180 = v151 + 1;
            *(_WORD *)&p_n_4[v151] = 46;
          }
        }
        v41 = flush_func;
        if (*fmt == 71)
        {
          v152 = strchr(p_n_4, 101);
          if (v152)
            *v152 = 69;
        }
        goto LABEL_348;
      }
      if (v37 != 88)
        goto LABEL_137;
LABEL_94:
      if (v33)
      {
        v65 = (unint64_t *)v181;
        v181 += 8;
        v66 = *v65;
        v67 = "0123456789abcdef";
        if (*fmt == 88)
          v67 = "0123456789ABCDEF";
        if (HIDWORD(v66))
        {
          p_n_4 = &v187[3];
          v41 = flush_func;
          do
          {
            *--p_n_4 = v67[v66 & 0xF];
            v68 = v66 >= 0x10;
            v66 >>= 4;
          }
          while (v68);
        }
        else
        {
          p_n_4 = &v187[3];
          v41 = flush_func;
          do
          {
            *--p_n_4 = v67[v66 & 0xF];
            v68 = v66 >= 0x10;
            LODWORD(v66) = v66 >> 4;
          }
          while (v68);
        }
      }
      else
      {
        v105 = (unsigned int *)v181;
        v181 += 8;
        v106 = *v105;
        if ((_DWORD)v36)
          v106 = (unsigned __int16)v106;
        v107 = "0123456789abcdef";
        if (*fmt == 88)
          v107 = "0123456789ABCDEF";
        v172 = v106;
        p_n_4 = &v187[3];
        do
        {
          *--p_n_4 = v107[v106 & 0xF];
          v79 = v106 > 0xF;
          v106 >>= 4;
        }
        while (v79);
        v41 = flush_func;
      }
      v180 = &v187[3] - p_n_4;
      if ((v17 & 1) != 0)
        goto LABEL_259;
      v134 = 511;
      if (v174 + 1 < 0x200)
        v134 = v174;
      if (&v187[3] - p_n_4 >= v134)
      {
LABEL_259:
        v42 = v177;
      }
      else
      {
        v42 = v177;
        do
        {
          *--p_n_4 = 48;
          ++v180;
        }
        while (v180 < v134);
      }
      LOBYTE(v36) = 0;
      if (v16 && v172)
      {
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        v135 = *fmt;
        *(p_n_4 - 2) = 48;
        p_n_4 -= 2;
        p_n_4[1] = v135;
        v136 = v180 + 2;
LABEL_304:
        v180 = v136;
      }
      else
      {
        LOBYTE(v16) = 0;
      }
      goto LABEL_384;
  }
LABEL_380:
  LOBYTE(v16) = 0;
  LOBYTE(v36) = v103 != 0;
  if (v103 && p_n_4 != "(null)")
  {
    LOBYTE(v16) = 0;
    *--p_n_4 = v103;
    ++v180;
    LOBYTE(v36) = 1;
  }
  v5 = v171;
LABEL_384:
  v165 = v180;
  if (!v176)
  {
    v55 = endpos;
LABEL_405:
    if (v165)
      v167 = v16;
    else
      v167 = 1;
    if ((v167 & 1) == 0)
    {
      v8 += v165;
      do
      {
        if (curpos)
        {
          if (curpos >= v55)
          {
            v5->curpos = curpos;
            if (((unsigned int (*)(apr_vformatter_buff_t *, uint64_t))v41)(v5, v17))
              return -1;
            curpos = v5->curpos;
            v55 = v5->endpos;
          }
          *curpos++ = *p_n_4;
        }
        ++p_n_4;
        --v165;
      }
      while (v165);
      v165 = v180;
    }
    if (v176 && !v177)
    {
      while (v6 > v165)
      {
        if (curpos)
        {
          if (curpos >= v55)
          {
            v5->curpos = curpos;
            if (((unsigned int (*)(apr_vformatter_buff_t *, uint64_t))v41)(v5, v17))
              return -1;
            curpos = v5->curpos;
            v55 = v5->endpos;
          }
          *curpos++ = v18;
          v165 = v180;
        }
        ++v8;
        --v6;
      }
    }
    goto LABEL_426;
  }
  v35 = v42 == 1;
  v55 = endpos;
  if (!v35 || v6 <= v180)
    goto LABEL_405;
  v166 = v36 ^ 1;
  if (v18 != 48)
    v166 = 1;
  if ((v166 & 1) != 0)
  {
    do
    {
LABEL_397:
      if (curpos)
      {
        if (curpos >= v55)
        {
          v5->curpos = curpos;
          if (((unsigned int (*)(apr_vformatter_buff_t *, uint64_t))v41)(v5, v17))
            return -1;
          curpos = v5->curpos;
          v55 = v5->endpos;
        }
        *curpos++ = v18;
        v165 = v180;
      }
      ++v8;
      --v6;
    }
    while (v6 > v165);
    goto LABEL_405;
  }
  if (!curpos)
    goto LABEL_396;
  if (curpos < endpos)
    goto LABEL_395;
  v5->curpos = curpos;
  if (!((unsigned int (*)(apr_vformatter_buff_t *, uint64_t))v41)(v5, v17))
  {
    curpos = v5->curpos;
    v55 = v5->endpos;
LABEL_395:
    *curpos++ = *p_n_4;
    v165 = v180;
LABEL_396:
    ++v8;
    ++p_n_4;
    v180 = --v165;
    --v6;
    goto LABEL_397;
  }
  return -1;
}

uint64_t conv_10_quad(unint64_t a1, int a2, _DWORD *a3, uint64_t a4, _QWORD *a5)
{
  int v5;
  int v6;
  unsigned int v7;
  uint64_t result;
  BOOL v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  BOOL v13;

  if ((HIDWORD(a1) || !a2) && (a1 != (int)a1 || a2))
  {
    if ((a1 & 0x8000000000000000) == 0)
      v10 = a1;
    else
      v10 = -(uint64_t)a1;
    if (a2)
      v11 = 0;
    else
      v11 = a1 >> 63;
    if (a2)
      v12 = a1;
    else
      v12 = v10;
    *a3 = v11;
    result = a4;
    do
    {
      *(_BYTE *)--result = v12 % 0xA + 48;
      v13 = v12 > 9;
      v12 /= 0xAuLL;
    }
    while (v13);
  }
  else
  {
    if ((a1 & 0x80000000) == 0)
      v5 = a1;
    else
      v5 = -(int)a1;
    if (a2)
      v6 = 0;
    else
      v6 = (a1 >> 31) & 1;
    if (a2)
      v7 = a1;
    else
      v7 = v5;
    *a3 = v6;
    result = a4;
    do
    {
      *(_BYTE *)--result = v7 % 0xA + 48;
      v9 = v7 >= 0xA;
      v7 /= 0xAu;
    }
    while (v9);
  }
  *a5 = a4 - result;
  return result;
}

char *apr_cvt(int a1, int *a2, _DWORD *a3, int a4, char *a5, long double a6)
{
  int v9;
  double v10;
  double v11;
  double v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  unint64_t v19;
  char *v20;
  double v21;
  int v22;
  uint64_t v23;
  char *v25;
  int v26;
  char *v27;
  char v28;
  char v29;
  double v31;
  double __y;

  if (a1 >= 78)
    v9 = 78;
  else
    v9 = a1;
  *a3 = 0;
  if (a6 < 0.0)
  {
    *a3 = 1;
    a6 = -a6;
  }
  v31 = 0.0;
  __y = 0.0;
  v10 = modf(a6, &__y);
  v11 = v10;
  v12 = __y;
  if (__y == 0.0)
  {
    if (v10 > 0.0)
    {
      v13 = 1;
      do
      {
        v21 = v11;
        v11 = v11 * 10.0;
        --v13;
      }
      while (v11 < 1.0);
      v19 = 0;
      v31 = v11;
      v11 = v21;
      goto LABEL_20;
    }
    v13 = 0;
  }
  else
  {
    v13 = 0;
    v14 = 80;
    v15 = 1;
    do
    {
      v16 = v14;
      v17 = v15;
      v18 = modf(v12 / 10.0, &__y);
      ++v13;
      v14 = v16 - 1;
      a5[v16 - 1] = (int)((v18 + 0.03) * 10.0) + 48;
      if (v16 == 1)
        break;
      v12 = __y;
      v15 = v17 + 1;
    }
    while (__y != 0.0);
    v31 = v18;
    if (v16 <= 80)
    {
      v19 = 81 - v16;
      v20 = a5;
      do
      {
        *v20 = v20[v14];
        ++v20;
        --v17;
      }
      while (v17);
      goto LABEL_20;
    }
  }
  v19 = 0;
LABEL_20:
  if (a4)
    v22 = 0;
  else
    v22 = v13;
  v23 = v22 + (uint64_t)v9;
  if (v23 < 0)
  {
    *a2 = -v9;
    v27 = a5;
  }
  else
  {
    *a2 = v13;
    if ((uint64_t)v19 <= v23 && v19 <= 0x4F)
    {
      do
      {
        v11 = modf(v11 * 10.0, &v31);
        a5[v19] = (int)v31 + 48;
        if ((uint64_t)v19 >= v23)
          break;
      }
      while (v19++ < 0x4F);
    }
    if (v23 >= 80)
    {
      v27 = a5 + 79;
    }
    else
    {
      v25 = &a5[v23];
      v26 = (char)(a5[v23] + 5);
      a5[v23] += 5;
      if (v26 < 58)
      {
        v27 = &a5[v23];
      }
      else
      {
        v27 = &a5[v23];
        do
        {
          *v25 = 48;
          if (v25 <= a5)
          {
            *v25 = 49;
            ++*a2;
            if (!a4)
            {
              if (v27 > a5)
                *v27 = 48;
              ++v27;
            }
            v29 = *v25;
          }
          else
          {
            v28 = *--v25;
            v29 = v28 + 1;
            *v25 = v28 + 1;
          }
        }
        while (v29 > 57);
      }
    }
  }
  *v27 = 0;
  return a5;
}

int apr_snprintf(char *buf, apr_size_t len, const char *format, ...)
{
  char *v4;
  char *v5;
  int result;
  apr_vformatter_buff_t c;
  va_list v8;
  va_list va;

  va_start(va, format);
  v4 = &buf[len - 1];
  if (len)
    v5 = buf;
  else
    v5 = 0;
  if (!len)
    v4 = 0;
  c.curpos = v5;
  c.endpos = v4;
  va_copy(v8, va);
  result = apr_vformatter((int (__cdecl *)(apr_vformatter_buff_t *))snprintf_flush, &c, format, va);
  if (len)
    *c.curpos = 0;
  if (result == -1)
    return len - 1;
  return result;
}

uint64_t snprintf_flush()
{
  return 0xFFFFFFFFLL;
}

int apr_vsnprintf(char *buf, apr_size_t len, const char *format, va_list ap)
{
  int v4;
  int result;
  apr_vformatter_buff_t v6;

  v4 = len;
  if (len)
  {
    v6.curpos = buf;
    v6.endpos = &buf[len - 1];
    result = apr_vformatter((int (__cdecl *)(apr_vformatter_buff_t *))snprintf_flush, &v6, format, ap);
    *v6.curpos = 0;
  }
  else
  {
    v6.curpos = 0;
    v6.endpos = 0;
    result = apr_vformatter((int (__cdecl *)(apr_vformatter_buff_t *))snprintf_flush, &v6, format, ap);
  }
  if (result == -1)
    return v4 - 1;
  return result;
}

char *__cdecl apr_pstrdup(apr_pool_t *p, const char *s)
{
  apr_size_t v4;
  void *v5;

  if (!s)
    return 0;
  v4 = strlen(s) + 1;
  v5 = apr_palloc(p, v4);
  memcpy(v5, s, v4);
  return (char *)v5;
}

void *__cdecl apr_pmemdup(apr_pool_t *p, const void *m, apr_size_t n)
{
  void *v5;

  if (!m)
    return 0;
  v5 = apr_palloc(p, n);
  memcpy(v5, m, n);
  return v5;
}

char *__cdecl apr_pstrndup(apr_pool_t *p, const char *s, apr_size_t n)
{
  size_t v3;
  _BYTE *v6;
  void *v7;

  if (!s)
    return 0;
  v3 = n;
  v6 = memchr((void *)s, 0, n);
  if (v6)
    v3 = v6 - s;
  v7 = apr_palloc(p, v3 + 1);
  memcpy(v7, s, v3);
  *((_BYTE *)v7 + v3) = 0;
  return (char *)v7;
}

char *__cdecl apr_pstrmemdup(apr_pool_t *p, const char *s, apr_size_t n)
{
  void *v5;

  if (!s)
    return 0;
  v5 = apr_palloc(p, n + 1);
  memcpy(v5, s, n);
  *((_BYTE *)v5 + n) = 0;
  return (char *)v5;
}

char *apr_pstrcat(apr_pool_t *p, ...)
{
  const char *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  size_t v6;
  const char *v7;
  apr_size_t v8;
  char *v9;
  char *v10;
  char *v11;
  int v12;
  size_t v13;
  const char **v14;
  va_list v16;
  va_list v17;
  _OWORD v18[3];
  uint64_t v19;
  char *__s;
  va_list va;

  va_start(va, p);
  __s = va_arg(va, char *);
  v19 = *MEMORY[0x24BDAC8D0];
  memset(v18, 0, sizeof(v18));
  va_copy(v16, va);
  v2 = __s;
  if (__s)
  {
    v3 = 0;
    v4 = 0;
    v5 = __s;
    do
    {
      v6 = strlen(v5);
      if (v4 <= 5)
        *((_QWORD *)v18 + v4++) = v6;
      v3 += v6;
      v7 = va_arg(v16, const char *);
      v5 = v7;
    }
    while (v7);
    v8 = v3 + 1;
  }
  else
  {
    v8 = 1;
  }
  v9 = (char *)apr_palloc(p, v8);
  v10 = v9;
  va_copy(v17, va);
  v11 = v9;
  if (__s)
  {
    v12 = 0;
    v11 = v9;
    do
    {
      if (v12 > 5)
        v13 = strlen(v2);
      else
        v13 = *((_QWORD *)v18 + v12++);
      memcpy(v11, v2, v13);
      v11 += v13;
      v14 = (const char **)v17;
      v17 += 8;
      v2 = *v14;
    }
    while (*v14);
  }
  *v11 = 0;
  return v10;
}

char *__cdecl apr_pstrcatv(apr_pool_t *p, const iovec *vec, apr_size_t nvec, apr_size_t *nbytes)
{
  apr_size_t v4;
  const iovec *v5;
  apr_size_t v6;
  size_t *p_iov_len;
  apr_size_t v8;
  size_t v9;
  char *v10;
  char *v11;
  char *v12;

  v4 = nvec;
  v5 = vec;
  v6 = 0;
  if (nvec)
  {
    p_iov_len = &vec->iov_len;
    v8 = nvec;
    do
    {
      v9 = *p_iov_len;
      p_iov_len += 2;
      v6 += v9;
      --v8;
    }
    while (v8);
  }
  if (nbytes)
    *nbytes = v6;
  v10 = (char *)apr_palloc(p, v6 + 1);
  v11 = v10;
  v12 = v10;
  if (v4)
  {
    v12 = v10;
    do
    {
      memcpy(v12, v5->iov_base, v5->iov_len);
      v12 += v5->iov_len;
      ++v5;
      --v4;
    }
    while (v4);
  }
  *v12 = 0;
  return v11;
}

apr_status_t apr_strtoff(apr_off_t *offset, const char *buf, char **end, int base)
{
  *__error() = 0;
  *offset = strtol(buf, end, base);
  return *__error();
}

apr_int64_t apr_strtoi64(const char *buf, char **end, int base)
{
  *__error() = 0;
  return strtol(buf, end, base);
}

apr_int64_t apr_atoi64(const char *buf)
{
  *__error() = 0;
  return strtol(buf, 0, 10);
}

char *__cdecl apr_itoa(apr_pool_t *p, int n)
{
  _BYTE *v3;
  unsigned int v4;
  char *v5;
  char *result;
  BOOL v7;

  v3 = apr_palloc(p, 0xEuLL);
  if (n >= 0)
    v4 = n;
  else
    v4 = -n;
  v3[13] = 0;
  v5 = v3 + 14;
  do
  {
    *(v5 - 2) = (v4 % 0xA) | 0x30;
    result = v5 - 2;
    --v5;
    v7 = v4 > 9;
    v4 /= 0xAu;
  }
  while (v7);
  if (n < 0)
  {
    *(v5 - 2) = 45;
    return v5 - 2;
  }
  return result;
}

char *__cdecl apr_ltoa(apr_pool_t *p, uint64_t n)
{
  _BYTE *v3;
  unint64_t v4;
  char *v5;
  char *result;
  BOOL v7;

  v3 = apr_palloc(p, 0x1AuLL);
  if (n >= 0)
    v4 = n;
  else
    v4 = -n;
  v3[25] = 0;
  v5 = v3 + 26;
  do
  {
    *(v5 - 2) = (v4 % 0xA) | 0x30;
    result = v5 - 2;
    --v5;
    v7 = v4 > 9;
    v4 /= 0xAuLL;
  }
  while (v7);
  if (n < 0)
  {
    *(v5 - 2) = 45;
    return v5 - 2;
  }
  return result;
}

char *__cdecl apr_off_t_toa(apr_pool_t *p, apr_off_t n)
{
  _BYTE *v3;
  unint64_t v4;
  char *v5;
  char *result;
  BOOL v7;

  v3 = apr_palloc(p, 0x1AuLL);
  if (n >= 0)
    v4 = n;
  else
    v4 = -n;
  v3[25] = 0;
  v5 = v3 + 26;
  do
  {
    *(v5 - 2) = (v4 % 0xA) | 0x30;
    result = v5 - 2;
    --v5;
    v7 = v4 > 9;
    v4 /= 0xAuLL;
  }
  while (v7);
  if (n < 0)
  {
    *(v5 - 2) = 45;
    return v5 - 2;
  }
  return result;
}

char *__cdecl apr_strfsize(apr_off_t size, char *buf)
{
  int v3;
  const char *v4;
  char *v5;
  __int16 v6;
  unsigned int v7;

  if (size < 0)
  {
    v4 = "  - ";
LABEL_14:
    *(_DWORD *)buf = *(_DWORD *)v4;
    buf[4] = v4[4];
    return buf;
  }
  if ((unint64_t)size >= 0x3CD)
  {
    v5 = "";
    do
    {
      v6 = size;
      size = (unint64_t)size >> 10;
      ++v5;
    }
    while ((unint64_t)size > 0x3CC);
    v7 = v6 & 0x3FF;
    if ((unint64_t)size < 9 || size == 9 && v7 <= 0x3CC)
      v3 = apr_snprintf(buf, 5uLL, "%d.%d%c");
    else
      v3 = apr_snprintf(buf, 5uLL, "%3d%c");
  }
  else
  {
    v3 = apr_snprintf(buf, 5uLL, "%3d ");
  }
  if (v3 < 0)
  {
    v4 = "****";
    goto LABEL_14;
  }
  return buf;
}

apr_status_t apr_proc_kill(apr_proc_t *proc, int sig)
{
  if (kill(proc->pid, sig) == -1)
    return *__error();
  else
    return 0;
}

apr_sigfunc_t *__cdecl apr_signal(int signo, apr_sigfunc_t *func)
{
  sigaction v3;
  sigaction v4;

  v3.__sigaction_u.__sa_handler = 0;
  *(_QWORD *)&v3.sa_mask = 0;
  v4.__sigaction_u.__sa_handler = func;
  *(_QWORD *)&v4.sa_mask = 0;
  if (sigaction(signo, &v4, &v3) < 0)
    return (apr_sigfunc_t *)-1;
  else
    return v3.__sigaction_u.__sa_handler;
}

const char *__cdecl apr_signal_description_get(int signum)
{
  if (signum < 0)
    return "unknown signal (number)";
  else
    return *(const char **)(MEMORY[0x24BDB00E0] + 8 * signum);
}

apr_status_t apr_signal_thread(int (__cdecl *signal_handler)(int))
{
  int v3;
  sigset_t v4;

  v4 = -1074077689;
  do
  {
    v3 = 0;
    sigwait(&v4, &v3);
  }
  while (((unsigned int (*)(_QWORD))signal_handler)(v3) != 1);
  return 0;
}

apr_status_t apr_setup_signal_thread(void)
{
  sigset_t v1;

  v1 = -1073749753;
  return pthread_sigmask(3, &v1, 0);
}

apr_status_t apr_signal_block(int signum)
{
  sigset_t v1;
  sigset_t v3;

  v1 = 1 << (signum - 1);
  if (signum > 32)
    v1 = 0;
  v3 = v1;
  return pthread_sigmask(1, &v3, 0);
}

apr_status_t apr_signal_unblock(int signum)
{
  sigset_t v1;
  sigset_t v3;

  v1 = 1 << (signum - 1);
  if (signum > 32)
    v1 = 0;
  v3 = v1;
  return pthread_sigmask(2, &v3, 0);
}

apr_status_t apr_thread_mutex_create(apr_thread_mutex_t **mutex, unsigned int flags, apr_pool_t *pool)
{
  char v4;
  char *v6;
  char *v7;
  apr_status_t v8;
  int v9;
  pthread_mutexattr_t v11;
  uint64_t v12;

  v4 = flags;
  v12 = *MEMORY[0x24BDAC8D0];
  v6 = (char *)apr_palloc(pool, 0x48uLL);
  v7 = v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 56) = 0u;
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 24) = 0u;
    *(_OWORD *)(v6 + 8) = 0u;
  }
  *(_QWORD *)v6 = pool;
  if ((v4 & 1) != 0)
  {
    v11.__sig = 0;
    *(_QWORD *)v11.__opaque = 0;
    v8 = pthread_mutexattr_init(&v11);
    if (v8)
      return v8;
    v9 = pthread_mutexattr_settype(&v11, 2);
    if (v9)
    {
      v8 = v9;
      pthread_mutexattr_destroy(&v11);
      return v8;
    }
    v8 = pthread_mutex_init((pthread_mutex_t *)(v7 + 8), &v11);
    pthread_mutexattr_destroy(&v11);
    if (v8)
      return v8;
    goto LABEL_5;
  }
  v8 = pthread_mutex_init((pthread_mutex_t *)(v6 + 8), 0);
  if (!v8)
  {
LABEL_5:
    apr_pool_cleanup_register(*(apr_pool_t **)v7, v7, (apr_status_t (__cdecl *)(void *))thread_mutex_cleanup, apr_pool_cleanup_null);
    *mutex = (apr_thread_mutex_t *)v7;
  }
  return v8;
}

uint64_t thread_mutex_cleanup(uint64_t a1)
{
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
}

apr_status_t apr_thread_mutex_lock(apr_thread_mutex_t *mutex)
{
  return pthread_mutex_lock((pthread_mutex_t *)((char *)mutex + 8));
}

apr_status_t apr_thread_mutex_trylock(apr_thread_mutex_t *mutex)
{
  apr_status_t result;

  result = pthread_mutex_trylock((pthread_mutex_t *)((char *)mutex + 8));
  if (result == 16)
    return 70025;
  return result;
}

apr_status_t apr_thread_mutex_unlock(apr_thread_mutex_t *mutex)
{
  return pthread_mutex_unlock((pthread_mutex_t *)((char *)mutex + 8));
}

apr_status_t apr_thread_mutex_destroy(apr_thread_mutex_t *mutex)
{
  pthread_mutex_t *v1;

  v1 = (pthread_mutex_t *)((char *)mutex + 8);
  apr_pool_cleanup_kill(*(apr_pool_t **)mutex, mutex, (apr_status_t (__cdecl *)(void *))thread_mutex_cleanup);
  return pthread_mutex_destroy(v1);
}

apr_pool_t *__cdecl apr_thread_mutex_pool_get(const apr_thread_mutex_t *thethread_mutex)
{
  return *(apr_pool_t **)thethread_mutex;
}

apr_status_t apr_time_ansi_put(apr_time_t *result, time_t input)
{
  *result = 1000000 * input;
  return 0;
}

apr_time_t apr_time_now(void)
{
  timeval v1;

  v1.tv_sec = 0;
  *(_QWORD *)&v1.tv_usec = 0;
  gettimeofday(&v1, 0);
  return v1.tv_usec + 1000000 * v1.tv_sec;
}

apr_status_t apr_time_exp_tz(apr_time_exp_t *result, apr_time_t input, apr_int32_t offs)
{
  explode_time((uint64_t)result, input, offs, 0);
  result->tm_gmtoff = offs;
  return 0;
}

double explode_time(uint64_t a1, uint64_t a2, int a3, int a4)
{
  double result;
  __int128 v6;
  int tm_gmtoff;
  time_t v8;
  tm v9;

  memset(&v9, 0, sizeof(v9));
  v8 = a2 / 1000000 + a3;
  *(_DWORD *)a1 = a2 % 1000000;
  if (a4)
    localtime_r(&v8, &v9);
  else
    gmtime_r(&v8, &v9);
  result = *(double *)&v9.tm_sec;
  v6 = *(_OWORD *)&v9.tm_mon;
  *(_OWORD *)(a1 + 4) = *(_OWORD *)&v9.tm_sec;
  *(_OWORD *)(a1 + 20) = v6;
  tm_gmtoff = v9.tm_gmtoff;
  *(_DWORD *)(a1 + 36) = v9.tm_isdst;
  *(_DWORD *)(a1 + 40) = tm_gmtoff;
  return result;
}

apr_status_t apr_time_exp_gmt(apr_time_exp_t *result, apr_time_t input)
{
  __int128 v3;
  time_t v5;
  tm v6;

  memset(&v6, 0, sizeof(v6));
  v5 = input / 1000000;
  result->tm_usec = input % 1000000;
  gmtime_r(&v5, &v6);
  v3 = *(_OWORD *)&v6.tm_mon;
  *(_OWORD *)&result->tm_sec = *(_OWORD *)&v6.tm_sec;
  *(_OWORD *)&result->tm_mon = v3;
  *(_QWORD *)&result->tm_isdst = v6.tm_isdst;
  return 0;
}

apr_status_t apr_time_exp_lt(apr_time_exp_t *result, apr_time_t input)
{
  __int128 v3;
  apr_int32_t tm_gmtoff;
  time_t v6;
  tm v7;

  memset(&v7, 0, sizeof(v7));
  v6 = input / 1000000;
  result->tm_usec = input % 1000000;
  localtime_r(&v6, &v7);
  v3 = *(_OWORD *)&v7.tm_mon;
  *(_OWORD *)&result->tm_sec = *(_OWORD *)&v7.tm_sec;
  *(_OWORD *)&result->tm_mon = v3;
  tm_gmtoff = v7.tm_gmtoff;
  result->tm_isdst = v7.tm_isdst;
  result->tm_gmtoff = tm_gmtoff;
  return 0;
}

apr_status_t apr_time_exp_get(apr_time_t *result, apr_time_exp_t *input)
{
  uint64_t tm_mon;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  apr_status_t v9;

  tm_mon = input->tm_mon;
  if (tm_mon > 0xB)
    return 20004;
  v3 = input->tm_year - (unint64_t)(tm_mon < 2);
  v4 = v3 + 3;
  if (v3 >= 0)
    v4 = input->tm_year - (unint64_t)(tm_mon < 2);
  v5 = 365 * v3 + (v4 >> 2) - v3 / 100;
  v6 = v3 / 100 + 3;
  v7 = v3 / 100 + 6;
  if ((int)((uint64_t)(input->tm_year - (unint64_t)(tm_mon < 2)) / 100) >= -3)
    v7 = v6;
  v8 = input->tm_sec
     + 60
     * (input->tm_min
      + 60 * (input->tm_hour + 24 * (v5 + apr_time_exp_get_dayoffset[tm_mon] + input->tm_mday - 1 + (v7 >> 2))))
     - 2203891200;
  if (v8 < 0)
    return 20004;
  v9 = 0;
  *result = input->tm_usec + 1000000 * v8;
  return v9;
}

apr_status_t apr_time_exp_gmt_get(apr_time_t *result, apr_time_exp_t *input)
{
  apr_status_t v4;

  v4 = apr_time_exp_get(result, input);
  if (!v4)
    *result -= 1000000 * input->tm_gmtoff;
  return v4;
}

apr_status_t apr_os_imp_time_get(apr_os_imp_time_t **ostime, apr_time_t *aprtime)
{
  apr_time_t v2;
  apr_os_imp_time_t *v3;

  v2 = *aprtime / 1000000;
  v3 = *ostime;
  v3->tv_usec = *aprtime % 1000000;
  v3->tv_sec = v2;
  return 0;
}

apr_status_t apr_os_exp_time_get(apr_os_exp_time_t **ostime, apr_time_exp_t *aprtime)
{
  apr_os_exp_time_t *v2;
  uint64_t tm_gmtoff;

  v2 = *ostime;
  *(_OWORD *)&v2->tm_sec = *(_OWORD *)&aprtime->tm_sec;
  *(_OWORD *)&v2->tm_mon = *(_OWORD *)&aprtime->tm_mon;
  tm_gmtoff = aprtime->tm_gmtoff;
  v2->tm_isdst = aprtime->tm_isdst;
  v2->tm_gmtoff = tm_gmtoff;
  return 0;
}

apr_status_t apr_os_imp_time_put(apr_time_t *aprtime, apr_os_imp_time_t **ostime, apr_pool_t *cont)
{
  *aprtime = (*ostime)->tv_usec + 1000000 * (*ostime)->tv_sec;
  return 0;
}

apr_status_t apr_os_exp_time_put(apr_time_exp_t *aprtime, apr_os_exp_time_t **ostime, apr_pool_t *cont)
{
  apr_os_exp_time_t *v3;
  apr_int32_t tm_isdst;
  uint64_t tm_gmtoff;

  v3 = *ostime;
  *(_OWORD *)&aprtime->tm_sec = *(_OWORD *)&(*ostime)->tm_sec;
  *(_OWORD *)&aprtime->tm_mon = *(_OWORD *)&v3->tm_mon;
  tm_isdst = v3->tm_isdst;
  tm_gmtoff = v3->tm_gmtoff;
  aprtime->tm_isdst = tm_isdst;
  aprtime->tm_gmtoff = tm_gmtoff;
  return 0;
}

void apr_sleep(apr_interval_time_t t)
{
  timeval v1;

  v1.tv_sec = t / 1000000;
  *(_QWORD *)&v1.tv_usec = (t % 1000000);
  select(0, 0, 0, 0, &v1);
}

id gt_default_log()
{
  void *v0;

  v0 = (void *)s_defaultLog;
  if (s_defaultLog == MEMORY[0x24BDACB70])
  {
    if (gt_default_log_onceToken != -1)
      dispatch_once(&gt_default_log_onceToken, &__block_literal_global_13);
    v0 = (void *)s_defaultLog;
  }
  return v0;
}

void __gt_default_log_block_invoke()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_23C6D4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "GPUTOOLS(warning): Log uninitialized, please call GTCoreLogInit(), logging to OS_LOG_DEFAULT instead", v0, 2u);
  }
}

id gt_tagged_log(unint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  NSObject *v5;
  FILE *v6;
  id v7;
  id v8;
  uint8_t buf[16];
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (s_logCount <= a1)
  {
    if (s_logUsingOsLog)
    {
      gt_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = a1;
        _os_log_fault_impl(&dword_23C6D4000, v5, OS_LOG_TYPE_FAULT, "fail: Invalid log tag: %llu", buf, 0xCu);
      }

    }
    else
    {
      v6 = (FILE *)*MEMORY[0x24BDAC8D8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("fail: Invalid log tag: %llu"), a1);
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      fprintf(v6, "%s\n", (const char *)objc_msgSend(v7, "UTF8String"));

    }
    v4 = (id)MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    *(_OWORD *)buf = 0u;
    v11 = 0u;
    __copy_constructor_8_8_s0_s8_s16_s24(buf, (id *)(s_logs + 32 * a1));
    v2 = GTCoreLog_enabled((uint64_t)buf);
    v3 = (void *)*((_QWORD *)&v11 + 1);
    if (!v2)
      v3 = (void *)MEMORY[0x24BDACB78];
    v4 = v3;
    __destructor_8_s0_s8_s16_s24((id *)buf);
  }
  return v4;
}

id __copy_constructor_8_8_s0_s8_s16_s24(_QWORD *a1, id *a2)
{
  id result;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  result = a2[3];
  a1[3] = result;
  return result;
}

uint64_t GTCoreLog_enabled(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  if (!*(_QWORD *)(a1 + 16))
    return 1;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", *(_QWORD *)(a1 + 16));

  return v3;
}

void __destructor_8_s0_s8_s16_s24(id *a1)
{

}

uint64_t GTCoreLogUseOsLog()
{
  return s_logUsingOsLog;
}

void GTCoreLogInit(const char *a1, uint64_t a2, int a3)
{
  NSObject *v3;
  const char *v6;
  os_log_t v7;
  void *v8;
  _QWORD *v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  os_log_t v28;
  void *v29;
  FILE *v30;
  void *v31;
  char v32;
  os_log_t v33;
  void *v34;
  FILE *v35;
  id v36;
  id v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (s_defaultLog == MEMORY[0x24BDACB70])
  {
    v6 = a1;
    v7 = os_log_create(a1, "");
    v8 = (void *)s_defaultLog;
    s_defaultLog = (uint64_t)v7;

    v9 = &unk_256BC8000;
    s_logs = (uint64_t)malloc_type_calloc(a3, 0x20uLL, 0x8004018A671A6uLL);
    s_logCount = a3;
    if (a3 >= 1)
    {
      v10 = 0;
      v11 = a3;
      v12 = a2 + 8;
      v13 = 16;
      v14 = 0x24BDD1000uLL;
      v36 = (id)v11;
      do
      {
        v15 = *(const char **)v12;
        if (v10 == *(char **)(v12 - 8))
        {
          v16 = v6;
          v17 = *(unsigned __int8 *)(v12 + 8);
          v18 = v9[441];
          v19 = v18 + v13;
          v20 = v16;
          objc_msgSend(*(id *)(v14 + 1992), "stringWithUTF8String:");
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = *(void **)(v18 + v13 - 16);
          *(_QWORD *)(v19 - 16) = v21;

          objc_msgSend(*(id *)(v14 + 1992), "stringWithUTF8String:", v15);
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = *(void **)(v18 + v13 - 8);
          *(_QWORD *)(v19 - 8) = v23;

          if (v17)
          {
            objc_msgSend(*(id *)(v14 + 1992), "stringWithFormat:", CFSTR("%@.%@.enableLog"), *(_QWORD *)(v19 - 16), *(_QWORD *)(v19 - 8));
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = *(void **)(v18 + v13);
            *(_QWORD *)(v18 + v13) = v25;
          }
          else
          {
            v26 = *(void **)(v18 + v13);
            *(_QWORD *)(v18 + v13) = 0;
          }

          v6 = v20;
          v28 = os_log_create(v20, v15);
          v29 = *(void **)(v18 + v13 + 8);
          *(_QWORD *)(v18 + v13 + 8) = v28;

          GTCoreLog_enabled(v19 - 16);
          v9 = (_QWORD *)&unk_256BC8000;
          v11 = (unint64_t)v36;
          v14 = 0x24BDD1000;
        }
        else
        {
          if (s_logUsingOsLog)
          {
            gt_default_log();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v39 = v15;
              v40 = 1024;
              v41 = (int)v10;
              _os_log_error_impl(&dword_23C6D4000, v27, OS_LOG_TYPE_ERROR, "warning: Invalid tag ID for %s, %d expected. Falling back to OS_LOG_DEFAULT", buf, 0x12u);
            }
          }
          else
          {
            v30 = (FILE *)*MEMORY[0x24BDAC8D8];
            objc_msgSend(*(id *)(v14 + 1992), "stringWithFormat:", CFSTR("warning: Invalid tag ID for %s, %d expected. Falling back to OS_LOG_DEFAULT"), v15, v10);
            v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            fprintf(v30, "%s\n", (const char *)-[NSObject UTF8String](v27, "UTF8String"));
          }

          objc_storeStrong((id *)(v9[441] + v13 + 8), MEMORY[0x24BDACB70]);
        }
        ++v10;
        v13 += 32;
        v12 += 24;
      }
      while ((char *)v11 != v10);
    }
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "BOOLForKey:", CFSTR("GPUToolsPerfLogging"));

    if ((v32 & 1) != 0)
    {
      v33 = os_log_create(v6, "");
      v34 = (void *)g_signpostLog;
      g_signpostLog = (uint64_t)v33;

    }
  }
  else if (s_logUsingOsLog)
  {
    gt_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v39 = "Log already initialized, did you call GTCoreLogInit twice?";
      _os_log_error_impl(&dword_23C6D4000, v3, OS_LOG_TYPE_ERROR, "warning: %s", buf, 0xCu);
    }

  }
  else
  {
    v35 = (FILE *)*MEMORY[0x24BDAC8D8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("warning: %s"), "Log already initialized, did you call GTCoreLogInit twice?");
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    fprintf(v35, "%s\n", (const char *)objc_msgSend(v37, "UTF8String"));

  }
}

uint64_t GTCoreLogTagEnabled(unint64_t a1)
{
  uint64_t v1;
  _OWORD v3[2];

  if (s_logCount <= a1)
    return 0;
  memset(v3, 0, sizeof(v3));
  __copy_constructor_8_8_s0_s8_s16_s24(v3, (id *)(s_logs + 32 * a1));
  v1 = GTCoreLog_enabled((uint64_t)v3);
  __destructor_8_s0_s8_s16_s24((id *)v3);
  return v1;
}

uint64_t GTCoreLogUseStandardOutputStreams(uint64_t result)
{
  s_logUsingOsLog = result ^ 1;
  return result;
}

void std::vector<GPUTools::FB::Fbuf>::vector(void **a1, char *a2, void **a3)
{
  char *v5;
  void *v6;
  void *v8;
  void *v9;

  v5 = (char *)*a1;
  v6 = a2;
  if (v5 != a2)
  {
    do
    {
      v9 = (void *)*((_QWORD *)v5 - 3);
      v5 -= 24;
      v8 = v9;
      if (v9)
        free(v8);
      *(_QWORD *)v5 = 0;
      *((_QWORD *)v5 + 1) = 0;
      *((_DWORD *)v5 + 4) = 0;
    }
    while (v5 != a2);
    v6 = *a3;
  }
  *a1 = a2;
  operator delete(v6);
}

void _log_assert_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315138;
  v3 = a1;
  _os_log_error_impl(&dword_23C6D4000, a2, OS_LOG_TYPE_ERROR, "Error: %s", (uint8_t *)&v2, 0xCu);
}

void ___log_assert_block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_23C6D4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to create com.apple.gdt.assertions log component", v0, 2u);
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x24BDE5578](retstr, a, b);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x24BDE55C8](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D8](retstr, tx, ty, tz);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x24BDBBA38](bundle);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x24BDBBA40](bundle);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x24BDBBAC0](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x24BDBBAD8]();
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x24BDBBC88](theData, bytes, length);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBBFE8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x24BDBC528](alloc, theString, *(_QWORD *)&encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC530](alloc, data, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x24BDBC590](alloc, buffer);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x24BDBC640](string, buffer, maxBufLen);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x24BDBC668](string);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x24BDBC898](url, resolveAgainstBase, buffer, maxBufLen);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8B78](buffer);
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x24BDD8BA8](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerElementOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8BC8](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8BE0](buffer, planeIndex);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8C58](buffer, planeIndex);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C80](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C88](buffer);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8CE0](buffer, planeIndex);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8D08](buffer, *(_QWORD *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8DD0](buffer, *(_QWORD *)&options, seed);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

int32_t NSVersionOfLinkTimeLibrary(const char *libraryName)
{
  return MEMORY[0x24BDAC4A8](libraryName);
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

uint64_t _CFExecutableLinkedOnOrAfter()
{
  return MEMORY[0x24BDBCFC8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF30]();
}

{
  return MEMORY[0x24BEDAF40]();
}

{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF50]();
}

{
  return MEMORY[0x24BEDAF58]();
}

{
  return MEMORY[0x24BEDAF60]();
}

{
  return MEMORY[0x24BEDAF68]();
}

{
  return MEMORY[0x24BEDAF70]();
}

{
  return MEMORY[0x24BEDAF78]();
}

{
  return MEMORY[0x24BEDAF80]();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return (std::random_device *)MEMORY[0x24BEDAFD8](this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
  MEMORY[0x24BEDAFE0](this);
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return MEMORY[0x24BEDAFE8](this);
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_250D615D0();
}

void operator delete(void *__p)
{
  off_250D615D8(__p);
}

uint64_t operator delete()
{
  return off_250D615E0();
}

uint64_t operator new[]()
{
  return off_250D615E8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_250D615F0(__sz);
}

uint64_t operator new()
{
  return off_250D615F8();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t __udivti3()
{
  return MEMORY[0x24BDAC940]();
}

int __vsprintf_chk(char *a1, int a2, size_t a3, const char *a4, va_list a5)
{
  return MEMORY[0x24BDAC968](a1, *(_QWORD *)&a2, a3, a4, a5);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_nospin_lock_lock()
{
  return MEMORY[0x24BDACBB8]();
}

uint64_t _os_nospin_lock_trylock()
{
  return MEMORY[0x24BDACBC0]();
}

uint64_t _os_nospin_lock_unlock()
{
  return MEMORY[0x24BDACBC8]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAD030](*(_QWORD *)&a1, a2, a3);
}

int access(const char *a1, int a2)
{
  return MEMORY[0x24BDAD038](a1, *(_QWORD *)&a2);
}

int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  return MEMORY[0x24BDAD1C0](client, msg, *(_QWORD *)&level, format);
}

asl_object_t asl_open(const char *ident, const char *facility, uint32_t opts)
{
  return (asl_object_t)MEMORY[0x24BDAD1D0](ident, facility, *(_QWORD *)&opts);
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x24BDAD248](a1);
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x24BDAD288](a1, *(_QWORD *)&a2);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDAD2C8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int chdir(const char *a1)
{
  return MEMORY[0x24BDAD980](a1);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x24BEDCE40](cls, name, imp, types);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x24BEDCE90](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x24BEDCEA0](cls, name);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDADA10](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE0](queue, block);
}

void dispatch_barrier_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADD00](queue, context, work);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

uint64_t dispatch_queue_attr_make_with_overcommit()
{
  return MEMORY[0x24BDADEC0]();
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

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x24BDADF60](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x24BDADF88](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x24BDADFD8](source);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x24BDAE060](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

pid_t fork(void)
{
  return MEMORY[0x24BDAE418]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x24BDAE548](*(_QWORD *)&a1, a2);
}

const char *__cdecl gai_strerror(int a1)
{
  return (const char *)MEMORY[0x24BDAE598](*(_QWORD *)&a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x24BDAE7B8](a1, a2);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x24BDAE978](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int listen(int a1, int a2)
{
  return MEMORY[0x24BDAEA78](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x24BDAEAA0](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x24BDAEB68]();
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x24BDAEB70](*(_QWORD *)&target_task, size, offset, *(_QWORD *)&permission, object_handle, *(_QWORD *)&parent_entry);
}

kern_return_t mach_memory_entry_ownership(mem_entry_name_port_t mem_entry, task_t owner, int ledger_tag, int ledger_flags)
{
  return MEMORY[0x24BDAEB78](*(_QWORD *)&mem_entry, *(_QWORD *)&owner, *(_QWORD *)&ledger_tag, *(_QWORD *)&ledger_flags);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x24BDAED80](memptr, alignment, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x24BEDCF30](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x24BEDCF50](m);
}

IMP method_setImplementation(Method m, IMP imp)
{
  return (IMP)MEMORY[0x24BEDCF58](m, imp);
}

int mkstemp(char *a1)
{
  return MEMORY[0x24BDAEF70](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x24BDAEFB0](__y, __x);
  return result;
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x24BDAF478](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int poll(pollfd *a1, nfds_t a2, int a3)
{
  return MEMORY[0x24BDAF5D8](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF778](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF790](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x24BDAF7A0](a1, *(_QWORD *)&a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
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

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D8](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8E8](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8F0](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x24BDAF908](a1, *(_QWORD *)&a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x24BDAF998](a1);
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x24BDAF9B8](*(_QWORD *)&a1, a2, a3);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x24BDAF9C8](a1, a2);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x24BDAFA20](__base, __nel, __width, __compar);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x24BDAFAB8](__ptr, __size);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFAE0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x24BDAFC00]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x24BEDD500](sel);
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x24BEDD508](str);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x24BDAFC70](*(_QWORD *)&a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFCE8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAFDA0](a1, *(_QWORD *)&a2);
}

int shm_unlink(const char *a1)
{
  return MEMORY[0x24BDAFDA8](a1);
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return MEMORY[0x24BDAFDE8](*(_QWORD *)&a1, a2, a3);
}

int sigwait(const sigset_t *a1, int *a2)
{
  return MEMORY[0x24BDAFE10](a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x24BDAFF00](__dst, __src);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x24BDAFF20](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF30](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFFA8](__s, *(_QWORD *)&__c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

kern_return_t task_suspend(task_read_t target_task)
{
  return MEMORY[0x24BDB01B8](*(_QWORD *)&target_task);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

int unsetenv(const char *a1)
{
  return MEMORY[0x24BDB02D0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0358](a1, a2, a3);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x24BDB0380](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_copy(vm_map_t target_task, vm_address_t source_address, vm_size_t size, vm_address_t dest_address)
{
  return MEMORY[0x24BDB0388](*(_QWORD *)&target_task, source_address, size, dest_address);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x24BDB0390](*(_QWORD *)&target_task, address, size);
}

kern_return_t vm_map(vm_map_t target_task, vm_address_t *address, vm_size_t size, vm_address_t mask, int flags, mem_entry_name_port_t object, vm_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x24BDB03B0](*(_QWORD *)&target_task, address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&object, offset, *(_QWORD *)&copy);
}

kern_return_t vm_protect(vm_map_t target_task, vm_address_t address, vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return MEMORY[0x24BDB03D0](*(_QWORD *)&target_task, address, size, *(_QWORD *)&set_maximum, *(_QWORD *)&new_protection);
}

kern_return_t vm_remap(vm_map_t target_task, vm_address_t *target_address, vm_size_t size, vm_address_t mask, int flags, vm_map_t src_task, vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x24BDB03F8](*(_QWORD *)&target_task, target_address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&src_task, src_address, *(_QWORD *)&copy);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x24BDB0478](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x24BDB0638](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0648]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

const void *__cdecl xpc_array_get_data(xpc_object_t xarray, size_t index, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0668](xarray, index, length);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB06A0](xarray, index);
}

void xpc_array_set_data(xpc_object_t xarray, size_t index, const void *bytes, size_t length)
{
  MEMORY[0x24BDB06A8](xarray, index, bytes, length);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
  MEMORY[0x24BDB06D0](xarray, index, value);
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

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
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

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
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

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x24BDB09F8](connection);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0AC0]();
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

