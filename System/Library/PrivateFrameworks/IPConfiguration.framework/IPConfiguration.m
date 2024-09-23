uint64_t DHCPv6PDServiceGetTypeID()
{
  pthread_once(&stru_256DCBBD0, (void (*)(void))sub_23EC9E050);
  return qword_256DCBC40;
}

uint64_t DHCPv6PDServiceCreate(const __CFString *a1, void *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t Instance;
  CFIndex v10;
  CFNumberRef v11;
  const CFDictionaryKeyCallBacks *v12;
  const CFDictionaryValueCallBacks *v13;
  CFDictionaryRef v14;
  const __CFDictionary *v15;
  uint64_t v16;
  dispatch_queue_t v17;
  SCDynamicStoreRef v18;
  uint64_t v19;
  unsigned int valuePtr;
  CFStringRef v22;
  CFNumberRef v23;
  uint64_t v24;
  void *values;
  CFStringRef v26;
  uint64_t v27;
  char v28[46];
  void *keys;
  const __CFString *v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  v24 = 0;
  keys = 0;
  v30 = 0;
  v31 = 0;
  v22 = 0;
  values = 0;
  v26 = 0;
  v27 = 0;
  IPConfigurationServiceGetTypeID();
  v28[0] = 0;
  if (a2)
    inet_ntop(30, a2, v28, 0x2Eu);
  sub_23ECA48F8();
  _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    __error();
    v8 = _os_log_pack_fill();
    *(_DWORD *)v8 = 136315906;
    *(_QWORD *)(v8 + 4) = "DHCPv6PDServiceCreate";
    *(_WORD *)(v8 + 12) = 2112;
    *(_QWORD *)(v8 + 14) = a1;
    *(_WORD *)(v8 + 22) = 2080;
    *(_QWORD *)(v8 + 24) = v28;
    *(_WORD *)(v8 + 32) = 1024;
    *(_DWORD *)(v8 + 34) = a3;
    __SC_log_send();
  }
  Instance = 0;
  if (a3 > 0x80 || !a1 || a4)
    return Instance;
  keys = (void *)*MEMORY[0x24BDF5B10];
  values = CFSTR("DHCPv6PD");
  if (!a2)
  {
    v10 = 1;
    if (!a3)
      goto LABEL_11;
    goto LABEL_10;
  }
  v22 = sub_23ECA4844(a2);
  v30 = CFSTR("RequestedPrefix");
  v26 = v22;
  v10 = 2;
  if (a3)
  {
LABEL_10:
    valuePtr = a3;
    v11 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
    v23 = v11;
    *(&keys + v10) = CFSTR("RequestedPrefixLength");
    *(&values + v10++) = v11;
  }
LABEL_11:
  v12 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v13 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  v14 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, v10, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  sub_23ECA4580((const void **)&v22);
  sub_23ECA4580((const void **)&v23);
  keys = CFSTR("IPv6Entity");
  values = v14;
  v15 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, v12, v13);
  CFRelease(v14);
  v16 = sub_23EC9ED00(a1, v15);
  CFRelease(v15);
  if (!v16)
    goto LABEL_19;
  pthread_once(&stru_256DCBBD0, (void (*)(void))sub_23EC9E050);
  Instance = _CFRuntimeCreateInstance();
  *(_OWORD *)(Instance + 16) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  v24 = Instance;
  *(_QWORD *)(Instance + 16) = v16;
  v17 = dispatch_queue_create("DHCPv6PDService", 0);
  *(_QWORD *)(Instance + 40) = v17;
  if (!v17)
  {
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      _os_log_pack_size();
      MEMORY[0x24BDAC7A8]();
      __error();
      v19 = _os_log_pack_fill();
      *(_DWORD *)v19 = 136315138;
      *(_QWORD *)(v19 + 4) = "DHCPv6PDServiceCreate";
      __SC_log_send();
    }
    goto LABEL_19;
  }
  v18 = sub_23EC9EA64(Instance, CFSTR("DHCPv6PDService"), 0, (void (__cdecl *)(SCDynamicStoreRef, CFArrayRef, void *))sub_23EC9D930, 0, (_QWORD *)(Instance + 32));
  *(_QWORD *)(Instance + 24) = v18;
  if (!v18)
  {
LABEL_19:
    sub_23ECA4580((const void **)&v24);
    return v24;
  }
  return Instance;
}

void sub_23EC9D930(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  CFPropertyListRef v6;
  BOOL v7;
  NSObject *global_queue;
  uint64_t v9;
  _QWORD block[6];
  BOOL v11;

  v3 = sub_23EC9E83C(a3);
  if (v3)
  {
    v4 = (uint64_t *)v3;
    v5 = *(_QWORD *)(v3 + 16);
    if (v5)
    {
      v6 = IPConfigurationServiceCopyInformation(v5);
      if (v6)
        v7 = 1;
      else
        v7 = sub_23ECA0068(v4[2]);
      global_queue = v4[7];
      if (!global_queue)
        global_queue = dispatch_get_global_queue(0, 0);
      v9 = v4[6];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = sub_23EC9E1D4;
      block[3] = &unk_250F5B798;
      block[4] = v9;
      block[5] = v6;
      v11 = v7;
      dispatch_async(global_queue, block);
    }
  }
}

void DHCPv6PDServiceSetQueueAndHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  _QWORD block[8];

  block[7] = *MEMORY[0x24BDAC8D0];
  v4 = *(NSObject **)(a1 + 40);
  if (v4)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = sub_23EC9DB38;
    block[3] = &unk_250F5B730;
    block[5] = a1;
    block[6] = a2;
    block[4] = a3;
    dispatch_sync(v4, block);
  }
  else
  {
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      _os_log_pack_size();
      MEMORY[0x24BDAC7A8]();
      __error();
      v5 = _os_log_pack_fill();
      *(_DWORD *)v5 = 136315138;
      *(_QWORD *)(v5 + 4) = "DHCPv6PDServiceSetQueueAndHandler";
      __SC_log_send();
    }
  }
}

void sub_23EC9DB38(_QWORD *a1)
{
  NSObject *v1;
  uint64_t v2;
  const void *v3;
  const void *v4;
  NSObject *v5;

  v2 = a1[5];
  v1 = a1[6];
  v3 = (const void *)a1[4];
  v4 = *(const void **)(v2 + 48);
  if (v4)
  {
    _Block_release(v4);
    *(_QWORD *)(v2 + 48) = 0;
  }
  if (v3)
    *(_QWORD *)(v2 + 48) = _Block_copy(v3);
  v5 = *(NSObject **)(v2 + 56);
  if (v5)
  {
    dispatch_release(v5);
    *(_QWORD *)(v2 + 56) = 0;
  }
  if (v1)
  {
    dispatch_retain(v1);
    *(_QWORD *)(v2 + 56) = v1;
  }
}

void DHCPv6PDServiceResume(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD block[6];

  block[5] = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(a1 + 40);
  if (v2 && *(_QWORD *)(a1 + 16))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = sub_23EC9DCFC;
    block[3] = &unk_250F5B750;
    block[4] = a1;
    dispatch_async(v2, block);
  }
  else
  {
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      _os_log_pack_size();
      MEMORY[0x24BDAC7A8]();
      __error();
      v3 = _os_log_pack_fill();
      *(_DWORD *)v3 = 136315138;
      *(_QWORD *)(v3 + 4) = "DHCPv6PDServiceResume";
      __SC_log_send();
    }
  }
}

void sub_23EC9DCFC(uint64_t a1)
{
  sub_23EC9DD04(*(_QWORD *)(a1 + 32));
}

void sub_23EC9DD04(uint64_t a1)
{
  uint64_t v2;
  const __CFArray *v3;
  uint64_t v4;
  NSObject *global_queue;
  uint64_t v6;
  const __SCDynamicStore *v7;
  _QWORD block[5];
  void *values[2];

  values[1] = *(void **)MEMORY[0x24BDAC8D0];
  v2 = a1 + 16;
  values[0] = (void *)IPConfigurationServiceGetNotificationKey(*(_QWORD *)(a1 + 16));
  v3 = CFArrayCreate(0, (const void **)values, 1, MEMORY[0x24BDBD690]);
  SCDynamicStoreSetNotificationKeys(*(SCDynamicStoreRef *)(v2 + 8), v3, 0);
  CFRelease(v3);
  if (SCDynamicStoreSetDispatchQueue(*(SCDynamicStoreRef *)(v2 + 8), *(dispatch_queue_t *)(v2 + 24)))
  {
    if (sub_23EC9FBC0(*(_QWORD *)v2))
      return;
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
      goto LABEL_6;
  }
  else
  {
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
LABEL_6:
      _os_log_pack_size();
      MEMORY[0x24BDAC7A8]();
      __error();
      v4 = _os_log_pack_fill();
      *(_DWORD *)v4 = 136315138;
      *(_QWORD *)(v4 + 4) = "DHCPv6PDServiceResumeSync";
      __SC_log_send();
    }
  }
  v6 = *(_QWORD *)(a1 + 48);
  global_queue = *(NSObject **)(a1 + 56);
  sub_23ECA4580((const void **)v2);
  v7 = *(const __SCDynamicStore **)(a1 + 24);
  if (v7)
  {
    SCDynamicStoreSetDispatchQueue(v7, 0);
    SCDynamicStoreSetNotificationKeys(*(SCDynamicStoreRef *)(a1 + 24), 0, 0);
  }
  if (!global_queue)
    global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = sub_23EC9E338;
  block[3] = &unk_250F5B7C0;
  block[4] = v6;
  dispatch_async(global_queue, block);
}

__n128 DHCPv6PDServiceInfoGetPrefix(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t DHCPv6PDServiceInfoGetPrefixLength(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t DHCPv6PDServiceInfoGetPrefixValidLifetime(uint64_t a1)
{
  return *(unsigned int *)(a1 + 20);
}

uint64_t DHCPv6PDServiceInfoGetPrefixPreferredLifetime(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

const void *DHCPv6PDServiceInfoGetOptionData(uint64_t a1, unsigned int a2)
{
  const void *Value;
  CFTypeID TypeID;
  CFStringRef v5;
  const void *v6;
  CFTypeID v7;

  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), CFSTR("DHCPv6"));
  TypeID = CFDictionaryGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
  {
    CFArrayGetTypeID();
    return 0;
  }
  v5 = CFStringCreateWithFormat(0, 0, CFSTR("Option_%d"), a2);
  v6 = CFDictionaryGetValue((CFDictionaryRef)Value, v5);
  CFRelease(v5);
  v7 = CFArrayGetTypeID();
  if (!v6)
    return 0;
  if (CFGetTypeID(v6) == v7)
    return v6;
  else
    return 0;
}

uint64_t sub_23EC9E050()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  qword_256DCBC40 = result;
  return result;
}

void sub_23EC9E074(uint64_t a1)
{
  unsigned int *v2;
  NSObject *v3;
  const __SCDynamicStore *v4;
  const void *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];

  v2 = *(unsigned int **)(a1 + 32);
  if (v2)
  {
    v3 = *(NSObject **)(a1 + 40);
    if (v3)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = sub_23EC9E1C8;
      block[3] = &unk_250F5B770;
      block[4] = a1;
      dispatch_sync(v3, block);
      v2 = *(unsigned int **)(a1 + 32);
    }
    sub_23EC9E88C(v2);
    *(_QWORD *)(a1 + 32) = 0;
  }
  v4 = *(const __SCDynamicStore **)(a1 + 24);
  if (v4)
  {
    SCDynamicStoreSetDispatchQueue(v4, 0);
    sub_23ECA4580((const void **)(a1 + 24));
  }
  sub_23ECA4580((const void **)(a1 + 16));
  v5 = *(const void **)(a1 + 48);
  if (v5)
  {
    _Block_release(v5);
    *(_QWORD *)(a1 + 48) = 0;
  }
  v6 = *(NSObject **)(a1 + 56);
  if (v6)
  {
    dispatch_release(v6);
    *(_QWORD *)(a1 + 56) = 0;
  }
  v7 = *(NSObject **)(a1 + 40);
  if (v7)
  {
    dispatch_release(v7);
    *(_QWORD *)(a1 + 40) = 0;
  }
}

