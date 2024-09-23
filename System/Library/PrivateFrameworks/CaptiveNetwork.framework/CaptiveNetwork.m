uint64_t ServerConnectionConnect(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t v5;
  mach_port_t *v6;
  uint32_t v7;
  uint64_t v8;
  NSObject *logger;
  os_log_type_t v10;
  const char *v11;
  kern_return_t v12;
  mach_error_t v13;
  NSObject *v14;
  os_log_type_t v15;
  char *v16;
  mach_port_t v17;
  mach_port_name_t *v18;
  uint64_t v19;
  CFIndex v20;
  CFDictionaryRef v21;
  const __CFData *Data;
  const UInt8 *BytePtr;
  int Length;
  mach_error_t v25;
  NSObject *v26;
  os_log_type_t v27;
  char *v28;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  NSObject *v34;
  os_log_type_t v35;
  char *v36;
  void *valuePtr;
  unsigned int v38;
  mach_port_name_t *v39;
  int token;
  _QWORD v41[5];
  int __errnum;
  int out_token;
  _BYTE handler[32];
  uint64_t v45;
  uint8_t buf[8];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(a1 + 40))
    return 0;
  v38 = 0;
  v5 = 0;
  token = 0;
  __errnum = 0;
  v39 = (mach_port_name_t *)(a1 + 56);
  valuePtr = (void *)(a1 + 24);
  v6 = (mach_port_t *)MEMORY[0x24BDAD2F0];
  v7 = 1000000;
  while (2)
  {
    v8 = v5;
    while (1)
    {
      v5 = v8;
      if ((_DWORD)v8)
      {
        out_token = 0;
        *(_QWORD *)handler = MEMORY[0x24BDAC760];
        *(_QWORD *)&handler[8] = 0x40000000;
        *(_QWORD *)&handler[16] = __ServerConnectionRegisterForStartNotification_block_invoke;
        *(_QWORD *)&handler[24] = &__block_descriptor_tmp_4_0;
        v45 = a1;
        v7 = notify_register_dispatch(*(const char **)(a1 + 16), &out_token, *(dispatch_queue_t *)a1, handler);
        if (v7)
        {
          logger = mysyslog_get_logger();
          v10 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(logger, v10))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v7;
            _os_log_impl(&dword_2064D4000, logger, v10, "notify_register_dispatch failed with %d", buf, 8u);
          }
        }
        else
        {
          token = out_token;
        }
      }
      v11 = *(const char **)(a1 + 8);
      *(_DWORD *)buf = 0;
      v12 = bootstrap_look_up(*v6, v11, (mach_port_t *)buf);
      if (v12)
      {
        v13 = v12;
        v14 = mysyslog_get_logger();
        v15 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v14, v15))
        {
          v16 = mach_error_string(v13);
          *(_DWORD *)handler = 136315650;
          *(_QWORD *)&handler[4] = v11;
          *(_WORD *)&handler[12] = 1024;
          *(_DWORD *)&handler[14] = v13;
          *(_WORD *)&handler[18] = 2080;
          *(_QWORD *)&handler[20] = v16;
          _os_log_impl(&dword_2064D4000, v14, v15, "bootstrap_look_up(%s) %d (%s)", handler, 0x1Cu);
        }
        goto LABEL_15;
      }
      v17 = *(_DWORD *)buf;
      if (*(_DWORD *)buf)
        break;
LABEL_15:
      result = 0;
      if (a2)
      {
        v8 = 1;
        if (!(_DWORD)v5)
          continue;
      }
      return result;
    }
    v18 = v39;
    if (!v7)
    {
      notify_cancel(token);
      v18 = v39;
    }
    if (*v18)
    {
      mach_port_deallocate(*MEMORY[0x24BDAEC58], *v18);
      *v18 = 0;
    }
    v47 = 0;
    *(_QWORD *)handler = CFSTR("Class");
    *(_QWORD *)&handler[8] = 0;
    *(_QWORD *)buf = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
    v19 = *(_QWORD *)(a1 + 32);
    if (v19)
    {
      *(_QWORD *)&handler[8] = CFSTR("Information");
      v47 = v19;
      v20 = 2;
    }
    else
    {
      v20 = 1;
    }
    v21 = CFDictionaryCreate(0, (const void **)handler, (const void **)buf, v20, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFRelease(*(CFTypeRef *)buf);
    Data = my_CFPropertyListCreateData(v21);
    CFRelease(v21);
    BytePtr = CFDataGetBytePtr(Data);
    Length = CFDataGetLength(Data);
    v25 = ConnectionEstablish(v17, (uint64_t)BytePtr, Length, *(_DWORD *)(a1 + 72), v39, &__errnum);
    CFRelease(Data);
    if (!(v25 | __errnum))
    {
      *(_DWORD *)(a1 + 40) = v17;
      v30 = dispatch_source_create(MEMORY[0x24BDAC9E8], *(unsigned int *)(a1 + 56), 1uLL, *(dispatch_queue_t *)a1);
      *(_QWORD *)(a1 + 48) = v30;
      if (v30)
      {
        v41[0] = MEMORY[0x24BDAC760];
        v41[1] = 0x40000000;
        v41[2] = __ServerConnectionConnect_block_invoke;
        v41[3] = &__block_descriptor_tmp_2_0;
        v41[4] = a1;
        dispatch_source_set_event_handler(v30, v41);
        dispatch_resume(*(dispatch_object_t *)(a1 + 48));
        v31 = *(_QWORD *)(a1 + 88);
        if (v31)
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v31, a1, 1);
        v32 = mysyslog_get_logger();
        v33 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v32, v33))
        {
          *(_WORD *)handler = 0;
          _os_log_impl(&dword_2064D4000, v32, v33, "Connected", handler, 2u);
        }
        return 1;
      }
      v34 = mysyslog_get_logger();
      v35 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v34, v35))
      {
        *(_WORD *)handler = 0;
        _os_log_impl(&dword_2064D4000, v34, v35, "failed to allocate server_died_source", handler, 2u);
      }
      ServerConnectionCleanup(a1);
      return 0;
    }
    v26 = mysyslog_get_logger();
    v27 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v26, v27))
    {
      v36 = mach_error_string(v25);
      v28 = strerror(__errnum);
      *(_DWORD *)handler = 136315394;
      *(_QWORD *)&handler[4] = v36;
      *(_WORD *)&handler[12] = 2080;
      *(_QWORD *)&handler[14] = v28;
      _os_log_impl(&dword_2064D4000, v26, v27, "ConnectionEstablish failed, %s, %s", handler, 0x16u);
    }
    mach_port_deallocate(*MEMORY[0x24BDAEC58], v17);
    if (v25 == -308 || v25 == 268435459)
    {
      result = 0;
      if (!a2)
        return result;
      if (v38++ >= 5)
        return result;
      continue;
    }
    break;
  }
  if (v25 || !a2)
    return 0;
  result = *(_QWORD *)(a1 + 88);
  if (result)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a1, 0);
    return 0;
  }
  return result;
}

uint64_t CNPluginMonitorStart(uint64_t a1, dispatch_object_t object, void *aBlock)
{
  uint64_t result;

  result = 0;
  if (!a1 && object && aBlock)
  {
    if (CNPluginMonitorGet_once != -1)
      dispatch_once(&CNPluginMonitorGet_once, &__block_literal_global);
    CNMonitorSetQueueAndHandler(CNPluginMonitorGet_monitor, object, aBlock);
    return 1;
  }
  return result;
}

uint64_t ConnectionEstablish(mach_port_t a1, uint64_t a2, int a3, unsigned int a4, _DWORD *a5, _DWORD *a6)
{
  mach_port_t reply_port;
  uint64_t v10;
  uint64_t v11;
  int v12;
  mach_msg_header_t msg;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  msg.msgh_id = 0;
  *(_OWORD *)&msg.msgh_size = 0u;
  v15 = 2;
  v16 = a2;
  v17 = 16777472;
  v18 = a3;
  v19 = a4;
  v20 = 1245184;
  v21 = *MEMORY[0x24BDAC470];
  v22 = a3;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1ABF96800000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v10 = mach_msg(&msg, 3, 0x44u, 0x3Cu, reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v10)
    {
      if (msg.msgh_id == 71)
      {
        v11 = 4294966988;
      }
      else if (msg.msgh_id == 28047820)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          v11 = 4294966996;
          if (v15 == 1 && msg.msgh_size == 52 && !msg.msgh_remote_port && HIWORD(v17) << 16 == 1114112)
          {
            v11 = 0;
            v12 = HIDWORD(v19);
            *a5 = v16;
            *a6 = v12;
            return v11;
          }
        }
        else if (msg.msgh_size == 36)
        {
          v11 = 4294966996;
          if (HIDWORD(v16))
          {
            if (msg.msgh_remote_port)
              v11 = 4294966996;
            else
              v11 = HIDWORD(v16);
          }
        }
        else
        {
          v11 = 4294966996;
        }
      }
      else
      {
        v11 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v11;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v11;
}

CFDataRef my_CFPropertyListCreateData(CFPropertyListRef propertyList)
{
  return CFPropertyListCreateData(0, propertyList, kCFPropertyListBinaryFormat_v1_0, 0, 0);
}

void CNMonitorSetQueueAndHandler(uint64_t a1, dispatch_object_t object, void *aBlock)
{
  void *v6;
  const void *v7;
  NSObject *v8;
  _QWORD block[9];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3002000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 0;
  if (object)
    dispatch_retain(object);
  if (aBlock)
    v6 = _Block_copy(aBlock);
  else
    v6 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __CNMonitorSetQueueAndHandler_block_invoke;
  block[3] = &unk_24BF21318;
  block[6] = &v14;
  block[7] = a1;
  block[8] = object;
  block[4] = v6;
  block[5] = &v10;
  dispatch_sync(*(dispatch_queue_t *)(a1 + 8), block);
  v7 = (const void *)v15[5];
  if (v7)
    _Block_release(v7);
  v8 = v11[3];
  if (v8)
    dispatch_release(v8);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 135);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 135);
}

void CNMonitorSyncState(uint64_t a1)
{
  const void *v2;
  NSObject *logger;
  os_log_type_t v4;
  uint8_t v5[8];
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2000000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __CNMonitorSyncState_block_invoke;
  block[3] = &unk_24BF21340;
  block[5] = &v7;
  block[6] = a1;
  block[4] = &v11;
  dispatch_sync(*(dispatch_queue_t *)(a1 + 8), block);
  if (*((_BYTE *)v8 + 24))
  {
    v2 = (const void *)(*(uint64_t (**)(_QWORD))(a1 + 48))(*((unsigned __int8 *)v12 + 24));
    if (!ServerConnectionProcessControl(*(_QWORD *)a1, v2, 0))
    {
      logger = mysyslog_get_logger();
      v4 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v4))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_2064D4000, logger, v4, "ServerConnectionProcessControl() failed", v5, 2u);
      }
    }
    CFRelease(v2);
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
}

_OWORD *CNMonitorCreate(int a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v6;

  v6 = malloc_type_malloc(0x38uLL, 0x10A00401588D737uLL);
  v6[1] = 0u;
  v6[2] = 0u;
  *v6 = 0u;
  *((_QWORD *)v6 + 6) = 0;
  *((_DWORD *)v6 + 9) = a1;
  *((_QWORD *)v6 + 1) = dispatch_queue_create("CNMonitor", 0);
  *((_QWORD *)v6 + 5) = a2;
  *((_QWORD *)v6 + 6) = a3;
  return v6;
}

void CNMonitorPerformBlock(uint64_t a1, void *a2)
{
  dispatch_async(*(dispatch_queue_t *)(a1 + 8), a2);
}

uint64_t CNMonitorGetHandler(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

uint64_t CNMonitorGetQueue(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

void CNPluginMonitorStop()
{
  if (CNPluginMonitorGet_once != -1)
    dispatch_once(&CNPluginMonitorGet_once, &__block_literal_global);
  CNMonitorSetQueueAndHandler(CNPluginMonitorGet_monitor, 0, 0);
}

const void *CNPluginMonitorEventCopyDisplayIDs(const void *a1)
{
  CFTypeID TypeID;

  TypeID = CFArrayGetTypeID();
  if (a1)
  {
    if (CFGetTypeID(a1) == TypeID)
      CFRetain(a1);
    else
      return 0;
  }
  return a1;
}

void CNPluginMonitorHandleCommand(uint64_t a1, CFDictionaryRef theDict)
{
  const void *Value;
  CFTypeID TypeID;
  const void *v6;
  const void *v7;
  NSObject *logger;
  os_log_type_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  NSObject *v14;
  os_log_type_t v15;
  _QWORD v16[6];
  int v17;
  int valuePtr;
  uint8_t buf[4];
  CFDictionaryRef v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  valuePtr = 0;
  Value = CFDictionaryGetValue(theDict, CFSTR("EventType"));
  TypeID = CFNumberGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID || !CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, &valuePtr))
  {
    logger = mysyslog_get_logger();
    v9 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v9))
      return;
    *(_DWORD *)buf = 138412290;
    v20 = theDict;
    v10 = "event type invalid/missing in %@";
    v11 = logger;
    v12 = v9;
    v13 = 12;
    goto LABEL_10;
  }
  if (valuePtr != 1)
  {
    v14 = mysyslog_get_logger();
    v15 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v14, v15))
      return;
    *(_DWORD *)buf = 67109120;
    LODWORD(v20) = valuePtr;
    v10 = "event type %d unrecognized";
    v11 = v14;
    v12 = v15;
    v13 = 8;
LABEL_10:
    _os_log_impl(&dword_2064D4000, v11, v12, v10, buf, v13);
    return;
  }
  v6 = CFDictionaryGetValue(theDict, CFSTR("DisplayIDs"));
  v7 = v6;
  if (v6)
    CFRetain(v6);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 0x40000000;
  v16[2] = __CNPluginMonitorHandleCommand_block_invoke;
  v16[3] = &__block_descriptor_tmp_5_0;
  v17 = valuePtr;
  v16[4] = a1;
  v16[5] = v7;
  CNMonitorPerformBlock(a1, v16);
}

CFDictionaryRef CNPluginMonitorCopyControl(int a1)
{
  int v1;
  CFNumberRef v2;
  CFNumberRef v3;
  CFDictionaryRef v4;
  int v6;
  int valuePtr;
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x24BDAC8D0];
  if (a1)
    v1 = 1;
  else
    v1 = 2;
  valuePtr = v1;
  keys[0] = CFSTR("Type");
  v2 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  values[0] = v2;
  v6 = 1;
  keys[1] = CFSTR("EventType");
  v3 = CFNumberCreate(0, kCFNumberSInt32Type, &v6);
  values[1] = v3;
  v4 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFRelease(v2);
  CFRelease(v3);
  return v4;
}

uint64_t CNProberGetTypeID()
{
  pthread_once(&__captiveInit, (void (*)(void))CaptiveInitOnce);
  return __kCNProberTypeID;
}

uint64_t CNProberProvideResult(uint64_t a1, uint64_t a2)
{
  NSObject *logger;
  os_log_type_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  logger = mysyslog_get_logger();
  v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v5))
  {
    v7 = 134218240;
    v8 = a1;
    v9 = 1024;
    v10 = a2;
    _os_log_impl(&dword_2064D4000, logger, v5, "prober %p result %d", (uint8_t *)&v7, 0x12u);
  }
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 24), a1, a2);
}

const void *CNProberCreate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *Instance;
  const void *v7;

  pthread_once(&__captiveInit, (void (*)(void))CaptiveInitOnce);
  if (!a3)
    return 0;
  pthread_once(&__captiveInit, (void (*)(void))CaptiveInitOnce);
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  v7 = Instance;
  if (Instance)
  {
    Instance[2] = a3;
    Instance[3] = a4;
    if (!CNWebSheetProbeRequest(Instance))
    {
      CFRelease(v7);
      return 0;
    }
  }
  return v7;
}

CFRunLoopSourceRef CNProberCreateRunLoopSource(void *a1)
{
  CFRunLoopSourceContext v2;

  v2.version = 0;
  memset(&v2.retain, 0, 56);
  v2.info = a1;
  v2.perform = (void (__cdecl *)(void *))CNProberCallback;
  return CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &v2);
}

void CNProberCallback()
{
  NSObject *logger;
  os_log_type_t v1;
  uint8_t v2[16];

  logger = mysyslog_get_logger();
  v1 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v1))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_2064D4000, logger, v1, "Unexpected runloop source triggered", v2, 2u);
  }
}

BOOL CNScrapeCredentials(const __CFString *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  int CaptivePort;
  const __CFAllocator *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;
  _BOOL8 v18;
  _BOOL8 v19;

  CaptivePort = FindCaptivePort();
  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v10 = CFStringMallocCString((const __CFAllocator *)*MEMORY[0x24BDBD240], a1, 0x1000uLL);
  v11 = CFStringMallocCString(v9, a2, 0x1000uLL);
  v12 = CFStringMallocCString(v9, a3, 0x1000uLL);
  v13 = CFStringMallocCString(v9, a4, 0x1000uLL);
  v14 = v13;
  if ((CaptivePort + 1) < 2
    || (v10 ? (v15 = v11 == 0) : (v15 = 1),
        !v15 ? (v16 = v13 == 0) : (v16 = 1),
        !v16 ? (v17 = v12 == 0) : (v17 = 1),
        v17))
  {
    v18 = 0;
    v19 = 0;
    if (!v10)
      goto LABEL_15;
  }
  else
  {
    v18 = ParsePost() == 0;
  }
  CFAllocatorDeallocate(v9, v10);
  v19 = v18;
LABEL_15:
  if (v11)
    CFAllocatorDeallocate(v9, v11);
  if (v14)
    CFAllocatorDeallocate(v9, v14);
  if (v12)
    CFAllocatorDeallocate(v9, v12);
  return v19;
}

uint64_t FindCaptivePort()
{
  mach_port_t sp;

  pthread_once(&captiveIsPresent_once, (void (*)(void))setCaptiveIsPresentOnce);
  if ((sCaptiveIsPresent & 1) != 0)
    return 0;
  sp = 0;
  if (bootstrap_look_up(*MEMORY[0x24BDAD2F0], "com.apple.networking.captivenetworksupport", &sp))
    return 0;
  else
    return sp;
}

