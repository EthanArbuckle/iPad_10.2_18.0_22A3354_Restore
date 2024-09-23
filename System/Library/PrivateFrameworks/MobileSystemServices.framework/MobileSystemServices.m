void MOLogWrite(uint64_t a1, int a2, uint64_t a3, const __CFString *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  MOLogWriteV(a1, a2, a3, a4, &a9);
}

void MOLogWriteV(uint64_t a1, int a2, uint64_t a3, const __CFString *a4, va_list a5)
{
  char *v10;
  const __CFString *v11;
  const __CFString *v12;
  char *CStringPtr;
  size_t v14;
  CFIndex Length;
  CFIndex Bytes;
  UInt8 *v17;
  CFIndex v18;
  _BOOL4 v19;
  NSObject *v20;
  _QWORD block[8];
  int v22;
  CFIndex usedBufLen;
  CFIndex maxBufLen;
  char __dst[1024];
  uint64_t v26;
  CFRange v27;
  CFRange v28;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = __dst;
  memcpy(__dst, "Error creating CFString", sizeof(__dst));
  v11 = CFStringCreateWithFormatAndArguments(0, 0, a4, a5);
  v12 = v11;
  if (!v11)
    goto LABEL_14;
  CStringPtr = (char *)CFStringGetCStringPtr(v11, 0x8000100u);
  if (!CStringPtr)
  {
    if (CFStringGetCString(v12, __dst, 1024, 0x8000100u))
    {
      v10 = __dst;
      CStringPtr = __dst;
      goto LABEL_6;
    }
    maxBufLen = 0;
    Length = CFStringGetLength(v12);
    v27.location = 0;
    v27.length = Length;
    Bytes = CFStringGetBytes(v12, v27, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
    if (maxBufLen >= 1 && Bytes == Length)
    {
      v17 = (UInt8 *)malloc_type_malloc(maxBufLen + 1, 0x6B5D4F1EuLL);
      if (v17)
      {
        v10 = (char *)v17;
        usedBufLen = 0;
        v28.location = 0;
        v28.length = Length;
        v18 = CFStringGetBytes(v12, v28, 0x8000100u, 0, 0, v17, maxBufLen, &usedBufLen);
        v19 = v18 == Length;
        if (v18 == Length)
        {
          v14 = usedBufLen;
          v10[usedBufLen] = 0;
        }
        else
        {
          free(v10);
          v10 = __dst;
          __strlcpy_chk();
          v14 = 0;
        }
        goto LABEL_16;
      }
    }
    v10 = __dst;
    __strlcpy_chk();
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  v10 = CStringPtr;
LABEL_6:
  v14 = strlen(CStringPtr);
LABEL_15:
  v19 = 0;
LABEL_16:
  pthread_self();
  if (a3)
    asl_log(0, 0, a2, "%p %s: %s\n");
  else
    asl_log(0, 0, a2, "%p %s\n");
  if (a1 && *(_QWORD *)(a1 + 8))
  {
    v20 = *(NSObject **)a1;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = __MOLogWriteV_block_invoke;
    block[3] = &__block_descriptor_tmp_18;
    block[4] = a1;
    block[5] = a3;
    v22 = a2;
    block[6] = v10;
    block[7] = v14;
    dispatch_sync(v20, block);
  }
  if (v19)
    free(v10);
  if (v12)
    CFRelease(v12);
}

_QWORD *MOXPCTransportOpen(const char *a1, unsigned int a2)
{
  NSObject *v4;
  xpc_connection_t mach_service;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _xpc_connection_s *v10;
  _QWORD *v11;
  _QWORD *v12;
  dispatch_semaphore_t v13;
  char v15;
  _QWORD handler[5];
  char v17;
  char __dst[1024];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  memcpy(__dst, "com.apple.MobileSystemServices.XPCConnectionQueue.", sizeof(__dst));
  __strlcat_chk();
  v4 = dispatch_queue_create(__dst, MEMORY[0x1E0C80D50]);
  mach_service = xpc_connection_create_mach_service(a1, v4, a2);
  if (mach_service)
  {
    v10 = mach_service;
    v11 = malloc_type_calloc(1uLL, 0x48uLL, 0x10A004046B7DE22uLL);
    v12 = v11;
    if (v11)
    {
      v11[1] = v10;
      v13 = dispatch_semaphore_create(0);
      v12[2] = v4;
      v12[3] = v13;
      *((_BYTE *)v12 + 64) = v12[8] & 0xFE | a2;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 0x40000000;
      handler[2] = __MOXPCTransportOpen_block_invoke;
      handler[3] = &__block_descriptor_tmp_11;
      handler[4] = v12;
      v17 = a2;
      xpc_connection_set_event_handler(v10, handler);
    }
    else
    {
      xpc_release(v10);
    }
  }
  else
  {
    MOLogWrite(0, 3, (uint64_t)"MOXPCTransportOpen", CFSTR("Failed to create xpc_connection!"), v6, v7, v8, v9, v15);
    return 0;
  }
  return v12;
}

void MOXPCTransportRunTransactionalTask(NSObject *a1, const void *a2)
{
  void *v4;

  MEMORY[0x1E0BFF518]();
  v4 = _Block_copy(a2);
  dispatch_async_f(a1, v4, (dispatch_function_t)transactionRunner);
}

void _HandleIncomingMessage(uint64_t a1, _xpc_connection_s *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  CFTypeID v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  xpc_object_t v23;
  NSObject *v24;
  void *v25;
  const __CFString *v26;
  pthread_mutex_t *v27;
  char v28;
  _QWORD aBlock[7];

  v12 = (const void *)_CFXPCCreateCFObjectFromXPCMessage();
  if (!v12)
  {
    MOLogWrite(0, 3, (uint64_t)"_HandleIncomingMessage", CFSTR("Payload data received from client did not contain a CF object or failed to deserialize."), v13, v14, v15, v16, a9);
    return;
  }
  v17 = v12;
  v18 = CFGetTypeID(v12);
  if (v18 == CFDictionaryGetTypeID())
  {
    if (*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40))
    {
      if ((*(_BYTE *)(a1 + 64) & 1) != 0 && !xpc_connection_get_context(a2))
      {
        xpc_retain(a3);
        xpc_connection_set_context(a2, a3);
      }
      CFRetain(v17);
      v23 = xpc_retain(a2);
      v24 = *(NSObject **)(a1 + 40);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 0x40000000;
      aBlock[2] = ___HandleIncomingMessage_block_invoke;
      aBlock[3] = &__block_descriptor_tmp_40;
      aBlock[4] = a1;
      aBlock[5] = a2;
      aBlock[6] = v17;
      MEMORY[0x1E0BFF518](v23);
      v25 = _Block_copy(aBlock);
      dispatch_async_f(v24, v25, (dispatch_function_t)transactionRunner);
      goto LABEL_16;
    }
    if (*(_QWORD *)a1)
    {
      pthread_mutex_lock(*(pthread_mutex_t **)a1);
      v27 = *(pthread_mutex_t **)a1;
      if (*(_QWORD *)(*(_QWORD *)a1 + 112))
      {
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)a1 + 112), v17);
        pthread_cond_signal((pthread_cond_t *)(*(_QWORD *)a1 + 64));
        v27 = *(pthread_mutex_t **)a1;
      }
      pthread_mutex_unlock(v27);
      goto LABEL_16;
    }
    v26 = CFSTR("No message handler set and no support for receiving messages; dropping message.");
  }
  else
  {
    v26 = CFSTR("Message received was not a CFDictionary");
  }
  MOLogWrite(0, 3, (uint64_t)"_HandleIncomingMessage", v26, v19, v20, v21, v22, v28);