__CFString *sub_23EC9E144(_QWORD *a1)
{
  const __CFAllocator *v2;
  __CFString *Mutable;

  v2 = CFGetAllocator(a1);
  Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<DHCPv6PDService %p [%p]> {"), a1, v2);
  CFStringAppendFormat(Mutable, 0, CFSTR("service = %@"), a1[2]);
  CFStringAppend(Mutable, CFSTR("}"));
  return Mutable;
}

_QWORD *sub_23EC9E1C8(uint64_t a1)
{
  return sub_23EC9E844(*(_QWORD **)(*(_QWORD *)(a1 + 32) + 32));
}

void sub_23EC9E1D4(uint64_t a1)
{
  const __CFDictionary *v2;
  const __CFDictionary *Value;
  CFTypeID TypeID;
  const __CFString *v5;
  CFTypeID v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const void *v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  int v14;

  v13 = 0;
  v11 = 0u;
  v12 = 0u;
  v2 = *(const __CFDictionary **)(a1 + 40);
  if (v2)
  {
    v13 = 0;
    v12 = 0uLL;
    v11 = 0uLL;
    Value = (const __CFDictionary *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x24BDF59F8]);
    TypeID = CFDictionaryGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID)
      {
        v5 = (const __CFString *)CFDictionaryGetValue(Value, CFSTR("DelegatedPrefix"));
        v6 = CFStringGetTypeID();
        if (v5)
        {
          if (CFGetTypeID(v5) == v6)
          {
            if (sub_23ECA4634(v5, &v11))
            {
              v14 = 0;
              v7 = (const __CFString *)CFDictionaryGetValue(Value, CFSTR("DelegatedPrefixLength"));
              if (sub_23ECA4784(v7, &v14))
              {
                LOBYTE(v12) = v14;
                v8 = (const __CFString *)CFDictionaryGetValue(Value, CFSTR("DelegatedPrefixValidLifetime"));
                if (sub_23ECA4784(v8, &v14))
                {
                  DWORD1(v12) = v14;
                  v9 = (const __CFString *)CFDictionaryGetValue(Value, CFSTR("DelegatedPrefixPreferredLifetime"));
                  if ((sub_23ECA4784(v9, &v14) & 1) != 0)
                  {
                    DWORD2(v12) = v14;
                    v13 = *(_QWORD *)(a1 + 40);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
  v10 = *(const void **)(a1 + 40);
  if (v10)
    CFRelease(v10);
}

uint64_t sub_23EC9E338(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t IPConfigurationForgetNetwork(const __CFString *a1, void *a2)
{
  kern_return_t v4;
  mach_error_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  CFDictionaryRef v10;
  const __CFData *Data;
  const UInt8 *BytePtr;
  int Length;
  mach_error_t v14;
  uint64_t v15;
  char *v16;
  mach_port_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  mach_port_t sp[2];
  void *values;
  void *keys;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)sp = 0;
  sub_23EC9E9D8((uint64_t)"Library");
  if (!a1 || !a2)
  {
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    result = __SC_log_enabled();
    if (!(_DWORD)result)
      return result;
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    __error();
    v9 = _os_log_pack_fill();
    *(_DWORD *)v9 = 136315138;
    *(_QWORD *)(v9 + 4) = "IPConfigurationForgetNetwork";
    goto LABEL_11;
  }
  v4 = bootstrap_look_up(*MEMORY[0x24BDAD2F0], "com.apple.network.IPConfiguration", &sp[1]);
  if (v4)
  {
    v5 = v4;
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    result = __SC_log_enabled();
    if (!(_DWORD)result)
      return result;
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    __error();
    v7 = _os_log_pack_fill();
    v8 = mach_error_string(v5);
    *(_DWORD *)v7 = 136315138;
    *(_QWORD *)(v7 + 4) = v8;
    goto LABEL_11;
  }
  v24 = 0uLL;
  sub_23ECA45B0(a1, (UInt8 *)&v24, 16, 0);
  values = a2;
  keys = CFSTR("SSID");
  v10 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  Data = CFPropertyListCreateData(0, v10, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  CFRelease(v10);
  BytePtr = CFDataGetBytePtr(Data);
  Length = CFDataGetLength(Data);
  v14 = sub_23ECA4208(sp[1], &v24, (uint64_t)BytePtr, Length, (int *)sp);
  CFRelease(Data);
  if (v14)
  {
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    result = __SC_log_enabled();
    if (!(_DWORD)result)
      return result;
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    __error();
    v15 = _os_log_pack_fill();
    v16 = mach_error_string(v14);
    *(_DWORD *)v15 = 136315394;
    *(_QWORD *)(v15 + 4) = &v24;
    *(_WORD *)(v15 + 12) = 2080;
    *(_QWORD *)(v15 + 14) = v16;
    goto LABEL_11;
  }
  v17 = sp[0];
  sub_23ECA48F8();
  _SC_syslog_os_log_mapping();
  result = __SC_log_enabled();
  if (v17)
  {
    if ((_DWORD)result)
    {
      _os_log_pack_size();
      MEMORY[0x24BDAC7A8]();
      __error();
      v18 = _os_log_pack_fill();
      if (sp[0] <= 0x15)
        v19 = off_250F5B7E0[sp[0]];
      else
        v19 = "<unknown>";
      *(_DWORD *)v18 = 136315394;
      *(_QWORD *)(v18 + 4) = &v24;
      *(_WORD *)(v18 + 12) = 2080;
      *(_QWORD *)(v18 + 14) = v19;
LABEL_11:
      __SC_log_send();
      return 0;
    }
  }
  else
  {
    if ((_DWORD)result)
    {
      _os_log_pack_size();
      MEMORY[0x24BDAC7A8]();
      __error();
      v20 = _os_log_pack_fill();
      *(_DWORD *)v20 = 136315138;
      *(_QWORD *)(v20 + 4) = &v24;
      __SC_log_send();
    }
    return 1;
  }
  return result;
}

uint64_t sub_23EC9E824(uint64_t result)
{
  unsigned int *v1;
  unsigned int v2;

  v1 = (unsigned int *)(result + 8);
  do
    v2 = __ldxr(v1);
  while (__stxr(v2 + 1, v1));
  return result;
}

uint64_t sub_23EC9E83C(uint64_t a1)
{
  return *(_QWORD *)a1;
}

_QWORD *sub_23EC9E844(_QWORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23EC9E84C(uint64_t a1)
{
  _DWORD *result;

  result = malloc_type_malloc(0x10uLL, 0x10C0040AE459949uLL);
  *(_QWORD *)result = a1;
  result[2] = 1;
  return result;
}

void sub_23EC9E88C(unsigned int *a1)
{
  unsigned int *v1;
  int v2;

  v1 = a1 + 2;
  do
    v2 = __ldxr(v1);
  while (__stxr(v2 - 1, v1));
  if (v2 == 1)
  {
    free(a1);
  }
  else if (v2 <= 0)
  {
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      _os_log_pack_size();
      MEMORY[0x24BDAC7A8]();
      __error();
      *(_WORD *)_os_log_pack_fill() = 0;
      __SC_log_send();
    }
    abort();
  }
}

void sub_23EC9E9D8(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = sub_23EC9EA44;
  block[3] = &unk_250F5B890;
  block[4] = a1;
  if (qword_254343000 != -1)
    dispatch_once(&qword_254343000, block);
}

uint64_t sub_23EC9EA44(uint64_t a1)
{
  os_log_t v1;

  v1 = os_log_create("com.apple.IPConfiguration", *(const char **)(a1 + 32));
  return sub_23ECA48EC((uint64_t)v1);
}

SCDynamicStoreRef sub_23EC9EA64(uint64_t a1, const __CFString *a2, NSObject *a3, void (__cdecl *a4)(SCDynamicStoreRef, CFArrayRef, void *), uint64_t a5, _QWORD *a6)
{
  _DWORD *v11;
  SCDynamicStoreRef v12;
  const __SCDynamicStore *v13;
  uint64_t v14;
  SCDynamicStoreRef v16;
  SCDynamicStoreContext context;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  context.version = 0;
  *(_OWORD *)&context.retain = *(_OWORD *)off_250F5B910;
  context.copyDescription = 0;
  v11 = sub_23EC9E84C(a1);
  context.info = v11;
  v12 = SCDynamicStoreCreate(0, a2, a4, &context);
  v16 = v12;
  if (!v12)
  {
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    if (!__SC_log_enabled())
      goto LABEL_12;
    goto LABEL_11;
  }
  v13 = v12;
  if (a5 && !SCDynamicStoreSetDisconnectCallBack())
  {
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    if (!__SC_log_enabled())
      goto LABEL_12;
    goto LABEL_11;
  }
  if (!a3 || SCDynamicStoreSetDispatchQueue(v13, a3))
    goto LABEL_14;
  sub_23ECA48F8();
  _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
LABEL_11:
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    __error();
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 138412290;
    *(_QWORD *)(v14 + 4) = a2;
    __SC_log_send();
  }
LABEL_12:
  sub_23ECA4580((const void **)&v16);
  if (v11)
  {
    sub_23EC9E88C(v11);
    v11 = 0;
  }
LABEL_14:
  *a6 = v11;
  return v16;
}

uint64_t sub_23EC9ED00(const __CFString *a1, const __CFDictionary *a2)
{
  const void *Value;
  const void *v5;
  CFTypeID TypeID;
  int v7;
  uint64_t Instance;
  UInt8 *v9;
  uint64_t v10;
  CFStringRef v11;
  __CFDictionary *v12;
  __CFDictionary *v13;
  unsigned int v14;
  const __CFString *v15;
  const void *v16;
  const void *v17;
  CFTypeID v18;
  const void *v19;
  const void *v20;
  CFTypeID v21;
  const void *v22;
  const void *v23;
  CFTypeID v24;
  uint64_t v25;
  unsigned int v26;
  const __CFDictionary *v27;
  unsigned int v28;
  int v29;
  const __CFDictionary *v30;
  const __CFDictionary *v31;
  const __CFDictionary *v32;
  const __CFDictionary *v33;
  CFDictionaryRef v34;
  const __CFDictionary *v35;
  const void *v36;
  const void *v37;
  __CFDictionary *v38;
  __CFDictionary *v39;
  CFIndex v40;
  uint64_t v41;
  __CFDictionary *MutableCopy;
  const __CFString **v44;
  const __CFString *v45;
  CFDictionaryRef v46;
  CFStringRef NetworkServiceEntity;
  CFStringRef *v48;
  const __CFString *v49;
  NSObject *v50;
  SCDynamicStoreRef v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  const __CFDictionary *v58;
  CFDictionaryRef v59;
  __CFDictionary *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  const __CFString *v65;
  const __CFString *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  void *values;
  uint64_t v72;
  void *keys;
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v52 = 0;
  pthread_once(&stru_254342FF0, (void (*)(void))sub_23ECA14DC);
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0;
  if (!a2)
  {
    v7 = 1;
    goto LABEL_6;
  }
  Value = CFDictionaryGetValue(a2, CFSTR("NoPublish"));
  *(_QWORD *)&v53 = Value;
  if (Value)
  {
    v5 = Value;
    TypeID = CFBooleanGetTypeID();
    if (CFGetTypeID(v5) != TypeID)
    {
      sub_23ECA48F8();
      _SC_syslog_os_log_mapping();
      if (!__SC_log_enabled())
        goto LABEL_52;
      _os_log_pack_size();
      MEMORY[0x24BDAC7A8]();
      __error();
      v25 = _os_log_pack_fill();
      *(_DWORD *)v25 = 138412290;
      *(_QWORD *)(v25 + 4) = CFSTR("NoPublish");
LABEL_51:
      __SC_log_send();
      goto LABEL_52;
    }
    v7 = CFBooleanGetValue((CFBooleanRef)v5);
  }
  else
  {
    v7 = 1;
  }
  v15 = CFSTR("MTU");
  v16 = CFDictionaryGetValue(a2, CFSTR("MTU"));
  *((_QWORD *)&v53 + 1) = v16;
  if (v16)
  {
    v17 = v16;
    v18 = CFNumberGetTypeID();
    if (CFGetTypeID(v17) != v18)
    {
      sub_23ECA48F8();
      _SC_syslog_os_log_mapping();
      if (!__SC_log_enabled())
        goto LABEL_52;
      goto LABEL_50;
    }
  }
  v15 = CFSTR("APNName");
  v19 = CFDictionaryGetValue(a2, CFSTR("APNName"));
  *(_QWORD *)&v54 = v19;
  if (v19)
  {
    v20 = v19;
    v21 = CFStringGetTypeID();
    if (CFGetTypeID(v20) != v21)
    {
      sub_23ECA48F8();
      _SC_syslog_os_log_mapping();
      if (!__SC_log_enabled())
        goto LABEL_52;
      goto LABEL_50;
    }
  }
  v15 = CFSTR("ClearState");
  v22 = CFDictionaryGetValue(a2, CFSTR("ClearState"));
  *((_QWORD *)&v54 + 1) = v22;
  if (v22)
  {
    v23 = v22;
    v24 = CFBooleanGetTypeID();
    if (CFGetTypeID(v23) != v24)
    {
      sub_23ECA48F8();
      _SC_syslog_os_log_mapping();
      if (!__SC_log_enabled())
        goto LABEL_52;
LABEL_50:
      _os_log_pack_size();
      MEMORY[0x24BDAC7A8]();
      __error();
      v41 = _os_log_pack_fill();
      *(_DWORD *)v41 = 138412290;
      *(_QWORD *)(v41 + 4) = v15;
      goto LABEL_51;
    }
  }
  if (CFDictionaryContainsKey(a2, CFSTR("IPv4Entity")))
  {
    if (!sub_23EC9F66C(a2, (const __CFDictionary **)&v55 + 1))
      goto LABEL_52;
  }
  else
  {
    LOBYTE(v55) = 1;
    if (!sub_23EC9F7A4(a2, (const __CFDictionary **)&v55 + 1))
      goto LABEL_52;
  }
LABEL_6:
  pthread_once(&stru_254342FF0, (void (*)(void))sub_23ECA14DC);
  Instance = _CFRuntimeCreateInstance();
  *(_OWORD *)(Instance + 16) = 0u;
  v9 = (UInt8 *)(Instance + 16);
  *(_OWORD *)(Instance + 32) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  *(_OWORD *)(Instance + 96) = 0u;
  *(_OWORD *)(Instance + 112) = 0u;
  *(_OWORD *)(Instance + 128) = 0u;
  *(_OWORD *)(Instance + 144) = 0u;
  *(_OWORD *)(Instance + 160) = 0u;
  *(_OWORD *)(Instance + 176) = 0u;
  *(_OWORD *)(Instance + 192) = 0u;
  *(_OWORD *)(Instance + 208) = 0u;
  v52 = Instance;
  if (!Instance)
    goto LABEL_52;
  v10 = Instance;
  *(_QWORD *)v9 = 0;
  *(_QWORD *)(Instance + 24) = 0;
  sub_23ECA45B0(a1, v9, 16, 0);
  v11 = sub_23ECA48AC(0);
  *(_QWORD *)(v10 + 184) = v11;
  v12 = (__CFDictionary *)*MEMORY[0x24BDBD270];
  v65 = CFSTR("MonitorPID");
  v66 = CFSTR("NoPublish");
  v13 = (__CFDictionary *)v53;
  if (!(_QWORD)v53)
    v13 = v12;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v59 = v12;
  v60 = v13;
  if (*((_QWORD *)&v53 + 1))
  {
    *(_QWORD *)&v67 = CFSTR("MTU");
    *(_QWORD *)&v61 = *((_QWORD *)&v53 + 1);
    v14 = 3;
  }
  else
  {
    v14 = 2;
  }
  *(&v65 + v14) = CFSTR("ServiceID");
  *(&v59 + v14) = (CFDictionaryRef)v11;
  v26 = v14 + 1;
  v27 = (const __CFDictionary *)v54;
  if (*((_QWORD *)&v54 + 1))
    v12 = (__CFDictionary *)*((_QWORD *)&v54 + 1);
  *(&v65 + v26) = CFSTR("ClearState");
  *(&v59 + v26) = v12;
  v28 = v14 + 2;
  if (v27)
  {
    *(&v65 + v28) = CFSTR("APNName");
    *(&v59 + v28) = v27;
    v28 = v14 + 3;
  }
  v29 = v55;
  if ((_BYTE)v55)
  {
    v30 = (const __CFDictionary *)v56;
    if ((_QWORD)v56)
    {
      *(&v65 + v28) = CFSTR("PerformNUD");
      *(&v59 + v28++) = v30;
    }
    v31 = (const __CFDictionary *)v57;
    if ((_QWORD)v57)
    {
      *(&v65 + v28) = CFSTR("EnableDAD");
      *(&v59 + v28++) = v31;
    }
    v32 = (const __CFDictionary *)*((_QWORD *)&v57 + 1);
    if (*((_QWORD *)&v57 + 1))
    {
      *(&v65 + v28) = CFSTR("EnableCLAT46");
      *(&v59 + v28++) = v32;
    }
    v33 = v58;
    if (v58)
    {
      *(&v65 + v28) = CFSTR("EnableDHCPv6");
      *(&v59 + v28++) = v33;
    }
    v34 = CFDictionaryCreate(0, (const void **)&v65, (const void **)&v59, v28, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v35 = (const __CFDictionary *)*((_QWORD *)&v55 + 1);
    if (*((_QWORD *)&v55 + 1))
    {
      v36 = (const void *)*((_QWORD *)&v56 + 1);
      if (*((_QWORD *)&v56 + 1))
      {
        v37 = (const void *)*MEMORY[0x24BDF5B20];
        if (!CFDictionaryContainsKey(*((CFDictionaryRef *)&v55 + 1), (const void *)*MEMORY[0x24BDF5B20]))
        {
          MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v35);
          CFDictionarySetValue(MutableCopy, v37, v36);
LABEL_62:
          v44 = (const __CFString **)MEMORY[0x24BDF59F8];
          goto LABEL_63;
        }
      }
      v38 = (__CFDictionary *)CFRetain(v35);
    }
    else
    {
      keys = (void *)*MEMORY[0x24BDF5B10];
      v74 = 0;
      values = (void *)*MEMORY[0x24BDF5C10];
      v72 = 0;
      if (*((_QWORD *)&v56 + 1))
      {
        v74 = *MEMORY[0x24BDF5B20];
        v72 = *((_QWORD *)&v56 + 1);
        v40 = 2;
      }
      else
      {
        v40 = 1;
      }
      v38 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, v40, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    }
    MutableCopy = v38;
    goto LABEL_62;
  }
  v34 = CFDictionaryCreate(0, (const void **)&v65, (const void **)&v59, v28, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (*((_QWORD *)&v55 + 1))
    v39 = (__CFDictionary *)CFRetain(*((CFTypeRef *)&v55 + 1));
  else
    v39 = CFDictionaryCreate(0, MEMORY[0x24BDF5AE0], MEMORY[0x24BDF5BE0], 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  MutableCopy = v39;
  v44 = (const __CFString **)MEMORY[0x24BDF59F0];
LABEL_63:
  v45 = *v44;
  v65 = CFSTR("__IPConfigurationServiceOptions");
  v66 = v45;
  v59 = v34;
  v60 = MutableCopy;
  v46 = CFDictionaryCreate(0, (const void **)&v65, (const void **)&v59, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFRelease(v34);
  CFRelease(MutableCopy);
  *(_QWORD *)(v10 + 208) = v46;
  *(_BYTE *)(v10 + 216) = v29;
  if (v7)
  {
    NetworkServiceEntity = CFStringCreateWithFormat(0, 0, CFSTR("Plugin:IPConfigurationService:%@"), *(_QWORD *)(v10 + 184));
  }
  else
  {
    v48 = (CFStringRef *)MEMORY[0x24BDF59F8];
    if (!v29)
      v48 = (CFStringRef *)MEMORY[0x24BDF59F0];
    NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, (CFStringRef)*MEMORY[0x24BDF59B0], *(CFStringRef *)(v10 + 184), *v48);
  }
  *(_OWORD *)(v10 + 56) = 0u;
  *(_QWORD *)(v10 + 192) = NetworkServiceEntity;
  v49 = *(const __CFString **)(v10 + 184);
  *(_OWORD *)(v10 + 72) = 0u;
  *(_OWORD *)(v10 + 88) = 0u;
  *(_OWORD *)(v10 + 104) = 0u;
  *(_OWORD *)(v10 + 120) = 0u;
  *(_OWORD *)(v10 + 136) = 0u;
  *(_OWORD *)(v10 + 152) = 0u;
  *(_OWORD *)(v10 + 168) = 0u;
  sub_23ECA45B0(v49, (UInt8 *)(v10 + 56), 128, 0);
  v50 = dispatch_queue_create("IPConfigurationService", 0);
  *(_QWORD *)(v10 + 48) = v50;
  if (v50)
  {
    v51 = sub_23EC9EA64(v10, CFSTR("IPConfigurationService"), v50, (void (__cdecl *)(SCDynamicStoreRef, CFArrayRef, void *))nullsub_1, (uint64_t)sub_23EC9FA08, (_QWORD *)(v10 + 200));
    *(_QWORD *)(v10 + 40) = v51;
    if (v51)
      return v10;
    goto LABEL_52;
  }
  sub_23ECA48F8();
  _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    __error();
    *(_WORD *)_os_log_pack_fill() = 0;
    goto LABEL_51;
  }
LABEL_52:
  sub_23ECA4580((const void **)&v52);
  return v52;
}

uint64_t IPConfigurationServiceGetTypeID()
{
  pthread_once(&stru_254342FF0, (void (*)(void))sub_23ECA14DC);
  return qword_254343008;
}

uint64_t sub_23EC9F66C(const __CFDictionary *a1, const __CFDictionary **a2)
{
  const __CFDictionary *Value;
  const __CFDictionary *v4;
  uint64_t result;
  uint64_t v6;

  Value = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("IPv4Entity"));
  if (!Value)
    return 1;
  v4 = Value;
  if (sub_23ECA0670(Value))
  {
    *a2 = v4;
    return 1;
  }
  sub_23ECA48F8();
  _SC_syslog_os_log_mapping();
  result = __SC_log_enabled();
  if ((_DWORD)result)
  {
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    __error();
    v6 = _os_log_pack_fill();
    *(_DWORD *)v6 = 138412290;
    *(_QWORD *)(v6 + 4) = CFSTR("IPv4Entity");
    __SC_log_send();
    return 0;
  }
  return result;
}

uint64_t sub_23EC9F7A4(const __CFDictionary *a1, const __CFDictionary **a2)
{
  uint64_t result;
  const __CFString *v5;
  const __CFDictionary *Value;
  const __CFDictionary *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  result = sub_23ECA0D5C(a1, CFSTR("PerformNUD"), a2 + 1);
  if ((_DWORD)result)
  {
    result = sub_23ECA0D5C(a1, CFSTR("EnableDAD"), a2 + 3);
    if ((_DWORD)result)
    {
      result = sub_23ECA0D5C(a1, CFSTR("EnableCLAT46"), a2 + 4);
      if ((_DWORD)result)
      {
        result = sub_23ECA0D5C(a1, CFSTR("EnableDHCPv6"), a2 + 5);
        if ((_DWORD)result)
        {
          v11[0] = 0;
          v11[1] = 0;
          v5 = CFSTR("IPv6Entity");
          Value = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("IPv6Entity"));
          if (Value)
          {
            v7 = Value;
            if (!sub_23ECA0EA0(Value))
            {
              sub_23ECA48F8();
              _SC_syslog_os_log_mapping();
              result = __SC_log_enabled();
              if (!(_DWORD)result)
                return result;
              _os_log_pack_size();
              MEMORY[0x24BDAC7A8]();
              __error();
              goto LABEL_18;
            }
            *a2 = v7;
          }
          v5 = CFSTR("IPv6LinkLocalAddress");
          v8 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("IPv6LinkLocalAddress"));
          if (!v8)
            return 1;
          v9 = v8;
          if (sub_23ECA4634(v8, v11) && LOBYTE(v11[0]) == 254 && (BYTE1(v11[0]) & 0xC0) == 0x80)
          {
            a2[2] = (const __CFDictionary *)v9;
            return 1;
          }
          sub_23ECA48F8();
          _SC_syslog_os_log_mapping();
          result = __SC_log_enabled();
          if ((_DWORD)result)
          {
            _os_log_pack_size();
            MEMORY[0x24BDAC7A8]();
            __error();
LABEL_18:
            v10 = _os_log_pack_fill();
            *(_DWORD *)v10 = 138412290;
            *(_QWORD *)(v10 + 4) = v5;
            __SC_log_send();
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_23EC9FA08(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;
  const __CFDictionary *Value;
  const __CFDictionary *v5;
  __CFDictionary *MutableCopy;
  __CFDictionary *v7;
  uint64_t v8;

  result = sub_23EC9E83C(a2);
  if (result)
  {
    v3 = result;
    if (*(_DWORD *)(result + 32))
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(result + 208), CFSTR("__IPConfigurationServiceOptions"));
      if (Value)
      {
        v5 = Value;
        if (CFDictionaryContainsKey(Value, CFSTR("ClearState")))
        {
          MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v5);
          CFDictionaryRemoveValue(MutableCopy, CFSTR("ClearState"));
          v7 = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)(v3 + 208));
          CFDictionarySetValue(v7, CFSTR("__IPConfigurationServiceOptions"), MutableCopy);
          CFRelease(MutableCopy);
          CFRelease(*(CFTypeRef *)(v3 + 208));
          *(_QWORD *)(v3 + 208) = v7;
        }
      }
      sub_23ECA48F8();
      _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        _os_log_pack_size();
        MEMORY[0x24BDAC7A8]();
        __error();
        v8 = _os_log_pack_fill();
        *(_DWORD *)v8 = 136315138;
        *(_QWORD *)(v8 + 4) = v3 + 16;
        __SC_log_send();
      }
      return sub_23EC9FD78(v3, *(_DWORD *)(v3 + 32));
    }
    else
    {
      *(_BYTE *)(result + 217) = 1;
    }
  }
  return result;
}

uint64_t sub_23EC9FBC0(uint64_t a1)
{
  kern_return_t v2;
  mach_error_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v7;
  _QWORD block[5];
  mach_port_t v9;
  mach_port_t sp;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  sp = 0;
  v2 = bootstrap_look_up(*MEMORY[0x24BDAD2F0], "com.apple.network.IPConfiguration", &sp);
  if (v2)
  {
    v3 = v2;
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      _os_log_pack_size();
      MEMORY[0x24BDAC7A8]();
      __error();
      v4 = _os_log_pack_fill();
      v5 = mach_error_string(v3);
      *(_DWORD *)v4 = 136315138;
      *(_QWORD *)(v4 + 4) = v5;
      __SC_log_send();
    }
  }
  else if (!sub_23EC9FD78(a1, sp))
  {
    v7 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = sub_23ECA0044;
    block[3] = &unk_250F5B928;
    block[4] = a1;
    v9 = sp;
    dispatch_sync(v7, block);
    return 1;
  }
  if (sp)
    mach_port_deallocate(*MEMORY[0x24BDAEC58], sp);
  return 0;
}

uint64_t sub_23EC9FD78(uint64_t a1, mach_port_t a2)
{
  const __CFData *Data;
  const UInt8 *BytePtr;
  int Length;
  __int128 *v7;
  _OWORD *v8;
  mach_error_t v9;
  uint64_t v10;
  char *v11;
  int v13;
  mach_error_t v14;
  uint64_t v15;
  const char *v16;
  unsigned int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  Data = CFPropertyListCreateData(0, *(CFPropertyListRef *)(a1 + 208), kCFPropertyListBinaryFormat_v1_0, 0, 0);
  BytePtr = CFDataGetBytePtr(Data);
  Length = CFDataGetLength(Data);
  v7 = (__int128 *)(a1 + 16);
  v8 = (_OWORD *)(a1 + 56);
  v9 = sub_23ECA3AB8(a2, (__int128 *)(a1 + 16), (uint64_t)BytePtr, Length, (_OWORD *)(a1 + 56), &v17);
  if (v9)
  {
LABEL_2:
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      _os_log_pack_size();
      MEMORY[0x24BDAC7A8]();
      __error();
      v10 = _os_log_pack_fill();
      v11 = mach_error_string(v9);
      *(_DWORD *)v10 = 136315394;
      *(_QWORD *)(v10 + 4) = v7;
      *(_WORD *)(v10 + 12) = 2080;
      *(_QWORD *)(v10 + 14) = v11;
LABEL_4:
      __SC_log_send();
    }
  }
  else
  {
    v13 = 0;
    while (v17)
    {
      if (((v17 == 15) & ~v13) == 0)
      {
        sub_23ECA48F8();
        _SC_syslog_os_log_mapping();
        if (!__SC_log_enabled())
          break;
        _os_log_pack_size();
        MEMORY[0x24BDAC7A8]();
        __error();
        v15 = _os_log_pack_fill();
        if (v17 <= 0x15)
          v16 = off_250F5B990[v17];
        else
          v16 = "<unknown>";
        *(_DWORD *)v15 = 136315394;
        *(_QWORD *)(v15 + 4) = v7;
        *(_WORD *)(v15 + 12) = 2080;
        *(_QWORD *)(v15 + 14) = v16;
        goto LABEL_4;
      }
      sub_23ECA3CC8(a2, v7, (uint64_t)BytePtr, Length, (int *)&v17);
      v14 = sub_23ECA3AB8(a2, v7, (uint64_t)BytePtr, Length, v8, &v17);
      v13 = 1;
      if (v14)
      {
        v9 = v14;
        goto LABEL_2;
      }
    }
  }
  CFRelease(Data);
  return v17;
}

uint64_t sub_23ECA0044(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  *(_DWORD *)(v1 + 32) = *(_DWORD *)(result + 40);
  if (*(_BYTE *)(v1 + 217))
    return sub_23EC9FD78(v1, *(_DWORD *)(result + 40));
  return result;
}

BOOL sub_23ECA0068(uint64_t a1)
{
  NSObject *v1;
  _BOOL8 v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2000000000;
  v8 = 17;
  v1 = *(NSObject **)(a1 + 48);
  if (v1 && *(_DWORD *)(a1 + 32))
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 0x40000000;
    v4[2] = sub_23ECA011C;
    v4[3] = &unk_250F5B950;
    v4[4] = &v5;
    v4[5] = a1;
    dispatch_sync(v1, v4);
    v2 = *((_DWORD *)v6 + 6) == 0;
  }
  else
  {
    v2 = 0;
  }
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_23ECA011C(uint64_t a1)
{
  uint64_t result;
  mach_error_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;

  result = sub_23ECA43B8(*(_DWORD *)(*(_QWORD *)(a1 + 40) + 32), (__int128 *)(*(_QWORD *)(a1 + 40) + 16), (__int128 *)(*(_QWORD *)(a1 + 40) + 56), (_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  if ((_DWORD)result)
  {
    v3 = result;
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    result = __SC_log_enabled();
    if ((_DWORD)result)
    {
      _os_log_pack_size();
      __error();
      v4 = _os_log_pack_fill();
      v5 = *(_QWORD *)(a1 + 40);
      v6 = v5 + 16;
      v7 = v5 + 56;
      v8 = mach_error_string(v3);
      *(_DWORD *)v4 = 136315650;
      *(_QWORD *)(v4 + 4) = v6;
      *(_WORD *)(v4 + 12) = 2080;
      *(_QWORD *)(v4 + 14) = v7;
      *(_WORD *)(v4 + 22) = 2080;
      *(_QWORD *)(v4 + 24) = v8;
      return __SC_log_send();
    }
  }
  return result;
}

const void *IPConfigurationServiceCreate(const __CFString *a1, const __CFDictionary *a2)
{
  uint64_t v4;
  const void *v5;
  const void *v6;
  const void *v8[2];

  v8[1] = *(const void **)MEMORY[0x24BDAC8D0];
  sub_23ECA48F8();
  _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    __error();
    v4 = _os_log_pack_fill();
    *(_DWORD *)v4 = 136315394;
    *(_QWORD *)(v4 + 4) = "IPConfigurationServiceCreate";
    *(_WORD *)(v4 + 12) = 2112;
    *(_QWORD *)(v4 + 14) = a1;
    __SC_log_send();
  }
  v5 = (const void *)sub_23EC9ED00(a1, a2);
  v6 = v5;
  v8[0] = v5;
  if (v5 && !sub_23EC9FBC0((uint64_t)v5))
  {
    sub_23ECA4580(v8);
    return v8[0];
  }
  return v6;
}

uint64_t IPConfigurationServiceGetNotificationKey(uint64_t a1)
{
  return *(_QWORD *)(a1 + 192);
}

CFPropertyListRef IPConfigurationServiceCopyInformation(uint64_t a1)
{
  CFPropertyListRef v1;
  CFTypeID TypeID;
  const void *v4;

  v1 = SCDynamicStoreCopyValue(*(SCDynamicStoreRef *)(a1 + 40), *(CFStringRef *)(a1 + 192));
  v4 = v1;
  if (v1)
  {
    TypeID = CFDictionaryGetTypeID();
    if (CFGetTypeID(v1) != TypeID)
    {
      sub_23ECA4580(&v4);
      return v4;
    }
  }
  return v1;
}

uint64_t IPConfigurationServiceRefreshConfiguration(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  mach_error_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  const char *v8;
  unsigned int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v1 = a1 + 16;
  v2 = a1 + 56;
  result = sub_23ECA4040(*(_DWORD *)(a1 + 32), (__int128 *)(a1 + 16), (__int128 *)(a1 + 56), &v9);
  if ((_DWORD)result)
  {
    v4 = result;
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    result = __SC_log_enabled();
    if (!(_DWORD)result)
      return result;
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    __error();
    v5 = _os_log_pack_fill();
    v6 = mach_error_string(v4);
    *(_DWORD *)v5 = 136315650;
    *(_QWORD *)(v5 + 4) = v1;
    *(_WORD *)(v5 + 12) = 2080;
    *(_QWORD *)(v5 + 14) = v2;
    *(_WORD *)(v5 + 22) = 2080;
    *(_QWORD *)(v5 + 24) = v6;
    return __SC_log_send();
  }
  if (v9)
  {
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    result = __SC_log_enabled();
    if ((_DWORD)result)
    {
      _os_log_pack_size();
      MEMORY[0x24BDAC7A8]();
      __error();
      v7 = _os_log_pack_fill();
      if (v9 <= 0x15)
        v8 = off_250F5B990[v9];
      else
        v8 = "<unknown>";
      *(_DWORD *)v7 = 136315650;
      *(_QWORD *)(v7 + 4) = v1;
      *(_WORD *)(v7 + 12) = 2080;
      *(_QWORD *)(v7 + 14) = v2;
      *(_WORD *)(v7 + 22) = 2080;
      *(_QWORD *)(v7 + 24) = v8;
      return __SC_log_send();
    }
  }
  return result;
}

uint64_t sub_23ECA0670(const __CFDictionary *a1)
{
  const void *Value;
  CFTypeID TypeID;
  uint64_t v4;
  const void *v5;
  CFTypeID v6;
  CFIndex Count;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  const void *v12;
  CFTypeID v13;
  uint64_t v14;
  uint64_t result;
  const void *v16;
  const void *v17;
  CFTypeID v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x24BDF5AE0]);
  TypeID = CFStringGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
    return 0;
  if (!CFEqual(Value, (CFTypeRef)*MEMORY[0x24BDF5BF8]))
  {
    if (CFEqual(Value, (CFTypeRef)*MEMORY[0x24BDF5BE0]))
    {
      v4 = *MEMORY[0x24BDF5AE8];
      v16 = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x24BDF5AE8]);
      if (v16)
      {
        v17 = v16;
        v18 = CFStringGetTypeID();
        if (CFGetTypeID(v17) == v18)
        {
          v10 = 2;
          goto LABEL_29;
        }
        sub_23ECA48F8();
        _SC_syslog_os_log_mapping();
        result = __SC_log_enabled();
        if (!(_DWORD)result)
          return result;
LABEL_18:
        _os_log_pack_size();
        MEMORY[0x24BDAC7A8]();
        __error();
        goto LABEL_19;
      }
    }
    else
    {
      result = CFEqual(Value, (CFTypeRef)*MEMORY[0x24BDF5BF0]);
      if (!(_DWORD)result)
        return result;
    }
    v10 = 1;
    goto LABEL_29;
  }
  v20 = 0;
  v21[0] = 0;
  v4 = *MEMORY[0x24BDF5AD8];
  v5 = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x24BDF5AD8]);
  v6 = CFArrayGetTypeID();
  if (!v5 || CFGetTypeID(v5) != v6)
  {
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    if (!__SC_log_enabled())
      return 0;
    goto LABEL_18;
  }
  Count = CFArrayGetCount((CFArrayRef)v5);
  if (!Count)
  {
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    if (!__SC_log_enabled())
      return 0;
    goto LABEL_18;
  }
  v8 = Count;
  if (!sub_23ECA0B38(a1, (const void *)*MEMORY[0x24BDF5B00], Count, &v20)
    || !sub_23ECA0B38(a1, (const void *)*MEMORY[0x24BDF5AF0], v8, v21))
  {
    return 0;
  }
  v9 = 2;
  if (v20)
    v9 = 3;
  if (v21[0])
    v10 = v9 + 1;
  else
    v10 = v9;
  v4 = *MEMORY[0x24BDF5AF8];
  v11 = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x24BDF5AF8]);
  if (v11)
  {
    v12 = v11;
    v13 = CFStringGetTypeID();
    if (CFGetTypeID(v12) == v13)
    {
      ++v10;
      goto LABEL_29;
    }
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    if (!__SC_log_enabled())
      return 0;
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    __error();
LABEL_19:
    v14 = _os_log_pack_fill();
    *(_DWORD *)v14 = 138412290;
    *(_QWORD *)(v14 + 4) = v4;
LABEL_20:
    __SC_log_send();
    return 0;
  }