void *CFStringMallocCString(const __CFAllocator *a1, CFStringRef theString, unint64_t a3)
{
  CFIndex Length;
  unint64_t MaximumSizeForEncoding;
  CFIndex v8;
  void *v9;

  if (!theString)
    return 0;
  Length = CFStringGetLength(theString);
  MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  if (MaximumSizeForEncoding >= a3)
    v8 = a3;
  else
    v8 = MaximumSizeForEncoding;
  v9 = CFAllocatorAllocate(a1, v8, 0);
  if (v9 && !CFStringGetCString(theString, (char *)v9, v8, 0x8000100u))
  {
    CFAllocatorDeallocate(a1, v9);
    return 0;
  }
  return v9;
}

BOOL CNDebugLaunchWebsheet(const void *a1)
{
  mach_port_t CaptivePort;
  _BOOL8 v3;
  mach_port_t v4;
  const __CFData *Data;
  const __CFData *v6;
  const UInt8 *BytePtr;
  int Length;
  int v9;
  int v11;

  v11 = 0;
  CaptivePort = FindCaptivePort();
  v3 = 0;
  if (a1)
  {
    v4 = CaptivePort;
    if (CaptivePort + 1 >= 2)
    {
      Data = my_CFPropertyListCreateData(a1);
      if (Data)
      {
        v6 = Data;
        BytePtr = CFDataGetBytePtr(Data);
        Length = CFDataGetLength(v6);
        v9 = DebugLaunchWebsheet(v4, (uint64_t)BytePtr, Length, &v11);
        v3 = (v9 | v11) == 0;
        CFRelease(v6);
      }
      else
      {
        return 0;
      }
    }
  }
  return v3;
}

BOOL CNLogoff(const __CFString *a1)
{
  int CaptivePort;
  const __CFAllocator *v3;
  void *v4;
  void *v5;
  _BOOL8 result;
  _BOOL8 v8;

  CaptivePort = FindCaptivePort();
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v4 = CFStringMallocCString((const __CFAllocator *)*MEMORY[0x24BDBD240], a1, 0x1000uLL);
  v5 = v4;
  if ((CaptivePort + 1) < 2 || v4 == 0)
  {
    v8 = 0;
    result = 0;
    if (!v5)
      return result;
  }
  else
  {
    v8 = Logoff() == 0;
  }
  CFAllocatorDeallocate(v3, v5);
  return v8;
}

uint64_t CNWebsheetNotifyCompleteWithOptions(uint64_t a1, int a2, void *a3)
{
  CNWebSheetDone(a2, a3);
  return 1;
}

uint64_t CNWebsheetNotifyComplete(uint64_t a1, int a2)
{
  CNWebSheetDone(a2, 0);
  return 1;
}

uint64_t CNSClientLogoffReply()
{
  return 0;
}

BOOL CNForgetSSID(const __CFData *a1)
{
  int CaptivePort;
  _BOOL8 result;
  const UInt8 *BytePtr;
  unsigned int Length;

  CaptivePort = FindCaptivePort();
  result = 0;
  if (a1)
  {
    if ((CaptivePort + 1) >= 2)
    {
      BytePtr = CFDataGetBytePtr(a1);
      Length = CFDataGetLength(a1);
      return ForgetNetwork(CaptivePort, (uint64_t)BytePtr, Length) == 0;
    }
  }
  return result;
}

uint64_t CNSClientAuthenticateUsingReply(int a1, int a2)
{
  uint64_t *v4;
  uint64_t *v5;
  const void *v6;

  pthread_once(&__captiveInit, (void (*)(void))CaptiveInitOnce);
  pthread_mutex_lock(&__captiveLock);
  v4 = &sAuthStateHead;
  do
  {
    v5 = v4;
    v4 = (uint64_t *)*v4;
    if (!v4)
    {
      pthread_mutex_unlock(&__captiveLock);
      return 0;
    }
  }
  while (*((_DWORD *)v4 + 8) != a1);
  *v5 = *v4;
  pthread_mutex_unlock(&__captiveLock);
  ((void (*)(uint64_t, BOOL))v4[1])(v4[2], a2 == 0);
  CFMachPortInvalidate((CFMachPortRef)v4[3]);
  v6 = (const void *)v4[3];
  if (v6)
  {
    CFRelease(v6);
    v4[3] = 0;
  }
  free(v4);
  return 0;
}

uint64_t CNAccountsUse(const __CFString *a1, const __CFString *a2, __CFRunLoop *a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  _QWORD *v11;
  const __CFAllocator *v12;
  __CFMachPort *v13;
  int CaptivePort;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  int v21;
  __CFMachPort *v22;
  const void *v23;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v25;
  CFMachPortContext context;

  result = (uint64_t)malloc_type_malloc(0x28uLL, 0x10A0040FFE778EBuLL);
  if (result)
  {
    v11 = (_QWORD *)result;
    pthread_once(&__captiveInit, (void (*)(void))CaptiveInitOnce);
    *(_OWORD *)&context.version = xmmword_24BF21428;
    memset(&context.retain, 0, 24);
    v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v13 = CFMachPortCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFMachPortCallBack)MachServerCallback, &context, 0);
    v11[3] = v13;
    if (!v13)
      goto LABEL_25;
    *((_DWORD *)v11 + 8) = CFMachPortGetPort(v13);
    v11[1] = a4;
    v11[2] = a5;
    CaptivePort = FindCaptivePort();
    v15 = CFStringMallocCString(v12, a1, 0x400uLL);
    v16 = CFStringMallocCString(v12, a2, 0x400uLL);
    v17 = v16;
    if (v15)
      v18 = v16 == 0;
    else
      v18 = 1;
    if (v18 || CaptivePort == 0 || CaptivePort == -1)
    {
      if (v15)
        free(v15);
      if (v17)
        free(v17);
    }
    else
    {
      v21 = AuthenticateUsing();
      free(v15);
      free(v17);
      v22 = (__CFMachPort *)v11[3];
      if (v21)
      {
        if (v22)
        {
          v23 = (const void *)v11[3];
LABEL_24:
          CFRelease(v23);
        }
LABEL_25:
        free(v11);
        return 0;
      }
      RunLoopSource = CFMachPortCreateRunLoopSource(v12, v22, 0);
      if (RunLoopSource)
      {
        v25 = RunLoopSource;
        pthread_once(&__captiveInit, (void (*)(void))CaptiveInitOnce);
        pthread_mutex_lock(&__captiveLock);
        *v11 = sAuthStateHead;
        sAuthStateHead = (uint64_t)v11;
        pthread_mutex_unlock(&__captiveLock);
        CFRunLoopAddSource(a3, v25, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
        CFRelease(v25);
        return 1;
      }
    }
    v23 = (const void *)v11[3];
    if (v23)
      goto LABEL_24;
    goto LABEL_25;
  }
  return result;
}

uint64_t CNAuthenticateUsingTokenAccount(const __CFString *a1, const __CFData *a2, __CFRunLoop *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  _QWORD *v11;
  const __CFAllocator *v12;
  __CFMachPort *v13;
  void *v14;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v16;
  const void *v17;
  CFMachPortContext v19;
  int v20;

  v20 = 0;
  pthread_once(&__captiveInit, (void (*)(void))CaptiveInitOnce);
  v10 = 0;
  if (!a1 || !a2)
    return v10;
  if (!CFDataGetLength(a2))
    return 0;
  v11 = malloc_type_malloc(0x28uLL, 0x10A0040FFE778EBuLL);
  *(_OWORD *)&v19.version = xmmword_24BF21428;
  memset(&v19.retain, 0, 24);
  v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v13 = CFMachPortCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFMachPortCallBack)MachServerCallback, &v19, 0);
  v11[3] = v13;
  if (!v13)
  {
    v14 = 0;
LABEL_14:
    free(v11);
    v10 = 0;
    v16 = 0;
    goto LABEL_15;
  }
  *((_DWORD *)v11 + 8) = CFMachPortGetPort(v13);
  v11[1] = a4;
  v11[2] = a5;
  if (FindCaptivePort() - 1 > 0xFFFFFFFD)
  {
    v14 = 0;
    goto LABEL_12;
  }
  v14 = CFStringMallocCString(v12, a1, 0x400uLL);
  CFDataGetBytePtr(a2);
  CFDataGetLength(a2);
  if (AuthenticateUsingToken() | v20
    || (RunLoopSource = CFMachPortCreateRunLoopSource(v12, (CFMachPortRef)v11[3], 0)) == 0)
  {
LABEL_12:
    v17 = (const void *)v11[3];
    if (v17)
      CFRelease(v17);
    goto LABEL_14;
  }
  v16 = RunLoopSource;
  pthread_once(&__captiveInit, (void (*)(void))CaptiveInitOnce);
  pthread_mutex_lock(&__captiveLock);
  *v11 = sAuthStateHead;
  sAuthStateHead = (uint64_t)v11;
  pthread_mutex_unlock(&__captiveLock);
  CFRunLoopAddSource(a3, v16, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  v10 = 1;
LABEL_15:
  if (v14)
    free(v14);
  if (v16)
    CFRelease(v16);
  return v10;
}

CFPropertyListRef CNAccountsCopy()
{
  int CaptivePort;
  CFPropertyListRef result;
  int v2;
  _DWORD length[3];

  CaptivePort = FindCaptivePort();
  v2 = 0;
  if ((CaptivePort - 1) > 0xFFFFFFFD)
    return 0;
  memset(length, 0, sizeof(length));
  if (!CopyAccountList(CaptivePort, &length[1], length, &v2))
    return MIGUnserializeAndVMDealloc(*(UInt8 **)&length[1], length[0]);
  result = 0;
  if (!v2)
    return MIGUnserializeAndVMDealloc(*(UInt8 **)&length[1], length[0]);
  return result;
}

BOOL CNAccountsResolve(const __CFString *a1)
{
  int CaptivePort;
  _BOOL8 v3;
  void *v4;
  void *v5;

  CaptivePort = FindCaptivePort();
  v3 = 0;
  if (a1 && (CaptivePort + 1) >= 2)
  {
    v4 = CFStringMallocCString((const __CFAllocator *)*MEMORY[0x24BDBD240], a1, 0x400uLL);
    if (v4)
    {
      v5 = v4;
      v3 = ResolveAccount() == 0;
      free(v5);
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

BOOL CNDumpState()
{
  mach_port_t CaptivePort;

  CaptivePort = FindCaptivePort();
  return CaptivePort - 1 <= 0xFFFFFFFD && DumpState(CaptivePort) == 0;
}

uint64_t __CNSetSupportedSSIDs()
{
  return 0;
}

uint64_t __CNMarkPortalOnline()
{
  return 0;
}

uint64_t __CNMarkPortalOffline()
{
  return 0;
}

const void *__CNCopyCurrentNetworkInfo(CFStringRef theString)
{
  const __CFAllocator *v1;
  void *v2;
  void *v3;
  void *v4;
  const void *v5;
  CFTypeID TypeID;
  NSObject *logger;
  os_log_type_t v8;
  uint8_t v10[16];

  if (!theString)
    return 0;
  v1 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v2 = CFStringMallocCString((const __CFAllocator *)*MEMORY[0x24BDBD240], theString, 0x1000uLL);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = (void *)NEHelperCopyCurrentNetworkInfo();
  CFAllocatorDeallocate(v1, v3);
  if (!v4)
    return 0;
  v5 = (const void *)_CFXPCCreateCFObjectFromXPCObject();
  TypeID = CFDictionaryGetTypeID();
  if (!v5 || CFGetTypeID(v5) != TypeID)
  {
    logger = mysyslog_get_logger();
    v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v8))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_2064D4000, logger, v8, "received unexpected data", v10, 2u);
    }
  }
  xpc_release(v4);
  return v5;
}

CFPropertyListRef __CNCopySupportedInterfaces()
{
  int CaptivePort;
  CFPropertyListRef result;
  int v2;
  _DWORD length[3];

  CaptivePort = FindCaptivePort();
  v2 = 0;
  if ((CaptivePort - 1) > 0xFFFFFFFD)
    return 0;
  memset(length, 0, sizeof(length));
  if (!CopySupportedInterfaces(CaptivePort, &length[1], length, &v2))
    return MIGUnserializeAndVMDealloc(*(UInt8 **)&length[1], length[0]);
  result = 0;
  if (!v2)
    return MIGUnserializeAndVMDealloc(*(UInt8 **)&length[1], length[0]);
  return result;
}

const __CFData *CaptiveCopyWiFiLandingPageURL(_QWORD *a1)
{
  int CaptivePort;
  char i;
  char v4;
  const __CFData *v5;
  CFTypeID TypeID;
  unsigned int v8;
  UInt8 *bytes;
  int v10;

  v10 = 0;
  bytes = 0;
  v8 = 0;
  CaptivePort = CaptiveCopyWiFiLandingPageURL_server;
  for (i = 1; ; i = 0)
  {
    v4 = i;
    if (!CaptivePort)
    {
      CaptivePort = FindCaptivePort();
      CaptiveCopyWiFiLandingPageURL_server = CaptivePort;
      if (!CaptivePort)
        return 0;
    }
    if (!CopyLandingPageURL(CaptivePort, &bytes, &v8, a1, &v10))
      break;
    CaptivePort = 0;
    CaptiveCopyWiFiLandingPageURL_server = 0;
    if ((v4 & 1) == 0)
      return 0;
  }
  if (!bytes)
    return 0;
  v5 = my_CFPropertyListCreateWithBytePtrAndLength(bytes, v8);
  MEMORY[0x20BCF7230](*MEMORY[0x24BDAEC58], bytes, v8);
  TypeID = CFStringGetTypeID();
  if (v5 && CFGetTypeID(v5) != TypeID)
  {
    CFRelease(v5);
    return 0;
  }
  return v5;
}

BOOL CNUserInteractionIsRequired()
{
  int CaptivePort;
  uint64_t v1;
  int IsRequired;
  int v5;
  int v6;

  CaptivePort = FindCaptivePort();
  v1 = 0;
  v6 = 0;
  v5 = 0;
  if ((CaptivePort - 1) <= 0xFFFFFFFD)
  {
    IsRequired = UserInteractionIsRequired(CaptivePort, &v6, &v5);
    return !(IsRequired | v6) && v5 == 1;
  }
  return v1;
}

uint64_t CNEnableWebSheetLaunch()
{
  const __CFArray *v0;
  uint64_t v1;
  const __CFArray *v2;
  NSObject *v3;
  os_log_type_t v4;
  NSObject *logger;
  os_log_type_t v6;
  const char *v7;
  uint8_t *v8;
  __int16 v10;
  uint8_t buf[16];
  uint8_t v12[2];

  if (CNEnableWebSheetLaunch_sc_interface)
  {
    v0 = 0;
  }
  else
  {
    v2 = (const __CFArray *)__CNCopySupportedInterfaces();
    v0 = v2;
    if (!v2 || !CFArrayGetCount(v2))
    {
      logger = mysyslog_get_logger();
      v6 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(logger, v6))
        goto LABEL_17;
      *(_WORD *)v12 = 0;
      v7 = "CNCopySupportedInterfaces() returned NULL";
      v8 = v12;
      goto LABEL_16;
    }
    CFArrayGetValueAtIndex(v0, 0);
    CNEnableWebSheetLaunch_sc_interface = _SCNetworkInterfaceCreateWithBSDName();
    if (!CNEnableWebSheetLaunch_sc_interface)
    {
      v3 = mysyslog_get_logger();
      v4 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v3, v4))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2064D4000, v3, v4, "_SCNetworkInterfaceCreateWithBSDName() returned NULL", buf, 2u);
      }
      v1 = 0;
      goto LABEL_18;
    }
  }
  if (SCNetworkInterfaceSetAdvisory())
  {
    v1 = 1;
    if (!v0)
      return v1;
    goto LABEL_18;
  }
  logger = mysyslog_get_logger();
  v6 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v6))
  {
    v10 = 0;
    v7 = "SCNetworkInterfaceSetAdvisory failed";
    v8 = (uint8_t *)&v10;
LABEL_16:
    _os_log_impl(&dword_2064D4000, logger, v6, v7, v8, 2u);
  }
LABEL_17:
  v1 = 0;
  if (v0)
LABEL_18:
    CFRelease(v0);
  return v1;
}

BOOL CNSetCaptivePortalAuthenticationCredentials(const __CFString *a1, const __CFString *a2, const __CFData *a3, uint64_t a4, const __CFString *a5)
{
  int CaptivePort;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  const UInt8 *BytePtr;

  CaptivePort = FindCaptivePort();
  v10 = 0;
  if (!a3 || (CaptivePort + 1) < 2)
    return v10;
  if (!CFDataGetLength(a3))
    return 0;
  if (a2 && CFStringGetLength(a2) >= 1)
  {
    v11 = CFStringMallocCString((const __CFAllocator *)*MEMORY[0x24BDBD240], a2, 0x400uLL);
    if (!a1)
      goto LABEL_12;
  }
  else
  {
    v11 = &unk_2064DF212;
    if (!a1)
    {
LABEL_12:
      v12 = &unk_2064DF212;
      goto LABEL_13;
    }
  }
  if (CFStringGetLength(a1) < 1)
    goto LABEL_12;
  v12 = CFStringMallocCString((const __CFAllocator *)*MEMORY[0x24BDBD240], a1, 0x400uLL);
LABEL_13:
  if (a5)
  {
    if (CFStringGetLength(a5) < 1)
      v13 = &unk_2064DF212;
    else
      v13 = CFStringMallocCString((const __CFAllocator *)*MEMORY[0x24BDBD240], a5, 0x400uLL);
  }
  else
  {
    v13 = &unk_2064DF212;
  }
  BytePtr = CFDataGetBytePtr(a3);
  v10 = 0;
  if (v11 && BytePtr && v12 && v13)
  {
    CFDataGetLength(a3);
    v10 = AddAccount() == 0;
  }
  if (v11 != &unk_2064DF212 && v11)
    free(v11);
  if (v12 != &unk_2064DF212 && v12)
    free(v12);
  if (v13 != &unk_2064DF212 && v13)
    free(v13);
  return v10;
}