LABEL_16:
  CFRelease(v17);
}

void *MOXPCTransportSetConnectionAuthHandler(uint64_t a1, dispatch_object_t object, void *aBlock)
{
  NSObject *v6;
  const void *v7;
  void *result;

  if ((*(_BYTE *)(a1 + 64) & 2) != 0)
    MOXPCTransportSetConnectionAuthHandler_cold_2();
  if ((*(_BYTE *)(a1 + 64) & 1) == 0)
    MOXPCTransportSetConnectionAuthHandler_cold_1();
  v6 = *(NSObject **)(a1 + 56);
  if (v6)
    dispatch_release(v6);
  v7 = *(const void **)(a1 + 48);
  if (v7)
    _Block_release(v7);
  if (object)
    dispatch_retain(object);
  *(_QWORD *)(a1 + 56) = object;
  if (aBlock)
    result = _Block_copy(aBlock);
  else
    result = 0;
  *(_QWORD *)(a1 + 48) = result;
  return result;
}

void *MOXPCTransportSetMessageHandler(uint64_t a1, dispatch_object_t object, void *aBlock)
{
  NSObject *v6;
  const void *v7;
  void *result;

  if ((*(_BYTE *)(a1 + 64) & 2) != 0)
    MOXPCTransportSetMessageHandler_cold_1();
  v6 = *(NSObject **)(a1 + 40);
  if (v6)
    dispatch_release(v6);
  v7 = *(const void **)(a1 + 32);
  if (v7)
    _Block_release(v7);
  if (object)
    dispatch_retain(object);
  *(_QWORD *)(a1 + 40) = object;
  if (aBlock)
    result = _Block_copy(aBlock);
  else
    result = 0;
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void MOXPCTransportResume(void **a1)
{
  CFMutableArrayRef Mutable;
  pthread_mutex_t *v3;

  if (((_BYTE)a1[8] & 2) == 0)
  {
    *((_BYTE *)a1 + 64) |= 2u;
    if (!a1[4])
    {
      *a1 = malloc_type_malloc(0x78uLL, 0x1020040DDEB3994uLL);
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
      v3 = (pthread_mutex_t *)*a1;
      *(_QWORD *)&v3[1].__opaque[40] = Mutable;
      pthread_mutex_init(v3, 0);
      pthread_cond_init((pthread_cond_t *)((char *)*a1 + 64), 0);
    }
    xpc_connection_resume((xpc_connection_t)a1[1]);
  }
}

void MOXPCTransportClose(uint64_t *a1)
{
  _xpc_connection_s *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  const void *v6;
  NSObject *v7;
  const void *v8;
  NSObject *v9;
  uint64_t v10;
  const void *v11;

  v2 = (_xpc_connection_s *)a1[1];
  if (v2)
  {
    xpc_connection_cancel(v2);
    v3 = a1[3];
    if (v3)
      dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    xpc_release((xpc_object_t)a1[1]);
    a1[1] = 0;
  }
  v4 = a1[2];
  if (v4)
  {
    dispatch_barrier_sync(v4, &__block_literal_global);
    dispatch_release((dispatch_object_t)a1[2]);
    a1[2] = 0;
  }
  v5 = a1[3];
  if (v5)
  {
    dispatch_release(v5);
    a1[3] = 0;
  }
  v6 = (const void *)a1[4];
  if (v6)
  {
    _Block_release(v6);
    a1[4] = 0;
  }
  v7 = a1[5];
  if (v7)
  {
    dispatch_release(v7);
    a1[5] = 0;
  }
  v8 = (const void *)a1[6];
  if (v8)
  {
    _Block_release(v8);
    a1[6] = 0;
  }
  v9 = a1[7];
  if (v9)
  {
    dispatch_release(v9);
    a1[7] = 0;
  }
  v10 = *a1;
  if (*a1)
  {
    v11 = *(const void **)(v10 + 112);
    if (v11)
    {
      CFRelease(v11);
      v10 = *a1;
      *(_QWORD *)(*a1 + 112) = 0;
    }
    pthread_cond_destroy((pthread_cond_t *)(v10 + 64));
    pthread_mutex_destroy((pthread_mutex_t *)*a1);
    free((void *)*a1);
  }
  free(a1);
}

BOOL MOXPCTransportSendMessageOnConnection(_xpc_connection_s *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char v8;

  v6 = (void *)_CFXPCCreateXPCMessageWithCFObject();
  if (v6)
  {
    xpc_connection_send_message(a1, v6);
    xpc_release(v6);
  }
  else
  {
    MOLogWrite(0, 3, (uint64_t)"MOXPCTransportSendMessageOnConnection", CFSTR("Failed to create xpc dictionary"), v2, v3, v4, v5, v8);
  }
  return v6 != 0;
}

BOOL MOXPCTransportSendMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if ((*(_BYTE *)(a1 + 64) & 1) == 0)
    return MOXPCTransportSendMessageOnConnection(*(_xpc_connection_s **)(a1 + 8));
  MOLogWrite(0, 3, (uint64_t)"MOXPCTransportSendMessage", CFSTR("Can't send a message on a server transport handle!"), a5, a6, a7, a8, vars0);
  return 0;
}