LABEL_29:
  if (v10 == CFDictionaryGetCount(a1))
    return 1;
  sub_23ECA48F8();
  _SC_syslog_os_log_mapping();
  result = __SC_log_enabled();
  if ((_DWORD)result)
  {
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    __error();
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 138412290;
    *(_QWORD *)(v19 + 4) = a1;
    goto LABEL_20;
  }
  return result;
}

uint64_t sub_23ECA0B38(const __CFDictionary *a1, const void *a2, uint64_t a3, _QWORD *a4)
{
  const void *Value;
  CFTypeID TypeID;
  CFIndex Count;
  uint64_t result;
  uint64_t v11;
  CFIndex v12;
  uint64_t v13;

  *a4 = 0;
  Value = CFDictionaryGetValue(a1, a2);
  if (!Value)
    goto LABEL_4;
  TypeID = CFArrayGetTypeID();
  if (CFGetTypeID(Value) != TypeID)
  {
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    result = __SC_log_enabled();
    if (!(_DWORD)result)
      return result;
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    __error();
    v11 = _os_log_pack_fill();
    *(_DWORD *)v11 = 138412290;
    *(_QWORD *)(v11 + 4) = a2;
    __SC_log_send();
    return 0;
  }
  Count = CFArrayGetCount((CFArrayRef)Value);
  if (Count == a3)
  {
LABEL_4:
    *a4 = Value;
    return 1;
  }
  v12 = Count;
  sub_23ECA48F8();
  _SC_syslog_os_log_mapping();
  result = __SC_log_enabled();
  if ((_DWORD)result)
  {
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    __error();
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 138412802;
    *(_QWORD *)(v13 + 4) = a2;
    *(_WORD *)(v13 + 12) = 2048;
    *(_QWORD *)(v13 + 14) = v12;
    *(_WORD *)(v13 + 22) = 2048;
    *(_QWORD *)(v13 + 24) = a3;
    __SC_log_send();
    return 0;
  }
  return result;
}