uint64_t CNPurgeCaptivePortalAuthenticationCredentials(CFStringRef theString)
{
  const __CFString *v1;
  int CaptivePort;
  int v3;
  void *v4;
  void *v5;
  unsigned int Length;

  v1 = theString;
  if (theString)
  {
    if (CFStringGetLength(theString)
      && (CaptivePort = FindCaptivePort(), (CaptivePort - 1) <= 0xFFFFFFFD))
    {
      v3 = CaptivePort;
      v4 = CFStringMallocCString((const __CFAllocator *)*MEMORY[0x24BDBD240], v1, 0x400uLL);
      if (v4)
      {
        v5 = v4;
        Length = CFStringGetLength(v1);
        v1 = (const __CFString *)(PurgeAccountRecord(v3, (uint64_t)v5, Length) == 0);
        free(v5);
      }
      else
      {
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return (uint64_t)v1;
}

uint64_t CaptiveInitOnce()
{
  uint64_t result;
  pthread_mutexattr_t v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1.__sig = 0;
  *(_QWORD *)v1.__opaque = 0;
  __kCNProberTypeID = _CFRuntimeRegisterClass();
  pthread_mutexattr_init(&v1);
  pthread_mutex_init(&__captiveLock, &v1);
  result = pthread_mutexattr_destroy(&v1);
  sMachParams = (uint64_t)CNSClient_server;
  dword_2544F5950 = 36;
  return result;
}

CFStringRef __CNProberSerializeDebug(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("CNProberRef: %p, callback=%p context:%p"), a1, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

uint64_t setCaptiveIsPresentOnce()
{
  uint64_t result;
  stat v1;

  memset(&v1, 0, sizeof(v1));
  result = stat("/System/Library/SystemConfiguration/CaptiveNetworkSupport.bundle", &v1);
  if ((_DWORD)result)
    sCaptiveIsPresent = 1;
  return result;
}

void MachServerCallback(uint64_t a1, mach_msg_header_t *a2, uint64_t a3, uint64_t a4)
{
  mach_msg_header_t *v6;
  mach_port_t msgh_remote_port;
  mach_msg_option_t v8;

  v6 = (mach_msg_header_t *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x24BDBD240], *(unsigned int *)(a4 + 8), 0);
  (*(void (**)(mach_msg_header_t *, mach_msg_header_t *))a4)(a2, v6);
  if ((v6->msgh_bits & 0x80000000) == 0)
  {
    msgh_remote_port = v6[1].msgh_remote_port;
    if (msgh_remote_port == -305)
      goto LABEL_11;
    if (msgh_remote_port)
    {
      a2->msgh_remote_port = 0;
      mach_msg_destroy(a2);
    }
  }
  if (!v6->msgh_remote_port)
  {
    if ((v6->msgh_bits & 0x80000000) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  if ((v6->msgh_bits & 0x1F) == 0x12)
    v8 = 17;
  else
    v8 = 1;
  if ((mach_msg(v6, v8, v6->msgh_size, 0, 0, 0, 0) - 268435459) <= 1)
LABEL_10:
    mach_msg_destroy(v6);
LABEL_11:
  CFAllocatorDeallocate(0, v6);
}

CFTypeRef MIGCFPropertyListCreateBinaryData(CFAllocatorRef bufferAllocator, const void *a2)
{
  __CFWriteStream *v3;
  __CFWriteStream *v4;
  CFTypeRef v5;

  v3 = CFWriteStreamCreateWithAllocatedBuffers(bufferAllocator, bufferAllocator);
  if (!v3)
    return 0;
  v4 = v3;
  if (CFWriteStreamOpen(v3))
  {
    CFPropertyListWrite(a2, v4, kCFPropertyListBinaryFormat_v1_0, 0, 0);
    CFWriteStreamClose(v4);
    v5 = CFWriteStreamCopyProperty(v4, (CFStreamPropertyKey)*MEMORY[0x24BDBD5B8]);
  }
  else
  {
    v5 = 0;
  }
  CFRelease(v4);
  return v5;
}

CFPropertyListRef MIGUnserializeAndVMDealloc(UInt8 *bytes, CFIndex length)
{
  CFPropertyListRef v2;
  const __CFAllocator *v4;
  uint64_t v5;
  const __CFData *v6;
  const __CFData *v7;

  v2 = 0;
  if (bytes && (_DWORD)length)
  {
    v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v5 = length;
    v6 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, length, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
    if (v6)
    {
      v7 = v6;
      v2 = CFPropertyListCreateWithData(v4, v6, 0, 0, 0);
      CFRelease(v7);
    }
    else
    {
      v2 = 0;
    }
    MEMORY[0x20BCF7230](*MEMORY[0x24BDAEC58], bytes, v5);
  }
  return v2;
}

const __CFData *MIGSerialize(const void *a1, vm_offset_t *a2, mach_msg_type_number_t *a3)
{
  const __CFData *result;
  const __CFData *v6;
  vm_map_read_t v7;
  const UInt8 *BytePtr;
  kern_return_t v9;
  mach_msg_type_number_t dataCnt;

  result = (const __CFData *)MIGCFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x24BDBD240], a1);
  if (result)
  {
    v6 = result;
    dataCnt = 0;
    *a3 = CFDataGetLength(result);
    v7 = *MEMORY[0x24BDAEC58];
    BytePtr = CFDataGetBytePtr(v6);
    v9 = vm_read(v7, (vm_address_t)BytePtr, *a3, a2, &dataCnt);
    CFRelease(v6);
    result = (const __CFData *)(v9 == 0);
    if (v9)
      *a2 = 0;
    *a3 = dataCnt;
  }
  return result;
}

os_log_t mysyslog_init_logger(os_log_t result)
{
  if (result <= 3 && !S_captive_logger)
  {
    result = os_log_create("com.apple.captive", S_captive_os_log_categories[result]);
    S_captive_logger = (uint64_t)result;
  }
  return result;
}

os_log_t mysyslog_get_logger()
{
  os_log_t result;

  result = (os_log_t)S_captive_logger;
  if (!S_captive_logger)
  {
    result = os_log_create("com.apple.captive", "Framework");
    S_captive_logger = (uint64_t)result;
  }
  return result;
}

const __CFData *my_CFPropertyListCreateVMData(CFPropertyListRef propertyList, _DWORD *a2)
{
  const __CFData *result;
  const __CFData *v4;
  int Length;
  void *v6;
  const UInt8 *BytePtr;
  vm_address_t address;

  address = 0;
  *a2 = 0;
  result = CFPropertyListCreateData(0, propertyList, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  if (result)
  {
    v4 = result;
    Length = CFDataGetLength(result);
    if (!vm_allocate(*MEMORY[0x24BDAEC58], &address, Length, 1))
    {
      v6 = (void *)address;
      BytePtr = CFDataGetBytePtr(v4);
      memmove(v6, BytePtr, Length);
      *a2 = Length;
    }
    CFRelease(v4);
    return (const __CFData *)address;
  }
  return result;
}

const __CFData *my_CFPropertyListCreateWithBytePtrAndLength(UInt8 *bytes, int a2)
{
  const __CFData *result;
  const __CFData *v3;
  CFPropertyListRef v4;

  result = CFDataCreateWithBytesNoCopy(0, bytes, a2, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  if (result)
  {
    v3 = result;
    v4 = CFPropertyListCreateWithData(0, result, 0, 0, 0);
    CFRelease(v3);
    return (const __CFData *)v4;
  }
  return result;
}

uint64_t my_CFEqual(const void *a1, const void *a2)
{
  if (!a1)
    return a2 == 0;
  if (a2)
    return CFEqual(a1, a2);
  return 0;
}

CFStringRef my_CFUUIDStringCreate(const __CFAllocator *a1)
{
  const __CFUUID *v2;
  CFStringRef v3;

  v2 = CFUUIDCreate(a1);
  v3 = CFUUIDCreateString(a1, v2);
  CFRelease(v2);
  return v3;
}

void my_CFDictionaryMergeDictionary(void *context, CFDictionaryRef theDict)
{
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)merge_dict_applier, context);
}

void merge_dict_applier(void *key, void *value, CFMutableDictionaryRef theDict)
{
  CFDictionaryAddValue(theDict, key, value);
}

const __CFArray *my_CFArrayContainsStringsOnly(const __CFArray *result)
{
  const __CFArray *v1;
  unsigned __int8 context;
  CFRange v3;

  context = 1;
  if (result)
  {
    v1 = result;
    v3.length = CFArrayGetCount(result);
    v3.location = 0;
    CFArrayApplyFunction(v1, v3, (CFArrayApplierFunction)CheckIsString, &context);
    return (const __CFArray *)context;
  }
  return result;
}

CFTypeID CheckIsString(const void *a1, _BYTE *a2)
{
  CFTypeID result;
  CFTypeID v5;

  result = CFStringGetTypeID();
  if (!a1 || (v5 = result, result = CFGetTypeID(a1), result != v5))
    *a2 = 0;
  return result;
}

uint64_t my_CFArrayContainsAnyArrayValues(CFArrayRef theArray, const __CFArray *a2)
{
  uint64_t result;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  CFIndex v8;
  const void *ValueAtIndex;
  CFRange v10;

  result = 0;
  if (theArray && a2)
  {
    Count = CFArrayGetCount(theArray);
    v6 = CFArrayGetCount(a2);
    if (Count < 1)
    {
      return 0;
    }
    else
    {
      v7 = v6;
      v8 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v8);
        v10.location = 0;
        v10.length = v7;
        if (CFArrayContainsValue(a2, v10, ValueAtIndex))
          break;
        if (Count == ++v8)
          return 0;
      }
      return 1;
    }
  }
  return result;
}

void my_FieldSetRetainedCFType(const void **a1, CFTypeRef cf)
{
  const void *v4;

  v4 = *a1;
  if (cf)
    CFRetain(cf);
  if (v4)
    CFRelease(v4);
  *a1 = cf;
}

uint64_t my_CFDictionaryGetBooleanValue(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  const __CFBoolean *Value;
  CFTypeID TypeID;

  Value = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  TypeID = CFBooleanGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID)
    return CFBooleanGetValue(Value);
  else
    return a3;
}

uint64_t my_CFArrayPointerAddValue(CFArrayRef *a1, const void *a2)
{
  const __CFArray *v3;
  __CFArray *Mutable;
  CFRange v7;

  v3 = *a1;
  if (*a1)
  {
    v7.length = CFArrayGetCount(*a1);
    v7.location = 0;
    if (CFArrayContainsValue(v3, v7, a2))
      return 0;
    Mutable = v3;
  }
  else
  {
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    *a1 = Mutable;
  }
  CFArrayAppendValue(Mutable, a2);
  return 1;
}

CFIndex my_CFArrayFindValue(const __CFArray *a1, const void *a2)
{
  CFRange v5;

  if (!a1)
    return -1;
  v5.length = CFArrayGetCount(a1);
  v5.location = 0;
  return CFArrayGetFirstIndexOfValue(a1, v5, a2);
}

uint64_t my_CFArrayFindDictWithKeyAndValue(const __CFArray *a1, const void *a2, const void *a3)
{
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  const __CFDictionary *ValueAtIndex;
  const void *Value;
  int v11;

  if (a1)
  {
    Count = CFArrayGetCount(a1);
    if (Count >= 1)
    {
      v7 = Count;
      v8 = 0;
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v8);
        Value = CFDictionaryGetValue(ValueAtIndex, a2);
        v11 = a3 == 0;
        if (!Value)
          goto LABEL_7;
        if (a3)
          break;
LABEL_8:
        if (v7 == ++v8)
          return -1;
      }
      v11 = CFEqual(Value, a3);
LABEL_7:
      if (v11)
        return v8;
      goto LABEL_8;
    }
  }
  return -1;
}

CFStringRef URLStringCopyHostName(CFStringRef URLString)
{
  const __CFURL *v1;
  const __CFURL *v2;
  CFStringRef v3;

  if (!URLString)
    return 0;
  v1 = CFURLCreateWithString(0, URLString, 0);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = CFURLCopyHostName(v1);
  CFRelease(v2);
  return v3;
}

const void **CNNetworkCreate(const void *a1, const void *a2)
{
  const void **v4;

  v4 = (const void **)__CNNetworkAllocate();
  my_FieldSetRetainedCFType(v4 + 4, a2);
  if (a1)
    v4[2] = CFRetain(a1);
  return v4;
}

_QWORD *__CNNetworkAllocate()
{
  _QWORD *result;

  if (__CNNetworkRegisterClass_once != -1)
    dispatch_once(&__CNNetworkRegisterClass_once, &__block_literal_global_0);
  result = (_QWORD *)_CFRuntimeCreateInstance();
  result[3] = 0;
  result[4] = 0;
  result[2] = 0;
  return result;
}

CFMutableDictionaryRef CNNetworkCopySerialization(uint64_t a1, int a2)
{
  const __CFDictionary *v3;
  CFMutableDictionaryRef MutableCopy;
  CFMutableDictionaryRef v6;
  const __CFDictionary *v7;

  v3 = *(const __CFDictionary **)(a1 + 24);
  if (!v3 || !CFDictionaryGetCount(v3))
    return 0;
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)(a1 + 24));
  v6 = MutableCopy;
  if (a2)
  {
    v7 = *(const __CFDictionary **)(a1 + 16);
    if (v7)
      my_CFDictionaryMergeDictionary(MutableCopy, v7);
  }
  return v6;
}

CFDictionaryRef CNNetworkCopySerializationWithoutAnnotations(uint64_t a1)
{
  const __CFDictionary *v1;

  v1 = *(const __CFDictionary **)(a1 + 16);
  if (v1)
    return CFDictionaryCreateCopy(0, v1);
  else
    return 0;
}

__CFArray *CNNetworkListCopySerialization(const __CFArray *a1)
{
  uint64_t Count;
  __CFArray *Mutable;
  CFIndex i;
  const void *ValueAtIndex;
  CFMutableDictionaryRef v6;
  CFMutableDictionaryRef v7;

  Count = CFArrayGetCount(a1);
  Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x24BDBD690]);
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
      v6 = CNNetworkCopySerialization((uint64_t)ValueAtIndex, 1);
      if (v6)
      {
        v7 = v6;
        CFArrayAppendValue(Mutable, v6);
        CFRelease(v7);
      }
    }
  }
  return Mutable;
}

CFArrayRef CNNetworkListCreate(const void *a1, const void *a2)
{
  CFTypeID TypeID;
  uint64_t Count;
  __CFArray *Mutable;
  CFIndex i;
  const void *ValueAtIndex;
  const void **v9;
  const void **v10;
  CFArrayRef Copy;

  TypeID = CFArrayGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID)
    return 0;
  Count = CFArrayGetCount((CFArrayRef)a1);
  Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x24BDBD690]);
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, i);
      v9 = CNNetworkCreate(ValueAtIndex, a2);
      if (v9)
      {
        v10 = v9;
        CFArrayAppendValue(Mutable, v9);
        CFRelease(v10);
      }
    }
  }
  if (CFArrayGetCount(Mutable))
    Copy = CFArrayCreateCopy(0, Mutable);
  else
    Copy = 0;
  CFRelease(Mutable);
  return Copy;
}

uint64_t CNNetworkGetInterfaceName(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t CNNetworkGetTypeID()
{
  if (__CNNetworkRegisterClass_once != -1)
    dispatch_once(&__CNNetworkRegisterClass_once, &__block_literal_global_0);
  return __kCNNetworkTypeID;
}

void CNNetworkSetCaptive(uint64_t a1, int a2)
{
  void **v2;

  v2 = (void **)MEMORY[0x24BDBD270];
  if (!a2)
    v2 = (void **)MEMORY[0x24BDBD268];
  CNNetworkSetProperty(a1, CFSTR("IsCaptive"), *v2);
}

void CNNetworkSetProperty(uint64_t a1, void *key, void *value)
{
  __CFDictionary *Mutable;

  Mutable = *(__CFDictionary **)(a1 + 24);
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    *(_QWORD *)(a1 + 24) = Mutable;
  }
  CFDictionarySetValue(Mutable, key, value);
}

void CNNetworkSetConfidence(uint64_t a1, int a2)
{
  CFNumberRef v3;
  int valuePtr;

  valuePtr = a2;
  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  CNNetworkSetProperty(a1, CFSTR("Confidence"), v3);
  CFRelease(v3);
}