const void *MOXPCTransportReceiveMessage(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pthread_mutex_t *v9;
  const void *ValueAtIndex;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  pthread_mutex_t *v17;
  const __CFArray *v18;
  CFIndex Count;
  pthread_cond_t *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFArray *v26;
  const __CFString *v27;
  char v28;
  int v29;
  timeval v30;
  timespec v31;

  v31.tv_sec = 0;
  v31.tv_nsec = 0;
  v9 = *(pthread_mutex_t **)a1;
  if (v9 && !*(_QWORD *)(a1 + 32))
  {
    if (a2 == 0x7FFFFFFF)
    {
      pthread_mutex_lock(v9);
      v17 = *(pthread_mutex_t **)a1;
    }
    else
    {
      v30.tv_sec = 0;
      *(_QWORD *)&v30.tv_usec = 0;
      if (gettimeofday(&v30, 0))
      {
        v29 = *__error();
        MOLogWrite(0, 3, (uint64_t)"MOXPCTransportReceiveMessage", CFSTR("gettimeofday returned error %d"), v22, v23, v24, v25, v29);
        return 0;
      }
      v31.tv_sec = v30.tv_sec + a2;
      v31.tv_nsec = 1000 * v30.tv_usec;
      pthread_mutex_lock(*(pthread_mutex_t **)a1);
      v17 = *(pthread_mutex_t **)a1;
      if (!a2)
      {
LABEL_19:
        v26 = *(const __CFArray **)&v17[1].__opaque[40];
        if (v26)
        {
          if (CFArrayGetCount(v26))
          {
            ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)a1 + 112), 0);
            CFRetain(ValueAtIndex);
            CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(*(_QWORD *)a1 + 112), 0);
LABEL_24:
            pthread_mutex_unlock(*(pthread_mutex_t **)a1);
            return ValueAtIndex;
          }
        }
        else
        {
          MOLogWrite(0, 3, (uint64_t)"MOXPCTransportReceiveMessage", CFSTR("Connection blew up while waiting for messages on %p"), v13, v14, v15, v16, a1);
        }
        ValueAtIndex = 0;
        goto LABEL_24;
      }
    }
    v18 = *(const __CFArray **)&v17[1].__opaque[40];
    if (v18)
    {
      while (1)
      {
        Count = CFArrayGetCount(v18);
        v17 = *(pthread_mutex_t **)a1;
        if (Count)
          goto LABEL_19;
        v20 = (pthread_cond_t *)&v17[1];
        if (a2 == 0x7FFFFFFF)
        {
          if (pthread_cond_wait(v20, v17))
          {
            v27 = CFSTR("pthread_cond_wait failed");
            goto LABEL_28;
          }
        }
        else
        {
          v21 = pthread_cond_timedwait(v20, v17, &v31);
          if (v21)
          {
            if (v21 == 60)
            {
              MOLogWrite(0, 3, (uint64_t)"MOXPCTransportReceiveMessage", CFSTR("Timed out waiting for message on %p"), v13, v14, v15, v16, a1);
LABEL_29:
              pthread_mutex_unlock(*(pthread_mutex_t **)a1);
              return 0;
            }
            v28 = v21;
            v27 = CFSTR("pthread_cond_timedwait returned error %d\n");
LABEL_28:
            MOLogWrite(0, 3, (uint64_t)"MOXPCTransportReceiveMessage", v27, v13, v14, v15, v16, v28);
            goto LABEL_29;
          }
        }
        v17 = *(pthread_mutex_t **)a1;
        v18 = *(const __CFArray **)(*(_QWORD *)a1 + 112);
        if (!v18)
          goto LABEL_19;
      }
    }
    goto LABEL_19;
  }
  MOLogWrite(0, 3, (uint64_t)"MOXPCTransportReceiveMessage", CFSTR("Can't call MOXPCTransportReceiveMessage with a message handler set!"), a5, a6, a7, a8, v28);
  return 0;
}