uint64_t sub_23ECA0D5C(const __CFDictionary *a1, const void *a2, _QWORD *a3)
{
  const void *Value;
  CFTypeID TypeID;
  uint64_t result;
  uint64_t v8;

  *a3 = 0;
  Value = CFDictionaryGetValue(a1, a2);
  if (Value && (TypeID = CFBooleanGetTypeID(), CFGetTypeID(Value) != TypeID))
  {
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    result = __SC_log_enabled();
    if ((_DWORD)result)
    {
      _os_log_pack_size();
      MEMORY[0x24BDAC7A8]();
      __error();
      v8 = _os_log_pack_fill();
      *(_DWORD *)v8 = 138412290;
      *(_QWORD *)(v8 + 4) = a2;
      __SC_log_send();
      return 0;
    }
  }
  else
  {
    *a3 = Value;
    return 1;
  }
  return result;
}

uint64_t sub_23ECA0EA0(const __CFDictionary *a1)
{
  const void *Value;
  CFTypeID TypeID;
  const __CFString *v4;
  const void *v5;
  uint64_t v6;
  const void *v7;
  CFTypeID v8;
  CFTypeID v9;
  CFIndex Count;
  const void *v11;
  const void *v12;
  CFTypeID v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  const void *v18;
  const void *v19;
  CFTypeID v20;
  const void *v21;
  const void *v22;
  CFTypeID v23;
  uint64_t v24;

  Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x24BDF5B10]);
  TypeID = CFStringGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
    return 0;
  if (!CFEqual(Value, (CFTypeRef)*MEMORY[0x24BDF5C20]))
  {
    if (CFEqual(Value, (CFTypeRef)*MEMORY[0x24BDF5C10]) || CFEqual(Value, (CFTypeRef)*MEMORY[0x24BDF5C18]))
    {
      v14 = 1;
    }
    else
    {
      result = CFEqual(Value, CFSTR("DHCPv6PD"));
      if (!(_DWORD)result)
        return result;
      v4 = CFSTR("RequestedPrefix");
      v18 = CFDictionaryGetValue(a1, CFSTR("RequestedPrefix"));
      if (v18)
      {
        v19 = v18;
        v20 = CFStringGetTypeID();
        if (CFGetTypeID(v19) != v20)
        {
          sub_23ECA48F8();
          _SC_syslog_os_log_mapping();
          result = __SC_log_enabled();
          if (!(_DWORD)result)
            return result;
          goto LABEL_40;
        }
        v14 = 2;
      }
      else
      {
        v14 = 1;
      }
      v4 = CFSTR("RequestedPrefixLength");
      v21 = CFDictionaryGetValue(a1, CFSTR("RequestedPrefixLength"));
      if (v21)
      {
        v22 = v21;
        v23 = CFNumberGetTypeID();
        if (CFGetTypeID(v22) != v23)
        {
          sub_23ECA48F8();
          _SC_syslog_os_log_mapping();
          result = __SC_log_enabled();
          if (!(_DWORD)result)
            return result;
          goto LABEL_40;
        }
        ++v14;
      }
    }
    goto LABEL_18;
  }
  v4 = (const __CFString *)*MEMORY[0x24BDF5B08];
  v5 = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x24BDF5B08]);
  v6 = *MEMORY[0x24BDF5B28];
  v7 = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x24BDF5B28]);
  v8 = CFArrayGetTypeID();
  if (!v5 || CFGetTypeID(v5) != v8 || (v9 = CFArrayGetTypeID(), !v7) || CFGetTypeID(v7) != v9)
  {
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    result = __SC_log_enabled();
    if (!(_DWORD)result)
      return result;
LABEL_14:
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    __error();
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 138412546;
    *(_QWORD *)(v16 + 4) = v4;
    *(_WORD *)(v16 + 12) = 2112;
    *(_QWORD *)(v16 + 14) = v6;
LABEL_41:
    __SC_log_send();
    return 0;
  }
  Count = CFArrayGetCount((CFArrayRef)v5);
  if (!Count)
  {
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    result = __SC_log_enabled();
    if (!(_DWORD)result)
      return result;
    goto LABEL_40;
  }
  if (Count != CFArrayGetCount((CFArrayRef)v7))
  {
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    result = __SC_log_enabled();
    if (!(_DWORD)result)
      return result;
    goto LABEL_14;
  }
  v4 = (const __CFString *)*MEMORY[0x24BDF5B30];
  v11 = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x24BDF5B30]);
  if (v11)
  {
    v12 = v11;
    v13 = CFStringGetTypeID();
    if (CFGetTypeID(v12) == v13)
    {
      v14 = 4;
      goto LABEL_18;
    }
    sub_23ECA48F8();
    _SC_syslog_os_log_mapping();
    result = __SC_log_enabled();
    if (!(_DWORD)result)
      return result;
LABEL_40:
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    __error();
    v24 = _os_log_pack_fill();
    *(_DWORD *)v24 = 138412290;
    *(_QWORD *)(v24 + 4) = v4;
    goto LABEL_41;
  }
  v14 = 3;