const __CFDictionary *CNNetworkGetPluginBundleID(uint64_t a1)
{
  const __CFDictionary *result;
  const void *Value;
  CFTypeID TypeID;

  result = *(const __CFDictionary **)(a1 + 16);
  if (result)
  {
    Value = CFDictionaryGetValue(result, CFSTR("PluginBundleID"));
    TypeID = CFStringGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID)
        return (const __CFDictionary *)Value;
      else
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFDictionary *CNNetworkGetSSIDString(uint64_t a1)
{
  const __CFDictionary *result;
  const void *Value;
  CFTypeID TypeID;

  result = *(const __CFDictionary **)(a1 + 16);
  if (result)
  {
    Value = CFDictionaryGetValue(result, CFSTR("SSIDString"));
    TypeID = CFStringGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID)
        return (const __CFDictionary *)Value;
      else
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFDictionary *CNNetworkGetSSID(uint64_t a1)
{
  const __CFDictionary *result;
  const void *Value;
  CFTypeID TypeID;

  result = *(const __CFDictionary **)(a1 + 16);
  if (result)
  {
    Value = CFDictionaryGetValue(result, CFSTR("SSID"));
    TypeID = CFDataGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID)
        return (const __CFDictionary *)Value;
      else
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFDictionary *CNNetworkGetBSSID(uint64_t a1)
{
  const __CFDictionary *result;
  const void *Value;
  CFTypeID TypeID;

  result = *(const __CFDictionary **)(a1 + 16);
  if (result)
  {
    Value = CFDictionaryGetValue(result, CFSTR("BSSID"));
    TypeID = CFStringGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID)
        return (const __CFDictionary *)Value;
      else
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CNNetworkIsProtected(uint64_t a1)
{
  const __CFDictionary *v1;
  const __CFBoolean *Value;
  CFTypeID TypeID;

  v1 = *(const __CFDictionary **)(a1 + 16);
  if (v1
    && (Value = (const __CFBoolean *)CFDictionaryGetValue(v1, CFSTR("IsProtected")), TypeID = CFBooleanGetTypeID(),
                                                                                     Value)
    && CFGetTypeID(Value) == TypeID)
  {
    return CFBooleanGetValue(Value);
  }
  else
  {
    return 0;
  }
}

double CNNetworkGetSignalStrength(uint64_t a1)
{
  const __CFDictionary *v1;
  double v2;
  const __CFNumber *Value;
  CFTypeID TypeID;
  double valuePtr;

  valuePtr = 0.0;
  v1 = *(const __CFDictionary **)(a1 + 16);
  v2 = 0.0;
  if (v1)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(v1, CFSTR("SignalStrength"));
    TypeID = CFNumberGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID)
      {
        CFNumberGetValue(Value, kCFNumberDoubleType, &valuePtr);
        return valuePtr;
      }
    }
  }
  return v2;
}

const __CFBoolean *CNNetworkWasAutoJoined(uint64_t a1)
{
  const __CFBoolean *result;

  result = _CNNetworkWasAutoJoined(a1);
  if (result)
    return (const __CFBoolean *)CFBooleanGetValue(result);
  return result;
}

const __CFDictionary *_CNNetworkWasAutoJoined(uint64_t a1)
{
  const __CFDictionary *result;
  const void *Value;
  CFTypeID TypeID;

  result = *(const __CFDictionary **)(a1 + 16);
  if (result)
  {
    Value = CFDictionaryGetValue(result, CFSTR("WasAutoJoined"));
    TypeID = CFBooleanGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID)
        return (const __CFDictionary *)Value;
      else
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CNNetworkWasJustJoined(uint64_t a1)
{
  const __CFDictionary *v1;
  const __CFBoolean *Value;
  CFTypeID TypeID;

  v1 = *(const __CFDictionary **)(a1 + 16);
  if (v1
    && (Value = (const __CFBoolean *)CFDictionaryGetValue(v1, CFSTR("WasJustJoined")),
        TypeID = CFBooleanGetTypeID(),
        Value)
    && CFGetTypeID(Value) == TypeID)
  {
    return CFBooleanGetValue(Value);
  }
  else
  {
    return 0;
  }
}

void CNNetworkSetPassword(uint64_t a1, void *a2)
{
  CFTypeID TypeID;

  TypeID = CFStringGetTypeID();
  if (a2 && CFGetTypeID(a2) == TypeID && CNNetworkIsProtected(a1) == 1)
    CNNetworkSetProperty(a1, CFSTR("Password"), a2);
}

const __CFDictionary *CNNetworkGetPassword(uint64_t a1)
{
  const __CFDictionary *result;
  const void *Value;
  CFTypeID TypeID;

  result = *(const __CFDictionary **)(a1 + 16);
  if (result)
  {
    Value = CFDictionaryGetValue(result, CFSTR("Password"));
    TypeID = CFStringGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID)
        return (const __CFDictionary *)Value;
      else
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const void *CNNetworkCopyPluginNames(uint64_t a1)
{
  const __CFDictionary *v1;
  const void *Value;
  CFTypeID TypeID;

  v1 = *(const __CFDictionary **)(a1 + 16);
  if (!v1)
    return 0;
  Value = CFDictionaryGetValue(v1, CFSTR("PluginNames"));
  TypeID = CFArrayGetTypeID();
  if (Value)
  {
    if (CFGetTypeID(Value) == TypeID)
    {
      CFRetain(Value);
      return Value;
    }
    return 0;
  }
  return Value;
}

const __CFDictionary *CNNetworkIsChosenPlugin(uint64_t a1)
{
  const __CFDictionary *result;
  const __CFBoolean *Value;
  CFTypeID TypeID;

  result = *(const __CFDictionary **)(a1 + 16);
  if (result)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(result, CFSTR("IsChosenPlugin"));
    TypeID = CFBooleanGetTypeID();
    if (Value && CFGetTypeID(Value) == TypeID)
      return (const __CFDictionary *)(CFBooleanGetValue(Value) != 0);
    else
      return 0;
  }
  return result;
}

_QWORD *CNNetworkCreateWithSSIDAndBSSID(const void *a1, const void *a2)
{
  CFTypeID TypeID;
  CFTypeID v5;
  _QWORD *v6;
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x24BDAC8D0];
  TypeID = CFStringGetTypeID();
  if (!a1)
    return 0;
  if (CFGetTypeID(a1) != TypeID)
    return 0;
  v5 = CFStringGetTypeID();
  if (!a2 || CFGetTypeID(a2) != v5)
    return 0;
  v6 = __CNNetworkAllocate();
  keys[0] = CFSTR("SSIDString");
  keys[1] = CFSTR("BSSID");
  values[0] = (void *)a1;
  values[1] = (void *)a2;
  v6[2] = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  return v6;
}

void __CNNetworkDeallocate(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  v2 = (const void *)a1[2];
  if (v2)
  {
    CFRelease(v2);
    a1[2] = 0;
  }
  v3 = (const void *)a1[3];
  if (v3)
  {
    CFRelease(v3);
    a1[3] = 0;
  }
  v4 = (const void *)a1[4];
  if (v4)
  {
    CFRelease(v4);
    a1[4] = 0;
  }
}

__CFString *__CNNetworkCopyDebugDesc(const void *a1)
{
  const __CFAllocator *v2;
  const __CFBoolean *v3;
  const char *v4;
  __CFString *Mutable;
  const __CFDictionary *SSIDString;
  const __CFDictionary *BSSID;
  const char *v8;
  double SignalStrength;

  v2 = CFGetAllocator(a1);
  v3 = _CNNetworkWasAutoJoined((uint64_t)a1);
  if (v3)
  {
    if (CFBooleanGetValue(v3))
      v4 = "[Auto-Join] ";
    else
      v4 = "[User-Join] ";
  }
  else
  {
    v4 = (const char *)&unk_2064DF212;
  }
  Mutable = CFStringCreateMutable(v2, 0);
  SSIDString = CNNetworkGetSSIDString((uint64_t)a1);
  BSSID = CNNetworkGetBSSID((uint64_t)a1);
  if (CNNetworkIsProtected((uint64_t)a1))
    v8 = "protected";
  else
    v8 = "open";
  SignalStrength = CNNetworkGetSignalStrength((uint64_t)a1);
  CFStringAppendFormat(Mutable, 0, CFSTR("<CNNetwork SSID %@ BSSID %@ [%s] [signal %g] %s%p>"), SSIDString, BSSID, v8, *(_QWORD *)&SignalStrength, v4, a1);
  return Mutable;
}

uint64_t _CNPluginGetQueue()
{
  return ServerConnectionGetHandlerQueue(*(_QWORD *)G_plugin);
}

void _CNPluginProvideResponse(const __CFDictionary *a1)
{
  const void *Value;
  const __CFArray *v3;
  CFIndex FirstIndexOfValue;
  NSObject *logger;
  os_log_type_t v6;
  int v7;
  const __CFDictionary *v8;
  uint64_t v9;
  CFRange v10;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a1 && *(_QWORD *)(G_plugin + 24))
  {
    Value = CFDictionaryGetValue(a1, CFSTR("UniqueID"));
    v3 = *(const __CFArray **)(G_plugin + 24);
    if (!v3
      || (v10.length = CFArrayGetCount(v3),
          v10.location = 0,
          FirstIndexOfValue = CFArrayGetFirstIndexOfValue(*(CFArrayRef *)(G_plugin + 24), v10, Value),
          FirstIndexOfValue == -1))
    {
      logger = mysyslog_get_logger();
      v6 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v6))
      {
        v7 = 138412290;
        v8 = a1;
        _os_log_impl(&dword_2064D4000, logger, v6, "Ignoring stale command response %@", (uint8_t *)&v7, 0xCu);
      }
    }
    else
    {
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(G_plugin + 24), FirstIndexOfValue);
      ServerConnectionProvideResponse(*(_QWORD *)G_plugin, a1);
    }
  }
}

BOOL CNPluginRegister(const void *a1, NSObject *a2, const void *a3)
{
  CFTypeID TypeID;
  void *Value;
  CFTypeID v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL8 result;
  const char *v12;
  _OWORD *v13;
  const __CFDictionary *v14;
  NSObject *logger;
  os_log_type_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  uint64_t v20;
  uint64_t v21;
  void *values;
  uint8_t buf[4];
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  values = 0;
  if (!a3)
    return 0;
  if (a1)
  {
    TypeID = CFDictionaryGetTypeID();
    if (CFGetTypeID(a1) != TypeID)
    {
      logger = mysyslog_get_logger();
      v16 = _SC_syslog_os_log_mapping();
      result = os_log_type_enabled(logger, v16);
      if (!result)
        return result;
      *(_WORD *)buf = 0;
      v12 = "CNPluginRegister: 'options' is not a dictionary";
      v17 = logger;
      v18 = v16;
      v19 = 2;
      goto LABEL_18;
    }
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("DisplayName"));
    values = Value;
    if (Value)
    {
      v8 = CFStringGetTypeID();
      if (CFGetTypeID(Value) != v8)
      {
        v9 = mysyslog_get_logger();
        v10 = _SC_syslog_os_log_mapping();
        result = os_log_type_enabled(v9, v10);
        if (!result)
          return result;
        *(_DWORD *)buf = 138412290;
        v24 = CFSTR("DisplayName");
        v12 = "CNPluginRegister: %@ property must be a string";
        goto LABEL_17;
      }
    }
    if (CFDictionaryGetCount((CFDictionaryRef)a1) >= 2)
    {
      v9 = mysyslog_get_logger();
      v10 = _SC_syslog_os_log_mapping();
      result = os_log_type_enabled(v9, v10);
      if (!result)
        return result;
      *(_DWORD *)buf = 138412290;
      v24 = CFSTR("DisplayName");
      v12 = "CNPluginRegister: 'options' contains properties other than %@";
LABEL_17:
      v17 = v9;
      v18 = v10;
      v19 = 12;
LABEL_18:
      _os_log_impl(&dword_2064D4000, v17, v18, v12, buf, v19);
      return 0;
    }
  }
  else
  {
    Value = 0;
  }
  if (G_plugin)
    return 0;
  v13 = malloc_type_malloc(0x20uLL, 0xA00400A0658E3uLL);
  G_plugin = (uint64_t)v13;
  *v13 = 0u;
  v13[1] = 0u;
  *((_QWORD *)v13 + 1) = a2;
  *(_QWORD *)(G_plugin + 16) = _Block_copy(a3);
  if (Value)
    v14 = CFDictionaryCreate(0, (const void **)&kCNPluginOptionDisplayName, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  else
    v14 = 0;
  v20 = ServerConnectionCreate((uint64_t)"com.apple.networking.captivenetworksupport", (uint64_t)"com.apple.networking.captivenetworksupport.startserver", 3, v14, &__block_literal_global_1, 0);
  v21 = G_plugin;
  *(_QWORD *)G_plugin = v20;
  if (v14)
  {
    CFRelease(v14);
    v21 = G_plugin;
    v20 = *(_QWORD *)G_plugin;
  }
  if (v20)
  {
    ServerConnectionResume(v20);
    dispatch_retain(a2);
    return 1;
  }
  else
  {
    _Block_release(*(const void **)(v21 + 16));
    free((void *)G_plugin);
    result = 0;
    G_plugin = 0;
  }
  return result;
}

uint64_t CNPluginLogoffNetwork(uint64_t a1)
{
  uint64_t InterfaceName;
  void *v3;
  CFDictionaryRef v4;
  CFNumberRef v5;
  CFDictionaryRef v6;
  NSObject *HandlerQueue;
  uint64_t v8;
  NSObject *logger;
  os_log_type_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  int valuePtr;
  void *values[2];
  CFDictionaryRef v19;
  void *keys[2];
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  if (!G_plugin)
  {
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  if (!a1)
    goto LABEL_9;
  InterfaceName = CNNetworkGetInterfaceName(a1);
  if (!InterfaceName)
    goto LABEL_9;
  v3 = (void *)InterfaceName;
  v21 = 0;
  v19 = 0;
  v4 = CNNetworkCopySerializationWithoutAnnotations(a1);
  valuePtr = 1;
  v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  keys[0] = CFSTR("Type");
  keys[1] = CFSTR("InterfaceName");
  values[0] = v5;
  values[1] = v3;
  if (v4)
  {
    v21 = CFSTR("Network");
    v19 = v4;
    v6 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFRelease(v4);
  }
  else
  {
    v6 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  }
  CFRelease(v5);
  if (!v6)
  {
LABEL_9:
    logger = mysyslog_get_logger();
    v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v10))
    {
      LOWORD(keys[0]) = 0;
      _os_log_impl(&dword_2064D4000, logger, v10, "Failed to create logoff control", (uint8_t *)keys, 2u);
    }
    goto LABEL_11;
  }
  HandlerQueue = ServerConnectionGetHandlerQueue(*(_QWORD *)G_plugin);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 0x40000000;
  v12[2] = __CNPluginLogoffNetwork_block_invoke;
  v12[3] = &unk_24BF214C0;
  v12[4] = &v13;
  v12[5] = v6;
  dispatch_sync(HandlerQueue, v12);
  CFRelease(v6);
  v8 = *((unsigned __int8 *)v14 + 24);
LABEL_12:
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t CNPluginCopySupportedInterfaces()
{
  CFDictionaryRef v0;
  NSObject *HandlerQueue;
  const void *v2;
  CFTypeID TypeID;
  const __CFArray *v4;
  uint64_t *v5;
  const void *v6;
  uint64_t v7;
  _QWORD block[7];
  uint64_t context;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  void *values;
  int valuePtr;
  void *keys;
  CFRange v22;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2000000000;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2000000000;
  v14 = 0;
  context = 0;
  if (G_plugin)
  {
    valuePtr = 2;
    values = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
    keys = CFSTR("Type");
    v0 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFRelease(values);
    HandlerQueue = ServerConnectionGetHandlerQueue(*(_QWORD *)G_plugin);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __CNPluginCopySupportedInterfaces_block_invoke;
    block[3] = &unk_24BF214E8;
    block[5] = &v15;
    block[6] = v0;
    block[4] = &v11;
    dispatch_sync(HandlerQueue, block);
    CFRelease(v0);
    if (*((_BYTE *)v12 + 24))
    {
      v2 = (const void *)v16[3];
      TypeID = CFArrayGetTypeID();
      if (v2)
      {
        if (CFGetTypeID(v2) == TypeID)
        {
          v4 = (const __CFArray *)v16[3];
          v22.length = CFArrayGetCount(v4);
          v22.location = 0;
          CFArrayApplyFunction(v4, v22, (CFArrayApplierFunction)appendCommandAsNetwork, &context);
        }
      }
    }
    v5 = v16;
    v6 = (const void *)v16[3];
    if (v6)
    {
      CFRelease(v6);
      v5[3] = 0;
    }
    v7 = context;
  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v7;
}

void appendCommandAsNetwork(const __CFDictionary *a1, __CFArray **a2)
{
  const void *Value;
  const void *v5;
  const void **v6;
  const void **v7;
  __CFArray *Mutable;

  Value = CFDictionaryGetValue(a1, CFSTR("InterfaceName"));
  v5 = CFDictionaryGetValue(a1, CFSTR("Network"));
  v6 = CNNetworkCreate(v5, Value);
  if (v6)
  {
    v7 = v6;
    Mutable = *a2;
    if (!*a2)
    {
      Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
      *a2 = Mutable;
    }
    CFArrayAppendValue(Mutable, v7);
    CFRelease(v7);
  }
}

uint64_t CNPluginCommandGetTypeID()
{
  if (__CNPluginCommandRegisterClass_once != -1)
    dispatch_once(&__CNPluginCommandRegisterClass_once, &__block_literal_global_2);
  return __kCNPluginCommandTypeID;
}

uint64_t CNPluginCommandGetType(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

const void *CNPluginCommandGetInterfaceName(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("InterfaceName"));
}

const void *CNPluginCommandBindReadStream(uint64_t a1, __CFReadStream *a2)
{
  const void *result;

  result = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("InterfaceName"));
  if (result)
    return (const void *)CFReadStreamSetProperty(a2, (CFStreamPropertyKey)*MEMORY[0x24BDB76F8], result);
  return result;
}

const void **CNPluginCommandCopyCurrentNetwork(uint64_t a1)
{
  const void *Value;
  const void *v3;

  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("Network"));
  v3 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("InterfaceName"));
  return CNNetworkCreate(Value, v3);
}

CFArrayRef CNPluginCommandCopyNetworkList(uint64_t a1)
{
  const void *Value;
  const void *v3;

  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("NetworkList"));
  v3 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("InterfaceName"));
  return CNNetworkListCreate(Value, v3);
}

_QWORD *CNPluginCommandCreate(const __CFDictionary *a1)
{
  _QWORD *Value;
  CFTypeID TypeID;
  CFTypeID v4;
  int valuePtr;

  Value = CFDictionaryGetValue(a1, CFSTR("Type"));
  TypeID = CFNumberGetTypeID();
  if (Value)
  {
    if (CFGetTypeID(Value) != TypeID)
      return 0;
    valuePtr = 0;
    if (!CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, &valuePtr))
      return 0;
    Value = CFDictionaryGetValue(a1, CFSTR("UniqueID"));
    v4 = CFStringGetTypeID();
    if (!Value)
      return Value;
    if (CFGetTypeID(Value) != v4)
      return 0;
    if (__CNPluginCommandRegisterClass_once != -1)
      dispatch_once(&__CNPluginCommandRegisterClass_once, &__block_literal_global_2);
    Value = (_QWORD *)_CFRuntimeCreateInstance();
    Value[2] = 0;
    Value[3] = 0;
    *((_DWORD *)Value + 6) = valuePtr;
    Value[2] = CFRetain(a1);
  }
  return Value;
}