void transactionRunner(uint64_t (**a1)(void))
{
  uint64_t v2;

  v2 = a1[2]();
  MEMORY[0x1E0BFF524](v2);
  _Block_release(a1);
}

char *MOLogOpen(const char *a1, int a2)
{
  char *v4;
  uint64_t v5;
  char *v6;
  NSObject *global_queue;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD handler[5];
  char *v15;
  _QWORD block[5];

  v4 = (char *)malloc_type_calloc(1uLL, 0x38uLL, 0x10700405B918952uLL);
  *(_QWORD *)v4 = dispatch_queue_create("com.apple.MobileSystemServices.Logging", 0);
  *((_QWORD *)v4 + 2) = strdup(a1);
  *((_DWORD *)v4 + 11) = a2;
  *((_DWORD *)v4 + 12) = a2;
  *(_QWORD *)(v4 + 36) = -1;
  v15 = 0;
  asprintf(&v15, "com.apple.MobileSystemServices.Logging.%s", a1);
  v5 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 0x40000000;
  handler[2] = __MOLogOpen_block_invoke;
  handler[3] = &__block_descriptor_tmp_0;
  handler[4] = v4;
  v6 = v15;
  global_queue = dispatch_get_global_queue(0, 0);
  if (notify_register_dispatch(v6, (int *)v4 + 10, global_queue, handler))
  {
    MOLogWrite((uint64_t)v4, 5, 0, CFSTR("failed to register for %s notification"), v8, v9, v10, v11, (char)v15);
    *((_DWORD *)v4 + 10) = -1;
  }
  free(v15);
  v12 = *(NSObject **)v4;
  block[0] = v5;
  block[1] = 0x40000000;
  block[2] = ___MOLogLoadPreferences_block_invoke;
  block[3] = &__block_descriptor_tmp_25;
  block[4] = v4;
  dispatch_sync(v12, block);
  return v4;
}