LABEL_18:
  if (CFDictionaryGetCount(a1) == v14)
    return 1;
  sub_23ECA48F8();
  _SC_syslog_os_log_mapping();
  result = __SC_log_enabled();
  if ((_DWORD)result)
  {
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    __error();
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 138412290;
    *(_QWORD *)(v17 + 4) = a1;
    goto LABEL_41;
  }
  return result;
}

uint64_t sub_23ECA14DC()
{
  uint64_t result;

  sub_23EC9E9D8((uint64_t)"Library");
  result = _CFRuntimeRegisterClass();
  qword_254343008 = result;
  return result;
}

void sub_23ECA150C(uint64_t a1)
{
  unsigned int *v2;
  NSObject *v3;
  const __SCDynamicStore *v4;
  NSObject *v5;
  mach_port_t v6;
  uint64_t v7;
  uint64_t v8;
  mach_error_t v9;
  mach_error_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  const char *v14;
  unsigned int v15;
  _QWORD block[6];

  block[5] = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned int **)(a1 + 200);
  if (v2)
  {
    v3 = *(NSObject **)(a1 + 48);
    if (v3)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = sub_23ECA1890;
      block[3] = &unk_250F5B970;
      block[4] = a1;
      dispatch_sync(v3, block);
      v2 = *(unsigned int **)(a1 + 200);
    }
    sub_23EC9E88C(v2);
    *(_QWORD *)(a1 + 200) = 0;
  }
  v4 = *(const __SCDynamicStore **)(a1 + 40);
  if (v4)
  {
    SCDynamicStoreSetDispatchQueue(v4, 0);
    sub_23ECA4580((const void **)(a1 + 40));
  }
  v5 = *(NSObject **)(a1 + 48);
  if (v5)
  {
    dispatch_release(v5);
    *(_QWORD *)(a1 + 48) = 0;
  }
  v6 = *(_DWORD *)(a1 + 32);
  if (v6)
  {
    v15 = 0;
    v7 = a1 + 16;
    v8 = a1 + 56;
    v9 = sub_23ECA3E78(v6, (__int128 *)(a1 + 16), (__int128 *)(a1 + 56), &v15);
    if (v9)
    {
      v10 = v9;
      sub_23ECA48F8();
      _SC_syslog_os_log_mapping();
      if (!__SC_log_enabled())
      {
LABEL_20:
        mach_port_deallocate(*MEMORY[0x24BDAEC58], *(_DWORD *)(a1 + 32));
        *(_DWORD *)(a1 + 32) = 0;
        goto LABEL_21;
      }
      _os_log_pack_size();
      MEMORY[0x24BDAC7A8]();
      __error();
      v11 = _os_log_pack_fill();
      v12 = mach_error_string(v10);
      *(_DWORD *)v11 = 136315650;
      *(_QWORD *)(v11 + 4) = v7;
      *(_WORD *)(v11 + 12) = 2080;
      *(_QWORD *)(v11 + 14) = v8;
      *(_WORD *)(v11 + 22) = 2080;
      *(_QWORD *)(v11 + 24) = v12;
    }
    else
    {
      if (!v15)
        goto LABEL_20;
      sub_23ECA48F8();
      _SC_syslog_os_log_mapping();
      if (!__SC_log_enabled())
        goto LABEL_20;
      _os_log_pack_size();
      MEMORY[0x24BDAC7A8]();
      __error();
      v13 = _os_log_pack_fill();
      if (v15 <= 0x15)
        v14 = off_250F5B990[v15];
      else
        v14 = "<unknown>";
      *(_DWORD *)v13 = 136315650;
      *(_QWORD *)(v13 + 4) = v7;
      *(_WORD *)(v13 + 12) = 2080;
      *(_QWORD *)(v13 + 14) = v8;
      *(_WORD *)(v13 + 22) = 2080;
      *(_QWORD *)(v13 + 24) = v14;
    }
    __SC_log_send();
    goto LABEL_20;
  }