void __CNPluginCommandDeallocate(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 16);
  if (v1)
    CFRelease(v1);
}

__CFString *__CNPluginCommandCopyDebugDesc(unsigned int *a1)
{
  const __CFAllocator *v2;
  __CFString *Mutable;
  const char *String;

  v2 = CFGetAllocator(a1);
  Mutable = CFStringCreateMutable(v2, 0);
  String = CNPCommandTypeGetString(a1[6]);
  CFStringAppendFormat(Mutable, 0, CFSTR("<CNPluginCommand %s %p>"), String, a1);
  return Mutable;
}

uint64_t CNPluginResponseGetTypeID()
{
  if (__CNPluginResponseRegisterClass_once != -1)
    dispatch_once(&__CNPluginResponseRegisterClass_once, &__block_literal_global_3);
  return __kCNPluginResponseTypeID;
}

uint64_t CNPluginResponseCreate(uint64_t a1, int a2)
{
  uint64_t Instance;
  const void *Value;

  if (__CNPluginResponseRegisterClass_once != -1)
    dispatch_once(&__CNPluginResponseRegisterClass_once, &__block_literal_global_3);
  Instance = _CFRuntimeCreateInstance();
  *(_OWORD *)(Instance + 16) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  *(_DWORD *)(Instance + 16) = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(Instance + 20) = a2;
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("UniqueID"));
  *(_QWORD *)(Instance + 24) = CFRetain(Value);
  return Instance;
}

void CNPluginResponseDeliver(_QWORD *a1)
{
  void *v2;
  CFNumberRef v3;
  uint64_t v4;
  CFMutableDictionaryRef v5;
  CFMutableDictionaryRef v6;
  unsigned int v7;
  const __CFArray *v8;
  __CFArray *v9;
  __CFArray *v10;
  CFDictionaryRef v11;
  NSObject *Queue;
  _QWORD v13[5];
  void *values[2];
  CFMutableDictionaryRef v15;
  uint64_t v16;
  void *keys[2];
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18 = 0;
  v19 = 0;
  v16 = 0;
  keys[0] = CFSTR("UniqueID");
  v2 = (void *)a1[3];
  v15 = 0;
  values[0] = v2;
  v3 = CFNumberCreate(0, kCFNumberSInt32Type, (char *)a1 + 20);
  keys[1] = CFSTR("Result");
  values[1] = v3;
  v4 = a1[4];
  if (v4)
  {
    v5 = CNNetworkCopySerialization(v4, 0);
    v6 = v5;
    if (v5)
    {
      v18 = CFSTR("Network");
      v15 = v5;
      v7 = 3;
      goto LABEL_6;
    }
  }
  else
  {
    v6 = 0;
  }
  v7 = 2;
LABEL_6:
  v8 = (const __CFArray *)a1[5];
  if (v8)
  {
    v9 = CNNetworkListCopySerialization(v8);
    v10 = v9;
    if (v9)
    {
      keys[v7] = CFSTR("NetworkList");
      values[v7++] = v9;
    }
  }
  else
  {
    v10 = 0;
  }
  v11 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, v7, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v3)
    CFRelease(v3);
  if (v6)
    CFRelease(v6);
  if (v10)
    CFRelease(v10);
  Queue = _CNPluginGetQueue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 0x40000000;
  v13[2] = __CNPluginResponseDeliver_block_invoke;
  v13[3] = &__block_descriptor_tmp_4;
  v13[4] = v11;
  dispatch_sync(Queue, v13);
}

void CNPluginResponseSetNetworkList(uint64_t a1, CFTypeRef cf)
{
  const void *v4;
  NSObject *logger;
  os_log_type_t v6;
  const char *String;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(a1 + 16) == 1)
  {
    if (cf)
      CFRetain(cf);
    v4 = *(const void **)(a1 + 40);
    if (v4)
      CFRelease(v4);
    *(_QWORD *)(a1 + 40) = cf;
  }
  else
  {
    logger = mysyslog_get_logger();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v6))
    {
      String = CNPCommandTypeGetString(*(_DWORD *)(a1 + 16));
      v8 = 136315138;
      v9 = String;
      _os_log_impl(&dword_2064D4000, logger, v6, "CNPluginResponseSetNetworkList() invalid for %s", (uint8_t *)&v8, 0xCu);
    }
  }
}

void CNPluginResponseSetNetwork(uint64_t a1, CFTypeRef cf)
{
  const void *v4;
  NSObject *logger;
  os_log_type_t v6;
  const char *String;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(a1 + 16) == 2)
  {
    if (cf)
      CFRetain(cf);
    v4 = *(const void **)(a1 + 32);
    if (v4)
      CFRelease(v4);
    *(_QWORD *)(a1 + 32) = cf;
  }
  else
  {
    logger = mysyslog_get_logger();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v6))
    {
      String = CNPCommandTypeGetString(*(_DWORD *)(a1 + 16));
      v8 = 136315138;
      v9 = String;
      _os_log_impl(&dword_2064D4000, logger, v6, "CNPluginResponseSetNetwork() invalid for %s", (uint8_t *)&v8, 0xCu);
    }
  }
}

void __CNPluginResponseDeallocate(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  v2 = (const void *)a1[3];
  if (v2)
  {
    CFRelease(v2);
    a1[3] = 0;
  }
  v3 = (const void *)a1[4];
  if (v3)
  {
    CFRelease(v3);
    a1[4] = 0;
  }
  v4 = (const void *)a1[5];
  if (v4)
  {
    CFRelease(v4);
    a1[5] = 0;
  }
}

__CFString *__CNPluginResponseCopyDebugDesc(uint64_t a1)
{
  const __CFAllocator *v2;
  __CFString *Mutable;
  const char *String;

  v2 = CFGetAllocator((CFTypeRef)a1);
  Mutable = CFStringCreateMutable(v2, 0);
  String = CNPCommandTypeGetString(*(_DWORD *)(a1 + 16));
  CFStringAppendFormat(Mutable, 0, CFSTR("<CNPluginResponse %s %p>"), String, a1);
  if (*(_QWORD *)(a1 + 32) || *(_QWORD *)(a1 + 40))
  {
    CFStringAppend(Mutable, CFSTR("{"));
    if (*(_QWORD *)(a1 + 32))
      CFStringAppendFormat(Mutable, 0, CFSTR("network = %@"), *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 40))
      CFStringAppendFormat(Mutable, 0, CFSTR("networks = %@"), *(_QWORD *)(a1 + 40));
    CFStringAppend(Mutable, CFSTR("}"));
  }
  return Mutable;
}

void CNWebSheetDone(int a1, void *a2)
{
  void *v4;
  CFDictionaryRef Response;
  NSObject *HandlerQueue;
  NSObject *logger;
  os_log_type_t v8;
  _QWORD block[5];
  uint8_t buf[16];

  if (G_websheet && (v4 = *(void **)(G_websheet + 8)) != 0)
  {
    Response = createResponse(v4, a1, 1, a2);
    HandlerQueue = ServerConnectionGetHandlerQueue(*(_QWORD *)G_websheet);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __CNWebSheetDone_block_invoke;
    block[3] = &__block_descriptor_tmp_5;
    block[4] = Response;
    dispatch_sync(HandlerQueue, block);
    CFRelease(Response);
  }
  else
  {
    logger = mysyslog_get_logger();
    v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v8))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2064D4000, logger, v8, "can't provide result", buf, 2u);
    }
  }
}

CFDictionaryRef createResponse(void *a1, int a2, int a3, void *a4)
{
  CFAllocatorRef *v5;
  CFNumberRef v6;
  unsigned int v7;
  CFDictionaryRef v8;
  int valuePtr;
  void *values;
  CFNumberRef v12;
  uint64_t v13;
  void *keys;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  valuePtr = a2;
  v15 = 0;
  v16 = 0;
  v13 = 0;
  keys = CFSTR("UniqueID");
  values = a1;
  v12 = 0;
  v5 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (a3)
  {
    v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
    v15 = CFSTR("Result");
    v12 = v6;
    v7 = 2;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = 0;
  v7 = 1;
  if (a4)
  {
LABEL_3:
    *(&keys + v7) = CFSTR("ResultOptions");
    *(&values + v7++) = a4;
  }
LABEL_4:
  v8 = CFDictionaryCreate(*v5, (const void **)&keys, (const void **)&values, v7, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v6)
    CFRelease(v6);
  return v8;
}

uint64_t CNWebSheetProbeRequest(const void *a1)
{
  NSObject *HandlerQueue;
  _QWORD block[5];

  if (!G_websheet)
    return 0;
  CFRetain(a1);
  HandlerQueue = ServerConnectionGetHandlerQueue(*(_QWORD *)G_websheet);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __CNWebSheetProbeRequest_block_invoke;
  block[3] = &__block_descriptor_tmp_6;
  block[4] = a1;
  dispatch_async(HandlerQueue, block);
  return 1;
}

uint64_t CNWebSheetRegister(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CFRunLoopRef Current;
  uint64_t *v10;
  NSObject *logger;
  os_log_type_t v12;
  uint8_t v13[16];

  if (G_websheet)
    return 0;
  v5 = malloc_type_malloc(0x38uLL, 0x10E00408C3A25E5uLL);
  G_websheet = (uint64_t)v5;
  *v5 = 0u;
  v5[1] = 0u;
  v5[2] = 0u;
  *((_QWORD *)v5 + 6) = 0;
  v6 = ServerConnectionCreate((uint64_t)"com.apple.networking.captivenetworksupport", (uint64_t)"com.apple.networking.captivenetworksupport.startserver", 1, 0, &__block_literal_global_4, &__block_literal_global_11);
  if (v6)
  {
    v7 = v6;
    v8 = G_websheet;
    *(_QWORD *)(G_websheet + 16) = a1;
    *(_QWORD *)(v8 + 24) = a2;
    Current = CFRunLoopGetCurrent();
    v10 = (uint64_t *)G_websheet;
    *(_QWORD *)(G_websheet + 40) = Current;
    *v10 = v7;
    ServerConnectionResume(v7);
    return 1;
  }
  else
  {
    logger = mysyslog_get_logger();
    v12 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v12))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_2064D4000, logger, v12, "ServerConnectionCreate failed", v13, 2u);
    }
    free((void *)G_websheet);
    result = 0;
    G_websheet = 0;
  }
  return result;
}

void __startProbe_block_invoke(uint64_t a1)
{
  CNProberProvideResult(*(_QWORD *)(a1 + 32), 7);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void provideResponse(void *a1)
{
  CFDictionaryRef v1;
  void *values[3];
  void *keys[4];

  keys[3] = *(void **)MEMORY[0x24BDAC8D0];
  keys[1] = 0;
  keys[2] = 0;
  values[2] = 0;
  keys[0] = CFSTR("UniqueID");
  values[0] = a1;
  values[1] = 0;
  v1 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  ServerConnectionProvideResponse(*(_QWORD *)G_websheet, v1);
  CFRelease(v1);
}

uint64_t ServerConnectionCreate(uint64_t a1, uint64_t a2, int a3, const __CFDictionary *a4, const void *a5, const void *a6)
{
  uint64_t v6;
  CFTypeID TypeID;
  const __CFDictionary *v14;
  uint64_t v15;
  ipc_space_t *v16;
  kern_return_t v17;
  mach_error_t v18;
  NSObject *logger;
  os_log_type_t v20;
  char *v21;
  kern_return_t inserted;
  mach_error_t v23;
  NSObject *v24;
  os_log_type_t v25;
  char *v26;
  mach_port_name_t v27;
  mach_error_t v28;
  mach_error_t v29;
  NSObject *v30;
  os_log_type_t v31;
  char *v32;
  NSObject *v33;
  os_log_type_t v34;
  NSObject *v35;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  mach_port_name_t name;
  int v43;
  uint8_t buf[4];
  char *v45;
  uint64_t v46;

  v6 = 0;
  v46 = *MEMORY[0x24BDAC8D0];
  v38 = 0;
  v39 = &v38;
  v40 = 0x2000000000;
  v41 = 0;
  if (!G_conn)
  {
    G_conn = (uint64_t)malloc_type_malloc(0x60uLL, 0x10F0040ADC7DA84uLL);
    TypeID = CFDictionaryGetTypeID();
    if (a4)
    {
      if (CFGetTypeID(a4) == TypeID)
        v14 = a4;
      else
        v14 = 0;
    }
    else
    {
      v14 = 0;
    }
    v15 = G_conn;
    *(_OWORD *)G_conn = 0u;
    *(_OWORD *)(v15 + 16) = 0u;
    *(_OWORD *)(v15 + 32) = 0u;
    *(_OWORD *)(v15 + 48) = 0u;
    *(_OWORD *)(v15 + 64) = 0u;
    *(_OWORD *)(v15 + 80) = 0u;
    *(_QWORD *)(v15 + 8) = a1;
    *(_QWORD *)(v15 + 16) = a2;
    *(_DWORD *)(v15 + 24) = a3;
    if (v14)
      *(_QWORD *)(v15 + 32) = CFDictionaryCreateCopy(0, v14);
    *(_QWORD *)v15 = dispatch_queue_create("CommandHandler", 0);
    if (a5)
    {
      *(_QWORD *)(v15 + 64) = _Block_copy(a5);
      name = 0;
      v16 = (ipc_space_t *)MEMORY[0x24BDAEC58];
      v17 = mach_port_allocate(*MEMORY[0x24BDAEC58], 1u, &name);
      if (v17)
      {
        v18 = v17;
        logger = mysyslog_get_logger();
        v20 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(logger, v20))
        {
          v21 = mach_error_string(v18);
          *(_DWORD *)buf = 136315138;
          v45 = v21;
          _os_log_impl(&dword_2064D4000, logger, v20, "mach_port_allocate() failed, %s", buf, 0xCu);
        }
      }
      inserted = mach_port_insert_right(*v16, name, name, 0x14u);
      if (inserted)
      {
        v23 = inserted;
        v24 = mysyslog_get_logger();
        v25 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v24, v25))
        {
          v26 = mach_error_string(v23);
          *(_DWORD *)buf = 136315138;
          v45 = v26;
          _os_log_impl(&dword_2064D4000, v24, v25, "mach_port_insert_right failed, %s", buf, 0xCu);
        }
        v27 = 0;
      }
      else
      {
        v43 = 1;
        v28 = MEMORY[0x20BCF7128](*v16, name, 1, &v43, 1);
        if (v28)
        {
          v29 = v28;
          v30 = mysyslog_get_logger();
          v31 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v30, v31))
          {
            v32 = mach_error_string(v29);
            *(_DWORD *)buf = 136315138;
            v45 = v32;
            _os_log_impl(&dword_2064D4000, v30, v31, "mach_port_set_attributes(MACH_PORT_LIMITS_INFO) failed, %s", buf, 0xCu);
          }
        }
        v27 = name;
      }
      *(_DWORD *)(v15 + 72) = v27;
    }
    if (a6)
      *(_QWORD *)(v15 + 88) = _Block_copy(a6);
    if (!*(_QWORD *)v15)
    {
      v33 = mysyslog_get_logger();
      v34 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v33, v34))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2064D4000, v33, v34, "failed to allocate queue", buf, 2u);
      }
      if (!*(_QWORD *)v15)
      {
        free((void *)G_conn);
        goto LABEL_31;
      }
    }
    v35 = *(NSObject **)G_conn;
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 0x40000000;
    v37[2] = __ServerConnectionCreate_block_invoke;
    v37[3] = &unk_24BF216E0;
    v37[4] = &v38;
    dispatch_sync(v35, v37);
    v6 = G_conn;
    if (!*((_BYTE *)v39 + 24))
    {
      ServerConnectionDeallocate((dispatch_object_t *)G_conn);
LABEL_31:
      v6 = 0;
      G_conn = 0;
    }
  }
  _Block_object_dispose(&v38, 8);
  return v6;
}

void ServerConnectionDeallocate(dispatch_object_t *a1)
{
  NSObject *v2;
  _QWORD block[5];

  v2 = *a1;
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __ServerConnectionDeallocate_block_invoke;
    block[3] = &__block_descriptor_tmp_8_1;
    block[4] = a1;
    dispatch_sync(v2, block);
    dispatch_release(*a1);
  }
  else
  {
    ServerConnectionDeallocateSync((uint64_t)a1);
  }
  free(a1);
}

void ServerConnectionRelease(dispatch_object_t *a1)
{
  ServerConnectionDeallocate(a1);
  G_conn = 0;
}

void ServerConnectionResume(uint64_t a1)
{
  uintptr_t v1;
  NSObject *v3;
  NSObject *logger;
  os_log_type_t v5;
  _QWORD v6[5];
  _QWORD handler[4];
  int v8;

  v1 = *(unsigned int *)(a1 + 72);
  if ((_DWORD)v1)
  {
    v3 = dispatch_source_create(MEMORY[0x24BDAC9E0], v1, 0, *(dispatch_queue_t *)a1);
    *(_QWORD *)(a1 + 80) = v3;
    if (v3)
    {
      v6[4] = a1;
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 0x40000000;
      handler[2] = __add_signal_port_source_block_invoke;
      handler[3] = &__block_descriptor_tmp_9_0;
      v8 = v1;
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 0x40000000;
      v6[2] = __add_signal_port_source_block_invoke_2;
      v6[3] = &__block_descriptor_tmp_10_0;
      dispatch_source_set_event_handler(v3, v6);
      dispatch_source_set_cancel_handler(*(dispatch_source_t *)(a1 + 80), handler);
      dispatch_resume(*(dispatch_object_t *)(a1 + 80));
    }
    else
    {
      logger = mysyslog_get_logger();
      v5 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v5))
      {
        LOWORD(v6[0]) = 0;
        _os_log_impl(&dword_2064D4000, logger, v5, "failed to allocate signal_source", (uint8_t *)v6, 2u);
      }
    }
  }
}

uint64_t ServerConnectionGetHandlerQueue(uint64_t a1)
{
  return *(_QWORD *)a1;
}