void MOLogEnableDiskLogging(NSObject **a1, uint64_t a2, int a3, uint64_t a4)
{
  NSObject *v4;
  _QWORD v5[7];
  int v6;

  v4 = *a1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = __MOLogEnableDiskLogging_block_invoke;
  v5[3] = &__block_descriptor_tmp_7;
  v5[4] = a1;
  v5[5] = a2;
  v5[6] = a4;
  v6 = a3;
  dispatch_sync(v4, v5);
}

void MOLogClose(uint64_t a1)
{
  int v2;
  int v3;
  void *v4;
  void *v5;

  v2 = *(_DWORD *)(a1 + 40);
  if ((v2 & 0x80000000) == 0)
    notify_cancel(v2);
  dispatch_release(*(dispatch_object_t *)a1);
  v3 = *(_DWORD *)(a1 + 36);
  if ((v3 & 0x80000000) == 0)
    close(v3);
  v4 = *(void **)(a1 + 8);
  if (v4)
    free(v4);
  v5 = *(void **)(a1 + 16);
  if (v5)
    free(v5);
  free((void *)a1);
}

uint64_t MOLogSetLogLevel(const char *a1, unsigned int a2)
{
  uint64_t v4;
  size_t v5;
  BOOL v6;
  const __CFString *v7;
  CFNumberRef v8;
  const __CFString *v10;
  const __CFString *v11;
  char *v12;
  passwd *v13;
  passwd v14;
  int valuePtr;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  valuePtr = a2;
  if (sysconf(71) == -1)
    abort();
  v4 = MEMORY[0x1E0C80A78]();
  memset(&v14, 0, sizeof(v14));
  v13 = 0;
  if (getpwnam_r("mobile", &v14, (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v5, &v13))
    v6 = 1;
  else
    v6 = v13 == 0;
  if (!v6 && geteuid() != v14.pw_uid)
    return 1;
  v7 = CFStringCreateWithFormat(0, 0, CFSTR("MobileSystemServices-%s-%s"), a1, "LogLevel");
  if (a2 == -1)
  {
    v8 = 0;
  }
  else
  {
    if ((a2 & 0x80000000) != 0)
    {
      valuePtr = 0;
    }
    else if (a2 >= 8)
    {
      valuePtr = 7;
    }
    v8 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  }
  v10 = (const __CFString *)*MEMORY[0x1E0C9B228];
  v11 = (const __CFString *)*MEMORY[0x1E0C9B250];
  CFPreferencesSetValue(v7, v8, (CFStringRef)*MEMORY[0x1E0C9B228], CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  CFPreferencesSynchronize(v10, CFSTR("mobile"), v11);
  if (v8)
    CFRelease(v8);
  CFRelease(v7);
  v12 = 0;
  asprintf(&v12, "com.apple.MobileSystemServices.Logging.%s", a1);
  notify_post(v12);
  free(v12);
  return 0;
}

uint64_t MOLogGetLogLevel(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  unsigned int v5;

  v2 = 0xFFFFFFFFLL;
  v5 = -1;
  CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E0C9B228], CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  if (_MOLogGetPreferenceIntValue(a1, (SInt32 *)&v5))
  {
    if (v5 >= 7)
      v3 = 7;
    else
      v3 = v5;
    if ((v5 & 0x80000000) == 0)
      return v3;
    else
      return 0;
  }
  return v2;
}

BOOL _MOLogGetPreferenceIntValue(uint64_t a1, SInt32 *a2)
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFNumber *v5;
  const __CFNumber *v6;
  CFTypeID v7;
  _BOOL8 v8;
  CFTypeID v9;

  v3 = CFStringCreateWithFormat(0, 0, CFSTR("MobileSystemServices-%s-%s"), a1, "LogLevel");
  if (!v3)
    return 0;
  v4 = v3;
  v5 = (const __CFNumber *)CFPreferencesCopyValue(v3, (CFStringRef)*MEMORY[0x1E0C9B228], CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  if (v5)
  {
    v6 = v5;
    v7 = CFGetTypeID(v5);
    if (v7 == CFNumberGetTypeID())
    {
      v8 = CFNumberGetValue(v6, kCFNumberIntType, a2) != 0;
    }
    else
    {
      v9 = CFGetTypeID(v6);
      if (v9 == CFStringGetTypeID())
      {
        *a2 = CFStringGetIntValue((CFStringRef)v6);
        v8 = 1;
      }
      else
      {
        v8 = 0;
      }
    }
    CFRelease(v6);
  }
  else
  {
    v8 = 0;
  }
  CFRelease(v4);
  return v8;
}

CFDataRef MOCreateSerializedData(CFPropertyListRef propertyList)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  CFDataRef v5;
  CFErrorRef error;

  error = 0;
  v5 = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], propertyList, kCFPropertyListBinaryFormat_v1_0, 0, &error);
  if (!v5)
  {
    MOLogWrite(0, 3, (uint64_t)"MOCreateSerializedData", CFSTR("Failed to serialize: %@\n"), v1, v2, v3, v4, (char)error);
    if (error)
      CFRelease(error);
  }
  return v5;
}