LABEL_21:
  sub_23ECA4580((const void **)(a1 + 208));
  sub_23ECA4580((const void **)(a1 + 192));
  sub_23ECA4580((const void **)(a1 + 184));
}

__CFString *sub_23ECA1808(char *a1)
{
  const __CFAllocator *v2;
  __CFString *Mutable;

  v2 = CFGetAllocator(a1);
  Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<IPConfigurationService %p [%p]> {"), a1, v2);
  CFStringAppendFormat(Mutable, 0, CFSTR("ifname = %s, serviceID = %s"), a1 + 16, a1 + 56);
  CFStringAppend(Mutable, CFSTR("}"));
  return Mutable;
}

_QWORD *sub_23ECA1890(uint64_t a1)
{
  return sub_23EC9E844(*(_QWORD **)(*(_QWORD *)(a1 + 32) + 200));
}

uint64_t PvDInfoRequestCreate(const void *a1, const void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t Instance;
  uint64_t v9;
  _DWORD *v10;
  dispatch_queue_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  _OWORD *v18;
  uint64_t v20;
  _OWORD v21[16];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (qword_256DCBC50 != -1)
    dispatch_once(&qword_256DCBC50, &unk_250F5B708);
  Instance = _CFRuntimeCreateInstance();
  *(_OWORD *)(Instance + 16) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  *(_OWORD *)(Instance + 96) = 0u;
  *(_QWORD *)(Instance + 112) = 0;
  v20 = Instance;
  if (Instance
    && (v9 = Instance, v10 = sub_23EC9E84C(Instance), (*(_QWORD *)(v9 + 16) = v10) != 0)
    && (v11 = dispatch_queue_create("PvDInfoRequestQueue", 0),
        v12 = *(void **)(v9 + 24),
        *(_QWORD *)(v9 + 24) = v11,
        v12,
        *(_QWORD *)(v9 + 24)))
  {
    *(_BYTE *)(v9 + 40) = 0;
    v13 = *(void **)(v9 + 56);
    *(_QWORD *)(v9 + 56) = 0;

    v14 = *(void **)(v9 + 48);
    *(_QWORD *)(v9 + 48) = 0;

    v15 = *(void **)(v9 + 64);
    *(_QWORD *)(v9 + 64) = 0;

    *(_DWORD *)(v9 + 104) = 0;
    *(_QWORD *)(v9 + 112) = 0;
    CFRetain(a1);
    if (a2)
      CFRetain(a2);
    *(_QWORD *)(v9 + 72) = a1;
    *(_QWORD *)(v9 + 80) = a2;
    *(_QWORD *)(v9 + 88) = a3;
    *(_QWORD *)(v9 + 96) = a4;
  }
  else
  {
    sub_23ECA48F8();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      memset(v21, 0, sizeof(v21));
      os_log_type_enabled(v16, v17);
      v18 = (_OWORD *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v18 != v21)
        free(v18);
    }

    sub_23ECA4580((const void **)&v20);
    return v20;
  }
  return v9;
}

void PvDInfoRequestSetCompletionHandler(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_23ECA1B90;
  block[3] = &unk_250F5BA48;
  v12 = v5;
  v13 = a1;
  v11 = v6;
  v8 = v5;
  v9 = v6;
  dispatch_sync(v7, block);

}

void sub_23ECA1B90(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  sub_23ECA1C78(*(_QWORD *)(a1 + 48));
  v2 = *(NSObject **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16);
  v4 = *(id *)(a1 + 40);
  v5 = dispatch_source_create(MEMORY[0x24BDAC9C8], 0, 0, v2);
  if (v5)
  {
    sub_23EC9E824(v3);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_23ECA2DA0;
    v9[3] = &unk_250F5BAF8;
    v11 = v3;
    v10 = v4;
    v6 = _Block_copy(v9);
    dispatch_source_set_event_handler(v5, v6);
    dispatch_activate(v5);

  }
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = v5;

}

BOOL sub_23ECA1C78(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    v3 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

    sub_23EC9E88C(*(unsigned int **)(a1 + 16));
  }
  return v1 != 0;
}

void PvDInfoRequestCancel(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  os_log_type_t v7;
  _OWORD *v8;
  _QWORD v9[5];
  _QWORD block[5];
  int v11;
  const char *v12;
  _OWORD v13[16];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(a1 + 24);
  if (v2)
  {
    v3 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_23ECA1EA0;
    block[3] = &unk_250F5BA68;
    block[4] = a1;
    dispatch_sync(v2, block);
    v4 = *(_QWORD *)(a1 + 16);
    sub_23EC9E824(v4);
    v5 = *(NSObject **)(a1 + 24);
    v9[0] = v3;
    v9[1] = 3221225472;
    v9[2] = sub_23ECA1EA8;
    v9[3] = &unk_250F5BA68;
    v9[4] = v4;
    dispatch_async(v5, v9);
  }
  else
  {
    sub_23ECA48F8();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      memset(v13, 0, sizeof(v13));
      os_log_type_enabled(v6, v7);
      v11 = 136315138;
      v12 = "PvDInfoRequestCancel";
      v8 = (_OWORD *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v8 != v13)
        free(v8);
    }

  }
}

BOOL sub_23ECA1EA0(uint64_t a1)
{
  return sub_23ECA1C78(*(_QWORD *)(a1 + 32));
}

double sub_23ECA1EA8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double result;

  v2 = sub_23EC9E83C(*(_QWORD *)(a1 + 32));
  sub_23EC9E88C(*(unsigned int **)(a1 + 32));
  if (*(_BYTE *)(v2 + 40))
    sub_23EC9E88C(*(unsigned int **)(a1 + 32));
  sub_23ECA2D4C(v2);
  v3 = *(void **)(v2 + 56);
  if (v3)
  {
    objc_msgSend(v3, "cancelRequest");
    v4 = *(void **)(v2 + 56);
    *(_QWORD *)(v2 + 56) = 0;

  }
  v5 = *(void **)(v2 + 48);
  if (v5)
  {
    objc_msgSend(v5, "invalidate");
    v6 = *(void **)(v2 + 48);
    *(_QWORD *)(v2 + 48) = 0;

  }
  *(_BYTE *)(v2 + 40) = 0;
  sub_23ECA4580((const void **)(v2 + 72));
  sub_23ECA4580((const void **)(v2 + 80));
  sub_23ECA4580((const void **)(v2 + 112));
  result = 0.0;
  *(_OWORD *)(v2 + 88) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_DWORD *)(v2 + 104) = 0;
  return result;
}

void PvDInfoRequestResume(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_log_type_t v5;
  _OWORD *v6;
  _QWORD block[6];
  int v8;
  const char *v9;
  _OWORD v10[16];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 24))
  {
    v2 = *(_QWORD *)(a1 + 16);
    sub_23EC9E824(v2);
    v3 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_23ECA2104;
    block[3] = &unk_250F5BA88;
    block[4] = a1;
    block[5] = v2;
    dispatch_async(v3, block);
  }
  else
  {
    sub_23ECA48F8();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      memset(v10, 0, sizeof(v10));
      os_log_type_enabled(v4, v5);
      v8 = 136315138;
      v9 = "PvDInfoRequestResume";
      v6 = (_OWORD *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v6 != v10)
        free(v6);
    }

  }
}

void sub_23ECA2104(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  NSObject *v7;
  os_log_type_t v8;
  __int128 *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_log_type_t v16;
  __int128 *v17;
  uint64_t v18;
  _QWORD *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  dispatch_time_t v23;
  NSObject *v24;
  __int128 *v25;
  os_log_type_t v26;
  const __CFString *v27;
  __int128 *v28;
  __int128 *v29;
  os_log_type_t v30;
  __int128 *v31;
  os_log_type_t v32;
  __int128 *v33;
  os_log_type_t v34;
  __int128 *v35;
  __int128 aBlock;
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
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = sub_23EC9E83C(v2);
  if (!v3)
  {
    sub_23ECA48F8();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
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
      aBlock = 0u;
      v37 = 0u;
      os_log_type_enabled(v7, v8);
      v9 = (__int128 *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v9 != &aBlock)
        free(v9);
    }

    v10 = 0;
    goto LABEL_29;
  }
  v4 = v3;
  if (*(_BYTE *)(v3 + 40))
  {
    sub_23ECA48F8();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
      goto LABEL_11;
    goto LABEL_24;
  }
  if (*(_DWORD *)(v3 + 104))
  {
    sub_23ECA48F8();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
LABEL_11:
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
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
      aBlock = 0u;
      v37 = 0u;
      os_log_type_enabled(v5, v6);
      v25 = (__int128 *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v25 != &aBlock)
        free(v25);
    }
LABEL_24:

    v10 = 0;
    goto LABEL_25;
  }
  v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.IPConfiguration.IPConfigurationHelper"));
  if (!v11)
  {
    sub_23ECA48F8();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
      goto LABEL_11;
    goto LABEL_24;
  }
  v10 = (void *)v11;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256DCC138);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRemoteObjectInterface:", v12);

  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", &unk_250F5B5C8);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = v13;
    objc_storeStrong((id *)(v4 + 48), v10);
    objc_storeStrong((id *)(v4 + 56), v14);
    sub_23ECA48F8();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
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
      aBlock = 0u;
      v37 = 0u;
      os_log_type_enabled(v15, v16);
      v17 = (__int128 *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v17 != &aBlock)
        free(v17);
    }

    objc_msgSend(*(id *)(v4 + 48), "activate");
    *(_BYTE *)(v4 + 40) = 1;
    v18 = sub_23EC9E83C(v2);
    if (v18)
    {
      v19 = (_QWORD *)v18;
      v20 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(v18 + 24));
      if (v20)
      {
        v21 = v19[2];
        sub_23EC9E824(v21);
        *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
        *((_QWORD *)&aBlock + 1) = 3221225472;
        *(_QWORD *)&v37 = sub_23ECA2F48;
        *((_QWORD *)&v37 + 1) = &unk_250F5BA68;
        *(_QWORD *)&v38 = v21;
        v22 = _Block_copy(&aBlock);
        dispatch_source_set_event_handler(v20, v22);
        v23 = dispatch_time(0, 1000000 * v19[12]);
        dispatch_source_set_timer(v20, v23, 0xFFFFFFFFFFFFFFFFLL, 0);
        dispatch_activate(v20);
      }
      else
      {
        sub_23ECA48F8();
        v22 = objc_claimAutoreleasedReturnValue();
        v34 = _SC_syslog_os_log_mapping();
        if (__SC_log_enabled())
        {
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
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
          aBlock = 0u;
          v37 = 0u;
          os_log_type_enabled(v22, v34);
          v35 = (__int128 *)_os_log_send_and_compose_impl();
          __SC_log_send2();
          if (v35 != &aBlock)
            free(v35);
        }
      }

      v24 = v19[8];
      v19[8] = v20;
    }
    else
    {
      sub_23ECA48F8();
      v24 = objc_claimAutoreleasedReturnValue();
      v32 = _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
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
        aBlock = 0u;
        v37 = 0u;
        os_log_type_enabled(v24, v32);
        v33 = (__int128 *)_os_log_send_and_compose_impl();
        __SC_log_send2();
        if (v33 != &aBlock)
          free(v33);
      }
    }

    goto LABEL_33;
  }
LABEL_25:
  if (*(_QWORD *)(v4 + 72))
  {
    sub_23ECA48F8();
    v14 = objc_claimAutoreleasedReturnValue();
    v26 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
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
      aBlock = 0u;
      v37 = 0u;
      os_log_type_enabled(v14, v26);
      v27 = *(const __CFString **)(v4 + 72);
      v14 = v14;
      CFStringGetCStringPtr(v27, 0x8000100u);
      v28 = (__int128 *)_os_log_send_and_compose_impl();

      __SC_log_send2();
      if (v28 != &aBlock)
      {
        v29 = v28;
LABEL_32:
        free(v29);
        goto LABEL_33;
      }
    }
    goto LABEL_33;
  }
LABEL_29:
  sub_23ECA48F8();
  v14 = objc_claimAutoreleasedReturnValue();
  v30 = _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
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
    aBlock = 0u;
    v37 = 0u;
    os_log_type_enabled(v14, v30);
    v31 = (__int128 *)_os_log_send_and_compose_impl();
    __SC_log_send2();
    if (v31 != &aBlock)
    {
      v29 = v31;
      goto LABEL_32;
    }
  }