BOOL ServerConnectionProvideResponse(uint64_t a1, CFPropertyListRef propertyList)
{
  const __CFData *Data;
  const UInt8 *BytePtr;
  int Length;
  mach_error_t v6;
  NSObject *logger;
  os_log_type_t v8;
  _BOOL8 result;
  char *v10;
  char *v11;
  int __errnum;
  uint8_t buf[4];
  char *v14;
  __int16 v15;
  char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!propertyList)
    return 0;
  __errnum = 0;
  Data = my_CFPropertyListCreateData(propertyList);
  LODWORD(a1) = *(_DWORD *)(a1 + 56);
  BytePtr = CFDataGetBytePtr(Data);
  Length = CFDataGetLength(Data);
  v6 = ConnectionProvideResponse(a1, (uint64_t)BytePtr, Length, &__errnum);
  CFRelease(Data);
  if (v6 | __errnum)
  {
    logger = mysyslog_get_logger();
    v8 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(logger, v8);
    if (!result)
      return result;
    v10 = mach_error_string(v6);
    v11 = strerror(__errnum);
    *(_DWORD *)buf = 136315394;
    v14 = v10;
    v15 = 2080;
    v16 = v11;
    _os_log_impl(&dword_2064D4000, logger, v8, "ConnectionProvideResponse failed, %s, %s", buf, 0x16u);
    return 0;
  }
  return 1;
}

BOOL ServerConnectionSendCmdAck(uint64_t a1, CFPropertyListRef propertyList)
{
  const __CFData *Data;
  const UInt8 *BytePtr;
  int Length;
  mach_error_t v6;
  NSObject *logger;
  os_log_type_t v8;
  _BOOL8 result;
  char *v10;
  char *v11;
  int __errnum;
  uint8_t buf[4];
  char *v14;
  __int16 v15;
  char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!propertyList)
    return 0;
  __errnum = 0;
  Data = my_CFPropertyListCreateData(propertyList);
  LODWORD(a1) = *(_DWORD *)(a1 + 56);
  BytePtr = CFDataGetBytePtr(Data);
  Length = CFDataGetLength(Data);
  v6 = ConnectionSendCmdAck(a1, (uint64_t)BytePtr, Length, &__errnum);
  CFRelease(Data);
  if (v6 | __errnum)
  {
    logger = mysyslog_get_logger();
    v8 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(logger, v8);
    if (!result)
      return result;
    v10 = mach_error_string(v6);
    v11 = strerror(__errnum);
    *(_DWORD *)buf = 136315394;
    v14 = v10;
    v15 = 2080;
    v16 = v11;
    _os_log_impl(&dword_2064D4000, logger, v8, "ServerConnectionProvideAck failed, %s, %s", buf, 0x16u);
    return 0;
  }
  return 1;
}

BOOL ServerConnectionProcessControl(uint64_t a1, CFPropertyListRef propertyList, const __CFData **a3)
{
  const __CFData *Data;
  mach_port_t v6;
  const UInt8 *BytePtr;
  int Length;
  mach_error_t v9;
  NSObject *logger;
  os_log_type_t v11;
  _BOOL8 result;
  char *v13;
  char *v14;
  int __errnum[2];
  UInt8 *bytes;
  uint8_t buf[4];
  char *v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a3)
    *a3 = 0;
  if (!propertyList)
    return 0;
  *(_QWORD *)__errnum = 0;
  bytes = 0;
  Data = my_CFPropertyListCreateData(propertyList);
  v6 = *(_DWORD *)(a1 + 56);
  BytePtr = CFDataGetBytePtr(Data);
  Length = CFDataGetLength(Data);
  v9 = ConnectionProcessControl(v6, (uint64_t)BytePtr, Length, &bytes, &__errnum[1], __errnum);
  CFRelease(Data);
  if (v9 | __errnum[0])
  {
    logger = mysyslog_get_logger();
    v11 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(logger, v11);
    if (!result)
      return result;
    v13 = mach_error_string(v9);
    v14 = strerror(__errnum[0]);
    *(_DWORD *)buf = 136315394;
    v18 = v13;
    v19 = 2080;
    v20 = v14;
    _os_log_impl(&dword_2064D4000, logger, v11, "ConnectionProcessControl failed, %s, %s", buf, 0x16u);
    return 0;
  }
  if (bytes)
  {
    if (a3)
      *a3 = my_CFPropertyListCreateWithBytePtrAndLength(bytes, __errnum[1]);
    MEMORY[0x20BCF7230](*MEMORY[0x24BDAEC58]);
  }
  return 1;
}

uint64_t ServerConnectionGetSessionPort(uint64_t a1)
{
  return *(unsigned int *)(a1 + 56);
}

void ServerConnectionCleanup(uint64_t a1)
{
  NSObject *v2;
  mach_port_name_t v3;

  v2 = *(NSObject **)(a1 + 48);
  if (v2)
  {
    dispatch_source_cancel(v2);
    dispatch_release(*(dispatch_object_t *)(a1 + 48));
    *(_QWORD *)(a1 + 48) = 0;
  }
  v3 = *(_DWORD *)(a1 + 40);
  if (v3)
  {
    mach_port_deallocate(*MEMORY[0x24BDAEC58], v3);
    *(_DWORD *)(a1 + 40) = 0;
  }
}

void ServerConnectionDeallocateSync(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  ServerConnectionCleanup(a1);
  mach_port_deallocate(*MEMORY[0x24BDAEC58], *(_DWORD *)(a1 + 56));
  v2 = *(const void **)(a1 + 64);
  if (v2)
  {
    if (*(_DWORD *)(a1 + 72))
    {
      if (*(_QWORD *)(a1 + 80))
      {
        dispatch_source_cancel(*(dispatch_source_t *)(a1 + 80));
        dispatch_release(*(dispatch_object_t *)(a1 + 80));
        *(_QWORD *)(a1 + 80) = 0;
        v2 = *(const void **)(a1 + 64);
      }
      *(_DWORD *)(a1 + 72) = 0;
    }
    _Block_release(v2);
    *(_QWORD *)(a1 + 64) = 0;
  }
  v3 = *(const void **)(a1 + 88);
  if (v3)
  {
    _Block_release(v3);
    *(_QWORD *)(a1 + 88) = 0;
  }
  v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 32) = 0;
  }
}

uint64_t __add_signal_port_source_block_invoke(uint64_t a1)
{
  return mach_port_mod_refs(*MEMORY[0x24BDAEC58], *(_DWORD *)(a1 + 32), 1u, -1);
}

void __add_signal_port_source_block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  mach_port_t v2;
  mach_msg_return_t v3;
  mach_error_t v4;
  NSObject *logger;
  os_log_type_t v6;
  mach_error_t CommandInfo;
  mach_error_t v8;
  NSObject *v9;
  os_log_type_t v10;
  char *v11;
  char *v12;
  const __CFData *v13;
  int __errnum[2];
  UInt8 *bytes;
  uint8_t buf[4];
  char *v17;
  mach_msg_header_t msg;
  uint64_t v19;

  v0 = MEMORY[0x24BDAC7A8]();
  v19 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(v0 + 32);
  *(_QWORD *)__errnum = 0;
  bytes = 0;
  v2 = *(_DWORD *)(v1 + 72);
  msg.msgh_remote_port = 0;
  msg.msgh_local_port = v2;
  *(_QWORD *)&msg.msgh_bits = 0x100000000000;
  msg.msgh_id = 0;
  v3 = mach_msg(&msg, 6, 0, 0x1000u, v2, 0, 0);
  if (v3)
  {
    v4 = v3;
    logger = mysyslog_get_logger();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v6))
    {
      *(_DWORD *)buf = 136315138;
      v17 = mach_error_string(v4);
      _os_log_impl(&dword_2064D4000, logger, v6, "mach_msg: %s", buf, 0xCu);
    }
  }
  CommandInfo = ConnectionGetCommandInfo(*(_DWORD *)(v1 + 56), &bytes, &__errnum[1], __errnum);
  if (CommandInfo | __errnum[0])
  {
    v8 = CommandInfo;
    v9 = mysyslog_get_logger();
    v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = mach_error_string(v8);
      v12 = strerror(__errnum[0]);
      msg.msgh_bits = 136315394;
      *(_QWORD *)&msg.msgh_size = v11;
      LOWORD(msg.msgh_local_port) = 2080;
      *(_QWORD *)((char *)&msg.msgh_local_port + 2) = v12;
      _os_log_impl(&dword_2064D4000, v9, v10, "ConnectionGetCommandInfo failed, %s, %s", (uint8_t *)&msg, 0x16u);
    }
  }
  else
  {
    if (bytes)
    {
      v13 = my_CFPropertyListCreateWithBytePtrAndLength(bytes, __errnum[1]);
      MEMORY[0x20BCF7230](*MEMORY[0x24BDAEC58], bytes, __errnum[1]);
    }
    else
    {
      v13 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(v1 + 64) + 16))();
    if (v13)
      CFRelease(v13);
  }
}

const char *CNPCommandTypeGetString(unsigned int a1)
{
  if (a1 <= 6)
    return CNPCommandTypeGetString_strings[a1];
  else
    return "<unknown>";
}

const char *CNPResultGetString(unsigned int a1)
{
  if (a1 <= 6)
    return CNPResultGetString_strings[a1];
  else
    return "<unknown>";
}

const char *CNPConfidenceGetString(unsigned int a1)
{
  if (a1 <= 2)
    return CNPConfidenceGetString_strings[a1];
  else
    return "<unknown>";
}

const char *CNPCaptiveDetectionTypeGetString(unsigned int a1)
{
  if (a1 <= 3)
    return CNPCaptiveDetectionTypeGetString_strings[a1];
  else
    return "<unknown>";
}

uint64_t CNScanListFilterStart(uint64_t a1, dispatch_object_t object, void *aBlock)
{
  uint64_t result;

  result = 0;
  if (!a1 && object && aBlock)
  {
    if (CNScanListFilterGet_once != -1)
      dispatch_once(&CNScanListFilterGet_once, &__block_literal_global_5);
    CNMonitorSetQueueAndHandler(CNScanListFilterGet_monitor, object, aBlock);
    return 1;
  }
  return result;
}

uint64_t CNScanListFilterStop()
{
  if (CNScanListFilterGet_once != -1)
    dispatch_once(&CNScanListFilterGet_once, &__block_literal_global_5);
  CNMonitorSetQueueAndHandler(CNScanListFilterGet_monitor, 0, 0);
  return 1;
}

void CNScanListFilterHandleCommand(uint64_t a1, CFDictionaryRef theDict)
{
  const void *Value;
  CFTypeID TypeID;
  const void *v6;
  CFTypeID v7;
  const void *v8;
  CFArrayRef v9;
  CFArrayRef v10;
  NSObject *logger;
  os_log_type_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  NSObject *v17;
  os_log_type_t v18;
  NSObject *v19;
  os_log_type_t v20;
  _QWORD v21[7];
  int valuePtr;
  uint8_t buf[4];
  CFDictionaryRef v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  valuePtr = 0;
  Value = CFDictionaryGetValue(theDict, CFSTR("Type"));
  TypeID = CFNumberGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID || !CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, &valuePtr))
  {
    logger = mysyslog_get_logger();
    v12 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v12))
      return;
    *(_DWORD *)buf = 138412290;
    v24 = theDict;
    v13 = "command type invalid/missing in %@";
    v14 = logger;
    v15 = v12;
    v16 = 12;
    goto LABEL_11;
  }
  if (valuePtr == 1)
  {
    v6 = CFDictionaryGetValue(theDict, CFSTR("InterfaceName"));
    v7 = CFStringGetTypeID();
    if (v6 && CFGetTypeID(v6) == v7)
    {
      v8 = CFDictionaryGetValue(theDict, CFSTR("NetworkList"));
      v9 = CNNetworkListCreate(v8, v6);
      if (v9)
      {
        v10 = v9;
        CFRetain(v6);
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 0x40000000;
        v21[2] = __CNScanListFilterHandleCommand_block_invoke;
        v21[3] = &__block_descriptor_tmp_7_1;
        v21[4] = a1;
        v21[5] = v6;
        v21[6] = v10;
        CNMonitorPerformBlock(a1, v21);
        return;
      }
      v19 = mysyslog_get_logger();
      v20 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v19, v20))
      {
        *(_WORD *)buf = 0;
        v13 = "couldn't get the network list";
        goto LABEL_17;
      }
    }
    else
    {
      v19 = mysyslog_get_logger();
      v20 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v19, v20))
      {
        *(_WORD *)buf = 0;
        v13 = "interface name is missing/invalid";
LABEL_17:
        v14 = v19;
        v15 = v20;
        v16 = 2;
        goto LABEL_11;
      }
    }
  }
  else
  {
    v17 = mysyslog_get_logger();
    v18 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = valuePtr;
      v13 = "command type %d unrecognized";
      v14 = v17;
      v15 = v18;
      v16 = 8;
LABEL_11:
      _os_log_impl(&dword_2064D4000, v14, v15, v13, buf, v16);
    }
  }
}

CFDictionaryRef CNScanListFilterCopyControl(int a1)
{
  int v1;
  CFDictionaryRef v2;
  void *values;
  int valuePtr;
  void *keys;

  if (a1)
    v1 = 1;
  else
    v1 = 2;
  valuePtr = v1;
  values = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  keys = CFSTR("Type");
  v2 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFRelease(values);
  return v2;
}

uint64_t LogoffReply(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x24BDAC470];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 18;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 28047703;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x24BDB0418])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
}

uint64_t AuthenticateUsingReply(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x24BDAC470];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 18;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 28047705;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x24BDB0418])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
}

uint64_t CNSClient_server_routine(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 28047706) >= 0xFFFFFFFC)
    return (uint64_t)*(&CNSClientCNSClient_subsystem + 5 * (v1 - 28047702) + 5);
  else
    return 0;
}