CFPropertyListRef MOCreateCFTypeFromSerializedBuffer(UInt8 *bytes, CFIndex length)
{
  const __CFAllocator *v2;
  const __CFData *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFData *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFPropertyListRef v13;
  char v15;
  CFErrorRef error;

  error = 0;
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], bytes, length, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  if (v3)
  {
    v8 = v3;
    v13 = CFPropertyListCreateWithData(v2, v3, 0, 0, &error);
    if (!v13)
    {
      MOLogWrite(0, 3, (uint64_t)"MOCreateCFTypeFromSerializedBuffer", CFSTR("Unserialization failed: %@\n"), v9, v10, v11, v12, (char)error);
      if (error)
        CFRelease(error);
    }
    CFRelease(v8);
  }
  else
  {
    MOLogWrite(0, 3, (uint64_t)"MOCreateCFTypeFromSerializedBuffer", CFSTR("Failed to create data from buffer"), v4, v5, v6, v7, v15);
    return 0;
  }
  return v13;
}

void MOXPCTransportSetConnectionAuthHandler_cold_1()
{
  __assert_rtn("MOXPCTransportSetConnectionAuthHandler", "MOXPCTransport.c", 315, "handle->flags.isServer");
}

void MOXPCTransportSetConnectionAuthHandler_cold_2()
{
  __assert_rtn("MOXPCTransportSetConnectionAuthHandler", "MOXPCTransport.c", 312, "!(handle->flags.isRunning)");
}

void MOXPCTransportSetMessageHandler_cold_1()
{
  __assert_rtn("MOXPCTransportSetMessageHandler", "MOXPCTransport.c", 340, "!(handle->flags.isRunning)");
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
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

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1E0C99020](alloc, formatOptions, format, arguments);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
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

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x1E0CD66A8](trust, result);
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

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return MEMORY[0x1E0C9A7F0]();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return MEMORY[0x1E0C9A808]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1E0C80C40]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  return MEMORY[0x1E0C815D0](client, msg, *(_QWORD *)&level, format);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1E0C82670](*(_QWORD *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

char *__cdecl ctime(const time_t *a1)
{
  return (char *)MEMORY[0x1E0C82B80](a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82C18](queue, context, work);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
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

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
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

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1E0C83798](a1, a2, a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1E0C84198](path, omode);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
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

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D18](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D20](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1E0C84D28](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D30](a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x1E0C84D38](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1E0C84D48](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1E0C85790](*(_QWORD *)&a1);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x1E0C85D48](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x1E0C85FE0](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
  MEMORY[0x1E0C86070](connection, context);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
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

void xpc_transaction_begin(void)
{
  MEMORY[0x1E0C86768]();
}

void xpc_transaction_end(void)
{
  MEMORY[0x1E0C86770]();
}