LABEL_33:

  sub_23EC9E88C(*(unsigned int **)(a1 + 40));
}

uint64_t PvDInfoRequestGetCompletionStatus(uint64_t a1)
{
  return *(unsigned int *)(a1 + 104);
}

uint64_t PvDInfoRequestCopyAdditionalInformation(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v1 = *(NSObject **)(a1 + 24);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_23ECA2C00;
  v4[3] = &unk_250F5BAB0;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync(v1, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

CFDictionaryRef sub_23ECA2C00(uint64_t a1)
{
  CFDictionaryRef result;

  result = CFDictionaryCreateCopy(0, *(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 112));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_23ECA2C38()
{
  uint64_t result;

  sub_23EC9E9D8((uint64_t)"Library");
  result = _CFRuntimeRegisterClass();
  qword_256DCBC48 = result;
  return result;
}

void sub_23ECA2C68(uint64_t a1)
{
  unsigned int *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD block[5];

  sub_23ECA1C78(a1);
  sub_23ECA2D4C(a1);
  v2 = *(unsigned int **)(a1 + 16);
  if (v2)
  {
    v3 = *(NSObject **)(a1 + 24);
    if (v3)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_23ECA2D94;
      block[3] = &unk_250F5BA68;
      block[4] = a1;
      dispatch_sync(v3, block);
      v2 = *(unsigned int **)(a1 + 16);
    }
    sub_23EC9E88C(v2);
    *(_QWORD *)(a1 + 16) = 0;
  }
  v4 = *(void **)(a1 + 56);
  if (v4)
  {
    objc_msgSend(v4, "cancelRequest");
    v5 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = 0;

  }
  v6 = *(void **)(a1 + 48);
  if (v6)
  {
    objc_msgSend(v6, "invalidate");
    v7 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

  }
  sub_23ECA4580((const void **)(a1 + 72));
  sub_23ECA4580((const void **)(a1 + 80));
  sub_23ECA4580((const void **)(a1 + 112));
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  v8 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;

}

BOOL sub_23ECA2D4C(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 64));
    v3 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;

    sub_23EC9E88C(*(unsigned int **)(a1 + 16));
  }
  return v1 != 0;
}

_QWORD *sub_23ECA2D94(uint64_t a1)
{
  return sub_23EC9E844(*(_QWORD **)(*(_QWORD *)(a1 + 32) + 16));
}

uint64_t sub_23ECA2DA0(uint64_t a1)
{
  uint64_t result;

  result = sub_23EC9E83C(*(_QWORD *)(a1 + 40));
  if (result)
  {
    result = sub_23ECA1C78(result);
    if ((_DWORD)result)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

void sub_23ECA2DE4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  _OWORD *v5;
  _OWORD v6[16];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  sub_23ECA48F8();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    memset(v6, 0, sizeof(v6));
    os_log_type_enabled(v3, v4);
    v5 = (_OWORD *)_os_log_send_and_compose_impl();
    __SC_log_send2();
    if (v5 != v6)
      free(v5);
  }

}

void sub_23ECA2F48(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  __int128 *v10;
  NSObject *v11;
  os_log_type_t v12;
  __int128 *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v1 = sub_23EC9E83C(*(_QWORD *)(a1 + 32));
  if (v1)
  {
    v2 = v1;
    if (sub_23ECA2D4C(v1))
    {
      v3 = *(id *)(v2 + 72);
      v4 = *(id *)(v2 + 80);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", *(_QWORD *)(v2 + 88), 4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = *(_QWORD *)(v2 + 16);
        sub_23EC9E824(v6);
        v7 = *(void **)(v2 + 56);
        *(_QWORD *)&v18 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v18 + 1) = 3221225472;
        *(_QWORD *)&v19 = sub_23ECA32E4;
        *((_QWORD *)&v19 + 1) = &unk_250F5BB38;
        *(_QWORD *)&v20 = v6;
        objc_msgSend(v7, "fetchPvDAdditionalInformationWithPvDID:prefixesArray:bindToInterface:andCompletionHandler:", v3, v4, v5, &v18);
        *(_DWORD *)(v2 + 104) = 1;
      }
      else
      {
        sub_23ECA48F8();
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = _SC_syslog_os_log_mapping();
        if (__SC_log_enabled())
        {
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
          v18 = 0u;
          v19 = 0u;
          os_log_type_enabled(v8, v9);
          v10 = (__int128 *)_os_log_send_and_compose_impl();
          __SC_log_send2();
          if (v10 != &v18)
            free(v10);
        }

        if (*(_DWORD *)(v2 + 104) != 1)
        {
          sub_23ECA48F8();
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = _SC_syslog_os_log_mapping();
          if (__SC_log_enabled())
          {
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
            v18 = 0u;
            v19 = 0u;
            os_log_type_enabled(v11, v12);
            v13 = (__int128 *)_os_log_send_and_compose_impl();
            __SC_log_send2();
            if (v13 != &v18)
              free(v13);
          }

          sub_23ECA2D4C(v2);
          v14 = *(void **)(v2 + 56);
          if (v14)
          {
            objc_msgSend(v14, "cancelRequest");
            v15 = *(void **)(v2 + 56);
            *(_QWORD *)(v2 + 56) = 0;

          }
          v16 = *(void **)(v2 + 48);
          if (v16)
          {
            objc_msgSend(v16, "invalidate");
            v17 = *(void **)(v2 + 48);
            *(_QWORD *)(v2 + 48) = 0;

          }
          *(_BYTE *)(v2 + 40) = 0;
          sub_23ECA4580((const void **)(v2 + 72));
          sub_23ECA4580((const void **)(v2 + 80));
          sub_23ECA4580((const void **)(v2 + 112));
          *(_OWORD *)(v2 + 72) = 0u;
          *(_OWORD *)(v2 + 88) = 0u;
          *(_DWORD *)(v2 + 104) = 0;
        }
      }

    }
  }
}

void sub_23ECA32E4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  __int128 *v13;
  NSObject *v14;
  os_log_type_t v15;
  __int128 *v16;
  __int128 block;
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
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = sub_23EC9E83C(*(_QWORD *)(a1 + 32));
  if (v4)
  {
    v5 = (_QWORD *)v4;
    v6 = objc_msgSend(v3, "valueForKey:", CFSTR("valid_fetch"));
    objc_msgSend(v3, "valueForKey:", CFSTR("additional_information"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 == *MEMORY[0x24BDBD270] && v7 != 0)
      v5[14] = v7;
    if (v5[3])
    {
      v10 = v5[2];
      sub_23EC9E824(v10);
      v11 = v5[3];
      *(_QWORD *)&block = MEMORY[0x24BDAC760];
      *((_QWORD *)&block + 1) = 3221225472;
      *(_QWORD *)&v18 = sub_23ECA361C;
      *((_QWORD *)&v18 + 1) = &unk_250F5BA88;
      *(_QWORD *)&v19 = v10;
      *((_QWORD *)&v19 + 1) = v6;
      dispatch_async(v11, &block);
    }
    else
    {
      sub_23ECA48F8();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
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
        block = 0u;
        v18 = 0u;
        os_log_type_enabled(v14, v15);
        v16 = (__int128 *)_os_log_send_and_compose_impl();
        __SC_log_send2();
        if (v16 != &block)
          free(v16);
      }

    }
  }
  else
  {
    sub_23ECA48F8();
    v8 = objc_claimAutoreleasedReturnValue();
    v12 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
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
      block = 0u;
      v18 = 0u;
      os_log_type_enabled(v8, v12);
      v13 = (__int128 *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v13 != &block)
        free(v13);
    }
  }

  sub_23EC9E88C(*(unsigned int **)(a1 + 32));
}

void sub_23ECA361C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  int v8;
  __int128 *v9;
  NSObject *v10;
  os_log_type_t v11;
  __int128 *v12;
  os_log_type_t v13;
  __int128 *v14;
  __int128 *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
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
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v2 = sub_23EC9E83C(*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = v2;
    if (*(_QWORD *)(a1 + 40) == *MEMORY[0x24BDBD268])
    {
      sub_23ECA48F8();
      v5 = objc_claimAutoreleasedReturnValue();
      v13 = _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
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
        os_log_type_enabled(v5, v13);
        v14 = (__int128 *)_os_log_send_and_compose_impl();
        __SC_log_send2();
        if (v14 != &v21)
          free(v14);
      }
      v8 = 3;
    }
    else
    {
      v4 = *(_QWORD *)(v2 + 112);
      sub_23ECA48F8();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = _SC_syslog_os_log_mapping();
      v7 = __SC_log_enabled();
      if (v4)
      {
        v8 = 2;
        if (v7)
        {
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
          os_log_type_enabled(v5, v6);
          v9 = (__int128 *)_os_log_send_and_compose_impl();
          __SC_log_send2();
          if (v9 != &v21)
            free(v9);
          v8 = 2;
        }
      }
      else
      {
        if (v7)
        {
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
          os_log_type_enabled(v5, v6);
          v15 = (__int128 *)_os_log_send_and_compose_impl();
          __SC_log_send2();
          if (v15 != &v21)
            free(v15);
        }
        v8 = 0;
      }
    }

    *(_DWORD *)(v3 + 104) = v8;
    sub_23ECA2D4C(v3);
    v16 = *(void **)(v3 + 56);
    if (v16)
    {
      objc_msgSend(v16, "cancelRequest");
      v17 = *(void **)(v3 + 56);
      *(_QWORD *)(v3 + 56) = 0;

    }
    v18 = *(void **)(v3 + 48);
    if (v18)
    {
      objc_msgSend(v18, "invalidate");
      v19 = *(void **)(v3 + 48);
      *(_QWORD *)(v3 + 48) = 0;

    }
    *(_BYTE *)(v3 + 40) = 0;
    v20 = *(NSObject **)(v3 + 32);
    if (v20)
      dispatch_source_merge_data(v20, 1uLL);
  }
  else
  {
    sub_23ECA48F8();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
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
      os_log_type_enabled(v10, v11);
      v12 = (__int128 *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v12 != &v21)
        free(v12);
    }

  }
  sub_23EC9E88C(*(unsigned int **)(a1 + 32));
}

uint64_t sub_23ECA3AB8(mach_port_t a1, __int128 *a2, uint64_t a3, int a4, _OWORD *a5, _DWORD *a6)
{
  mach_port_t reply_port;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  mach_msg_header_t msg;
  int v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[28];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  msg.msgh_id = 0;
  *((_QWORD *)&v21 + 1) = 0;
  v23 = 0u;
  memset(v28, 0, sizeof(v28));
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  *(_OWORD *)&msg.msgh_size = 0u;
  v19 = 1;
  v20 = a3;
  LODWORD(v21) = 16777472;
  DWORD1(v21) = a4;
  *((_QWORD *)&v21 + 1) = *MEMORY[0x24BDAC470];
  v22 = *a2;
  LODWORD(v23) = a4;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4E2700000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v10 = mach_msg(&msg, 3, 0x48u, 0xB0u, reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v10)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v11;
    }
    if (msg.msgh_id == 71)
    {
      v11 = 4294966988;
    }
    else if (msg.msgh_id == 20107)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 168)
        {
          if (!msg.msgh_remote_port)
          {
            v11 = HIDWORD(v20);
            if (!HIDWORD(v20))
            {
              v14 = v26;
              a5[4] = v25;
              a5[5] = v14;
              v15 = *(_OWORD *)v28;
              a5[6] = v27;
              a5[7] = v15;
              v16 = v22;
              *a5 = v21;
              a5[1] = v16;
              v17 = v24;
              a5[2] = v23;
              a5[3] = v17;
              *a6 = *(_DWORD *)&v28[16];
              return v11;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port)
            v12 = 1;
          else
            v12 = HIDWORD(v20) == 0;
          if (v12)
            v11 = 4294966996;
          else
            v11 = HIDWORD(v20);
          goto LABEL_23;
        }
      }
      v11 = 4294966996;
    }
    else
    {
      v11 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&msg);
    return v11;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v11;
}