_DWORD *_XLogoffReply(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
  }
  else
  {
    result = (_DWORD *)CNSClientLogoffReply();
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

_DWORD *_XAuthenticateUsingReply(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
  }
  else
  {
    result = (_DWORD *)CNSClientAuthenticateUsingReply(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

uint64_t CNSClient_server(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if ((v4 - 28047706) >= 0xFFFFFFFC
    && (v5 = (void (*)(void))*(&CNSClientCNSClient_subsystem + 5 * (v4 - 28047702) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    result = 0;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

uint64_t ParsePost()
{
  mach_port_name_t v0;
  const char *v1;
  _DWORD *v2;
  _DWORD *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  mach_port_name_t v10;
  int v11;
  uint64_t (*v12)(_QWORD, _QWORD, _QWORD);
  int v13;
  uint64_t v14;
  int v15;
  char *v16;
  char *v17;
  char *v18;
  int v19;
  uint64_t v20;
  int v21;
  char *v22;
  char *v23;
  char *v24;
  int v25;
  uint64_t v26;
  int v27;
  char *v28;
  char *v29;
  char *v30;
  int v31;
  mach_msg_size_t v32;
  mach_port_name_t reply_port;
  uint64_t v34;
  uint64_t v35;
  BOOL v37;
  mach_port_name_t rcv_name[4];
  __int128 v40;
  _OWORD v41[1026];
  uint64_t v42;

  v0 = MEMORY[0x24BDAC7A8]();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = v0;
  v42 = *MEMORY[0x24BDAC8D0];
  memset(v41, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v40 = 0u;
  *((_QWORD *)&v40 + 1) = *MEMORY[0x24BDAC470];
  LODWORD(v41[0]) = v11;
  v12 = MEMORY[0x24BDAEF18];
  if (MEMORY[0x24BDAEF18])
    v13 = mig_strncpy_zerofill((char *)v41 + 12, v1, 4096);
  else
    v13 = mig_strncpy((char *)v41 + 12, v1, 4096);
  DWORD1(v41[0]) = 0;
  DWORD2(v41[0]) = v13;
  v14 = (v13 + 3) & 0xFFFFFFFC;
  v15 = v14 + 68;
  v16 = (char *)rcv_name + v14;
  v17 = v16 - 4096;
  v18 = v16 + 52;
  if (v12)
    v19 = mig_strncpy_zerofill(v18, v9, 4096);
  else
    v19 = mig_strncpy(v18, v9, 4096);
  *((_DWORD *)v17 + 1036) = v19;
  *((_DWORD *)v17 + 1035) = 0;
  v20 = (v19 + 3) & 0xFFFFFFFC;
  v21 = v15 + v20;
  v22 = &v17[v20];
  v23 = v22 - 4096;
  v24 = v22 + 4156;
  if (v12)
    v25 = mig_strncpy_zerofill(v24, v7, 4096);
  else
    v25 = mig_strncpy(v24, v7, 4096);
  *((_DWORD *)v23 + 2062) = v25;
  *((_DWORD *)v23 + 2061) = 0;
  v26 = (v25 + 3) & 0xFFFFFFFC;
  v27 = v21 + v26;
  v28 = &v23[v26];
  v29 = v28 - 4096;
  v30 = v28 + 8260;
  if (v12)
    v31 = mig_strncpy_zerofill(v30, v5, 4096);
  else
    v31 = mig_strncpy(v30, v5, 4096);
  *((_DWORD *)v29 + 3088) = v31;
  *((_DWORD *)v29 + 3087) = 0;
  v32 = v27 + ((v31 + 3) & 0xFFFFFFFC);
  reply_port = mig_get_reply_port();
  rcv_name[2] = v10;
  rcv_name[3] = reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v40 = 0x1ABF95600000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    reply_port = rcv_name[3];
  }
  v34 = mach_msg((mach_msg_header_t *)rcv_name, 3, v32, 0x30u, reply_port, 0, 0);
  v35 = v34;
  if ((v34 - 268435458) > 0xE || ((1 << (v34 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v34)
    {
      mig_dealloc_reply_port(rcv_name[3]);
      return v35;
    }
    if (DWORD1(v40) == 71)
    {
      v35 = 4294966988;
    }
    else if (DWORD1(v40) == 28047802)
    {
      if ((rcv_name[0] & 0x80000000) == 0)
      {
        if (rcv_name[1] == 40)
        {
          if (!rcv_name[2])
          {
            v35 = LODWORD(v41[0]);
            if (!LODWORD(v41[0]))
            {
              *v3 = DWORD1(v41[0]);
              return v35;
            }
            goto LABEL_37;
          }
        }
        else if (rcv_name[1] == 36)
        {
          if (rcv_name[2])
            v37 = 1;
          else
            v37 = LODWORD(v41[0]) == 0;
          if (v37)
            v35 = 4294966996;
          else
            v35 = LODWORD(v41[0]);
          goto LABEL_37;
        }
      }
      v35 = 4294966996;
    }
    else
    {
      v35 = 4294966995;
    }
LABEL_37:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v35;
  }
  mig_put_reply_port(rcv_name[3]);
  return v35;
}

uint64_t Logoff()
{
  const char *v0;
  mach_port_name_t v1;
  int v2;
  mach_msg_size_t v3;
  mach_port_name_t reply_port;
  uint64_t v5;
  uint64_t v6;
  mach_port_name_t rcv_name[4];
  __int128 v9;
  _OWORD v10[256];
  uint64_t v11;

  v1 = MEMORY[0x24BDAC7A8]();
  v11 = *MEMORY[0x24BDAC8D0];
  memset(v10, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v9 = 0u;
  *((_QWORD *)&v9 + 1) = *MEMORY[0x24BDAC470];
  if (MEMORY[0x24BDAEF18])
    v2 = mig_strncpy_zerofill((char *)v10 + 8, v0, 4096);
  else
    v2 = mig_strncpy((char *)v10 + 8, v0, 4096);
  LODWORD(v10[0]) = 0;
  DWORD1(v10[0]) = v2;
  v3 = ((v2 + 3) & 0xFFFFFFFC) + 40;
  reply_port = mig_get_reply_port();
  rcv_name[2] = v1;
  rcv_name[3] = reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v9 = 0x1ABF95700000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    reply_port = rcv_name[3];
  }
  v5 = mach_msg((mach_msg_header_t *)rcv_name, 3, v3, 0x2Cu, reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(rcv_name[3]);
    return v6;
  }
  if ((_DWORD)v5)
  {
    mig_dealloc_reply_port(rcv_name[3]);
    return v6;
  }
  if (DWORD1(v9) == 71)
  {
    v6 = 4294966988;
LABEL_20:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v6;
  }
  if (DWORD1(v9) != 28047803)
  {
    v6 = 4294966995;
    goto LABEL_20;
  }
  v6 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0)
    goto LABEL_20;
  if (rcv_name[1] != 36)
    goto LABEL_20;
  if (rcv_name[2])
    goto LABEL_20;
  v6 = LODWORD(v10[0]);
  if (LODWORD(v10[0]))
    goto LABEL_20;
  return v6;
}

uint64_t ForgetNetwork(int a1, uint64_t a2, unsigned int a3)
{
  _BYTE msg[36];
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
  _BYTE v35[28];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v34 = 0u;
  memset(v35, 0, sizeof(v35));
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v12 = 0u;
  v11 = 0u;
  v10 = 0u;
  v9 = 0u;
  v8 = 0u;
  v7 = 0u;
  memset(&msg[4], 0, 32);
  *(_QWORD *)&msg[24] = *MEMORY[0x24BDAC470];
  if (a3 > 0x400)
    return 4294966989;
  __memcpy_chk();
  *(_DWORD *)msg = 19;
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[32] = a3;
  *(_DWORD *)&msg[20] = 28047705;
  *(_QWORD *)&msg[12] = 0;
  if (MEMORY[0x24BDB0418])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 1, ((a3 + 3) & 0xFFFFFFFC) + 36, 0, 0, 0, 0);
}

uint64_t PurgeAccountRecord(int a1, uint64_t a2, unsigned int a3)
{
  _BYTE msg[36];
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
  _BYTE v35[28];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v34 = 0u;
  memset(v35, 0, sizeof(v35));
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v12 = 0u;
  v11 = 0u;
  v10 = 0u;
  v9 = 0u;
  v8 = 0u;
  v7 = 0u;
  memset(&msg[4], 0, 32);
  *(_QWORD *)&msg[24] = *MEMORY[0x24BDAC470];
  if (a3 > 0x400)
    return 4294966989;
  __memcpy_chk();
  *(_DWORD *)msg = 19;
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[32] = a3;
  *(_DWORD *)&msg[20] = 28047706;
  *(_QWORD *)&msg[12] = 0;
  if (MEMORY[0x24BDB0418])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 1, ((a3 + 3) & 0xFFFFFFFC) + 36, 0, 0, 0, 0);
}

uint64_t DebugLaunchWebsheet(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  mach_port_t reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  mach_msg_header_t v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v12 = 1;
  v13 = a2;
  v14 = 16777472;
  v15 = a3;
  v16 = *MEMORY[0x24BDAC470];
  v17 = a3;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&v11.msgh_bits = 2147489043;
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = reply_port;
  *(_QWORD *)&v11.msgh_voucher_port = 0x1ABF95B00000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&v11);
    reply_port = v11.msgh_local_port;
  }
  v7 = mach_msg(&v11, 3, 0x38u, 0x30u, reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v7)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v8;
    }
    if (v11.msgh_id == 71)
    {
      v8 = 4294966988;
    }
    else if (v11.msgh_id == 28047807)
    {
      if ((v11.msgh_bits & 0x80000000) == 0)
      {
        if (v11.msgh_size == 40)
        {
          if (!v11.msgh_remote_port)
          {
            v8 = HIDWORD(v13);
            if (!HIDWORD(v13))
            {
              *a4 = v14;
              return v8;
            }
            goto LABEL_23;
          }
        }
        else if (v11.msgh_size == 36)
        {
          if (v11.msgh_remote_port)
            v9 = 1;
          else
            v9 = HIDWORD(v13) == 0;
          if (v9)
            v8 = 4294966996;
          else
            v8 = HIDWORD(v13);
          goto LABEL_23;
        }
      }
      v8 = 4294966996;
    }
    else
    {
      v8 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v11);
    return v8;
  }
  mig_put_reply_port(v11.msgh_local_port);
  return v8;
}

uint64_t DumpState(mach_port_t a1)
{
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1ABF95C00000000;
  if (MEMORY[0x24BDB0418])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
}

uint64_t CopySupportedInterfaces(int a1, _QWORD *a2, _DWORD *a3, _DWORD *a4)
{
  mach_port_name_t reply_port;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BYTE msg[36];
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1ABF96000000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v9 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x44u, reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 28047812)
      {
        if ((*(_DWORD *)msg & 0x80000000) != 0)
        {
          v10 = 4294966996;
          if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v14) == 1)
          {
            v11 = DWORD1(v14);
            if (DWORD1(v14) == (_DWORD)v15)
            {
              v10 = 0;
              *a2 = *(_QWORD *)&msg[28];
              *a3 = v11;
              *a4 = DWORD1(v15);
              return v10;
            }
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          v10 = 4294966996;
          if (*(_DWORD *)&msg[32])
          {
            if (*(_DWORD *)&msg[8])
              v10 = 4294966996;
            else
              v10 = *(unsigned int *)&msg[32];
          }
        }
        else
        {
          v10 = 4294966996;
        }
      }
      else
      {
        v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  return v10;
}

uint64_t CopyCurrentNetworkInfo()
{
  mach_port_name_t v0;
  const char *v1;
  _DWORD *v2;
  _DWORD *v3;
  _DWORD *v4;
  _DWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  mach_port_name_t v8;
  int v9;
  int v10;
  mach_msg_size_t v11;
  mach_port_name_t reply_port;
  uint64_t v13;
  uint64_t v14;
  int v15;
  mach_port_name_t rcv_name[4];
  _BYTE v18[32];
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
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v0 = MEMORY[0x24BDAC7A8]();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = v0;
  v48 = *MEMORY[0x24BDAC8D0];
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  *(_OWORD *)&v18[16] = 0u;
  v19 = 0u;
  *(_OWORD *)rcv_name = 0u;
  *(_OWORD *)v18 = 0u;
  *(_QWORD *)&v18[8] = *MEMORY[0x24BDAC470];
  *(_DWORD *)&v18[16] = v9;
  if (MEMORY[0x24BDAEF18])
    v10 = mig_strncpy_zerofill(&v18[28], v1, 4096);
  else
    v10 = mig_strncpy(&v18[28], v1, 4096);
  *(_DWORD *)&v18[20] = 0;
  *(_DWORD *)&v18[24] = v10;
  v11 = ((v10 + 3) & 0xFFFFFFFC) + 44;
  reply_port = mig_get_reply_port();
  rcv_name[2] = v8;
  rcv_name[3] = reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)v18 = 0x1ABF96100000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    reply_port = rcv_name[3];
  }
  v13 = mach_msg((mach_msg_header_t *)rcv_name, 3, v11, 0x44u, reply_port, 0, 0);
  v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(rcv_name[3]);
  }
  else
  {
    if (!(_DWORD)v13)
    {
      if (*(_DWORD *)&v18[4] == 71)
      {
        v14 = 4294966988;
      }
      else if (*(_DWORD *)&v18[4] == 28047813)
      {
        if ((rcv_name[0] & 0x80000000) != 0)
        {
          v14 = 4294966996;
          if (*(_DWORD *)&v18[8] == 1 && rcv_name[1] == 60 && !rcv_name[2] && v18[23] == 1)
          {
            v15 = *(_DWORD *)&v18[24];
            if (*(_DWORD *)&v18[24] == DWORD1(v19))
            {
              v14 = 0;
              *v7 = *(_QWORD *)&v18[12];
              *v5 = v15;
              *v3 = DWORD2(v19);
              return v14;
            }
          }
        }
        else if (rcv_name[1] == 36)
        {
          v14 = 4294966996;
          if (*(_DWORD *)&v18[16])
          {
            if (rcv_name[2])
              v14 = 4294966996;
            else
              v14 = *(unsigned int *)&v18[16];
          }
        }
        else
        {
          v14 = 4294966996;
        }
      }
      else
      {
        v14 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v14;
    }
    mig_dealloc_reply_port(rcv_name[3]);
  }
  return v14;
}

uint64_t CopyAccountList(int a1, _QWORD *a2, _DWORD *a3, _DWORD *a4)
{
  mach_port_name_t reply_port;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BYTE msg[36];
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1ABF96200000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v9 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x44u, reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 28047814)
      {
        if ((*(_DWORD *)msg & 0x80000000) != 0)
        {
          v10 = 4294966996;
          if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v14) == 1)
          {
            v11 = DWORD1(v14);
            if (DWORD1(v14) == (_DWORD)v15)
            {
              v10 = 0;
              *a2 = *(_QWORD *)&msg[28];
              *a3 = v11;
              *a4 = DWORD1(v15);
              return v10;
            }
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          v10 = 4294966996;
          if (*(_DWORD *)&msg[32])
          {
            if (*(_DWORD *)&msg[8])
              v10 = 4294966996;
            else
              v10 = *(unsigned int *)&msg[32];
          }
        }
        else
        {
          v10 = 4294966996;
        }
      }
      else
      {
        v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  return v10;
}

uint64_t AddAccount()
{
  unsigned int v0;
  const char *v1;
  mach_port_t *v2;
  mach_port_t *v3;
  int v4;
  int v5;
  char *v6;
  char *v7;
  const char *v8;
  const char *v9;
  unsigned int v10;
  unsigned int v11;
  const void *v12;
  const void *v13;
  unsigned int v14;
  uint64_t (*v15)(_QWORD, _QWORD, _QWORD);
  mach_port_t v16;
  uint64_t msgh_remote_port;
  int v18;
  unsigned int v19;
  unsigned int v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  int v26;
  uint64_t v27;
  char *v28;
  int v29;
  int v30;
  uint64_t v31;
  mach_msg_size_t v32;
  mach_port_name_t reply_port;
  uint64_t v34;
  BOOL v35;
  mach_port_t *v37;
  char *src;
  mach_msg_header_t msg[557];
  uint64_t v40;

  v0 = MEMORY[0x24BDAC7A8]();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = v0;
  v40 = *MEMORY[0x24BDAC8D0];
  memset(msg, 0, 512);
  *(_QWORD *)&msg[1].msgh_bits = *MEMORY[0x24BDAC470];
  v15 = MEMORY[0x24BDAEF18];
  if (MEMORY[0x24BDAEF18])
    v16 = mig_strncpy_zerofill((char *)&msg[1].msgh_voucher_port, v1, 4096);
  else
    v16 = mig_strncpy((char *)&msg[1].msgh_voucher_port, v1, 4096);
  msg[1].msgh_remote_port = 0;
  msg[1].msgh_local_port = v16;
  if (v11 <= 0x400)
  {
    v37 = v3;
    src = v7;
    v18 = v5;
    v19 = v14;
    v20 = (v16 + 3) & 0xFFFFFFFC;
    v21 = (char *)msg + v20;
    v22 = (v11 + 3) & 0xFFFFFFFC;
    v23 = &v21[v22];
    memcpy(v21 + 44, v13, v11);
    *((_DWORD *)v21 + 10) = v11;
    v24 = (uint64_t)&v21[v22 - 5120];
    v25 = &v21[v22 + 52];
    if (v15)
      v26 = mig_strncpy_zerofill(v25, v9, 4096);
    else
      v26 = mig_strncpy(v25, v9, 4096);
    *((_DWORD *)v23 + 12) = v26;
    *((_DWORD *)v23 + 11) = 0;
    v27 = (v26 + 3) & 0xFFFFFFFC;
    v28 = (char *)(v24 + v27 + 5180);
    v29 = v18;
    if (v15)
      v30 = mig_strncpy_zerofill(v28, src, 4096);
    else
      v30 = mig_strncpy(v28, src, 4096);
    *(_DWORD *)(v24 + v27 + 5176) = v30;
    *(_DWORD *)(v24 + v27 + 5172) = 0;
    v31 = (v30 + 3) & 0xFFFFFFFC;
    v32 = v22 + v20 + v27 + v31 + 64;
    *(_DWORD *)(v24 + v27 - 4096 + v31 + 9276) = v29;
    reply_port = mig_get_reply_port();
    *(_QWORD *)&msg[0].msgh_remote_port = __PAIR64__(reply_port, v19);
    msg[0].msgh_bits = 5395;
    *(_QWORD *)&msg[0].msgh_voucher_port = 0x1ABF96300000000;
    if (MEMORY[0x24BDB0418])
    {
      voucher_mach_msg_set(msg);
      reply_port = msg[0].msgh_local_port;
    }
    v34 = mach_msg(msg, 3, v32, 0x30u, reply_port, 0, 0);
    msgh_remote_port = v34;
    if ((v34 - 268435458) <= 0xE && ((1 << (v34 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg[0].msgh_local_port);
      return msgh_remote_port;
    }
    if ((_DWORD)v34)
    {
      mig_dealloc_reply_port(msg[0].msgh_local_port);
      return msgh_remote_port;
    }
    if (msg[0].msgh_id == 71)
    {
      msgh_remote_port = 4294966988;
    }
    else if (msg[0].msgh_id == 28047815)
    {
      if ((msg[0].msgh_bits & 0x80000000) == 0)
      {
        if (msg[0].msgh_size == 40)
        {
          if (!msg[0].msgh_remote_port)
          {
            msgh_remote_port = msg[1].msgh_remote_port;
            if (!msg[1].msgh_remote_port)
            {
              *v37 = msg[1].msgh_local_port;
              return msgh_remote_port;
            }
            goto LABEL_34;
          }
        }
        else if (msg[0].msgh_size == 36)
        {
          if (msg[0].msgh_remote_port)
            v35 = 1;
          else
            v35 = msg[1].msgh_remote_port == 0;
          if (v35)
            msgh_remote_port = 4294966996;
          else
            msgh_remote_port = msg[1].msgh_remote_port;
          goto LABEL_34;
        }
      }
      msgh_remote_port = 4294966996;
    }
    else
    {
      msgh_remote_port = 4294966995;
    }
LABEL_34:
    mach_msg_destroy(msg);
    return msgh_remote_port;
  }
  return 4294966989;
}

uint64_t ResolveAccount()
{
  mach_port_name_t v0;
  const char *v1;
  _DWORD *v2;
  _DWORD *v3;
  mach_port_name_t v4;
  int v5;
  mach_msg_size_t v6;
  mach_port_name_t reply_port;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  mach_port_name_t rcv_name[4];
  __int128 v13;
  _OWORD v14[256];
  uint64_t v15;

  v0 = MEMORY[0x24BDAC7A8]();
  v3 = v2;
  v4 = v0;
  v15 = *MEMORY[0x24BDAC8D0];
  memset(v14, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v13 = 0u;
  *((_QWORD *)&v13 + 1) = *MEMORY[0x24BDAC470];
  if (MEMORY[0x24BDAEF18])
    v5 = mig_strncpy_zerofill((char *)v14 + 8, v1, 4096);
  else
    v5 = mig_strncpy((char *)v14 + 8, v1, 4096);
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v5;
  v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  reply_port = mig_get_reply_port();
  rcv_name[2] = v4;
  rcv_name[3] = reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v13 = 0x1ABF96400000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    reply_port = rcv_name[3];
  }
  v8 = mach_msg((mach_msg_header_t *)rcv_name, 3, v6, 0x30u, reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v8)
    {
      mig_dealloc_reply_port(rcv_name[3]);
      return v9;
    }
    if (DWORD1(v13) == 71)
    {
      v9 = 4294966988;
    }
    else if (DWORD1(v13) == 28047816)
    {
      if ((rcv_name[0] & 0x80000000) == 0)
      {
        if (rcv_name[1] == 40)
        {
          if (!rcv_name[2])
          {
            v9 = LODWORD(v14[0]);
            if (!LODWORD(v14[0]))
            {
              *v3 = DWORD1(v14[0]);
              return v9;
            }
            goto LABEL_26;
          }
        }
        else if (rcv_name[1] == 36)
        {
          if (rcv_name[2])
            v10 = 1;
          else
            v10 = LODWORD(v14[0]) == 0;
          if (v10)
            v9 = 4294966996;
          else
            v9 = LODWORD(v14[0]);
          goto LABEL_26;
        }
      }
      v9 = 4294966996;
    }
    else
    {
      v9 = 4294966995;
    }
LABEL_26:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v9;
  }
  mig_put_reply_port(rcv_name[3]);
  return v9;
}

uint64_t AuthenticateUsing()
{
  mach_port_t v0;
  const char *v1;
  _DWORD *v2;
  _DWORD *v3;
  const char *v4;
  const char *v5;
  mach_port_t v6;
  int v7;
  uint64_t (*v8)(_QWORD, _QWORD, _QWORD);
  int v9;
  uint64_t v10;
  int v11;
  char *v12;
  char *v13;
  char *v14;
  int v15;
  mach_msg_size_t v16;
  mach_port_t reply_port;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  mach_msg_header_t rcv_name;
  int v23;
  int v24;
  __int128 v25;
  _OWORD v26[513];
  uint64_t v27;

  v0 = MEMORY[0x24BDAC7A8]();
  v3 = v2;
  v5 = v4;
  v6 = v0;
  v27 = *MEMORY[0x24BDAC8D0];
  v25 = 0u;
  memset(v26, 0, 464);
  memset(&rcv_name, 0, sizeof(rcv_name));
  v23 = 1;
  v24 = v7;
  DWORD1(v25) = 1376256;
  *((_QWORD *)&v25 + 1) = *MEMORY[0x24BDAC470];
  v8 = MEMORY[0x24BDAEF18];
  if (MEMORY[0x24BDAEF18])
    v9 = mig_strncpy_zerofill((char *)v26 + 8, v1, 4096);
  else
    v9 = mig_strncpy((char *)v26 + 8, v1, 4096);
  LODWORD(v26[0]) = 0;
  DWORD1(v26[0]) = v9;
  v10 = (v9 + 3) & 0xFFFFFFFC;
  v11 = v10 + 64;
  v12 = (char *)&rcv_name + v10;
  v13 = v12 - 4096;
  v14 = v12 + 64;
  if (v8)
    v15 = mig_strncpy_zerofill(v14, v5, 4096);
  else
    v15 = mig_strncpy(v14, v5, 4096);
  *((_DWORD *)v13 + 1039) = v15;
  *((_DWORD *)v13 + 1038) = 0;
  v16 = v11 + ((v15 + 3) & 0xFFFFFFFC);
  reply_port = mig_get_reply_port();
  rcv_name.msgh_remote_port = v6;
  rcv_name.msgh_local_port = reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(_QWORD *)&rcv_name.msgh_voucher_port = 0x1ABF96500000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&rcv_name);
    reply_port = rcv_name.msgh_local_port;
  }
  v18 = mach_msg(&rcv_name, 3, v16, 0x30u, reply_port, 0, 0);
  v19 = v18;
  if ((v18 - 268435458) > 0xE || ((1 << (v18 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v18)
    {
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
      return v19;
    }
    if (rcv_name.msgh_id == 71)
    {
      v19 = 4294966988;
    }
    else if (rcv_name.msgh_id == 28047817)
    {
      if ((rcv_name.msgh_bits & 0x80000000) == 0)
      {
        if (rcv_name.msgh_size == 40)
        {
          if (!rcv_name.msgh_remote_port)
          {
            v19 = v25;
            if (!(_DWORD)v25)
            {
              *v3 = DWORD1(v25);
              return v19;
            }
            goto LABEL_29;
          }
        }
        else if (rcv_name.msgh_size == 36)
        {
          if (rcv_name.msgh_remote_port)
            v20 = 1;
          else
            v20 = (_DWORD)v25 == 0;
          if (v20)
            v19 = 4294966996;
          else
            v19 = v25;
          goto LABEL_29;
        }
      }
      v19 = 4294966996;
    }
    else
    {
      v19 = 4294966995;
    }
LABEL_29:
    mach_msg_destroy(&rcv_name);
    return v19;
  }
  mig_put_reply_port(rcv_name.msgh_local_port);
  return v19;
}

uint64_t AuthenticateUsingToken()
{
  mach_port_t v0;
  const char *v1;
  _DWORD *v2;
  _DWORD *v3;
  unsigned int v4;
  unsigned int v5;
  const void *v6;
  const void *v7;
  mach_port_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  mach_msg_size_t v13;
  mach_port_t reply_port;
  uint64_t v15;
  BOOL v16;
  mach_msg_header_t rcv_name;
  int v19;
  int v20;
  __int128 v21;
  _OWORD v22[321];
  uint64_t v23;

  v0 = MEMORY[0x24BDAC7A8]();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = v0;
  v23 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  memset(v22, 0, 464);
  memset(&rcv_name, 0, sizeof(rcv_name));
  v19 = 1;
  v20 = v9;
  DWORD1(v21) = 1376256;
  *((_QWORD *)&v21 + 1) = *MEMORY[0x24BDAC470];
  if (MEMORY[0x24BDAEF18])
    v10 = mig_strncpy_zerofill((char *)v22 + 8, v1, 4096);
  else
    v10 = mig_strncpy((char *)v22 + 8, v1, 4096);
  LODWORD(v22[0]) = 0;
  DWORD1(v22[0]) = v10;
  if (v5 <= 0x400)
  {
    v12 = (v10 + 3) & 0xFFFFFFFC;
    memcpy((char *)v22 + v12 + 12, v7, v5);
    *(_DWORD *)((char *)v22 + v12 + 8) = v5;
    v13 = ((v5 + 3) & 0xFFFFFFFC) + v12 + 60;
    reply_port = mig_get_reply_port();
    rcv_name.msgh_remote_port = v8;
    rcv_name.msgh_local_port = reply_port;
    rcv_name.msgh_bits = -2147478253;
    *(_QWORD *)&rcv_name.msgh_voucher_port = 0x1ABF96600000000;
    if (MEMORY[0x24BDB0418])
    {
      voucher_mach_msg_set(&rcv_name);
      reply_port = rcv_name.msgh_local_port;
    }
    v15 = mach_msg(&rcv_name, 3, v13, 0x30u, reply_port, 0, 0);
    v11 = v15;
    if ((v15 - 268435458) <= 0xE && ((1 << (v15 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name.msgh_local_port);
      return v11;
    }
    if ((_DWORD)v15)
    {
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
      return v11;
    }
    if (rcv_name.msgh_id == 71)
    {
      v11 = 4294966988;
    }
    else if (rcv_name.msgh_id == 28047818)
    {
      if ((rcv_name.msgh_bits & 0x80000000) == 0)
      {
        if (rcv_name.msgh_size == 40)
        {
          if (!rcv_name.msgh_remote_port)
          {
            v11 = v21;
            if (!(_DWORD)v21)
            {
              *v3 = DWORD1(v21);
              return v11;
            }
            goto LABEL_28;
          }
        }
        else if (rcv_name.msgh_size == 36)
        {
          if (rcv_name.msgh_remote_port)
            v16 = 1;
          else
            v16 = (_DWORD)v21 == 0;
          if (v16)
            v11 = 4294966996;
          else
            v11 = v21;
          goto LABEL_28;
        }
      }
      v11 = 4294966996;
    }
    else
    {
      v11 = 4294966995;
    }
LABEL_28:
    mach_msg_destroy(&rcv_name);
    return v11;
  }
  return 4294966989;
}

uint64_t ConnectionGetCommandInfo(int a1, _QWORD *a2, _DWORD *a3, _DWORD *a4)
{
  mach_port_name_t reply_port;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BYTE msg[36];
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1ABF96900000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v9 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x44u, reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 28047821)
      {
        if ((*(_DWORD *)msg & 0x80000000) != 0)
        {
          v10 = 4294966996;
          if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v14) == 1)
          {
            v11 = DWORD1(v14);
            if (DWORD1(v14) == (_DWORD)v15)
            {
              v10 = 0;
              *a2 = *(_QWORD *)&msg[28];
              *a3 = v11;
              *a4 = DWORD1(v15);
              return v10;
            }
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          v10 = 4294966996;
          if (*(_DWORD *)&msg[32])
          {
            if (*(_DWORD *)&msg[8])
              v10 = 4294966996;
            else
              v10 = *(unsigned int *)&msg[32];
          }
        }
        else
        {
          v10 = 4294966996;
        }
      }
      else
      {
        v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  return v10;
}

uint64_t ConnectionProvideResponse(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  mach_port_t reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  mach_msg_header_t v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v12 = 1;
  v13 = a2;
  v14 = 16777472;
  v15 = a3;
  v16 = *MEMORY[0x24BDAC470];
  v17 = a3;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&v11.msgh_bits = 2147489043;
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = reply_port;
  *(_QWORD *)&v11.msgh_voucher_port = 0x1ABF96A00000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&v11);
    reply_port = v11.msgh_local_port;
  }
  v7 = mach_msg(&v11, 3, 0x38u, 0x30u, reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v7)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v8;
    }
    if (v11.msgh_id == 71)
    {
      v8 = 4294966988;
    }
    else if (v11.msgh_id == 28047822)
    {
      if ((v11.msgh_bits & 0x80000000) == 0)
      {
        if (v11.msgh_size == 40)
        {
          if (!v11.msgh_remote_port)
          {
            v8 = HIDWORD(v13);
            if (!HIDWORD(v13))
            {
              *a4 = v14;
              return v8;
            }
            goto LABEL_23;
          }
        }
        else if (v11.msgh_size == 36)
        {
          if (v11.msgh_remote_port)
            v9 = 1;
          else
            v9 = HIDWORD(v13) == 0;
          if (v9)
            v8 = 4294966996;
          else
            v8 = HIDWORD(v13);
          goto LABEL_23;
        }
      }
      v8 = 4294966996;
    }
    else
    {
      v8 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v11);
    return v8;
  }
  mig_put_reply_port(v11.msgh_local_port);
  return v8;
}

uint64_t ConnectionSendCmdAck(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  mach_port_t reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  mach_msg_header_t v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v12 = 1;
  v13 = a2;
  v14 = 16777472;
  v15 = a3;
  v16 = *MEMORY[0x24BDAC470];
  v17 = a3;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&v11.msgh_bits = 2147489043;
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = reply_port;
  *(_QWORD *)&v11.msgh_voucher_port = 0x1ABF96B00000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&v11);
    reply_port = v11.msgh_local_port;
  }
  v7 = mach_msg(&v11, 3, 0x38u, 0x30u, reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v7)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v8;
    }
    if (v11.msgh_id == 71)
    {
      v8 = 4294966988;
    }
    else if (v11.msgh_id == 28047823)
    {
      if ((v11.msgh_bits & 0x80000000) == 0)
      {
        if (v11.msgh_size == 40)
        {
          if (!v11.msgh_remote_port)
          {
            v8 = HIDWORD(v13);
            if (!HIDWORD(v13))
            {
              *a4 = v14;
              return v8;
            }
            goto LABEL_23;
          }
        }
        else if (v11.msgh_size == 36)
        {
          if (v11.msgh_remote_port)
            v9 = 1;
          else
            v9 = HIDWORD(v13) == 0;
          if (v9)
            v8 = 4294966996;
          else
            v8 = HIDWORD(v13);
          goto LABEL_23;
        }
      }
      v8 = 4294966996;
    }
    else
    {
      v8 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v11);
    return v8;
  }
  mig_put_reply_port(v11.msgh_local_port);
  return v8;
}

uint64_t CopyLandingPageURL(int a1, _QWORD *a2, _DWORD *a3, _QWORD *a4, _DWORD *a5)
{
  mach_port_name_t reply_port;
  uint64_t v11;
  uint64_t v12;
  int v13;
  _BYTE msg[36];
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  *(_DWORD *)&msg[4] = 0;
  *(_OWORD *)&msg[20] = 0u;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1ABF96C00000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v11 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x4Cu, reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v11)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v12 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 28047824)
      {
        if ((*(_DWORD *)msg & 0x80000000) != 0)
        {
          v12 = 4294966996;
          if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 68 && !*(_DWORD *)&msg[8] && BYTE3(v16) == 1)
          {
            v13 = DWORD1(v16);
            if (DWORD1(v16) == (_DWORD)v17)
            {
              v12 = 0;
              *a2 = *(_QWORD *)&msg[28];
              *a3 = v13;
              *a4 = *(_QWORD *)((char *)&v17 + 4);
              *a5 = HIDWORD(v17);
              return v12;
            }
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          v12 = 4294966996;
          if (*(_DWORD *)&msg[32])
          {
            if (*(_DWORD *)&msg[8])
              v12 = 4294966996;
            else
              v12 = *(unsigned int *)&msg[32];
          }
        }
        else
        {
          v12 = 4294966996;
        }
      }
      else
      {
        v12 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v12;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  return v12;
}

uint64_t ConnectionProcessControl(mach_port_t a1, uint64_t a2, int a3, _QWORD *a4, _DWORD *a5, _DWORD *a6)
{
  mach_port_t reply_port;
  uint64_t v11;
  uint64_t v12;
  int v13;
  mach_msg_header_t msg;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  __int128 v21;

  msg.msgh_id = 0;
  v20 = 0;
  v21 = 0u;
  *(_OWORD *)&msg.msgh_size = 0u;
  v16 = 1;
  v17 = a2;
  v18 = 16777472;
  v19 = a3;
  v20 = *MEMORY[0x24BDAC470];
  LODWORD(v21) = a3;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1ABF96D00000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v11 = mach_msg(&msg, 3, 0x38u, 0x44u, reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v11)
    {
      if (msg.msgh_id == 71)
      {
        v12 = 4294966988;
      }
      else if (msg.msgh_id == 28047825)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          v12 = 4294966996;
          if (v16 == 1 && msg.msgh_size == 60 && !msg.msgh_remote_port && HIBYTE(v18) == 1)
          {
            v13 = v19;
            if (v19 == (_DWORD)v21)
            {
              v12 = 0;
              *a4 = v17;
              *a5 = v13;
              *a6 = DWORD1(v21);
              return v12;
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          v12 = 4294966996;
          if (HIDWORD(v17))
          {
            if (msg.msgh_remote_port)
              v12 = 4294966996;
            else
              v12 = HIDWORD(v17);
          }
        }
        else
        {
          v12 = 4294966996;
        }
      }
      else
      {
        v12 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v12;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v12;
}

uint64_t UserInteractionIsRequired(int a1, _DWORD *a2, _DWORD *a3)
{
  mach_port_name_t reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  int v11;
  _BYTE msg[36];
  __int128 v13;

  *(_OWORD *)&msg[20] = 0u;
  v13 = 0u;
  *(_DWORD *)&msg[4] = 0;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1ABF96E00000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v7 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x34u, reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v7)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
      return v8;
    }
    if (*(_DWORD *)&msg[20] == 71)
    {
      v8 = 4294966988;
    }
    else if (*(_DWORD *)&msg[20] == 28047826)
    {
      if ((*(_DWORD *)msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)&msg[4] == 44)
        {
          if (!*(_DWORD *)&msg[8])
          {
            v8 = *(unsigned int *)&msg[32];
            if (!*(_DWORD *)&msg[32])
            {
              v11 = DWORD1(v13);
              *a2 = v13;
              *a3 = v11;
              return v8;
            }
            goto LABEL_23;
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          if (*(_DWORD *)&msg[8])
            v9 = 1;
          else
            v9 = *(_DWORD *)&msg[32] == 0;
          if (v9)
            v8 = 4294966996;
          else
            v8 = *(unsigned int *)&msg[32];
          goto LABEL_23;
        }
      }
      v8 = 4294966996;
    }
    else
    {
      v8 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v8;
  }
  mig_put_reply_port(*(mach_port_t *)&msg[12]);
  return v8;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x24BDBB790](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x24BDBB7A0](allocator, ptr);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x24BDBB7D8](theArray, range.location, range.length, applier, context);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB7E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F8](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB838](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDE0](allocator, theDict);
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

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x24BDBBEE0](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFMachPortRef CFMachPortCreate(CFAllocatorRef allocator, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x24BDBBFA8](allocator, callout, context, shouldFreeInfo);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBBFB0](allocator, port, order);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x24BDBBFC8](port);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
  MEMORY[0x24BDBBFD0](port);
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

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x24BDBC208](propertyList, stream, format, options, error);
}

Boolean CFReadStreamSetProperty(CFReadStreamRef stream, CFStreamPropertyKey propertyName, CFTypeRef propertyValue)
{
  return MEMORY[0x24BDBC280](stream, propertyName, propertyValue);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x24BDBC338](rl, mode, block);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC370](allocator, order, context);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFStringRef CFURLCopyHostName(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC7A0](anURL);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC868](allocator, URLString, baseURL);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D0](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x24BDBC968](stream);
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x24BDBC978](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x24BDBC980](alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x24BDBC9A8](stream);
}

uint64_t NEHelperCopyCurrentNetworkInfo()
{
  return MEMORY[0x24BDAC490]();
}

uint64_t SCNetworkInterfaceSetAdvisory()
{
  return MEMORY[0x24BDF5740]();
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

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x24BDBD138]();
}

uint64_t _SCNetworkInterfaceCreateWithBSDName()
{
  return MEMORY[0x24BDF58F0]();
}

uint64_t _SC_syslog_os_log_mapping()
{
  return MEMORY[0x24BDF5948]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x24BDAD2E0](*(_QWORD *)&bp, service_name, sp);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x24BDAEB90](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x24BDAEBA0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x24BDAEBE8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x24BDAEBF8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x24BDAEC10](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info, *(_QWORD *)&port_infoCnt);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x24BDAEEE0](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x24BDAEEF8]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x24BDAEF08](*(_QWORD *)&reply_port);
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x24BDAEF10](dest, src, *(_QWORD *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x24BDAEF18](dest, src, *(_QWORD *)&len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8E8](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8F0](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x24BDB0380](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x24BDB0390](*(_QWORD *)&target_task, address, size);
}

kern_return_t vm_read(vm_map_read_t target_task, vm_address_t address, vm_size_t size, vm_offset_t *data, mach_msg_type_number_t *dataCnt)
{
  return MEMORY[0x24BDB03E0](*(_QWORD *)&target_task, address, size, data, dataCnt);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x24BDB0418](msg);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