uint64_t sub_23ECA3CC8(mach_port_t a1, __int128 *a2, uint64_t a3, int a4, int *a5)
{
  mach_port_t reply_port;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  mach_msg_header_t v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  __int128 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v13 = 1;
  v14 = a3;
  v15 = 16777472;
  v16 = a4;
  v17 = *MEMORY[0x24BDAC470];
  v18 = *a2;
  v19 = a4;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&v12.msgh_bits = 2147489043;
  v12.msgh_remote_port = a1;
  v12.msgh_local_port = reply_port;
  *(_QWORD *)&v12.msgh_voucher_port = 0x4E2A00000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&v12);
    reply_port = v12.msgh_local_port;
  }
  v8 = mach_msg(&v12, 3, 0x48u, 0x30u, reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v8)
    {
      mig_dealloc_reply_port(v12.msgh_local_port);
      return v9;
    }
    if (v12.msgh_id == 71)
    {
      v9 = 4294966988;
    }
    else if (v12.msgh_id == 20110)
    {
      if ((v12.msgh_bits & 0x80000000) == 0)
      {
        if (v12.msgh_size == 40)
        {
          if (!v12.msgh_remote_port)
          {
            v9 = HIDWORD(v14);
            if (!HIDWORD(v14))
            {
              *a5 = v15;
              return v9;
            }
            goto LABEL_23;
          }
        }
        else if (v12.msgh_size == 36)
        {
          if (v12.msgh_remote_port)
            v10 = 1;
          else
            v10 = HIDWORD(v14) == 0;
          if (v10)
            v9 = 4294966996;
          else
            v9 = HIDWORD(v14);
          goto LABEL_23;
        }
      }
      v9 = 4294966996;
    }
    else
    {
      v9 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v12);
    return v9;
  }
  mig_put_reply_port(v12.msgh_local_port);
  return v9;
}

uint64_t sub_23ECA3E78(mach_port_t a1, __int128 *a2, __int128 *a3, _DWORD *a4)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  mach_port_t reply_port;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  mach_msg_header_t msg;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = *a2;
  v7 = a3[4];
  v8 = a3[6];
  v9 = a3[7];
  v27 = a3[5];
  v28 = v8;
  v29 = v9;
  v10 = *a3;
  v11 = a3[1];
  v21 = v6;
  v22 = v10;
  v12 = a3[2];
  v13 = a3[3];
  v23 = v11;
  v24 = v12;
  v20 = *MEMORY[0x24BDAC470];
  v26 = v7;
  v25 = v13;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg.msgh_bits = 5395;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4E2D00000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v15 = mach_msg(&msg, 3, 0xB0u, 0x30u, reply_port, 0, 0);
  v16 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v15)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v16;
    }
    if (msg.msgh_id == 71)
    {
      v16 = 4294966988;
    }
    else if (msg.msgh_id == 20113)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            v16 = v21;
            if (!(_DWORD)v21)
            {
              *a4 = DWORD1(v21);
              return v16;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port)
            v17 = 1;
          else
            v17 = (_DWORD)v21 == 0;
          if (v17)
            v16 = 4294966996;
          else
            v16 = v21;
          goto LABEL_23;
        }
      }
      v16 = 4294966996;
    }
    else
    {
      v16 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&msg);
    return v16;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v16;
}

uint64_t sub_23ECA4040(mach_port_t a1, __int128 *a2, __int128 *a3, _DWORD *a4)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  mach_port_t reply_port;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  mach_msg_header_t msg;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = *a2;
  v7 = a3[4];
  v8 = a3[6];
  v9 = a3[7];
  v27 = a3[5];
  v28 = v8;
  v29 = v9;
  v10 = *a3;
  v11 = a3[1];
  v21 = v6;
  v22 = v10;
  v12 = a3[2];
  v13 = a3[3];
  v23 = v11;
  v24 = v12;
  v20 = *MEMORY[0x24BDAC470];
  v26 = v7;
  v25 = v13;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg.msgh_bits = 5395;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4E2E00000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v15 = mach_msg(&msg, 3, 0xB0u, 0x30u, reply_port, 0, 0);
  v16 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v15)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v16;
    }
    if (msg.msgh_id == 71)
    {
      v16 = 4294966988;
    }
    else if (msg.msgh_id == 20114)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            v16 = v21;
            if (!(_DWORD)v21)
            {
              *a4 = DWORD1(v21);
              return v16;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port)
            v17 = 1;
          else
            v17 = (_DWORD)v21 == 0;
          if (v17)
            v16 = 4294966996;
          else
            v16 = v21;
          goto LABEL_23;
        }
      }
      v16 = 4294966996;
    }
    else
    {
      v16 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&msg);
    return v16;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v16;
}

uint64_t sub_23ECA4208(mach_port_t a1, __int128 *a2, uint64_t a3, int a4, int *a5)
{
  mach_port_t reply_port;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  mach_msg_header_t v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  __int128 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v13 = 1;
  v14 = a3;
  v15 = 16777472;
  v16 = a4;
  v17 = *MEMORY[0x24BDAC470];
  v18 = *a2;
  v19 = a4;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&v12.msgh_bits = 2147489043;
  v12.msgh_remote_port = a1;
  v12.msgh_local_port = reply_port;
  *(_QWORD *)&v12.msgh_voucher_port = 0x4E2F00000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&v12);
    reply_port = v12.msgh_local_port;
  }
  v8 = mach_msg(&v12, 3, 0x48u, 0x30u, reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v8)
    {
      mig_dealloc_reply_port(v12.msgh_local_port);
      return v9;
    }
    if (v12.msgh_id == 71)
    {
      v9 = 4294966988;
    }
    else if (v12.msgh_id == 20115)
    {
      if ((v12.msgh_bits & 0x80000000) == 0)
      {
        if (v12.msgh_size == 40)
        {
          if (!v12.msgh_remote_port)
          {
            v9 = HIDWORD(v14);
            if (!HIDWORD(v14))
            {
              *a5 = v15;
              return v9;
            }
            goto LABEL_23;
          }
        }
        else if (v12.msgh_size == 36)
        {
          if (v12.msgh_remote_port)
            v10 = 1;
          else
            v10 = HIDWORD(v14) == 0;
          if (v10)
            v9 = 4294966996;
          else
            v9 = HIDWORD(v14);
          goto LABEL_23;
        }
      }
      v9 = 4294966996;
    }
    else
    {
      v9 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v12);
    return v9;
  }
  mig_put_reply_port(v12.msgh_local_port);
  return v9;
}

uint64_t sub_23ECA43B8(mach_port_t a1, __int128 *a2, __int128 *a3, _DWORD *a4)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  mach_port_t reply_port;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  mach_msg_header_t msg;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = *a2;
  v7 = a3[4];
  v8 = a3[6];
  v9 = a3[7];
  v27 = a3[5];
  v28 = v8;
  v29 = v9;
  v10 = *a3;
  v11 = a3[1];
  v21 = v6;
  v22 = v10;
  v12 = a3[2];
  v13 = a3[3];
  v23 = v11;
  v24 = v12;
  v20 = *MEMORY[0x24BDAC470];
  v26 = v7;
  v25 = v13;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg.msgh_bits = 5395;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4E3500000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v15 = mach_msg(&msg, 3, 0xB0u, 0x30u, reply_port, 0, 0);
  v16 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v15)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v16;
    }
    if (msg.msgh_id == 71)
    {
      v16 = 4294966988;
    }
    else if (msg.msgh_id == 20121)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            v16 = v21;
            if (!(_DWORD)v21)
            {
              *a4 = DWORD1(v21);
              return v16;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port)
            v17 = 1;
          else
            v17 = (_DWORD)v21 == 0;
          if (v17)
            v16 = 4294966996;
          else
            v16 = v21;
          goto LABEL_23;
        }
      }
      v16 = 4294966996;
    }
    else
    {
      v16 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&msg);
    return v16;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v16;
}

void sub_23ECA4580(const void **a1)
{
  const void *v2;

  if (a1)
  {
    v2 = *a1;
    if (v2)
    {
      CFRelease(v2);
      *a1 = 0;
    }
  }
}

uint64_t sub_23ECA45B0(const __CFString *a1, UInt8 *a2, int a3, Boolean a4)
{
  int v8;
  CFIndex usedBufLen;
  CFRange v11;

  usedBufLen = 0;
  v11.length = CFStringGetLength(a1);
  v11.location = 0;
  CFStringGetBytes(a1, v11, 0x8000100u, 0, a4, a2, a3 - 1, &usedBufLen);
  v8 = usedBufLen;
  if (a2)
    a2[usedBufLen] = 0;
  return (v8 + 1);
}

uint64_t sub_23ECA4634(const __CFString *a1, _QWORD *a2)
{
  CFTypeID TypeID;
  uint64_t result;
  char buffer[64];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *a2 = 0;
  a2[1] = 0;
  TypeID = CFStringGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID)
    return 0;
  result = CFStringGetCString(a1, buffer, 64, 0x600u);
  if ((_DWORD)result)
    return inet_pton(30, buffer, a2) == 1;
  return result;
}

uint64_t sub_23ECA46E8(const __CFString *a1, _DWORD *a2)
{
  unint64_t v3;
  int v4;
  char __str[64];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  sub_23ECA45B0(a1, (UInt8 *)__str, 64, 0);
  v3 = strtoul(__str, 0, 0);
  if (v3 == -1)
    return 0;
  v4 = v3;
  if (*__error() == 34)
    return 0;
  *a2 = v4;
  return 1;
}

uint64_t sub_23ECA4784(const __CFString *a1, _DWORD *a2)
{
  CFTypeID TypeID;
  uint64_t result;
  CFTypeID v6;
  CFTypeID v7;

  TypeID = CFStringGetTypeID();
  if (!a1)
  {
    CFBooleanGetTypeID();
    CFNumberGetTypeID();
    return 0;
  }
  if (CFGetTypeID(a1) == TypeID)
    return (sub_23ECA46E8(a1, a2) & 1) != 0;
  v6 = CFBooleanGetTypeID();
  if (CFGetTypeID(a1) != v6)
  {
    v7 = CFNumberGetTypeID();
    if (CFGetTypeID(a1) == v7)
    {
      result = CFNumberGetValue((CFNumberRef)a1, kCFNumberSInt32Type, a2);
      if (!(_DWORD)result)
        return result;
      return 1;
    }
    return 0;
  }
  *a2 = CFBooleanGetValue((CFBooleanRef)a1);
  return 1;
}

CFStringRef sub_23ECA4844(void *a1)
{
  const char *v1;
  char v3[46];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = inet_ntop(30, a1, v3, 0x2Eu);
  return CFStringCreateWithCString(0, v1, 0x600u);
}

CFStringRef sub_23ECA48AC(const __CFAllocator *a1)
{
  const __CFUUID *v2;
  CFStringRef v3;

  v2 = CFUUIDCreate(a1);
  v3 = CFUUIDCreateString(a1, v2);
  CFRelease(v2);
  return v3;
}

uint64_t sub_23ECA48EC(uint64_t result)
{
  qword_256DCBC58 = result;
  return result;
}

uint64_t sub_23ECA48F8()
{
  return qword_256DCBC58;
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDE0](allocator, theDict);
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

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
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

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D0](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x24BDF5670](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x24BDF5678](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x24BDF56B0](allocator, domain, serviceID, entity);
}

uint64_t SCDynamicStoreSetDisconnectCallBack()
{
  return MEMORY[0x24BDF56C0]();
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x24BDF56C8](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x24BDF56D0](store, keys, patterns);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
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

uint64_t _SC_syslog_os_log_mapping()
{
  return MEMORY[0x24BDF5948]();
}

uint64_t __SC_log_enabled()
{
  return MEMORY[0x24BDF5950]();
}

uint64_t __SC_log_send()
{
  return MEMORY[0x24BDF5958]();
}

uint64_t __SC_log_send2()
{
  return MEMORY[0x24BDF5960]();
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_log_pack_fill()
{
  return MEMORY[0x24BDACB98]();
}

uint64_t _os_log_pack_size()
{
  return MEMORY[0x24BDACBA0]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x24BDAD2E0](*(_QWORD *)&bp, service_name, sp);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
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

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x24BDADF98](source, value);
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

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x24BDAE8B0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x24BDAE8B8](*(_QWORD *)&a1, a2, a3);
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

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x24BDB0418](msg);
}

