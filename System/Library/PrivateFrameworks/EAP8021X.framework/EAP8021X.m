_DWORD *LinkAddresses_create()
{
  _BYTE *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  int v4;
  unsigned int v5;
  int v6;
  unsigned __int16 *v7;
  void *v8;
  void *v9;
  void *v10;
  _DWORD *v11;
  _DWORD *v12;
  FILE *v13;
  int *v14;
  char *v15;
  FILE *v16;
  int *v17;
  char *v18;
  size_t size;
  int v21[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  size = 0;
  *(_OWORD *)v21 = xmmword_206472CF0;
  v22 = 3;
  if (sysctl(v21, 6u, 0, &size, 0, 0) < 0)
  {
    v13 = (FILE *)*MEMORY[0x24BDAC8D8];
    v14 = __error();
    v15 = strerror(*v14);
    fprintf(v13, "sysctl() size failed: %s", v15);
    return 0;
  }
  else
  {
    v0 = malloc_type_malloc(size, 0x7FA67104uLL);
    if (sysctl(v21, 6u, v0, &size, 0, 0) < 0)
    {
      v16 = (FILE *)*MEMORY[0x24BDAC8D8];
      v17 = __error();
      v18 = strerror(*v17);
      fprintf(v16, "sysctl() failed: %s", v18);
    }
    else
    {
      v1 = malloc_type_malloc(0x50uLL, 0x2004093837F09uLL);
      if (v1)
      {
        v2 = v1;
        if (size)
        {
          v3 = 0;
          v4 = 0;
          v5 = 0;
          v6 = 10;
          do
          {
            v7 = (unsigned __int16 *)&v0[v3];
            if (v0[v3 + 3] == 14)
            {
              if (v4 == v6)
              {
                v6 = 2 * v4;
                v8 = malloc_type_realloc(v2, 16 * v4, 0x2004093837F09uLL);
                if (!v8)
                  goto LABEL_25;
                v2 = v8;
              }
              v9 = malloc_type_malloc(*((unsigned __int8 *)v7 + 112), 0x3EEF76FEuLL);
              if (v9)
              {
                v10 = v9;
                memmove(v9, v7 + 56, *((unsigned __int8 *)v7 + 112));
                *((_QWORD *)v2 + v4++) = v10;
              }
            }
            v5 += *v7;
            v3 = v5;
          }
          while (size > v5);
          if (!v4)
            goto LABEL_21;
          if (v4 < v6)
            v2 = reallocf(v2, 8 * v4);
          if (!v2)
          {
LABEL_25:
            v12 = 0;
            goto LABEL_23;
          }
          v11 = malloc_type_malloc(0x10uLL, 0x10800409227ACB4uLL);
          v12 = v11;
          if (v11)
          {
            *(_QWORD *)v11 = v2;
            v11[2] = v4;
          }
          else
          {
            free(v2);
          }
          goto LABEL_23;
        }
LABEL_21:
        free(v2);
      }
    }
    v12 = 0;
    if (v0)
LABEL_23:
      free(v0);
  }
  return v12;
}

uint64_t LinkAddresses_lookup(uint64_t **a1, char *__s)
{
  int v4;
  uint64_t v5;
  int v6;
  uint64_t *i;
  uint64_t v8;
  int v9;

  v4 = strlen(__s);
  v5 = *((unsigned int *)a1 + 2);
  if ((int)v5 < 1)
    return 0;
  v6 = v4;
  for (i = *a1; ; ++i)
  {
    v8 = *i;
    v9 = *(unsigned __int8 *)(*i + 5);
    if (!strncmp((const char *)(*i + 8), __s, *(unsigned __int8 *)(*i + 5)) && v6 == v9)
      break;
    if (!--v5)
      return 0;
  }
  return v8;
}

void my_CFRelease(const void **a1)
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

char *EAPOLClientAttach(uint64_t a1, uint64_t a2, uint64_t a3, const void **a4, mach_port_t *a5)
{
  mach_error_t v9;
  mach_error_t v10;
  NSObject *LogHandle;
  os_log_type_t v12;
  mach_port_t v13;
  char *v14;
  ipc_space_t *v15;
  char v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  __CFMachPort *v21;
  mach_port_t Port;
  kern_return_t v23;
  mach_error_t v24;
  NSObject *v25;
  os_log_type_t v26;
  char *v27;
  mach_error_t v28;
  mach_error_t v29;
  NSObject *v30;
  os_log_type_t v31;
  char *v32;
  mach_port_t v33;
  __CFRunLoop *Current;
  mach_port_t previous[2];
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  unsigned int v39;
  UInt8 *bytes;
  uint8_t buf[4];
  char *v42;
  __int16 v43;
  char *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  bytes = 0;
  v39 = 0;
  v38 = 0;
  v36 = 0u;
  v37 = 0u;
  *(_QWORD *)previous = 0;
  *a5 = 0;
  *a4 = 0;
  if (a2)
  {
    v9 = bootstrap_look_up2();
    if (v9)
    {
      v10 = v9;
      LogHandle = EAPLogGetLogHandle();
      v12 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v12))
      {
        *(_DWORD *)buf = 136315138;
        v42 = mach_error_string(v10);
        _os_log_impl(&dword_206440000, LogHandle, v12, "eapolcontroller_server_port(): %s", buf, 0xCu);
      }
      v13 = 6;
      goto LABEL_7;
    }
    v14 = (char *)malloc_type_malloc(0x48uLL, 0x10A00406C56F2BBuLL);
    *(_OWORD *)v14 = 0u;
    *((_OWORD *)v14 + 1) = 0u;
    *((_OWORD *)v14 + 2) = 0u;
    *((_OWORD *)v14 + 3) = 0u;
    *((_QWORD *)v14 + 8) = 0;
    __strlcpy_chk();
    *((_QWORD *)&v36 + 1) = v14;
    *(_DWORD *)buf = 0;
    v15 = (ipc_space_t *)MEMORY[0x24BDAEC58];
    v16 = 1;
    if (!mach_port_allocate(*MEMORY[0x24BDAEC58], 1u, (mach_port_name_t *)buf)
      && !mach_port_insert_right(*v15, *(mach_port_name_t *)buf, *(mach_port_t *)buf, 0x14u))
    {
      v21 = (__CFMachPort *)_SC_CFMachPortCreateWithPort();
      if (v21)
      {
        *(_QWORD *)v14 = v21;
        Port = CFMachPortGetPort(v21);
        v23 = mach_port_request_notification(*v15, Port, 70, 1u, Port, 0x15u, &previous[1]);
        if (!v23)
        {
          v28 = eapolcontroller_client_attach(0, (__int128 *)(v14 + 40), Port, (_DWORD *)v14 + 4, &bytes, &v39, previous);
          if (v28)
          {
            v29 = v28;
            v19 = v28 == 268435459;
            v30 = EAPLogGetLogHandle();
            v31 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v30, v31))
            {
              v32 = mach_error_string(v29);
              *(_DWORD *)buf = 136315394;
              v42 = v14 + 40;
              v43 = 2080;
              v44 = v32;
              _os_log_impl(&dword_206440000, v30, v31, "eapolcontroller_client_attach(%s): %s", buf, 0x16u);
            }
            v33 = 6;
          }
          else
          {
            if (!bytes
              || (*a4 = my_CFPropertyListCreateWithBytePtrAndLength(bytes, v39),
                  MEMORY[0x20BCF6228](*v15, bytes, v39),
                  *a4))
            {
              if (!previous[0])
              {
                *((_QWORD *)v14 + 3) = a2;
                *((_QWORD *)v14 + 4) = a3;
                *((_QWORD *)v14 + 1) = CFMachPortCreateRunLoopSource(0, *(CFMachPortRef *)v14, 0);
                Current = CFRunLoopGetCurrent();
                CFRunLoopAddSource(Current, *((CFRunLoopSourceRef *)v14 + 1), (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
                return v14;
              }
              v19 = 0;
              goto LABEL_17;
            }
            v19 = 0;
            v33 = 12;
          }
          previous[0] = v33;
LABEL_17:
          EAPOLClientInvalidate((uint64_t)v14, v19);
          my_CFRelease(a4);
          free(v14);
          v13 = previous[0];
          goto LABEL_18;
        }
        v24 = v23;
        v25 = EAPLogGetLogHandle();
        v26 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v25, v26))
        {
          v27 = mach_error_string(v24);
          *(_DWORD *)buf = 136315138;
          v42 = v27;
          _os_log_impl(&dword_206440000, v25, v26, "mach_port_request_notification(): %s", buf, 0xCu);
        }
LABEL_16:
        v19 = 1;
        goto LABEL_17;
      }
      v16 = 0;
    }
    if (*(_DWORD *)buf)
    {
      mach_port_mod_refs(*v15, *(mach_port_name_t *)buf, 1u, -1);
      if ((v16 & 1) == 0)
        mach_port_deallocate(*v15, *(mach_port_name_t *)buf);
    }
    *(_QWORD *)v14 = 0;
    v17 = EAPLogGetLogHandle();
    v18 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v17, v18))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206440000, v17, v18, "_EAPOLClientCFMachPortCreate failed", buf, 2u);
    }
    previous[0] = *__error();
    goto LABEL_16;
  }
  v13 = 22;
LABEL_7:
  my_CFRelease(a4);
LABEL_18:
  v14 = 0;
  *a5 = v13;
  return v14;
}

uint64_t eapolcontroller_client_attach(int a1, __int128 *a2, int a3, _DWORD *a4, _QWORD *a5, _DWORD *a6, _DWORD *a7)
{
  __int128 v12;
  mach_port_name_t reply_port;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v18;
  _BYTE rcv_name[32];
  int v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;

  *(_OWORD *)&rcv_name[16] = 0u;
  *(_OWORD *)rcv_name = 0u;
  *(_DWORD *)&rcv_name[20] = 1;
  *(_DWORD *)&rcv_name[24] = a3;
  v20 = 1114112;
  v21 = *MEMORY[0x24BDAC470];
  v12 = a2[1];
  v22 = *a2;
  v23 = v12;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = reply_port;
  v18 = -2147478253;
  *(_QWORD *)&rcv_name[12] = 0x55FC00000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v18);
    reply_port = *(_DWORD *)&rcv_name[8];
  }
  v14 = mach_msg((mach_msg_header_t *)&v18, 3, 0x50u, 0x50u, reply_port, 0, 0);
  v15 = v14;
  if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  else
  {
    if (!(_DWORD)v14)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v15 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 22112)
      {
        if (v18 < 0)
        {
          v15 = 4294966996;
          if (*(_DWORD *)&rcv_name[20] == 2
            && *(_DWORD *)rcv_name == 72
            && !*(_DWORD *)&rcv_name[4]
            && HIWORD(v20) << 16 == 1114112
            && BYTE3(v22) == 1)
          {
            v16 = DWORD1(v22);
            if (DWORD1(v22) == (_DWORD)v23)
            {
              v15 = 0;
              *a4 = *(_DWORD *)&rcv_name[24];
              *a5 = v21;
              *a6 = v16;
              *a7 = DWORD1(v23);
              return v15;
            }
          }
        }
        else if (*(_DWORD *)rcv_name == 36)
        {
          v15 = 4294966996;
          if (*(_DWORD *)&rcv_name[28])
          {
            if (*(_DWORD *)&rcv_name[4])
              v15 = 4294966996;
            else
              v15 = *(unsigned int *)&rcv_name[28];
          }
        }
        else
        {
          v15 = 4294966996;
        }
      }
      else
      {
        v15 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)&v18);
      return v15;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  return v15;
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

uint64_t EAPClientModuleAddBuiltinModule(uint64_t (*a1)(const char *))
{
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t v4;
  uint64_t (*v5)(void);
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _UNKNOWN **v11;
  char *v13;
  _QWORD *v14;
  unsigned int (*v15)(void);

  if ((EAPClientModuleInit_first & 1) == 0)
    EAPClientModuleInit_first = 1;
  v2 = a1("eap_type");
  if (!v2)
    return 5;
  v3 = (uint64_t (*)(void))v2;
  v4 = a1("eap_name");
  if (!v4)
    return 5;
  v5 = (uint64_t (*)(void))v4;
  v6 = v3();
  if ((v6 - 256) < 0xFFFFFF01)
    return 1;
  v8 = v6;
  v9 = v5();
  if (!v9)
    return 5;
  v10 = v9;
  v11 = &S_head;
  while (1)
  {
    v11 = (_UNKNOWN **)*v11;
    if (!v11)
      break;
    if (*(_DWORD *)v11[3] == v8)
      return 2;
  }
  v13 = (char *)malloc_type_malloc(0x90uLL, 0x10D0040BC8CE643uLL);
  if (!v13)
    return 3;
  v14 = v13;
  *(_OWORD *)(v13 + 4) = 0u;
  *((_OWORD *)v13 + 8) = 0u;
  *(_OWORD *)(v13 + 116) = 0u;
  *(_OWORD *)(v13 + 100) = 0u;
  *(_OWORD *)(v13 + 84) = 0u;
  *(_OWORD *)(v13 + 68) = 0u;
  *(_OWORD *)(v13 + 52) = 0u;
  *(_OWORD *)(v13 + 36) = 0u;
  *(_OWORD *)(v13 + 20) = 0u;
  *(_DWORD *)v13 = v8;
  *((_QWORD *)v13 + 1) = v10;
  *((_QWORD *)v13 + 2) = a1("introspect");
  v14[4] = a1("init");
  v14[3] = a1("version");
  v14[5] = a1("free");
  v14[6] = a1("process");
  v14[7] = a1("free_packet");
  v14[8] = a1("failure_string");
  v14[9] = a1("session_key");
  v14[10] = a1("server_key");
  v14[11] = a1("master_session_key_copy_bytes");
  v14[12] = a1("require_properties");
  v14[13] = a1("publish_properties");
  v14[14] = a1("packet_dump");
  v14[15] = a1("user_name");
  v14[16] = a1("copy_identity");
  v14[17] = a1("copy_packet_description");
  if (v14[4] && (v15 = (unsigned int (*)(void))v14[3]) != 0 && v14[5] && v14[6] && v14[7])
  {
    if (v15() == 1)
    {
      v7 = EAPClientModuleAdd((uint64_t)v14);
      if (!(_DWORD)v7)
        return v7;
    }
    else
    {
      v7 = 4;
    }
  }
  else
  {
    v7 = 5;
  }
  free(v14);
  return v7;
}

uint64_t md5_introspect(char *__s1)
{
  const char *v2;
  char **v3;
  char *v4;

  v2 = "version";
  v3 = &off_24BF0CE08;
  while (strcmp(__s1, v2))
  {
    v4 = *v3;
    v3 += 2;
    v2 = v4;
    if (!v4)
      return 0;
  }
  return (uint64_t)*(v3 - 1);
}

uint64_t md5_type()
{
  return 4;
}

const char *md5_name()
{
  return "MD5";
}

uint64_t md5_version()
{
  return 1;
}

uint64_t leap_introspect(char *__s1)
{
  const char *v2;
  char **v3;
  char *v4;

  v2 = "version";
  v3 = &off_24BF0CA50;
  while (strcmp(__s1, v2))
  {
    v4 = *v3;
    v3 += 2;
    v2 = v4;
    if (!v4)
      return 0;
  }
  return (uint64_t)*(v3 - 1);
}

uint64_t leap_type()
{
  return 17;
}

const char *leap_name()
{
  return "LEAP";
}

uint64_t leap_version()
{
  return 1;
}

uint64_t eaptls_introspect(char *__s1)
{
  const char *v2;
  char **v3;
  char *v4;

  v2 = "version";
  v3 = &off_24BF0CD08;
  while (strcmp(__s1, v2))
  {
    v4 = *v3;
    v3 += 2;
    v2 = v4;
    if (!v4)
      return 0;
  }
  return (uint64_t)*(v3 - 1);
}

uint64_t eaptls_type()
{
  return 13;
}

const char *eaptls_name()
{
  return EAPTypeStr(13);
}

uint64_t eaptls_version()
{
  return 1;
}

uint64_t eapttls_introspect(char *__s1)
{
  const char *v2;
  char **v3;
  char *v4;

  v2 = "version";
  v3 = &off_24BF0D210;
  while (strcmp(__s1, v2))
  {
    v4 = *v3;
    v3 += 2;
    v2 = v4;
    if (!v4)
      return 0;
  }
  return (uint64_t)*(v3 - 1);
}

uint64_t eapttls_type()
{
  return 21;
}

const char *eapttls_name()
{
  return EAPTypeStr(21);
}

uint64_t eapttls_version()
{
  return 1;
}

uint64_t peap_introspect(char *__s1)
{
  const char *v2;
  char **v3;
  char *v4;

  v2 = "version";
  v3 = &off_24BF0D068;
  while (strcmp(__s1, v2))
  {
    v4 = *v3;
    v3 += 2;
    v2 = v4;
    if (!v4)
      return 0;
  }
  return (uint64_t)*(v3 - 1);
}

uint64_t peap_type()
{
  return 25;
}

const char *peap_name()
{
  return EAPTypeStr(25);
}

uint64_t peap_version()
{
  return 1;
}

uint64_t eapfast_introspect(char *__s1)
{
  const char *v2;
  char **v3;
  char *v4;

  v2 = "version";
  v3 = &off_24BF0CE98;
  while (strcmp(__s1, v2))
  {
    v4 = *v3;
    v3 += 2;
    v2 = v4;
    if (!v4)
      return 0;
  }
  return (uint64_t)*(v3 - 1);
}

uint64_t eapfast_type()
{
  return 43;
}

const char *eapfast_name()
{
  return "EAP-FAST";
}

uint64_t eapfast_version()
{
  return 1;
}

uint64_t eapmschapv2_introspect(char *__s1)
{
  const char *v2;
  char **v3;
  char *v4;

  v2 = "version";
  v3 = &off_24BF0C8D8;
  while (strcmp(__s1, v2))
  {
    v4 = *v3;
    v3 += 2;
    v2 = v4;
    if (!v4)
      return 0;
  }
  return (uint64_t)*(v3 - 1);
}

uint64_t eapmschapv2_type()
{
  return 26;
}

const char *eapmschapv2_name()
{
  return "MSCHAPv2";
}

uint64_t eapmschapv2_version()
{
  return 1;
}

uint64_t eapgtc_introspect(char *__s1)
{
  const char *v2;
  char **v3;
  char *v4;

  v2 = "version";
  v3 = &off_24BF0D180;
  while (strcmp(__s1, v2))
  {
    v4 = *v3;
    v3 += 2;
    v2 = v4;
    if (!v4)
      return 0;
  }
  return (uint64_t)*(v3 - 1);
}

uint64_t eapgtc_type()
{
  return 6;
}

const char *eapgtc_name()
{
  return "GTC";
}

uint64_t eapgtc_version()
{
  return 1;
}

uint64_t eapsim_introspect(char *__s1)
{
  const char *v2;
  char **v3;
  char *v4;

  v2 = "version";
  v3 = &off_24BF0D358;
  while (strcmp(__s1, v2))
  {
    v4 = *v3;
    v3 += 2;
    v2 = v4;
    if (!v4)
      return 0;
  }
  return (uint64_t)*(v3 - 1);
}

uint64_t eapsim_type()
{
  return 18;
}

const char *eapsim_name()
{
  return "EAP-SIM";
}

uint64_t eapsim_version()
{
  return 1;
}

_UNKNOWN **EAPClientModuleLookup(int a1)
{
  _UNKNOWN **result;

  result = &S_head;
  do
    result = (_UNKNOWN **)*result;
  while (result && *(_DWORD *)result[3] != a1);
  return result;
}

uint64_t EAPClientModulePluginUserName(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);

  v2 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 120);
  if (v2)
    return v2(a2);
  else
    return 0;
}

uint64_t EAPSecIdentityHandleCreateSecIdentity(const __CFDictionary *a1, _QWORD *a2)
{
  CFTypeID TypeID;
  const void *Value;
  CFTypeID v6;
  const void *v7;
  CFTypeID v8;
  SecCertificateRef v9;
  uint64_t v10;
  const __CFArray *v11;
  CFIndex Count;
  CFIndex v13;
  __SecIdentity *ValueAtIndex;
  void *v15;
  SecCertificateRef v16;
  CFIndex v17;
  BOOL v18;
  NSObject *LogHandle;
  os_log_type_t v20;
  const char *v21;
  CFTypeID v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFDictionary *v26;
  const __CFDictionary *v27;
  CFTypeID v28;
  uint64_t v29;
  uint64_t v30;
  const __CFDictionary *v31;
  NSObject *v32;
  os_log_type_t v33;
  const char *v34;
  const char *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint32_t v38;
  NSObject *v39;
  os_log_type_t v40;
  UInt8 *BytePtr;
  SecCertificateRef v42;
  CFIndex v43;
  CFIndex v44;
  uint64_t v45;
  __SecIdentity *v46;
  OSStatus v47;
  const void **v48;
  int v50;
  NSObject *v51;
  os_log_type_t v52;
  const char *v53;
  NSObject *v54;
  os_log_type_t v55;
  CFArrayRef theArray;
  SecCertificateRef v57;
  CFTypeRef v58;
  const __CFDictionary *v59;
  _BYTE result[12];
  __int16 v61;
  int v62;
  SecCertificateRef certificateRef;
  uint64_t v64;
  const __CFDictionary *v65;
  uint64_t v66;
  _BYTE buf[24];
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  *a2 = 0;
  if (!a1)
  {
    v9 = 0;
    v57 = 0;
    *a2 = 0;
    goto LABEL_11;
  }
  TypeID = CFDictionaryGetTypeID();
  if (CFGetTypeID(a1) == TypeID)
  {
    v57 = 0;
    *a2 = 0;
    Value = CFDictionaryGetValue(a1, CFSTR("IdentityHandleType"));
    v6 = CFStringGetTypeID();
    if (Value && CFGetTypeID(Value) == v6)
    {
      if (!CFEqual(Value, CFSTR("CertificateData"))
        || (v7 = CFDictionaryGetValue(a1, CFSTR("IdentityHandleData")), v8 = CFDataGetTypeID(), !v7)
        || CFGetTypeID(v7) != v8
        || (v9 = SecCertificateCreateWithData(0, (CFDataRef)v7), (v57 = v9) == 0))
      {
        v10 = 22;
LABEL_55:
        v48 = (const void **)&v57;
LABEL_56:
        my_CFRelease(v48);
        return v10;
      }
LABEL_11:
      theArray = 0;
      v10 = EAPSecIdentityListCreate(&theArray);
      if (!(_DWORD)v10)
      {
        v11 = theArray;
        Count = CFArrayGetCount(theArray);
        if (!*a2)
        {
          v13 = Count;
          if (Count >= 1)
          {
            certificateRef = 0;
            ValueAtIndex = (__SecIdentity *)CFArrayGetValueAtIndex(v11, 0);
            v15 = ValueAtIndex;
            if (v9)
            {
              v10 = SecIdentityCopyCertificate(ValueAtIndex, &certificateRef);
              v16 = certificateRef;
              if (certificateRef)
              {
                v17 = 1;
                while (1)
                {
                  if (CFEqual(v9, v16))
                  {
                    CFRetain(v15);
                    *a2 = v15;
                  }
                  CFRelease(certificateRef);
                  v18 = *a2 || v13 <= v17;
                  if (v18)
                    break;
                  certificateRef = 0;
                  v15 = (void *)CFArrayGetValueAtIndex(v11, v17);
                  v10 = SecIdentityCopyCertificate((SecIdentityRef)v15, &certificateRef);
                  v16 = certificateRef;
                  ++v17;
                  if (!certificateRef)
                    goto LABEL_24;
                }
              }
              else
              {
LABEL_24:
                LogHandle = EAPLogGetLogHandle();
                v20 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(LogHandle, v20))
                {
                  v21 = EAPSecurityErrorString(v10);
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = v21;
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = v10;
                  _os_log_impl(&dword_206440000, LogHandle, v20, "SecIdentityCopyCertificate failed, %s (%d)", buf, 0x12u);
                }
              }
            }
            else
            {
              CFRetain(ValueAtIndex);
              v10 = 0;
              *a2 = v15;
            }
          }
        }
        CFRelease(v11);
      }
      goto LABEL_55;
    }
    v58 = 0;
    *a2 = 0;
    v27 = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("TLSClientIdentityData"));
    v28 = CFDataGetTypeID();
    if (v27 && CFGetTypeID(v27) == v28)
    {
      v29 = *MEMORY[0x24BDE94D8];
      *(_QWORD *)buf = *MEMORY[0x24BDE9220];
      *(_QWORD *)&buf[8] = v29;
      *(_QWORD *)&buf[16] = *MEMORY[0x24BDE9558];
      v30 = *MEMORY[0x24BDBD270];
      certificateRef = (SecCertificateRef)*MEMORY[0x24BDE9238];
      v64 = v30;
      v65 = v27;
      v31 = CFDictionaryCreate(0, (const void **)buf, (const void **)&certificateRef, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v59 = v31;
      if (!v31)
        return 4294967188;
      v10 = SecItemCopyMatching(v31, &v58);
      if ((_DWORD)v10)
      {
        v32 = EAPLogGetLogHandle();
        v33 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v32, v33))
        {
LABEL_66:
          v48 = (const void **)&v59;
          goto LABEL_56;
        }
        v34 = EAPSecurityErrorString(v10);
        *(_DWORD *)result = 136315394;
        *(_QWORD *)&result[4] = v34;
        v61 = 1024;
        v62 = v10;
        v35 = "SecItemCopyMatching failed, %s (%d)";
        v36 = v32;
        v37 = v33;
        v38 = 18;
      }
      else
      {
        if (isA_SecIdentity(v58))
        {
          *a2 = v58;
          goto LABEL_66;
        }
        v54 = EAPLogGetLogHandle();
        v55 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v54, v55))
          goto LABEL_66;
        *(_WORD *)result = 0;
        v35 = "Identity data with incorrect data type";
        v36 = v54;
        v37 = v55;
        v38 = 2;
      }
      _os_log_impl(&dword_206440000, v36, v37, v35, result, v38);
      goto LABEL_66;
    }
    v39 = EAPLogGetLogHandle();
    v40 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v39, v40))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = CFSTR("TLSClientIdentityData");
      _os_log_impl(&dword_206440000, v39, v40, "invalid data found in %@ property.", buf, 0xCu);
    }
    return 4294967246;
  }
  else
  {
    v22 = CFDataGetTypeID();
    if (CFGetTypeID(a1) == v22)
    {
      *a2 = 0;
      if (CFDataGetLength(a1) == 64)
      {
        certificateRef = 0;
        if (!EAPSecIdentityListCreate(&certificateRef))
        {
          BytePtr = (UInt8 *)CFDataGetBytePtr(a1);
          v42 = certificateRef;
          v43 = CFArrayGetCount(certificateRef);
          if (*a2 || (v44 = v43, v43 < 1))
          {
LABEL_51:
            CFRelease(v42);
            if (*a2)
              return 0;
          }
          else
          {
            v45 = 1;
            while (1)
            {
              *(_QWORD *)result = 0;
              v46 = (__SecIdentity *)CFArrayGetValueAtIndex(v42, v45 - 1);
              v47 = SecIdentityCopyCertificate(v46, (SecCertificateRef *)result);
              if (v47)
                break;
              if (IdentityHandleMatchesCertificate(BytePtr))
              {
                CFRetain(v46);
                *a2 = v46;
              }
              CFRelease(*(CFTypeRef *)result);
              if (!*a2)
              {
                v18 = v44 <= v45++;
                if (!v18)
                  continue;
              }
              goto LABEL_51;
            }
            v50 = v47;
            v51 = EAPLogGetLogHandle();
            v52 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v51, v52))
            {
              v53 = EAPSecurityErrorString(v50);
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v53;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v50;
              _os_log_impl(&dword_206440000, v51, v52, "SecIdentityCopyCertificate failed, %s (%d)", buf, 0x12u);
            }
            CFRelease(v42);
          }
        }
      }
      v23 = *MEMORY[0x24BDE94D8];
      *(_QWORD *)buf = *MEMORY[0x24BDE9220];
      *(_QWORD *)&buf[8] = v23;
      v24 = *MEMORY[0x24BDE9538];
      *(_QWORD *)&buf[16] = *MEMORY[0x24BDE9558];
      v68 = v24;
      *(_QWORD *)result = 0;
      v25 = *MEMORY[0x24BDBD270];
      certificateRef = (SecCertificateRef)*MEMORY[0x24BDE9238];
      v64 = v25;
      v65 = a1;
      v66 = v25;
      *a2 = 0;
      v26 = CFDictionaryCreate(0, (const void **)buf, (const void **)&certificateRef, 4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v10 = SecItemCopyMatching(v26, (CFTypeRef *)result);
      CFRelease(v26);
      if (!(_DWORD)v10)
        *a2 = *(_QWORD *)result;
    }
    else
    {
      return 22;
    }
  }
  return v10;
}

const void *EAPSecCertificateCopyUserNameString(uint64_t a1)
{
  __CFDictionary *v1;
  const __CFDictionary *v2;
  uint64_t v3;
  const void *Value;
  const void *v5;
  __CFDictionary *v7;

  v1 = EAPSecCertificateCopyAttributesDictionary(a1);
  v7 = v1;
  if (v1)
  {
    v2 = v1;
    v3 = 0;
    while (1)
    {
      Value = CFDictionaryGetValue(v2, off_24BF0CA20[v3]);
      if (Value)
        break;
      if (++v3 == 3)
        goto LABEL_5;
    }
    v5 = Value;
    CFRetain(Value);
  }
  else
  {
LABEL_5:
    v5 = 0;
  }
  my_CFRelease((const void **)&v7);
  return v5;
}

__CFDictionary *EAPSecCertificateCopyAttributesDictionary(uint64_t a1)
{
  __CFDictionary *Mutable;
  uint64_t (*v3)(uint64_t);
  uint64_t *v4;
  const void *v5;
  uint64_t v6;
  const __CFArray *v7;
  CFIndex v8;
  const void *ValueAtIndex;
  uint64_t (*v10)(uint64_t);

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BDE88C8];
  v4 = &qword_24BF0C9F0;
  do
  {
    v5 = (const void *)*(v4 - 1);
    v6 = v3(a1);
    if (v6)
    {
      v7 = (const __CFArray *)v6;
      if (CFEqual(v5, CFSTR("CommonName")))
        v8 = CFArrayGetCount(v7) - 1;
      else
        v8 = 0;
      ValueAtIndex = CFArrayGetValueAtIndex(v7, v8);
      CFDictionarySetValue(Mutable, v5, ValueAtIndex);
      CFRelease(v7);
    }
    v10 = (uint64_t (*)(uint64_t))*v4;
    v4 += 2;
    v3 = v10;
  }
  while (v10);
  if (!CFDictionaryGetCount(Mutable))
  {
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

UInt8 *my_CFStringToCString(const __CFString *a1, CFStringEncoding a2)
{
  CFIndex Length;
  UInt8 *result;
  char v6;
  uint64_t v7;
  char v8;
  CFRange v9;
  CFRange v10;

  Length = CFStringGetLength(a1);
  if (a2 == -1)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = v6;
      v10.location = 0;
      v10.length = Length;
      result = S_copy_cstring(a1, v10, S_encodings[v7]);
      if (result)
        break;
      v6 = 1;
      v7 = 1;
    }
    while ((v8 & 1) == 0);
  }
  else
  {
    v9.location = 0;
    v9.length = Length;
    return S_copy_cstring(a1, v9, a2);
  }
  return result;
}

uint64_t EAPOLClientReportStatus(uint64_t a1, const void *a2)
{
  CFTypeID TypeID;
  CFDataRef Data;
  const __CFData *v6;
  mach_port_t v7;
  const UInt8 *BytePtr;
  int Length;
  mach_error_t v10;
  unsigned int v11;
  unsigned int v13;
  CFDataRef v14;

  v14 = 0;
  v13 = 0;
  TypeID = CFDictionaryGetTypeID();
  if (!a2 || CFGetTypeID(a2) != TypeID)
  {
    v11 = 22;
    goto LABEL_7;
  }
  Data = CFPropertyListCreateData(0, a2, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  v14 = Data;
  if (!Data)
  {
    v11 = 12;
    goto LABEL_7;
  }
  v6 = Data;
  v7 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(Data);
  Length = CFDataGetLength(v6);
  v10 = eapolcontroller_client_report_status(v7, (uint64_t)BytePtr, Length, (int *)&v13);
  if (v10)
  {
    mach_error("eapolcontroller_client_report_status failed", v10);
    v11 = 6;
LABEL_7:
    v13 = v11;
  }
  my_CFRelease((const void **)&v14);
  return v13;
}

uint64_t eapolcontroller_client_report_status(mach_port_t a1, uint64_t a2, int a3, int *a4)
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
  *(_QWORD *)&v11.msgh_voucher_port = 0x55FF00000000;
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
    else if (v11.msgh_id == 22115)
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

void LinkAddresses_free(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  if (*a1)
  {
    if (*(int *)(v2 + 8) >= 1)
    {
      v3 = 0;
      do
      {
        free(*(void **)(*(_QWORD *)v2 + 8 * v3));
        *(_QWORD *)(*(_QWORD *)v2 + 8 * v3++) = 0;
      }
      while (v3 < *(int *)(v2 + 8));
    }
    free(*(void **)v2);
    free((void *)v2);
  }
  *a1 = 0;
}

uint64_t EAPPacketValid(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  __CFString *Mutable;
  uint64_t IsValid;

  if (!a3)
    return EAPPacketIsValid(a1, a2, 0);
  Mutable = CFStringCreateMutable(0, 0);
  IsValid = EAPPacketIsValid(a1, a2, Mutable);
  if (Mutable)
  {
    SCPrint();
    CFRelease(Mutable);
  }
  return IsValid;
}

char *EAPPacketCreate(char *a1, signed int a2, char a3, char a4, int a5, void *__src, int a7, signed int *a8)
{
  signed int v14;
  char *v15;
  void *v16;

  if (a5)
    v14 = a7 + 5;
  else
    v14 = 4;
  if (!a1 || (v15 = a1, v14 > a2))
    v15 = (char *)malloc_type_malloc(v14, 0x7BB74EAAuLL);
  *v15 = a3;
  v15[1] = a4;
  *((_WORD *)v15 + 1) = bswap32(v14) >> 16;
  if (a5)
  {
    v15[4] = a5;
    if (!__src)
      goto LABEL_13;
    v16 = v15 + 5;
  }
  else
  {
    if (!__src)
      goto LABEL_13;
    v16 = v15 + 4;
  }
  memcpy(v16, __src, a7);
LABEL_13:
  if (a8)
    *a8 = v14;
  return v15;
}

uint64_t EAPClientModulePluginInit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);

  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 24) + 32);
  if (v4)
    return v4(a2, a3, a4);
  else
    return 1;
}

uint64_t eaptls_init(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  _OWORD *v5;

  v5 = malloc_type_malloc(0x128uLL, 0x10E0040D8CCA30BuLL);
  *v5 = 0u;
  v5[1] = 0u;
  v5[2] = 0u;
  v5[3] = 0u;
  v5[4] = 0u;
  v5[6] = 0u;
  v5[7] = 0u;
  v5[8] = 0u;
  v5[9] = 0u;
  v5[10] = 0u;
  v5[11] = 0u;
  v5[12] = 0u;
  v5[13] = 0u;
  v5[14] = 0u;
  v5[15] = 0u;
  v5[16] = 0u;
  v5[17] = 0u;
  *((_QWORD *)v5 + 36) = 0;
  v5[5] = 0u;
  *((_BYTE *)v5 + 108) = my_CFDictionaryGetBooleanValue(*(const __CFDictionary **)(a1 + 80), CFSTR("TLSCertificateIsRequired"), 1);
  *((_DWORD *)v5 + 30) = *(_DWORD *)(a1 + 16);
  *((_BYTE *)v5 + 270) = my_CFDictionaryGetBooleanValue(*(const __CFDictionary **)(a1 + 80), CFSTR("TLSEnableSessionResumption"), 1);
  memoryIOInit((_QWORD *)v5 + 10, (_OWORD *)((char *)v5 + 8), (_OWORD *)((char *)v5 + 40));
  *(_QWORD *)a1 = v5;
  *a3 = 0;
  return 0;
}

uint64_t EAPSecIdentityHandleCreateSecIdentityTrustChain(const __CFDictionary *a1, __CFArray **a2)
{
  uint64_t TrustChain;
  __SecIdentity *v5;

  v5 = 0;
  *a2 = 0;
  TrustChain = EAPSecIdentityHandleCreateSecIdentity(a1, &v5);
  if (!(_DWORD)TrustChain)
    TrustChain = EAPSecIdentityCreateTrustChain(v5, a2);
  my_CFRelease((const void **)&v5);
  return TrustChain;
}

uint64_t EAPSecPolicyCopy(uint64_t *a1)
{
  uint64_t EAP;

  EAP = SecPolicyCreateEAP();
  *a1 = EAP;
  if (EAP)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

BOOL my_CFDictionaryGetBooleanValue(const __CFDictionary *a1, const void *a2, int a3)
{
  const __CFBoolean *Value;
  CFTypeID TypeID;

  if (a1)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
    TypeID = CFBooleanGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID)
        a3 = CFBooleanGetValue(Value);
    }
  }
  return a3 != 0;
}

double memoryIOInit(_QWORD *a1, _OWORD *a2, _OWORD *a3)
{
  double result;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  result = 0.0;
  *a2 = 0u;
  a2[1] = 0u;
  *a3 = 0u;
  a3[1] = 0u;
  a1[1] = a2;
  a1[2] = a3;
  return result;
}

double memoryIOClearBuffers(uint64_t a1)
{
  memoryBufferClear(*(_QWORD *)(a1 + 8));
  return memoryBufferClear(*(_QWORD *)(a1 + 16));
}

double memoryBufferClear(uint64_t a1)
{
  void *v2;
  double result;

  if (a1)
  {
    v2 = *(void **)a1;
    if (v2)
      free(v2);
    result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

SSLContext *EAPTLSMemIOContextCreate(const __CFDictionary *a1, int a2, const void *a3, const char *a4, OSStatus *a5)
{
  const void *Value;
  const void *v11;
  CFTypeID TypeID;
  SSLProtocol v13;
  CFTypeID v14;
  SSLProtocol v15;
  NSObject *v16;
  os_log_type_t v17;
  NSObject *v18;
  os_log_type_t v19;
  SSLContext *v20;
  OSStatus v21;
  size_t v23;
  NSObject *LogHandle;
  os_log_type_t v25;
  uint8_t v26[16];
  uint8_t buf[16];
  uint8_t v28[16];

  if (!a1)
  {
    v15 = kTLSProtocol12;
    v13 = kTLSProtocol1;
    goto LABEL_25;
  }
  Value = CFDictionaryGetValue(a1, CFSTR("TLSMinimumVersion"));
  v11 = CFDictionaryGetValue(a1, CFSTR("TLSMaximumVersion"));
  TypeID = CFStringGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID && !CFEqual(Value, CFSTR("1.0")))
  {
    if (CFEqual(Value, CFSTR("1.1")))
    {
      v13 = kTLSProtocol11;
      goto LABEL_6;
    }
    if (CFEqual(Value, CFSTR("1.2")))
    {
      v13 = kTLSProtocol12;
      goto LABEL_6;
    }
    LogHandle = EAPLogGetLogHandle();
    v25 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v25))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_206440000, LogHandle, v25, "invalid minimum TLS version", v28, 2u);
    }
  }
  v13 = kTLSProtocol1;
LABEL_6:
  v14 = CFStringGetTypeID();
  if (v11 && CFGetTypeID(v11) == v14)
  {
    if (CFEqual(v11, CFSTR("1.0")))
    {
      v15 = kTLSProtocol1;
      goto LABEL_21;
    }
    if (CFEqual(v11, CFSTR("1.1")))
    {
      v15 = kTLSProtocol11;
      goto LABEL_21;
    }
    if (!CFEqual(v11, CFSTR("1.2")))
    {
      v16 = EAPLogGetLogHandle();
      v17 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v16, v17))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_206440000, v16, v17, "invalid maximum TLS version", buf, 2u);
      }
    }
  }
  v15 = kTLSProtocol12;
LABEL_21:
  if (v13 > v15)
  {
    v18 = EAPLogGetLogHandle();
    v19 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v18, v19))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_206440000, v18, v19, "minimum TLS version cannot be higher than maximum TLS version", v26, 2u);
    }
    v13 = v15;
  }
LABEL_25:
  *a5 = 0;
  v20 = SSLCreateContext(0, (SSLProtocolSide)(a2 ^ 1), kSSLStreamType);
  v21 = SSLSetIOFuncs(v20, (SSLReadFunc)EAPSSLMemoryIORead, (SSLWriteFunc)EAPSSLMemoryIOWrite);
  if (v21
    || (v21 = SSLSetProtocolVersionMin(v20, v13)) != 0
    || (v21 = SSLSetProtocolVersionMax(v20, v15)) != 0
    || (v21 = SSLSetConnection(v20, a3)) != 0
    || a4 && (v23 = strlen(a4), (v21 = SSLSetPeerDomainName(v20, a4, v23 + 1)) != 0)
    || (SSLSetSessionOption(v20, kSSLSessionOptionSendOneByteRecord, 0), (a2 & 1) == 0)
    && (v21 = SSLSetSessionOption(v20, kSSLSessionOptionBreakOnServerAuth, 1u)) != 0)
  {
    if (v20)
      CFRelease(v20);
    v20 = 0;
    *a5 = v21;
  }
  else
  {
    SSLSetSessionCacheTimeout();
  }
  return v20;
}

uint64_t EAPClientModulePluginEAPName(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 24) + 8);
}

uint64_t EAPClientModulePluginProcess(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 24) + 48);
  if (v6)
    return v6(a2, a3, a4, a5, a6);
  else
    return 2;
}

uint64_t eaptls_process(uint64_t a1, unsigned __int8 *a2, _QWORD *a3, int *a4, _DWORD *a5)
{
  uint64_t *v7;
  int v8;
  uint64_t *v12;
  unsigned int Length;
  NSObject *LogHandle;
  os_log_type_t v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  _BYTE *v20;
  int v21;
  int v22;
  int v23;
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  int v33;
  int v34;
  _QWORD *v36;
  const void *v37;
  unsigned int v38;
  unsigned __int8 v39;
  char v40;
  const char *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint64_t *v44;
  uint64_t *v45;
  const __CFArray *v46;
  const __CFArray **v47;
  uint64_t *Context;
  uint64_t v49;
  const void *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  unsigned int v54;
  const char *v55;
  unint64_t v56;
  int v57;
  _DWORD *v58;
  NSObject *v59;
  os_log_type_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  os_log_type_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  os_log_type_t v77;
  uint64_t v78;
  unsigned int MessageLength;
  NSObject *v80;
  os_log_type_t v81;
  const char *v82;
  NSObject *v83;
  os_log_type_t v84;
  const void *v85;
  size_t v86;
  unsigned int v87;
  unsigned int v88;
  NSObject *v89;
  os_log_type_t v90;
  const char *v91;
  unsigned int v92;
  _QWORD *v93;
  const void *v94;
  SSLSessionState state;
  int v96;
  uint8_t buf[4];
  _BYTE v98[18];
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v7 = *(uint64_t **)a1;
  *a4 = 0;
  *a5 = 0;
  *a3 = 0;
  v8 = *a2;
  if (v8 == 4)
  {
    v21 = 2;
LABEL_28:
    *((_DWORD *)v7 + 26) = v21;
    goto LABEL_29;
  }
  if (v8 != 3)
  {
    if (v8 != 1)
      goto LABEL_29;
    v12 = *(uint64_t **)a1;
    Length = EAPPacketGetLength((uint64_t)a2);
    state = kSSLIdle;
    if (Length <= 5)
    {
      LogHandle = EAPLogGetLogHandle();
      v15 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v15))
      {
LABEL_9:
        v20 = 0;
LABEL_22:
        *a3 = v20;
        goto LABEL_29;
      }
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v98 = Length;
      *(_WORD *)&v98[4] = 2048;
      *(_QWORD *)&v98[6] = 6;
      v16 = "eaptls_request: length %d < %ld";
      goto LABEL_7;
    }
    v28 = EAPTLSSessionGetState(*v12, &state);
    if ((_DWORD)v28)
    {
      v29 = v28;
      v30 = EAPLogGetLogHandle();
      v31 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v30, v31))
      {
        v32 = EAPSSLErrorString(v29);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v98 = v32;
        *(_WORD *)&v98[8] = 2048;
        *(_QWORD *)&v98[10] = (int)v29;
        _os_log_impl(&dword_206440000, v30, v31, "EAPTLSSessionGetState failed, %s (%ld)", buf, 0x16u);
      }
      v20 = 0;
      *((_DWORD *)v12 + 26) = 2;
      *((_DWORD *)v12 + 31) = v29;
      goto LABEL_22;
    }
    v36 = v12 + 5;
    v37 = a2 + 6;
    v38 = Length - 6;
    v39 = a2[5];
    if ((v39 & 0x20) != 0)
    {
      if (state != kSSLHandshake || !*v36 || *((_DWORD *)v12 + 19) != a2[1])
      {
        state = kSSLIdle;
LABEL_47:
        v93 = v36;
        v44 = *(uint64_t **)a1;
        EAPTLSSessionFreeContext(**(_QWORD **)a1);
        my_CFRelease((const void **)v44 + 34);
        memoryIOClearBuffers((uint64_t)(v44 + 10));
        if (*((_BYTE *)v44 + 108))
        {
          if (!v44[14])
          {
            v64 = EAPTLSCopyIdentityTrustChain(*(__SecIdentity **)(a1 + 96), *(CFDictionaryRef *)(a1 + 80), (__CFArray **)v44 + 14);
            if ((_DWORD)v64)
            {
              v65 = v64;
              v66 = EAPLogGetLogHandle();
              v67 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v66, v67))
              {
                v68 = EAPSSLErrorString(v65);
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)v98 = v68;
                *(_WORD *)&v98[8] = 2048;
                *(_QWORD *)&v98[10] = (int)v65;
                _os_log_impl(&dword_206440000, v66, v67, "failed to find client cert/identity, %s (%ld)", buf, 0x16u);
              }
              goto LABEL_110;
            }
          }
        }
        v96 = 0;
        v45 = *(uint64_t **)a1;
        if (!*(_BYTE *)(*(_QWORD *)a1 + 108))
          goto LABEL_52;
        v47 = (const __CFArray **)(v45 + 14);
        v46 = (const __CFArray *)v45[14];
        if (v46)
          goto LABEL_131;
        v69 = EAPTLSCopyIdentityTrustChain(*(__SecIdentity **)(a1 + 96), *(CFDictionaryRef *)(a1 + 80), (__CFArray **)v45 + 14);
        v96 = v69;
        if ((_DWORD)v69)
        {
          v70 = v69;
          v71 = EAPLogGetLogHandle();
          v72 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v71, v72))
          {
            v73 = EAPSSLErrorString(v70);
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v98 = v73;
            *(_WORD *)&v98[8] = 2048;
            *(_QWORD *)&v98[10] = (int)v70;
            _os_log_impl(&dword_206440000, v71, v72, "failed to find client cert/identity, %s (%ld)", buf, 0x16u);
          }
          goto LABEL_85;
        }
        if (!*((_BYTE *)v45 + 108))
        {
LABEL_52:
          Context = EAPTLSSessionCreateContext(*(const __CFDictionary **)(a1 + 80), 13, v45 + 10, (const __CFArray *)v45[14], (unsigned int *)&v96);
          v49 = (uint64_t)Context;
          if (Context && !v96)
          {
            if (!*((_BYTE *)v45 + 270)
              || (v50 = *(const void **)(a1 + 24)) == 0
              || (v96 = EAPTLSSessionSetPeerID(Context, v50, *(unsigned int *)(a1 + 32))) == 0)
            {
              *v45 = v49;
LABEL_86:
              *((_DWORD *)v44 + 26) = 0;
              *((_DWORD *)v44 + 31) = 0;
              *((_DWORD *)v44 + 32) = 0;
              *((_WORD *)v44 + 70) = 0;
              *((_BYTE *)v44 + 271) = 0;
              v44[9] = 0xFFFFFFFF00000000;
              *((_BYTE *)v44 + 280) = 0;
              v74 = EAPTLSSessionHandshake(*v12);
              if ((_DWORD)v74 == -9803)
              {
                LOBYTE(v55) = a2[1];
                v57 = *((_DWORD *)v12 + 30);
                v58 = v12 + 9;
                v36 = v93;
                goto LABEL_88;
              }
              v75 = v74;
              v76 = EAPLogGetLogHandle();
              v77 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v76, v77))
              {
                v78 = EAPSSLErrorString(v75);
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)v98 = v78;
                *(_WORD *)&v98[8] = 1024;
                *(_DWORD *)&v98[10] = v75;
                _os_log_impl(&dword_206440000, v76, v77, "EAPTLSSessionHandshake failed, %s (%d)", buf, 0x12u);
              }
              v20 = 0;
              *((_DWORD *)v12 + 31) = v75;
LABEL_111:
              *((_DWORD *)v12 + 26) = 2;
              goto LABEL_22;
            }
            v51 = EAPLogGetLogHandle();
            v52 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v51, v52))
            {
              v53 = EAPSSLErrorString(v96);
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)v98 = v53;
              *(_WORD *)&v98[8] = 2048;
              *(_QWORD *)&v98[10] = v96;
              _os_log_impl(&dword_206440000, v51, v52, "EAPTLSSessionSetPeerID failed, %s (%ld)", buf, 0x16u);
            }
            goto LABEL_76;
          }
          v61 = EAPLogGetLogHandle();
          v62 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v61, v62))
          {
            v63 = EAPSSLErrorString(v96);
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v98 = v63;
            *(_WORD *)&v98[8] = 2048;
            *(_QWORD *)&v98[10] = v96;
            _os_log_impl(&dword_206440000, v61, v62, "EAPTLSSessionCreateContext failed, %s (%ld)", buf, 0x16u);
          }
          if (v49)
LABEL_76:
            EAPTLSSessionFreeContext(v49);
LABEL_85:
          LODWORD(v65) = v96;
          if (!v96)
            goto LABEL_86;
LABEL_110:
          v20 = 0;
          *((_DWORD *)v12 + 31) = v65;
          goto LABEL_111;
        }
        v46 = *v47;
        if (*v47)
        {
LABEL_131:
          if (CFArrayGetCount(v46))
            goto LABEL_52;
        }
        LODWORD(v65) = -50;
        goto LABEL_110;
      }
      v40 = 0;
      v41 = "Start";
    }
    else if (Length == 6)
    {
      v40 = 0;
      v41 = "Ack";
    }
    else
    {
      if ((a2[5] & 0x80) != 0)
      {
        if (Length <= 9)
        {
          LogHandle = EAPLogGetLogHandle();
          v15 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(LogHandle, v15))
            goto LABEL_9;
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v98 = Length;
          *(_WORD *)&v98[4] = 2048;
          *(_QWORD *)&v98[6] = 10;
          v16 = "packet too short %d < %ld";
LABEL_7:
          v17 = LogHandle;
          v18 = v15;
          v19 = 18;
LABEL_8:
          _os_log_impl(&dword_206440000, v17, v18, v16, buf, v19);
          goto LABEL_9;
        }
        MessageLength = EAPTLSLengthIncludedPacketGetMessageLength((uint64_t)a2);
        v38 = MessageLength;
        if (MessageLength > 0x20000)
        {
          v80 = EAPLogGetLogHandle();
          v81 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v80, v81))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v98 = v38;
            *(_WORD *)&v98[4] = 1024;
            *(_DWORD *)&v98[6] = 0x20000;
            _os_log_impl(&dword_206440000, v80, v81, "received message too large, %d > %d", buf, 0xEu);
          }
          v20 = 0;
          goto LABEL_111;
        }
        v37 = a2 + 10;
        v54 = Length - 10;
        if (MessageLength)
        {
          v41 = "Start";
          v40 = 1;
        }
        else
        {
          v40 = 0;
          v41 = "Ack";
        }
        v36 = v12 + 5;
        goto LABEL_62;
      }
      v41 = "Start";
      v40 = 1;
    }
    v54 = v38;
LABEL_62:
    if ((state - 1) < 2)
    {
      if (*v36)
      {
        LODWORD(v55) = a2[1];
        if (*((_DWORD *)v12 + 19) == (_DWORD)v55)
        {
LABEL_67:
          v57 = *((_DWORD *)v12 + 30);
          v58 = v12 + 9;
LABEL_88:
          v20 = EAPTLSPacketCreate(2, 13, (char)v55, v57, v36, v58);
          goto LABEL_89;
        }
        v56 = v12[7] + *((int *)v12 + 18);
        if (v56 < v12[6])
        {
          v12[7] = v56;
          goto LABEL_67;
        }
        v94 = v37;
        v92 = v54;
        v91 = v41;
        memoryBufferClear((uint64_t)v36);
        v41 = v91;
        v54 = v92;
        v37 = v94;
        *((_DWORD *)v12 + 18) = 0;
      }
      if ((v40 & 1) == 0)
      {
        v82 = v41;
        v83 = EAPLogGetLogHandle();
        v84 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v83, v84))
          goto LABEL_9;
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v98 = v82;
        v16 = "unexpected %s frame";
        v17 = v83;
        v18 = v84;
        v19 = 12;
        goto LABEL_8;
      }
      v55 = (const char *)a2[1];
      if (*((_DWORD *)v12 + 19) == (_DWORD)v55)
      {
        if ((a2[5] & 0x40) != 0)
          goto LABEL_128;
LABEL_117:
        v20 = eaptls_handshake((uint64_t *)a1, v55, a4);
        goto LABEL_89;
      }
      if (!v12[1])
      {
        v85 = v37;
        v86 = v38;
        v87 = v54;
        memoryBufferAllocate((uint64_t)(v12 + 1), v86);
        v54 = v87;
        v37 = v85;
      }
      v88 = v54;
      if (!memoryBufferAddData((uint64_t)(v12 + 1), v37, v54))
      {
        v89 = EAPLogGetLogHandle();
        v90 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v89, v90))
          goto LABEL_9;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v98 = v88;
        v16 = "fragment too large %d";
        v17 = v89;
        v18 = v90;
        v19 = 8;
        goto LABEL_8;
      }
      if (memoryBufferIsComplete((uint64_t)(v12 + 1)))
      {
        v55 = (const char *)a2[1];
        goto LABEL_117;
      }
      if ((a2[5] & 0x40) != 0)
      {
        LOBYTE(v55) = a2[1];
LABEL_128:
        v57 = 0;
        v36 = 0;
        v58 = 0;
        goto LABEL_88;
      }
      v59 = EAPLogGetLogHandle();
      v60 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v59, v60))
        goto LABEL_9;
      *(_WORD *)buf = 0;
      v16 = "expecting more data but more fragments bit is not set, ignoring";
LABEL_72:
      v17 = v59;
      v18 = v60;
      v19 = 2;
      goto LABEL_8;
    }
    if (state)
    {
      v20 = 0;
LABEL_89:
      *((_DWORD *)v12 + 19) = a2[1];
      goto LABEL_22;
    }
    if ((v39 & 0x20) == 0)
    {
      v59 = EAPLogGetLogHandle();
      v60 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v59, v60))
        goto LABEL_9;
      *(_WORD *)buf = 0;
      v16 = "ignoring non EAP-TLS start frame";
      goto LABEL_72;
    }
    goto LABEL_47;
  }
  if (*((_BYTE *)v7 + 141))
    goto LABEL_27;
  *(_DWORD *)buf = 0;
  v22 = EAPTLSSessionGetState(*v7, (SSLSessionState *)buf);
  v23 = *(_DWORD *)buf;
  v24 = EAPLogGetLogHandle();
  v25 = _SC_syslog_os_log_mapping();
  v26 = os_log_type_enabled(v24, v25);
  if (!v22 && v23 == 2)
  {
    if (v26)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206440000, v24, v25, "TLS handshake is complete", buf, 2u);
    }
    eaptls_update_tls_session_data((void **)v7);
  }
  else if (v26)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_206440000, v24, v25, "TLS handshake is not complete yet", buf, 2u);
  }
  if (*((_BYTE *)v7 + 141))
  {
LABEL_27:
    v21 = 1;
    goto LABEL_28;
  }
  v42 = EAPLogGetLogHandle();
  v43 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v42, v43))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_206440000, v42, v43, "TLS handshake is not complete, discarding EAP-Success packet", buf, 2u);
  }
LABEL_29:
  if (*((_DWORD *)v7 + 26) == 2)
  {
    v33 = *((_DWORD *)v7 + 31);
    if (v33)
    {
      *a5 = v33;
      v34 = 1001;
    }
    else if (v7[34])
    {
      v34 = 1;
    }
    else
    {
      v34 = 17;
    }
    *a4 = v34;
  }
  return *((unsigned int *)v7 + 26);
}

uint64_t EAPSSLMemoryIOWrite(uint64_t a1, const void *a2, size_t *a3)
{
  uint64_t v5;
  size_t v7;
  char *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  __CFString *Mutable;
  NSObject *LogHandle;
  os_log_type_t v15;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 16);
  if (v5)
  {
    v7 = *a3;
    if (*(_QWORD *)v5)
    {
      v8 = (char *)malloc_type_realloc(*(void **)v5, *(_QWORD *)(v5 + 8) + v7, 0x821FDE15uLL);
      *(_QWORD *)v5 = v8;
      memmove(&v8[*(_QWORD *)(v5 + 8)], a2, v7);
      *(_QWORD *)(v5 + 8) += v7;
      v9 = "additional ";
    }
    else
    {
      v12 = malloc_type_malloc(v7, 0x89CFA66BuLL);
      *(_QWORD *)(v5 + 8) = v7;
      *(_QWORD *)(v5 + 16) = 0;
      *(_QWORD *)v5 = v12;
      memmove(v12, a2, v7);
      v9 = (const char *)&unk_206473DB9;
    }
    if (*(_BYTE *)a1)
    {
      Mutable = CFStringCreateMutable(0, 0);
      print_data_cfstr(Mutable, (uint64_t)a2, v7);
      LogHandle = EAPLogGetLogHandle();
      v15 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v15))
      {
        v17 = 136315650;
        v18 = v9;
        v19 = 1024;
        v20 = v7;
        v21 = 2112;
        v22 = Mutable;
        _os_log_impl(&dword_206440000, LogHandle, v15, "Wrote %s%d bytes:\n%@", (uint8_t *)&v17, 0x1Cu);
      }
      CFRelease(Mutable);
    }
  }
  else
  {
    if (*(_BYTE *)a1)
    {
      v10 = EAPLogGetLogHandle();
      v11 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v10, v11))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_206440000, v10, v11, "Write not initialized", (uint8_t *)&v17, 2u);
      }
    }
    *a3 = 0;
  }
  return 0;
}

uint64_t EAPSSLMemoryIORead(uint64_t a1, void *__dst, size_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  NSObject *LogHandle;
  os_log_type_t v11;
  uint64_t result;
  NSObject *v13;
  os_log_type_t v14;
  size_t v16;
  size_t v17;
  uint64_t v18;
  size_t v19;
  __CFString *Mutable;
  NSObject *v21;
  os_log_type_t v22;
  _DWORD v23[2];
  __int16 v24;
  __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 8);
  if (v5)
  {
    v7 = *(_QWORD *)(v5 + 8);
    v6 = *(_QWORD *)(v5 + 16);
    if (*(_QWORD *)v5)
      v8 = v7 == 0;
    else
      v8 = 1;
    if (v8 || v7 == v6)
    {
      *a3 = 0;
      if (*(_BYTE *)a1)
      {
        LogHandle = EAPLogGetLogHandle();
        v11 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(LogHandle, v11))
        {
          LOWORD(v23[0]) = 0;
          _os_log_impl(&dword_206440000, LogHandle, v11, "Read would block", (uint8_t *)v23, 2u);
        }
      }
      return 4294957493;
    }
    else
    {
      v16 = v7 - v6;
      if (*a3 >= v16)
        v17 = v16;
      else
        v17 = *a3;
      memmove(__dst, (const void *)(*(_QWORD *)v5 + v6), v17);
      v18 = *(_QWORD *)(v5 + 8);
      v19 = *(_QWORD *)(v5 + 16) + v17;
      *(_QWORD *)(v5 + 16) = v19;
      if (v19 == v18)
      {
        free(*(void **)v5);
        *(_OWORD *)v5 = 0u;
        *(_OWORD *)(v5 + 16) = 0u;
      }
      *a3 = v17;
      if (*(_BYTE *)a1)
      {
        Mutable = CFStringCreateMutable(0, 0);
        print_data_cfstr(Mutable, (uint64_t)__dst, v17);
        v21 = EAPLogGetLogHandle();
        v22 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v21, v22))
        {
          v23[0] = 67109378;
          v23[1] = v17;
          v24 = 2112;
          v25 = Mutable;
          _os_log_impl(&dword_206440000, v21, v22, "Read %d bytes:\n%@", (uint8_t *)v23, 0x12u);
        }
        CFRelease(Mutable);
      }
      return 0;
    }
  }
  else
  {
    if (*(_BYTE *)a1)
    {
      v13 = EAPLogGetLogHandle();
      v14 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v13, v14))
      {
        LOWORD(v23[0]) = 0;
        _os_log_impl(&dword_206440000, v13, v14, "Read not initialized", (uint8_t *)v23, 2u);
      }
    }
    result = 0;
    *a3 = 0;
  }
  return result;
}

_BYTE *EAPTLSPacketCreate(char a1, char a2, char a3, int a4, _QWORD *a5, _DWORD *a6)
{
  return EAPTLSPacketCreate2(a1, a2, a3, a4, a5, a6, 1);
}

_BYTE *EAPTLSPacketCreate2(char a1, char a2, char a3, int a4, _QWORD *a5, _DWORD *a6, int a7)
{
  unint64_t v11;
  unint64_t v12;
  int v13;
  size_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  unsigned __int16 v20;
  _BYTE *v21;
  _BYTE *v22;
  void *v23;
  char v24;

  if (!a5 || !*a5)
  {
    v16 = 0;
    v19 = 0;
    v14 = 0;
    v13 = 6;
    if (!a6)
      goto LABEL_22;
    goto LABEL_21;
  }
  v12 = a5[1];
  v11 = a5[2];
  v13 = 6;
  v14 = v12 - v11;
  if (v12 <= v11)
  {
    v16 = 0;
    v19 = 0;
    v14 = 0;
    if (!a6)
      goto LABEL_22;
    goto LABEL_21;
  }
  v15 = a7 ^ 1;
  if (v11)
    v15 = 1;
  v16 = v15 ^ 1;
  if (v15)
    v13 = 6;
  else
    v13 = 10;
  if (v14 <= a4 - v13)
  {
    v19 = 0;
    if (!a6)
      goto LABEL_22;
    goto LABEL_21;
  }
  if (v11)
    v17 = 1;
  else
    v17 = a7;
  if (v17)
  {
    v18 = a4 - v13;
  }
  else
  {
    v13 = 10;
    v18 = a4 - 10;
  }
  v14 = v18;
  v16 |= v17 ^ 1;
  v19 = 1;
  if (a6)
LABEL_21:
    *a6 = v14;
LABEL_22:
  v20 = v13 + v14;
  v21 = malloc_type_malloc(v13 + (int)v14, 0x85ADD5D4uLL);
  v22 = v21;
  if (v21)
  {
    *v21 = a1;
    v21[1] = a3;
    EAPPacketSetLength((uint64_t)v21, v20);
    v22[4] = a2;
    v22[5] = 0;
    if (v14)
    {
      v23 = v22 + 6;
      if (v19)
      {
        v22[5] = 64;
        v24 = -64;
        if (!v16)
          goto LABEL_29;
      }
      else
      {
        v24 = 0x80;
        if (!v16)
        {
LABEL_29:
          memmove(v23, (const void *)(*a5 + a5[2]), v14);
          return v22;
        }
      }
      v22[5] = v24;
      *(_DWORD *)(v22 + 6) = bswap32(*((_DWORD *)a5 + 2));
      v23 = v22 + 10;
      goto LABEL_29;
    }
  }
  return v22;
}

uint64_t EAPClientModulePluginFreePacket(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t, uint64_t);

  v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(result + 24) + 56);
  if (v3)
    return v3(a2, a3);
  return result;
}

void eaptls_free_packet(int a1, void *a2)
{
  if (a2)
    free(a2);
}

uint64_t EAPClientModulePluginPublishProperties(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);

  v2 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 104);
  if (v2)
    return v2(a2);
  else
    return 0;
}

__CFDictionary *eaptls_publish_props(uint64_t *a1)
{
  uint64_t v1;
  const __CFArray *v2;
  __CFArray *CFDataArray;
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  const void **v6;
  CFNumberRef v7;
  const void *v8;
  CFNumberRef v9;
  int v11;
  SSLCipherSuite v12;
  __CFArray *v13;

  v13 = 0;
  v12 = 0;
  v1 = *a1;
  v2 = *(const __CFArray **)(*a1 + 272);
  if (v2)
  {
    CFDataArray = EAPSecCertificateArrayCreateCFDataArray(v2);
    v13 = CFDataArray;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v5 = Mutable;
    if (CFDataArray)
    {
      CFDictionarySetValue(Mutable, CFSTR("TLSServerCertificateChain"), CFDataArray);
      my_CFRelease((const void **)&v13);
    }
  }
  else
  {
    v5 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  }
  v6 = (const void **)MEMORY[0x24BDBD270];
  if (!*(_BYTE *)(v1 + 280))
    v6 = (const void **)MEMORY[0x24BDBD268];
  CFDictionarySetValue(v5, CFSTR("TLSSessionWasResumed"), *v6);
  EAPTLSSessionGetNegotiatedCipher(*(SSLContext **)v1, &v12);
  if (v12)
  {
    v11 = v12;
    v7 = CFNumberCreate(0, kCFNumberIntType, &v11);
    CFDictionarySetValue(v5, CFSTR("TLSNegotiatedCipher"), v7);
    CFRelease(v7);
  }
  v8 = *(const void **)(v1 + 288);
  if (v8)
    CFDictionarySetValue(v5, CFSTR("TLSNegotiatedProtocolVersion"), v8);
  if (*(_DWORD *)(v1 + 128) == 3 && !*(_BYTE *)(v1 + 140))
  {
    v9 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(v1 + 136));
    CFDictionarySetValue(v5, CFSTR("TLSTrustClientStatus"), v9);
    CFRelease(v9);
  }
  return v5;
}

uint64_t EAPClientModulePluginSessionKey(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t, uint64_t);

  v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 24) + 72);
  if (v3)
    return v3(a2, a3);
  else
    return 0;
}

uint64_t eaptls_session_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = 0;
  if (!*(_BYTE *)(v2 + 141))
    return 0;
  *a2 = 32;
  return v2 + 142;
}

uint64_t EAPClientModulePluginEAPType(uint64_t a1)
{
  return **(unsigned int **)(a1 + 24);
}

uint64_t EAPSSLCopyPeerCertificates(SSLContext *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *LogHandle;
  os_log_type_t v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  NSObject *v10;
  os_log_type_t v11;
  const char *v12;
  SecTrustRef trust;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  trust = 0;
  *a2 = 0;
  v2 = SSLCopyPeerTrust(a1, &trust);
  if ((_DWORD)v2)
  {
    v3 = v2;
    LogHandle = EAPLogGetLogHandle();
    v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v5))
    {
      *(_WORD *)buf = 0;
      v6 = "SSLCopyPeerTrust returned NULL";
      v7 = LogHandle;
      v8 = v5;
      v9 = 2;
LABEL_7:
      _os_log_impl(&dword_206440000, v7, v8, v6, buf, v9);
    }
  }
  else
  {
    v3 = SecTrustCopyInputCertificates();
    if ((_DWORD)v3)
    {
      v10 = EAPLogGetLogHandle();
      v11 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v10, v11))
      {
        v12 = EAPSecurityErrorString(v3);
        *(_DWORD *)buf = 136315394;
        v16 = v12;
        v17 = 1024;
        v18 = v3;
        v6 = "SecTrustCopyInputCertificates failed, %s (%d)";
        v7 = v10;
        v8 = v11;
        v9 = 18;
        goto LABEL_7;
      }
    }
  }
  my_CFRelease((const void **)&trust);
  return v3;
}

_BYTE *eaptls_verify_server(uint64_t *a1, const char *a2, int a3, _DWORD *a4)
{
  char v6;
  uint64_t v8;
  __SecTrust *SecTrust;
  int v10;
  NSObject *LogHandle;
  os_log_type_t v12;
  const char *v13;
  int v14;
  int v15;
  int v16;
  _BYTE *result;
  _DWORD v18[2];
  __int16 v19;
  int v20;
  uint64_t v21;

  v6 = (char)a2;
  v21 = *MEMORY[0x24BDAC8D0];
  v8 = *a1;
  if (a3)
    SecTrust = (__SecTrust *)EAPTLSSessionGetSecTrust(*(_QWORD *)v8, a2);
  else
    SecTrust = 0;
  v10 = EAPTLSVerifyServerCertificateChain((const __CFDictionary *)a1[10], *(CFArrayRef *)(v8 + 272), a3, SecTrust, (_DWORD *)(v8 + 132));
  *(_DWORD *)(v8 + 136) = v10;
  if (!v10)
    goto LABEL_9;
  LogHandle = EAPLogGetLogHandle();
  v12 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v12))
  {
    v15 = *(_DWORD *)(v8 + 132);
    v14 = *(_DWORD *)(v8 + 136);
    v18[0] = 67109376;
    v18[1] = v14;
    v19 = 1024;
    v20 = v15;
    _os_log_impl(&dword_206440000, LogHandle, v12, "server certificate not trusted status %d %d", (uint8_t *)v18, 0xEu);
  }
  v16 = *(_DWORD *)(v8 + 136);
  if (v16 == 3)
  {
    result = 0;
    *(_DWORD *)(v8 + 128) = 3;
    *a4 = 3;
  }
  else
  {
    if (!v16)
    {
LABEL_9:
      result = 0;
      *(_BYTE *)(v8 + 140) = 1;
      return result;
    }
    *a4 = v16;
    *(_DWORD *)(v8 + 124) = *(_DWORD *)(v8 + 132);
    *(_DWORD *)(v8 + 104) = 2;
    EAPTLSSessionClose(*(_QWORD *)v8, v13);
    return EAPTLSPacketCreate(2, 13, v6, *(_DWORD *)(v8 + 120), (_QWORD *)(v8 + 40), (_DWORD *)(v8 + 72));
  }
  return result;
}

uint64_t EAPTLSVerifyServerCertificateChain(const __CFDictionary *a1, CFArrayRef theArray, int a3, __SecTrust *a4, _DWORD *a5)
{
  const __CFArray *v10;
  CFTypeID TypeID;
  CFIndex Count;
  CFIndex v13;
  CFIndex v14;
  const void *ValueAtIndex;
  CFTypeID v16;
  const __CFDictionary *EAP;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  const char *v21;
  NSObject *LogHandle;
  os_log_type_t v23;
  CFMutableArrayRef Mutable;
  SecPolicyRef Revocation;
  SecPolicyRef v26;
  OSStatus v27;
  NSObject *v28;
  os_log_type_t v29;
  const char *v30;
  const char *v31;
  OSStatus v32;
  const char *v33;
  int v34;
  int v35;
  __SecTrust *v36;
  NSObject *v37;
  os_log_type_t v38;
  const char *v39;
  NSObject *v40;
  os_log_type_t v41;
  const char *v42;
  int v43;
  CFDictionaryRef v44;
  const __CFDictionary *v45;
  NSObject *v46;
  os_log_type_t v47;
  int v48;
  NSObject *v49;
  os_log_type_t v50;
  const __CFArray *v52;
  CFMutableArrayRef v53;
  __CFString *v54;
  const __CFString *v55;
  const void *v56;
  NSObject *v57;
  os_log_type_t v58;
  NSObject *v59;
  os_log_type_t v60;
  const __CFArray *v61;
  CFTypeID v62;
  CFMutableArrayRef SecCertificateArray;
  OSStatus v64;
  const char *v65;
  const __CFString *v66;
  const void *v67;
  CFTypeID v68;
  CFTypeID v69;
  CFTypeID v70;
  CFTypeID v71;
  BOOL v72;
  char v73;
  __CFString *v74;
  int v75;
  SecTrustRef v76;
  __CFString *v77;
  SecPolicyRef v78;
  CFMutableArrayRef v79;
  SecTrustRef trust;
  void *value;
  CFDictionaryRef v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  const char *v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v76 = 0;
  v77 = 0;
  v75 = 0;
  value = 0;
  v82 = 0;
  v79 = 0;
  trust = 0;
  v78 = 0;
  if (!theArray || !CFArrayGetCount(theArray))
  {
    LODWORD(EAP) = 0;
    v18 = 8;
LABEL_36:
    my_CFRelease((const void **)&trust);
    v34 = 0;
    v35 = 0;
    goto LABEL_37;
  }
  CFArrayGetValueAtIndex(theArray, 0);
  v10 = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("TLSTrustedServerNames"));
  if (v10 || (v10 = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("TLSTrustedServerCommonNames"))) != 0)
  {
    TypeID = CFArrayGetTypeID();
    if (CFGetTypeID(v10) == TypeID)
    {
      Count = CFArrayGetCount(v10);
      if (Count)
      {
        v13 = Count;
        if (Count >= 1)
        {
          v14 = 0;
          while (1)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v10, v14);
            v16 = CFStringGetTypeID();
            if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != v16)
              break;
            if (v13 == ++v14)
              goto LABEL_23;
          }
          LogHandle = EAPLogGetLogHandle();
          v23 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v23))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_206440000, LogHandle, v23, "TLSTrustedServerNames contains a non-string value", buf, 2u);
          }
          v10 = 0;
        }
        goto LABEL_23;
      }
      v19 = EAPLogGetLogHandle();
      v20 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v19, v20))
      {
        *(_WORD *)buf = 0;
        v21 = "TLSTrustedServerNames is empty";
        goto LABEL_18;
      }
    }
    else
    {
      v19 = EAPLogGetLogHandle();
      v20 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v19, v20))
      {
        *(_WORD *)buf = 0;
        v21 = "TLSTrustedServerNames is not an array";
LABEL_18:
        _os_log_impl(&dword_206440000, v19, v20, v21, buf, 2u);
      }
    }
    v10 = 0;
  }
LABEL_23:
  EAP = (const __CFDictionary *)SecPolicyCreateEAP();
  v82 = EAP;
  if (!EAP)
    goto LABEL_35;
  if (a3 && a4)
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 2, MEMORY[0x24BDBD690]);
    v79 = Mutable;
    Revocation = SecPolicyCreateRevocation(0x18uLL);
    v78 = Revocation;
    if (!Revocation)
    {
      LODWORD(EAP) = 0;
      goto LABEL_35;
    }
    v26 = Revocation;
    CFArrayAppendValue(Mutable, EAP);
    CFArrayAppendValue(Mutable, v26);
    v27 = SecTrustSetPolicies(a4, Mutable);
    if (v27)
    {
      LODWORD(EAP) = v27;
      v28 = EAPLogGetLogHandle();
      v29 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = EAPSecurityErrorString((int)EAP);
        *(_DWORD *)buf = 136315394;
        v84 = (void *)v30;
        v85 = 1024;
        LODWORD(v86) = (_DWORD)EAP;
        v31 = "SecTrustSetPolicies failed, %s (%d)";
LABEL_33:
        _os_log_impl(&dword_206440000, v28, v29, v31, buf, 0x12u);
        goto LABEL_35;
      }
      goto LABEL_35;
    }
    trust = (SecTrustRef)CFRetain(a4);
    v59 = EAPLogGetLogHandle();
    v60 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v59, v60))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206440000, v59, v60, "TLS 1.3 SecTrust object is created sucessfully", buf, 2u);
    }
  }
  else
  {
    v32 = SecTrustCreateWithCertificates(theArray, EAP, &trust);
    if (v32)
    {
      LODWORD(EAP) = v32;
      v28 = EAPLogGetLogHandle();
      v29 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v28, v29))
      {
        v33 = EAPSecurityErrorString((int)EAP);
        *(_DWORD *)buf = 136315394;
        v84 = (void *)v33;
        v85 = 1024;
        LODWORD(v86) = (_DWORD)EAP;
        v31 = "SecTrustCreateWithCertificates failed, %s (%d)";
        goto LABEL_33;
      }
LABEL_35:
      v18 = 1001;
      goto LABEL_36;
    }
  }
  if (a1
    && (v61 = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("TLSTrustedCertificates")), v62 = CFArrayGetTypeID(),
                                                                                            v61)
    && CFGetTypeID(v61) == v62)
  {
    SecCertificateArray = EAPCFDataArrayCreateSecCertificateArray(v61);
    value = SecCertificateArray;
    if (SecCertificateArray)
    {
      v64 = SecTrustSetAnchorCertificates(trust, SecCertificateArray);
      if (v64)
      {
        LODWORD(EAP) = v64;
        v28 = EAPLogGetLogHandle();
        v29 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v28, v29))
          goto LABEL_35;
        v65 = EAPSecurityErrorString((int)EAP);
        *(_DWORD *)buf = 136315394;
        v84 = (void *)v65;
        v85 = 1024;
        LODWORD(v86) = (_DWORD)EAP;
        v31 = " SecTrustSetAnchorCertificates failed, %s (%d)";
        goto LABEL_33;
      }
      v35 = 1;
    }
    else
    {
      v35 = 0;
    }
  }
  else
  {
    v35 = 0;
    value = 0;
  }
  v66 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("TLSTrustExceptionsDomain"));
  v67 = CFDictionaryGetValue(a1, CFSTR("TLSTrustExceptionsID"));
  v68 = CFStringGetTypeID();
  if (v66
    && CFGetTypeID(v66) == v68
    && (v69 = CFStringGetTypeID(), v67)
    && ((v70 = v69, v71 = CFGetTypeID(v67), !v10) ? (v72 = v71 == v70) : (v72 = 0),
        !v72 ? (v73 = 1) : (v73 = v35),
        (v73 & 1) == 0))
  {
    v34 = 1;
    if (CFStringCompare(v66, CFSTR("WirelessSSID"), 1uLL))
    {
      v74 = 0;
    }
    else
    {
      v74 = EAPSecCertificateCopySHA1DigestString();
      v34 = EAPTLSSecTrustApplyExceptionsBinding(trust, v66, v67, v74);
    }
  }
  else
  {
    v74 = 0;
    v34 = 0;
  }
  v18 = 0;
  LODWORD(EAP) = 0;
  if (v10)
    v35 = 1;
  v77 = v74;
LABEL_37:
  my_CFRelease((const void **)&v82);
  my_CFRelease((const void **)&v78);
  my_CFRelease((const void **)&v79);
  my_CFRelease((const void **)&value);
  v36 = trust;
  v76 = trust;
  if (!trust)
    goto LABEL_64;
  v37 = EAPLogGetLogHandle();
  v38 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = "not applied";
    if (v34)
      v39 = "applied";
    *(_DWORD *)buf = 136315394;
    v84 = (void *)v39;
    v85 = 2080;
    v86 = "applied";
    _os_log_impl(&dword_206440000, v37, v38, "trust exception %s, trust settings %s", buf, 0x16u);
  }
  LODWORD(EAP) = EAPTLSSecTrustEvaluate(v36, (SecTrustResultType *)&v75);
  v40 = EAPLogGetLogHandle();
  if ((_DWORD)EAP)
  {
    v41 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = EAPSecurityErrorString((int)EAP);
      *(_DWORD *)buf = 136315394;
      v84 = (void *)v42;
      v85 = 1024;
      LODWORD(v86) = (_DWORD)EAP;
      _os_log_impl(&dword_206440000, v40, v41, "SecTrustEvaluate failed, %s (%d)", buf, 0x12u);
    }
    goto LABEL_63;
  }
  v43 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v40, (os_log_type_t)v43))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v84) = v75;
    _os_log_impl(&dword_206440000, v40, (os_log_type_t)v43, "trust evaluation result: %d", buf, 8u);
  }
  if (a3)
  {
    value = 0;
    v44 = SecTrustCopyResult(v36);
    v82 = v44;
    if (!v44)
      goto LABEL_58;
    v45 = v44;
    v46 = EAPLogGetLogHandle();
    v47 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v46, v47))
    {
      *(_DWORD *)buf = 138412290;
      v84 = v45;
      _os_log_impl(&dword_206440000, v46, v47, "trust result: %@", buf, 0xCu);
    }
    if (CFDictionaryGetValueIfPresent(v45, (const void *)*MEMORY[0x24BDE94F8], (const void **)&value))
    {
      v48 = CFBooleanGetValue((CFBooleanRef)value);
      my_CFRelease((const void **)&v82);
      if (v48)
        goto LABEL_53;
    }
    else
    {
LABEL_58:
      my_CFRelease((const void **)&v82);
    }
    v49 = EAPLogGetLogHandle();
    v50 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v49, v50))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206440000, v49, v50, "revocation status check is incomplete", buf, 2u);
    }
    v75 = 7;
    goto LABEL_62;
  }
LABEL_53:
  switch(v75)
  {
    case 5:
      if (!v35)
      {
LABEL_71:
        v52 = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("TLSUserTrustProceedCertificateChain"));
        if (v52)
        {
          v53 = EAPCFDataArrayCreateSecCertificateArray(v52);
          v82 = v53;
          if (v53 && CFEqual(v53, theArray))
          {
            if (my_CFDictionaryGetBooleanValue(a1, CFSTR("TLSSaveTrustExceptions"), 0))
            {
              v54 = v77;
              if (v77)
              {
                v55 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("TLSTrustExceptionsDomain"));
                v56 = CFDictionaryGetValue(a1, CFSTR("TLSTrustExceptionsID"));
                EAPTLSSecTrustSaveExceptionsBinding(v36, v55, v56, v54);
                v57 = EAPLogGetLogHandle();
                v58 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v57, v58))
                {
                  *(_DWORD *)buf = 138412546;
                  v84 = (void *)v55;
                  v85 = 2112;
                  v86 = (const char *)v56;
                  _os_log_impl(&dword_206440000, v57, v58, "saved trust exception for domain: %@, identifier: %@", buf, 0x16u);
                }
              }
            }
            goto LABEL_104;
          }
        }
        else
        {
          v82 = 0;
        }
        if (!v34)
        {
          v18 = 3;
          goto LABEL_106;
        }
LABEL_104:
        v18 = 0;
LABEL_106:
        my_CFRelease((const void **)&v82);
LABEL_107:
        LODWORD(EAP) = 0;
        if (!a5)
          goto LABEL_66;
        goto LABEL_65;
      }
      break;
    case 4:
      if (!v35)
        goto LABEL_71;
      goto LABEL_70;
    case 1:
      if (!(v35 | v34))
        goto LABEL_71;
LABEL_70:
      v18 = 0;
      goto LABEL_107;
  }
LABEL_62:
  LODWORD(EAP) = -9807;
LABEL_63:
  v18 = 1001;
LABEL_64:
  if (a5)
LABEL_65:
    *a5 = (_DWORD)EAP;
LABEL_66:
  my_CFRelease((const void **)&v76);
  my_CFRelease((const void **)&v77);
  return v18;
}

CFMutableArrayRef EAPCFDataArrayCreateSecCertificateArray(const __CFArray *a1)
{
  uint64_t Count;
  CFMutableArrayRef Mutable;
  CFIndex v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *ValueAtIndex;
  CFTypeID TypeID;
  const void *v10;
  CFMutableDictionaryRef v11;
  OSStatus v12;
  int v13;
  NSObject *LogHandle;
  os_log_type_t v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  const void *v20;
  const void *v21;
  CFTypeRef v22;
  CFMutableArrayRef v23;
  CFTypeRef result;
  CFMutableDictionaryRef v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  Count = CFArrayGetCount(a1);
  Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x24BDBD690]);
  v23 = Mutable;
  if (Count >= 1)
  {
    v4 = 0;
    v20 = (const void *)*MEMORY[0x24BDE9228];
    v21 = (const void *)*MEMORY[0x24BDE9220];
    v5 = (const void *)*MEMORY[0x24BDE94D8];
    v6 = (const void *)*MEMORY[0x24BDBD270];
    v7 = (const void *)*MEMORY[0x24BDE9558];
    while (1)
    {
      v22 = 0;
      ValueAtIndex = CFArrayGetValueAtIndex(a1, v4);
      TypeID = CFDataGetTypeID();
      if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != TypeID)
        break;
      v10 = SecCertificateCreateWithData(0, (CFDataRef)ValueAtIndex);
      v22 = v10;
      if (!v10)
      {
        result = 0;
        v11 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        v25 = v11;
        CFDictionaryAddValue(v11, v21, v20);
        CFDictionaryAddValue(v11, v5, v6);
        CFDictionaryAddValue(v11, v7, ValueAtIndex);
        if (!v11)
          break;
        v12 = SecItemCopyMatching(v11, &result);
        if (v12)
        {
          v13 = v12;
          LogHandle = EAPLogGetLogHandle();
          v15 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v15))
          {
            v16 = EAPSecurityErrorString(v13);
            *(_DWORD *)buf = 136315394;
            v27 = v16;
            v28 = 1024;
            v29 = v13;
            _os_log_impl(&dword_206440000, LogHandle, v15, "SecItemCopyMatching failed, %s (%d)", buf, 0x12u);
          }
        }
        else if (!isA_SecCertificate(result))
        {
          v17 = EAPLogGetLogHandle();
          v18 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v17, v18))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_206440000, v17, v18, "Certificate data with incorrect data type", buf, 2u);
          }
          my_CFRelease(&result);
        }
        my_CFRelease((const void **)&v25);
        v10 = result;
        v22 = result;
        if (!result)
          break;
      }
      CFArrayAppendValue(Mutable, v10);
      my_CFRelease(&v22);
      if (Count == ++v4)
        return Mutable;
    }
    my_CFRelease((const void **)&v23);
    return 0;
  }
  return Mutable;
}

uint64_t EAPTLSComputeKeyData()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *LogHandle;
  os_log_type_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = SSLInternalClientRandom();
  if ((_DWORD)v0)
  {
    v1 = v0;
    LogHandle = EAPLogGetLogHandle();
    v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v3))
    {
      *(_DWORD *)buf = 136315138;
      v8 = (uint64_t)EAPSecurityErrorString(v1);
      _os_log_impl(&dword_206440000, LogHandle, v3, "SSLInternalClientRandom failed, %s", buf, 0xCu);
    }
  }
  else
  {
    v4 = EAPLogGetLogHandle();
    v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v4, v5))
    {
      *(_DWORD *)buf = 134218240;
      v8 = 96;
      v9 = 2048;
      v10 = 64;
      _os_log_impl(&dword_206440000, v4, v5, "buffer overflow %ld >= %ld", buf, 0x16u);
    }
    return 4294957479;
  }
  return v1;
}

__CFArray *EAPSecCertificateArrayCreateCFDataArray(const __CFArray *a1)
{
  uint64_t Count;
  __CFArray *Mutable;
  CFIndex i;
  const void *ValueAtIndex;
  __SecCertificate *v6;
  CFDataRef v7;
  CFDataRef v9;

  Count = CFArrayGetCount(a1);
  Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x24BDBD690]);
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      v9 = 0;
      ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
      v6 = (__SecCertificate *)isA_SecCertificate(ValueAtIndex);
      if (v6)
      {
        v7 = SecCertificateCopyData(v6);
        v9 = v7;
        if (v7)
        {
          CFArrayAppendValue(Mutable, v7);
          my_CFRelease((const void **)&v9);
        }
      }
    }
  }
  return Mutable;
}

const void *isA_SecCertificate(const void *a1)
{
  CFTypeID TypeID;

  TypeID = SecCertificateGetTypeID();
  if (!a1)
    return 0;
  if (CFGetTypeID(a1) == TypeID)
    return a1;
  return 0;
}

uint64_t EAPOLClientForceRenew(uint64_t a1)
{
  mach_error_t v1;
  unsigned int v3;

  v3 = 0;
  v1 = eapolcontroller_client_force_renew(*(_DWORD *)(a1 + 16), &v3);
  if (!v1)
    return v3;
  mach_error("eapolcontroller_client_force_renew failed", v1);
  return 6;
}

uint64_t eapolcontroller_client_force_renew(int a1, _DWORD *a2)
{
  mach_port_name_t reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  reply_port = mig_get_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x560000000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3, 0x18u, 0x30u, reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_reply_port(rcv_name_8);
      return v6;
    }
    if (*(_DWORD *)&rcv_name_12[4] == 71)
    {
      v6 = 4294966988;
    }
    else if (*(_DWORD *)&rcv_name_12[4] == 22116)
    {
      if ((v9 & 0x80000000) == 0)
      {
        if (rcv_name == 40)
        {
          if (!rcv_name_4)
          {
            v6 = *(unsigned int *)&rcv_name_12[16];
            if (!*(_DWORD *)&rcv_name_12[16])
            {
              *a2 = *(_DWORD *)&rcv_name_12[20];
              return v6;
            }
            goto LABEL_23;
          }
        }
        else if (rcv_name == 36)
        {
          if (rcv_name_4)
            v7 = 1;
          else
            v7 = *(_DWORD *)&rcv_name_12[16] == 0;
          if (v7)
            v6 = 4294966996;
          else
            v6 = *(unsigned int *)&rcv_name_12[16];
          goto LABEL_23;
        }
      }
      v6 = 4294966996;
    }
    else
    {
      v6 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)&v9);
    return v6;
  }
  mig_put_reply_port(rcv_name_8);
  return v6;
}

uint64_t EAPOLClientHandleMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *LogHandle;
  os_log_type_t v6;
  uint64_t v7;
  uint8_t v9[16];

  if (*(_DWORD *)(a2 + 20) == 70)
  {
    LogHandle = EAPLogGetLogHandle();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v6))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_206440000, LogHandle, v6, "EAPOLController server died", v9, 2u);
    }
    EAPOLClientInvalidate(a4, 0);
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a4 + 24))(a4, v7, *(_QWORD *)(a4 + 32));
}

uint64_t EAPOLClientGetConfig(uint64_t a1, const void **a2)
{
  mach_error_t v4;
  mach_error_t v5;
  NSObject *LogHandle;
  os_log_type_t v7;
  char *v8;
  int v9;
  uint64_t v11;
  UInt8 *bytes;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  bytes = 0;
  *a2 = 0;
  v4 = eapolcontroller_client_getconfig(*(_DWORD *)(a1 + 16), &bytes, (_DWORD *)&v11 + 1, &v11);
  if (v4)
  {
    v5 = v4;
    LogHandle = EAPLogGetLogHandle();
    v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v7))
    {
      v8 = mach_error_string(v5);
      *(_DWORD *)buf = 136315394;
      v14 = a1 + 40;
      v15 = 2080;
      v16 = v8;
      _os_log_impl(&dword_206440000, LogHandle, v7, "eapolcontroller_client_getconfig(%s): %s", buf, 0x16u);
    }
    v9 = 6;
    goto LABEL_5;
  }
  if (bytes)
  {
    *a2 = my_CFPropertyListCreateWithBytePtrAndLength(bytes, SHIDWORD(v11));
    MEMORY[0x20BCF6228](*MEMORY[0x24BDAEC58], bytes, HIDWORD(v11));
    if (!*a2)
    {
      v9 = 12;
LABEL_5:
      LODWORD(v11) = v9;
      goto LABEL_9;
    }
  }
  if (!(_DWORD)v11)
    return 0;
LABEL_9:
  my_CFRelease(a2);
  return v11;
}

uint64_t eapolcontroller_client_getconfig(int a1, _QWORD *a2, _DWORD *a3, _DWORD *a4)
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
  *(_QWORD *)&msg[16] = 0x55FE00000000;
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
      else if (*(_DWORD *)&msg[20] == 22114)
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

uint64_t EAPClientModulePluginFree(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);

  v2 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(result + 24) + 40);
  if (v2)
    return v2(a2);
  return result;
}

void eaptls_free(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if (*a1)
  {
    EAPTLSSessionFreeContext(*(_QWORD *)v1);
    *(_QWORD *)v1 = 0;
    my_CFRelease((const void **)(v1 + 112));
    my_CFRelease((const void **)(v1 + 272));
    memoryIOClearBuffers(v1 + 80);
    free((void *)v1);
    *a1 = 0;
  }
}

_DWORD **EAPOLClientDetach(_DWORD **result)
{
  _QWORD *v1;
  _DWORD *v2;
  int v3;
  mach_error_t v4;
  mach_error_t v5;
  NSObject *LogHandle;
  os_log_type_t v7;
  char *v8;
  unsigned int v9;
  uint8_t buf[4];
  _DWORD *v11;
  __int16 v12;
  char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  if (result)
  {
    v1 = result;
    v2 = *result;
    if (*result)
    {
      v3 = v2[4];
      if (v3)
      {
        v4 = eapolcontroller_client_detach(v3, &v9);
        if (v4)
        {
          v5 = v4;
          LogHandle = EAPLogGetLogHandle();
          v7 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v7))
          {
            v8 = mach_error_string(v5);
            *(_DWORD *)buf = 136315394;
            v11 = v2 + 10;
            v12 = 2080;
            v13 = v8;
            _os_log_impl(&dword_206440000, LogHandle, v7, "eapolcontroller_client_detach(%s): %s", buf, 0x16u);
          }
          v9 = 6;
        }
      }
      EAPOLClientInvalidate((uint64_t)v2, 0);
      free(v2);
      *v1 = 0;
      return (_DWORD **)v9;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t eapolcontroller_client_detach(int a1, _DWORD *a2)
{
  mach_port_name_t reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  reply_port = mig_get_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x55FD00000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3, 0x18u, 0x30u, reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_reply_port(rcv_name_8);
      return v6;
    }
    if (*(_DWORD *)&rcv_name_12[4] == 71)
    {
      v6 = 4294966988;
    }
    else if (*(_DWORD *)&rcv_name_12[4] == 22113)
    {
      if ((v9 & 0x80000000) == 0)
      {
        if (rcv_name == 40)
        {
          if (!rcv_name_4)
          {
            v6 = *(unsigned int *)&rcv_name_12[16];
            if (!*(_DWORD *)&rcv_name_12[16])
            {
              *a2 = *(_DWORD *)&rcv_name_12[20];
              return v6;
            }
            goto LABEL_23;
          }
        }
        else if (rcv_name == 36)
        {
          if (rcv_name_4)
            v7 = 1;
          else
            v7 = *(_DWORD *)&rcv_name_12[16] == 0;
          if (v7)
            v6 = 4294966996;
          else
            v6 = *(unsigned int *)&rcv_name_12[16];
          goto LABEL_23;
        }
      }
      v6 = 4294966996;
    }
    else
    {
      v6 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)&v9);
    return v6;
  }
  mig_put_reply_port(rcv_name_8);
  return v6;
}

void EAPOLClientInvalidate(uint64_t a1, int a2)
{
  __CFMachPort *v3;
  ipc_space_t *v4;
  mach_port_name_t Port;
  __CFRunLoop *Current;
  mach_port_name_t v8;

  v3 = *(__CFMachPort **)a1;
  v4 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  if (v3)
  {
    Port = CFMachPortGetPort(v3);
    CFMachPortInvalidate(*(CFMachPortRef *)a1);
    mach_port_mod_refs(*v4, Port, 1u, -1);
    if (a2)
      mach_port_deallocate(*v4, Port);
    my_CFRelease((const void **)a1);
  }
  if (*(_QWORD *)(a1 + 8))
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 8), (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    my_CFRelease((const void **)(a1 + 8));
  }
  v8 = *(_DWORD *)(a1 + 16);
  if (v8)
  {
    mach_port_deallocate(*v4, v8);
    *(_DWORD *)(a1 + 16) = 0;
  }
}

uint64_t EAPSecKeychainPasswordItemCopy(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v4;
  const __CFDictionary *v5;
  uint64_t v6;
  CFTypeRef v7;
  CFTypeRef v9;
  void *values[3];
  void *keys[4];

  keys[3] = *(void **)MEMORY[0x24BDAC8D0];
  v4 = (void *)*MEMORY[0x24BDE9128];
  keys[0] = *(void **)MEMORY[0x24BDE9220];
  keys[1] = v4;
  keys[2] = *(void **)MEMORY[0x24BDE94C8];
  v9 = 0;
  values[0] = *(void **)MEMORY[0x24BDE9230];
  values[1] = a2;
  values[2] = *(void **)MEMORY[0x24BDBD270];
  v5 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v6 = SecItemCopyMatching(v5, &v9);
  CFRelease(v5);
  v7 = v9;
  if ((_DWORD)v6)
    v7 = 0;
  *a3 = v7;
  return v6;
}

uint64_t eapfast_init(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  _QWORD *v4;
  _BOOL4 BooleanValue;
  int v6;
  _QWORD *v7;
  const void *v8;
  _BOOL4 v9;

  *a3 = 0;
  v4 = malloc_type_malloc(0x8308uLL, 0x10F0040B76A0E04uLL);
  bzero(v4, 0x8308uLL);
  *((_BYTE *)v4 + 116) = my_CFDictionaryGetBooleanValue(*(const __CFDictionary **)(a1 + 80), CFSTR("TLSCertificateIsRequired"), 0);
  *((_DWORD *)v4 + 32) = *(_DWORD *)(a1 + 16);
  BooleanValue = my_CFDictionaryGetBooleanValue(*(const __CFDictionary **)(a1 + 80), CFSTR("TLSEnableSessionResumption"), 1);
  *((_BYTE *)v4 + 33416) = BooleanValue;
  if (!BooleanValue)
    goto LABEL_10;
  if (!*(_QWORD *)(a1 + 24))
  {
    v6 = 8;
    goto LABEL_6;
  }
  v6 = *(_DWORD *)(a1 + 32) + 8;
  if (v6 < 0x11)
  {
LABEL_6:
    v7 = v4 + 4179;
    goto LABEL_7;
  }
  v7 = malloc_type_malloc(v6, 0x13D897A3uLL);
LABEL_7:
  v4[4178] = v7;
  *v7 = 0x545341462D504145;
  v8 = *(const void **)(a1 + 24);
  if (v8)
    memcpy((void *)(v4[4178] + 8), v8, *(unsigned int *)(a1 + 32));
  *((_DWORD *)v4 + 8362) = v6;
LABEL_10:
  v9 = my_CFDictionaryGetBooleanValue(*(const __CFDictionary **)(a1 + 80), CFSTR("EAPFASTUsePAC"), 0);
  *((_BYTE *)v4 + 33417) = v9;
  if (v9)
  {
    *((_BYTE *)v4 + 33418) = my_CFDictionaryGetBooleanValue(*(const __CFDictionary **)(a1 + 80), CFSTR("EAPFASTProvisionPAC"), 0);
    *((_BYTE *)v4 + 33419) = my_CFDictionaryGetBooleanValue(*(const __CFDictionary **)(a1 + 80), CFSTR("EAPFASTProvisionPACAnonymously"), 0);
  }
  memoryIOInit(v4 + 11, v4 + 1, (_OWORD *)v4 + 3);
  *(_QWORD *)a1 = v4;
  *((_DWORD *)v4 + 28) = 0;
  *((_WORD *)v4 + 16638) = 0;
  *((_BYTE *)v4 + 33406) = 0;
  v4[4140] = 0;
  *((_DWORD *)v4 + 37) = 0;
  v4[10] = 0xFFFFFFFF00000000;
  *((_DWORD *)v4 + 10) = 0;
  *((_BYTE *)v4 + 132) = 0;
  *((_BYTE *)v4 + 33452) = 0;
  v4[17] = 0;
  *((_BYTE *)v4 + 144) = 0;
  *((_DWORD *)v4 + 8366) = 0;
  *((_BYTE *)v4 + 33468) = 0;
  return 0;
}

uint64_t eapfast_process(uint64_t a1, unsigned __int8 *a2, _QWORD *a3, int *a4, _DWORD *a5)
{
  uint64_t v7;
  int v8;
  uint64_t v12;
  unsigned int Length;
  NSObject *LogHandle;
  os_log_type_t v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  _BYTE *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  _QWORD *v27;
  unsigned __int16 *v28;
  unsigned int v29;
  unsigned __int8 v30;
  char v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  _QWORD *v38;
  SSLContext *v39;
  SSLContext *v40;
  const __CFArray *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  unsigned int MessageLength;
  int v48;
  _DWORD *v49;
  unint64_t v50;
  int v51;
  NSObject *v52;
  os_log_type_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint64_t v56;
  UInt8 *v57;
  int v58;
  CFPropertyListRef v59;
  const __CFArray *v60;
  int pac;
  const __CFDictionary *ValueAtIndex;
  const void *Value;
  CFTypeID TypeID;
  const void *v65;
  CFTypeID v66;
  const void *Copy;
  uint64_t v68;
  NSObject *v69;
  os_log_type_t v70;
  uint64_t v71;
  unsigned int v72;
  NSObject *v73;
  os_log_type_t v74;
  const char *v75;
  const char *v76;
  NSObject *v77;
  os_log_type_t v78;
  NSObject *v79;
  os_log_type_t v80;
  NSObject *v81;
  os_log_type_t v82;
  void *v83;
  CFTypeID v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  os_log_type_t v88;
  uint64_t v89;
  const __CFData *v90;
  uint64_t v91;
  uint64_t v92;
  const void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  NSObject *v97;
  os_log_type_t v98;
  uint64_t v99;
  int v100;
  int v101;
  BOOL v102;
  __CFDictionary *MutableCopy;
  SSLContext *context;
  uint64_t v106;
  uint64_t v107;
  _QWORD *v108;
  unsigned int v109;
  _QWORD *v110;
  _QWORD *v111;
  const void *v112;
  unsigned int v113;
  uint64_t v114;
  SSLSessionState state;
  const void *v116;
  unsigned int v117;
  const void *v118;
  SSLCipherSuite ciphers[4];
  uint8_t buf[4];
  _BYTE v121[18];
  uint64_t v122;

  v122 = *MEMORY[0x24BDAC8D0];
  v7 = *(_QWORD *)a1;
  *a4 = 0;
  *a5 = 0;
  *a3 = 0;
  v8 = *a2;
  if (v8 != 4)
  {
    if (v8 != 3)
    {
      if (v8 != 1)
        goto LABEL_151;
      v12 = *(_QWORD *)a1;
      Length = EAPPacketGetLength((uint64_t)a2);
      state = kSSLIdle;
      if (Length <= 5)
      {
        LogHandle = EAPLogGetLogHandle();
        v15 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(LogHandle, v15))
        {
LABEL_9:
          v20 = 0;
LABEL_150:
          *a3 = v20;
          goto LABEL_151;
        }
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v121 = Length;
        *(_WORD *)&v121[4] = 2048;
        *(_QWORD *)&v121[6] = 6;
        v16 = "length %d < %ld";
        goto LABEL_7;
      }
      if (*(_QWORD *)v12)
      {
        v22 = SSLGetSessionState(*(SSLContextRef *)v12, &state);
        if ((_DWORD)v22)
        {
          v23 = v22;
          v24 = EAPLogGetLogHandle();
          v25 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v24, v25))
          {
            v26 = EAPSSLErrorString(v23);
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v121 = v26;
            *(_WORD *)&v121[8] = 2048;
            *(_QWORD *)&v121[10] = (int)v23;
            _os_log_impl(&dword_206440000, v24, v25, "SSLGetSessionState failed, %s (%ld)", buf, 0x16u);
          }
          v20 = 0;
          *(_DWORD *)(v12 + 112) = 2;
          *(_DWORD *)(v12 + 136) = v23;
          goto LABEL_150;
        }
      }
      v114 = v12;
      v27 = (_QWORD *)(v12 + 48);
      v28 = (unsigned __int16 *)(a2 + 6);
      v29 = Length - 6;
      v30 = a2[5];
      if ((v30 & 0x20) != 0)
      {
        if (state != kSSLHandshake || !*v27 || *(_DWORD *)(v114 + 84) != a2[1])
        {
          state = kSSLIdle;
          goto LABEL_28;
        }
        v31 = 0;
        v32 = "Start";
      }
      else if (Length == 6)
      {
        v31 = 0;
        v32 = "Ack";
      }
      else
      {
        if ((a2[5] & 0x80) != 0)
        {
          if (Length <= 9)
          {
            LogHandle = EAPLogGetLogHandle();
            v15 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(LogHandle, v15))
              goto LABEL_9;
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v121 = Length;
            *(_WORD *)&v121[4] = 2048;
            *(_QWORD *)&v121[6] = 10;
            v16 = "packet too short %d < %ld";
LABEL_7:
            v17 = LogHandle;
            v18 = v15;
            v19 = 18;
LABEL_8:
            _os_log_impl(&dword_206440000, v17, v18, v16, buf, v19);
            goto LABEL_9;
          }
          v111 = v27;
          MessageLength = EAPTLSLengthIncludedPacketGetMessageLength((uint64_t)a2);
          if (MessageLength > 0x20000)
          {
            v72 = MessageLength;
            v73 = EAPLogGetLogHandle();
            v74 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v73, v74))
              goto LABEL_9;
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v121 = v72;
            *(_WORD *)&v121[4] = 1024;
            *(_DWORD *)&v121[6] = 0x20000;
            v16 = "received message too large, %d > %d";
            v17 = v73;
            v18 = v74;
            v19 = 14;
            goto LABEL_8;
          }
          v28 = (unsigned __int16 *)(a2 + 10);
          v29 = Length - 10;
          if (MessageLength)
          {
            v32 = "Start";
            v31 = 1;
          }
          else
          {
            v31 = 0;
            v32 = "Ack";
          }
          v27 = v111;
          goto LABEL_47;
        }
        v32 = "Start";
        v31 = 1;
      }
      MessageLength = v29;
LABEL_47:
      if ((state - 1) < 2)
      {
        if (*v27)
        {
          v48 = a2[1];
          v44 = v114;
          v49 = (_DWORD *)(v114 + 80);
          if (*(_DWORD *)(v114 + 84) == v48)
          {
LABEL_52:
            v51 = *(_DWORD *)(v114 + 128);
LABEL_141:
            v20 = EAPTLSPacketCreate(2, 43, v48, v51, v27, v49);
            goto LABEL_142;
          }
          v50 = *(_QWORD *)(v114 + 64) + *(int *)(v114 + 80);
          if (v50 < *(_QWORD *)(v114 + 56))
          {
            *(_QWORD *)(v114 + 64) = v50;
            goto LABEL_52;
          }
          v113 = MessageLength;
          v75 = v32;
          memoryBufferClear((uint64_t)v27);
          v32 = v75;
          MessageLength = v113;
          *(_DWORD *)(v114 + 80) = 0;
        }
        v44 = v114;
        if ((v31 & 1) == 0)
        {
          v76 = v32;
          v77 = EAPLogGetLogHandle();
          v78 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v77, v78))
            goto LABEL_9;
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v121 = v76;
          v16 = "unexpected %s frame";
          v17 = v77;
          v18 = v78;
          v19 = 12;
          goto LABEL_8;
        }
        v48 = a2[1];
        if (*(_DWORD *)(v114 + 84) == v48)
        {
          if ((a2[5] & 0x40) != 0)
          {
LABEL_111:
            v51 = 0;
            v27 = 0;
            v49 = 0;
            goto LABEL_141;
          }
        }
        else
        {
          if (!*(_QWORD *)(v114 + 8))
            memoryBufferAllocate(v114 + 8, MessageLength);
          if (!memoryBufferAddData(v114 + 8, v28, v29))
          {
            v79 = EAPLogGetLogHandle();
            v80 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v79, v80))
              goto LABEL_9;
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v121 = v29;
            v16 = "fragment too large %d";
            v17 = v79;
            v18 = v80;
            v19 = 8;
            goto LABEL_8;
          }
          if ((memoryBufferIsComplete(v114 + 8) & 1) == 0)
          {
            if ((a2[5] & 0x40) == 0)
            {
              v81 = EAPLogGetLogHandle();
              v82 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v81, v82))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_206440000, v81, v82, "expecting more data but more fragments bit is not set, ignoring", buf, 2u);
              }
            }
            LOBYTE(v48) = a2[1];
            goto LABEL_111;
          }
        }
        if (*(_BYTE *)(v114 + 144))
          v20 = eapfast_tunnel((uint64_t *)a1, (uint64_t)a2);
        else
          v20 = eapfast_handshake(a1, (uint64_t)a2, a4);
        goto LABEL_142;
      }
      if (state)
      {
        v20 = 0;
        v44 = v114;
LABEL_142:
        *(_DWORD *)(v44 + 84) = a2[1];
        if (!*(_BYTE *)(v44 + 132))
        {
          *(_BYTE *)(v44 + 134) = a2[5] & 7;
          *(_BYTE *)(v44 + 133) = 1;
        }
        if (v20)
          v20[5] = v20[5] & 0xF8 | *(_BYTE *)(v44 + 133) & 7;
        goto LABEL_150;
      }
      if ((v30 & 0x20) == 0)
      {
        v52 = EAPLogGetLogHandle();
        v53 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v52, v53))
          goto LABEL_9;
        *(_WORD *)buf = 0;
        v16 = "ignoring non EAP-FAST start frame";
        v17 = v52;
        v18 = v53;
        v19 = 2;
        goto LABEL_8;
      }
LABEL_28:
      v33 = *(_QWORD *)a1;
      v34 = *(_QWORD *)a1 + 33120;
      v117 = 0;
      v110 = v27;
      if (v29 >= 5 && *v28 == 1024 && v28[1])
      {
        v106 = v34;
        v35 = v29 - 4;
        v109 = __rev16(v28[1]);
        if (v35 >= v109)
        {
          v112 = v28 + 2;
        }
        else
        {
          v36 = EAPLogGetLogHandle();
          v37 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v36, v37))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v121 = v109;
            *(_WORD *)&v121[4] = 2048;
            *(_QWORD *)&v121[6] = v35;
            _os_log_impl(&dword_206440000, v36, v37, "EAP-FAST: GetAuthorityID %d > %ld, ignoring", buf, 0x12u);
          }
          v109 = 0;
          v112 = 0;
        }
        v34 = v106;
      }
      else
      {
        v109 = 0;
        v112 = 0;
      }
      *(_DWORD *)(v34 + 144) = 0;
      if (*(_QWORD *)v33)
      {
        CFRelease(*(CFTypeRef *)v33);
        *(_QWORD *)v33 = 0;
      }
      my_CFRelease((const void **)(v33 + 33408));
      v38 = (_QWORD *)(v34 + 336);
      my_CFRelease((const void **)(v34 + 336));
      memoryIOClearBuffers(v33 + 88);
      v39 = EAPTLSMemIOContextCreate(*(const __CFDictionary **)(a1 + 80), 0, (const void *)(v33 + 88), 0, (OSStatus *)&v117);
      if (!v39)
      {
        v54 = EAPLogGetLogHandle();
        v55 = _SC_syslog_os_log_mapping();
        v44 = v114;
        if (os_log_type_enabled(v54, v55))
        {
          v56 = EAPSSLErrorString(v117);
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v121 = v56;
          *(_WORD *)&v121[8] = 2048;
          *(_QWORD *)&v121[10] = (int)v117;
          _os_log_impl(&dword_206440000, v54, v55, "EAPTLSMemIOContextCreate failed, %s (%ld)", buf, 0x16u);
        }
LABEL_137:
        if (v117)
        {
          v20 = 0;
          *(_DWORD *)(v44 + 136) = v117;
        }
        else
        {
          v95 = SSLHandshake(*(SSLContextRef *)v44);
          if ((_DWORD)v95 == -9803)
          {
            LOBYTE(v48) = a2[1];
            v51 = *(_DWORD *)(v44 + 128);
            v49 = (_DWORD *)(v44 + 80);
            v27 = v110;
            goto LABEL_141;
          }
          v96 = v95;
          v97 = EAPLogGetLogHandle();
          v98 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v97, v98))
          {
            v99 = EAPSSLErrorString(v96);
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v121 = v99;
            *(_WORD *)&v121[8] = 1024;
            *(_DWORD *)&v121[10] = v96;
            _os_log_impl(&dword_206440000, v97, v98, "SSLHandshake failed, %s (%d)", buf, 0x12u);
          }
          v20 = 0;
          *(_DWORD *)(v44 + 136) = v96;
        }
        *(_DWORD *)(v44 + 112) = 2;
        goto LABEL_150;
      }
      v40 = v39;
      v108 = (_QWORD *)(v34 + 336);
      if (*(_BYTE *)(v33 + 116))
      {
        v41 = *(const __CFArray **)(v33 + 120);
        if (!v41)
        {
          v117 = EAPTLSCopyIdentityTrustChain(*(__SecIdentity **)(a1 + 96), *(CFDictionaryRef *)(a1 + 80), (__CFArray **)(v33 + 120));
          if (v117)
          {
            v42 = EAPLogGetLogHandle();
            v43 = _SC_syslog_os_log_mapping();
            v44 = v114;
            if (os_log_type_enabled(v42, v43))
            {
              v68 = EAPSSLErrorString(v117);
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)v121 = v68;
              *(_WORD *)&v121[8] = 2048;
              *(_QWORD *)&v121[10] = (int)v117;
              v46 = "failed to find client cert/identity, %s (%ld)";
              goto LABEL_135;
            }
LABEL_136:
            CFRelease(v40);
            goto LABEL_137;
          }
          v41 = *(const __CFArray **)(v33 + 120);
        }
        v117 = SSLSetCertificate(v40, v41);
        v38 = (_QWORD *)(v34 + 336);
        if (v117)
        {
          v42 = EAPLogGetLogHandle();
          v43 = _SC_syslog_os_log_mapping();
          v44 = v114;
          if (os_log_type_enabled(v42, v43))
          {
            v45 = EAPSSLErrorString(v117);
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v121 = v45;
            *(_WORD *)&v121[8] = 2048;
            *(_QWORD *)&v121[10] = (int)v117;
            v46 = "SSLSetCertificate failed, %s (%ld)";
LABEL_135:
            _os_log_impl(&dword_206440000, v42, v43, v46, buf, 0x16u);
            goto LABEL_136;
          }
          goto LABEL_136;
        }
      }
      if (!*(_BYTE *)(v34 + 297) || !v112)
      {
LABEL_128:
        if (*v38
          || !*(_BYTE *)(v34 + 296)
          || (v93 = *(const void **)(v34 + 304)) == 0
          || (v117 = SSLSetPeerID(v40, v93, *(int *)(v34 + 328))) == 0)
        {
          *(_QWORD *)v33 = v40;
          *(_DWORD *)(v33 + 112) = 0;
          *(_WORD *)(v34 + 156) = 0;
          *(_BYTE *)(v34 + 286) = 0;
          *(_QWORD *)v34 = 0;
          *(_DWORD *)(v33 + 148) = 0;
          *(_QWORD *)(v33 + 80) = 0xFFFFFFFF00000000;
          *(_DWORD *)(v33 + 40) = 0;
          *(_BYTE *)(v33 + 132) = 0;
          *(_BYTE *)(v34 + 332) = 0;
          *(_QWORD *)(v33 + 136) = 0;
          *(_BYTE *)(v33 + 144) = 0;
          *(_DWORD *)(v33 + 33464) = 0;
          *(_BYTE *)(v33 + 33468) = 0;
          v44 = v114;
          goto LABEL_137;
        }
        v42 = EAPLogGetLogHandle();
        v43 = _SC_syslog_os_log_mapping();
        v44 = v114;
        if (!os_log_type_enabled(v42, v43))
          goto LABEL_136;
        v94 = EAPSSLErrorString(v117);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v121 = v94;
        *(_WORD *)&v121[8] = 2048;
        *(_QWORD *)&v121[10] = (int)v117;
        v46 = "SSLSetPeerID failed, %s (%ld)";
        goto LABEL_135;
      }
      context = v40;
      v107 = v34;
      v57 = *(UInt8 **)(a1 + 40);
      v58 = *(_DWORD *)(a1 + 48);
      v59 = pac_list_copy();
      v118 = v59;
      if (!v59
        || (v60 = (const __CFArray *)v59,
            pac = pac_list_find_pac((const __CFArray *)v59, v112, v109, v57, v58),
            pac == -1))
      {
        my_CFRelease(&v118);
        v34 = v107;
        goto LABEL_76;
      }
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v60, pac);
      *(_QWORD *)ciphers = 0;
      Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("PACOpaque"));
      TypeID = CFDataGetTypeID();
      if (Value && CFGetTypeID(Value) == TypeID)
      {
        v65 = CFDictionaryGetValue(ValueAtIndex, CFSTR("PACKey"));
        v66 = CFDataGetTypeID();
        if (v65 && CFGetTypeID(v65) == v66)
        {
          Copy = CFRetain(ValueAtIndex);
LABEL_119:
          v34 = v107;
          goto LABEL_120;
        }
        v83 = (void *)CFDictionaryGetValue(ValueAtIndex, CFSTR("PACKeyKeychainItemID"));
        v84 = CFStringGetTypeID();
        if (v83)
        {
          v34 = v107;
          if (CFGetTypeID(v83) == v84)
          {
            v85 = EAPSecKeychainPasswordItemCopy(0, v83, ciphers);
            if (!(_DWORD)v85)
            {
              MutableCopy = CFDictionaryCreateMutableCopy(0, 0, ValueAtIndex);
              CFDictionarySetValue(MutableCopy, CFSTR("PACKey"), *(const void **)ciphers);
              Copy = CFDictionaryCreateCopy(0, MutableCopy);
              CFRelease(MutableCopy);
LABEL_120:
              my_CFRelease((const void **)ciphers);
              my_CFRelease(&v118);
              v116 = Copy;
              if (Copy)
              {
                v90 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)Copy, CFSTR("PACOpaque"));
                CFDataGetBytePtr(v90);
                CFDataGetLength(v90);
                v117 = SSLInternalSetSessionTicket();
                if (v117)
                {
                  my_CFRelease(&v116);
                  v42 = EAPLogGetLogHandle();
                  v43 = _SC_syslog_os_log_mapping();
                  v44 = v114;
                  v40 = context;
                  if (os_log_type_enabled(v42, v43))
                  {
                    v91 = EAPSSLErrorString(v117);
                    *(_DWORD *)buf = 136315394;
                    *(_QWORD *)v121 = v91;
                    *(_WORD *)&v121[8] = 2048;
                    *(_QWORD *)&v121[10] = (int)v117;
                    v46 = "SSLInternalSetSessionTicket failed, %s (%ld)";
                    goto LABEL_135;
                  }
                  goto LABEL_136;
                }
                v117 = SSLInternalSetMasterSecretFunction();
                v40 = context;
                if (v117)
                {
                  my_CFRelease(&v116);
                  v42 = EAPLogGetLogHandle();
                  v43 = _SC_syslog_os_log_mapping();
                  v44 = v114;
                  if (os_log_type_enabled(v42, v43))
                  {
                    v92 = EAPSSLErrorString(v117);
                    *(_DWORD *)buf = 136315394;
                    *(_QWORD *)v121 = v92;
                    *(_WORD *)&v121[8] = 2048;
                    *(_QWORD *)&v121[10] = (int)v117;
                    v46 = "SSLInternalSetMasterSecretFunction failed, %s (%ld)";
                    goto LABEL_135;
                  }
                  goto LABEL_136;
                }
                v38 = v108;
                *v108 = v116;
                goto LABEL_128;
              }
LABEL_76:
              v40 = context;
              v38 = v108;
              if (*(_BYTE *)(v34 + 299))
              {
                ciphers[0] = 52;
                v117 = SSLSetEnabledCiphers(context, ciphers, 1uLL);
                if (v117)
                {
                  v69 = EAPLogGetLogHandle();
                  v70 = _SC_syslog_os_log_mapping();
                  if (os_log_type_enabled(v69, v70))
                  {
                    v71 = EAPSSLErrorString(v117);
                    *(_DWORD *)buf = 136315394;
                    *(_QWORD *)v121 = v71;
                    *(_WORD *)&v121[8] = 2048;
                    *(_QWORD *)&v121[10] = (int)v117;
                    _os_log_impl(&dword_206440000, v69, v70, "SSLSetEnabledCiphers failed, %s (%ld)", buf, 0x16u);
                  }
                  v44 = v114;
                  goto LABEL_136;
                }
              }
              goto LABEL_128;
            }
            v86 = v85;
            v87 = EAPLogGetLogHandle();
            v88 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v87, v88))
            {
              v89 = EAPSSLErrorString(v86);
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)v121 = v89;
              *(_WORD *)&v121[8] = 1024;
              *(_DWORD *)&v121[10] = v86;
              _os_log_impl(&dword_206440000, v87, v88, "EAP-FAST: EAPSecKeychainPasswordItemCopy failed, %s (%d)\n", buf, 0x12u);
            }
          }
          Copy = 0;
          goto LABEL_120;
        }
      }
      Copy = 0;
      goto LABEL_119;
    }
    v21 = *(_DWORD *)(v7 + 148);
    if (v21 != 1)
      goto LABEL_151;
LABEL_14:
    *(_DWORD *)(v7 + 112) = v21;
    goto LABEL_151;
  }
  if (*(_DWORD *)(v7 + 148) == 2 || !*(_BYTE *)(v7 + 33466))
  {
    v21 = 2;
    goto LABEL_14;
  }
LABEL_151:
  if (*(_DWORD *)(v7 + 112) == 2)
  {
    v100 = *(_DWORD *)(v7 + 136);
    if (v100)
    {
      *a5 = v100;
      v101 = 1001;
    }
    else
    {
      v101 = *(_DWORD *)(v7 + 140);
      if (v101)
        v102 = v101 == 3;
      else
        v102 = 1;
      if (v102)
        v101 = 1;
    }
    *a4 = v101;
  }
  return *(unsigned int *)(v7 + 112);
}

CFPropertyListRef pac_list_copy()
{
  CFPropertyListRef v0;
  CFTypeID TypeID;
  const void *v3;

  v0 = CFPreferencesCopyValue(CFSTR("PACList"), CFSTR("com.apple.network.eapclient.eapfast"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  v3 = v0;
  if (v0)
  {
    TypeID = CFArrayGetTypeID();
    if (CFGetTypeID(v0) != TypeID)
    {
      my_CFRelease(&v3);
      return v3;
    }
  }
  return v0;
}

uint64_t pac_list_find_pac(const __CFArray *a1, const void *a2, unsigned int a3, UInt8 *bytes, int a5)
{
  CFStringRef v7;
  CFIndex Count;
  CFIndex v9;
  CFIndex v10;
  size_t v11;
  uint64_t v12;
  const __CFDictionary *ValueAtIndex;
  CFTypeID TypeID;
  const __CFData *Value;
  CFTypeID v16;
  const UInt8 *BytePtr;
  const void *v18;
  const void *v19;
  CFTypeID v20;
  CFStringRef v23;

  v23 = 0;
  if (bytes)
  {
    v7 = CFStringCreateWithBytes(0, bytes, a5, 0x8000100u, 1u);
    v23 = v7;
  }
  else
  {
    v7 = 0;
  }
  Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    v9 = Count;
    v10 = 0;
    v11 = a3;
    v12 = 0xFFFFFFFFLL;
    while (1)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v10);
      TypeID = CFDictionaryGetTypeID();
      if (ValueAtIndex)
      {
        if (CFGetTypeID(ValueAtIndex) == TypeID)
        {
          Value = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, CFSTR("AuthorityID"));
          v16 = CFDataGetTypeID();
          if (Value)
          {
            if (CFGetTypeID(Value) == v16 && CFDataGetLength(Value) == v11)
            {
              BytePtr = CFDataGetBytePtr(Value);
              if (!memcmp(a2, BytePtr, v11))
              {
                v18 = CFDictionaryGetValue(ValueAtIndex, CFSTR("InitiatorID"));
                if (v18)
                {
                  if (v7)
                  {
                    v19 = v18;
                    v20 = CFStringGetTypeID();
                    if (CFGetTypeID(v19) == v20)
                    {
                      if (CFEqual(v7, v19))
                      {
LABEL_23:
                        v12 = v10;
                        goto LABEL_22;
                      }
                    }
                  }
                }
                else
                {
                  if (!v7)
                    goto LABEL_23;
                  v12 = v10;
                }
              }
            }
          }
        }
      }
      if (v9 == ++v10)
        goto LABEL_22;
    }
  }
  v12 = 0xFFFFFFFFLL;
LABEL_22:
  my_CFRelease((const void **)&v23);
  return v12;
}

void eapfast_free_packet(int a1, void *a2)
{
  if (a2)
    free(a2);
}

uint64_t eapfast_session_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = 0;
  if (!*(_BYTE *)(v2 + 33277))
    return 0;
  *a2 = 32;
  return v2 + 33278;
}

void eapfast_compute_master_secret(uint64_t a1, uint64_t *a2, _DWORD *a3, uint64_t *a4)
{
  uint64_t *v5;
  const __CFDictionary *v6;
  const __CFData *Value;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  NSObject *LogHandle;
  os_log_type_t v18;
  const __CFData *v19;
  const UInt8 *BytePtr;
  int Length;
  int v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2 + 4182;
  v6 = (const __CFDictionary *)a2[4182];
  if (!v6)
  {
    LogHandle = EAPLogGetLogHandle();
    v18 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v18))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v13 = "pac_dict is NULL";
LABEL_10:
    v14 = LogHandle;
    v15 = v18;
    v16 = 2;
    goto LABEL_11;
  }
  Value = (const __CFData *)CFDictionaryGetValue(v6, CFSTR("PACKey"));
  if (!Value)
  {
    LogHandle = EAPLogGetLogHandle();
    v18 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v18))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v13 = "pac_key is NULL";
    goto LABEL_10;
  }
  if ((unint64_t)*a4 > 0x2F)
  {
    v19 = Value;
    v22 = 64;
    if (!ssl_get_server_client_random(*a2, (uint64_t)buf, &v22))
    {
      BytePtr = CFDataGetBytePtr(v19);
      Length = CFDataGetLength(v19);
      T_PRF(BytePtr, Length, "PAC to master secret label hash", 0x1Fu, buf, v22, a3, 48);
      *a4 = 48;
      *((_BYTE *)v5 + 9) = 1;
      return;
    }
  }
  else
  {
    v10 = EAPLogGetLogHandle();
    v11 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = *a4;
      *(_DWORD *)buf = 134218240;
      v24 = v12;
      v25 = 1024;
      v26 = 48;
      v13 = "%lu < %d";
      v14 = v10;
      v15 = v11;
      v16 = 18;
LABEL_11:
      _os_log_impl(&dword_206440000, v14, v15, v13, buf, v16);
    }
  }
LABEL_13:
  *a4 = 0;
}

uint64_t ssl_get_server_client_random(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *LogHandle;
  os_log_type_t v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  int v12;
  unint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v20;
  int v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v20 = *a3;
  v4 = SSLInternalServerRandom();
  if ((_DWORD)v4)
  {
    v5 = v4;
    LogHandle = EAPLogGetLogHandle();
    v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v7))
    {
      *(_DWORD *)buf = 136315394;
      v23 = EAPSSLErrorString(v5);
      v24 = 1024;
      v25 = v5;
      v8 = "EAP-FAST: ssl_get_server_client_random: SSLInternalServerRandom failed, %s (%d)\n";
      v9 = LogHandle;
      v10 = v7;
      v11 = 18;
LABEL_4:
      _os_log_impl(&dword_206440000, v9, v10, v8, buf, v11);
    }
  }
  else
  {
    v12 = v20;
    v13 = *a3;
    if (v20 + 32 <= v13)
    {
      v21 = v13 - v20;
      v5 = SSLInternalClientRandom();
      if (!(_DWORD)v5)
      {
        *a3 = v21 + v12;
        return v5;
      }
      v17 = EAPLogGetLogHandle();
      v18 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v17, v18))
      {
        *(_DWORD *)buf = 136315138;
        v23 = EAPSSLErrorString(v5);
        v8 = "EAP-FAST: ssl_get_server_client_random: SSLInternalClientRandom failed, %s\n";
        v9 = v17;
        v10 = v18;
        v11 = 12;
        goto LABEL_4;
      }
    }
    else
    {
      v14 = EAPLogGetLogHandle();
      v15 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = *a3;
        *(_DWORD *)buf = 134218240;
        v23 = v20 + 32;
        v24 = 1024;
        v25 = v16;
        _os_log_impl(&dword_206440000, v14, v15, "EAP-FAST: ssl_get_server_client_random: SSLInternalServerRandom %ld > %d\n", buf, 0x12u);
      }
      return 4294957479;
    }
  }
  return v5;
}

void T_PRF(const void *a1, int a2, const void *a3, unsigned int a4, const void *a5, int a6, _DWORD *a7, int a8)
{
  size_t i;
  int v13;
  char *v14;
  char *v15;
  BOOL v16;
  int v17;
  unsigned int v18;
  int v19;
  char *v20;
  __int128 v21;
  char *v22;
  _BYTE *v23;
  char *v24;
  __int128 macOut;
  int v29;
  _BYTE v30[20];
  _BYTE v31[252];

  LODWORD(i) = a8;
  *(_QWORD *)&v31[236] = *MEMORY[0x24BDAC8D0];
  v13 = a4 + a6 + 24;
  if (v13 < 0x101)
  {
    v14 = v30;
    v15 = v31;
  }
  else
  {
    v14 = (char *)malloc_type_malloc(v13, 0x3F8CFDB0uLL);
    v15 = v14 + 20;
  }
  v24 = v15;
  if (a5)
    v16 = a6 == 0;
  else
    v16 = 1;
  v17 = !v16;
  v18 = bswap32(i) >> 16;
  v19 = 1;
  for (i = i; ; i -= 20)
  {
    v20 = v14;
    if (v19 != 1)
    {
      v21 = macOut;
      *((_DWORD *)v14 + 4) = v29;
      *(_OWORD *)v14 = v21;
      v20 = v24;
    }
    memcpy(v20, a3, a4);
    v22 = &v20[a4];
    *v22 = 0;
    v23 = v22 + 1;
    if (v17)
    {
      memcpy(v23, a5, a6);
      v23 += a6;
    }
    *(_WORD *)v23 = v18;
    v23[2] = v19;
    CCHmac(0, a1, a2, v14, v23 - v14 + 3, &macOut);
    if (i < 0x15)
      break;
    *(_OWORD *)a7 = macOut;
    a7[4] = v29;
    a7 += 5;
    ++v19;
  }
  memcpy(a7, &macOut, i);
  if (v14 != v30)
    free(v14);
}

_BYTE *eapfast_verify_server(const __CFDictionary **a1, char a2, _DWORD *a3)
{
  const __CFDictionary *v3;
  uint64_t v4;
  _BYTE *result;
  int v9;
  NSObject *LogHandle;
  os_log_type_t v11;
  int v12;
  int v13;
  int v14;
  _DWORD v15[2];
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = (uint64_t)*a1 + 33268;
  if (!*((_BYTE *)*a1 + 33465))
  {
    if (!*((_QWORD *)*a1 + 4182))
    {
      if (*((_BYTE *)*a1 + 33419))
      {
        LOWORD(v15[0]) = 0;
        if (!SSLGetNegotiatedCipher(*(SSLContextRef *)v3, (SSLCipherSuite *)v15) && LOWORD(v15[0]) == 52)
        {
          result = 0;
          *(_BYTE *)(v4 + 8) = 1;
          *(_BYTE *)(v4 + 199) = 1;
          return result;
        }
      }
    }
    v9 = EAPTLSVerifyServerCertificateChain(a1[10], *(CFArrayRef *)(v4 + 140), 0, 0, (_DWORD *)v4);
    *(_DWORD *)(v4 + 4) = v9;
    if (v9)
    {
      LogHandle = EAPLogGetLogHandle();
      v11 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v11))
      {
        v13 = *(_DWORD *)v4;
        v12 = *(_DWORD *)(v4 + 4);
        v15[0] = 67109376;
        v15[1] = v12;
        v16 = 1024;
        v17 = v13;
        _os_log_impl(&dword_206440000, LogHandle, v11, "server certificate not trusted, status %d %d", (uint8_t *)v15, 0xEu);
      }
      v14 = *(_DWORD *)(v4 + 4);
      if (v14 == 3)
      {
        result = 0;
        *((_DWORD *)v3 + 35) = 3;
        *a3 = 3;
        return result;
      }
      if (v14)
      {
        *((_DWORD *)v3 + 35) = v14;
        *a3 = v14;
        *((_DWORD *)v3 + 34) = *(_DWORD *)v4;
        *((_DWORD *)v3 + 28) = 2;
        SSLClose(*(SSLContextRef *)v3);
        return EAPTLSPacketCreate(2, 43, a2, *((_DWORD *)v3 + 32), (_QWORD *)v3 + 6, (_DWORD *)v3 + 20);
      }
    }
  }
  result = 0;
  *(_BYTE *)(v4 + 8) = 1;
  return result;
}

uint64_t eapfast_eap()
{
  uint64_t *v0;
  int *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int *v5;
  size_t v6;
  unsigned __int8 *v7;
  BOOL v8;
  __CFString *v9;
  uint64_t Length;
  NSObject *v11;
  os_log_type_t v12;
  int v13;
  char *v14;
  unsigned __int8 *v15;
  __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  size_t v20;
  unsigned int v21;
  int v22;
  NSObject *v23;
  os_log_type_t v24;
  NSObject *v25;
  os_log_type_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  __CFString *Mutable;
  BOOL v33;
  NSObject *v34;
  os_log_type_t v35;
  int v36;
  char v37;
  void *v38;
  int v39;
  int v40;
  _BOOL8 v41;
  NSObject *LogHandle;
  os_log_type_t v43;
  _WORD *v44;
  NSObject *v45;
  os_log_type_t v46;
  const char *v47;
  NSObject *v48;
  os_log_type_t v49;
  uint32_t v50;
  _WORD *v51;
  uint64_t v52;
  unsigned int v53;
  int v54;
  _BOOL4 v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  _BOOL4 v59;
  unsigned int v60;
  const char *v61;
  NSObject *v62;
  os_log_type_t v63;
  uint32_t v64;
  NSObject *v65;
  os_log_type_t v66;
  __int128 *v67;
  NSObject *v68;
  os_log_type_t v69;
  NSObject *v70;
  os_log_type_t v71;
  unsigned int v72;
  size_t v73;
  __CFString *v74;
  const void *v75;
  NSObject *v76;
  os_log_type_t v77;
  NSObject *v78;
  os_log_type_t v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  os_log_type_t v83;
  uint64_t v84;
  unsigned int __n;
  char __n_7;
  size_t processed;
  __int128 v89;
  int v90[4];
  uint8_t v91[4];
  uint64_t v92;
  __int16 v93;
  int v94;
  char v95;
  _BYTE buf[14];
  uint64_t v97;

  v0 = (uint64_t *)MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v3 = (uint64_t)v0;
  v97 = *MEMORY[0x24BDAC8D0];
  v4 = *v0;
  v5 = (unsigned int *)(*v0 + 33120);
  v89 = 0uLL;
  processed = 0;
  *(_QWORD *)v90 = &v95;
  *(_QWORD *)&v90[2] = 0x4000;
  v6 = *(_QWORD *)v5;
  if (!*(_QWORD *)v5)
  {
    v29 = SSLRead(*(SSLContextRef *)v4, (void *)(v4 + 352), 0x8000uLL, (size_t *)v5);
    if ((_DWORD)v29 == -9803)
      return 1;
    v30 = v29;
    if ((_DWORD)v29)
    {
      LogHandle = EAPLogGetLogHandle();
      v43 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v43))
      {
        *(_DWORD *)v91 = 136315394;
        v92 = EAPSSLErrorString(v30);
        v93 = 1024;
        v94 = v30;
        _os_log_impl(&dword_206440000, LogHandle, v43, "SSLRead failed, %s (%d)", v91, 0x12u);
      }
      v41 = 0;
      *(_DWORD *)(v4 + 112) = 2;
      *(_DWORD *)(v4 + 136) = v30;
      return v41;
    }
    if (*(_QWORD *)v5)
    {
      v31 = (_QWORD *)(v4 + 33128);
      if (*(_BYTE *)(v3 + 8))
      {
        Mutable = CFStringCreateMutable(0, 0);
        v33 = TLVListParse(v4 + 33128, (unsigned __int16 *)(v4 + 352), *v5, Mutable);
        if (Mutable)
        {
          v34 = EAPLogGetLogHandle();
          v35 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v34, v35))
          {
            *(_DWORD *)v91 = 138412290;
            v92 = (uint64_t)Mutable;
            _os_log_impl(&dword_206440000, v34, v35, "-------- Receive TLVs: ----------\n%@", v91, 0xCu);
          }
          CFRelease(Mutable);
        }
        if (!v33)
          goto LABEL_109;
      }
      else if (!TLVListParse(v4 + 33128, (unsigned __int16 *)(v4 + 352), *(_QWORD *)v5, 0))
      {
        goto LABEL_109;
      }
      v51 = (_WORD *)*((_QWORD *)v5 + 9);
      if (v51)
      {
        if (!*v31)
        {
          make_nak((uint64_t)v90, v51);
          goto LABEL_112;
        }
        goto LABEL_110;
      }
      if (!*((_QWORD *)v5 + 7))
      {
LABEL_65:
        if (!*v31)
        {
          v55 = 0;
          goto LABEL_81;
        }
        v54 = *((unsigned __int16 *)v5 + 8);
        v55 = v54 == 1;
        if (v54 != 1)
        {
          *(_DWORD *)(v4 + 148) = 2;
          v56 = *((_QWORD *)v5 + 4);
          v57 = EAPLogGetLogHandle();
          v58 = _SC_syslog_os_log_mapping();
          v59 = os_log_type_enabled(v57, v58);
          if (v56)
          {
            if (v59)
            {
              v60 = v5[10];
              *(_DWORD *)v91 = 67109120;
              LODWORD(v92) = v60;
              v61 = "Result TLV Failure, Error %d";
              v62 = v57;
              v63 = v58;
              v64 = 8;
LABEL_79:
              _os_log_impl(&dword_206440000, v62, v63, v61, v91, v64);
            }
          }
          else if (v59)
          {
            *(_WORD *)v91 = 0;
            v61 = "Result TLV Failure";
            v62 = v57;
            v63 = v58;
            v64 = 2;
            goto LABEL_79;
          }
        }
        v89 = *(_OWORD *)v90;
        make_result((uint64_t)v90, *((unsigned __int16 *)v5 + 8));
LABEL_81:
        v67 = (__int128 *)*((_QWORD *)v5 + 8);
        if (v67)
        {
          if (!process_crypto_binding(v4, v67, (uint64_t)v90))
          {
            v70 = EAPLogGetLogHandle();
            v71 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v70, v71))
            {
              *(_WORD *)v91 = 0;
              _os_log_impl(&dword_206440000, v70, v71, "Crypto Binding TLV validation failed", v91, 2u);
            }
            *(_DWORD *)(v4 + 112) = 2;
            if (*v31)
              *(_OWORD *)v90 = v89;
            make_result((uint64_t)v90, 2u);
            v72 = 2001;
            goto LABEL_111;
          }
          *((_BYTE *)v5 + 348) = 1;
        }
        if (*((_QWORD *)v5 + 10))
        {
          if (*((_BYTE *)v5 + 348)
            && *((_BYTE *)v5 + 297)
            && *((_QWORD *)v5 + 11)
            && *((_QWORD *)v5 + 12)
            && *((_QWORD *)v5 + 15)
            && save_pac((uint64_t *)v5 + 11))
          {
            make_pac_ack((uint64_t)v90, 1u);
            *((_BYTE *)v5 + 346) = 1;
            v68 = EAPLogGetLogHandle();
            v69 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v68, v69))
            {
              *(_WORD *)v91 = 0;
              _os_log_impl(&dword_206440000, v68, v69, "EAP-FAST: PAC was provisioned", v91, 2u);
            }
          }
          else
          {
            make_pac_ack((uint64_t)v90, 2u);
          }
        }
        if (v55)
        {
          *(_DWORD *)(v4 + 148) = 1;
          eapfast_compute_session_key(v4);
          if (*((_BYTE *)v5 + 298))
          {
            if (!*((_QWORD *)v5 + 10) && !*((_QWORD *)v5 + 42) && !*((_BYTE *)v5 + 344))
            {
              *((_BYTE *)v5 + 344) = 1;
              make_pac_request((uint64_t)v90);
            }
          }
        }
        if (*v31)
          goto LABEL_112;
        goto LABEL_2;
      }
      v52 = *(_QWORD *)(v4 + 152);
      if (!v52 || !EAPClientModulePluginEAPType(v52))
      {
        v45 = EAPLogGetLogHandle();
        v46 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v45, v46))
          goto LABEL_109;
        *(_WORD *)v91 = 0;
        v47 = "Intermediate Result TLV supplied but no inner EAP method negotiated";
        goto LABEL_48;
      }
      v53 = bswap32(*(unsigned __int16 *)(*((_QWORD *)v5 + 7) + 4)) >> 16;
      if (v53 == 2)
      {
        v45 = EAPLogGetLogHandle();
        v46 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v45, v46))
          goto LABEL_109;
        *(_WORD *)v91 = 0;
        v47 = "Intermediate Result TLV Failure";
        goto LABEL_48;
      }
      if (v53 != 1)
      {
        v65 = EAPLogGetLogHandle();
        v66 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v65, v66))
          goto LABEL_109;
        *(_DWORD *)v91 = 67109120;
        LODWORD(v92) = v53;
        v47 = "Intermediate Result TLV: unrecognized status = %d";
        v48 = v65;
        v49 = v66;
        v50 = 8;
        goto LABEL_49;
      }
      if (*((_QWORD *)v5 + 8))
      {
        make_intermediate_result((uint64_t)v90);
        goto LABEL_65;
      }
      v45 = EAPLogGetLogHandle();
      v46 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v45, v46))
      {
        *(_WORD *)v91 = 0;
        v47 = "Crypto Binding TLV is missing";
        goto LABEL_48;
      }
    }
    else
    {
      v45 = EAPLogGetLogHandle();
      v46 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v45, v46))
      {
        *(_WORD *)v91 = 0;
        v47 = "zero-length TLV";
LABEL_48:
        v48 = v45;
        v49 = v46;
        v50 = 2;
LABEL_49:
        _os_log_impl(&dword_206440000, v48, v49, v47, v91, v50);
      }
    }
LABEL_109:
    *(_DWORD *)(v4 + 112) = 2;
LABEL_110:
    make_result((uint64_t)v90, 2u);
    v72 = 2002;
LABEL_111:
    make_error((uint64_t)v90, v72);
    goto LABEL_112;
  }
LABEL_2:
  v7 = (unsigned __int8 *)*((_QWORD *)v5 + 6);
  if (v7)
  {
    __n_7 = 0;
    __n = 0;
    if (v6)
      v8 = 1;
    else
      v8 = *(_BYTE *)(v3 + 8) == 0;
    if (!v8)
    {
      v9 = CFStringCreateMutable(0, 0);
      Length = EAPPacketGetLength((uint64_t)(v7 + 4));
      EAPPacketIsValid(v7 + 4, Length, v9);
      v11 = EAPLogGetLogHandle();
      v12 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v9;
        _os_log_impl(&dword_206440000, v11, v12, "EAP-FAST Receive EAP Payload:\n%@", buf, 0xCu);
      }
      CFRelease(v9);
    }
    v13 = v7[4];
    if ((v13 - 2) < 3)
      goto LABEL_11;
    if (v13 != 1)
      return 0;
    v36 = v7[8];
    if (v36 == 2)
    {
      v37 = v7[5];
      v38 = 0;
      v40 = 2;
      v39 = 0;
    }
    else
    {
      if (v36 != 1)
      {
        __n = 2048;
LABEL_11:
        v14 = eapfast_eap_process(v3, v7 + 4, (char *)v91, (signed int *)&__n, v2, &__n_7);
        goto LABEL_12;
      }
      v37 = v7[5];
      v38 = *(void **)(v3 + 40);
      v39 = *(_DWORD *)(v3 + 48);
      v40 = 1;
    }
    v14 = EAPPacketCreate((char *)v91, 2048, 2, v37, v40, v38, v39, (signed int *)&__n);
LABEL_12:
    v15 = (unsigned __int8 *)v14;
    if (v14)
    {
      if (*(_BYTE *)(v3 + 8))
      {
        v16 = CFStringCreateMutable(0, 0);
        v17 = EAPPacketGetLength((uint64_t)v15);
        EAPPacketIsValid(v15, v17, v16);
        v18 = EAPLogGetLogHandle();
        v19 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v18, v19))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v16;
          _os_log_impl(&dword_206440000, v18, v19, "EAP-FAST Send EAP Payload:\n%@", buf, 0xCu);
        }
        CFRelease(v16);
      }
      v20 = (int)__n;
      v21 = __n + 4;
      v22 = v90[2] - v90[3];
      if (v90[2] - v90[3] < (int)(__n + 4))
      {
        v23 = EAPLogGetLogHandle();
        v24 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v23, v24))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&buf[4] = v21;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = v22;
          _os_log_impl(&dword_206440000, v23, v24, "EAP-FAST: BufferAdvanceWritePtr failed: %d > %d", buf, 0xEu);
        }
        v25 = EAPLogGetLogHandle();
        v26 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v25, v26))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_206440000, v25, v26, "EAP-FAST: make_eap(): buffer too small", buf, 2u);
        }
        v27 = EAPLogGetLogHandle();
        v28 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v27, v28))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_206440000, v27, v28, "failed to insert EAP Payload TLV", buf, 2u);
        }
        *(_DWORD *)(v4 + 112) = 2;
        return 0;
      }
      v44 = (_WORD *)(*(_QWORD *)v90 + v90[3]);
      v90[3] += v21;
      v44[1] = bswap32(__n) >> 16;
      *v44 = 2432;
      memcpy(v44 + 2, v15, v20);
      if (v15 != v91)
      {
        if (__n_7)
          EAPClientModulePluginFreePacket(*(_QWORD *)(v4 + 152), v4 + 160, (uint64_t)v15);
        else
          free(v15);
      }
      goto LABEL_112;
    }
    return 0;
  }
LABEL_112:
  v73 = v90[3];
  processed = v90[3];
  if (!v90[3])
  {
    v78 = EAPLogGetLogHandle();
    v79 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v78, v79))
    {
      *(_WORD *)v91 = 0;
      _os_log_impl(&dword_206440000, v78, v79, "nothing to send?", v91, 2u);
    }
    return 0;
  }
  *(_QWORD *)v5 = 0;
  if (*(_BYTE *)(v3 + 8))
  {
    v74 = CFStringCreateMutable(0, 0);
    *(_QWORD *)buf = v74;
    CFStringAppendFormat(v74, 0, CFSTR("======== Send TLVs: ========\n"));
    v75 = *(const void **)v90;
    TLVListParse(0, *(unsigned __int16 **)v90, v73, v74);
    v76 = EAPLogGetLogHandle();
    v77 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v76, v77))
    {
      *(_DWORD *)v91 = 138412290;
      v92 = (uint64_t)v74;
      _os_log_impl(&dword_206440000, v76, v77, "%@", v91, 0xCu);
    }
    my_CFRelease((const void **)buf);
  }
  else
  {
    v75 = *(const void **)v90;
  }
  v80 = SSLWrite(*(SSLContextRef *)v4, v75, v73, &processed);
  v41 = (_DWORD)v80 == 0;
  if ((_DWORD)v80)
  {
    v81 = v80;
    v82 = EAPLogGetLogHandle();
    v83 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v82, v83))
    {
      v84 = EAPSSLErrorString(v81);
      *(_DWORD *)v91 = 136315394;
      v92 = v84;
      v93 = 1024;
      v94 = v81;
      _os_log_impl(&dword_206440000, v82, v83, "SSLWrite failed, %s (%d)", v91, 0x12u);
    }
  }
  if (*(_DWORD *)(v4 + 112) == 2)
    SSLClose(*(SSLContextRef *)v4);
  return v41;
}

BOOL TLVListParse(uint64_t a1, unsigned __int16 *a2, uint64_t a3, CFMutableStringRef theString)
{
  uint64_t v5;
  _QWORD *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  unsigned int v14;
  unsigned int v15;
  const __CFString *v16;
  _BOOL8 result;
  NSObject *LogHandle;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint32_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v5 = a3;
  v39 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    *(_QWORD *)(a1 + 128) = 0;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 112) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  if (!(_DWORD)a3)
    return 1;
  v8 = 0;
  v34 = (_QWORD *)(a1 + 80);
  while (2)
  {
    if (v5 <= 3)
    {
      if (theString)
        goto LABEL_63;
      LogHandle = EAPLogGetLogHandle();
      v19 = _SC_syslog_os_log_mapping();
      result = os_log_type_enabled(LogHandle, (os_log_type_t)v19);
      if (!result)
        return result;
      goto LABEL_67;
    }
    v9 = bswap32(a2[1]) >> 16;
    if (v9 + 4 > (unint64_t)(int)v5)
    {
      if (theString)
      {
LABEL_63:
        CFStringAppendFormat(theString, 0, CFSTR("EAP-FAST: TLV is too short (%d < %d)"), v5, 4);
        return 0;
      }
      LogHandle = EAPLogGetLogHandle();
      v19 = _SC_syslog_os_log_mapping();
      result = os_log_type_enabled(LogHandle, (os_log_type_t)v19);
      if (!result)
        return result;
LABEL_67:
      *(_DWORD *)buf = 67109376;
      v36 = v5;
      v37 = 1024;
      LODWORD(v38) = 4;
      v20 = "EAP-FAST: TLV is too short (%d < %d)";
      v21 = LogHandle;
      v22 = v19;
LABEL_105:
      v25 = 14;
LABEL_106:
      _os_log_impl(&dword_206440000, v21, v22, v20, buf, v25);
      return 0;
    }
    v10 = (int)bswap32(*a2) >> 16;
    v11 = v10 & 0x3FFF;
    if (theString)
    {
      v12 = "Unknown";
      if ((v11 - 3) <= 0x11)
        v12 = off_24BF0CF78[v11 - 3];
      v13 = (const char *)&unk_206473DB9;
      if (v10 < 0)
        v13 = " [mandatory]";
      CFStringAppendFormat(theString, 0, CFSTR("%s TLV (type=%d) Length=%d%s\n"), v12, v10 & 0x3FFF, v9, v13);
      print_data_cfstr(theString, (uint64_t)(a2 + 2), v9);
    }
    switch(v10 & 0x3FFF)
    {
      case 3:
        if (v9 <= 1)
        {
          if (theString)
          {
            CFStringAppendFormat(theString, 0, CFSTR("EAP-FAST: Result TLV is too short (%d < %d)"), v9, 2);
            return 0;
          }
          v23 = EAPLogGetLogHandle();
          v24 = _SC_syslog_os_log_mapping();
          result = os_log_type_enabled(v23, v24);
          if (result)
          {
            *(_DWORD *)buf = 67109376;
            v36 = v9;
            v37 = 1024;
            LODWORD(v38) = 2;
            v20 = "EAP-FAST: Result TLV is too short (%d < %d)";
            goto LABEL_104;
          }
          return result;
        }
        v14 = bswap32(a2[2]);
        v15 = HIWORD(v14);
        if (HIWORD(v14) == 2)
        {
          v16 = CFSTR("Failure\n");
          if (!theString)
            goto LABEL_55;
          goto LABEL_54;
        }
        if (v15 == 1)
        {
          v16 = CFSTR("Success\n");
          if (!theString)
          {
LABEL_55:
            if (!a1)
              goto LABEL_58;
            if (!*(_QWORD *)a1)
            {
              *(_QWORD *)a1 = a2;
              *(_WORD *)(a1 + 8) = v15;
              goto LABEL_58;
            }
            if (theString)
            {
              CFStringAppendFormat(theString, 0, CFSTR("EAP-FAST: multiple Result TLV's defined"), v32, v33);
              return 0;
            }
            v26 = EAPLogGetLogHandle();
            v27 = _SC_syslog_os_log_mapping();
            result = os_log_type_enabled(v26, (os_log_type_t)v27);
            if (result)
            {
              *(_WORD *)buf = 0;
              v20 = "EAP-FAST: multiple Result TLV's defined";
              goto LABEL_123;
            }
            return result;
          }
LABEL_54:
          CFStringAppendFormat(theString, 0, v16);
          goto LABEL_55;
        }
        if (theString)
        {
          CFStringAppendFormat(theString, 0, CFSTR("EAP-FAST: Result TLV unrecognized status = %d"), HIWORD(v14), v33);
          return 0;
        }
        v30 = EAPLogGetLogHandle();
        v31 = _SC_syslog_os_log_mapping();
        result = os_log_type_enabled(v30, (os_log_type_t)v31);
        if (result)
        {
          *(_DWORD *)buf = 67109120;
          v36 = v15;
          v20 = "EAP-FAST: Result TLV unrecognized status = %d";
          v21 = v30;
          v22 = v31;
          v25 = 8;
          goto LABEL_106;
        }
        break;
      case 4:
        if (v9 > 5)
        {
          if (a1)
          {
            if (!*(_QWORD *)(a1 + 16))
              *(_QWORD *)(a1 + 16) = a2;
          }
          goto LABEL_58;
        }
        if (theString)
        {
          CFStringAppendFormat(theString, 0, CFSTR("EAP-FAST: NAK TLV is too short (%d < %d)"), v9, 6);
          return 0;
        }
        v23 = EAPLogGetLogHandle();
        v24 = _SC_syslog_os_log_mapping();
        result = os_log_type_enabled(v23, v24);
        if (result)
        {
          *(_DWORD *)buf = 67109376;
          v36 = v9;
          v37 = 1024;
          LODWORD(v38) = 6;
          v20 = "EAP-FAST: NAK TLV is too short (%d < %d)";
          goto LABEL_104;
        }
        return result;
      case 5:
        if (v9 > 3)
        {
          if (theString)
            CFStringAppendFormat(theString, 0, CFSTR("ErrorCode = %d\n"), bswap32(*((_DWORD *)a2 + 1)));
          if (a1 && !*(_QWORD *)(a1 + 24))
          {
            *(_QWORD *)(a1 + 24) = a2;
            *(_DWORD *)(a1 + 32) = bswap32(*((_DWORD *)a2 + 1));
          }
          goto LABEL_58;
        }
        if (theString)
        {
          CFStringAppendFormat(theString, 0, CFSTR("EAP-FAST: Error TLV is too short (%d < %d)"), v9, 4);
          return 0;
        }
        v23 = EAPLogGetLogHandle();
        v24 = _SC_syslog_os_log_mapping();
        result = os_log_type_enabled(v23, v24);
        if (result)
        {
          *(_DWORD *)buf = 67109376;
          v36 = v9;
          v37 = 1024;
          LODWORD(v38) = 4;
          v20 = "EAP-FAST: Error TLV is too short (%d < %d)";
          goto LABEL_104;
        }
        return result;
      case 7:
        if (v9 > 3)
          goto LABEL_30;
        if (theString)
        {
          CFStringAppendFormat(theString, 0, CFSTR("EAP-FAST: Vendor Specific TLV too short (%d < %d)"), v9, 4);
          return 0;
        }
        v23 = EAPLogGetLogHandle();
        v24 = _SC_syslog_os_log_mapping();
        result = os_log_type_enabled(v23, v24);
        if (result)
        {
          *(_DWORD *)buf = 67109376;
          v36 = v9;
          v37 = 1024;
          LODWORD(v38) = 4;
          v20 = "EAP-FAST: Vendor Specific TLV too short (%d < %d)";
          goto LABEL_104;
        }
        return result;
      case 9:
        if (!a1)
          goto LABEL_37;
        if (*(_QWORD *)(a1 + 40))
        {
          if (theString)
          {
            CFStringAppendFormat(theString, 0, CFSTR("EAP-FAST: EAP Payload TLV appears multiple times"), v32, v33);
            return 0;
          }
          v26 = EAPLogGetLogHandle();
          v27 = _SC_syslog_os_log_mapping();
          result = os_log_type_enabled(v26, (os_log_type_t)v27);
          if (result)
          {
            *(_WORD *)buf = 0;
            v20 = "EAP-FAST: EAP Payload TLV appears multiple times";
            goto LABEL_123;
          }
        }
        else
        {
          *(_QWORD *)(a1 + 40) = a2;
LABEL_37:
          if ((EAPPacketIsValid((unsigned __int8 *)a2 + 4, v9, 0) & 1) != 0)
            goto LABEL_58;
          if (theString)
          {
            CFStringAppendFormat(theString, 0, CFSTR("EAP-FAST: EAP Payload TLV invalid"));
            EAPPacketIsValid((unsigned __int8 *)a2 + 4, v9, theString);
            return 0;
          }
          v26 = EAPLogGetLogHandle();
          v27 = _SC_syslog_os_log_mapping();
          result = os_log_type_enabled(v26, (os_log_type_t)v27);
          if (result)
          {
            *(_WORD *)buf = 0;
            v20 = "EAP-FAST: EAP Payload TLV invalid";
            goto LABEL_123;
          }
        }
        return result;
      case 0xA:
        if (v9 <= 1)
        {
          if (theString)
          {
            CFStringAppendFormat(theString, 0, CFSTR("EAP-FAST: Intermediate Result TLV too short (%d < %d)"), v9, 2);
            return 0;
          }
          v23 = EAPLogGetLogHandle();
          v24 = _SC_syslog_os_log_mapping();
          result = os_log_type_enabled(v23, v24);
          if (result)
          {
            *(_DWORD *)buf = 67109376;
            v36 = v9;
            v37 = 1024;
            LODWORD(v38) = 2;
            v20 = "EAP-FAST: Intermediate Result TLV too short (%d < %d)";
LABEL_104:
            v21 = v23;
            v22 = v24;
            goto LABEL_105;
          }
        }
        else
        {
          if (!a1)
            goto LABEL_58;
          if (!*(_QWORD *)(a1 + 48))
          {
            *(_QWORD *)(a1 + 48) = a2;
            goto LABEL_58;
          }
          if (theString)
          {
            CFStringAppendFormat(theString, 0, CFSTR("EAP-FAST: multiple Intermediate Result TLV's"), v32, v33);
            return 0;
          }
          v26 = EAPLogGetLogHandle();
          v27 = _SC_syslog_os_log_mapping();
          result = os_log_type_enabled(v26, (os_log_type_t)v27);
          if (result)
          {
            *(_WORD *)buf = 0;
            v20 = "EAP-FAST: multiple Intermediate Result TLV's";
            goto LABEL_123;
          }
        }
        return result;
      case 0xB:
        if (a1 && !*(_QWORD *)(a1 + 72))
          v8 = v34;
        if (PACTLVAttributeListParse(v8, a2 + 2, v9, theString))
        {
          if (v8)
            *(_QWORD *)(a1 + 72) = a2;
          goto LABEL_58;
        }
        if (theString)
        {
          CFStringAppendFormat(theString, 0, CFSTR("EAP-FAST: PAC TLV parse failed"), v32, v33);
          return 0;
        }
        v26 = EAPLogGetLogHandle();
        v27 = _SC_syslog_os_log_mapping();
        result = os_log_type_enabled(v26, (os_log_type_t)v27);
        if (result)
        {
          *(_WORD *)buf = 0;
          v20 = "EAP-FAST: PAC TLV parse failed";
          goto LABEL_123;
        }
        return result;
      case 0xC:
        if (v9 <= 0x37)
        {
          if (theString)
          {
            CFStringAppendFormat(theString, 0, CFSTR("EAP-FAST: Crypto Binding TLV too short (%d < %ld)"), v9, 56);
            return 0;
          }
          v28 = EAPLogGetLogHandle();
          v29 = _SC_syslog_os_log_mapping();
          result = os_log_type_enabled(v28, v29);
          if (result)
          {
            *(_DWORD *)buf = 67109376;
            v36 = v9;
            v37 = 2048;
            v38 = 56;
            v20 = "EAP-FAST: Crypto Binding TLV too short (%d < %ld)";
            v21 = v28;
            v22 = v29;
            v25 = 18;
            goto LABEL_106;
          }
        }
        else
        {
          if (!a1)
            goto LABEL_58;
          if (!*(_QWORD *)(a1 + 56))
          {
            *(_QWORD *)(a1 + 56) = a2;
            goto LABEL_58;
          }
          if (theString)
          {
            CFStringAppendFormat(theString, 0, CFSTR("EAP-FAST: multiple Crypto Binding TLV's defined"), v32, v33);
            return 0;
          }
          v26 = EAPLogGetLogHandle();
          v27 = _SC_syslog_os_log_mapping();
          result = os_log_type_enabled(v26, (os_log_type_t)v27);
          if (result)
          {
            *(_WORD *)buf = 0;
            v20 = "EAP-FAST: multiple Crypto Binding TLV's defined";
LABEL_123:
            v21 = v26;
            v22 = v27;
            v25 = 2;
            goto LABEL_106;
          }
        }
        return result;
      default:
LABEL_30:
        if (a1 && v10 < 0 && !*(_QWORD *)(a1 + 64))
          *(_QWORD *)(a1 + 64) = a2;
LABEL_58:
        a2 = (unsigned __int16 *)((char *)a2 + v9 + 4);
        v5 = (v5 - (v9 + 4));
        if (!(_DWORD)v5)
          return 1;
        continue;
    }
    return result;
  }
}

uint64_t TLVListParse_0(uint64_t a1, unsigned __int8 *a2, int a3)
{
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t result;
  void *v12;
  BOOL v13;

  if (!a3)
    return 1;
  v6 = 0;
  v7 = a3;
  while (1)
  {
    if (v7 <= 1)
    {
      snprintf((char *)(a1 + 96), 0xA0uLL, "Missing/truncated attribute at offset %d");
      goto LABEL_15;
    }
    v8 = a2[1];
    v9 = 4 * v8;
    if (4 * (int)v8 > v7)
      break;
    v10 = TLVCheckValidity(a1, a2);
    if (v10)
    {
      if (v10 == 1)
        goto LABEL_15;
      if (((char)*a2 & 0x80000000) == 0)
      {
        snprintf((char *)(a1 + 96), 0xA0uLL, "unrecognized attribute %d");
        goto LABEL_15;
      }
    }
    else
    {
      TLVListAddAttribute((_DWORD *)a1, (uint64_t)a2);
    }
    v6 += v9;
    a2 += v9;
    v7 = a3 - v6;
    if (a3 == v6)
      return 1;
  }
  EAPSIMAKAAttributeTypeGetString(*a2);
  snprintf((char *)(a1 + 96), 0xA0uLL, "%s too large %d (> %d) at offset %d");
LABEL_15:
  v12 = *(void **)a1;
  if (*(_QWORD *)a1)
    v13 = v12 == (void *)(a1 + 8);
  else
    v13 = 1;
  if (!v13)
    free(v12);
  result = 0;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 88) = 0;
  return result;
}

char *eapfast_eap_process(uint64_t a1, unsigned __int8 *a2, char *a3, signed int *a4, int *a5, _BYTE *a6)
{
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v15;
  int *v16;
  int v17;
  int v18;
  uint64_t v19;
  NSObject *LogHandle;
  os_log_type_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  _UNKNOWN **v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  int v36;
  uint64_t v38;
  uint8_t buf[4];
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v11 = *(_QWORD *)a1;
  v38 = 0;
  *a6 = 0;
  v12 = *a2;
  if (v12 == 2)
  {
    v22 = a2[4];
    v23 = *(_QWORD *)(v11 + 152);
    if (v23)
      LODWORD(v23) = EAPClientModulePluginEAPType(v23);
    if ((_DWORD)v23 != v22)
      return (char *)v38;
    goto LABEL_15;
  }
  if (v12 == 1)
  {
    v13 = a2[4];
    if (!a2[4])
      return (char *)v38;
    v15 = *(_QWORD *)(v11 + 152);
    if (v15)
      LODWORD(v15) = EAPClientModulePluginEAPType(v15);
    if ((_DWORD)v15 != v13)
    {
      v16 = (int *)(v11 + 33264);
      v17 = a2[4];
      if (*(_BYTE *)(v11 + 33467))
      {
        if (v17 != 26)
        {
          if (!*v16)
          {
            *v16 = 1;
            LOBYTE(v16) = 26;
LABEL_41:
            buf[0] = v16;
            return EAPPacketCreate(a3, *a4, 2, a2[1], 3, buf, 1, a4);
          }
LABEL_32:
          v31 = 5;
          goto LABEL_39;
        }
      }
      else
      {
        v29 = 0;
        while (inner_auth_types[v29] != v17)
        {
          if (++v29 == 4)
          {
            v30 = *v16;
            if ((int)v30 > 3)
              goto LABEL_32;
            *v16 = v30 + 1;
            LODWORD(v16) = inner_auth_types[v30];
            goto LABEL_41;
          }
        }
      }
      eap_client_free((uint64_t *)a1);
      v18 = a2[4];
      v19 = *(_QWORD *)a1;
      *(_DWORD *)(v19 + 328) = 0;
      *(_QWORD *)(v19 + 336) = 0;
      if (*(_QWORD *)(v19 + 152))
      {
        LogHandle = EAPLogGetLogHandle();
        v21 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(LogHandle, v21))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_206440000, LogHandle, v21, "already initialized", buf, 2u);
        }
        goto LABEL_15;
      }
      v32 = EAPClientModuleLookup(v18);
      if (v32)
      {
        v33 = (uint64_t)v32;
        my_CFRelease((const void **)(v19 + 312));
        my_CFRelease((const void **)(v19 + 320));
        *(_OWORD *)(v19 + 160) = 0u;
        *(_QWORD *)(v19 + 304) = 0;
        *(_OWORD *)(v19 + 272) = 0u;
        *(_OWORD *)(v19 + 288) = 0u;
        *(_OWORD *)(v19 + 240) = 0u;
        *(_OWORD *)(v19 + 256) = 0u;
        *(_OWORD *)(v19 + 208) = 0u;
        *(_OWORD *)(v19 + 224) = 0u;
        *(_OWORD *)(v19 + 176) = 0u;
        *(_OWORD *)(v19 + 192) = 0u;
        *(_DWORD *)(v19 + 176) = *(_DWORD *)(a1 + 16);
        *(_QWORD *)(v19 + 200) = *(_QWORD *)(a1 + 40);
        *(_DWORD *)(v19 + 208) = *(_DWORD *)(a1 + 48);
        *(_QWORD *)(v19 + 224) = *(_QWORD *)(a1 + 64);
        *(_DWORD *)(v19 + 232) = *(_DWORD *)(a1 + 72);
        eap_client_set_properties((CFDictionaryRef *)a1);
        *(_QWORD *)(v19 + 184) = *(_QWORD *)(a1 + 24);
        *(_DWORD *)(v19 + 192) = *(_DWORD *)(a1 + 32);
        *(_DWORD *)(v19 + 344) = EAPClientModulePluginInit(v33, v19 + 160, v19 + 312, v19 + 348);
        *(_QWORD *)(v19 + 336) = EAPClientModulePluginEAPName(v33);
        *(_DWORD *)(v19 + 328) = v18;
        if (!*(_DWORD *)(v19 + 344))
        {
          *(_QWORD *)(v19 + 152) = v33;
          goto LABEL_15;
        }
      }
      v28 = *(_DWORD *)(v11 + 344);
      if (v28 == 3)
        goto LABEL_24;
      v34 = EAPLogGetLogHandle();
      v35 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = a2[4];
        *(_DWORD *)buf = 67109120;
        v40 = v36;
        _os_log_impl(&dword_206440000, v34, v35, "eap_client_init type %d failed", buf, 8u);
      }
      v31 = *(_DWORD *)(v11 + 344);
LABEL_39:
      *a5 = v31;
      *(_DWORD *)(v11 + 112) = 2;
      return (char *)v38;
    }
  }
LABEL_15:
  if (*(_QWORD *)(v11 + 152))
  {
    my_CFRelease((const void **)(v11 + 312));
    my_CFRelease((const void **)(v11 + 320));
    v24 = *(_QWORD *)a1;
    v25 = *(_QWORD *)a1 + 160;
    *(_QWORD *)(v24 + 200) = *(_QWORD *)(a1 + 40);
    *(_DWORD *)(v24 + 208) = *(_DWORD *)(a1 + 48);
    *(_QWORD *)(v24 + 224) = *(_QWORD *)(a1 + 64);
    *(_DWORD *)(v24 + 232) = *(_DWORD *)(a1 + 72);
    *(_DWORD *)(v24 + 180) = *(_DWORD *)(a1 + 20);
    eap_client_set_properties((CFDictionaryRef *)a1);
    v26 = EAPClientModulePluginProcess(*(_QWORD *)(v24 + 152), v25, (uint64_t)a2, (uint64_t)&v38, v24 + 344, v24 + 348);
    v27 = v38;
    if (v38)
    {
      *a6 = 1;
      *a4 = EAPPacketGetLength(v27);
    }
    *(_QWORD *)(v11 + 320) = EAPClientModulePluginPublishProperties(*(_QWORD *)(v11 + 152), v11 + 160);
    if (v26 == 2)
    {
      *(_DWORD *)(v11 + 148) = 2;
      v28 = *(_DWORD *)(v11 + 344);
      goto LABEL_24;
    }
    if (v26 == 1)
    {
      *(_DWORD *)(v11 + 148) = 1;
      return (char *)v38;
    }
    if (!v26 && *(_DWORD *)(v11 + 344) == 3)
    {
      *(_QWORD *)(v11 + 312) = EAPClientModulePluginRequireProperties(*(_QWORD *)(v11 + 152), v11 + 160);
      v28 = *(_DWORD *)(v11 + 344);
      *(_DWORD *)(v11 + 140) = v28;
LABEL_24:
      *a5 = v28;
    }
  }
  return (char *)v38;
}

void eap_client_free(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = *(_QWORD *)(*a1 + 152);
  if (v2)
  {
    EAPClientModulePluginFree(v2, v1 + 160);
    *(_QWORD *)(v1 + 152) = 0;
    my_CFRelease((const void **)(v1 + 240));
    *(_QWORD *)(v1 + 304) = 0;
    *(_OWORD *)(v1 + 272) = 0u;
    *(_OWORD *)(v1 + 288) = 0u;
    *(_OWORD *)(v1 + 240) = 0u;
    *(_OWORD *)(v1 + 256) = 0u;
    *(_OWORD *)(v1 + 208) = 0u;
    *(_OWORD *)(v1 + 224) = 0u;
    *(_OWORD *)(v1 + 176) = 0u;
    *(_OWORD *)(v1 + 192) = 0u;
    *(_OWORD *)(v1 + 160) = 0u;
  }
  my_CFRelease((const void **)(v1 + 312));
  my_CFRelease((const void **)(v1 + 320));
  *(_DWORD *)(v1 + 328) = 0;
  *(_QWORD *)(v1 + 336) = 0;
  *(_QWORD *)(v1 + 344) = 0;
}

void eap_client_free_0(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 152);
  if (v2)
  {
    EAPClientModulePluginFree(v2, a1 + 160);
    *(_QWORD *)(a1 + 152) = 0;
    *(_OWORD *)(a1 + 160) = 0u;
    *(_OWORD *)(a1 + 176) = 0u;
    *(_OWORD *)(a1 + 192) = 0u;
    *(_OWORD *)(a1 + 208) = 0u;
    *(_OWORD *)(a1 + 224) = 0u;
    *(_OWORD *)(a1 + 240) = 0u;
    *(_OWORD *)(a1 + 256) = 0u;
    *(_OWORD *)(a1 + 272) = 0u;
    *(_OWORD *)(a1 + 288) = 0u;
    *(_QWORD *)(a1 + 304) = 0;
  }
  my_CFRelease((const void **)(a1 + 312));
  my_CFRelease((const void **)(a1 + 320));
  *(_DWORD *)(a1 + 328) = 0;
  *(_QWORD *)(a1 + 336) = 0;
  *(_QWORD *)(a1 + 344) = 0;
}

void eap_client_free_1(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 296);
  if (v2)
  {
    EAPClientModulePluginFree(v2, a1 + 304);
    *(_QWORD *)(a1 + 296) = 0;
    *(_OWORD *)(a1 + 304) = 0u;
    *(_OWORD *)(a1 + 320) = 0u;
    *(_OWORD *)(a1 + 336) = 0u;
    *(_OWORD *)(a1 + 352) = 0u;
    *(_OWORD *)(a1 + 368) = 0u;
    *(_OWORD *)(a1 + 384) = 0u;
    *(_OWORD *)(a1 + 400) = 0u;
    *(_OWORD *)(a1 + 416) = 0u;
    *(_OWORD *)(a1 + 432) = 0u;
    *(_QWORD *)(a1 + 448) = 0;
  }
  my_CFRelease((const void **)(a1 + 456));
  my_CFRelease((const void **)(a1 + 464));
  *(_DWORD *)(a1 + 472) = 0;
  *(_QWORD *)(a1 + 480) = 0;
  *(_QWORD *)(a1 + 488) = 0;
}

void eap_client_set_properties(CFDictionaryRef *a1)
{
  CFDictionaryRef v2;
  __CFDictionary *MutableCopy;
  const __CFAllocator *v4;
  CFDataRef v5;
  CFDataRef v6;

  v2 = *a1;
  if (*((_BYTE *)*a1 + 33467))
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a1[10]);
    v4 = (const __CFAllocator *)*MEMORY[0x24BDBD258];
    v5 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)v2 + 33509, 16, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
    CFDictionarySetValue(MutableCopy, CFSTR("EAPMSCHAPv2ServerChallenge"), v5);
    CFRelease(v5);
    v6 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)v2 + 33525, 16, v4);
    CFDictionarySetValue(MutableCopy, CFSTR("EAPMSCHAPv2ClientChallenge"), v6);
    CFRelease(v6);
    my_CFRelease((const void **)v2 + 30);
    *((_QWORD *)v2 + 30) = MutableCopy;
  }
  else
  {
    my_CFRelease((const void **)v2 + 30);
    *((_QWORD *)v2 + 30) = CFRetain(a1[10]);
  }
}

uint64_t eapgtc_init(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  *a3 = 0;
  *a2 = 0;
  return 0;
}

uint64_t eapgtc_process(uint64_t a1, const char *a2, _QWORD *a3, _DWORD *a4, _DWORD *a5)
{
  int v5;
  uint64_t result;
  int v10;
  int v11;
  int v12;
  _BYTE *v13;
  _BYTE *v14;
  _QWORD *v15;
  int v16;

  *a4 = 0;
  *a5 = 0;
  *a3 = 0;
  v5 = *(unsigned __int8 *)a2;
  if (v5 == 4)
  {
    *a4 = 1;
    return 2;
  }
  else if (v5 == 3)
  {
    return 1;
  }
  else
  {
    result = 0;
    if (v5 == 1)
    {
      if (*(_QWORD *)(a1 + 64))
      {
        v10 = *(_DWORD *)(a1 + 72);
        v11 = v10 + 5;
        if ((unint64_t)EAPPacketGetLength((uint64_t)a2) - 15 <= 0xFFFFFFFFFFFFFFF5
          && !strncmp(a2 + 5, "CHALLENGE=", 0xAuLL))
        {
          v11 = v10 + *(_DWORD *)(a1 + 48) + 15;
          v12 = 1;
        }
        else
        {
          v12 = 0;
        }
        v13 = malloc_type_malloc(v11, 0xB66F2FA2uLL);
        v14 = v13;
        if (v13)
        {
          *v13 = 2;
          v13[1] = a2[1];
          EAPPacketSetLength((uint64_t)v13, (unsigned __int16)v11);
          v14[4] = 6;
          v15 = v14 + 5;
          if (v12)
          {
            v14[13] = 61;
            *v15 = *(_QWORD *)"RESPONSE=";
            memcpy(v14 + 14, *(const void **)(a1 + 40), *(unsigned int *)(a1 + 48));
            v16 = *(_DWORD *)(a1 + 48);
            v14[v16 + 14] = 0;
            v15 = (_QWORD *)((char *)v15 + v16 + 10);
          }
          memcpy(v15, *(const void **)(a1 + 64), *(unsigned int *)(a1 + 72));
        }
        result = 0;
        *a3 = v14;
      }
      else
      {
        result = 0;
        *a4 = 3;
      }
    }
  }
  return result;
}

void eapgtc_free_packet(int a1, void *a2)
{
  if (a2)
    free(a2);
}

void make_result(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *LogHandle;
  os_log_type_t v6;
  int v7;
  NSObject *v8;
  os_log_type_t v9;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = *(int *)(a1 + 12);
  if (*(_DWORD *)(a1 + 8) - (int)v3 <= 5)
  {
    LogHandle = EAPLogGetLogHandle();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v6))
    {
      v7 = *(_DWORD *)(a1 + 8) - *(_DWORD *)(a1 + 12);
      v10[0] = 67109376;
      v10[1] = 6;
      v11 = 1024;
      v12 = v7;
      _os_log_impl(&dword_206440000, LogHandle, v6, "EAP-FAST: BufferAdvanceWritePtr failed: %d > %d", (uint8_t *)v10, 0xEu);
    }
    v8 = EAPLogGetLogHandle();
    v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v9))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_206440000, v8, v9, "EAP-FAST: make_result(): buffer too small", (uint8_t *)v10, 2u);
    }
  }
  else
  {
    v4 = *(_QWORD *)a1 + v3;
    *(_DWORD *)(a1 + 12) = v3 + 6;
    *(_DWORD *)v4 = 33555328;
    *(_WORD *)(v4 + 4) = __rev16(a2);
  }
}

void eapfast_free(uint64_t *a1)
{
  uint64_t v2;
  void *v3;
  BOOL v4;

  v2 = *a1;
  if (*a1)
  {
    eap_client_free(a1);
    if (*(_QWORD *)v2)
    {
      CFRelease(*(CFTypeRef *)v2);
      *(_QWORD *)v2 = 0;
    }
    v3 = *(void **)(v2 + 33424);
    if (v3)
      v4 = v3 == (void *)(v2 + 33432);
    else
      v4 = 1;
    if (!v4)
      free(v3);
    my_CFRelease((const void **)(v2 + 120));
    my_CFRelease((const void **)(v2 + 33408));
    memoryIOClearBuffers(v2 + 88);
    my_CFRelease((const void **)(v2 + 33456));
    free((void *)v2);
  }
  *a1 = 0;
}

uint64_t peap_init(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  char *v5;

  v5 = (char *)malloc_type_malloc(0x608uLL, 0x10F0040A535B1BCuLL);
  bzero(v5, 0x608uLL);
  v5[108] = my_CFDictionaryGetBooleanValue(*(const __CFDictionary **)(a1 + 80), CFSTR("TLSCertificateIsRequired"), 0);
  *((_DWORD *)v5 + 30) = *(_DWORD *)(a1 + 16);
  v5[1536] = my_CFDictionaryGetBooleanValue(*(const __CFDictionary **)(a1 + 80), CFSTR("TLSEnableSessionResumption"), 1);
  memoryIOInit((_QWORD *)v5 + 10, v5 + 8, v5 + 40);
  *(_QWORD *)a1 = v5;
  *a3 = 0;
  return 0;
}

uint64_t peap_process(uint64_t a1, unsigned __int8 *a2, _QWORD *a3, int *a4, _DWORD *a5)
{
  uint64_t v7;
  int v8;
  uint64_t v12;
  unsigned int Length;
  NSObject *v14;
  os_log_type_t v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  _BYTE *v20;
  int v21;
  NSObject *LogHandle;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  _QWORD *v29;
  const void *v30;
  unsigned int v31;
  unsigned __int8 v32;
  char v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  SSLContext *v37;
  SSLContext *v38;
  const void *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  const char *v43;
  unsigned int v44;
  int v45;
  unint64_t v46;
  int v47;
  _DWORD *v48;
  NSObject *v49;
  os_log_type_t v50;
  const __CFArray *v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  uint64_t v62;
  int v63;
  int v64;
  BOOL v65;
  unsigned int MessageLength;
  const char *v68;
  NSObject *v69;
  os_log_type_t v70;
  const void *v71;
  size_t v72;
  unsigned int v73;
  unsigned int v74;
  NSObject *v75;
  os_log_type_t v76;
  unsigned int v77;
  NSObject *v78;
  os_log_type_t v79;
  const char *v80;
  const void *v81;
  _QWORD *v82;
  unsigned int v83;
  SSLSessionState state;
  unsigned int v85;
  uint8_t buf[4];
  _BYTE v87[18];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v7 = *(_QWORD *)a1;
  *a4 = 0;
  *a5 = 0;
  *(_BYTE *)(v7 + 128) = 0;
  *a3 = 0;
  v8 = *a2;
  switch(v8)
  {
    case 4:
      v21 = *(_DWORD *)(v7 + 144);
      if (v21 == 2)
        goto LABEL_15;
      if (*(_DWORD *)(v7 + 124) == 1 && *(_BYTE *)(v7 + 140))
      {
        v21 = 2;
        goto LABEL_15;
      }
      break;
    case 3:
      v21 = *(_DWORD *)(v7 + 144);
      if (v21 == 1)
      {
LABEL_15:
        *(_DWORD *)(v7 + 104) = v21;
        break;
      }
      *(_DWORD *)(v7 + 144) = 2;
      *(_DWORD *)(v7 + 104) = 2;
      LogHandle = EAPLogGetLogHandle();
      v23 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v23))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_206440000, LogHandle, v23, "Tearing down the EAP session as the server is either malicious or has a compliance issue", buf, 2u);
      }
      break;
    case 1:
      v12 = *(_QWORD *)a1;
      Length = EAPPacketGetLength((uint64_t)a2);
      state = kSSLIdle;
      if (Length <= 5)
      {
        v14 = EAPLogGetLogHandle();
        v15 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v14, v15))
        {
LABEL_9:
          v20 = 0;
LABEL_86:
          *a3 = v20;
          break;
        }
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v87 = Length;
        *(_WORD *)&v87[4] = 2048;
        *(_QWORD *)&v87[6] = 6;
        v16 = "length %d < %ld";
        goto LABEL_7;
      }
      if (*(_QWORD *)v12)
      {
        v24 = SSLGetSessionState(*(SSLContextRef *)v12, &state);
        if ((_DWORD)v24)
        {
          v25 = v24;
          v26 = EAPLogGetLogHandle();
          v27 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v26, v27))
          {
            v28 = EAPSSLErrorString(v25);
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v87 = v28;
            *(_WORD *)&v87[8] = 2048;
            *(_QWORD *)&v87[10] = (int)v25;
            _os_log_impl(&dword_206440000, v26, v27, "SSLGetSessionState failed, %s (%ld)", buf, 0x16u);
          }
          v20 = 0;
          *(_DWORD *)(v12 + 104) = 2;
          *(_DWORD *)(v12 + 132) = v25;
          goto LABEL_86;
        }
      }
      v29 = (_QWORD *)(v12 + 40);
      v30 = a2 + 6;
      v31 = Length - 6;
      v32 = a2[5];
      if ((v32 & 0x20) != 0)
      {
        if (state != kSSLHandshake || !*v29 || *(_DWORD *)(v12 + 76) != a2[1])
        {
          state = kSSLIdle;
          goto LABEL_31;
        }
        v33 = 0;
        v34 = "Start";
      }
      else if (Length == 6)
      {
        v33 = 0;
        v34 = "Ack";
      }
      else
      {
        if ((a2[5] & 0x80) != 0)
        {
          if (Length <= 9)
          {
            v14 = EAPLogGetLogHandle();
            v15 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v14, v15))
              goto LABEL_9;
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v87 = Length;
            *(_WORD *)&v87[4] = 2048;
            *(_QWORD *)&v87[6] = 10;
            v16 = "packet too short %d < %ld";
LABEL_7:
            v17 = v14;
            v18 = v15;
            v19 = 18;
LABEL_8:
            _os_log_impl(&dword_206440000, v17, v18, v16, buf, v19);
            goto LABEL_9;
          }
          MessageLength = EAPTLSLengthIncludedPacketGetMessageLength((uint64_t)a2);
          if (MessageLength <= 0x20000)
          {
            v30 = a2 + 10;
            v44 = Length - 10;
            v29 = (_QWORD *)(v12 + 40);
            if (MessageLength)
            {
              v34 = "Start";
              v33 = 1;
              v31 = MessageLength;
            }
            else
            {
              v33 = 0;
              v31 = 0;
              v34 = "Ack";
            }
          }
          else
          {
            v29 = (_QWORD *)(v12 + 40);
            if ((a2[5] & 0x40) != 0)
            {
              v77 = MessageLength;
              v78 = EAPLogGetLogHandle();
              v79 = _SC_syslog_os_log_mapping();
              if (!os_log_type_enabled(v78, v79))
                goto LABEL_9;
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v87 = v77;
              *(_WORD *)&v87[4] = 1024;
              *(_DWORD *)&v87[6] = 0x20000;
              v16 = "received message too large, %d > %d";
              v17 = v78;
              v18 = v79;
              v19 = 14;
              goto LABEL_8;
            }
            v33 = 1;
            *(_BYTE *)(v12 + 128) = 1;
            v34 = "Start";
            v44 = v31;
            v30 = a2 + 6;
          }
          goto LABEL_45;
        }
        v34 = "Start";
        v33 = 1;
      }
      v44 = v31;
LABEL_45:
      if ((state - 1) < 2)
      {
        if (*v29)
        {
          v45 = a2[1];
          if (*(_DWORD *)(v12 + 76) == v45)
          {
LABEL_50:
            v47 = *(_DWORD *)(v12 + 120);
            v48 = (_DWORD *)(v12 + 72);
LABEL_77:
            v20 = EAPTLSPacketCreate(2, 25, v45, v47, v29, v48);
            goto LABEL_78;
          }
          v46 = *(_QWORD *)(v12 + 56) + *(int *)(v12 + 72);
          if (v46 < *(_QWORD *)(v12 + 48))
          {
            *(_QWORD *)(v12 + 56) = v46;
            goto LABEL_50;
          }
          v80 = v34;
          v81 = v30;
          v83 = v44;
          memoryBufferClear((uint64_t)v29);
          v34 = v80;
          v30 = v81;
          v44 = v83;
          *(_DWORD *)(v12 + 72) = 0;
        }
        if ((v33 & 1) == 0)
        {
          v68 = v34;
          v69 = EAPLogGetLogHandle();
          v70 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v69, v70))
            goto LABEL_9;
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v87 = v68;
          v16 = "unexpected %s frame";
          v17 = v69;
          v18 = v70;
          v19 = 12;
          goto LABEL_8;
        }
        v45 = a2[1];
        if (*(_DWORD *)(v12 + 76) == v45)
        {
          if ((a2[5] & 0x40) != 0)
          {
LABEL_104:
            v47 = 0;
            v29 = 0;
            v48 = 0;
            goto LABEL_77;
          }
LABEL_111:
          if (*(_BYTE *)(v12 + 140))
            v20 = peap_tunnel();
          else
            v20 = peap_handshake((uint64_t *)a1, a2[1], a4);
          goto LABEL_78;
        }
        if (!*(_QWORD *)(v12 + 8))
        {
          v71 = v30;
          v72 = v31;
          v73 = v44;
          memoryBufferAllocate(v12 + 8, v72);
          v44 = v73;
          v30 = v71;
        }
        v74 = v44;
        if (!memoryBufferAddData(v12 + 8, v30, v44))
        {
          v75 = EAPLogGetLogHandle();
          v76 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v75, v76))
            goto LABEL_9;
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v87 = v74;
          v16 = "fragment too large %d";
          v17 = v75;
          v18 = v76;
          v19 = 8;
          goto LABEL_8;
        }
        if ((memoryBufferIsComplete(v12 + 8) & 1) != 0)
          goto LABEL_111;
        if ((a2[5] & 0x40) != 0)
        {
          LOBYTE(v45) = a2[1];
          goto LABEL_104;
        }
        v49 = EAPLogGetLogHandle();
        v50 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v49, v50))
          goto LABEL_9;
        *(_WORD *)buf = 0;
        v16 = "expecting more data but more fragments bit is not set, ignoring";
LABEL_55:
        v17 = v49;
        v18 = v50;
        v19 = 2;
        goto LABEL_8;
      }
      if (state)
      {
        v20 = 0;
LABEL_78:
        *(_DWORD *)(v12 + 76) = a2[1];
        v58 = *(_DWORD *)(v12 + 124);
        if (v58 == -1)
        {
          v58 = (a2[5] & 7) != 0;
          *(_DWORD *)(v12 + 124) = v58;
        }
        if (v20)
          v20[5] = v20[5] & 0xF8 | v58 & 7;
        goto LABEL_86;
      }
      if ((v32 & 0x20) == 0)
      {
        v49 = EAPLogGetLogHandle();
        v50 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v49, v50))
          goto LABEL_9;
        *(_WORD *)buf = 0;
        v16 = "ignoring non PEAP start frame";
        goto LABEL_55;
      }
LABEL_31:
      v82 = v29;
      v35 = *(_QWORD *)a1;
      v85 = 0;
      v36 = *(void **)(v35 + 352);
      if (v36 && v36 != (void *)(v35 + 360))
        free(v36);
      *(_QWORD *)(v35 + 352) = 0;
      *(_DWORD *)(v35 + 1384) = 0;
      if (*(_QWORD *)v35)
      {
        CFRelease(*(CFTypeRef *)v35);
        *(_QWORD *)v35 = 0;
      }
      my_CFRelease((const void **)(v35 + 1528));
      memoryIOClearBuffers(v35 + 80);
      v37 = EAPTLSMemIOContextCreate(*(const __CFDictionary **)(a1 + 80), 0, (const void *)(v35 + 80), 0, (OSStatus *)&v85);
      if (!v37)
      {
        v53 = EAPLogGetLogHandle();
        v54 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v53, v54))
        {
          v55 = EAPSSLErrorString(v85);
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v87 = v55;
          *(_WORD *)&v87[8] = 2048;
          *(_QWORD *)&v87[10] = (int)v85;
          _os_log_impl(&dword_206440000, v53, v54, "EAPTLSMemIOContextCreate failed, %s (%ld)", buf, 0x16u);
        }
LABEL_73:
        if (v85)
        {
          v20 = 0;
          *(_DWORD *)(v12 + 132) = v85;
        }
        else
        {
          v57 = SSLHandshake(*(SSLContextRef *)v12);
          if ((_DWORD)v57 == -9803)
          {
            LOBYTE(v45) = a2[1];
            v47 = *(_DWORD *)(v12 + 120);
            v48 = (_DWORD *)(v12 + 72);
            v29 = v82;
            goto LABEL_77;
          }
          v59 = v57;
          v60 = EAPLogGetLogHandle();
          v61 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v60, v61))
          {
            v62 = EAPSSLErrorString(v59);
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v87 = v62;
            *(_WORD *)&v87[8] = 1024;
            *(_DWORD *)&v87[10] = v59;
            _os_log_impl(&dword_206440000, v60, v61, "SSLHandshake failed, %s (%d)", buf, 0x12u);
          }
          v20 = 0;
          *(_DWORD *)(v12 + 132) = v59;
        }
        *(_DWORD *)(v12 + 104) = 2;
        goto LABEL_86;
      }
      v38 = v37;
      if (*(_BYTE *)(v35 + 1536)
        && (v39 = *(const void **)(a1 + 24)) != 0
        && (v85 = SSLSetPeerID(v37, v39, *(unsigned int *)(a1 + 32))) != 0)
      {
        v40 = EAPLogGetLogHandle();
        v41 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v40, v41))
        {
          v42 = EAPSSLErrorString(v85);
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v87 = v42;
          *(_WORD *)&v87[8] = 2048;
          *(_QWORD *)&v87[10] = (int)v85;
          v43 = "SSLSetPeerID failed, %s (%ld)";
LABEL_71:
          _os_log_impl(&dword_206440000, v40, v41, v43, buf, 0x16u);
        }
      }
      else
      {
        if (!*(_BYTE *)(v35 + 108))
          goto LABEL_64;
        v51 = *(const __CFArray **)(v35 + 112);
        if (!v51)
        {
          v85 = EAPTLSCopyIdentityTrustChain(*(__SecIdentity **)(a1 + 96), *(CFDictionaryRef *)(a1 + 80), (__CFArray **)(v35 + 112));
          if (v85)
          {
            v40 = EAPLogGetLogHandle();
            v41 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v40, v41))
            {
              v56 = EAPSSLErrorString(v85);
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)v87 = v56;
              *(_WORD *)&v87[8] = 2048;
              *(_QWORD *)&v87[10] = (int)v85;
              v43 = "failed to find client cert/identity, %s (%ld)";
              goto LABEL_71;
            }
            goto LABEL_72;
          }
          v51 = *(const __CFArray **)(v35 + 112);
        }
        v85 = SSLSetCertificate(v38, v51);
        if (!v85)
        {
LABEL_64:
          *(_QWORD *)v35 = v38;
          *(_DWORD *)(v35 + 104) = 0;
          *(_WORD *)(v35 + 1396) = 0;
          *(_BYTE *)(v35 + 1526) = 0;
          *(_DWORD *)(v35 + 144) = 0;
          *(_QWORD *)(v35 + 72) = 0xFFFFFFFF00000000;
          *(_QWORD *)(v35 + 132) = 0;
          *(_BYTE *)(v35 + 140) = 0;
          *(_DWORD *)(v35 + 124) = -1;
          *(_BYTE *)(v35 + 128) = 0;
          *(_BYTE *)(v35 + 1537) = 0;
          goto LABEL_73;
        }
        v40 = EAPLogGetLogHandle();
        v41 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v40, v41))
        {
          v52 = EAPSSLErrorString(v85);
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v87 = v52;
          *(_WORD *)&v87[8] = 2048;
          *(_QWORD *)&v87[10] = (int)v85;
          v43 = "SSLSetCertificate failed, %s, (%ld)";
          goto LABEL_71;
        }
      }
LABEL_72:
      CFRelease(v38);
      goto LABEL_73;
    default:
      break;
  }
  if (*(_DWORD *)(v7 + 104) == 2)
  {
    v63 = *(_DWORD *)(v7 + 132);
    if (v63)
    {
      *a5 = v63;
      v64 = 1001;
    }
    else
    {
      v64 = *(_DWORD *)(v7 + 136);
      if (v64)
        v65 = v64 == 3;
      else
        v65 = 1;
      if (v65)
        v64 = 1;
    }
    *a4 = v64;
  }
  return *(unsigned int *)(v7 + 104);
}

void peap_free_packet(int a1, void *a2)
{
  if (a2)
    free(a2);
}

uint64_t peap_session_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = 0;
  if ((*(_DWORD *)(v2 + 328) != 6 || *(_DWORD *)(v2 + 124) || *(_DWORD *)(v2 + 104) != 1)
    && (!*(_BYTE *)(v2 + 1397) || *(_DWORD *)(v2 + 144) != 1))
  {
    return 0;
  }
  *a2 = 32;
  return v2 + 1398;
}

uint64_t EAPClientModulePluginCopyIdentity(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);

  v2 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 128);
  if (v2)
    return v2(a2);
  else
    return 0;
}

_BYTE *peap_verify_server(uint64_t *a1, char a2, _DWORD *a3)
{
  uint64_t v5;
  int v6;
  NSObject *LogHandle;
  os_log_type_t v8;
  int v9;
  int v10;
  int v11;
  _BYTE *result;
  _DWORD v13[2];
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = *a1;
  v6 = EAPTLSVerifyServerCertificateChain((const __CFDictionary *)a1[10], *(CFArrayRef *)(v5 + 1528), 0, 0, (_DWORD *)(v5 + 1388));
  *(_DWORD *)(v5 + 1392) = v6;
  if (!v6)
    goto LABEL_6;
  LogHandle = EAPLogGetLogHandle();
  v8 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v8))
  {
    v9 = *(_DWORD *)(v5 + 1392);
    v10 = *(_DWORD *)(v5 + 1388);
    v13[0] = 67109376;
    v13[1] = v9;
    v14 = 1024;
    v15 = v10;
    _os_log_impl(&dword_206440000, LogHandle, v8, "server certificate not trusted status %d %d", (uint8_t *)v13, 0xEu);
  }
  v11 = *(_DWORD *)(v5 + 1392);
  if (v11 == 3)
  {
    result = 0;
    *(_DWORD *)(v5 + 136) = 3;
    *a3 = 3;
  }
  else
  {
    if (!v11)
    {
LABEL_6:
      result = 0;
      *(_BYTE *)(v5 + 1396) = 1;
      return result;
    }
    *(_DWORD *)(v5 + 136) = v11;
    *a3 = v11;
    *(_DWORD *)(v5 + 132) = *(_DWORD *)(v5 + 1388);
    *(_DWORD *)(v5 + 104) = 2;
    SSLClose(*(SSLContextRef *)v5);
    return EAPTLSPacketCreate(2, 25, a2, *(_DWORD *)(v5 + 120), (_QWORD *)(v5 + 40), (_DWORD *)(v5 + 72));
  }
  return result;
}

char *peap_eap_process(uint64_t a1, unsigned __int8 *a2, char *a3, signed int *a4, int *a5, _BYTE *a6)
{
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v15;
  unsigned int v16;
  int v17;
  uint64_t v18;
  NSObject *LogHandle;
  os_log_type_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  char *result;
  _UNKNOWN **v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  NSObject *v34;
  os_log_type_t v35;
  int v36;
  uint64_t v37;
  uint8_t buf[4];
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v11 = *(_QWORD *)a1;
  v37 = 0;
  *a6 = 0;
  v12 = *a2;
  if (v12 == 2)
  {
    v21 = a2[4];
    v22 = *(_QWORD *)(v11 + 152);
    if (v22)
      LODWORD(v22) = EAPClientModulePluginEAPType(v22);
    if ((_DWORD)v22 != v21)
      return 0;
    goto LABEL_15;
  }
  if (v12 != 1)
    goto LABEL_15;
  v13 = a2[4];
  if (a2[4])
  {
    v15 = *(_QWORD *)(v11 + 152);
    if (v15)
      LODWORD(v15) = EAPClientModulePluginEAPType(v15);
    if ((_DWORD)v15 != v13)
    {
      v16 = a2[4];
      if (v16 <= 0x1A && ((1 << v16) & 0x4000050) != 0)
      {
        eap_client_free_0(v11);
        v17 = a2[4];
        v18 = *(_QWORD *)a1;
        *(_DWORD *)(v18 + 328) = 0;
        *(_QWORD *)(v18 + 336) = 0;
        if (*(_QWORD *)(v18 + 152))
        {
          LogHandle = EAPLogGetLogHandle();
          v20 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v20))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_206440000, LogHandle, v20, "eap_client_init: already initialized\n", buf, 2u);
          }
          goto LABEL_15;
        }
        v30 = EAPClientModuleLookup(v17);
        if (v30)
        {
          v31 = (uint64_t)v30;
          my_CFRelease((const void **)(v18 + 312));
          my_CFRelease((const void **)(v18 + 320));
          *(_OWORD *)(v18 + 160) = 0u;
          *(_QWORD *)(v18 + 304) = 0;
          *(_OWORD *)(v18 + 272) = 0u;
          *(_OWORD *)(v18 + 288) = 0u;
          *(_OWORD *)(v18 + 240) = 0u;
          *(_OWORD *)(v18 + 256) = 0u;
          *(_OWORD *)(v18 + 208) = 0u;
          *(_OWORD *)(v18 + 224) = 0u;
          *(_OWORD *)(v18 + 176) = 0u;
          *(_OWORD *)(v18 + 192) = 0u;
          *(_DWORD *)(v18 + 176) = *(_DWORD *)(a1 + 16);
          *(_QWORD *)(v18 + 200) = *(_QWORD *)(a1 + 40);
          *(_DWORD *)(v18 + 208) = *(_DWORD *)(a1 + 48);
          *(_QWORD *)(v18 + 224) = *(_QWORD *)(a1 + 64);
          *(_DWORD *)(v18 + 232) = *(_DWORD *)(a1 + 72);
          *(_QWORD *)(v18 + 240) = *(_QWORD *)(a1 + 80);
          *(_DWORD *)(v18 + 344) = EAPClientModulePluginInit(v31, v18 + 160, v18 + 312, v18 + 348);
          *(_QWORD *)(v18 + 336) = EAPClientModulePluginEAPName(v31);
          *(_DWORD *)(v18 + 328) = v17;
          if (!*(_DWORD *)(v18 + 344))
          {
            *(_QWORD *)(v18 + 152) = v31;
            goto LABEL_15;
          }
        }
        if (*(_DWORD *)(v11 + 344) == 3)
        {
          *a5 = 3;
          save_last_packet(v11, a2);
          return 0;
        }
        v34 = EAPLogGetLogHandle();
        v35 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v34, v35))
        {
          v36 = a2[4];
          *(_DWORD *)buf = 67109120;
          v39 = v36;
          _os_log_impl(&dword_206440000, v34, v35, "eap_client_init type %d failed", buf, 8u);
        }
        result = 0;
        v33 = *(_DWORD *)(v11 + 344);
      }
      else
      {
        v32 = *(int *)(v11 + 1384);
        if ((int)v32 <= 2)
        {
          *(_DWORD *)(v11 + 1384) = v32 + 1;
          buf[0] = inner_auth_types_0[v32];
          return EAPPacketCreate(a3, *a4, 2, a2[1], 3, buf, 1, a4);
        }
        result = 0;
        v33 = 5;
      }
      *a5 = v33;
      *(_DWORD *)(v11 + 104) = 2;
      return result;
    }
LABEL_15:
    if (*(_QWORD *)(v11 + 152))
    {
      my_CFRelease((const void **)(v11 + 312));
      my_CFRelease((const void **)(v11 + 320));
      v23 = *(_QWORD *)a1;
      v24 = *(_QWORD *)a1 + 160;
      *(_QWORD *)(v23 + 200) = *(_QWORD *)(a1 + 40);
      *(_DWORD *)(v23 + 208) = *(_DWORD *)(a1 + 48);
      *(_QWORD *)(v23 + 224) = *(_QWORD *)(a1 + 64);
      *(_DWORD *)(v23 + 232) = *(_DWORD *)(a1 + 72);
      *(_DWORD *)(v23 + 180) = *(_DWORD *)(a1 + 20);
      *(_QWORD *)(v23 + 240) = *(_QWORD *)(a1 + 80);
      v25 = EAPClientModulePluginProcess(*(_QWORD *)(v23 + 152), v24, (uint64_t)a2, (uint64_t)&v37, v23 + 344, v23 + 348);
      v26 = v37;
      if (v37)
      {
        *a6 = 1;
        *a4 = EAPPacketGetLength(v26);
      }
      if (v25 == 2)
      {
        *a5 = *(_DWORD *)(v11 + 344);
        v28 = 2;
      }
      else
      {
        if (v25 != 1)
        {
          if (!v25 && *(_DWORD *)(v11 + 344) == 3)
          {
            *(_QWORD *)(v11 + 312) = EAPClientModulePluginRequireProperties(*(_QWORD *)(v11 + 152), v11 + 160);
            save_last_packet(v11, a2);
            v27 = *(_DWORD *)(v11 + 344);
            *(_DWORD *)(v11 + 136) = v27;
            *a5 = v27;
          }
          goto LABEL_26;
        }
        v28 = 1;
      }
      *(_DWORD *)(v11 + 144) = v28;
LABEL_26:
      *(_QWORD *)(v11 + 320) = EAPClientModulePluginPublishProperties(*(_QWORD *)(v11 + 152), v11 + 160);
      return (char *)v37;
    }
  }
  return 0;
}

void peap_free(uint64_t *a1)
{
  uint64_t v1;
  void *v3;
  BOOL v4;

  v1 = *a1;
  if (*a1)
  {
    eap_client_free_0(*a1);
    v3 = *(void **)(v1 + 352);
    if (v3)
      v4 = v3 == (void *)(v1 + 360);
    else
      v4 = 1;
    if (!v4)
      free(v3);
    *(_QWORD *)(v1 + 352) = 0;
    if (*(_QWORD *)v1)
    {
      CFRelease(*(CFTypeRef *)v1);
      *(_QWORD *)v1 = 0;
    }
    my_CFRelease((const void **)(v1 + 112));
    my_CFRelease((const void **)(v1 + 1528));
    memoryIOClearBuffers(v1 + 80);
    free((void *)v1);
    *a1 = 0;
  }
}

uint64_t eapttls_init(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  char *v5;
  const __CFDictionary *v6;
  const __CFString *Value;
  CFTypeID TypeID;
  UInt8 *v9;
  UInt8 *v10;
  uint64_t v11;
  int v12;

  v5 = (char *)malloc_type_malloc(0x638uLL, 0x10F00406210EC67uLL);
  bzero(v5, 0x638uLL);
  v5[108] = my_CFDictionaryGetBooleanValue(*(const __CFDictionary **)(a1 + 80), CFSTR("TLSCertificateIsRequired"), 0);
  *((_DWORD *)v5 + 30) = *(_DWORD *)(a1 + 16);
  v6 = *(const __CFDictionary **)(a1 + 80);
  if (v6
    && (Value = (const __CFString *)CFDictionaryGetValue(v6, CFSTR("TTLSInnerAuthentication")),
        TypeID = CFStringGetTypeID(),
        Value)
    && CFGetTypeID(Value) == TypeID
    && (v9 = my_CFStringToCString(Value, 0x600u)) != 0)
  {
    v10 = v9;
    v11 = 0;
    while (strcmp((const char *)v10, auth_strings[v11]))
    {
      if (++v11 == 6)
      {
        free(v10);
        goto LABEL_9;
      }
    }
    free(v10);
    if ((_DWORD)v11)
      v12 = v11;
    else
      v12 = 5;
  }
  else
  {
LABEL_9:
    v12 = 5;
  }
  *((_DWORD *)v5 + 33) = v12;
  v5[288] = my_CFDictionaryGetBooleanValue(*(const __CFDictionary **)(a1 + 80), CFSTR("TLSEnableSessionResumption"), 1);
  memoryIOInit((_QWORD *)v5 + 10, v5 + 8, v5 + 40);
  *(_QWORD *)a1 = v5;
  *a3 = 0;
  return 0;
}

uint64_t eapttls_process(uint64_t a1, unsigned __int8 *a2, _QWORD *a3, int *a4, _DWORD *a5)
{
  uint64_t v7;
  int v8;
  uint64_t v12;
  unsigned int Length;
  NSObject *LogHandle;
  os_log_type_t v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  _BYTE *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  _QWORD *v27;
  const void *v28;
  unsigned int v29;
  unsigned __int8 v30;
  char v31;
  const char *v32;
  _QWORD *v33;
  uint64_t v34;
  SSLContext *v35;
  SSLContext *v36;
  const void *v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  const char *v41;
  unsigned int v42;
  int v43;
  uint64_t v44;
  unint64_t v45;
  int v46;
  _DWORD *v47;
  NSObject *v48;
  os_log_type_t v49;
  const __CFArray *v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  int v59;
  BOOL v60;
  uint64_t v62;
  NSObject *v63;
  os_log_type_t v64;
  uint64_t v65;
  _QWORD *v66;
  unsigned int MessageLength;
  NSObject *v68;
  os_log_type_t v69;
  const char *v70;
  int v71;
  uint64_t v72;
  const char *v73;
  NSObject *v74;
  os_log_type_t v75;
  uint64_t v76;
  const void *v77;
  unsigned int v78;
  unsigned int v79;
  NSObject *v80;
  os_log_type_t v81;
  NSObject *v82;
  os_log_type_t v83;
  unsigned int v84;
  const void *v85;
  uint64_t v86;
  SSLSessionState state;
  unsigned int v88;
  uint8_t buf[4];
  _BYTE v90[18];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v7 = *(_QWORD *)a1;
  *a4 = 0;
  *a5 = 0;
  *a3 = 0;
  v8 = *a2;
  if (v8 == 4)
  {
    v21 = 2;
LABEL_16:
    *(_DWORD *)(v7 + 104) = v21;
    goto LABEL_78;
  }
  if (v8 != 3)
  {
    if (v8 != 1)
      goto LABEL_78;
    v12 = *(_QWORD *)a1;
    Length = EAPPacketGetLength((uint64_t)a2);
    state = kSSLIdle;
    if (Length <= 5)
    {
      LogHandle = EAPLogGetLogHandle();
      v15 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v15))
      {
LABEL_9:
        v20 = 0;
LABEL_77:
        *a3 = v20;
        goto LABEL_78;
      }
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v90 = Length;
      *(_WORD *)&v90[4] = 2048;
      *(_QWORD *)&v90[6] = 6;
      v16 = "length %d < %ld";
      goto LABEL_7;
    }
    if (*(_QWORD *)v12)
    {
      v22 = SSLGetSessionState(*(SSLContextRef *)v12, &state);
      if ((_DWORD)v22)
      {
        v23 = v22;
        v24 = EAPLogGetLogHandle();
        v25 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v24, v25))
        {
          v26 = EAPSSLErrorString(v23);
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v90 = v26;
          *(_WORD *)&v90[8] = 2048;
          *(_QWORD *)&v90[10] = (int)v23;
          _os_log_impl(&dword_206440000, v24, v25, "SSLGetSessionState failed, %s (%ld)", buf, 0x16u);
        }
        v20 = 0;
        *(_DWORD *)(v12 + 104) = 2;
        *(_DWORD *)(v12 + 124) = v23;
        goto LABEL_77;
      }
    }
    v86 = v12;
    v27 = (_QWORD *)(v12 + 40);
    v28 = a2 + 6;
    v29 = Length - 6;
    v30 = a2[5];
    if ((v30 & 0x20) != 0)
    {
      if (state != kSSLHandshake || !*v27 || *(_DWORD *)(v12 + 76) != a2[1])
      {
        state = kSSLIdle;
        goto LABEL_30;
      }
      v31 = 0;
      v32 = "Start";
    }
    else if (Length == 6)
    {
      v31 = 0;
      v32 = "Ack";
    }
    else
    {
      if ((a2[5] & 0x80) != 0)
      {
        if (Length <= 9)
        {
          LogHandle = EAPLogGetLogHandle();
          v15 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(LogHandle, v15))
            goto LABEL_9;
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v90 = Length;
          *(_WORD *)&v90[4] = 2048;
          *(_QWORD *)&v90[6] = 10;
          v16 = "packet too short %d < %ld";
LABEL_7:
          v17 = LogHandle;
          v18 = v15;
          v19 = 18;
LABEL_8:
          _os_log_impl(&dword_206440000, v17, v18, v16, buf, v19);
          goto LABEL_9;
        }
        v66 = (_QWORD *)(v12 + 40);
        MessageLength = EAPTLSLengthIncludedPacketGetMessageLength((uint64_t)a2);
        v29 = MessageLength;
        if (MessageLength > 0x20000)
        {
          v68 = EAPLogGetLogHandle();
          v69 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v68, v69))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v90 = v29;
            *(_WORD *)&v90[4] = 1024;
            *(_DWORD *)&v90[6] = 0x20000;
            _os_log_impl(&dword_206440000, v68, v69, "received message too large, %d > %d", buf, 0xEu);
          }
          v20 = 0;
          v56 = v86;
          goto LABEL_72;
        }
        v28 = a2 + 10;
        v42 = Length - 10;
        if (MessageLength)
        {
          v32 = "Start";
          v31 = 1;
        }
        else
        {
          v31 = 0;
          v32 = "Ack";
        }
        v27 = v66;
        goto LABEL_41;
      }
      v32 = "Start";
      v31 = 1;
    }
    v42 = v29;
LABEL_41:
    if ((state - 1) < 2)
    {
      if (*v27)
      {
        v43 = a2[1];
        v44 = v86;
        if (*(_DWORD *)(v86 + 76) == v43)
        {
LABEL_46:
          v46 = *(_DWORD *)(v86 + 120);
          v47 = (_DWORD *)(v86 + 72);
LABEL_75:
          v20 = EAPTLSPacketCreate(2, 21, v43, v46, v27, v47);
          goto LABEL_76;
        }
        v45 = *(_QWORD *)(v86 + 56) + *(int *)(v86 + 72);
        if (v45 < *(_QWORD *)(v86 + 48))
        {
          *(_QWORD *)(v86 + 56) = v45;
          goto LABEL_46;
        }
        v85 = v28;
        v70 = v32;
        v84 = v42;
        memoryBufferClear((uint64_t)v27);
        v42 = v84;
        v32 = v70;
        v28 = v85;
        *(_DWORD *)(v86 + 72) = 0;
      }
      if ((v31 & 1) == 0)
      {
        if (state != kSSLConnected
          || (v72 = *(_QWORD *)a1, !*(_BYTE *)(*(_QWORD *)a1 + 289))
          || !*(_BYTE *)(v72 + 148)
          || *(_BYTE *)(v72 + 137))
        {
          v73 = v32;
          v74 = EAPLogGetLogHandle();
          v75 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v74, v75))
            goto LABEL_9;
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v90 = v73;
          v16 = "unexpected %s frame";
          v17 = v74;
          v18 = v75;
          v19 = 12;
          goto LABEL_8;
        }
        v82 = EAPLogGetLogHandle();
        v83 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v82, v83))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_206440000, v82, v83, "server forcing re-auth after resume", buf, 2u);
        }
        v20 = eapttls_do_inner_auth((uint64_t *)a1, a2[1]);
        goto LABEL_61;
      }
      v71 = a2[1];
      if (*(_DWORD *)(v86 + 76) == v71)
      {
        if ((a2[5] & 0x40) != 0)
        {
          v20 = EAPTLSPacketCreate(2, 21, v71, 0, 0, 0);
          goto LABEL_61;
        }
LABEL_110:
        v44 = v86;
        if (*(_BYTE *)(v86 + 136))
          v20 = eapttls_tunnel(a1, (uint64_t)a2, a4);
        else
          v20 = eapttls_handshake((uint64_t *)a1, a2[1], a4);
        goto LABEL_76;
      }
      v76 = v86 + 8;
      if (!*(_QWORD *)(v86 + 8))
      {
        v77 = v28;
        v78 = v42;
        memoryBufferAllocate(v86 + 8, v29);
        v42 = v78;
        v28 = v77;
      }
      v79 = v42;
      if (!memoryBufferAddData(v76, v28, v42))
      {
        v80 = EAPLogGetLogHandle();
        v81 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v80, v81))
          goto LABEL_9;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v90 = v79;
        v16 = "fragment too large %d";
        v17 = v80;
        v18 = v81;
        v19 = 8;
        goto LABEL_8;
      }
      if ((memoryBufferIsComplete(v76) & 1) != 0)
        goto LABEL_110;
      v44 = v86;
      if ((a2[5] & 0x40) != 0)
      {
        LOBYTE(v43) = a2[1];
        v46 = 0;
        v27 = 0;
        v47 = 0;
        goto LABEL_75;
      }
      v48 = EAPLogGetLogHandle();
      v49 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v48, v49))
        goto LABEL_9;
      *(_WORD *)buf = 0;
      v16 = "expecting more data but more fragments bit is not set, ignoring";
LABEL_51:
      v17 = v48;
      v18 = v49;
      v19 = 2;
      goto LABEL_8;
    }
    if (state)
    {
      v20 = 0;
LABEL_61:
      v44 = v86;
LABEL_76:
      *(_DWORD *)(v44 + 76) = a2[1];
      goto LABEL_77;
    }
    if ((v30 & 0x20) == 0)
    {
      v48 = EAPLogGetLogHandle();
      v49 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v48, v49))
        goto LABEL_9;
      *(_WORD *)buf = 0;
      v16 = "ignoring non TTLS start frame";
      goto LABEL_51;
    }
LABEL_30:
    v33 = v27;
    v34 = *(_QWORD *)a1;
    v88 = 0;
    if (*(_QWORD *)v34)
    {
      CFRelease(*(CFTypeRef *)v34);
      *(_QWORD *)v34 = 0;
    }
    my_CFRelease((const void **)(v34 + 280));
    memoryIOClearBuffers(v34 + 80);
    v35 = EAPTLSMemIOContextCreate(*(const __CFDictionary **)(a1 + 80), 0, (const void *)(v34 + 80), 0, (OSStatus *)&v88);
    if (!v35)
    {
      v52 = EAPLogGetLogHandle();
      v53 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v52, v53))
      {
        v54 = EAPSSLErrorString(v88);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v90 = v54;
        *(_WORD *)&v90[8] = 2048;
        *(_QWORD *)&v90[10] = (int)v88;
        _os_log_impl(&dword_206440000, v52, v53, "EAPTLSMemIOContextCreate failed, %s (%ld)", buf, 0x16u);
      }
      goto LABEL_70;
    }
    v36 = v35;
    if (*(_BYTE *)(v34 + 288)
      && (v37 = *(const void **)(a1 + 24)) != 0
      && (v88 = SSLSetPeerID(v35, v37, *(unsigned int *)(a1 + 32))) != 0)
    {
      v38 = EAPLogGetLogHandle();
      v39 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v38, v39))
      {
        v40 = EAPSSLErrorString(v88);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v90 = v40;
        *(_WORD *)&v90[8] = 2048;
        *(_QWORD *)&v90[10] = (int)v88;
        v41 = "SSLSetPeerID failed, %s (%ld)";
LABEL_68:
        _os_log_impl(&dword_206440000, v38, v39, v41, buf, 0x16u);
      }
    }
    else
    {
      if (!*(_BYTE *)(v34 + 108))
        goto LABEL_59;
      v50 = *(const __CFArray **)(v34 + 112);
      if (!v50)
      {
        v88 = EAPTLSCopyIdentityTrustChain(*(__SecIdentity **)(a1 + 96), *(CFDictionaryRef *)(a1 + 80), (__CFArray **)(v34 + 112));
        if (v88)
        {
          v38 = EAPLogGetLogHandle();
          v39 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v38, v39))
          {
            v55 = EAPSSLErrorString(v88);
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v90 = v55;
            *(_WORD *)&v90[8] = 2048;
            *(_QWORD *)&v90[10] = (int)v88;
            v41 = "failed to find client cert/identity, %s (%ld)";
            goto LABEL_68;
          }
          goto LABEL_69;
        }
        v50 = *(const __CFArray **)(v34 + 112);
      }
      v88 = SSLSetCertificate(v36, v50);
      if (!v88)
      {
LABEL_59:
        *(_QWORD *)v34 = v36;
        *(_DWORD *)(v34 + 104) = 0;
        *(_DWORD *)(v34 + 124) = 0;
        *(_DWORD *)(v34 + 128) = 0;
        *(_WORD *)(v34 + 136) = 0;
        *(_WORD *)(v34 + 148) = 0;
        *(_DWORD *)(v34 + 292) = 0;
        *(_BYTE *)(v34 + 278) = 0;
        *(_QWORD *)(v34 + 72) = 0xFFFFFFFF00000000;
        *(_BYTE *)(v34 + 289) = 0;
LABEL_70:
        if (!v88)
        {
          v44 = v86;
          v57 = SSLHandshake(*(SSLContextRef *)v86);
          if ((_DWORD)v57 != -9803)
          {
            v62 = v57;
            v63 = EAPLogGetLogHandle();
            v64 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v63, v64))
            {
              v65 = EAPSSLErrorString(v62);
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)v90 = v65;
              *(_WORD *)&v90[8] = 2048;
              *(_QWORD *)&v90[10] = (int)v62;
              _os_log_impl(&dword_206440000, v63, v64, "SSLHandshake failed, %s (%ld)", buf, 0x16u);
            }
            v20 = 0;
            *(_DWORD *)(v86 + 124) = v62;
            *(_DWORD *)(v86 + 104) = 2;
            goto LABEL_77;
          }
          LOBYTE(v43) = a2[1];
          v46 = *(_DWORD *)(v86 + 120);
          v47 = (_DWORD *)(v86 + 72);
          v27 = v33;
          goto LABEL_75;
        }
        v20 = 0;
        v56 = v86;
        *(_DWORD *)(v86 + 124) = v88;
LABEL_72:
        *(_DWORD *)(v56 + 104) = 2;
        goto LABEL_77;
      }
      v38 = EAPLogGetLogHandle();
      v39 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v38, v39))
      {
        v51 = EAPSSLErrorString(v88);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v90 = v51;
        *(_WORD *)&v90[8] = 2048;
        *(_QWORD *)&v90[10] = (int)v88;
        v41 = "SSLSetCertificate failed, %s (%ld)";
        goto LABEL_68;
      }
    }
LABEL_69:
    CFRelease(v36);
    goto LABEL_70;
  }
  if (*(_BYTE *)(v7 + 136) && !*(_BYTE *)(v7 + 148))
    *a3 = eapttls_verify_server((uint64_t *)a1, a2[1], a4);
  if (*(_BYTE *)(v7 + 148))
  {
    v21 = 1;
    goto LABEL_16;
  }
LABEL_78:
  if (*(_DWORD *)(v7 + 104) == 2)
  {
    v58 = *(_DWORD *)(v7 + 124);
    if (v58)
    {
      *a5 = v58;
      v59 = 1001;
    }
    else
    {
      v59 = *(_DWORD *)(v7 + 128);
      if (v59)
        v60 = v59 == 3;
      else
        v60 = 1;
      if (v60)
        v59 = 1;
    }
    *a4 = v59;
  }
  return *(unsigned int *)(v7 + 104);
}

void eapttls_free_packet(int a1, void *a2)
{
  if (a2)
    free(a2);
}

__CFDictionary *eapttls_publish_props(uint64_t *a1)
{
  uint64_t v1;
  const __CFArray *v2;
  __CFArray *CFDataArray;
  __CFArray *v4;
  const __CFDictionary *v5;
  __CFDictionary *MutableCopy;
  __CFDictionary *v7;
  const void **v8;
  CFNumberRef v9;
  const char *v10;
  CFNumberRef v11;
  SSLCipherSuite cipherSuite;
  __CFArray *v14;
  int v15;
  const void *valuePtr;

  cipherSuite = 0;
  v1 = *a1;
  v2 = *(const __CFArray **)(*a1 + 280);
  if (!v2)
    return 0;
  CFDataArray = EAPSecCertificateArrayCreateCFDataArray(v2);
  v14 = CFDataArray;
  if (!CFDataArray)
    return 0;
  v4 = CFDataArray;
  if (*(_DWORD *)(v1 + 132) == 5 && *(_BYTE *)(v1 + 136) && (v5 = *(const __CFDictionary **)(v1 + 464)) != 0)
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v5);
  else
    MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v7 = MutableCopy;
  CFDictionarySetValue(MutableCopy, CFSTR("TLSServerCertificateChain"), v4);
  v8 = (const void **)MEMORY[0x24BDBD270];
  if (!*(_BYTE *)(v1 + 289))
    v8 = (const void **)MEMORY[0x24BDBD268];
  CFDictionarySetValue(v7, CFSTR("TLSSessionWasResumed"), *v8);
  my_CFRelease((const void **)&v14);
  SSLGetNegotiatedCipher(*(SSLContextRef *)v1, &cipherSuite);
  if (cipherSuite)
  {
    LODWORD(valuePtr) = cipherSuite;
    v9 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(v7, CFSTR("TLSNegotiatedCipher"), v9);
    CFRelease(v9);
  }
  if (*(_QWORD *)(v1 + 296))
  {
    v10 = *(const char **)(v1 + 480);
    v15 = *(_DWORD *)(v1 + 472);
    if (v15)
    {
      if (v10)
      {
        valuePtr = CFStringCreateWithCString(0, v10, 0x600u);
        CFDictionarySetValue(v7, CFSTR("InnerEAPTypeName"), valuePtr);
        my_CFRelease(&valuePtr);
      }
      valuePtr = CFNumberCreate(0, kCFNumberIntType, &v15);
      CFDictionarySetValue(v7, CFSTR("InnerEAPType"), valuePtr);
      my_CFRelease(&valuePtr);
    }
  }
  if (*(_DWORD *)(v1 + 128) == 3 && !*(_BYTE *)(v1 + 148))
  {
    v11 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(v1 + 144));
    CFDictionarySetValue(v7, CFSTR("TLSTrustClientStatus"), v11);
    CFRelease(v11);
  }
  return v7;
}

uint64_t eapttls_session_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = 0;
  if (!*(_BYTE *)(v2 + 149))
    return 0;
  *a2 = 32;
  return v2 + 150;
}

_BYTE *eapttls_verify_server(uint64_t *a1, char a2, _DWORD *a3)
{
  uint64_t v5;
  int v6;
  NSObject *LogHandle;
  os_log_type_t v8;
  int v9;
  int v10;
  int v11;
  _BYTE *result;
  _DWORD v13[2];
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = *a1;
  v6 = EAPTLSVerifyServerCertificateChain((const __CFDictionary *)a1[10], *(CFArrayRef *)(v5 + 280), 0, 0, (_DWORD *)(v5 + 140));
  *(_DWORD *)(v5 + 144) = v6;
  if (!v6)
    goto LABEL_6;
  LogHandle = EAPLogGetLogHandle();
  v8 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v8))
  {
    v10 = *(_DWORD *)(v5 + 140);
    v9 = *(_DWORD *)(v5 + 144);
    v13[0] = 67109376;
    v13[1] = v9;
    v14 = 1024;
    v15 = v10;
    _os_log_impl(&dword_206440000, LogHandle, v8, "server certificate not trusted status %d %d", (uint8_t *)v13, 0xEu);
  }
  v11 = *(_DWORD *)(v5 + 144);
  if (v11 == 3)
  {
    result = 0;
    *(_DWORD *)(v5 + 128) = 3;
    *a3 = 3;
  }
  else
  {
    if (!v11)
    {
LABEL_6:
      result = 0;
      *(_BYTE *)(v5 + 148) = 1;
      return result;
    }
    *(_DWORD *)(v5 + 128) = v11;
    *a3 = v11;
    *(_DWORD *)(v5 + 124) = *(_DWORD *)(v5 + 140);
    *(_DWORD *)(v5 + 104) = 2;
    SSLClose(*(SSLContextRef *)v5);
    return EAPTLSPacketCreate(2, 21, a2, *(_DWORD *)(v5 + 120), (_QWORD *)(v5 + 40), (_DWORD *)(v5 + 72));
  }
  return result;
}

_BYTE *eapttls_start_inner_auth(uint64_t *a1, char a2)
{
  if (*(_BYTE *)(*a1 + 289))
    return EAPTLSPacketCreate(2, 21, a2, *(_DWORD *)(*a1 + 120), (_QWORD *)(*a1 + 40), (_DWORD *)(*a1 + 72));
  else
    return eapttls_do_inner_auth(a1, a2);
}

_BYTE *eapttls_do_inner_auth(uint64_t *a1, char a2)
{
  uint64_t v4;
  int v5;
  unint64_t v6;
  _DWORD *v7;
  _BYTE *v8;
  uint64_t v9;
  size_t v10;
  _DWORD *v11;
  uint64_t v12;
  _DWORD *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *LogHandle;
  os_log_type_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  const char *v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint32_t v33;
  int v34;
  int v35;
  int v36;
  int v37;
  size_t v38;
  char *v39;
  unsigned __int8 *v40;
  __CFString *Mutable;
  uint64_t Length;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  unint64_t v48;
  int v49;
  int v50;
  int v51;
  _DWORD *v52;
  size_t v53;
  _DWORD *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  unint64_t v58;
  int v59;
  int v60;
  int v61;
  _DWORD *v62;
  size_t v63;
  _DWORD *v64;
  uint64_t v65;
  char *v66;
  __int128 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint8_t *v71;
  unint64_t v72;
  int v73;
  int v74;
  int v75;
  _DWORD *v76;
  size_t v77;
  _DWORD *v78;
  uint64_t v79;
  char *v80;
  __int128 v81;
  uint64_t v82;
  uint64_t v83;
  size_t v85;
  _BYTE processed[22];
  _BYTE buf[24];
  size_t v88;
  char v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  *(_BYTE *)(v4 + 137) = 1;
  switch(*(_DWORD *)(v4 + 132))
  {
    case 1:
      *(_QWORD *)processed = 0;
      v5 = *((_DWORD *)a1 + 18) + 15;
      v6 = (*((_DWORD *)a1 + 12) + 3) & 0xFFFFFFFFFFFFFFFCLL;
      v7 = malloc_type_malloc((int)((v5 & 0xFFFFFFF0) + v6 + 16), 0x4FEF4D95uLL);
      if (v7)
      {
        v8 = v7;
        v9 = (int)(v5 & 0xFFFFFFF0);
        *v7 = 0x1000000;
        v10 = *((unsigned int *)a1 + 12);
        v7[1] = bswap32((v10 + 8) & 0xFFFFFF);
        v11 = v7 + 2;
        memmove(v7 + 2, (const void *)a1[5], v10);
        v12 = *((unsigned int *)a1 + 12);
        if (v6 > v12)
          bzero((char *)v11 + v12, (v6 - v12));
        v13 = (_DWORD *)((char *)v11 + v6);
        *v13 = 0x2000000;
        v13[1] = bswap32(v5 & 0xFFFFF0 | 8);
        v14 = (char *)v11 + v6 + 8;
        memmove(v14, (const void *)a1[8], *((unsigned int *)a1 + 18));
        v15 = *((unsigned int *)a1 + 18);
        if (v9 > v15)
          bzero(&v14[v15], (v9 - v15));
        v16 = SSLWrite(*(SSLContextRef *)v4, v8, &v14[v9] - v8, (size_t *)processed);
        if (!(_DWORD)v16)
          goto LABEL_65;
        v17 = v16;
        LogHandle = EAPLogGetLogHandle();
        v19 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(LogHandle, v19))
          goto LABEL_65;
        goto LABEL_63;
      }
      v46 = EAPLogGetLogHandle();
      v47 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v46, v47))
      {
        *(_WORD *)buf = 0;
        v25 = "malloc failed";
        goto LABEL_74;
      }
      return EAPTLSPacketCreate(2, 21, a2, *(_DWORD *)(v4 + 120), (_QWORD *)(v4 + 40), (_DWORD *)(v4 + 72));
    case 2:
      v88 = 0;
      v20 = *((_DWORD *)a1 + 12);
      v21 = EAPTLSComputeKeyData();
      if ((_DWORD)v21)
      {
        v22 = v21;
        v23 = EAPLogGetLogHandle();
        v24 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v23, v24))
          goto LABEL_12;
      }
      else
      {
        v48 = (v20 + 3) & 0xFFFFFFFFFFFFFFFCLL;
        v49 = v48 + 57;
        if ((int)v48 + 57 <= 0)
          v50 = -(-(v48 + 57) & 3);
        else
          v50 = (v48 + 57) & 3;
        v51 = v48 - v50 + 61;
        v52 = malloc_type_malloc(v51, 0xD9AFA31DuLL);
        if (v52)
        {
          v8 = v52;
          *v52 = 0x1000000;
          v53 = *((unsigned int *)a1 + 12);
          v52[1] = bswap32((v53 + 8) & 0xFFFFFF);
          v54 = v52 + 2;
          memmove(v52 + 2, (const void *)a1[5], v53);
          v55 = *((unsigned int *)a1 + 12);
          if (v48 > v55)
            bzero((char *)v54 + v55, (v48 - v55));
          v56 = (char *)v54 + v48;
          *(_QWORD *)v56 = 0x180000003C000000;
          *(_OWORD *)(v56 + 8) = *(_OWORD *)processed;
          *((_QWORD *)v56 + 3) = 0x1900000003000000;
          v56[32] = processed[16];
          chap_md5(processed[16], (const void *)a1[8], *((_DWORD *)a1 + 18), processed, 0x10u, (unsigned __int8 *)v56 + 33);
          bzero(v56 + 49, v51 - v49);
          v57 = SSLWrite(*(SSLContextRef *)v4, v8, &v56[v51 - v49 + 49] - v8, &v88);
          if (!(_DWORD)v57)
            goto LABEL_65;
          v17 = v57;
          LogHandle = EAPLogGetLogHandle();
          v19 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(LogHandle, v19))
            goto LABEL_65;
          goto LABEL_63;
        }
        v46 = EAPLogGetLogHandle();
        v47 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v46, v47))
        {
          *(_WORD *)buf = 0;
          v25 = "malloc failed";
          goto LABEL_74;
        }
      }
      return EAPTLSPacketCreate(2, 21, a2, *(_DWORD *)(v4 + 120), (_QWORD *)(v4 + 40), (_DWORD *)(v4 + 72));
    case 3:
      v85 = 0;
      v26 = *((_DWORD *)a1 + 12);
      v27 = EAPTLSComputeKeyData();
      if ((_DWORD)v27)
      {
        v22 = v27;
        v23 = EAPLogGetLogHandle();
        v24 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v23, v24))
        {
LABEL_12:
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = EAPSSLErrorString(v22);
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = (int)v22;
          v25 = "EAPTLSComputeKeyData failed, %s (%ld)";
          goto LABEL_19;
        }
      }
      else
      {
        v58 = (v26 + 3) & 0xFFFFFFFFFFFFFFFCLL;
        v59 = v58 + 90;
        if ((int)v58 + 90 <= 0)
          v60 = -(-(v58 + 90) & 3);
        else
          v60 = (v58 + 90) & 3;
        v61 = v58 - v60 + 94;
        v62 = malloc_type_malloc(v61, 0xD5FA7FCBuLL);
        if (v62)
        {
          v8 = v62;
          *v62 = 0x1000000;
          v63 = *((unsigned int *)a1 + 12);
          v62[1] = bswap32((v63 + 8) & 0xFFFFFF);
          v64 = v62 + 2;
          memmove(v62 + 2, (const void *)a1[5], v63);
          v65 = *((unsigned int *)a1 + 12);
          if (v58 > v65)
            bzero((char *)v64 + v65, (v58 - v65));
          v66 = (char *)v64 + v58;
          *(_QWORD *)v66 = 0x140000800B000000;
          *((_DWORD *)v66 + 2) = 922812416;
          *(_QWORD *)(v66 + 12) = v88;
          *(_QWORD *)(v66 + 20) = 0x3E00008001000000;
          *((_DWORD *)v66 + 7) = 922812416;
          v66[32] = v89;
          v66[33] = 1;
          *(_QWORD *)(v66 + 50) = 0;
          *(_QWORD *)(v66 + 42) = 0;
          *(_QWORD *)(v66 + 34) = 0;
          MSChap(&v88, (UInt8 *)a1[8], *((_DWORD *)a1 + 18), (uint64_t)buf);
          v67 = *(_OWORD *)buf;
          *(_QWORD *)(v66 + 74) = *(_QWORD *)&buf[16];
          *(_OWORD *)(v66 + 58) = v67;
          bzero(v66 + 82, v61 - v59);
          v68 = SSLWrite(*(SSLContextRef *)v4, v8, &v66[v61 - v59 + 82] - v8, &v85);
          if ((_DWORD)v68)
          {
            v69 = v68;
            LogHandle = EAPLogGetLogHandle();
            v19 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(LogHandle, v19))
            {
              v70 = EAPSSLErrorString(v69);
              *(_DWORD *)processed = 136315394;
              *(_QWORD *)&processed[4] = v70;
              *(_WORD *)&processed[12] = 2048;
              *(_QWORD *)&processed[14] = (int)v69;
              v71 = processed;
              goto LABEL_64;
            }
          }
          goto LABEL_65;
        }
        v46 = EAPLogGetLogHandle();
        v47 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v46, v47))
        {
          *(_WORD *)buf = 0;
          v25 = "malloc failed";
          goto LABEL_74;
        }
      }
      return EAPTLSPacketCreate(2, 21, a2, *(_DWORD *)(v4 + 120), (_QWORD *)(v4 + 40), (_DWORD *)(v4 + 72));
    case 5:
      *(_QWORD *)processed = 0;
      v34 = *((_DWORD *)a1 + 12);
      v35 = v34 + 13;
      if (v34 + 13 <= 0)
        v36 = -(-(v34 + 13) & 3);
      else
        v36 = (v34 + 13) & 3;
      v37 = v34 - v36 + 17;
      if (!v36)
        v37 = v35;
      v38 = v37;
      v39 = (char *)malloc_type_malloc(v37, 0x3DDE01F1uLL);
      if (v39)
      {
        v8 = v39;
        *(_DWORD *)v39 = 1325400064;
        *((_DWORD *)v39 + 1) = bswap32(v35 & 0xFFFFFF);
        *((_WORD *)v39 + 4) = 2;
        v40 = (unsigned __int8 *)(v39 + 8);
        EAPPacketSetLength((uint64_t)(v39 + 8), (unsigned __int16)(*((_WORD *)a1 + 24) + 5));
        v8[12] = 1;
        memmove(v8 + 13, (const void *)a1[5], *((unsigned int *)a1 + 12));
        if ((int)v38 > v35)
          bzero(&v40[*((unsigned int *)a1 + 12) + 5], (int)v38 - v35);
        if (*((_BYTE *)a1 + 8))
        {
          Mutable = CFStringCreateMutable(0, 0);
          Length = EAPPacketGetLength((uint64_t)v40);
          EAPPacketIsValid(v40, Length, Mutable);
          v43 = EAPLogGetLogHandle();
          v44 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v43, v44))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = Mutable;
            _os_log_impl(&dword_206440000, v43, v44, "TTLS Send EAP Payload:\n%@", buf, 0xCu);
          }
          CFRelease(Mutable);
        }
        v45 = SSLWrite(*(SSLContextRef *)v4, v8, v38, (size_t *)processed);
        if (!(_DWORD)v45)
          goto LABEL_65;
        v17 = v45;
        LogHandle = EAPLogGetLogHandle();
        v19 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(LogHandle, v19))
          goto LABEL_65;
        goto LABEL_63;
      }
      v46 = EAPLogGetLogHandle();
      v47 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v46, v47))
      {
        *(_WORD *)buf = 0;
        v25 = "malloc failed";
        goto LABEL_74;
      }
      return EAPTLSPacketCreate(2, 21, a2, *(_DWORD *)(v4 + 120), (_QWORD *)(v4 + 40), (_DWORD *)(v4 + 72));
    default:
      *(_QWORD *)processed = 0;
      v28 = *((_DWORD *)a1 + 12);
      v29 = EAPTLSComputeKeyData();
      if ((_DWORD)v29)
      {
        v30 = v29;
        v23 = EAPLogGetLogHandle();
        v24 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v23, v24))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = EAPSSLErrorString(v30);
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = (int)v30;
          v25 = "EAPTLSComputeKeyData failed, %s (%ld)";
LABEL_19:
          v31 = v23;
          v32 = v24;
          v33 = 22;
LABEL_75:
          _os_log_impl(&dword_206440000, v31, v32, v25, buf, v33);
        }
      }
      else
      {
        v72 = (v28 + 3) & 0xFFFFFFFFFFFFFFFCLL;
        v73 = v72 + 98;
        if ((int)v72 + 98 <= 0)
          v74 = -(-(v72 + 98) & 3);
        else
          v74 = (v72 + 98) & 3;
        v75 = v72 - v74 + 102;
        v76 = malloc_type_malloc(v75, 0x5B78A69CuLL);
        if (v76)
        {
          v8 = v76;
          *v76 = 0x1000000;
          v77 = *((unsigned int *)a1 + 12);
          v76[1] = bswap32((v77 + 8) & 0xFFFFFF);
          v78 = v76 + 2;
          memmove(v76 + 2, (const void *)a1[5], v77);
          v79 = *((unsigned int *)a1 + 12);
          if (v72 > v79)
            bzero((char *)v78 + v79, (v72 - v79));
          v80 = (char *)v78 + v72;
          *(_QWORD *)v80 = 0x1C0000800B000000;
          *((_DWORD *)v80 + 2) = 922812416;
          *(_OWORD *)(v80 + 12) = *(_OWORD *)(v4 + 1572);
          *(_QWORD *)(v80 + 28) = 0x3E00008019000000;
          *((_DWORD *)v80 + 9) = 922812416;
          *((_WORD *)v80 + 20) = *(unsigned __int8 *)(v4 + 1588);
          MSChapFillWithRandom((_DWORD *)(v4 + 1532), 0x10u);
          *(_OWORD *)(v80 + 42) = *(_OWORD *)(v4 + 1532);
          *(_QWORD *)(v80 + 58) = 0;
          MSChap2((const void *)(v4 + 1572), (const void *)(v4 + 1532), (char *)a1[5], (UInt8 *)a1[8], *((_DWORD *)a1 + 18), v4 + 1548);
          v81 = *(_OWORD *)(v4 + 1548);
          *(_QWORD *)(v80 + 82) = *(_QWORD *)(v4 + 1564);
          *(_OWORD *)(v80 + 66) = v81;
          bzero(v80 + 90, v75 - v73);
          v82 = SSLWrite(*(SSLContextRef *)v4, v8, &v80[v75 - v73 + 90] - v8, (size_t *)processed);
          if ((_DWORD)v82)
          {
            v17 = v82;
            LogHandle = EAPLogGetLogHandle();
            v19 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(LogHandle, v19))
            {
LABEL_63:
              v83 = EAPSSLErrorString(v17);
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v83;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = (int)v17;
              v71 = buf;
LABEL_64:
              _os_log_impl(&dword_206440000, LogHandle, v19, "SSLWrite failed, %s (%ld)", v71, 0x16u);
            }
          }
LABEL_65:
          free(v8);
        }
        else
        {
          v46 = EAPLogGetLogHandle();
          v47 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v46, v47))
          {
            *(_WORD *)buf = 0;
            v25 = "malloc failed";
LABEL_74:
            v31 = v46;
            v32 = v47;
            v33 = 2;
            goto LABEL_75;
          }
        }
      }
      return EAPTLSPacketCreate(2, 21, a2, *(_DWORD *)(v4 + 120), (_QWORD *)(v4 + 40), (_DWORD *)(v4 + 72));
  }
}

_DWORD *MSChapFillWithRandom(_DWORD *result, unsigned int a2)
{
  _DWORD *v2;
  unsigned int v3;

  if (a2 >= 4)
  {
    v2 = result;
    v3 = a2 >> 2;
    do
    {
      result = (_DWORD *)arc4random();
      *v2++ = (_DWORD)result;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t MSChap2(const void *a1, const void *a2, char *a3, UInt8 *a4, unsigned int a5, uint64_t a6)
{
  CC_LONG v9;
  double v10;
  uint8x8_t v11;
  uint64_t v13;
  UInt8 data[512];
  __int128 md;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  ChallengeHash(a2, a1, a3, &v13);
  v9 = password_to_unicode(a4, a5, data);
  CC_MD4(data, v9, (unsigned __int8 *)&md);
  return ChallengeResponse(&v13, &md, a6, v10, v11);
}

uint64_t ChallengeHash(const void *a1, const void *a2, char *__s, _QWORD *a4)
{
  const char *v5;
  char *v8;
  CC_LONG v9;
  uint64_t result;
  CC_SHA1_CTX v11;
  unsigned __int8 md[24];
  uint64_t v13;

  v5 = __s;
  v13 = *MEMORY[0x24BDAC8D0];
  memset(&v11, 0, sizeof(v11));
  v8 = strrchr(__s, 92);
  if (v8)
    v5 = v8 + 1;
  CC_SHA1_Init(&v11);
  CC_SHA1_Update(&v11, a1, 0x10u);
  CC_SHA1_Update(&v11, a2, 0x10u);
  v9 = strlen(v5);
  CC_SHA1_Update(&v11, v5, v9);
  result = CC_SHA1_Final(md, &v11);
  *a4 = *(_QWORD *)md;
  return result;
}

uint64_t ChallengeResponse(void *a1, __int128 *a2, uint64_t a3, double a4, uint8x8_t a5)
{
  uint8x8_t v7;
  uint8x8_t v8;
  uint8x8_t v9;
  uint8x8_t v10;
  __int128 v12;
  int v13;
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  v13 = 0;
  v12 = *a2;
  DesEncrypt(a1, (uint64_t)&v12, (void *)a3, *(uint8x8_t *)&v12, a5);
  DesEncrypt(a1, (uint64_t)&v12 + 7, (void *)(a3 + 8), v7, v8);
  return DesEncrypt(a1, (unint64_t)&v12 | 0xE, (void *)(a3 + 16), v9, v10);
}

uint64_t DesEncrypt(void *dataIn, uint64_t a2, void *dataOut, uint8x8_t a4, uint8x8_t a5)
{
  uint64_t v5;
  int v6;
  int16x8_t v7;
  int v8;
  int v9;
  uint64_t result;
  size_t dataOutMoved;
  char key;
  unsigned __int32 v13;
  char v14;
  char v15;
  char v16;
  uint64_t v17;

  v5 = 0;
  v17 = *MEMORY[0x24BDAC8D0];
  v6 = *(unsigned __int8 *)(a2 + 4);
  a4.i32[0] = *(_DWORD *)a2;
  v7 = (int16x8_t)vmovl_u8(a4);
  key = v7.i8[0] & 0xFE;
  a5.i32[0] = *(_DWORD *)(a2 + 1);
  v8 = *(unsigned __int8 *)(a2 + 5);
  v14 = ((v8 | (v6 << 8)) >> 5) & 0xFE;
  *(int8x8_t *)v7.i8 = vand_s8((int8x8_t)vshl_u16((uint16x4_t)vorr_s8((int8x8_t)vshl_n_s16(*(int16x4_t *)v7.i8, 8uLL), (int8x8_t)*(_OWORD *)&vmovl_u8(a5)), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL), (int8x8_t)0xFE00FE00FE00FELL);
  v13 = vmovn_s16(v7).u32[0];
  v9 = *(unsigned __int8 *)(a2 + 6);
  v15 = ((v9 | (v8 << 8)) >> 6) & 0xFE;
  v16 = 2 * v9;
  do
  {
    *(&key + v5) = odd_parity[*(&key + v5)];
    ++v5;
  }
  while (v5 != 8);
  dataOutMoved = 0;
  result = CCCrypt(0, 1u, 0, &key, 8uLL, 0, dataIn, 8uLL, dataOut, 8uLL, &dataOutMoved);
  if ((_DWORD)result)
    return fprintf((FILE *)*MEMORY[0x24BDAC8D8], "DESEncrypt: CCCrypt failed with %d\n", result);
  return result;
}

BOOL MSChap2AuthResponseValid(UInt8 *a1, unsigned int a2, const void *a3, const void *a4, const void *a5, char *a6, const void *a7)
{
  CC_LONG v12;
  uint64_t v13;
  _BYTE *v14;
  char __str[3];
  CC_SHA1_CTX c;
  UInt8 data[512];
  unsigned __int8 md[3];
  _BYTE v20[3];
  unsigned __int8 v21[16];
  unsigned __int8 v22[20];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v12 = password_to_unicode(a1, a2, data);
  memset(&c, 0, sizeof(c));
  CC_MD4(data, v12, md);
  CC_MD4(md, 0x10u, v21);
  CC_SHA1_Init(&c);
  CC_SHA1_Update(&c, v21, 0x10u);
  CC_SHA1_Update(&c, a3, 0x18u);
  CC_SHA1_Update(&c, &magic1, 0x27u);
  CC_SHA1_Final(v22, &c);
  ChallengeHash(a4, a5, a6, v23);
  CC_SHA1_Init(&c);
  CC_SHA1_Update(&c, v22, 0x14u);
  CC_SHA1_Update(&c, v23, 8u);
  CC_SHA1_Update(&c, &magic2, 0x29u);
  CC_SHA1_Final(v22, &c);
  v13 = 0;
  *(_WORD *)md = 15699;
  v14 = v20;
  do
  {
    snprintf(__str, 3uLL, "%02X", v22[v13]);
    *(_WORD *)(v14 - 1) = *(_WORD *)__str;
    ++v13;
    v14 += 2;
  }
  while (v13 != 20);
  return memcmp(md, a7, 0x2AuLL) == 0;
}

uint64_t EAPClientModulePluginServerKey(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t, uint64_t);

  v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 24) + 80);
  if (v3)
    return v3(a2, a3);
  else
    return 0;
}

uint64_t eapttls_server_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = 0;
  if (!*(_BYTE *)(v2 + 149))
    return 0;
  *a2 = 32;
  return v2 + 182;
}

void eapttls_free(uint64_t *a1)
{
  CFTypeRef *v1;

  v1 = (CFTypeRef *)*a1;
  if (*a1)
  {
    eap_client_free_1(*a1);
    if (*v1)
    {
      CFRelease(*v1);
      *v1 = 0;
    }
    my_CFRelease(v1 + 14);
    my_CFRelease(v1 + 35);
    memoryIOClearBuffers((uint64_t)(v1 + 10));
    free(v1);
    *a1 = 0;
  }
}

const char *EAPSecurityErrorString(int a1)
{
  const char *result;

  if (a1 <= -9842)
  {
    switch(a1)
    {
      case -25300:
        return "errSecItemNotFound";
      case -25299:
        return "errSecDuplicateItem";
      case -25291:
        return "errSecNotAvailable";
      default:
        return "<unknown>";
    }
  }
  else
  {
    switch(a1)
    {
      case -9841:
        return "errSSLServerAuthCompleted";
      case -9840:
        return "<unknown>";
      case -9839:
        return "errSSLPeerUserCancelled";
      case -9838:
        return "errSSLPeerInternalError";
      case -9837:
        return "errSSLPeerInsufficientSecurity";
      case -9836:
        return "errSSLPeerProtocolVersion";
      case -9835:
        return "errSSLPeerExportRestriction";
      case -9834:
        return "errSSLPeerDecryptError";
      case -9833:
        return "errSSLPeerDecodeError";
      case -9832:
        return "errSSLPeerAccessDenied";
      case -9831:
        return "errSSLPeerUnknownCA";
      case -9830:
        return "errSSLIllegalParam";
      case -9829:
        return "errSSLPeerCertUnknown";
      case -9828:
        return "errSSLPeerCertExpired";
      case -9827:
        return "errSSLPeerCertRevoked";
      case -9826:
        return "errSSLPeerUnsupportedCert";
      case -9825:
        return "errSSLPeerBadCert";
      case -9824:
        return "errSSLPeerHandshakeFail";
      case -9823:
        return "errSSLPeerDecompressFail";
      case -9822:
        return "errSSLPeerRecordOverflow";
      case -9821:
        return "errSSLPeerDecryptionFail";
      case -9820:
        return "errSSLPeerBadRecordMac";
      case -9819:
        return "errSSLPeerUnexpectedMsg";
      case -9818:
        return "errSSLBadCipherSuite";
      case -9817:
        return "errSSLBufferOverflow";
      case -9816:
        return "errSSLClosedNoNotify";
      case -9815:
        return "errSSLCertNotYetValid";
      case -9814:
        return "errSSLCertExpired";
      case -9813:
        return "errSSLNoRootCert";
      case -9812:
        return "errSSLUnknownRootCert";
      case -9811:
        return "errSSLModuleAttach";
      case -9810:
        return "errSSLInternal";
      case -9809:
        return "errSSLCrypto";
      case -9808:
        return "errSSLBadCert";
      case -9807:
        return "errSSLXCertChainInvalid";
      case -9806:
        return "errSSLClosedAbort";
      case -9805:
        return "errSSLClosedGraceful";
      case -9804:
        return "errSSLSessionNotFound";
      case -9803:
        return "errSSLWouldBlock";
      case -9802:
        return "errSSLFatalAlert";
      case -9801:
        return "errSSLNegotiation";
      case -9800:
        return "errSSLProtocol";
      default:
        if (a1 == -50)
        {
          result = "errSecParam";
        }
        else
        {
          if (a1)
            return "<unknown>";
          result = "noErr";
        }
        break;
    }
  }
  return result;
}

uint64_t eapmschapv2_init(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  _BYTE *v4;

  *a3 = 0;
  *a2 = 0;
  v4 = malloc_type_malloc(0x46CuLL, 0x1000040B413CCD7uLL);
  *(_QWORD *)a1 = v4;
  v4[104] = 0;
  *(_QWORD *)v4 = 0;
  *((_WORD *)v4 + 4) = 0;
  *((_DWORD *)v4 + 3) = *(_DWORD *)(a1 + 20);
  return 0;
}

uint64_t eapmschapv2_process(int **a1, uint64_t a2, char **a3, _DWORD *a4, _DWORD *a5)
{
  unsigned int *v6;
  unsigned int Length;
  unsigned int v11;
  NSObject *LogHandle;
  os_log_type_t v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  int v18;
  char *v19;
  unsigned int v20;
  BOOL v21;
  int v22;
  size_t v24;
  void *v25;
  char v26;
  char v27;
  char v28;
  char *v29;
  BOOL v30;
  int v31;
  uint64_t v32;
  char *v33;
  char v34;
  char v35;
  uint64_t v36;
  int v37;
  UInt8 *v39;
  UInt8 *v40;
  unsigned int v41;
  uint64_t v42;
  const __CFData *v43;
  const __CFData *v44;
  __int128 v45;
  char *v46;
  UInt8 *v47;
  const __CFString *v48;
  NSObject *v49;
  os_log_type_t v50;
  NSObject *v51;
  os_log_type_t v52;
  NSObject *v53;
  os_log_type_t v54;
  NSObject *v55;
  os_log_type_t v56;
  const __CFDictionary *v57;
  const __CFString *Value;
  UInt8 *v59;
  char v60;
  char v61;
  UInt8 *v62;
  unsigned int v63;
  void *v64;
  unsigned int *v65;
  __int128 v66;
  uint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  char *v70;
  NSObject *v71;
  os_log_type_t v72;
  int v73;
  int v75;
  void *v76;
  char *v77;
  UInt8 *v78;
  int v79;
  int v80;
  int v81;
  uint8_t buf[4];
  _BYTE v83[18];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v6 = (unsigned int *)*a1;
  *a4 = 0;
  *a5 = 0;
  *a3 = 0;
  if (*(_BYTE *)a2 != 1)
    goto LABEL_106;
  Length = EAPPacketGetLength(a2);
  v11 = Length;
  if (Length <= 8)
  {
    LogHandle = EAPLogGetLogHandle();
    v13 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v13))
    {
LABEL_100:
      v46 = 0;
      goto LABEL_101;
    }
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v83 = v11;
    *(_WORD *)&v83[4] = 2048;
    *(_QWORD *)&v83[6] = 9;
    v14 = "eapmschapv2_request: length %d < %ld";
    goto LABEL_5;
  }
  v18 = *(unsigned __int8 *)(a2 + 5);
  if (v18 == 4)
  {
    v79 = 0;
    v80 = 0;
    v19 = (char *)*a1;
    v20 = **a1;
    v21 = v20 > 5;
    v22 = (1 << v20) & 0x2A;
    if (v21 || v22 == 0)
      goto LABEL_100;
    v81 = 0;
    v24 = Length - 9;
    if (Length == 9)
    {
      v25 = 0;
    }
    else
    {
      v77 = v19;
      v25 = malloc_type_malloc(Length - 8, 0x6CB5F6F3uLL);
      memcpy(v25, (const void *)(a2 + 9), v11 - 9);
      *((_BYTE *)v25 + v24) = 0;
      v26 = mschap2_message_int32_attr((const char *)v25, (unsigned __int16)v24, "E=", &v81);
      if (mschap2_message_int32_attr((const char *)v25, (unsigned __int16)v24, "R=", &v80))
        v27 = v26 | 2;
      else
        v27 = v26;
      if (mschap2_message_int32_attr((const char *)v25, (unsigned __int16)v24, "V=", &v79))
        v28 = v27 | 8;
      else
        v28 = v27;
      v29 = strnstr((const char *)v25, "C=", v24);
      v30 = (unsigned __int16)v24 <= 0x22u || v29 == 0;
      v31 = !v30;
      if (!v30)
      {
        v75 = v31;
        v76 = v25;
        v32 = 0;
        buf[2] = 0;
        v33 = v29 + 3;
        do
        {
          *(_WORD *)buf = *(_WORD *)(v33 - 1);
          v77[v32++ + 56] = strtoul((const char *)buf, 0, 16);
          v33 += 2;
        }
        while (v32 != 16);
        v25 = v76;
        v31 = v75;
      }
      if (v31)
        v34 = v28 | 4;
      else
        v34 = v28;
      if (strnstr((const char *)v25, "M=", v24))
        v35 = v34 | 0x10;
      else
        v35 = v34;
      if ((v35 & 1) != 0)
      {
        v51 = EAPLogGetLogHandle();
        v52 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v51, v52))
        {
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)v83 = v81;
          *(_WORD *)&v83[4] = 1024;
          *(_DWORD *)&v83[6] = v80;
          *(_WORD *)&v83[10] = 1024;
          *(_DWORD *)&v83[12] = v79;
          _os_log_impl(&dword_206440000, v51, v52, "MSCHAPv2 Error = %d, Retry = %d, Version = %d", buf, 0x14u);
        }
        if ((v35 & 4) != 0)
        {
          if (v81 == 648)
          {
            v19 = v77;
            if (v79 != 3 || !a1[8])
              goto LABEL_56;
            if (*((_DWORD *)v77 + 3) != *((_DWORD *)a1 + 5))
            {
              v57 = (const __CFDictionary *)a1[10];
              if (v57)
              {
                Value = (const __CFString *)CFDictionaryGetValue(v57, CFSTR("NewPassword"));
                if (Value)
                {
                  v59 = my_CFStringToCString(Value, 0x8000100u);
                  if (v59)
                  {
                    v60 = *(_BYTE *)(a2 + 1);
                    v61 = *(_BYTE *)(a2 + 6) + 1;
                    v62 = v59;
                    v63 = strlen((const char *)v59);
                    v64 = v25;
                    v65 = (unsigned int *)*a1;
                    v46 = EAPPacketCreate((char *)*a1 + 105, 1024, 2, v60, 26, 0, 586, 0);
                    MSChapFillWithRandom(v65 + 4, 0x10u);
                    MSChap2(v65 + 14, v65 + 4, (char *)a1[5], v62, v63, (uint64_t)(v65 + 8));
                    v46[5] = 7;
                    v46[6] = v61;
                    *(_WORD *)(v46 + 7) = 18946;
                    *(_OWORD *)(v46 + 541) = *((_OWORD *)v65 + 1);
                    *(_QWORD *)(v46 + 557) = 0;
                    v66 = *((_OWORD *)v65 + 2);
                    v67 = *((_QWORD *)v65 + 6);
                    v25 = v64;
                    *(_QWORD *)(v46 + 581) = v67;
                    *(_OWORD *)(v46 + 565) = v66;
                    NTPasswordBlockEncryptNewPasswordWithOldHash(v62, v63, (UInt8 *)a1[8], *((_DWORD *)a1 + 18), v46 + 9);
                    NTPasswordHashEncryptOldWithNew(v62, v63, (UInt8 *)a1[8], *((_DWORD *)a1 + 18), (uint64_t)(v46 + 525));
                    *(_WORD *)(v46 + 589) = 0;
                    free(v62);
                    *(_DWORD *)v77 = 3;
                    goto LABEL_57;
                  }
                }
              }
            }
            v46 = 0;
            v77[9] = 1;
          }
          else
          {
            v19 = v77;
            if (!v80)
              goto LABEL_56;
            if (*((_DWORD *)v77 + 3) != *((_DWORD *)a1 + 5) && a1[8])
            {
              v70 = EAPMSCHAPv2ResponsePacketCreate((uint64_t *)a1, *(_BYTE *)(a2 + 1), *(_BYTE *)(a2 + 6) + 1, 0);
              if (v70)
              {
                v46 = v70;
                *(_DWORD *)v77 = 1;
                goto LABEL_57;
              }
              goto LABEL_56;
            }
            v46 = 0;
            v77[8] = 1;
          }
          *a4 = 3;
          goto LABEL_57;
        }
        v53 = EAPLogGetLogHandle();
        v54 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v53, v54))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_206440000, v53, v54, "MSCHAPv2 Failure Request does not contain challenge", buf, 2u);
        }
      }
      v19 = v77;
    }
LABEL_56:
    *(_QWORD *)v19 = 0x200000005;
    *a4 = 1;
    v46 = EAPPacketCreate(v19 + 105, 1024, 2, *(_BYTE *)(a2 + 1), 26, 0, 4, 0);
    v46[5] = 4;
    v46[6] = *(_BYTE *)(a2 + 6);
    *(_WORD *)(v46 + 7) = 1024;
LABEL_57:
    if (!v25)
      goto LABEL_101;
    v47 = (UInt8 *)v25;
LABEL_78:
    free(v47);
    goto LABEL_101;
  }
  if (v18 == 3)
  {
    if (Length <= 0x32)
    {
      LogHandle = EAPLogGetLogHandle();
      v13 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v13))
        goto LABEL_100;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v83 = v11;
      *(_WORD *)&v83[4] = 2048;
      *(_QWORD *)&v83[6] = 51;
      v14 = "length %d < %ld";
LABEL_5:
      v15 = LogHandle;
      v16 = v13;
      v17 = 18;
LABEL_6:
      _os_log_impl(&dword_206440000, v15, v16, v14, buf, v17);
      goto LABEL_100;
    }
    v36 = (uint64_t)*a1;
    v37 = **a1;
    if (v37 == 1 || v37 == 4)
    {
      v39 = 0;
      v40 = (UInt8 *)a1[8];
      v41 = *((_DWORD *)a1 + 18);
    }
    else
    {
      if (v37 != 3)
        goto LABEL_100;
      v48 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1[10], CFSTR("NewPassword"));
      if (!v48)
      {
        v71 = EAPLogGetLogHandle();
        v72 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v71, v72))
          goto LABEL_100;
        *(_WORD *)buf = 0;
        v14 = "NewPassword is missing";
        v15 = v71;
        v16 = v72;
        v17 = 2;
        goto LABEL_6;
      }
      v40 = my_CFStringToCString(v48, 0x8000100u);
      v41 = strlen((const char *)v40);
      v39 = v40;
    }
    if (MSChap2AuthResponseValid(v40, v41, (const void *)(v36 + 32), (const void *)(v36 + 16), (const void *)(v36 + 56), (char *)a1[5], (const void *)(a2 + 9)))
    {
      v78 = v39;
      if (*(_DWORD *)v36 == 3)
      {
        v49 = EAPLogGetLogHandle();
        v50 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v49, v50))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_206440000, v49, v50, "eapmschapv2_success_request: change password succeeded", buf, 2u);
        }
      }
      MSChap2_MPPEGetMasterKey(v40, v41, (const void *)(v36 + 32), buf);
      MSChap2_MPPEGetAsymetricStartKey(buf, (void *)(v36 + 72), 16, 1, 1);
      MSChap2_MPPEGetAsymetricStartKey(buf, (void *)(v36 + 88), 16, 0, 1);
      *(_BYTE *)(v36 + 104) = 1;
      *(_DWORD *)v36 = 4;
      v46 = EAPPacketCreate((char *)(v36 + 105), 1024, 2, *(_BYTE *)(a2 + 1), 26, 0, 1, 0);
      v46[5] = 3;
      v39 = v78;
    }
    else
    {
      v55 = EAPLogGetLogHandle();
      v56 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v55, v56))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_206440000, v55, v56, "eapmschapv2_success_request: invalid server auth response", buf, 2u);
      }
      v46 = 0;
      *(_QWORD *)v36 = 0x200000005;
      *a4 = 1;
    }
    if (!v39)
      goto LABEL_101;
    v47 = v39;
    goto LABEL_78;
  }
  if (v18 != 1)
    goto LABEL_100;
  if (Length <= 0x19)
  {
    LogHandle = EAPLogGetLogHandle();
    v13 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v13))
      goto LABEL_100;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v83 = v11;
    *(_WORD *)&v83[4] = 2048;
    *(_QWORD *)&v83[6] = 26;
    v14 = "eapmschapv2_challenge: length %d < %ld";
    goto LABEL_5;
  }
  v42 = (uint64_t)*a1;
  *(_BYTE *)(v42 + 104) = 0;
  *(_QWORD *)v42 = 0;
  *(_WORD *)(v42 + 8) = 0;
  if (a1[8])
  {
    v43 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a1[10], CFSTR("EAPMSCHAPv2ServerChallenge"));
    if (v43)
    {
      v44 = v43;
      if (CFDataGetLength(v43) != 16)
      {
        v68 = EAPLogGetLogHandle();
        v69 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v68, v69))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v83 = CFDataGetLength(v44);
          *(_WORD *)&v83[8] = 2048;
          *(_QWORD *)&v83[10] = 16;
          _os_log_impl(&dword_206440000, v68, v69, "eapmschapv2_challenge: internal error %ld != %ld", buf, 0x16u);
        }
        v46 = 0;
        *a4 = 8;
        *(_DWORD *)(v42 + 4) = 2;
        goto LABEL_101;
      }
      v45 = *(_OWORD *)CFDataGetBytePtr(v44);
    }
    else
    {
      v45 = *(_OWORD *)(a2 + 10);
    }
    *(_OWORD *)(v42 + 56) = v45;
    v46 = EAPMSCHAPv2ResponsePacketCreate((uint64_t *)a1, *(_BYTE *)(a2 + 1), *(_BYTE *)(a2 + 6), a4);
    if (v46)
      *(_DWORD *)v42 = 1;
  }
  else
  {
    v46 = 0;
    *(_BYTE *)(v42 + 8) = 1;
    *a4 = 3;
  }
LABEL_101:
  *a3 = v46;
  if (*v6 == 4)
  {
    v73 = 1;
    goto LABEL_105;
  }
  if (*v6 == 5)
  {
    v73 = 2;
LABEL_105:
    v6[1] = v73;
  }
LABEL_106:
  v6[3] = *((_DWORD *)a1 + 5);
  return v6[1];
}

uint64_t eapmschapv2_publish_props()
{
  return 0;
}

void eapmschapv2_free_packet(uint64_t a1, void *a2)
{
  if ((void *)(*(_QWORD *)a1 + 105) != a2)
    free(a2);
}

double MSChap2_MPPEGetMasterKey(UInt8 *a1, unsigned int a2, const void *a3, _OWORD *a4)
{
  CC_LONG v6;
  double result;
  UInt8 data[512];
  unsigned __int8 v9[16];
  unsigned __int8 v10[16];
  int v11;
  CC_SHA1_CTX md;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = password_to_unicode(a1, a2, data);
  CC_MD4(data, v6, (unsigned __int8 *)&md);
  CC_MD4(&md, 0x10u, v9);
  memset(&md, 0, sizeof(md));
  memset(v10, 0, sizeof(v10));
  v11 = 0;
  CC_SHA1_Init(&md);
  CC_SHA1_Update(&md, v9, 0x10u);
  CC_SHA1_Update(&md, a3, 0x18u);
  CC_SHA1_Update(&md, "This is the MPPE Master Key", 0x1Bu);
  CC_SHA1_Final(v10, &md);
  result = *(double *)v10;
  *a4 = *(_OWORD *)v10;
  return result;
}

void *MSChap2_MPPEGetAsymetricStartKey(const void *a1, void *a2, int a3, int a4, int a5)
{
  const void *v8;
  int v9;
  CC_SHA1_CTX v11;
  unsigned __int8 md[8];
  uint64_t v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  memset(&v11, 0, sizeof(v11));
  if (a4 != a5)
    v8 = &Magic2;
  else
    v8 = &Magic3;
  *(_QWORD *)md = 0;
  v13 = 0;
  v14 = 0;
  CC_SHA1_Init(&v11);
  CC_SHA1_Update(&v11, a1, 0x10u);
  CC_SHA1_Update(&v11, &SHSpad1, 0x28u);
  CC_SHA1_Update(&v11, v8, 0x54u);
  CC_SHA1_Update(&v11, &SHSpad2, 0x28u);
  CC_SHA1_Final(md, &v11);
  if (a3 >= 16)
    v9 = 16;
  else
    v9 = a3;
  return memcpy(a2, md, v9);
}

uint64_t eapmschapv2_session_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = 0;
  if (!*(_BYTE *)(v2 + 104))
    return 0;
  *a2 = 32;
  return v2 + 72;
}

BOOL PACTLVAttributeListParse(_QWORD *a1, unsigned __int16 *a2, uint64_t a3, __CFString *a4)
{
  uint64_t v5;
  unsigned int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  const char *v12;
  BOOL v13;
  const char *v14;
  _QWORD *v15;
  char v16;
  _BOOL8 result;
  NSObject *LogHandle;
  os_log_type_t v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (!(_DWORD)a3)
    return 1;
  v5 = a3;
  v22 = a1 + 6;
  v23 = a1 + 5;
  v24 = a1 + 3;
  v25 = a1 + 2;
  v20 = a1 + 1;
  v21 = a1 + 4;
  while (1)
  {
    if (v5 <= 3)
    {
      if (a4)
        goto LABEL_44;
      LogHandle = EAPLogGetLogHandle();
      v19 = _SC_syslog_os_log_mapping();
      result = os_log_type_enabled(LogHandle, v19);
      if (!result)
        return result;
      goto LABEL_48;
    }
    v8 = a2[1];
    v9 = __rev16(v8);
    if (v9 + 4 > (unint64_t)(int)v5)
      break;
    v10 = (int)bswap32(*a2) >> 16;
    v11 = v10 & 0x3FFF;
    if (a4)
    {
      v12 = "Unknown";
      if ((v11 - 1) <= 9)
        v12 = off_24BF0D008[v11 - 1];
      v13 = v10 < 0;
      v14 = (const char *)&unk_206473DB9;
      if (v13)
        v14 = " [mandatory]";
      CFStringAppendFormat(a4, 0, CFSTR("%s PACTLV Attribute (type=%d) Length=%d%s\n"), v12, v11, v9, v14);
      print_data_cfstr(a4, (uint64_t)(a2 + 2), v9);
    }
    switch((int)v11)
    {
      case 1:
        if (a1)
        {
          if (v8)
          {
            v15 = a1;
            if (!*a1)
              goto LABEL_38;
          }
        }
        break;
      case 2:
        if (a1 && v8)
        {
          v15 = v20;
          goto LABEL_37;
        }
        break;
      case 4:
        if (a1 && v8)
        {
          v15 = v21;
          goto LABEL_37;
        }
        break;
      case 5:
        if (a1 && v8)
        {
          v15 = v22;
          goto LABEL_37;
        }
        break;
      case 7:
        if (a1 && v8)
        {
          v15 = v23;
          goto LABEL_37;
        }
        break;
      case 9:
        if (!a1 || !*v25)
        {
          v16 = PACTLVAttributeListParse(a1, a2 + 2, v9, a4);
          if (a1)
          {
            if (v8)
            {
              v15 = v25;
              if ((v16 & 1) != 0)
                goto LABEL_38;
            }
          }
        }
        break;
      case 10:
        if (v9 < 2)
          return 0;
        if (a1)
        {
          v15 = v24;
LABEL_37:
          if (!*v15)
LABEL_38:
            *v15 = a2;
        }
        break;
      default:
        break;
    }
    a2 = (unsigned __int16 *)((char *)a2 + v9 + 4);
    v5 = (v5 - (v9 + 4));
    if (!(_DWORD)v5)
      return 1;
  }
  if (a4)
  {
LABEL_44:
    CFStringAppendFormat(a4, 0, CFSTR("EAP-FAST: TLV attribute is too short (%d < %d)"), v5, 4);
    return 0;
  }
  LogHandle = EAPLogGetLogHandle();
  v19 = _SC_syslog_os_log_mapping();
  result = os_log_type_enabled(LogHandle, v19);
  if (!result)
    return result;
LABEL_48:
  *(_DWORD *)buf = 67109376;
  v27 = v5;
  v28 = 1024;
  v29 = 4;
  _os_log_impl(&dword_206440000, LogHandle, v19, "EAP-FAST: TLV attribute is too short (%d < %d)", buf, 0xEu);
  return 0;
}

BOOL save_pac(uint64_t *a1)
{
  CFMutableDictionaryRef Mutable;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  UInt8 *v6;
  CFIndex v7;
  CFPropertyListRef v8;
  CFMutableArrayRef MutableCopy;
  int pac;
  int v11;
  const __CFDictionary *ValueAtIndex;
  void *v13;
  void *v14;
  CFDataRef v15;
  int v16;
  int v17;
  uint64_t v18;
  const UInt8 *v19;
  CFIndex v20;
  int UniqueWithAccess;
  int v22;
  NSObject *v23;
  os_log_type_t v24;
  const char *v25;
  const __CFString *v26;
  const __CFString *v27;
  _BOOL8 v28;
  NSObject *LogHandle;
  os_log_type_t v30;
  const char *v31;
  NSObject *v32;
  os_log_type_t v33;
  CFMutableDictionaryRef v35;
  const void *v36;
  CFPropertyListRef v37;
  void *v38;
  void *value;
  CFDataRef v40;
  const void *v41;
  const void *v42;
  const void *v43;
  const void *v44;
  uint64_t v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v38 = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v35 = Mutable;
  dict_add_tlv_as_data(Mutable, CFSTR("AuthorityID"), a1[4], 0);
  v3 = a1[5];
  if (v3)
    dict_add_tlv_as_string(Mutable, CFSTR("AuthorityIDInfo"), v3);
  v4 = a1[6];
  if (v4)
    dict_add_tlv_as_string(Mutable, CFSTR("InitiatorID"), v4);
  dict_add_tlv_as_data(Mutable, CFSTR("PACOpaque"), a1[1], 1);
  dict_add_tlv_as_data(Mutable, CFSTR("PACInfo"), a1[2], 0);
  v5 = a1[6];
  if (v5)
  {
    v6 = (UInt8 *)(v5 + 4);
    v7 = bswap32(*(unsigned __int16 *)(v5 + 2)) >> 16;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = pac_list_copy();
  v36 = v8;
  if (!v8)
  {
    MutableCopy = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    v37 = MutableCopy;
    goto LABEL_15;
  }
  MutableCopy = CFArrayCreateMutableCopy(0, 0, (CFArrayRef)v8);
  v37 = MutableCopy;
  pac = pac_list_find_pac(MutableCopy, (const void *)(a1[4] + 4), bswap32(*(unsigned __int16 *)(a1[4] + 2)) >> 16, v6, v7);
  if (pac == -1)
  {
LABEL_15:
    v11 = -1;
    goto LABEL_16;
  }
  v11 = pac;
  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(MutableCopy, pac);
  v13 = (void *)CFDictionaryGetValue(ValueAtIndex, CFSTR("PACKeyKeychainItemID"));
  v38 = v13;
  if (v13)
  {
    v14 = v13;
    CFDictionarySetValue(Mutable, CFSTR("PACKeyKeychainItemID"), v13);
    v15 = CFDataCreate(0, (const UInt8 *)(*a1 + 4), bswap32(*(unsigned __int16 *)(*a1 + 2)) >> 16);
    v40 = v15;
    v16 = EAPSecKeychainPasswordItemSet(0, v14, v15);
    if (v16 == -25300)
    {
      v44 = 0;
      v45 = 0;
      v42 = 0;
      v43 = 0;
      v41 = 0;
      pac_keychain_init_items(v6, v7, (CFDataRef *)&v41, &v45, (CFDataRef *)&v44, (CFDataRef *)&v42);
      v17 = EAPSecKeychainPasswordItemCreateWithAccess(0, v45, v14, v42, v44, v41, v15);
      if (v17)
      {
        LogHandle = EAPLogGetLogHandle();
        v30 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(LogHandle, v30))
        {
          v31 = EAPSecurityErrorString(v17);
          *(_DWORD *)buf = 136315394;
          v47 = v31;
          v48 = 1024;
          v49 = v17;
          _os_log_impl(&dword_206440000, LogHandle, v30, "EAP-FAST: EAPSecKeychainPasswordItemCreateWithAccess failed,%s (%d)", buf, 0x12u);
        }
      }
      my_CFRelease(&v43);
      my_CFRelease((const void **)&v45);
      my_CFRelease(&v44);
      my_CFRelease(&v42);
      my_CFRelease(&v41);
    }
    else
    {
      v17 = v16;
      if (!v16)
      {
        my_CFRelease((const void **)&v40);
        goto LABEL_21;
      }
      v32 = EAPLogGetLogHandle();
      v33 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v32, v33))
      {
        *(_DWORD *)buf = 136315394;
        v47 = EAPSecurityErrorString(v17);
        v48 = 1024;
        v49 = v17;
        _os_log_impl(&dword_206440000, v32, v33, "EAP-FAST: EAPSecKeychainPasswordItemSet failed, %s (%d)", buf, 0x12u);
      }
    }
    my_CFRelease((const void **)&v40);
    if (!v17)
      goto LABEL_21;
LABEL_31:
    v28 = 0;
    goto LABEL_32;
  }
LABEL_16:
  v18 = *a1;
  v19 = (const UInt8 *)(*a1 + 4);
  v20 = bswap32(*(unsigned __int16 *)(v18 + 2)) >> 16;
  v44 = 0;
  v45 = 0;
  v42 = 0;
  v43 = 0;
  v41 = 0;
  value = 0;
  pac_keychain_init_items(v6, v7, (CFDataRef *)&v41, &v45, (CFDataRef *)&v44, (CFDataRef *)&v42);
  v40 = CFDataCreate(0, v19, v20);
  UniqueWithAccess = EAPSecKeychainPasswordItemCreateUniqueWithAccess(0, v45, v42, v44, v41, v40, (CFStringRef *)&value);
  if (UniqueWithAccess)
  {
    v22 = UniqueWithAccess;
    v23 = EAPLogGetLogHandle();
    v24 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = EAPSecurityErrorString(v22);
      *(_DWORD *)buf = 136315394;
      v47 = v25;
      v48 = 1024;
      v49 = v22;
      _os_log_impl(&dword_206440000, v23, v24, "EAP-FAST: EAPSecKeychainPasswordItemCreateUniqueWithAccess failed,%s (%d)", buf, 0x12u);
    }
  }
  my_CFRelease(&v43);
  my_CFRelease((const void **)&v45);
  my_CFRelease(&v44);
  my_CFRelease(&v42);
  my_CFRelease(&v41);
  my_CFRelease((const void **)&v40);
  v38 = value;
  if (!value)
    goto LABEL_31;
  CFDictionarySetValue(Mutable, CFSTR("PACKeyKeychainItemID"), value);
  my_CFRelease((const void **)&v38);
  if (v11 == -1)
  {
    CFArrayAppendValue(MutableCopy, Mutable);
    goto LABEL_23;
  }
LABEL_21:
  CFArraySetValueAtIndex(MutableCopy, v11, Mutable);
LABEL_23:
  v26 = (const __CFString *)*MEMORY[0x24BDBD590];
  v27 = (const __CFString *)*MEMORY[0x24BDBD570];
  CFPreferencesSetValue(CFSTR("PACList"), v37, CFSTR("com.apple.network.eapclient.eapfast"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  v28 = CFPreferencesSynchronize(CFSTR("com.apple.network.eapclient.eapfast"), v26, v27) != 0;
LABEL_32:
  my_CFRelease((const void **)&v35);
  my_CFRelease(&v36);
  my_CFRelease(&v37);
  return v28;
}

void dict_add_tlv_as_data(__CFDictionary *a1, const void *a2, uint64_t a3, int a4)
{
  uint64_t v6;
  const UInt8 *v7;
  CFDataRef v8;

  v6 = 4;
  if (a4)
  {
    v7 = (const UInt8 *)a3;
  }
  else
  {
    v6 = 0;
    v7 = (const UInt8 *)(a3 + 4);
  }
  v8 = CFDataCreate(0, v7, v6 + (bswap32(*(unsigned __int16 *)(a3 + 2)) >> 16));
  CFDictionarySetValue(a1, a2, v8);
  my_CFRelease((const void **)&v8);
}

void dict_add_tlv_as_string(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  CFStringRef v5;

  v5 = CFStringCreateWithBytes(0, (const UInt8 *)(a3 + 4), bswap32(*(unsigned __int16 *)(a3 + 2)) >> 16, 0x8000100u, 1u);
  CFDictionarySetValue(a1, a2, v5);
  my_CFRelease((const void **)&v5);
}

uint64_t EAPSecKeychainPasswordItemSet(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  const __CFDictionary *v5;
  uint64_t v6;
  const CFDictionaryKeyCallBacks *v7;
  const CFDictionaryValueCallBacks *v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  CFTypeRef result;
  void *v13;
  void *values[3];
  void *keys[4];

  keys[3] = *(void **)MEMORY[0x24BDAC8D0];
  v13 = a3;
  v4 = (void *)*MEMORY[0x24BDE9128];
  keys[0] = *(void **)MEMORY[0x24BDE9220];
  keys[1] = v4;
  keys[2] = *(void **)MEMORY[0x24BDE94C8];
  result = 0;
  values[0] = *(void **)MEMORY[0x24BDE9230];
  values[1] = a2;
  values[2] = *(void **)MEMORY[0x24BDBD270];
  v5 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v6 = SecItemCopyMatching(v5, &result);
  CFRelease(v5);
  if (!(_DWORD)v6)
  {
    if (result && CFEqual(a3, result))
    {
      v6 = 0;
    }
    else
    {
      v7 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
      v8 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
      v9 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v10 = CFDictionaryCreate(0, MEMORY[0x24BDE9550], (const void **)&v13, 1, v7, v8);
      v6 = SecItemUpdate(v9, v10);
      CFRelease(v9);
      CFRelease(v10);
    }
  }
  my_CFRelease(&result);
  return v6;
}

CFDataRef pac_keychain_init_items(UInt8 *bytes, CFIndex length, CFDataRef *a3, _QWORD *a4, CFDataRef *a5, CFDataRef *a6)
{
  const __CFAllocator *v8;
  CFDataRef result;

  *a4 = 0;
  *a3 = CFDataCreate(0, bytes, length);
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD258];
  *a6 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)"802.1X EAP-FAST", 15, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)"PAC-Key", 7, v8);
  *a5 = result;
  return result;
}

uint64_t EAPSecKeychainPasswordItemCreateWithAccess(uint64_t a1, uint64_t a2, const void *a3, const void *a4, const void *a5, const void *a6, const void *a7)
{
  __CFDictionary *Mutable;
  uint64_t v13;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9230]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDE9128], a3);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDE8F60], (const void *)*MEMORY[0x24BDE8F68]);
  if (a4)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDE90A0], a4);
  if (a5)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDE8FF0], a5);
  if (a6)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDE8FA8], a6);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDE9550], a7);
  v13 = SecItemAdd(Mutable, 0);
  CFRelease(Mutable);
  return v13;
}

void make_pac_ack(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *LogHandle;
  os_log_type_t v6;
  int v7;
  NSObject *v8;
  os_log_type_t v9;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = *(int *)(a1 + 12);
  if (*(_DWORD *)(a1 + 8) - (int)v3 <= 9)
  {
    LogHandle = EAPLogGetLogHandle();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v6))
    {
      v7 = *(_DWORD *)(a1 + 8) - *(_DWORD *)(a1 + 12);
      v10[0] = 67109376;
      v10[1] = 10;
      v11 = 1024;
      v12 = v7;
      _os_log_impl(&dword_206440000, LogHandle, v6, "EAP-FAST: BufferAdvanceWritePtr failed: %d > %d", (uint8_t *)v10, 0xEu);
    }
    v8 = EAPLogGetLogHandle();
    v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v9))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_206440000, v8, v9, "EAP-FAST: make_pac_ack(): buffer too small", (uint8_t *)v10, 2u);
    }
  }
  else
  {
    v4 = *(_QWORD *)a1 + v3;
    *(_DWORD *)(a1 + 12) = v3 + 10;
    *(_QWORD *)v4 = 0x200080006000B00;
    *(_WORD *)(v4 + 8) = __rev16(a2);
  }
}

void eapmschapv2_free(void **a1)
{
  void *v2;

  v2 = *a1;
  if (v2)
  {
    free(v2);
    *a1 = 0;
  }
}

CFStringRef EAPOLControlKeyCreate(char *cStr)
{
  CFStringRef NetworkInterfaceEntity;
  const __CFString *v3;

  v3 = CFStringCreateWithCString(0, cStr, 0x600u);
  NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, (CFStringRef)*MEMORY[0x24BDF59B0], v3, (CFStringRef)*MEMORY[0x24BDF59E0]);
  my_CFRelease((const void **)&v3);
  return NetworkInterfaceEntity;
}

CFMutableStringRef EAPOLControlKeyCopyInterface(const __CFString *a1)
{
  const __CFString *v2;
  CFMutableStringRef MutableCopy;
  CFIndex location;
  CFIndex v5;
  CFRange v7;
  CFRange v8;

  if (!CFStringHasSuffix(a1, (CFStringRef)*MEMORY[0x24BDF59E0]))
    return 0;
  v2 = (const __CFString *)EAPOLControlKeyCopyInterface_prefix;
  if (!EAPOLControlKeyCopyInterface_prefix)
  {
    v2 = SCDynamicStoreKeyCreate(0, CFSTR("%@/%@/%@/"), *MEMORY[0x24BDF59B0], *MEMORY[0x24BDF59A0], *MEMORY[0x24BDF5998]);
    EAPOLControlKeyCopyInterface_prefix = (uint64_t)v2;
  }
  if (!CFStringHasPrefix(a1, v2))
    return 0;
  MutableCopy = CFStringCreateMutableCopy(0, 0, a1);
  if (MutableCopy)
  {
    v7.length = CFStringGetLength(v2);
    v7.location = 0;
    CFStringDelete(MutableCopy, v7);
    location = CFStringFind(MutableCopy, CFSTR("/"), 0).location;
    if (location != -1)
    {
      v5 = location;
      v8.length = CFStringGetLength(MutableCopy) - location;
      v8.location = v5;
      CFStringDelete(MutableCopy, v8);
      return MutableCopy;
    }
    CFRelease(MutableCopy);
    return 0;
  }
  return MutableCopy;
}

uint64_t EAPOLControlCopyStateAndStatus(uint64_t a1, _DWORD *a2, const __CFData **a3)
{
  mach_error_t v5;
  int v6;
  unsigned int v8;
  UInt8 *bytes;
  mach_error_t v10;
  uint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  memset(v12, 0, sizeof(v12));
  v11 = 0;
  v10 = 0;
  bytes = 0;
  v8 = 0;
  *a3 = 0;
  if (!get_server_port((uint64_t)&v11, &v10))
    goto LABEL_4;
  __strlcpy_chk();
  v5 = eapolcontroller_copy_status(v11, v12, &bytes, &v8, a2, (_DWORD *)&v11 + 1);
  if (v5)
  {
    mach_error("eapolcontroller_copy_status failed", v5);
LABEL_4:
    v6 = 6;
LABEL_5:
    HIDWORD(v11) = v6;
    return HIDWORD(v11);
  }
  if (bytes)
  {
    *a3 = my_CFPropertyListCreateWithBytePtrAndLength(bytes, v8);
    MEMORY[0x20BCF6228](*MEMORY[0x24BDAEC58], bytes, v8);
    if (!*a3)
    {
      v6 = 12;
      goto LABEL_5;
    }
  }
  return HIDWORD(v11);
}

BOOL get_server_port(uint64_t a1, mach_error_t *a2)
{
  mach_error_t v3;
  NSObject *LogHandle;
  os_log_type_t v5;
  _BOOL8 result;
  char *v7;
  int v8;
  char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = bootstrap_look_up2();
  *a2 = v3;
  if (!v3)
    return 1;
  LogHandle = EAPLogGetLogHandle();
  v5 = _SC_syslog_os_log_mapping();
  result = os_log_type_enabled(LogHandle, v5);
  if (result)
  {
    v7 = mach_error_string(*a2);
    v8 = 136315138;
    v9 = v7;
    _os_log_impl(&dword_206440000, LogHandle, v5, "eapolcontroller_server_port failed, %s", (uint8_t *)&v8, 0xCu);
    return 0;
  }
  return result;
}

uint64_t eapolcontroller_copy_status(int a1, _OWORD *a2, _QWORD *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6)
{
  __int128 v11;
  mach_port_name_t reply_port;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v18;
  _BYTE rcv_name[64];
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  memset(&rcv_name[16], 0, 48);
  v20 = 0;
  *(_OWORD *)rcv_name = 0u;
  *(_QWORD *)&rcv_name[20] = *MEMORY[0x24BDAC470];
  v11 = a2[1];
  *(_OWORD *)&rcv_name[28] = *a2;
  *(_OWORD *)&rcv_name[44] = v11;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = reply_port;
  v18 = 5395;
  *(_QWORD *)&rcv_name[12] = 0x55F500000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v18);
    reply_port = *(_DWORD *)&rcv_name[8];
  }
  v13 = mach_msg((mach_msg_header_t *)&v18, 3, 0x40u, 0x48u, reply_port, 0, 0);
  v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  else
  {
    if (!(_DWORD)v13)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v14 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 22105)
      {
        if (v18 < 0)
        {
          v14 = 4294966996;
          if (*(_DWORD *)&rcv_name[20] == 1
            && *(_DWORD *)rcv_name == 64
            && !*(_DWORD *)&rcv_name[4]
            && rcv_name[35] == 1)
          {
            v15 = *(_DWORD *)&rcv_name[36];
            if (*(_DWORD *)&rcv_name[36] == *(_DWORD *)&rcv_name[48])
            {
              v14 = 0;
              *a3 = *(_QWORD *)&rcv_name[24];
              *a4 = v15;
              v16 = *(_DWORD *)&rcv_name[56];
              *a5 = *(_DWORD *)&rcv_name[52];
              *a6 = v16;
              return v14;
            }
          }
        }
        else if (*(_DWORD *)rcv_name == 36)
        {
          v14 = 4294966996;
          if (*(_DWORD *)&rcv_name[28])
          {
            if (*(_DWORD *)&rcv_name[4])
              v14 = 4294966996;
            else
              v14 = *(unsigned int *)&rcv_name[28];
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
      mach_msg_destroy((mach_msg_header_t *)&v18);
      return v14;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  return v14;
}

uint64_t EAPOLClientItemIDGetTypeID()
{
  pthread_once(&__EAPOLClientItemIDRegisterClass_initialized, (void (*)(void))__EAPOLClientItemIDInitialize);
  return __kEAPOLClientItemIDTypeID;
}

uint64_t EAPOLClientItemIDCreateWithProfileID(const void *a1)
{
  uint64_t Instance;
  uint64_t v3;

  CFGetAllocator(a1);
  pthread_once(&__EAPOLClientItemIDRegisterClass_initialized, (void (*)(void))__EAPOLClientItemIDInitialize);
  Instance = _CFRuntimeCreateInstance();
  v3 = Instance;
  if (Instance)
  {
    *(_DWORD *)(Instance + 16) = 2;
    *(_QWORD *)(Instance + 24) = CFRetain(a1);
  }
  return v3;
}

uint64_t EAPOLClientItemIDCreateWithWLANSSID(const void *a1)
{
  uint64_t Instance;
  uint64_t v3;

  CFGetAllocator(a1);
  pthread_once(&__EAPOLClientItemIDRegisterClass_initialized, (void (*)(void))__EAPOLClientItemIDInitialize);
  Instance = _CFRuntimeCreateInstance();
  v3 = Instance;
  if (Instance)
  {
    *(_DWORD *)(Instance + 16) = 1;
    *(_QWORD *)(Instance + 24) = CFRetain(a1);
  }
  return v3;
}

uint64_t EAPOLClientItemIDCreateWithWLANDomain(const void *a1)
{
  uint64_t Instance;
  uint64_t v3;

  CFGetAllocator(a1);
  pthread_once(&__EAPOLClientItemIDRegisterClass_initialized, (void (*)(void))__EAPOLClientItemIDInitialize);
  Instance = _CFRuntimeCreateInstance();
  v3 = Instance;
  if (Instance)
  {
    *(_DWORD *)(Instance + 16) = 5;
    *(_QWORD *)(Instance + 24) = CFRetain(a1);
  }
  return v3;
}

uint64_t EAPOLClientItemIDCreateWithProfile(const void *a1)
{
  uint64_t Instance;
  uint64_t v3;

  CFGetAllocator(a1);
  pthread_once(&__EAPOLClientItemIDRegisterClass_initialized, (void (*)(void))__EAPOLClientItemIDInitialize);
  Instance = _CFRuntimeCreateInstance();
  v3 = Instance;
  if (Instance)
  {
    *(_DWORD *)(Instance + 16) = 3;
    CFRetain(a1);
    *(_QWORD *)(v3 + 24) = a1;
  }
  return v3;
}

uint64_t EAPOLClientItemIDCreateDefault()
{
  uint64_t result;

  pthread_once(&__EAPOLClientItemIDRegisterClass_initialized, (void (*)(void))__EAPOLClientItemIDInitialize);
  result = _CFRuntimeCreateInstance();
  if (result)
    *(_DWORD *)(result + 16) = 4;
  return result;
}

uint64_t EAPOLClientItemIDGetProfileID(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16);
  if (v1 == 3)
    return EAPOLClientProfileGetID(*(_QWORD *)(a1 + 24));
  if (v1 == 2)
    return *(_QWORD *)(a1 + 24);
  return 0;
}

uint64_t EAPOLClientItemIDGetWLANSSID(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16);
  if (v1 == 3)
    return EAPOLClientProfileGetWLANSSIDAndSecurityType(*(_QWORD *)(a1 + 24), 0);
  if (v1 == 1)
    return *(_QWORD *)(a1 + 24);
  return 0;
}

uint64_t EAPOLClientItemIDGetProfile(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 16) == 3)
    return *(_QWORD *)(a1 + 24);
  else
    return 0;
}

CFDictionaryRef EAPOLClientItemIDCopyDictionary(uint64_t a1)
{
  int v2;
  const void *ID;
  __CFString *v4;
  const void *v5;
  const void *v7;
  void *keys;

  v2 = *(_DWORD *)(a1 + 16);
  if (v2 == 3)
  {
    ID = (const void *)EAPOLClientProfileGetID(*(_QWORD *)(a1 + 24));
    if (ID)
      goto LABEL_4;
  }
  else
  {
    if (v2 != 2)
      goto LABEL_7;
    ID = *(const void **)(a1 + 24);
    if (ID)
    {
LABEL_4:
      v4 = CFSTR("ProfileID");
LABEL_11:
      v7 = ID;
      keys = v4;
      return CFDictionaryCreate(0, (const void **)&keys, &v7, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    }
  }
  v2 = *(_DWORD *)(a1 + 16);
LABEL_7:
  if (v2 == 3)
  {
    ID = (const void *)EAPOLClientProfileGetWLANSSIDAndSecurityType(*(_QWORD *)(a1 + 24), 0);
    if (ID)
      goto LABEL_10;
LABEL_13:
    v2 = *(_DWORD *)(a1 + 16);
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    ID = *(const void **)(a1 + 24);
    if (ID)
    {
LABEL_10:
      v4 = CFSTR("SSID");
      goto LABEL_11;
    }
    goto LABEL_13;
  }
LABEL_14:
  if (v2 == 4)
  {
    keys = CFSTR("Default");
    v5 = (const void *)*MEMORY[0x24BDBD270];
  }
  else
  {
    if (v2 != 5)
      return 0;
    keys = CFSTR("Domain");
    v5 = *(const void **)(a1 + 24);
  }
  v7 = v5;
  return CFDictionaryCreate(0, (const void **)&keys, &v7, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
}

uint64_t EAPOLClientItemIDCreateWithDictionary(uint64_t a1, const void *a2)
{
  CFTypeID TypeID;
  const void *Value;
  CFTypeID v6;
  const void *ProfileWithID;
  const void *v9;
  CFTypeID v10;
  const void *v11;
  CFTypeID v12;

  TypeID = CFDictionaryGetTypeID();
  if (!a2 || CFGetTypeID(a2) != TypeID)
    return 0;
  Value = CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("ProfileID"));
  v6 = CFStringGetTypeID();
  if (Value && CFGetTypeID(Value) == v6)
  {
    if (!a1)
      return EAPOLClientItemIDCreateWithProfileID(Value);
    ProfileWithID = EAPOLClientConfigurationGetProfileWithID(a1, Value);
    if (!ProfileWithID)
      return EAPOLClientItemIDCreateWithProfileID(Value);
    return EAPOLClientItemIDCreateWithProfile(ProfileWithID);
  }
  v9 = CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("SSID"));
  v10 = CFDataGetTypeID();
  if (v9 && CFGetTypeID(v9) == v10)
  {
    if (!a1)
      return EAPOLClientItemIDCreateWithWLANSSID(v9);
    ProfileWithID = EAPOLClientConfigurationGetProfileWithWLANSSID(a1, v9);
    if (!ProfileWithID)
      return EAPOLClientItemIDCreateWithWLANSSID(v9);
    return EAPOLClientItemIDCreateWithProfile(ProfileWithID);
  }
  v11 = CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("Domain"));
  v12 = CFStringGetTypeID();
  if (!v11 || CFGetTypeID(v11) != v12)
  {
    if (CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("Default")))
      return EAPOLClientItemIDCreateDefault();
    return 0;
  }
  if (a1)
  {
    ProfileWithID = EAPOLClientConfigurationGetProfileWithWLANDomain(a1, v11);
    if (ProfileWithID)
      return EAPOLClientItemIDCreateWithProfile(ProfileWithID);
  }
  return EAPOLClientItemIDCreateWithWLANDomain(v11);
}

uint64_t EAPOLClientItemIDCopyIdentity(uint64_t a1)
{
  __CFString *v1;
  NSObject *LogHandle;
  os_log_type_t v3;
  int v4;
  int v5;
  NSObject *v6;
  os_log_type_t v7;
  const char *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v14;
  int v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  const __CFDictionary *v20;
  __CFString *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  v20 = 0;
  v1 = (__CFString *)EAPOLClientItemIDCopyUniqueString(a1, 0);
  v21 = v1;
  LogHandle = EAPLogGetLogHandle();
  v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v3))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v1;
    _os_log_impl(&dword_206440000, LogHandle, v3, "looking for identity reference for [%@]", buf, 0xCu);
  }
  v4 = EAPKeychainCopyIdentityReference(v1, (CFTypeRef *)&v20);
  if (v4)
  {
    v5 = v4;
    v6 = EAPLogGetLogHandle();
    v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = EAPSecurityErrorString(v5);
      *(_DWORD *)buf = 136315394;
      v23 = (void *)v8;
      v24 = 1024;
      v25 = v5;
      v9 = "EAPKeychainCopyIdentityReference() failed %s (%d)";
LABEL_6:
      v10 = v6;
      v11 = v7;
      v12 = 18;
LABEL_7:
      _os_log_impl(&dword_206440000, v10, v11, v9, buf, v12);
    }
  }
  else
  {
    if (!v20)
    {
      v17 = EAPLogGetLogHandle();
      v18 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v17, v18))
        goto LABEL_8;
      *(_WORD *)buf = 0;
      v9 = "EAPKeychainCopyIdentityReference() returned NULL";
      v10 = v17;
      v11 = v18;
      v12 = 2;
      goto LABEL_7;
    }
    v14 = EAPSecIdentityHandleCreateSecIdentity(v20, &v19);
    if (v14)
    {
      v15 = v14;
      v6 = EAPLogGetLogHandle();
      v7 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v6, v7))
      {
        v16 = EAPSecurityErrorString(v15);
        *(_DWORD *)buf = 136315394;
        v23 = (void *)v16;
        v24 = 1024;
        v25 = v15;
        v9 = "EAPSecIdentityHandleCreateSecIdentity() failed %s (%d)";
        goto LABEL_6;
      }
    }
  }
LABEL_8:
  my_CFRelease((const void **)&v21);
  my_CFRelease((const void **)&v20);
  return v19;
}

CFStringRef EAPOLClientItemIDCopyUniqueString(uint64_t a1, int a2)
{
  const char *v2;
  const void *WLANSSIDAndSecurityType;
  uint64_t v6;
  const char *v7;
  const __CFAllocator *WLANDomain;
  const __CFAllocator *v9;
  CFStringRef v10;
  const char *v11;
  const char *v12;

  if (a2)
    v2 = "item";
  else
    v2 = "identity";
  switch(*(_DWORD *)(a1 + 16))
  {
    case 1:
      WLANSSIDAndSecurityType = *(const void **)(a1 + 24);
      goto LABEL_10;
    case 2:
      v6 = *(_QWORD *)(a1 + 24);
      if (v6)
      {
        v7 = "profileid";
        return CFStringCreateWithFormat(0, 0, CFSTR("com.apple.network.eap.%s.%s.%s.%@"), "system", v2, v7, v6);
      }
      v11 = "profileid";
      return CFStringCreateWithFormat(0, 0, CFSTR("com.apple.network.eap.%s.%s.%s"), "system", v2, v11);
    case 3:
      WLANSSIDAndSecurityType = (const void *)EAPOLClientProfileGetWLANSSIDAndSecurityType(*(_QWORD *)(a1 + 24), 0);
      if (WLANSSIDAndSecurityType)
      {
LABEL_10:
        WLANDomain = (const __CFAllocator *)my_CFStringCreateWithData(WLANSSIDAndSecurityType);
        if (WLANDomain)
        {
          v9 = WLANDomain;
          v10 = CFStringCreateWithFormat(0, 0, CFSTR("com.apple.network.eap.%s.%s.%s.%@"), "system", v2, "wlan.ssid", WLANDomain);
          CFRelease(v9);
          return v10;
        }
        v12 = "wlan.ssid";
        return CFStringCreateWithFormat(WLANDomain, 0, CFSTR("com.apple.network.eap.%s.%s.%s"), "system", v2, v12);
      }
      WLANDomain = (const __CFAllocator *)EAPOLClientProfileGetWLANDomain(*(_QWORD *)(a1 + 24));
      if (WLANDomain)
      {
        v12 = "wlan.domain";
      }
      else
      {
        WLANDomain = (const __CFAllocator *)EAPOLClientProfileGetID(*(_QWORD *)(a1 + 24));
        v12 = "profileid";
        if (!WLANDomain)
          return CFStringCreateWithFormat(WLANDomain, 0, CFSTR("com.apple.network.eap.%s.%s.%s"), "system", v2, v12);
      }
      return CFStringCreateWithFormat(0, 0, CFSTR("com.apple.network.eap.%s.%s.%s.%@"), "system", v2, v12, WLANDomain);
    case 4:
      v11 = "default";
      return CFStringCreateWithFormat(0, 0, CFSTR("com.apple.network.eap.%s.%s.%s"), "system", v2, v11);
    case 5:
      v6 = *(_QWORD *)(a1 + 24);
      if (v6)
      {
        v7 = "wlan.domain";
        return CFStringCreateWithFormat(0, 0, CFSTR("com.apple.network.eap.%s.%s.%s.%@"), "system", v2, v7, v6);
      }
      else
      {
        v11 = "wlan.domain";
        return CFStringCreateWithFormat(0, 0, CFSTR("com.apple.network.eap.%s.%s.%s"), "system", v2, v11);
      }
    default:
      return 0;
  }
}

BOOL EAPOLClientItemIDSetIdentity(uint64_t a1, uint64_t a2, __SecIdentity *a3)
{
  __CFString *v4;
  NSObject *LogHandle;
  os_log_type_t v6;
  const char *v7;
  int v8;
  _BOOL8 v9;
  int v10;
  __CFData *v11;
  int v12;
  int v13;
  NSObject *v14;
  os_log_type_t v15;
  const char *v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint32_t v20;
  int v21;
  NSObject *v22;
  os_log_type_t v23;
  const char *v24;
  NSObject *v25;
  os_log_type_t v26;
  char v28;
  const __CFData *v29;
  __CFData *v30;
  __CFString *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v29 = 0;
  v30 = 0;
  v4 = (__CFString *)EAPOLClientItemIDCopyUniqueString(a1, 0);
  v31 = v4;
  LogHandle = EAPLogGetLogHandle();
  v6 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v6))
  {
    v7 = "adding/updating";
    if (!a3)
      v7 = "deleting";
    *(_DWORD *)buf = 136315394;
    v33 = v7;
    v34 = 2112;
    v35 = v4;
    _os_log_impl(&dword_206440000, LogHandle, v6, "%s identity reference for key : [%@]", buf, 0x16u);
  }
  v8 = EAPKeychainCopyIdentityReference(v4, (CFTypeRef *)&v29);
  if (!a3 && v8 == -25300)
    goto LABEL_7;
  if (!v29)
  {
    v10 = 0;
    goto LABEL_14;
  }
  v28 = 0;
  if (a3)
  {
    if (!EAPSecIdentityCompareIdentityHandle(a3, v29, &v28) && v28 == 1)
      goto LABEL_7;
    v10 = 1;
LABEL_14:
    v11 = EAPSecIdentityHandleCreate(a3);
    v30 = v11;
    if (!v11)
    {
      v25 = EAPLogGetLogHandle();
      v26 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v25, v26))
      {
        *(_WORD *)buf = 0;
        v17 = "EAPSecIdentityHandleCreate() returned NULL";
        v18 = v25;
        v19 = v26;
        v20 = 2;
        goto LABEL_24;
      }
LABEL_25:
      v9 = 0;
      goto LABEL_26;
    }
    v12 = EAPKeychainSetIdentityReference(v4, v11, v10);
    if (v12)
    {
      v13 = v12;
      v14 = EAPLogGetLogHandle();
      v15 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = EAPSecurityErrorString(v13);
        *(_DWORD *)buf = 136315394;
        v33 = v16;
        v34 = 1024;
        LODWORD(v35) = v13;
        v17 = "failed to add/update identity reference in the Keychain, %s (%d)";
        v18 = v14;
        v19 = v15;
        v20 = 18;
LABEL_24:
        _os_log_impl(&dword_206440000, v18, v19, v17, buf, v20);
        goto LABEL_25;
      }
      goto LABEL_25;
    }
LABEL_7:
    v9 = 1;
    goto LABEL_26;
  }
  v21 = EAPKeychainSetIdentityReference(v4, 0, 0);
  if (v21)
  {
    v22 = EAPLogGetLogHandle();
    v23 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = EAPSecurityErrorString(v21);
      *(_DWORD *)buf = 136315394;
      v33 = v24;
      v34 = 1024;
      LODWORD(v35) = v21;
      _os_log_impl(&dword_206440000, v22, v23, "failed to delete identity reference, %s (%d)", buf, 0x12u);
    }
  }
  v9 = v21 == 0;
LABEL_26:
  my_CFRelease((const void **)&v29);
  my_CFRelease((const void **)&v30);
  my_CFRelease((const void **)&v31);
  return v9;
}

BOOL EAPOLClientItemIDCopyPasswordItem(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  _BOOL8 v4;
  CFStringRef v7;
  __CFString *v8;
  NSObject *LogHandle;
  os_log_type_t v10;
  int v11;
  NSObject *v12;
  os_log_type_t v13;
  const char *v14;
  CFStringRef v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!(a3 | a4))
    return 0;
  v7 = EAPOLClientItemIDCopyUniqueString(a1, 1);
  v16 = v7;
  if (v7)
  {
    v8 = (__CFString *)v7;
    LogHandle = EAPLogGetLogHandle();
    v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v10))
    {
      *(_DWORD *)buf = 138412290;
      v18 = (const char *)v8;
      _os_log_impl(&dword_206440000, LogHandle, v10, "searching username/password for [%@]", buf, 0xCu);
    }
    v11 = EAPKeychainCopyPasswordItem(v8, (_QWORD *)a3, (_QWORD *)a4);
    if (v11)
    {
      v12 = EAPLogGetLogHandle();
      v13 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = EAPSecurityErrorString(v11);
        *(_DWORD *)buf = 136315394;
        v18 = v14;
        v19 = 1024;
        v20 = v11;
        _os_log_impl(&dword_206440000, v12, v13, "failed to copy username/password from the Keychain, %s (%d)", buf, 0x12u);
      }
    }
    v4 = v11 == 0;
  }
  else
  {
    v4 = 0;
  }
  my_CFRelease((const void **)&v16);
  return v4;
}

uint64_t EAPOLClientItemIDRemovePasswordItem(uint64_t a1)
{
  uint64_t v1;
  NSObject *LogHandle;
  os_log_type_t v3;
  int v4;
  int v5;
  NSObject *v6;
  os_log_type_t v7;
  const char *v8;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = (uint64_t)EAPOLClientItemIDCopyUniqueString(a1, 1);
  v10 = v1;
  if (v1)
  {
    LogHandle = EAPLogGetLogHandle();
    v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v3))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v1;
      _os_log_impl(&dword_206440000, LogHandle, v3, "removing username/password for [%@]", buf, 0xCu);
    }
    v4 = EAPKeychainRemovePasswordItem((void *)v1);
    if (v4)
    {
      v5 = v4;
      v6 = EAPLogGetLogHandle();
      v7 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v6, v7))
      {
        v8 = EAPSecurityErrorString(v5);
        *(_DWORD *)buf = 136315394;
        v12 = (uint64_t)v8;
        v13 = 1024;
        v14 = v5;
        _os_log_impl(&dword_206440000, v6, v7, "failed to remove username/password from the Keychain, %s (%d)", buf, 0x12u);
      }
      v1 = 0;
    }
    else
    {
      v1 = 1;
    }
  }
  my_CFRelease((const void **)&v10);
  return v1;
}

__CFString *EAPOLClientItemIDSetPasswordItem(uint64_t a1, uint64_t a2, const __CFData *a3, void *a4)
{
  __CFString *v4;
  NSObject *LogHandle;
  os_log_type_t v8;
  CFIndex Length;
  const UInt8 *BytePtr;
  const UInt8 *v11;
  size_t v12;
  _BOOL4 v13;
  CFIndex v14;
  const UInt8 *v15;
  const UInt8 *v16;
  size_t v17;
  int v18;
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  CFDataRef v23;
  CFDataRef theData;
  const void *v25;
  uint8_t buf[4];
  __CFString *v27;
  uint64_t v28;

  v4 = 0;
  v28 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  theData = 0;
  if (a3 && a4)
  {
    v4 = (__CFString *)EAPOLClientItemIDCopyUniqueString(a1, 1);
    v25 = v4;
    if (!v4)
    {
LABEL_22:
      my_CFRelease((const void **)&theData);
      my_CFRelease((const void **)&v23);
      my_CFRelease(&v25);
      return v4;
    }
    LogHandle = EAPLogGetLogHandle();
    v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v8))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v4;
      _os_log_impl(&dword_206440000, LogHandle, v8, "adding/updating username/password for [%@]", buf, 0xCu);
    }
    EAPKeychainCopyPasswordItem(v4, &theData, &v23);
    if (theData)
    {
      Length = CFDataGetLength(theData);
      v13 = 1;
      if (Length == CFDataGetLength(a3))
      {
        BytePtr = CFDataGetBytePtr(theData);
        v11 = CFDataGetBytePtr(a3);
        v12 = CFDataGetLength(theData);
        if (!memcmp(BytePtr, v11, v12))
          v13 = 0;
      }
      if (v23)
      {
        v14 = CFDataGetLength(v23);
        if (v14 != CFDataGetLength((CFDataRef)a4)
          || (v15 = CFDataGetBytePtr(v23),
              v16 = CFDataGetBytePtr(a3),
              v17 = CFDataGetLength(theData),
              memcmp(v15, v16, v17)))
        {
          v18 = 1;
LABEL_18:
          if (v13)
            v21 = 1;
          else
            v21 = v18;
          v4 = (__CFString *)(EAPKeychainSetPasswordItem(v4, a3, a4, v21) == 0);
          goto LABEL_22;
        }
      }
      else
      {
        v19 = EAPLogGetLogHandle();
        v20 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v19, v20))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v4;
          _os_log_impl(&dword_206440000, v19, v20, "failed to find current password for [%@]", buf, 0xCu);
        }
      }
    }
    else
    {
      v13 = 0;
    }
    v18 = 0;
    goto LABEL_18;
  }
  return v4;
}

uint64_t __EAPOLClientItemIDInitialize()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kEAPOLClientItemIDTypeID = result;
  return result;
}

void __EAPOLClientItemIDDeallocate(uint64_t a1)
{
  unsigned int v1;
  BOOL v2;
  int v3;

  v1 = *(_DWORD *)(a1 + 16);
  v2 = v1 > 5;
  v3 = (1 << v1) & 0x2E;
  if (!v2 && v3 != 0)
    CFRelease(*(CFTypeRef *)(a1 + 24));
}

uint64_t __EAPOLClientItemIDEqual(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16))
    return CFEqual(*(CFTypeRef *)(a1 + 24), *(CFTypeRef *)(a2 + 24));
  else
    return 0;
}

CFHashCode __EAPOLClientItemIDHash(uint64_t a1)
{
  return CFHash(*(CFTypeRef *)(a1 + 24));
}

__CFString *__EAPOLClientItemIDCopyDebugDesc(uint64_t a1)
{
  const __CFAllocator *v2;
  __CFString *Mutable;
  CFStringRef v4;
  uint64_t ID;

  v2 = CFGetAllocator((CFTypeRef)a1);
  Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<EAPOLClientItemID %p [%p]> {"), a1, v2);
  switch(*(_DWORD *)(a1 + 16))
  {
    case 1:
      v4 = my_CFStringCreateWithData(*(const void **)(a1 + 24));
      CFStringAppendFormat(Mutable, 0, CFSTR("WLAN SSID = %@"), v4);
      CFRelease(v4);
      break;
    case 2:
      CFStringAppendFormat(Mutable, 0, CFSTR("ProfileID = %@"), *(_QWORD *)(a1 + 24));
      break;
    case 3:
      ID = EAPOLClientProfileGetID(*(_QWORD *)(a1 + 24));
      CFStringAppendFormat(Mutable, 0, CFSTR("Profile = %@"), ID);
      break;
    case 4:
      CFStringAppend(Mutable, CFSTR("Default"));
      break;
    case 5:
      CFStringAppendFormat(Mutable, 0, CFSTR("WLAN domain = %@"), *(_QWORD *)(a1 + 24));
      break;
    default:
      break;
  }
  CFStringAppend(Mutable, CFSTR("}"));
  return Mutable;
}

CFIndex accept_types_valid(const __CFArray *a1)
{
  CFTypeID TypeID;
  CFIndex result;
  CFIndex v4;
  uint64_t v5;
  const void *ValueAtIndex;
  CFTypeID v7;

  TypeID = CFArrayGetTypeID();
  if (a1 && CFGetTypeID(a1) == TypeID)
  {
    result = CFArrayGetCount(a1);
    if (!(_DWORD)result)
      return result;
    if ((int)result < 1)
      return 1;
    v4 = 0;
    v5 = result;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, v4);
      v7 = CFNumberGetTypeID();
      if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != v7)
        break;
      if (v5 == ++v4)
        return 1;
    }
  }
  return 0;
}

uint64_t EAPOLClientProfileGetTypeID()
{
  pthread_once(&__EAPOLClientProfileRegisterClass_initialized, (void (*)(void))__EAPOLClientProfileInitialize);
  return __kEAPOLClientProfileTypeID;
}

_QWORD *EAPOLClientProfileCreate(const void *a1)
{
  const __CFAllocator *v2;
  _QWORD *v3;
  _QWORD *v4;
  const void *v6;

  v2 = CFGetAllocator(a1);
  __EAPOLClientProfileAllocate();
  v4 = v3;
  v6 = v3;
  if (v3)
  {
    v3[3] = my_CFUUIDStringCreate(v2);
    if (!EAPOLClientConfigurationAddProfile((uint64_t)a1, v4))
    {
      my_CFRelease(&v6);
      return v6;
    }
  }
  return v4;
}

double __EAPOLClientProfileAllocate()
{
  _OWORD *Instance;
  double result;

  pthread_once(&__EAPOLClientProfileRegisterClass_initialized, (void (*)(void))__EAPOLClientProfileInitialize);
  Instance = (_OWORD *)_CFRuntimeCreateInstance();
  result = 0.0;
  Instance[1] = 0u;
  Instance[2] = 0u;
  Instance[3] = 0u;
  Instance[4] = 0u;
  return result;
}

uint64_t EAPOLClientProfileGetUserDefinedName(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

void EAPOLClientProfileSetUserDefinedName(uint64_t a1, CFTypeRef cf)
{
  const void *v4;

  if (cf)
    CFRetain(cf);
  v4 = *(const void **)(a1 + 40);
  if (v4)
    CFRelease(v4);
  *(_QWORD *)(a1 + 40) = cf;
}

uint64_t EAPOLClientProfileGetID(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

uint64_t EAPOLClientProfileGetAuthenticationProperties(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

void EAPOLClientProfileSetAuthenticationProperties(uint64_t a1, CFTypeRef cf)
{
  const void *v4;

  if (cf)
    CFRetain(cf);
  v4 = *(const void **)(a1 + 32);
  if (v4)
    CFRelease(v4);
  *(_QWORD *)(a1 + 32) = cf;
}

uint64_t EAPOLClientProfileGetWLANSSIDAndSecurityType(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
  {
    if (a2)
    {
      *a2 = *(_QWORD *)(a1 + 56);
      return *(_QWORD *)(a1 + 48);
    }
  }
  else
  {
    result = 0;
    if (a2)
      *a2 = 0;
  }
  return result;
}

uint64_t EAPOLClientProfileSetWLANSSIDAndSecurityType(_QWORD *a1, void *cf, CFTypeRef a3)
{
  uint64_t result;
  uint64_t v7;
  _QWORD *ProfileWithWLANSSID;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  const void *v13;

  if (!cf)
  {
    if (!a3)
      goto LABEL_7;
    return 0;
  }
  result = 0;
  if (!a3 || a1[8])
    return result;
  v7 = a1[2];
  if (v7)
  {
    ProfileWithWLANSSID = EAPOLClientConfigurationGetProfileWithWLANSSID(v7, cf);
    if (ProfileWithWLANSSID)
    {
      if (ProfileWithWLANSSID != a1)
        return 0;
    }
  }
LABEL_7:
  v9 = (void *)a1[6];
  if (v9)
  {
    v10 = a1[2];
    if (v10)
      EAPOLClientConfigurationSetProfileForSSID(v10, v9, 0);
  }
  if (cf)
  {
    CFRetain(cf);
    v11 = a1[2];
    if (v11)
      EAPOLClientConfigurationSetProfileForSSID(v11, cf, (uint64_t)a1);
  }
  if (a3)
    CFRetain(a3);
  v12 = (const void *)a1[6];
  if (v12)
    CFRelease(v12);
  v13 = (const void *)a1[7];
  if (v13)
    CFRelease(v13);
  a1[6] = cf;
  a1[7] = a3;
  return 1;
}

uint64_t EAPOLClientProfileGetWLANDomain(uint64_t a1)
{
  return *(_QWORD *)(a1 + 64);
}

uint64_t EAPOLClientProfileSetWLANDomain(_QWORD *a1, void *cf)
{
  uint64_t v5;
  _QWORD *ProfileWithWLANDomain;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;

  if (cf)
  {
    if (a1[6])
      return 0;
    v5 = a1[2];
    if (v5)
    {
      ProfileWithWLANDomain = EAPOLClientConfigurationGetProfileWithWLANDomain(v5, cf);
      if (ProfileWithWLANDomain)
      {
        if (ProfileWithWLANDomain != a1)
          return 0;
      }
    }
  }
  v7 = (void *)a1[8];
  if (v7)
  {
    v8 = a1[2];
    if (v8)
      EAPOLClientConfigurationSetProfileForWLANDomain(v8, v7, 0);
  }
  if (cf)
  {
    CFRetain(cf);
    v9 = a1[2];
    if (v9)
      EAPOLClientConfigurationSetProfileForWLANDomain(v9, cf, (uint64_t)a1);
  }
  v10 = (const void *)a1[8];
  if (v10)
    CFRelease(v10);
  a1[8] = cf;
  return 1;
}

BOOL EAPOLClientProfileSetInformation(uint64_t a1, const __CFString *a2, const void *a3)
{
  _BOOL8 result;
  CFTypeID TypeID;
  __CFDictionary *Mutable;
  __CFDictionary *v9;

  result = applicationID_is_valid(a2);
  if (result)
  {
    if (!a3)
    {
      v9 = *(__CFDictionary **)(a1 + 72);
      if (v9)
        CFDictionaryRemoveValue(v9, a2);
      return 1;
    }
    TypeID = CFDictionaryGetTypeID();
    if (CFGetTypeID(a3) == TypeID)
    {
      Mutable = *(__CFDictionary **)(a1 + 72);
      if (!Mutable)
      {
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        *(_QWORD *)(a1 + 72) = Mutable;
      }
      CFDictionarySetValue(Mutable, a2, a3);
      return 1;
    }
    return 0;
  }
  return result;
}

BOOL applicationID_is_valid(const __CFString *a1)
{
  return CFStringGetLength(a1) >= 3 && CFStringFind(a1, CFSTR("."), 0).location != -1;
}

const void *EAPOLClientProfileGetInformation(uint64_t a1, const __CFString *a2)
{
  const void *Value;
  CFTypeID TypeID;

  if (!*(_QWORD *)(a1 + 72))
    return 0;
  if (!applicationID_is_valid(a2))
    return 0;
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 72), a2);
  TypeID = CFDictionaryGetTypeID();
  if (!Value)
    return 0;
  if (CFGetTypeID(Value) == TypeID)
    return Value;
  return 0;
}

__CFDictionary *EAPOLClientProfileCreatePropertyList(uint64_t a1)
{
  __CFDictionary *DictAndProfileID;
  __CFDictionary *v2;
  void *value;

  value = 0;
  DictAndProfileID = EAPOLClientProfileCreateDictAndProfileID(a1, (CFTypeRef *)&value);
  v2 = DictAndProfileID;
  if (DictAndProfileID)
    CFDictionarySetValue(DictAndProfileID, CFSTR("ProfileID"), value);
  return v2;
}

__CFDictionary *EAPOLClientProfileCreateDictAndProfileID(uint64_t a1, CFTypeRef *a2)
{
  const __CFDictionary *Value;
  __CFDictionary *Mutable;
  const void *v6;
  const __CFDictionary *v7;
  void *v8;
  uint64_t v9;
  CFIndex v10;
  void *v11;
  CFDictionaryRef v12;
  void *values;
  uint64_t v15;
  void *keys;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  Value = *(const __CFDictionary **)(a1 + 32);
  if (Value)
    Value = (const __CFDictionary *)CFDictionaryGetValue(Value, CFSTR("AcceptEAPTypes"));
  if (accept_types_valid(Value))
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (a2)
      *a2 = CFRetain(*(CFTypeRef *)(a1 + 24));
    CFDictionarySetValue(Mutable, CFSTR("AuthenticationProperties"), *(const void **)(a1 + 32));
    v6 = *(const void **)(a1 + 40);
    if (v6)
      CFDictionarySetValue(Mutable, CFSTR("UserDefinedName"), v6);
    v7 = *(const __CFDictionary **)(a1 + 72);
    if (v7 && CFDictionaryGetCount(v7))
      CFDictionarySetValue(Mutable, CFSTR("Information"), *(const void **)(a1 + 72));
    v8 = *(void **)(a1 + 48);
    if (v8)
    {
      keys = CFSTR("SSID");
      v17 = CFSTR("SecurityType");
      v9 = *(_QWORD *)(a1 + 56);
      values = v8;
      v15 = v9;
      v10 = 2;
LABEL_16:
      v12 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, v10, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      CFDictionarySetValue(Mutable, CFSTR("WLAN"), v12);
      CFRelease(v12);
      return Mutable;
    }
    v11 = *(void **)(a1 + 64);
    if (v11)
    {
      keys = CFSTR("Domain");
      v17 = 0;
      values = v11;
      v15 = 0;
      v10 = 1;
      goto LABEL_16;
    }
  }
  else
  {
    SCLog();
    return 0;
  }
  return Mutable;
}

_QWORD *EAPOLClientProfileCreateWithPropertyList(const void *a1)
{
  CFTypeID TypeID;
  const void *Value;
  CFTypeID v4;

  TypeID = CFDictionaryGetTypeID();
  if (a1
    && CFGetTypeID(a1) == TypeID
    && (Value = CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("ProfileID")), v4 = CFStringGetTypeID(), Value)
    && CFGetTypeID(Value) == v4)
  {
    return EAPOLClientProfileCreateWithDictAndProfileID(a1, Value);
  }
  else
  {
    return 0;
  }
}

_QWORD *EAPOLClientProfileCreateWithDictAndProfileID(const void *a1, const void *a2)
{
  const void *Value;
  CFTypeID TypeID;
  const __CFArray *v6;
  const void *v7;
  CFTypeID v8;
  void *v9;
  void *v10;
  CFTypeID v11;
  CFTypeID v12;
  CFTypeID v13;
  _QWORD *v14;
  const void *v16;
  CFTypeID v17;
  const void *v18;
  CFTypeID v19;
  _QWORD *v20;

  CFGetAllocator(a1);
  Value = CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("AuthenticationProperties"));
  TypeID = CFDictionaryGetTypeID();
  if (!Value)
    goto LABEL_14;
  if (CFGetTypeID(Value) != TypeID)
    goto LABEL_14;
  if (!CFDictionaryGetCount((CFDictionaryRef)Value))
    goto LABEL_14;
  v6 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)Value, CFSTR("AcceptEAPTypes"));
  if (!accept_types_valid(v6))
    goto LABEL_14;
  v7 = CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("WLAN"));
  if (v7)
  {
    v8 = CFDictionaryGetTypeID();
    if (CFGetTypeID(v7) != v8)
    {
LABEL_14:
      SCLog();
      return 0;
    }
    v9 = (void *)CFDictionaryGetValue((CFDictionaryRef)v7, CFSTR("SSID"));
    v10 = (void *)CFDictionaryGetValue((CFDictionaryRef)v7, CFSTR("Domain"));
    v11 = CFDataGetTypeID();
    if (v9 && CFGetTypeID(v9) == v11)
      goto LABEL_12;
    v12 = CFStringGetTypeID();
    if (!v10 || CFGetTypeID(v10) != v12)
      goto LABEL_14;
    if (v9)
    {
LABEL_12:
      v7 = CFDictionaryGetValue((CFDictionaryRef)v7, CFSTR("SecurityType"));
      v13 = CFStringGetTypeID();
      if (!v7 || CFGetTypeID(v7) != v13)
        goto LABEL_14;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  v16 = CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("UserDefinedName"));
  if (v16)
  {
    v17 = CFStringGetTypeID();
    if (CFGetTypeID(v16) != v17)
      goto LABEL_14;
  }
  v18 = CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("Information"));
  if (v18)
  {
    v19 = CFDictionaryGetTypeID();
    if (CFGetTypeID(v18) != v19)
      goto LABEL_14;
  }
  __EAPOLClientProfileAllocate();
  v14 = v20;
  if (v20)
  {
    v20[3] = CFRetain(a2);
    EAPOLClientProfileSetUserDefinedName((uint64_t)v14, v16);
    EAPOLClientProfileSetAuthenticationProperties((uint64_t)v14, Value);
    if (v9)
    {
      EAPOLClientProfileSetWLANSSIDAndSecurityType(v14, v9, v7);
    }
    else if (v10)
    {
      EAPOLClientProfileSetWLANDomain(v14, v10);
    }
    if (v18)
      v14[9] = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)v18);
  }
  return v14;
}

uint64_t EAPOLClientProfileSetConfiguration(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 16) = a2;
  return result;
}

uint64_t __EAPOLClientProfileInitialize()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kEAPOLClientProfileTypeID = result;
  return result;
}

void __EAPOLClientProfileDeallocate(const void **a1)
{
  my_CFRelease(a1 + 3);
  my_CFRelease(a1 + 4);
  my_CFRelease(a1 + 5);
  my_CFRelease(a1 + 6);
  my_CFRelease(a1 + 7);
  my_CFRelease(a1 + 9);
}

uint64_t __EAPOLClientProfileEqual(CFTypeRef *a1, CFTypeRef *a2)
{
  uint64_t result;

  result = CFEqual(a1[3], a2[3]);
  if ((_DWORD)result)
  {
    result = my_CFEqual(a1[4], a2[4]);
    if ((_DWORD)result)
    {
      result = my_CFEqual(a1[5], a2[5]);
      if ((_DWORD)result)
      {
        result = my_CFEqual(a1[6], a2[6]);
        if ((_DWORD)result)
        {
          result = my_CFEqual(a1[7], a2[7]);
          if ((_DWORD)result)
            return my_CFEqual(a1[9], a2[9]) != 0;
        }
      }
    }
  }
  return result;
}

CFHashCode __EAPOLClientProfileHash(uint64_t a1)
{
  return CFHash(*(CFTypeRef *)(a1 + 24));
}

__CFString *__EAPOLClientProfileCopyDebugDesc(_QWORD *a1)
{
  const __CFAllocator *v2;
  __CFString *Mutable;
  const void *v4;
  CFStringRef v5;
  const __CFDictionary *v6;

  v2 = CFGetAllocator(a1);
  Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<EAPOLClientProfile %p [%p]> {"), a1, v2);
  CFStringAppendFormat(Mutable, 0, CFSTR("ProfileID = %@"), a1[3]);
  if (a1[5])
    CFStringAppendFormat(Mutable, 0, CFSTR(" Name = '%@'"), a1[5]);
  v4 = (const void *)a1[6];
  if (v4)
  {
    v5 = my_CFStringCreateWithData(v4);
    CFStringAppendFormat(Mutable, 0, CFSTR(", WLAN SSID %@ [%@]"), v5, a1[7]);
    CFRelease(v5);
  }
  if (a1[4])
    CFStringAppendFormat(Mutable, 0, CFSTR(", auth_props = %@"), a1[4]);
  v6 = (const __CFDictionary *)a1[9];
  if (v6 && CFDictionaryGetCount(v6))
    CFStringAppendFormat(Mutable, 0, CFSTR(", info = %@"), a1[9]);
  CFStringAppendFormat(Mutable, 0, CFSTR("}"));
  return Mutable;
}

uint64_t EAPOLClientConfigurationGetTypeID()
{
  pthread_once(&__EAPOLClientConfigurationRegisterClass_initialized, (void (*)(void))__EAPOLClientConfigurationInitialize);
  return __kEAPOLClientConfigurationTypeID;
}

uint64_t EAPOLClientConfigurationCreate(const __CFAllocator *a1)
{
  return EAPOLClientConfigurationCreateInternal(a1, 0, 0);
}

uint64_t EAPOLClientConfigurationCreateInternal(const __CFAllocator *a1, const AuthorizationOpaqueRef *a2, int a3)
{
  uint64_t Instance;
  SCPreferencesRef v7;
  const CFDictionaryKeyCallBacks *v8;
  const CFDictionaryValueCallBacks *v9;
  const __CFDictionary *Mutable;
  const __CFDictionary *v11;
  CFMutableDictionaryRef v12;
  const __CFDictionary *Value;
  CFTypeID TypeID;
  int Count;
  int v16;
  uint64_t v17;
  uint64_t v18;
  const void **v19;
  const void *v20;
  const void *v21;
  CFTypeID v22;
  _QWORD *v23;
  const void *v24;
  const void *WLANSSIDAndSecurityType;
  const void *v26;
  const void *WLANDomain;
  __CFDictionary *v28;
  NSObject *LogHandle;
  os_log_type_t v30;
  int v31;
  CFStringRef v33;
  CFMutableDictionaryRef theDict;
  const void **v35;
  uint64_t v36;
  uint8_t buf[4];
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  pthread_once(&__EAPOLClientConfigurationRegisterClass_initialized, (void (*)(void))__EAPOLClientConfigurationInitialize);
  Instance = _CFRuntimeCreateInstance();
  *(_OWORD *)(Instance + 16) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  *(_QWORD *)(Instance + 96) = 0;
  v36 = Instance;
  if (Instance)
  {
    if (a3 == 1)
      v7 = SCPreferencesCreateWithAuthorization(a1, CFSTR("EAPOLClientConfiguration"), CFSTR("com.apple.network.eapolclient.configuration.plist"), a2);
    else
      v7 = SCPreferencesCreate(a1, CFSTR("EAPOLClientConfiguration"), CFSTR("com.apple.network.eapolclient.configuration.plist"));
    *(_QWORD *)(Instance + 24) = v7;
    if (v7)
    {
      v8 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
      v9 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v11 = CFDictionaryCreateMutable(0, 0, v8, v9);
      v12 = CFDictionaryCreateMutable(0, 0, v8, v9);
      Value = (const __CFDictionary *)SCPreferencesGetValue(*(SCPreferencesRef *)(Instance + 24), CFSTR("Profiles"));
      TypeID = CFDictionaryGetTypeID();
      if (Value)
      {
        if (CFGetTypeID(Value) == TypeID)
        {
          Count = CFDictionaryGetCount(Value);
          v16 = Count;
          if (Count)
          {
            theDict = v12;
            v35 = (const void **)malloc_type_malloc(16 * Count, 0x9BFCB1FEuLL);
            CFDictionaryGetKeysAndValues(Value, v35, &v35[v16]);
            if (v16 >= 1)
            {
              v17 = v16;
              v18 = v16;
              v19 = v35;
              do
              {
                v20 = v19[v17];
                v21 = *v19;
                v22 = CFDictionaryGetTypeID();
                if (v20 && CFGetTypeID(v20) == v22)
                {
                  v23 = EAPOLClientProfileCreateWithDictAndProfileID(v20, v21);
                  if (v23)
                  {
                    v24 = v23;
                    WLANSSIDAndSecurityType = (const void *)EAPOLClientProfileGetWLANSSIDAndSecurityType((uint64_t)v23, 0);
                    if (WLANSSIDAndSecurityType)
                    {
                      v26 = WLANSSIDAndSecurityType;
                      if (CFDictionaryGetValue(v11, WLANSSIDAndSecurityType))
                      {
                        v33 = my_CFStringCreateWithData(v26);
                        SCLog();
                        CFRelease(v33);
LABEL_25:
                        CFRelease(v24);
                        goto LABEL_26;
                      }
                      v28 = v11;
                      goto LABEL_23;
                    }
                    WLANDomain = (const void *)EAPOLClientProfileGetWLANDomain((uint64_t)v24);
                    if (WLANDomain)
                    {
                      v26 = WLANDomain;
                      if (CFDictionaryGetValue(Mutable, WLANDomain))
                      {
                        SCLog();
                        goto LABEL_25;
                      }
                      v28 = theDict;
LABEL_23:
                      CFDictionarySetValue(v28, v26, v21);
                    }
                    CFDictionarySetValue(Mutable, v21, v24);
                    EAPOLClientProfileSetConfiguration((uint64_t)v24, Instance);
                    goto LABEL_25;
                  }
                }
                else
                {
                  SCLog();
                }
LABEL_26:
                ++v19;
                --v18;
              }
              while (v18);
            }
            free(v35);
            v12 = theDict;
          }
        }
      }
      *(_QWORD *)(Instance + 48) = Mutable;
      *(_QWORD *)(Instance + 56) = v11;
      *(_QWORD *)(Instance + 64) = v12;
      *(_QWORD *)(Instance + 72) = copy_def_auth_props(*(const __SCPreferences **)(Instance + 24));
    }
    else
    {
      LogHandle = EAPLogGetLogHandle();
      v30 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v30))
      {
        v31 = SCError();
        *(_DWORD *)buf = 136315138;
        v38 = SCErrorString(v31);
        _os_log_impl(&dword_206440000, LogHandle, v30, "failed to create preferences %s", buf, 0xCu);
      }
      my_CFRelease((const void **)&v36);
      return 0;
    }
  }
  return Instance;
}

uint64_t EAPOLClientConfigurationCreateWithAuthorization(const __CFAllocator *a1, const AuthorizationOpaqueRef *a2)
{
  return EAPOLClientConfigurationCreateInternal(a1, a2, 1);
}

uint64_t EAPOLClientConfigurationSave(uint64_t a1)
{
  int Count;
  __CFDictionary *Mutable;
  const void **v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  __CFDictionary *DictAndProfileID;
  __CFDictionary *v9;
  CFPropertyListRef Value;
  const void *v11;
  const __SCPreferences *v12;
  int v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  const char *v17;
  const char *v18;
  NSObject *LogHandle;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint32_t v23;
  int v24;
  const char *v25;
  uint64_t v26;
  char v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  int v32;
  const char *v33;
  void *key;
  _BYTE buf[24];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  Count = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 48));
  Mutable = CFDictionaryCreateMutable(0, Count, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *(_QWORD *)buf = Mutable;
  if (Count)
  {
    v4 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 48), 0, v4);
    if (Count >= 1)
    {
      v5 = Count;
      v6 = (uint64_t *)v4;
      while (1)
      {
        v7 = *v6;
        key = 0;
        DictAndProfileID = EAPOLClientProfileCreateDictAndProfileID(v7, (CFTypeRef *)&key);
        if (!DictAndProfileID)
          break;
        v9 = DictAndProfileID;
        CFDictionarySetValue(Mutable, key, DictAndProfileID);
        CFRelease(v9);
        CFRelease(key);
        ++v6;
        if (!--v5)
          goto LABEL_8;
      }
      my_CFRelease((const void **)buf);
      Mutable = *(__CFDictionary **)buf;
    }
LABEL_8:
    free(v4);
  }
  key = Mutable;
  if (!Mutable)
  {
    LogHandle = EAPLogGetLogHandle();
    v20 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, (os_log_type_t)v20))
    {
      *(_WORD *)buf = 0;
      v18 = "EAPOLClientConfigurationSave export_profiles() failed";
      v21 = LogHandle;
      v22 = v20;
      v23 = 2;
LABEL_28:
      _os_log_impl(&dword_206440000, v21, v22, v18, buf, v23);
      goto LABEL_29;
    }
    goto LABEL_29;
  }
  Value = SCPreferencesGetValue(*(SCPreferencesRef *)(a1 + 24), CFSTR("Profiles"));
  if (*(_BYTE *)(a1 + 80))
    goto LABEL_14;
  if (my_CFEqual(Value, key) && !*(_BYTE *)(a1 + 96))
  {
    v26 = 0;
    v28 = 1;
    goto LABEL_36;
  }
  if (*(_BYTE *)(a1 + 80))
  {
LABEL_14:
    if (!SCPreferencesSetValue(*(SCPreferencesRef *)(a1 + 24), CFSTR("DefaultAuthenticationProperties"), *(CFPropertyListRef *)(a1 + 72)))
    {
      v14 = EAPLogGetLogHandle();
      v15 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v14, v15))
        goto LABEL_29;
LABEL_26:
      v24 = SCError();
      v25 = SCErrorString(v24);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v25;
      v18 = "EAPOLClientConfigurationSave SCPreferencesSetValue failed %s";
      goto LABEL_27;
    }
  }
  if (!SCPreferencesSetValue(*(SCPreferencesRef *)(a1 + 24), CFSTR("Profiles"), key))
  {
    v14 = EAPLogGetLogHandle();
    v15 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v14, v15))
      goto LABEL_29;
    goto LABEL_26;
  }
  if (*(_BYTE *)(a1 + 96) == 1)
  {
    v11 = *(const void **)(a1 + 88);
    v12 = *(const __SCPreferences **)(a1 + 24);
    if (v11)
    {
      v13 = SCPreferencesSetValue(v12, CFSTR("SystemModeEthernetProfileID"), v11);
      my_CFRelease((const void **)(a1 + 88));
      if (!v13)
      {
        v14 = EAPLogGetLogHandle();
        v15 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v14, v15))
        {
LABEL_20:
          v16 = SCError();
          v17 = SCErrorString(v16);
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v17;
          v18 = "EAPOLClientConfigurationSave SCPreferencesRemoveValue failed %s";
LABEL_27:
          v21 = v14;
          v22 = v15;
          v23 = 12;
          goto LABEL_28;
        }
LABEL_29:
        my_CFRelease((const void **)&key);
        return 0;
      }
    }
    else if (!SCPreferencesRemoveValue(v12, CFSTR("SystemModeEthernetProfileID")))
    {
      v14 = EAPLogGetLogHandle();
      v15 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v14, v15))
        goto LABEL_29;
      goto LABEL_20;
    }
  }
  v29 = SCPreferencesCommitChanges(*(SCPreferencesRef *)(a1 + 24));
  if (!(_DWORD)v29)
  {
    v30 = EAPLogGetLogHandle();
    v31 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = SCError();
      v33 = SCErrorString(v32);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v33;
      _os_log_impl(&dword_206440000, v30, v31, "EAPOLClientConfigurationSave SCPreferencesCommitChanges failed %s", buf, 0xCu);
    }
    return 0;
  }
  v26 = v29;
  *(_BYTE *)(a1 + 80) = 0;
  *(_BYTE *)(a1 + 96) = 0;
  SCPreferencesApplyChanges(*(SCPreferencesRef *)(a1 + 24));
  v28 = 0;
LABEL_36:
  my_CFRelease((const void **)(a1 + 32));
  my_CFRelease((const void **)&key);
  if ((v28 & 1) == 0)
    notify_post((const char *)kEAPOLClientConfigurationChangedNotifyKey);
  return v26;
}

CFArrayRef EAPOLClientConfigurationCopyProfiles(CFDictionaryRef *a1)
{
  const __CFAllocator *v2;
  int Count;
  CFIndex v4;
  const void **v5;
  CFArrayRef v6;

  v2 = CFGetAllocator(a1);
  Count = CFDictionaryGetCount(a1[6]);
  if (!Count)
    return 0;
  v4 = Count;
  v5 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
  CFDictionaryGetKeysAndValues(a1[6], 0, v5);
  v6 = CFArrayCreate(v2, v5, v4, MEMORY[0x24BDBD690]);
  free(v5);
  return v6;
}

const void *EAPOLClientConfigurationGetProfileWithID(uint64_t a1, const void *a2)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), a2);
}

const void *EAPOLClientConfigurationGetProfileWithWLANSSID(uint64_t a1, const void *a2)
{
  const void *result;

  result = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 56), a2);
  if (result)
    return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), result);
  return result;
}

const void *EAPOLClientConfigurationGetProfileWithWLANDomain(uint64_t a1, const void *a2)
{
  const void *result;

  result = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), a2);
  if (result)
    return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), result);
  return result;
}

uint64_t EAPOLClientConfigurationRemoveProfile(uint64_t a1, const void *a2)
{
  const void *ID;
  uint64_t result;
  const void *WLANSSIDAndSecurityType;
  CFPropertyListRef Value;
  CFTypeID TypeID;
  int v9;
  uint64_t v10;
  uint64_t v11;

  ID = (const void *)EAPOLClientProfileGetID((uint64_t)a2);
  if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), ID) != a2)
    return 0;
  WLANSSIDAndSecurityType = (const void *)EAPOLClientProfileGetWLANSSIDAndSecurityType((uint64_t)a2, 0);
  if (WLANSSIDAndSecurityType)
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 56), WLANSSIDAndSecurityType);
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 48), ID);
  Value = SCPreferencesGetValue(*(SCPreferencesRef *)(a1 + 24), CFSTR("SystemModeEthernetProfileID"));
  TypeID = CFStringGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
    return 1;
  v9 = my_CFEqual(Value, ID);
  result = 1;
  if (v9)
  {
    v11 = *(_QWORD *)(a1 + 88);
    v10 = a1 + 88;
    *(_BYTE *)(v10 + 8) = 1;
    if (v11)
    {
      my_CFRelease((const void **)v10);
      return 1;
    }
  }
  return result;
}

uint64_t EAPOLClientConfigurationAddProfile(uint64_t a1, _QWORD *a2)
{
  const void *ID;
  const void *v5;
  const void *WLANSSIDAndSecurityType;
  const void *v8;
  __CFDictionary *v9;
  const void *WLANDomain;
  const void *v11;
  const void *v12;

  ID = (const void *)EAPOLClientProfileGetID((uint64_t)a2);
  if (a2[2])
    return 0;
  v5 = ID;
  if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), ID))
    return 0;
  WLANSSIDAndSecurityType = (const void *)EAPOLClientProfileGetWLANSSIDAndSecurityType((uint64_t)a2, 0);
  if (!WLANSSIDAndSecurityType)
  {
    WLANDomain = (const void *)EAPOLClientProfileGetWLANDomain((uint64_t)a2);
    if (!WLANDomain)
    {
      v9 = *(__CFDictionary **)(a1 + 48);
      v11 = v5;
      v12 = a2;
      goto LABEL_12;
    }
    v8 = WLANDomain;
    if (!EAPOLClientConfigurationGetProfileWithWLANDomain(a1, WLANDomain))
    {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 48), v5, a2);
      v9 = *(__CFDictionary **)(a1 + 64);
      goto LABEL_10;
    }
    return 0;
  }
  v8 = WLANSSIDAndSecurityType;
  if (EAPOLClientConfigurationGetProfileWithWLANSSID(a1, WLANSSIDAndSecurityType))
    return 0;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 48), v5, a2);
  v9 = *(__CFDictionary **)(a1 + 56);
LABEL_10:
  v11 = v8;
  v12 = v5;
LABEL_12:
  CFDictionarySetValue(v9, v11, v12);
  EAPOLClientProfileSetConfiguration((uint64_t)a2, a1);
  return 1;
}

CFArrayRef EAPOLClientConfigurationCopyMatchingProfiles(CFDictionaryRef *a1, uint64_t a2)
{
  const void *ID;
  void *Value;
  void *v6;
  int v7;
  const void *WLANSSIDAndSecurityType;
  void *ProfileWithWLANSSID;
  const void *WLANDomain;
  CFIndex v11;
  const __CFAllocator *v12;
  void *values[3];

  values[2] = *(void **)MEMORY[0x24BDAC8D0];
  ID = (const void *)EAPOLClientProfileGetID(a2);
  values[0] = 0;
  values[1] = 0;
  Value = (void *)CFDictionaryGetValue(a1[6], ID);
  v6 = Value;
  if (Value)
  {
    values[0] = Value;
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  WLANSSIDAndSecurityType = (const void *)EAPOLClientProfileGetWLANSSIDAndSecurityType(a2, 0);
  if (WLANSSIDAndSecurityType)
  {
    ProfileWithWLANSSID = (void *)EAPOLClientConfigurationGetProfileWithWLANSSID((uint64_t)a1, WLANSSIDAndSecurityType);
    if (!ProfileWithWLANSSID)
      goto LABEL_11;
  }
  else
  {
    WLANDomain = (const void *)EAPOLClientProfileGetWLANDomain(a2);
    if (!WLANDomain)
      goto LABEL_11;
    ProfileWithWLANSSID = (void *)EAPOLClientConfigurationGetProfileWithWLANDomain((uint64_t)a1, WLANDomain);
    if (!ProfileWithWLANSSID)
      goto LABEL_11;
  }
  if (v6 != ProfileWithWLANSSID)
  {
    values[v7] = ProfileWithWLANSSID;
    v11 = (v7 + 1);
LABEL_13:
    v12 = CFGetAllocator(a1);
    return CFArrayCreate(v12, (const void **)values, v11, MEMORY[0x24BDBD690]);
  }
LABEL_11:
  if (v6)
  {
    v11 = 1;
    goto LABEL_13;
  }
  return 0;
}

const void *EAPOLClientConfigurationGetSystemEthernetProfile(uint64_t a1)
{
  CFPropertyListRef Value;
  CFTypeID TypeID;

  Value = SCPreferencesGetValue(*(SCPreferencesRef *)(a1 + 24), CFSTR("SystemModeEthernetProfileID"));
  TypeID = CFStringGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID)
    return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), Value);
  else
    return 0;
}

uint64_t EAPOLClientConfigurationSetSystemEthernetProfile(uint64_t a1, uint64_t a2)
{
  const void **v4;
  uint64_t v5;
  uint64_t Value;
  uint64_t ID;
  const void *v8;
  CFTypeID v9;
  CFTypeID TypeID;

  v5 = *(_QWORD *)(a1 + 88);
  v4 = (const void **)(a1 + 88);
  if (v5)
    my_CFRelease(v4);
  *(_BYTE *)(a1 + 96) = 0;
  Value = (uint64_t)SCPreferencesGetValue(*(SCPreferencesRef *)(a1 + 24), CFSTR("SystemModeEthernetProfileID"));
  if (!a2)
  {
    TypeID = CFStringGetTypeID();
    if (!Value)
      return Value;
    if (CFGetTypeID((CFTypeRef)Value) == TypeID)
    {
      Value = 1;
      *(_BYTE *)(a1 + 96) = 1;
      return Value;
    }
    return 0;
  }
  ID = EAPOLClientProfileGetID(a2);
  if (!ID)
    return 0;
  v8 = (const void *)ID;
  v9 = CFStringGetTypeID();
  if (Value)
  {
    if (CFGetTypeID((CFTypeRef)Value) == v9 && my_CFEqual((const void *)Value, v8))
      return 0;
  }
  Value = 1;
  *(_BYTE *)(a1 + 96) = 1;
  *(_QWORD *)(a1 + 88) = v8;
  CFRetain(v8);
  return Value;
}

uint64_t EAPOLClientConfigurationGetDefaultAuthenticationProperties(uint64_t a1)
{
  return *(_QWORD *)(a1 + 72);
}

CFIndex EAPOLClientConfigurationSetDefaultAuthenticationProperties(uint64_t a1, const __CFDictionary *a2)
{
  const __CFArray *Value;
  CFIndex result;
  void *v6;

  my_CFRelease((const void **)(a1 + 72));
  if (a2)
  {
    Value = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("AcceptEAPTypes"));
    result = accept_types_valid(Value);
    if (!(_DWORD)result)
      return result;
    v6 = (void *)CFRetain(a2);
  }
  else
  {
    v6 = copy_def_auth_props(*(const __SCPreferences **)(a1 + 24));
  }
  *(_QWORD *)(a1 + 72) = v6;
  result = 1;
  *(_BYTE *)(a1 + 80) = 1;
  return result;
}

CFMutableDictionaryRef copy_def_auth_props(const __SCPreferences *a1)
{
  const __CFDictionary *Value;
  CFMutableDictionaryRef v2;
  const __CFArray *v3;
  __CFArray *Mutable;
  uint64_t i;
  CFNumberRef v6;
  const void *v7;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v9 = xmmword_206472B40;
  Value = (const __CFDictionary *)SCPreferencesGetValue(a1, CFSTR("DefaultAuthenticationProperties"));
  if (Value)
  {
    v2 = Value;
    v3 = (const __CFArray *)CFDictionaryGetValue(Value, CFSTR("AcceptEAPTypes"));
    if (accept_types_valid(v3))
    {
      CFRetain(v2);
      return v2;
    }
    if (v3)
      SCLog();
  }
  Mutable = CFArrayCreateMutable(0, 4, MEMORY[0x24BDBD690]);
  for (i = 0; i != 16; i += 4)
  {
    v6 = CFNumberCreate(0, kCFNumberIntType, (char *)&v9 + i);
    CFArrayAppendValue(Mutable, v6);
    CFRelease(v6);
  }
  v2 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(v2, CFSTR("AcceptEAPTypes"), Mutable);
  v7 = (const void *)*MEMORY[0x24BDBD270];
  CFDictionarySetValue(v2, CFSTR("EAPFASTUsePAC"), (const void *)*MEMORY[0x24BDBD270]);
  CFDictionarySetValue(v2, CFSTR("EAPFASTProvisionPAC"), v7);
  CFRelease(Mutable);
  return v2;
}

void EAPOLClientConfigurationSetProfileForSSID(uint64_t a1, void *key, uint64_t a3)
{
  __CFDictionary *v4;
  const void *ID;

  v4 = *(__CFDictionary **)(a1 + 56);
  if (a3)
  {
    ID = (const void *)EAPOLClientProfileGetID(a3);
    CFDictionarySetValue(v4, key, ID);
  }
  else
  {
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 56), key);
  }
}

void EAPOLClientConfigurationSetProfileForWLANDomain(uint64_t a1, void *key, uint64_t a3)
{
  __CFDictionary *v4;
  const void *ID;

  v4 = *(__CFDictionary **)(a1 + 64);
  if (a3)
  {
    ID = (const void *)EAPOLClientProfileGetID(a3);
    CFDictionarySetValue(v4, key, ID);
  }
  else
  {
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 64), key);
  }
}

uint64_t __EAPOLClientConfigurationInitialize()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kEAPOLClientConfigurationTypeID = result;
  return result;
}

void __EAPOLClientConfigurationDeallocate(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 16);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a1 + 16) = 0;
  }
  my_CFRelease((const void **)(a1 + 24));
  my_CFRelease((const void **)(a1 + 32));
  my_CFRelease((const void **)(a1 + 40));
  my_CFRelease((const void **)(a1 + 48));
  my_CFRelease((const void **)(a1 + 56));
  my_CFRelease((const void **)(a1 + 64));
  my_CFRelease((const void **)(a1 + 72));
}

__CFString *__EAPOLClientConfigurationCopyDebugDesc(_QWORD *a1)
{
  const __CFAllocator *v2;
  __CFString *Mutable;
  __CFString *v4;

  v2 = CFGetAllocator(a1);
  Mutable = CFStringCreateMutable(v2, 0);
  v4 = Mutable;
  if (a1[2])
    CFStringAppendFormat(Mutable, 0, CFSTR("<EAPOLClientConfiguration %p [%p] auth> {"), a1, v2);
  else
    CFStringAppendFormat(Mutable, 0, CFSTR("<EAPOLClientConfiguration %p [%p]> {"), a1, v2);
  CFStringAppendFormat(v4, 0, CFSTR("profiles = %@"), a1[6]);
  CFStringAppendFormat(v4, 0, CFSTR("ssids = %@"), a1[7]);
  CFStringAppend(v4, CFSTR("}"));
  return v4;
}

CCCryptorRef sim_simulator_gsm_milenage_algo(int8x16_t *a1, void *key, int8x16_t *a3, _DWORD *a4, int8x8_t *a5)
{
  uint8x8_t v10;
  int8x16_t v11;
  uint64_t i;
  int8x16_t v13;
  uint64_t j;
  CCCryptorRef result;
  int16x8_t v16;
  int8x8_t v17;
  uint16x8_t v18;
  int8x16_t v19;
  int8x16_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19 = veorq_s8(*a3, *a1);
  sim_simulator_aes128_encrypt(key, &v19, &v20);
  v19 = veorq_s8(*a1, v20);
  v19.i8[15] ^= 1u;
  sim_simulator_aes128_encrypt(key, &v19, &v20);
  v10.i32[1] = v20.i32[1];
  v11 = veorq_s8(v20, *a1);
  v20 = v11;
  v11.i32[0] = v11.i32[2];
  v10.i32[0] = v20.i32[3];
  v17 = (int8x8_t)vmovl_u8(v10).u64[0];
  v18 = vmovl_u8(*(uint8x8_t *)v11.i8);
  v19 = veorq_s8(*a3, *a1);
  sim_simulator_aes128_encrypt(key, &v19, &v20);
  for (i = 0; i != 16; ++i)
    *(_BYTE *)((unint64_t)&v19 | ((int)i + 12) & 0xFLL) = a1->i8[i] ^ v20.i8[i];
  v19.i8[15] ^= 2u;
  sim_simulator_aes128_encrypt(key, &v19, &v20);
  v20 = veorq_s8(v20, *a1);
  v13 = v20;
  v19 = veorq_s8(*a3, *a1);
  sim_simulator_aes128_encrypt(key, &v19, &v20);
  for (j = 0; j != 16; ++j)
    *(_BYTE *)((unint64_t)&v19 | ((int)j + 8) & 0xFLL) = a1->i8[j] ^ v20.i8[j];
  v19.i8[15] ^= 4u;
  result = sim_simulator_aes128_encrypt(key, &v19, &v20);
  v20 = veorq_s8(v20, *a1);
  *a5 = veor_s8(veor_s8(veor_s8((int8x8_t)v13.u64[1], *(int8x8_t *)v13.i8), *(int8x8_t *)v20.i8), (int8x8_t)v20.u64[1]);
  v16.i64[1] = v18.i64[1];
  *(int8x8_t *)v16.i8 = veor_s8(v17, *(int8x8_t *)v18.i8);
  *a4 = vmovn_s16(v16).u32[0];
  return result;
}

CCCryptorRef sim_simulator_aes128_encrypt(void *key, const void *a2, void *a3)
{
  CCCryptorStatus v5;
  CCCryptorStatus v6;
  NSObject *LogHandle;
  os_log_type_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  CCCryptorStatus v12;
  CCCryptorStatus v13;
  NSObject *v14;
  os_log_type_t v15;
  CCCryptorRef result;
  size_t v17;
  CCCryptorRef cryptorRef;
  uint8_t buf[4];
  CCCryptorStatus v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  cryptorRef = 0;
  v5 = CCCryptorCreate(0, 0, 2u, key, 0x10uLL, 0, &cryptorRef);
  if (v5)
  {
    v6 = v5;
    LogHandle = EAPLogGetLogHandle();
    v8 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v8))
      goto LABEL_8;
    *(_DWORD *)buf = 67109120;
    v20 = v6;
    v9 = "CCCryptoCreate failed with %d";
    v10 = LogHandle;
    v11 = v8;
  }
  else
  {
    v12 = CCCryptorUpdate(cryptorRef, a2, 0x10uLL, a3, 0x10uLL, &v17);
    if (!v12)
      goto LABEL_8;
    v13 = v12;
    v14 = EAPLogGetLogHandle();
    v15 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v14, v15))
      goto LABEL_8;
    *(_DWORD *)buf = 67109120;
    v20 = v13;
    v9 = "CCCryptorUpdate failed with %d";
    v10 = v14;
    v11 = v15;
  }
  _os_log_impl(&dword_206440000, v10, v11, v9, buf, 8u);
LABEL_8:
  result = cryptorRef;
  if (cryptorRef)
    return (CCCryptorRef)CCCryptorRelease(cryptorRef);
  return result;
}

uint64_t EAPOLClientEstablishSession(uint64_t a1)
{
  mach_error_t v2;
  mach_error_t v3;
  NSObject *LogHandle;
  os_log_type_t v5;
  uint64_t result;
  const char *v7;
  uint8_t *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  mach_error_t v12;
  NSObject *v13;
  os_log_type_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  mach_port_t special_port[2];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  char *v22;
  __int128 v23[2];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)special_port = 0;
  v2 = bootstrap_look_up2();
  if (v2)
  {
    v3 = v2;
    LogHandle = EAPLogGetLogHandle();
    v5 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(LogHandle, v5);
    if (!(_DWORD)result)
      return result;
    LODWORD(v23[0]) = 136315138;
    *(_QWORD *)((char *)v23 + 4) = mach_error_string(v3);
    v7 = "eapolcontroller_server_port(): %s";
    v8 = (uint8_t *)v23;
    v9 = LogHandle;
    v10 = v5;
    v11 = 12;
    goto LABEL_7;
  }
  memset(v23, 0, sizeof(v23));
  __strlcpy_chk();
  result = eapolcontroller_client_get_session(0, v23, special_port, &special_port[1]);
  if ((_DWORD)result)
  {
    v12 = result;
    v13 = EAPLogGetLogHandle();
    v14 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(v13, v14);
    if (!(_DWORD)result)
      return result;
    v15 = mach_error_string(v12);
    *(_DWORD *)buf = 136315394;
    v20 = a1;
    v21 = 2080;
    v22 = v15;
    v7 = "eapolcontroller_client_get_session(%s): %s";
    v8 = buf;
    v9 = v13;
    v10 = v14;
    v11 = 22;
    goto LABEL_7;
  }
  if (special_port[0] && special_port[1])
  {
    task_set_special_port(*MEMORY[0x24BDAEC58], 4, special_port[0]);
    if (audit_session_join(special_port[1]))
      return 1;
    v16 = EAPLogGetLogHandle();
    v17 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(v16, v17);
    if ((_DWORD)result)
    {
      *(_WORD *)buf = 0;
      v7 = "audit_session_join returned AU_DEFAULTSID";
      v8 = buf;
      v9 = v16;
      v10 = v17;
      v11 = 2;
LABEL_7:
      _os_log_impl(&dword_206440000, v9, v10, v7, v8, v11);
      return 0;
    }
  }
  return result;
}

uint64_t eapmschapv2_server_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = 0;
  if (!*(_BYTE *)(v2 + 104))
    return 0;
  *a2 = 32;
  return v2 + 72;
}

uint64_t eapmschapv2_msk_copy_bytes(uint64_t *a1, _OWORD *a2, int a3)
{
  uint64_t v3;

  if (a3 < 64)
    return 0;
  v3 = *a1;
  if (!*(_BYTE *)(*a1 + 104))
    return 0;
  *a2 = *(_OWORD *)(v3 + 88);
  a2[1] = *(_OWORD *)(v3 + 72);
  a2[2] = 0u;
  a2[3] = 0u;
  return 64;
}

__CFArray *eapmschapv2_require_props(uint64_t *a1)
{
  uint64_t v1;
  __CFArray *Mutable;
  __CFArray *v3;

  v1 = *a1;
  if (!*(_BYTE *)(*a1 + 8) && !*(_BYTE *)(v1 + 9))
    return 0;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  v3 = Mutable;
  if (*(_BYTE *)(v1 + 8))
    CFArrayAppendValue(Mutable, CFSTR("UserPassword"));
  if (*(_BYTE *)(v1 + 9))
    CFArrayAppendValue(v3, CFSTR("NewPassword"));
  return v3;
}

__CFString *eapmschapv2_copy_packet_description(unsigned __int8 *a1, char *a2)
{
  uint64_t Length;
  uint64_t v5;
  __CFString *Mutable;
  char v7;
  const char *v9;
  unsigned int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  Length = EAPPacketGetLength((uint64_t)a1);
  if (*a1 - 1 > 1)
  {
    Mutable = 0;
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v5 = Length;
  Mutable = CFStringCreateMutable(0, 0);
  if (v5 <= 5)
  {
    CFStringAppendFormat(Mutable, 0, CFSTR("invalid packet: length %d < min length %ld\n"), v5, 9);
    goto LABEL_6;
  }
  v9 = EAPCodeStr(*a1);
  v10 = a1[5] - 1;
  if (v10 > 6)
    v11 = "<unknown>";
  else
    v11 = off_24BF0C9A8[(char)v10];
  CFStringAppendFormat(Mutable, 0, CFSTR("EAP-MSCHAPv2 %s: Identifier %d Length %d OpCode %s "), v9, a1[1], v5, v11);
  switch(a1[5])
  {
    case 1u:
      if (v5 <= 0x19)
      {
        CFStringAppendFormat(Mutable, 0, CFSTR("Error: length %d < %d\n"), v5, 26);
LABEL_50:
        v7 = 0;
        goto LABEL_51;
      }
      CFStringAppendFormat(Mutable, 0, CFSTR("MS-CHAPv2-ID %d MS-Length %d Value-Size %d\n"), a1[6], bswap32(*(unsigned __int16 *)(a1 + 7)) >> 16, a1[9]);
      if (a1[9] != 16)
        CFStringAppendFormat(Mutable, 0, CFSTR("Error: Value-Size should be %d\n"), 16);
      if (v5 - 5 != bswap32(*(unsigned __int16 *)(a1 + 7)) >> 16)
      {
        CFStringAppendFormat(Mutable, 0, CFSTR("Error: MS-Length should be %d\n"), v5 - 5, v19);
        goto LABEL_50;
      }
      CFStringAppendFormat(Mutable, 0, CFSTR("Challenge: "));
      print_bytes_cfstr(Mutable, (uint64_t)(a1 + 10), 16);
      CFStringAppendFormat(Mutable, 0, CFSTR("\n"));
      if ((_DWORD)v5 != 26)
        CFStringAppendFormat(Mutable, 0, CFSTR("Name: %.*s\n"), (v5 - 26), a1 + 26);
      v7 = 1;
LABEL_51:
      if (*a1 != 2)
        goto LABEL_7;
      CFStringAppendFormat(Mutable, 0, CFSTR("EAP Response contains MSCHAPv2 Challenge (invalid)\n"), v16, v19);
      goto LABEL_6;
    case 2u:
      if (v5 <= 0x3A)
      {
        CFStringAppendFormat(Mutable, 0, CFSTR("Error: length %d < %d\n"), v5, 59);
LABEL_54:
        v7 = 0;
        goto LABEL_55;
      }
      CFStringAppendFormat(Mutable, 0, CFSTR("MS-CHAPv2-ID %d MS-Length %d Value-Size %d\n"), a1[6], bswap32(*(unsigned __int16 *)(a1 + 7)) >> 16, a1[9]);
      if (a1[9] != 49)
        CFStringAppendFormat(Mutable, 0, CFSTR("Error: Value-Size should be %d\n"), 49);
      if (v5 - 5 != bswap32(*(unsigned __int16 *)(a1 + 7)) >> 16)
      {
        CFStringAppendFormat(Mutable, 0, CFSTR("Error: MS-Length should be %d\n"), v5 - 5, v20);
        goto LABEL_54;
      }
      CFStringAppendFormat(Mutable, 0, CFSTR("Response:\n"));
      CFStringAppendFormat(Mutable, 0, CFSTR("Peer Challenge: "));
      print_bytes_cfstr(Mutable, (uint64_t)(a1 + 10), 16);
      CFStringAppendFormat(Mutable, 0, CFSTR("\nReserved:       "));
      print_bytes_cfstr(Mutable, (uint64_t)(a1 + 26), 8);
      CFStringAppendFormat(Mutable, 0, CFSTR("\nNT Response:    "));
      print_bytes_cfstr(Mutable, (uint64_t)(a1 + 34), 24);
      CFStringAppendFormat(Mutable, 0, CFSTR("\nFlags:          "));
      v7 = 1;
      print_bytes_cfstr(Mutable, (uint64_t)(a1 + 58), 1);
      if ((_DWORD)v5 != 59)
        CFStringAppendFormat(Mutable, 0, CFSTR("\nName:           %.*s\n"), (v5 - 59), a1 + 59);
LABEL_55:
      if (*a1 == 1)
      {
        CFStringAppendFormat(Mutable, 0, CFSTR("EAP Request contains MSCHAPv2 Response (invalid)\n"), v17, v20);
        goto LABEL_6;
      }
LABEL_7:
      *a2 = v7;
      return Mutable;
    case 3u:
      if (*a1 != 1)
        goto LABEL_6;
      if (v5 <= 0x32)
      {
        v12 = 51;
        goto LABEL_26;
      }
      CFStringAppendFormat(Mutable, 0, CFSTR("MS-CHAPv2-ID %d MS-Length %d\n"), a1[6], bswap32(*(unsigned __int16 *)(a1 + 7)) >> 16);
      v13 = v5 - 5;
      if (v13 != bswap32(*(unsigned __int16 *)(a1 + 7)) >> 16)
        goto LABEL_48;
      CFStringAppendFormat(Mutable, 0, CFSTR("Auth Response: %.*s\n"), 42, a1 + 9);
      if ((v5 - 53) > 0xFFFFFFFD)
        goto LABEL_47;
      v14 = (v5 - 52);
      v15 = a1 + 52;
      goto LABEL_46;
    case 4u:
      if (*a1 != 1)
        goto LABEL_6;
      if (v5 <= 8)
      {
        v12 = 9;
        goto LABEL_26;
      }
      CFStringAppendFormat(Mutable, 0, CFSTR("MS-CHAPv2-ID %d MS-Length %d\n"), a1[6], bswap32(*(unsigned __int16 *)(a1 + 7)) >> 16);
      v13 = v5 - 5;
      if (v13 != bswap32(*(unsigned __int16 *)(a1 + 7)) >> 16)
        goto LABEL_48;
      v14 = (v5 - 9);
      if ((_DWORD)v5 != 9)
      {
        v15 = a1 + 9;
LABEL_46:
        CFStringAppendFormat(Mutable, 0, CFSTR("Message:       %.*s\n"), v14, v15);
      }
      goto LABEL_47;
    case 7u:
      if (v5 <= 0x24E)
      {
        v12 = 591;
LABEL_26:
        CFStringAppendFormat(Mutable, 0, CFSTR("Error: length %d < %d\n"), v5, v12);
        goto LABEL_6;
      }
      CFStringAppendFormat(Mutable, 0, CFSTR("MS-CHAPv2-ID %d MS-Length %d\n"), a1[6], bswap32(*(unsigned __int16 *)(a1 + 7)) >> 16);
      v13 = v5 - 5;
      if (v13 != bswap32(*(unsigned __int16 *)(a1 + 7)) >> 16)
      {
LABEL_48:
        CFStringAppendFormat(Mutable, 0, CFSTR("Error: MS-Length should be %d\n"), v13, v21);
        goto LABEL_6;
      }
      CFStringAppendFormat(Mutable, 0, CFSTR("Encrypted Password:\n"));
      print_data_cfstr(Mutable, (uint64_t)(a1 + 9), 516);
      CFStringAppendFormat(Mutable, 0, CFSTR("Encrypted Hash: "));
      print_bytes_cfstr(Mutable, (uint64_t)(a1 + 525), 16);
      CFStringAppendFormat(Mutable, 0, CFSTR("\n"));
      CFStringAppendFormat(Mutable, 0, CFSTR("Peer Challenge: "));
      print_bytes_cfstr(Mutable, (uint64_t)(a1 + 541), 16);
      CFStringAppendFormat(Mutable, 0, CFSTR("\n"));
      CFStringAppendFormat(Mutable, 0, CFSTR("Reserved: "));
      print_bytes_cfstr(Mutable, (uint64_t)(a1 + 557), 8);
      CFStringAppendFormat(Mutable, 0, CFSTR("\n"));
      CFStringAppendFormat(Mutable, 0, CFSTR("NT Response: "));
      print_bytes_cfstr(Mutable, (uint64_t)(a1 + 565), 24);
      CFStringAppendFormat(Mutable, 0, CFSTR("\n"));
      CFStringAppendFormat(Mutable, 0, CFSTR("NT Flags: "));
      print_bytes_cfstr(Mutable, (uint64_t)(a1 + 589), 2);
      CFStringAppendFormat(Mutable, 0, CFSTR("\n"), v18, v21);
LABEL_47:
      v7 = 1;
      goto LABEL_7;
    default:
      CFStringAppendFormat(Mutable, 0, CFSTR("Unknown code %d\n"), a1[5]);
      if (v5 >= 7)
        print_data_cfstr(Mutable, (uint64_t)(a1 + 6), v5 - 6);
      goto LABEL_6;
  }
}

char *EAPMSCHAPv2ResponsePacketCreate(uint64_t *a1, char a2, char a3, _DWORD *a4)
{
  const __CFData *Value;
  uint64_t v9;
  int v10;
  char *v11;
  _QWORD *v12;
  NSObject *LogHandle;
  os_log_type_t v14;
  __int128 v15;
  int v17;
  CFIndex Length;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a1[10], CFSTR("EAPMSCHAPv2ClientChallenge"));
  v9 = *a1;
  v10 = *((_DWORD *)a1 + 12) + 54;
  v11 = EAPPacketCreate((char *)(*a1 + 105), 1024, 2, a2, 26, 0, v10, 0);
  if (!Value)
  {
    MSChapFillWithRandom((_DWORD *)(v9 + 16), 0x10u);
    goto LABEL_5;
  }
  if (CFDataGetLength(Value) == 16)
  {
    *(_OWORD *)(v9 + 16) = *(_OWORD *)CFDataGetBytePtr(Value);
LABEL_5:
    MSChap2((const void *)(v9 + 56), (const void *)(v9 + 16), (char *)a1[5], (UInt8 *)a1[8], *((_DWORD *)a1 + 18), v9 + 32);
    v11[5] = 2;
    v11[6] = a3;
    *(_WORD *)(v11 + 7) = bswap32(v10) >> 16;
    v11[9] = 49;
    v12 = v11 + 10;
    if (Value)
    {
      *v12 = 0;
      *(_QWORD *)(v11 + 18) = 0;
    }
    else
    {
      *(_OWORD *)v12 = *(_OWORD *)(v9 + 16);
    }
    *(_QWORD *)(v11 + 26) = 0;
    v15 = *(_OWORD *)(v9 + 32);
    *(_QWORD *)(v11 + 50) = *(_QWORD *)(v9 + 48);
    *(_OWORD *)(v11 + 34) = v15;
    v11[58] = 0;
    memcpy(v11 + 59, (const void *)a1[5], *((unsigned int *)a1 + 12));
    return v11;
  }
  LogHandle = EAPLogGetLogHandle();
  v14 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v14))
  {
    v17 = 134218240;
    Length = CFDataGetLength(Value);
    v19 = 2048;
    v20 = 16;
    _os_log_impl(&dword_206440000, LogHandle, v14, "EAPMSCHAPv2ResponsePacketCreate: internal error %ld != %ld", (uint8_t *)&v17, 0x16u);
  }
  if (a4)
    *a4 = 8;
  v11 = 0;
  *(_DWORD *)(v9 + 4) = 2;
  return v11;
}

uint64_t mschap2_message_int32_attr(const char *a1, size_t __len, char *__little, _DWORD *a4)
{
  unsigned int v5;
  char *v6;
  BOOL v7;
  uint64_t v8;

  v5 = __len;
  v6 = strnstr(a1, __little, __len);
  v7 = v5 <= 2 || v6 == 0;
  v8 = !v7;
  if (!v7)
    *a4 = strtol(v6 + 2, 0, 10);
  return v8;
}

uint64_t EAPSecIdentityListCreate(_QWORD *a1)
{
  void *v2;
  void *v3;
  const __CFDictionary *v4;
  uint64_t v5;
  CFTypeRef v7;
  void *values[5];
  void *keys[6];

  keys[5] = *(void **)MEMORY[0x24BDAC8D0];
  v2 = (void *)*MEMORY[0x24BDE8F50];
  keys[0] = *(void **)MEMORY[0x24BDE9538];
  keys[1] = v2;
  v3 = (void *)*MEMORY[0x24BDE94D8];
  keys[2] = *(void **)MEMORY[0x24BDE9220];
  keys[3] = v3;
  keys[4] = *(void **)MEMORY[0x24BDE93B0];
  v7 = 0;
  values[0] = *(void **)MEMORY[0x24BDBD270];
  values[1] = CFSTR("com.apple.identities");
  values[2] = *(void **)MEMORY[0x24BDE9238];
  values[3] = values[0];
  values[4] = *(void **)MEMORY[0x24BDE93B8];
  v4 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 5, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v5 = SecItemCopyMatching(v4, &v7);
  CFRelease(v4);
  if (!(_DWORD)v5)
    *a1 = v7;
  return v5;
}

uint64_t EAPSecIdentityCreateTrustChainWithPersistentCertificateRefs(const void *a1, CFArrayRef theArray, __CFArray **a3)
{
  CFIndex Count;
  uint64_t v7;
  CFMutableArrayRef Mutable;
  __CFArray *v9;
  CFMutableDictionaryRef v10;
  __CFDictionary *v11;
  const void *ValueAtIndex;
  CFTypeID TypeID;
  CFTypeID v14;
  char v15;
  uint64_t v16;
  CFIndex v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  NSObject *LogHandle;
  os_log_type_t v22;
  const char *v23;
  NSObject *v25;
  os_log_type_t v26;
  void *key;
  CFTypeRef result;
  __CFArray *v29;
  CFMutableDictionaryRef v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  *a3 = 0;
  Count = CFArrayGetCount(theArray);
  if (!Count)
    return 4294967246;
  v7 = Count;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  v29 = Mutable;
  if (Mutable)
  {
    v9 = Mutable;
    CFArrayAppendValue(Mutable, a1);
    v10 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v30 = v10;
    if (v10)
    {
      v11 = v10;
      CFDictionaryAddValue(v10, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9228]);
      CFDictionaryAddValue(v11, (const void *)*MEMORY[0x24BDE94D8], (const void *)*MEMORY[0x24BDBD270]);
      if (v7 < 1)
        goto LABEL_20;
      result = 0;
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, 0);
      TypeID = CFDataGetTypeID();
      if (ValueAtIndex)
      {
        v14 = TypeID;
        v15 = 0;
        key = (void *)*MEMORY[0x24BDE9558];
        v16 = 4294967246;
        v17 = 1;
        while (CFGetTypeID(ValueAtIndex) == v14)
        {
          CFDictionarySetValue(v11, key, ValueAtIndex);
          v18 = SecItemCopyMatching(v11, &result);
          if ((_DWORD)v18)
          {
            v16 = v18;
            LogHandle = EAPLogGetLogHandle();
            v22 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(LogHandle, v22))
            {
              v23 = EAPSecurityErrorString(v16);
              *(_DWORD *)buf = 136315394;
              v32 = v23;
              v33 = 1024;
              v34 = v16;
              _os_log_impl(&dword_206440000, LogHandle, v22, "SecItemCopyMatching failed, %s (%d)", buf, 0x12u);
            }
            goto LABEL_23;
          }
          if (!isA_SecCertificate(result))
          {
            v25 = EAPLogGetLogHandle();
            v26 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v25, v26))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_206440000, v25, v26, "Certificate data with incorrect data type", buf, 2u);
            }
            goto LABEL_20;
          }
          CFArrayAppendValue(v9, result);
          my_CFRelease(&result);
          if (v7 == v17)
            goto LABEL_20;
          result = 0;
          ValueAtIndex = CFArrayGetValueAtIndex(theArray, v17);
          v14 = CFDataGetTypeID();
          v16 = 0;
          ++v17;
          v15 = 1;
          if (!ValueAtIndex)
            break;
        }
      }
      else
      {
        v15 = 0;
        v16 = 4294967246;
      }
      v19 = EAPLogGetLogHandle();
      v20 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v19, v20))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_206440000, v19, v20, "Persistent reference with incorrect data type.", buf, 2u);
      }
      if ((v15 & 1) != 0)
      {
LABEL_20:
        v16 = 0;
LABEL_24:
        *a3 = v9;
        my_CFRelease((const void **)&v30);
        return v16;
      }
    }
    else
    {
      v16 = 4294967188;
    }
LABEL_23:
    my_CFRelease((const void **)&v29);
    v9 = v29;
    goto LABEL_24;
  }
  return 4294967188;
}

uint64_t EAPSecIdentityCompareIdentityHandle(__SecIdentity *a1, const __CFData *a2, _BYTE *a3)
{
  uint64_t v6;
  NSObject *LogHandle;
  os_log_type_t v8;
  const char *v9;
  UInt8 *BytePtr;
  SecCertificateRef certificateRef;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  certificateRef = 0;
  v6 = 4294967246;
  if (isA_SecIdentity(a1) && a2 && a3)
  {
    *a3 = 0;
    v6 = SecIdentityCopyCertificate(a1, &certificateRef);
    if ((_DWORD)v6)
    {
      LogHandle = EAPLogGetLogHandle();
      v8 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v8))
      {
        v9 = EAPSecurityErrorString(v6);
        *(_DWORD *)buf = 136315394;
        v14 = v9;
        v15 = 1024;
        v16 = v6;
        _os_log_impl(&dword_206440000, LogHandle, v8, "SecIdentityCopyCertificate failed, %s (%d)", buf, 0x12u);
      }
    }
    else
    {
      BytePtr = (UInt8 *)CFDataGetBytePtr(a2);
      if (IdentityHandleMatchesCertificate(BytePtr))
        *a3 = 1;
    }
    my_CFRelease((const void **)&certificateRef);
  }
  return v6;
}

const void *isA_SecIdentity(const void *a1)
{
  CFTypeID TypeID;

  TypeID = SecIdentityGetTypeID();
  if (!a1)
    return 0;
  if (CFGetTypeID(a1) == TypeID)
    return a1;
  return 0;
}

BOOL IdentityHandleMatchesCertificate(_QWORD *a1)
{
  const __CFData *v2;
  const UInt8 *BytePtr;
  _BOOL8 v7;
  const __CFData *v8;
  const UInt8 *v9;

  v2 = (const __CFData *)SecCertificateCopySHA256Digest();
  if (CFDataGetLength(v2) != 32)
    IdentityHandleMatchesCertificate_cold_2();
  BytePtr = CFDataGetBytePtr(v2);
  if (*(_QWORD *)BytePtr == *a1
    && *((_QWORD *)BytePtr + 1) == a1[1]
    && *((_QWORD *)BytePtr + 2) == a1[2]
    && *((_QWORD *)BytePtr + 3) == a1[3])
  {
    v8 = (const __CFData *)SecCertificateCopySubjectPublicKeyInfoSHA256Digest();
    if (CFDataGetLength(v8) != 32)
      IdentityHandleMatchesCertificate_cold_1();
    v9 = CFDataGetBytePtr(v8);
    v7 = *(_QWORD *)v9 == a1[4]
      && *((_QWORD *)v9 + 1) == a1[5]
      && *((_QWORD *)v9 + 2) == a1[6]
      && *((_QWORD *)v9 + 3) == a1[7];
    CFRelease(v8);
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v2);
  return v7;
}

uint64_t EAPSecIdentityCreateTrustChain(__SecIdentity *a1, __CFArray **a2)
{
  const void *EAP;
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *LogHandle;
  os_log_type_t v9;
  const char *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  __CFArray *Mutable;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  const char *v18;
  CFIndex Count;
  __CFArray *MutableCopy;
  NSObject *v22;
  os_log_type_t v23;
  const char *v24;
  CFIndex CertificateCount;
  uint64_t v26;
  CFIndex i;
  SecCertificateRef CertificateAtIndex;
  NSObject *v29;
  os_log_type_t v30;
  __CFArray *v31;
  int v32;
  SecTrustRef trust;
  const void *v34;
  CFArrayRef v35;
  SecCertificateRef certificateRef;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  *a2 = 0;
  v35 = 0;
  certificateRef = 0;
  trust = 0;
  v32 = 0;
  v31 = 0;
  EAP = (const void *)SecPolicyCreateEAP();
  v34 = EAP;
  if (EAP)
  {
    v5 = EAP;
    v6 = SecIdentityCopyCertificate(a1, &certificateRef);
    if ((_DWORD)v6)
    {
      v7 = v6;
      LogHandle = EAPLogGetLogHandle();
      v9 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v9))
      {
        v10 = EAPSecurityErrorString(v7);
        *(_DWORD *)buf = 136315394;
        v38 = v10;
        v39 = 1024;
        v40 = v7;
        v11 = "SecIdentityCopyCertificate failed: %s (%d)";
LABEL_11:
        _os_log_impl(&dword_206440000, LogHandle, v9, v11, buf, 0x12u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    v35 = CFArrayCreate(0, (const void **)&certificateRef, 1, MEMORY[0x24BDBD690]);
    my_CFRelease((const void **)&certificateRef);
    v7 = SecTrustCreateWithCertificates(v35, v5, &trust);
    my_CFRelease((const void **)&v35);
    if ((_DWORD)v7)
    {
      LogHandle = EAPLogGetLogHandle();
      v9 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v9))
      {
        v15 = EAPSecurityErrorString(v7);
        *(_DWORD *)buf = 136315394;
        v38 = v15;
        v39 = 1024;
        v40 = v7;
        v11 = "SecTrustCreateWithCertificates failed: %s (%d)";
        goto LABEL_11;
      }
LABEL_12:
      Mutable = 0;
      goto LABEL_13;
    }
    v7 = EAPTLSSecTrustEvaluate(trust, (SecTrustResultType *)&v32);
    if ((_DWORD)v7)
    {
      v22 = EAPLogGetLogHandle();
      v23 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = EAPSecurityErrorString(v7);
        *(_DWORD *)buf = 136315394;
        v38 = v24;
        v39 = 1024;
        v40 = v7;
        _os_log_impl(&dword_206440000, v22, v23, "SecTrustEvaluate returned %s (%d)", buf, 0x12u);
      }
    }
    CertificateCount = SecTrustGetCertificateCount(trust);
    if (CertificateCount)
    {
      v26 = CertificateCount;
      Mutable = CFArrayCreateMutable(0, CertificateCount, MEMORY[0x24BDBD690]);
      if (v26 >= 1)
      {
        for (i = 0; i != v26; ++i)
        {
          CertificateAtIndex = SecTrustGetCertificateAtIndex(trust, i);
          CFArrayAppendValue(Mutable, CertificateAtIndex);
        }
      }
      v31 = Mutable;
    }
    else
    {
      v29 = EAPLogGetLogHandle();
      v30 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v29, v30))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_206440000, v29, v30, "SecTrustGetCertificateCount returned 0", buf, 2u);
      }
      Mutable = 0;
      v7 = 4294967246;
    }
  }
  else
  {
    v12 = EAPLogGetLogHandle();
    v13 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v12, v13))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206440000, v12, v13, "SecPolicyCreateEAP failed", buf, 2u);
    }
    Mutable = 0;
    v7 = 0;
  }
LABEL_13:
  my_CFRelease((const void **)&trust);
  my_CFRelease(&v34);
  if ((_DWORD)v7)
  {
    v16 = EAPLogGetLogHandle();
    v17 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = EAPSecurityErrorString(v7);
      *(_DWORD *)buf = 136315394;
      v38 = v18;
      v39 = 1024;
      v40 = v7;
      _os_log_impl(&dword_206440000, v16, v17, "EAPSecIdentityCreateCertificateTrustChain failed: %s (%d)", buf, 0x12u);
    }
  }
  else
  {
    Count = CFArrayGetCount(Mutable);
    MutableCopy = CFArrayCreateMutableCopy(0, Count, Mutable);
    CFArraySetValueAtIndex(MutableCopy, 0, a1);
    *a2 = MutableCopy;
  }
  my_CFRelease((const void **)&v31);
  return v7;
}

__CFData *EAPSecIdentityHandleCreate(__SecIdentity *a1)
{
  OSStatus v1;
  int v2;
  NSObject *LogHandle;
  os_log_type_t v4;
  const char *v5;
  __CFData *MutableCopy;
  const __CFData *v7;
  const __CFData *v8;
  const UInt8 *BytePtr;
  CFIndex Length;
  SecCertificateRef certificateRef;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  certificateRef = 0;
  v1 = SecIdentityCopyCertificate(a1, &certificateRef);
  if (v1)
  {
    v2 = v1;
    LogHandle = EAPLogGetLogHandle();
    v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v4))
    {
      v5 = EAPSecurityErrorString(v2);
      *(_DWORD *)buf = 136315394;
      v14 = v5;
      v15 = 1024;
      v16 = v2;
      _os_log_impl(&dword_206440000, LogHandle, v4, "SecIdentityCopyCertificate failed, %s (%d)", buf, 0x12u);
    }
    return 0;
  }
  else
  {
    v7 = (const __CFData *)SecCertificateCopySHA256Digest();
    if (CFDataGetLength(v7) != 32)
      EAPSecIdentityHandleCreate_cold_2();
    MutableCopy = CFDataCreateMutableCopy(0, 64, v7);
    CFRelease(v7);
    v8 = (const __CFData *)SecCertificateCopySubjectPublicKeyInfoSHA256Digest();
    if (CFDataGetLength(v8) != 32)
      EAPSecIdentityHandleCreate_cold_1();
    BytePtr = CFDataGetBytePtr(v8);
    Length = CFDataGetLength(v8);
    CFDataAppendBytes(MutableCopy, BytePtr, Length);
    CFRelease(v8);
    CFRelease(certificateRef);
  }
  return MutableCopy;
}

__CFString *EAPSecCertificateCopySHA1DigestString()
{
  const __CFData *SHA1Digest;
  CFIndex Length;
  const UInt8 *BytePtr;
  __CFString *Mutable;
  unsigned int v4;

  SHA1Digest = (const __CFData *)SecCertificateGetSHA1Digest();
  Length = CFDataGetLength(SHA1Digest);
  BytePtr = CFDataGetBytePtr(SHA1Digest);
  Mutable = CFStringCreateMutable(0, 0);
  if (Length >= 1)
  {
    do
    {
      v4 = *BytePtr++;
      CFStringAppendFormat(Mutable, 0, CFSTR("%02x"), v4);
      --Length;
    }
    while (Length);
  }
  return Mutable;
}

unsigned __int8 *NTSessionKey16(UInt8 *a1, unsigned int a2, uint64_t *a3, __int128 *a4, uint64_t *a5, unsigned __int8 *a6)
{
  CC_LONG v10;
  uint64_t v11;
  double v12;
  uint8x8_t v13;
  UInt8 data[512];
  unsigned __int8 v16[16];
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 md;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v10 = password_to_unicode(a1, a2, data);
  CC_MD4(data, v10, (unsigned __int8 *)&md);
  CC_MD4(&md, 0x10u, v16);
  v17 = *a3;
  v18 = *a4;
  v11 = *a5;
  v19 = *((_QWORD *)a4 + 2);
  v20 = v11;
  CC_MD4(data, v10, (unsigned __int8 *)&md);
  ChallengeResponse(a5, &md, (uint64_t)&v21, v12, v13);
  return CC_MD5(v16, 0x50u, a6);
}

const __CFString *password_to_unicode(UInt8 *bytes, unsigned int a2, UInt8 *a3)
{
  CFIndex v4;
  const __CFString *result;
  const __CFString *v6;
  CFIndex usedBufLen;
  CFRange v8;

  usedBufLen = 0;
  if (a2 >= 0x100)
    v4 = 256;
  else
    v4 = a2;
  result = CFStringCreateWithBytes(0, bytes, v4, 0x8000100u, 0);
  if (result)
  {
    v6 = result;
    v8.length = CFStringGetLength(result);
    v8.location = 0;
    CFStringGetBytes(v6, v8, 0x100u, 0, 0, a3, 512, &usedBufLen);
    CFRelease(v6);
    return (const __CFString *)usedBufLen;
  }
  return result;
}

uint64_t MSChap(void *a1, UInt8 *bytes, unsigned int a3, uint64_t a4)
{
  CC_LONG v6;
  double v7;
  uint8x8_t v8;
  UInt8 data[512];
  __int128 md;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = password_to_unicode(bytes, a3, data);
  CC_MD4(data, v6, (unsigned __int8 *)&md);
  return ChallengeResponse(a1, &md, a4, v7, v8);
}

uint64_t MSChap_MPPE(void *a1, UInt8 *bytes, unsigned int a3, uint64_t a4)
{
  CC_LONG v6;
  double v7;
  uint8x8_t v8;
  UInt8 data[512];
  __int128 v11;
  unsigned __int8 md[16];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = password_to_unicode(bytes, a3, data);
  CC_MD4(data, v6, md);
  CC_MD4(md, 0x10u, (unsigned __int8 *)&v11);
  return ChallengeResponse(a1, &v11, a4, v7, v8);
}

uint64_t NTPasswordBlockEncryptNewPasswordWithOldHash(UInt8 *a1, unsigned int a2, UInt8 *a3, unsigned int a4, void *a5)
{
  unsigned int v8;
  CC_LONG v9;
  uint64_t v10;
  uint64_t result;
  size_t dataOutMoved;
  UInt8 data[512];
  UInt8 __src[512];
  unsigned __int8 md[16];
  _BYTE dataIn[512];
  unsigned int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = password_to_unicode(a1, a2, __src);
  v9 = password_to_unicode(a3, a4, data);
  CC_MD4(data, v9, md);
  v10 = 0;
  memset(dataIn, 0, sizeof(dataIn));
  do
  {
    *(_DWORD *)&dataIn[v10] = arc4random();
    v10 += 4;
  }
  while ((_DWORD)v10 != 516);
  memmove(&dataIn[512 - v8], __src, v8);
  v17 = v8;
  dataOutMoved = 0;
  result = CCCrypt(0, 4u, 0, md, 0x10uLL, 0, dataIn, 0x204uLL, a5, 0x204uLL, &dataOutMoved);
  if ((_DWORD)result)
    return fprintf((FILE *)*MEMORY[0x24BDAC8D8], "rc4_encrypt: CCCrypt failed with %d\n", result);
  return result;
}

uint64_t NTPasswordHashEncryptOldWithNew(UInt8 *a1, unsigned int a2, UInt8 *a3, unsigned int a4, uint64_t a5)
{
  CC_LONG v8;
  CC_LONG v9;
  uint8x8_t v10;
  uint8x8_t v11;
  uint8x8_t v12;
  uint8x8_t v13;
  unsigned __int8 dataIn[8];
  uint64_t v16;
  UInt8 v17[512];
  unsigned __int8 md[7];
  char v19;
  UInt8 data[512];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = password_to_unicode(a1, a2, data);
  CC_MD4(data, v8, md);
  v9 = password_to_unicode(a3, a4, v17);
  CC_MD4(v17, v9, dataIn);
  DesEncrypt(dataIn, (uint64_t)md, (void *)a5, v10, v11);
  return DesEncrypt(&v16, (uint64_t)&v19, (void *)(a5 + 8), v12, v13);
}

void EAPOLSIMGenerationIncrement()
{
  SCPreferencesRef v0;
  const __SCPreferences *v1;
  const __CFNumber *Value;
  CFTypeID TypeID;
  NSObject *LogHandle;
  os_log_type_t v5;
  int v6;
  int valuePtr;
  SCPreferencesRef v8;
  _BYTE buf[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  valuePtr = 1;
  v0 = SCPreferencesCreate(0, CFSTR("EAPOLSIMPrefsManage"), CFSTR("com.apple.eapol.sim.generation.plist"));
  v8 = v0;
  if (v0)
  {
    v1 = v0;
    Value = (const __CFNumber *)SCPreferencesGetValue(v0, CFSTR("SIMGenerationID"));
    TypeID = CFNumberGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID)
      {
        CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
        ++valuePtr;
      }
    }
    *(_QWORD *)buf = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
    SCPreferencesSetValue(v1, CFSTR("SIMGenerationID"), *(CFPropertyListRef *)buf);
    SCPreferencesCommitChanges(v1);
    my_CFRelease((const void **)buf);
    my_CFRelease((const void **)&v8);
  }
  else
  {
    LogHandle = EAPLogGetLogHandle();
    v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v5))
    {
      v6 = SCError();
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = SCErrorString(v6);
      _os_log_impl(&dword_206440000, LogHandle, v5, "SCPreferencesCreate failed, %s", buf, 0xCu);
    }
  }
}

uint64_t EAPOLSIMGenerationGet()
{
  SCPreferencesRef v0;
  const __CFNumber *Value;
  CFTypeID TypeID;
  uint64_t result;
  NSObject *LogHandle;
  os_log_type_t v5;
  int v6;
  SCPreferencesRef v7;
  unsigned int valuePtr;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  valuePtr = 0;
  v0 = SCPreferencesCreate(0, CFSTR("EAPOLSIMPrefsManage"), CFSTR("com.apple.eapol.sim.generation.plist"));
  v7 = v0;
  if (v0)
  {
    Value = (const __CFNumber *)SCPreferencesGetValue(v0, CFSTR("SIMGenerationID"));
    TypeID = CFNumberGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID)
        CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
    }
    my_CFRelease((const void **)&v7);
    return valuePtr;
  }
  else
  {
    LogHandle = EAPLogGetLogHandle();
    v5 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(LogHandle, v5);
    if ((_DWORD)result)
    {
      v6 = SCError();
      *(_DWORD *)buf = 136315138;
      v10 = SCErrorString(v6);
      _os_log_impl(&dword_206440000, LogHandle, v5, "SCPreferencesCreate failed, %s", buf, 0xCu);
      return 0;
    }
  }
  return result;
}

uint64_t EAPSecKeychainPasswordItemRemove(uint64_t a1, void *a2)
{
  void *v2;
  const __CFDictionary *v3;
  uint64_t v4;
  NSObject *LogHandle;
  os_log_type_t v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x24BDAC8D0];
  v2 = (void *)*MEMORY[0x24BDE9128];
  keys[0] = *(void **)MEMORY[0x24BDE9220];
  keys[1] = v2;
  values[0] = *(void **)MEMORY[0x24BDE9230];
  values[1] = a2;
  v3 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v4 = SecItemDelete(v3);
  CFRelease(v3);
  if ((_DWORD)v4)
  {
    LogHandle = EAPLogGetLogHandle();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v6))
    {
      v8 = 136315394;
      v9 = EAPSecurityErrorString(v4);
      v10 = 1024;
      v11 = v4;
      _os_log_impl(&dword_206440000, LogHandle, v6, "SecItemDelete failed: %s (%d)", (uint8_t *)&v8, 0x12u);
    }
  }
  return v4;
}

uint64_t EAPKeychainSetIdentityReference(void *a1, void *a2, int a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CFDictionaryRef v9;
  uint64_t v10;
  CFDictionaryRef v12;
  void *values[6];
  void *keys[7];

  keys[6] = *(void **)MEMORY[0x24BDAC8D0];
  if (!a1)
    return 4294967246;
  if (a2)
  {
    v5 = (void *)*MEMORY[0x24BDE8F50];
    keys[0] = *(void **)MEMORY[0x24BDE9538];
    keys[1] = v5;
    v6 = (void *)*MEMORY[0x24BDE9550];
    keys[2] = *(void **)MEMORY[0x24BDE8FB8];
    keys[3] = v6;
    v7 = (void *)*MEMORY[0x24BDE9220];
    keys[4] = *(void **)MEMORY[0x24BDE8F60];
    keys[5] = v7;
    values[0] = *(void **)MEMORY[0x24BDBD270];
    values[1] = CFSTR("com.apple.identities");
    values[2] = a1;
    values[3] = a2;
    v8 = (void *)*MEMORY[0x24BDE9248];
    values[4] = *(void **)MEMORY[0x24BDE8F68];
    values[5] = v8;
    v9 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 6, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v12 = v9;
    if (!a3 || (v10 = EAPKeychainRemoveIdentityReference(a1), !(_DWORD)v10))
      v10 = SecItemAdd(v9, 0);
    my_CFRelease((const void **)&v12);
    return v10;
  }
  return EAPKeychainRemoveIdentityReference(a1);
}

uint64_t EAPKeychainRemoveIdentityReference(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  const __CFDictionary *v6;
  void *values[4];
  void *keys[5];

  keys[4] = *(void **)MEMORY[0x24BDAC8D0];
  v1 = (void *)*MEMORY[0x24BDE8FB8];
  keys[0] = *(void **)MEMORY[0x24BDE9538];
  keys[1] = v1;
  v2 = (void *)*MEMORY[0x24BDE9220];
  keys[2] = *(void **)MEMORY[0x24BDE8F50];
  keys[3] = v2;
  values[0] = *(void **)MEMORY[0x24BDBD270];
  values[1] = a1;
  v3 = (void *)*MEMORY[0x24BDE9248];
  values[2] = CFSTR("com.apple.identities");
  values[3] = v3;
  v6 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v4 = SecItemDelete(v6);
  my_CFRelease((const void **)&v6);
  return v4;
}

uint64_t EAPKeychainCopyIdentityReference(void *a1, CFTypeRef *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  const __CFDictionary *v7;
  void *values[5];
  void *keys[6];

  keys[5] = *(void **)MEMORY[0x24BDAC8D0];
  if (!a1)
    return 4294967246;
  *a2 = 0;
  v3 = (void *)*MEMORY[0x24BDE8F50];
  keys[0] = *(void **)MEMORY[0x24BDE9538];
  keys[1] = v3;
  v4 = (void *)*MEMORY[0x24BDE94C8];
  keys[2] = *(void **)MEMORY[0x24BDE8FB8];
  keys[3] = v4;
  keys[4] = *(void **)MEMORY[0x24BDE9220];
  values[0] = *(void **)MEMORY[0x24BDBD270];
  values[1] = CFSTR("com.apple.identities");
  values[2] = a1;
  values[3] = values[0];
  values[4] = *(void **)MEMORY[0x24BDE9248];
  v7 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 5, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v5 = SecItemCopyMatching(v7, a2);
  my_CFRelease((const void **)&v7);
  return v5;
}

uint64_t EAPKeychainRemovePasswordItem(void *a1)
{
  void *v1;
  uint64_t v2;
  const __CFDictionary *v4;
  void *values[3];
  void *keys[4];

  keys[3] = *(void **)MEMORY[0x24BDAC8D0];
  if (!a1)
    return 4294967246;
  v1 = (void *)*MEMORY[0x24BDE9128];
  keys[0] = *(void **)MEMORY[0x24BDE9538];
  keys[1] = v1;
  keys[2] = *(void **)MEMORY[0x24BDE9220];
  values[0] = *(void **)MEMORY[0x24BDBD270];
  values[1] = a1;
  values[2] = *(void **)MEMORY[0x24BDE9230];
  v4 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v2 = SecItemDelete(v4);
  my_CFRelease((const void **)&v4);
  return v2;
}

uint64_t EAPKeychainSetPasswordItem(void *a1, void *a2, void *a3, int a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFDictionary *v14;
  void *values[6];
  void *keys[7];

  keys[6] = *(void **)MEMORY[0x24BDAC8D0];
  if (!a1)
    return 4294967246;
  if (a4)
    EAPKeychainRemovePasswordItem(a1);
  v7 = (void *)*MEMORY[0x24BDE8FA8];
  keys[0] = *(void **)MEMORY[0x24BDE9538];
  keys[1] = v7;
  v8 = (void *)*MEMORY[0x24BDE9220];
  keys[2] = *(void **)MEMORY[0x24BDE9128];
  keys[3] = v8;
  v9 = (void *)*MEMORY[0x24BDE8F60];
  keys[4] = *(void **)MEMORY[0x24BDE9550];
  keys[5] = v9;
  values[0] = *(void **)MEMORY[0x24BDBD270];
  values[1] = a2;
  v10 = (void *)*MEMORY[0x24BDE9230];
  values[2] = a1;
  values[3] = v10;
  v11 = (void *)*MEMORY[0x24BDE8F68];
  values[4] = a3;
  values[5] = v11;
  v14 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 6, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v12 = SecItemAdd(v14, 0);
  my_CFRelease((const void **)&v14);
  return v12;
}

uint64_t EAPKeychainCopyPasswordItem(void *a1, _QWORD *a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CFTypeRef v9;
  CFTypeID TypeID;
  const void *v11;
  const void *Value;
  CFTypeRef v13;
  const void *v14;
  const void *v15;
  const void *v17;
  const void *v18;
  CFTypeRef result;
  const __CFDictionary *v20;
  void *values[5];
  void *keys[6];

  keys[5] = *(void **)MEMORY[0x24BDAC8D0];
  v17 = 0;
  v18 = 0;
  result = 0;
  if (!a1)
  {
    v13 = 0;
    v9 = 0;
    v8 = 4294967246;
    if (a2)
      goto LABEL_15;
    goto LABEL_7;
  }
  v5 = (void *)*MEMORY[0x24BDE9220];
  keys[0] = *(void **)MEMORY[0x24BDE9538];
  keys[1] = v5;
  v6 = (void *)*MEMORY[0x24BDE94C8];
  keys[2] = *(void **)MEMORY[0x24BDE9128];
  keys[3] = v6;
  keys[4] = *(void **)MEMORY[0x24BDE94C0];
  v7 = (void *)*MEMORY[0x24BDE9230];
  values[0] = *(void **)MEMORY[0x24BDBD270];
  values[1] = v7;
  values[2] = a1;
  values[3] = values[0];
  values[4] = values[0];
  v20 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 5, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v8 = SecItemCopyMatching(v20, &result);
  v9 = result;
  TypeID = CFDictionaryGetTypeID();
  if (!v9)
    goto LABEL_13;
  if (CFGetTypeID(v9) != TypeID)
  {
    v13 = 0;
    v9 = 0;
    goto LABEL_14;
  }
  v11 = (const void *)*MEMORY[0x24BDE8FA8];
  if (CFDictionaryContainsKey((CFDictionaryRef)result, (const void *)*MEMORY[0x24BDE8FA8]))
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)result, v11);
    v9 = CFRetain(Value);
    v18 = v9;
  }
  else
  {
    v9 = 0;
  }
  v14 = (const void *)*MEMORY[0x24BDE9550];
  if (CFDictionaryContainsKey((CFDictionaryRef)result, (const void *)*MEMORY[0x24BDE9550]))
  {
    v15 = CFDictionaryGetValue((CFDictionaryRef)result, v14);
    v13 = CFRetain(v15);
    v17 = v13;
  }
  else
  {
LABEL_13:
    v13 = 0;
  }
LABEL_14:
  my_CFRelease(&result);
  my_CFRelease((const void **)&v20);
  if (a2)
  {
LABEL_15:
    *a2 = v9;
    if (a3)
      goto LABEL_16;
    goto LABEL_8;
  }
LABEL_7:
  my_CFRelease(&v18);
  if (a3)
  {
LABEL_16:
    *a3 = v13;
    return v8;
  }
LABEL_8:
  my_CFRelease(&v17);
  return v8;
}

uint64_t EAPSecKeychainPasswordItemCreateUniqueWithAccess(uint64_t a1, uint64_t a2, const void *a3, const void *a4, const void *a5, const void *a6, CFStringRef *a7)
{
  CFStringRef v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v12 = my_CFUUIDStringCreate(0);
  v14 = EAPSecKeychainPasswordItemCreateWithAccess((uint64_t)v12, v13, v12, a3, a4, a5, a6);
  v15 = v14;
  if (!a7 || (_DWORD)v14)
  {
    if (a7)
      *a7 = 0;
    CFRelease(v12);
  }
  else
  {
    *a7 = v12;
  }
  return v15;
}

uint64_t EAPOLControlStart(uint64_t a1, const void *a2)
{
  ipc_space_t *v3;
  int *v4;
  kern_return_t v5;
  mach_error_t v6;
  NSObject *LogHandle;
  os_log_type_t v8;
  mach_port_name_t v9;
  mach_port_name_t v10;
  CFTypeID TypeID;
  CFDataRef Data;
  const __CFData *v13;
  int v14;
  const UInt8 *BytePtr;
  int Length;
  mach_error_t v17;
  mach_error_t v18;
  NSObject *v19;
  os_log_type_t v20;
  char *v21;
  int v22;
  NSObject *v23;
  os_log_type_t v24;
  NSObject *v26;
  os_log_type_t v27;
  mach_error_t v28;
  uint64_t v29;
  CFDataRef v30;
  uint8_t buf[4];
  char *v32;
  __int16 v33;
  mach_error_t v34;
  __int128 v35[2];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v29 = 0;
  v30 = 0;
  memset(v35, 0, sizeof(v35));
  v3 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  v4 = (int *)MEMORY[0x24BDAD2F0];
  v5 = mach_port_mod_refs(*MEMORY[0x24BDAEC58], *MEMORY[0x24BDAD2F0], 0, 1);
  v28 = v5;
  if (v5)
  {
    v6 = v5;
    LogHandle = EAPLogGetLogHandle();
    v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v8))
    {
      *(_DWORD *)buf = 136315394;
      v32 = mach_error_string(v6);
      v33 = 1024;
      v34 = v6;
      _os_log_impl(&dword_206440000, LogHandle, v8, "mach_port_mod_refs failed, %s (%d)", buf, 0x12u);
    }
    LODWORD(v29) = 6;
    goto LABEL_20;
  }
  v9 = audit_session_self();
  if (v9)
  {
    v10 = v9;
    if (get_server_port((uint64_t)&v29 + 4, &v28))
    {
      TypeID = CFDictionaryGetTypeID();
      if (!a2 || CFGetTypeID(a2) != TypeID)
      {
        v22 = 22;
        goto LABEL_18;
      }
      Data = CFPropertyListCreateData(0, a2, kCFPropertyListBinaryFormat_v1_0, 0, 0);
      v30 = Data;
      if (!Data)
      {
        v22 = 12;
        goto LABEL_18;
      }
      v13 = Data;
      __strlcpy_chk();
      v14 = HIDWORD(v29);
      BytePtr = CFDataGetBytePtr(v13);
      Length = CFDataGetLength(v13);
      v17 = eapolcontroller_start(v14, v35, (uint64_t)BytePtr, Length, *v4, v10, &v29);
      if (!v17)
      {
        if ((_DWORD)v29)
        {
          v26 = EAPLogGetLogHandle();
          v27 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v26, v27))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v32) = v29;
            _os_log_impl(&dword_206440000, v26, v27, "eapolcontroller_start: result is %d", buf, 8u);
          }
        }
        goto LABEL_19;
      }
      v18 = v17;
      v19 = EAPLogGetLogHandle();
      v20 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = mach_error_string(v18);
        *(_DWORD *)buf = 136315394;
        v32 = v21;
        v33 = 1024;
        v34 = v18;
        _os_log_impl(&dword_206440000, v19, v20, "eapolcontroller_start failed, %s (%d)", buf, 0x12u);
      }
    }
    v22 = 6;
LABEL_18:
    LODWORD(v29) = v22;
LABEL_19:
    mach_port_mod_refs(*v3, *v4, 0, -1);
    mach_port_deallocate(*v3, v10);
    goto LABEL_20;
  }
  LODWORD(v29) = 6;
  v23 = EAPLogGetLogHandle();
  v24 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v23, v24))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_206440000, v23, v24, "audit_session_self failed", buf, 2u);
  }
  mach_port_mod_refs(*v3, *v4, 0, -1);
LABEL_20:
  my_CFRelease((const void **)&v30);
  return v29;
}

uint64_t EAPOLControlStartWithClientItemID(uint64_t a1, uint64_t a2, const void *a3)
{
  const void *v5;
  CFTypeID TypeID;
  int Count;
  int v8;
  uint64_t v9;
  CFTypeRef *v10;
  NSObject *LogHandle;
  os_log_type_t v12;
  CFTypeRef v13;
  CFDictionaryRef v14;
  CFDictionaryRef v15;
  CFMutableDictionaryRef MutableCopy;
  CFMutableDictionaryRef v17;
  CFIndex v18;
  CFDictionaryRef v19;
  uint64_t v20;
  CFMutableDictionaryRef v22;
  void *values;
  CFMutableDictionaryRef v24;
  void *v25;
  const __CFString *v26;
  uint8_t buf[4];
  CFTypeRef v28;
  void *keys[2];
  __int128 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v25 = 0;
  v26 = 0;
  values = 0;
  v24 = 0;
  v22 = 0;
  if (!a3)
    goto LABEL_22;
  v5 = a3;
  TypeID = CFDictionaryGetTypeID();
  if (CFGetTypeID(v5) != TypeID)
    return 22;
  Count = CFDictionaryGetCount((CFDictionaryRef)v5);
  v8 = Count;
  if (!Count)
  {
LABEL_22:
    v15 = EAPOLClientItemIDCopyDictionary(a2);
    if (v15)
      goto LABEL_23;
    return 22;
  }
  if (Count > 5)
    return 22;
  v31 = 0;
  *(_OWORD *)keys = 0u;
  v30 = 0u;
  CFDictionaryGetKeysAndValues((CFDictionaryRef)v5, (const void **)keys, 0);
  if (v8 >= 1)
  {
    v9 = v8;
    v10 = (CFTypeRef *)keys;
    do
    {
      if (CFEqual(*v10, CFSTR("SaveCredentialsOnSuccessfulAuthentication")))
      {
        if (v8 == 1)
        {
          LogHandle = EAPLogGetLogHandle();
          v12 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v12))
          {
            v13 = *v10;
            *(_DWORD *)buf = 138412290;
            v28 = v13;
            _os_log_impl(&dword_206440000, LogHandle, v12, "Ignoring %@ since no credentials were specified", buf, 0xCu);
          }
          v5 = 0;
        }
      }
      else if (!CFEqual(*v10, CFSTR("UserName"))
             && !CFEqual(*v10, CFSTR("UserPassword"))
             && !CFEqual(*v10, CFSTR("TLSIdentityHandle"))
             && !CFEqual(*v10, CFSTR("DisableUserInteraction")))
      {
        return 22;
      }
      ++v10;
    }
    while (--v9);
  }
  v14 = EAPOLClientItemIDCopyDictionary(a2);
  if (!v14)
    return 22;
  v15 = v14;
  if (!v5)
  {
LABEL_23:
    v25 = CFSTR("ClientItemID");
    values = v15;
    goto LABEL_24;
  }
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)v5);
  v22 = MutableCopy;
  values = v15;
  v25 = CFSTR("ClientItemID");
  if (MutableCopy)
  {
    v17 = MutableCopy;
    if (CFDictionaryGetCount(MutableCopy) >= 1)
    {
      v26 = CFSTR("EAPClientConfiguration");
      v24 = v17;
      v18 = 2;
      goto LABEL_25;
    }
  }
LABEL_24:
  v18 = 1;
LABEL_25:
  v19 = CFDictionaryCreate(0, (const void **)&v25, (const void **)&values, v18, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFRelease(v15);
  my_CFRelease((const void **)&v22);
  v20 = EAPOLControlStart(a1, v19);
  if (v19)
    CFRelease(v19);
  return v20;
}

uint64_t EAPOLControlStop()
{
  mach_error_t v0;
  mach_error_t v2;
  uint64_t v3;
  __int128 v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  memset(v4, 0, sizeof(v4));
  v3 = 0;
  v2 = 0;
  if (!get_server_port((uint64_t)&v3 + 4, &v2))
    return 6;
  __strlcpy_chk();
  v0 = eapolcontroller_stop(HIDWORD(v3), v4, &v3);
  if (v0)
  {
    mach_error("eapolcontroller_start failed", v0);
    return 6;
  }
  return v3;
}

uint64_t EAPOLControlUpdate(uint64_t a1, const void *a2)
{
  CFTypeID TypeID;
  CFDataRef Data;
  const __CFData *v5;
  mach_port_t v6;
  const UInt8 *BytePtr;
  int Length;
  mach_error_t v9;
  int v10;
  mach_error_t v12;
  uint64_t v13;
  CFDataRef v14;
  __int128 v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v14 = 0;
  memset(v15, 0, sizeof(v15));
  v12 = 0;
  if (!get_server_port((uint64_t)&v13 + 4, &v12))
    goto LABEL_7;
  TypeID = CFDictionaryGetTypeID();
  if (!a2 || CFGetTypeID(a2) != TypeID)
  {
    v10 = 22;
    goto LABEL_9;
  }
  Data = CFPropertyListCreateData(0, a2, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  v14 = Data;
  if (!Data)
  {
    v10 = 12;
    goto LABEL_9;
  }
  v5 = Data;
  __strlcpy_chk();
  v6 = HIDWORD(v13);
  BytePtr = CFDataGetBytePtr(v5);
  Length = CFDataGetLength(v5);
  v9 = eapolcontroller_update(v6, v15, (uint64_t)BytePtr, Length, (int *)&v13);
  if (v9)
  {
    mach_error("eapolcontroller_update failed", v9);
LABEL_7:
    v10 = 6;
LABEL_9:
    LODWORD(v13) = v10;
  }
  my_CFRelease((const void **)&v14);
  return v13;
}

uint64_t EAPOLControlRetry()
{
  mach_error_t v0;
  mach_error_t v2;
  uint64_t v3;
  __int128 v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  memset(v4, 0, sizeof(v4));
  v3 = 0;
  v2 = 0;
  if (!get_server_port((uint64_t)&v3, &v2))
    return 6;
  __strlcpy_chk();
  v0 = eapolcontroller_retry(v3, v4, (_DWORD *)&v3 + 1);
  if (v0)
  {
    mach_error("eapolcontroller_retry failed", v0);
    return 6;
  }
  return HIDWORD(v3);
}

uint64_t EAPOLControlProvideUserInput(uint64_t a1, const UInt8 *BytePtr)
{
  CFTypeID TypeID;
  CFDataRef Data;
  const __CFData *v5;
  int Length;
  mach_error_t v7;
  int v8;
  mach_error_t v10;
  uint64_t v11;
  CFDataRef v12;
  __int128 v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v12 = 0;
  memset(v13, 0, sizeof(v13));
  v10 = 0;
  if (!get_server_port((uint64_t)&v11 + 4, &v10))
    goto LABEL_9;
  if (BytePtr)
  {
    TypeID = CFDictionaryGetTypeID();
    if (CFGetTypeID(BytePtr) != TypeID)
    {
      v8 = 22;
      goto LABEL_12;
    }
    Data = CFPropertyListCreateData(0, BytePtr, kCFPropertyListBinaryFormat_v1_0, 0, 0);
    v12 = Data;
    if (!Data)
    {
      v8 = 12;
      goto LABEL_12;
    }
    v5 = Data;
    BytePtr = CFDataGetBytePtr(Data);
    Length = CFDataGetLength(v5);
  }
  else
  {
    Length = 0;
  }
  __strlcpy_chk();
  v7 = eapolcontroller_provide_user_input(HIDWORD(v11), v13, (uint64_t)BytePtr, Length, (int *)&v11);
  if (v7)
  {
    mach_error("eapolcontroller_provide_user_input failed", v7);
LABEL_9:
    v8 = 6;
LABEL_12:
    LODWORD(v11) = v8;
  }
  my_CFRelease((const void **)&v12);
  return v11;
}

uint64_t EAPOLControlSetLogLevel()
{
  return 22;
}

uint64_t EAPOLControlStartSystem(uint64_t a1, const UInt8 *BytePtr)
{
  CFTypeID TypeID;
  CFDataRef Data;
  const __CFData *v5;
  int Length;
  mach_error_t started;
  mach_error_t v8;
  NSObject *LogHandle;
  os_log_type_t v10;
  char *v11;
  int v12;
  NSObject *v13;
  os_log_type_t v14;
  mach_error_t v16;
  uint64_t v17;
  CFDataRef v18;
  uint8_t buf[4];
  char *v20;
  __int16 v21;
  mach_error_t v22;
  __int128 v23[2];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  v18 = 0;
  memset(v23, 0, sizeof(v23));
  v16 = 0;
  if (!get_server_port((uint64_t)&v17 + 4, &v16))
  {
LABEL_10:
    v12 = 6;
LABEL_16:
    LODWORD(v17) = v12;
    goto LABEL_17;
  }
  if (BytePtr)
  {
    TypeID = CFDictionaryGetTypeID();
    if (CFGetTypeID(BytePtr) != TypeID)
    {
      v12 = 22;
      goto LABEL_16;
    }
    Data = CFPropertyListCreateData(0, BytePtr, kCFPropertyListBinaryFormat_v1_0, 0, 0);
    v18 = Data;
    if (!Data)
    {
      v12 = 12;
      goto LABEL_16;
    }
    v5 = Data;
    BytePtr = CFDataGetBytePtr(Data);
    Length = CFDataGetLength(v5);
  }
  else
  {
    Length = 0;
  }
  __strlcpy_chk();
  started = eapolcontroller_start_system(HIDWORD(v17), v23, (uint64_t)BytePtr, Length, (int *)&v17);
  if (started)
  {
    v8 = started;
    LogHandle = EAPLogGetLogHandle();
    v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v10))
    {
      v11 = mach_error_string(v8);
      *(_DWORD *)buf = 136315394;
      v20 = v11;
      v21 = 1024;
      v22 = v8;
      _os_log_impl(&dword_206440000, LogHandle, v10, "eapolcontroller_start_system failed, %s (%d)", buf, 0x12u);
    }
    goto LABEL_10;
  }
  if ((_DWORD)v17)
  {
    v13 = EAPLogGetLogHandle();
    v14 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = v17;
      _os_log_impl(&dword_206440000, v13, v14, "eapolcontroller_start_system: result is %d", buf, 8u);
    }
  }
LABEL_17:
  my_CFRelease((const void **)&v18);
  return v17;
}

uint64_t EAPOLControlStartSystemWithClientItemID(uint64_t a1, uint64_t a2)
{
  const UInt8 *v3;
  uint64_t started;
  const __CFString *v6;
  void *values;

  values = EAPOLClientItemIDCopyDictionary(a2);
  if (!values)
    return 22;
  v6 = CFSTR("ClientItemID");
  v3 = (const UInt8 *)CFDictionaryCreate(0, (const void **)&v6, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFRelease(values);
  started = EAPOLControlStartSystem(a1, v3);
  if (v3)
    CFRelease(v3);
  return started;
}

CFStringRef EAPOLControlAnyInterfaceKeyCreate()
{
  return SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, (CFStringRef)*MEMORY[0x24BDF59B0], (CFStringRef)*MEMORY[0x24BDF5990], (CFStringRef)*MEMORY[0x24BDF59E0]);
}

uint64_t chap_md5(char a1, const void *a2, CC_LONG a3, const void *a4, CC_LONG a5, unsigned __int8 *a6)
{
  CC_MD5_CTX v12;
  char data;

  data = a1;
  memset(&v12, 0, sizeof(v12));
  CC_MD5_Init(&v12);
  CC_MD5_Update(&v12, &data, 1u);
  CC_MD5_Update(&v12, a2, a3);
  CC_MD5_Update(&v12, a4, a5);
  return CC_MD5_Final(a6, &v12);
}

void print_bytes_cfstr(CFMutableStringRef theString, uint64_t a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  const char *v7;

  if (a3 >= 1)
  {
    v5 = 0;
    v6 = a3;
    do
    {
      if ((v5 & 7) != 0)
        v7 = " ";
      else
        v7 = "  ";
      if (!v5)
        v7 = (const char *)&unk_206473DB9;
      CFStringAppendFormat(theString, 0, CFSTR("%s%02x"), v7, *(unsigned __int8 *)(a2 + v5++));
    }
    while (v6 != v5);
  }
}

void print_data_cfstr(CFMutableStringRef theString, uint64_t a2, int a3)
{
  uint64_t v5;
  int v6;
  uint64_t v8;
  int v9;
  int v10;
  unsigned __int8 v11;
  char v12;
  const char *v13;
  uint64_t v14;
  _BYTE v15[16];
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a3 >= 1)
  {
    v5 = 0;
    v6 = 0;
    v8 = MEMORY[0x24BDAC740];
    do
    {
      if (!v6)
        CFStringAppendFormat(theString, 0, CFSTR("%04x "), v5);
      v9 = *(char *)(a2 + v5);
      if (v9 < 0)
        v10 = __maskrune(*(unsigned __int8 *)(a2 + v5), 0x40000uLL);
      else
        v10 = *(_DWORD *)(v8 + 4 * *(unsigned __int8 *)(a2 + v5) + 60) & 0x40000;
      v11 = *(_BYTE *)(a2 + v5);
      if (v10)
        v12 = v9;
      else
        v12 = 46;
      v15[v6] = v12;
      CFStringAppendFormat(theString, 0, CFSTR(" %02x"), v11);
      if (v6 == 7)
      {
        CFStringAppendFormat(theString, 0, CFSTR(" "));
        v6 = 8;
      }
      else if (v6 == 15)
      {
        v16 = 0;
        CFStringAppendFormat(theString, 0, CFSTR("  %s\n"), v15);
        v6 = 0;
      }
      else
      {
        ++v6;
      }
      ++v5;
    }
    while (a3 != (_DWORD)v5);
    if (v6)
    {
      if (v6 >= 8)
        v13 = (const char *)&unk_206473DB9;
      else
        v13 = " ";
      if (v6 <= 15)
      {
        v14 = v6;
        do
        {
          CFStringAppendFormat(theString, 0, CFSTR("   "));
          v15[v14++] = 32;
        }
        while ((_DWORD)v14 != 16);
      }
      v16 = 0;
      CFStringAppendFormat(theString, 0, CFSTR("  %s%s\n"), v13, v15);
    }
  }
}

uint64_t fprint_bytes(FILE *a1, uint64_t a2, int a3)
{
  __CFString *Mutable;
  __CFString *v7;

  Mutable = CFStringCreateMutable(0, 0);
  v7 = Mutable;
  if (!a1)
    a1 = (FILE *)*MEMORY[0x24BDAC8E8];
  print_bytes_cfstr(Mutable, a2, a3);
  SCPrint();
  CFRelease(v7);
  return fflush(a1);
}

uint64_t fprint_data(FILE *a1, uint64_t a2, int a3)
{
  __CFString *Mutable;
  FILE *v7;

  Mutable = CFStringCreateMutable(0, 0);
  print_data_cfstr(Mutable, a2, a3);
  if (a1)
    v7 = a1;
  else
    v7 = (FILE *)*MEMORY[0x24BDAC8E8];
  SCPrint();
  CFRelease(Mutable);
  return fflush(v7);
}

uint64_t print_bytes(uint64_t a1, int a2)
{
  return fprint_bytes(0, a1, a2);
}

uint64_t print_data(uint64_t a1, int a2)
{
  return fprint_data(0, a1, a2);
}

uint64_t sockaddr_dl_print(unsigned __int8 *a1)
{
  unint64_t v2;
  const char *v3;

  printf("link: len %d index %d family %d type 0x%x nlen %d alen %d slen %d addr ", *a1, *((unsigned __int16 *)a1 + 1), a1[1], a1[4], a1[5], a1[6], a1[7]);
  if (a1[6])
  {
    v2 = 0;
    do
    {
      if (v2)
        v3 = ":";
      else
        v3 = (const char *)&unk_206473DB9;
      printf("%s%x", v3, a1[a1[5] + 8 + v2++]);
    }
    while (v2 < a1[6]);
  }
  return putchar(10);
}

uint64_t LinkAddresses_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t LinkAddresses_element(uint64_t a1, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0 || *(_DWORD *)(a1 + 8) <= (signed int)a2)
    return 0;
  else
    return *(_QWORD *)(*(_QWORD *)a1 + 8 * a2);
}

uint64_t leap_init(_QWORD *a1, _QWORD *a2, _DWORD *a3)
{
  _DWORD *v4;
  _DWORD *v5;
  uint64_t result;

  *a3 = 0;
  *a2 = 0;
  v4 = malloc_type_malloc(0xA4uLL, 0x100004083268C5DuLL);
  if (!v4)
    return 2;
  v5 = v4;
  result = 0;
  v5[40] = 0;
  *((_OWORD *)v5 + 8) = 0u;
  *((_OWORD *)v5 + 9) = 0u;
  *((_OWORD *)v5 + 6) = 0u;
  *((_OWORD *)v5 + 7) = 0u;
  *((_OWORD *)v5 + 4) = 0u;
  *((_OWORD *)v5 + 5) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  *((_OWORD *)v5 + 3) = 0u;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *a1 = v5;
  return result;
}

void leap_free(void **a1)
{
  void *v1;

  v1 = *a1;
  if (v1)
    free(v1);
}

uint64_t leap_process(uint64_t *a1, uint64_t a2, _QWORD *a3, _DWORD *a4, _DWORD *a5)
{
  int *v5;
  UInt8 *v6;
  unsigned int Length;
  _BYTE *v11;
  uint64_t result;
  int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v21;
  uint64_t v22;
  char v23;
  uint32_t v24;
  _BYTE *v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x24BDAC8D0];
  v5 = (int *)*a1;
  *a4 = 0;
  *a5 = 0;
  *a3 = 0;
  v6 = (UInt8 *)a1[8];
  if (v6)
  {
    switch(*(_BYTE *)a2)
    {
      case 1:
        Length = EAPPacketGetLength(a2);
        if (Length >= 8 && (Length & 0xFFF8) != 8 && *(_BYTE *)(a2 + 7) == 8)
        {
          *(_QWORD *)(v5 + 1) = *(_QWORD *)(a2 + 8);
          MSChap(v5 + 1, (UInt8 *)a1[8], *((_DWORD *)a1 + 18), (uint64_t)v26);
          v11 = LEAPPacketCreate(2, v26, 0x18u, *(_BYTE *)(a2 + 1), (const void *)a1[5], *((_DWORD *)a1 + 12));
          result = 0;
          *a3 = v11;
          v13 = 1;
          goto LABEL_24;
        }
        snprintf((char *)v5 + 36, 0x80uLL, "LEAPVerifyRequest: packet is too short %d");
        goto LABEL_29;
      case 2:
        if (*v5 != 2)
          return 0;
        v14 = *((_DWORD *)a1 + 18);
        v15 = EAPPacketGetLength(a2);
        if (v15 >= 8 && *(_BYTE *)(a2 + 7) == 24 && (unint64_t)((__int16)v15 - 8) > 0x17)
        {
          MSChap_MPPE(v5 + 3, v6, v14, (uint64_t)v26);
          v16 = *(_QWORD *)(a2 + 8);
          v17 = *(_QWORD *)(a2 + 16);
          v18 = a2 + 8;
          if (v26[0] == v16 && v26[1] == v17 && v26[2] == *(_QWORD *)(v18 + 16))
          {
            NTSessionKey16(v6, v14, (uint64_t *)(v5 + 3), (__int128 *)v18, (uint64_t *)(v5 + 1), (unsigned __int8 *)v5 + 20);
            *v5 = 3;
            return 1;
          }
          strcpy((char *)v5 + 36, "LEAPVerifyResponse: server failed mutual authentication");
        }
        else
        {
          snprintf((char *)v5 + 36, 0x80uLL, "LEAPVerifyResponse: packet is too short %d");
        }
LABEL_29:
        *v5 = 4;
LABEL_30:
        result = 2;
        break;
      case 3:
        v21 = *v5;
        if (*v5 != 1)
          return 0;
        v22 = 3;
        do
        {
          v23 = v21;
          v24 = arc4random();
          LOBYTE(v21) = 0;
          v5[v22++] = v24;
        }
        while ((v23 & 1) != 0);
        v25 = LEAPPacketCreate(1, v5 + 3, 8u, *(_BYTE *)(a2 + 1), (const void *)a1[5], *((_DWORD *)a1 + 12));
        result = 0;
        *a3 = v25;
        v13 = 2;
LABEL_24:
        *v5 = v13;
        return result;
      case 4:
        *a4 = 1;
        *v5 = 4;
        strcpy((char *)v5 + 36, "server sent failure");
        goto LABEL_30;
      default:
        return 0;
    }
  }
  else
  {
    result = 0;
    *a4 = 3;
  }
  return result;
}

void leap_free_packet(int a1, void *a2)
{
  if (a2)
    free(a2);
}

uint64_t leap_failure_string(_QWORD *a1)
{
  if (*(_DWORD *)*a1 == 4)
    return *a1 + 36;
  else
    return 0;
}

uint64_t leap_session_key(_DWORD **a1, int *a2)
{
  int v2;
  uint64_t result;

  v2 = 16 * (**a1 == 3);
  if (**a1 == 3)
    result = (uint64_t)(*a1 + 5);
  else
    result = 0;
  *a2 = v2;
  return result;
}

uint64_t leap_server_key(_DWORD **a1, int *a2)
{
  int v2;
  uint64_t result;

  v2 = 16 * (**a1 == 3);
  if (**a1 == 3)
    result = (uint64_t)(*a1 + 5);
  else
    result = 0;
  *a2 = v2;
  return result;
}

uint64_t leap_msk_copy_bytes(_QWORD *a1, uint64_t a2, int a3)
{
  _DWORD *v3;

  if (a3 < 64)
    return 0;
  v3 = (_DWORD *)*a1;
  if (*(_DWORD *)*a1 != 3)
    return 0;
  *(_OWORD *)a2 = *(_OWORD *)(v3 + 5);
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(v3 + 5);
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  return 64;
}

CFArrayRef leap_require_props(uint64_t a1)
{
  void *values;

  if (*(_QWORD *)(a1 + 64))
    return 0;
  values = CFSTR("UserPassword");
  return CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x24BDBD690]);
}

_BYTE *LEAPPacketCreate(char a1, const void *a2, unsigned int a3, char a4, const void *a5, int a6)
{
  int v12;
  _BYTE *v13;
  _BYTE *v14;

  v12 = a3 + a6 + 8;
  v13 = malloc_type_malloc(v12, 0x86CE80CBuLL);
  v14 = v13;
  if (v13)
  {
    *v13 = a1;
    v13[1] = a4;
    EAPPacketSetLength((uint64_t)v13, (unsigned __int16)v12);
    *((_WORD *)v14 + 2) = 273;
    v14[6] = 0;
    v14[7] = a3;
    memmove(v14 + 8, a2, a3);
    memmove(&v14[a3 + 8], a5, a6);
  }
  return v14;
}

uint64_t my_CFEqual(const void *a1, const void *a2)
{
  if (!a1)
    return a2 == 0;
  if (a2)
    return CFEqual(a1, a2);
  return 0;
}

UInt8 *S_copy_cstring(const __CFString *a1, CFRange a2, CFStringEncoding a3)
{
  CFIndex length;
  CFIndex location;
  UInt8 *v7;
  CFIndex maxBufLen;
  CFRange v10;

  length = a2.length;
  location = a2.location;
  maxBufLen = 0;
  CFStringGetBytes(a1, a2, a3, 0, 0, 0, 0, &maxBufLen);
  if (maxBufLen < 1)
    return 0;
  v7 = (UInt8 *)malloc_type_malloc(maxBufLen + 1, 0x1D5920EEuLL);
  v10.location = location;
  v10.length = length;
  CFStringGetBytes(a1, v10, a3, 0, 0, v7, maxBufLen, &maxBufLen);
  v7[maxBufLen] = 0;
  return v7;
}

CFPropertyListRef my_CFPropertyListCreateFromFile(const char *a1)
{
  off_t st_size;
  void *v3;
  void *v4;
  int v5;
  int v6;
  const __CFData *v7;
  const __CFData *v8;
  CFPropertyListRef v9;
  stat v11;

  memset(&v11, 0, sizeof(v11));
  if (stat(a1, &v11) < 0)
    return 0;
  st_size = v11.st_size;
  if (!v11.st_size)
    return 0;
  v3 = malloc_type_malloc(v11.st_size, 0xFBACAD14uLL);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = open(a1, 0);
  if ((v5 & 0x80000000) == 0)
  {
    v6 = v5;
    read(v5, v4, st_size);
    close(v6);
  }
  v7 = CFDataCreate(0, (const UInt8 *)v4, st_size);
  if (v7)
  {
    v8 = v7;
    v9 = CFPropertyListCreateWithData(0, v7, 0, 0, 0);
    CFRelease(v8);
  }
  else
  {
    v9 = 0;
  }
  free(v4);
  return v9;
}

uint64_t my_CFPropertyListWriteFile(CFPropertyListRef propertyList, const std::__fs::filesystem::path *a2)
{
  const __CFData *Data;
  const __CFData *v4;
  const UInt8 *BytePtr;
  size_t Length;
  int v7;
  int v8;
  std::error_code *v9;
  uint64_t v10;
  std::__fs::filesystem::path __str[42];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!propertyList)
    return 0;
  Data = CFPropertyListCreateData(0, propertyList, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (!Data)
    return 0;
  v4 = Data;
  BytePtr = CFDataGetBytePtr(Data);
  Length = CFDataGetLength(v4);
  snprintf((char *)__str, 0x400uLL, "%s-", (const char *)a2);
  v7 = open((const char *)__str, 1537, 420);
  if (v7 < 0)
  {
    v10 = 0xFFFFFFFFLL;
  }
  else
  {
    v8 = v7;
    if (write(v7, BytePtr, Length) == Length)
    {
      rename(__str, a2, v9);
      v10 = 0;
    }
    else
    {
      v10 = 0xFFFFFFFFLL;
    }
    close(v8);
  }
  CFRelease(v4);
  return v10;
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

CFStringRef my_CFStringCreateWithData(const void *a1)
{
  const __CFAllocator *v2;
  uint64_t v3;
  char v4;
  char v5;
  const UInt8 *BytePtr;
  CFIndex Length;
  CFStringRef result;

  v2 = CFGetAllocator(a1);
  v3 = 0;
  v4 = 1;
  do
  {
    v5 = v4;
    BytePtr = CFDataGetBytePtr((CFDataRef)a1);
    Length = CFDataGetLength((CFDataRef)a1);
    result = CFStringCreateWithBytes(v2, BytePtr, Length, S_encodings[v3], 0);
    if (result)
      break;
    v4 = 0;
    v3 = 1;
  }
  while ((v5 & 1) != 0);
  return result;
}

CFStringRef my_CFStringCreateWithCString(char *cStr)
{
  uint64_t v2;
  char v3;
  char v4;
  CFStringRef result;

  v2 = 0;
  v3 = 1;
  do
  {
    v4 = v3;
    result = CFStringCreateWithCString(0, cStr, S_encodings[v2]);
    if (result)
      break;
    v3 = 0;
    v2 = 1;
  }
  while ((v4 & 1) != 0);
  return result;
}

CFDataRef my_CFDataCreateWithString(CFStringRef theString)
{
  uint64_t v2;
  char v3;
  char v4;
  CFDataRef result;

  v2 = 0;
  v3 = 1;
  do
  {
    v4 = v3;
    result = CFStringCreateExternalRepresentation(0, theString, S_encodings[v2], 0);
    if (result)
      break;
    v3 = 0;
    v2 = 1;
  }
  while ((v4 & 1) != 0);
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

const __CFData *my_CFPropertyListCopyAsXMLString(CFPropertyListRef propertyList)
{
  const __CFData *result;
  const __CFData *v2;
  const UInt8 *BytePtr;
  CFIndex Length;
  CFStringRef v5;

  result = CFPropertyListCreateData(0, propertyList, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (result)
  {
    v2 = result;
    BytePtr = CFDataGetBytePtr(result);
    Length = CFDataGetLength(v2);
    v5 = CFStringCreateWithBytes(0, BytePtr, Length, 0x8000100u, 0);
    CFRelease(v2);
    return (const __CFData *)v5;
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

CFTypeRef my_CFStringCopyComponent(CFStringRef theString, CFStringRef separatorString, CFIndex a3)
{
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v5;
  const void *ValueAtIndex;
  CFTypeRef v7;

  ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, theString, separatorString);
  if (!ArrayBySeparatingStrings)
    return 0;
  v5 = ArrayBySeparatingStrings;
  if (CFArrayGetCount(ArrayBySeparatingStrings) <= a3)
  {
    v7 = 0;
  }
  else
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v5, a3);
    v7 = CFRetain(ValueAtIndex);
  }
  CFRelease(v5);
  return v7;
}

void sub_2064572CC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_206457754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_206457CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_206458734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_206458CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_206458EEC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_206459248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

EAPBoringSSLSession *EAPBoringSSLSessionContextCreate(uint64_t a1, uint64_t a2)
{
  EAPBoringSSLSession *v4;
  NSObject *v5;
  os_log_type_t v6;
  EAPBoringSSLSession *v7;
  int v8;
  uint8_t v10[16];
  uint8_t buf[16];

  v4 = objc_alloc_init(EAPBoringSSLSession);
  LODWORD(a1) = -[EAPBoringSSLSession setup:clientContext:](v4, "setup:clientContext:", a1, a2);
  EAPLogGetLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if ((_DWORD)a1)
  {
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206440000, v5, v6, "EAPBoringSSLSession instance created", buf, 2u);
    }

    v7 = v4;
  }
  else
  {
    v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v5, (os_log_type_t)v8))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_206440000, v5, (os_log_type_t)v8, "failed to set up session", v10, 2u);
    }

    v7 = 0;
  }

  return v7;
}

void *EAPBoringSSLSessionStop(void *a1, const char *a2)
{
  if (a1)
    return (void *)objc_msgSend(a1, "stop");
  return a1;
}

void EAPBoringSSLSessionContextFree(void *a1)
{
  NSObject *v2;
  os_log_type_t v3;
  uint8_t v4[16];

  if (a1)
  {
    objc_msgSend(a1, "stop");

    EAPLogGetLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v2, v3))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_206440000, v2, v3, "EAPBoringSSLSession instance freed", v4, 2u);
    }

  }
}

void *EAPBoringSSLSessionStart(void *a1, const char *a2)
{
  if (a1)
    return (void *)objc_msgSend(a1, "start");
  return a1;
}

uint64_t EAPBoringSSLSessionGetCurrentState(void *a1, _DWORD *a2)
{
  int v3;
  uint64_t result;

  if (!a1)
    return 4294966387;
  v3 = objc_msgSend(a1, "state");
  result = 0;
  *a2 = v3;
  return result;
}

const __CFString *EAPBoringSSLSessionGetCurrentStateDescription(int a1)
{
  if ((a1 - 1) > 2)
    return CFSTR("idle");
  else
    return (const __CFString *)*((_QWORD *)&off_24BF0CCC0 + a1 - 1);
}

void EAPBoringSSLUtilGetPreferredTLSVersions(const __CFDictionary *a1, __int16 *a2, __int16 *a3)
{
  const __CFString *Value;
  const __CFString *v7;
  NSObject *v8;
  os_log_type_t v9;
  const __CFString *v10;
  const __CFString *v11;
  CFTypeID TypeID;
  __int16 v13;
  CFTypeID v14;
  unsigned int v15;
  NSObject *v16;
  os_log_type_t v17;
  NSObject *v18;
  os_log_type_t v19;
  NSObject *v20;
  os_log_type_t v21;
  int v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    *a2 = 769;
    *a3 = 771;
    return;
  }
  Value = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("TLSMinimumVersion"));
  v7 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("TLSMaximumVersion"));
  EAPLogGetLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = CFSTR("NONE");
    if (Value)
      v11 = Value;
    else
      v11 = CFSTR("NONE");
    if (v7)
      v10 = v7;
    v22 = 138412546;
    v23 = v11;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_206440000, v8, v9, "configured minimum TLS version: [%@], maximum TLS version: [%@]", (uint8_t *)&v22, 0x16u);
  }

  TypeID = CFStringGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID && !CFEqual(Value, CFSTR("1.0")))
  {
    if (CFEqual(Value, CFSTR("1.1")))
    {
      v13 = 770;
    }
    else if (CFEqual(Value, CFSTR("1.2")))
    {
      v13 = 771;
    }
    else
    {
      if (!CFEqual(Value, CFSTR("1.3")))
      {
        *a2 = 769;
        EAPLogGetLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v18, v19))
        {
          LOWORD(v22) = 0;
          _os_log_impl(&dword_206440000, v18, v19, "invalid minimum TLS version", (uint8_t *)&v22, 2u);
        }

        goto LABEL_14;
      }
      v13 = 772;
    }
  }
  else
  {
    v13 = 769;
  }
  *a2 = v13;
LABEL_14:
  v14 = CFStringGetTypeID();
  if (!v7 || CFGetTypeID(v7) != v14)
    goto LABEL_26;
  if (CFEqual(v7, CFSTR("1.0")))
  {
    v15 = 769;
    goto LABEL_27;
  }
  if (CFEqual(v7, CFSTR("1.1")))
  {
    v15 = 770;
    goto LABEL_27;
  }
  if (CFEqual(v7, CFSTR("1.2")))
  {
LABEL_26:
    v15 = 771;
    goto LABEL_27;
  }
  if (!CFEqual(v7, CFSTR("1.3")))
  {
    *a3 = 771;
    EAPLogGetLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v20, v21))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_206440000, v20, v21, "invalid maximum TLS version", (uint8_t *)&v22, 2u);
    }

    v15 = (unsigned __int16)*a3;
    goto LABEL_28;
  }
  v15 = 772;
LABEL_27:
  *a3 = v15;
LABEL_28:
  if ((unsigned __int16)*a2 > v15)
  {
    EAPLogGetLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v16, v17))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_206440000, v16, v17, "minimum TLS version cannot be higher than maximum TLS version", (uint8_t *)&v22, 2u);
    }

    *a2 = *a3;
  }
}

uint64_t EAPBoringSSLSessionHandshake(void *a1)
{
  if (a1)
    return objc_msgSend(a1, "handshake");
  else
    return 4294967246;
}

uint64_t EAPBoringSSLSessionCopyServerCertificates(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v5;
  void *v6;

  if (!a1)
    return 4294967246;
  v3 = a1;
  if (objc_msgSend(v3, "serverSecTrust"))
  {
    objc_msgSend(v3, "serverSecTrust");

    return SecTrustCopyInputCertificates();
  }
  v6 = (void *)objc_msgSend(v3, "copyPeerCertificateChain");

  if (objc_msgSend(v6, "count"))
  {
    v5 = 0;
    *a2 = v6;
  }
  else
  {
    v5 = 4294967246;
  }

  return v5;
}

void *EAPBoringSSLSessionGetSecTrust(void *a1, const char *a2)
{
  if (a1)
    return (void *)objc_msgSend(a1, "serverSecTrust");
  return a1;
}

uint64_t EAPBoringSSLSessionComputeKeyData(void *a1, void *a2, int a3)
{
  uint64_t v3;
  void *v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  os_log_type_t v10;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = 4294967246;
  if (a1 && a2)
  {
    objc_msgSend(a1, "getEAPKeyMaterial");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if (objc_msgSend(v6, "length") < (unint64_t)a3)
      {
LABEL_11:

        return v3;
      }
      memmove(a2, (const void *)objc_msgSend(objc_retainAutorelease(v7), "bytes"), a3);
      EAPLogGetLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v8, v9))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_206440000, v8, v9, "key computation is successful", v12, 2u);
      }
      v3 = 0;
    }
    else
    {
      v3 = 4294899625;
      EAPLogGetLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      v10 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v8, v10))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_206440000, v8, v10, "key computation failed", buf, 2u);
      }
    }

    goto LABEL_11;
  }
  return v3;
}

uint64_t EAPBoringSSLSessionGetNegotiatedTLSVersion(void *a1, _WORD *a2)
{
  uint64_t result;
  __int16 v5;

  result = 4294967246;
  if (a1)
  {
    if (a2)
    {
      v5 = objc_msgSend(a1, "getNegotiatedTLSVersion");
      result = 0;
      *a2 = v5;
    }
  }
  return result;
}

uint64_t EAPBoringSSLSessionGetSessionResumed(void *a1, _BYTE *a2)
{
  uint64_t result;
  char v5;

  result = 4294967246;
  if (a1)
  {
    if (a2)
    {
      v5 = objc_msgSend(a1, "getSessionResumed");
      result = 0;
      *a2 = v5;
    }
  }
  return result;
}

uint64_t EAPClientModuleDefaultType()
{
  return **((unsigned int **)S_head + 3);
}

uint64_t EAPClientModuleAdd(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t result;
  _QWORD *v5;

  v2 = malloc_type_malloc(0x20uLL, 0xB0040D5CDFBD1uLL);
  if (!v2)
    return 3;
  v3 = v2;
  result = 0;
  v3[2] = 0;
  v3[3] = a1;
  v5 = off_253D98090;
  *v3 = 0;
  v3[1] = v5;
  *v5 = v3;
  off_253D98090 = (_UNKNOWN **)v3;
  return result;
}

uint64_t EAPClientModulePluginIntrospect(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);

  v2 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 16);
  if (v2)
    return v2(a2);
  else
    return 0;
}

uint64_t EAPClientModulePluginFailureString(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);

  v2 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 64);
  if (v2)
    return v2(a2);
  else
    return 0;
}

uint64_t EAPClientModulePluginMasterSessionKeyCopyBytes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);

  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 24) + 88);
  if (v4)
    return v4(a2, a3, a4);
  else
    return 0;
}

uint64_t EAPClientModulePluginRequireProperties(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);

  v2 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 96);
  if (v2)
    return v2(a2);
  else
    return 0;
}

uint64_t EAPClientModulePluginPacketDump(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  const void *v8;
  char v9;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(v3 + 112);
  v5 = *(_QWORD *)(v3 + 136);
  if (!(v4 | v5))
    return 0;
  result = 1;
  if (a2 && a3)
  {
    if (v4)
    {
      return ((uint64_t (*)(uint64_t, uint64_t))v4)(a2, a3);
    }
    else
    {
      v9 = 0;
      v7 = ((uint64_t (*)(uint64_t, char *))v5)(a3, &v9);
      if (v7)
      {
        v8 = (const void *)v7;
        SCPrint();
        CFRelease(v8);
      }
      return v9 != 0;
    }
  }
  return result;
}

uint64_t EAPClientModulePluginCopyPacketDescription(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t, uint64_t);

  v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 24) + 136);
  if (v3)
    return v3(a2, a3);
  else
    return 0;
}

BOOL EAPCodeValid(int a1)
{
  return (a1 - 1) < 4;
}

const char *EAPCodeStr(int a1)
{
  if ((a1 - 1) <= 3)
    return EAPCodeStr_str[a1 - 1];
  else
    return "<unknown>";
}

const char *EAPTypeStr(int a1)
{
  const char *result;

  result = "0 (invalid)";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = "Identity";
      break;
    case 2:
      result = "Notification";
      break;
    case 3:
      result = "Nak";
      break;
    case 4:
      result = "EAP-MD5";
      break;
    case 5:
      result = "EAP-OTP";
      break;
    case 6:
      result = "EAP-GTC";
      break;
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 15:
    case 16:
    case 20:
    case 22:
    case 24:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
      goto LABEL_6;
    case 13:
      result = "EAP-TLS";
      break;
    case 17:
      result = "LEAP";
      break;
    case 18:
      result = "EAP-SIM";
      break;
    case 19:
      result = "SRPSHA1";
      break;
    case 21:
      result = "EAP-TTLS";
      break;
    case 23:
      result = "EAP-AKA";
      break;
    case 25:
      result = "EAP-PEAP";
      break;
    case 26:
      result = "EAP-MSCHAPv2";
      break;
    case 33:
      result = "PEAP-Extensions";
      break;
    default:
      if (a1 == 43)
      {
        result = "EAP-FAST";
      }
      else if (a1 == 50)
      {
        result = "EAP-AKA'";
      }
      else
      {
LABEL_6:
        result = "<unknown>";
      }
      break;
  }
  return result;
}

uint64_t EAPPacketIsValid(unsigned __int8 *a1, uint64_t a2, CFMutableStringRef theString)
{
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  const char *v17;
  _UNKNOWN **v18;
  uint64_t v19;
  const void *v20;
  uint64_t v21;
  const char *v22;
  char v23;

  if (a2 <= 3)
  {
    if (theString)
      CFStringAppendFormat(theString, 0, CFSTR("EAPPacket header truncated %d < %d\n"), a2, 4);
    return 0;
  }
  v6 = bswap32(*((unsigned __int16 *)a1 + 1));
  v7 = HIWORD(v6);
  if (v7 > a2)
  {
    if (theString)
    {
      EAPPacketHeaderAppendDescription(a1, HIWORD(v6), theString);
      CFStringAppendFormat(theString, 0, CFSTR("EAPPacket truncated %d < %d\n"), a2, v7);
    }
    return 0;
  }
  if (*a1 - 1 > 1)
  {
    if (theString)
    {
      EAPPacketHeaderAppendDescription(a1, v7, theString);
      goto LABEL_15;
    }
    return 1;
  }
  if (v7 <= 4)
  {
    if (theString)
    {
      CFStringAppendFormat(theString, 0, CFSTR("%s length %d < %d\n"), "EAPRequestResponsePacket", v7, 5);
      goto LABEL_21;
    }
    return 0;
  }
  v10 = a1[4];
  if (v10 != 3)
  {
    if (!v10)
    {
      if (theString)
      {
        EAPPacketHeaderAppendDescription(a1, v7, theString);
        CFStringAppendFormat(theString, 0, CFSTR("%s type is 0\n"), "EAPRequestResponsePacket");
LABEL_21:
        v8 = 0;
        if (!theString)
          return v8;
        goto LABEL_22;
      }
      return 0;
    }
    if (theString)
    {
      v18 = EAPClientModuleLookup(v10);
      if (v18
        && (v23 = 0, (v19 = EAPClientModulePluginCopyPacketDescription((uint64_t)v18, (uint64_t)a1, (uint64_t)&v23)) != 0))
      {
        v20 = (const void *)v19;
        CFStringAppendFormat(theString, 0, CFSTR("%@"), v19);
        CFRelease(v20);
      }
      else
      {
        EAPPacketHeaderAppendDescription(a1, v7, theString);
        v21 = a1[4];
        v22 = EAPTypeStr(a1[4]);
        CFStringAppendFormat(theString, 0, CFSTR("%s (%d) Payload Length %d\n"), v22, v21, (v7 - 5));
        print_data_cfstr(theString, (uint64_t)(a1 + 5), v7 - 5);
      }
      goto LABEL_15;
    }
    return 1;
  }
  if (!theString)
    return 1;
  EAPPacketHeaderAppendDescription(a1, v7, theString);
  v12 = a1[4];
  v13 = EAPTypeStr(a1[4]);
  CFStringAppendFormat(theString, 0, CFSTR("%s (%d)\n"), v13, v12);
  v14 = (v7 - 5);
  CFStringAppendFormat(theString, 0, CFSTR("Desired authentication types: "));
  if ((_DWORD)v7 != 5)
  {
    v15 = a1 + 5;
    do
    {
      v16 = *v15++;
      v17 = EAPTypeStr(v16);
      CFStringAppendFormat(theString, 0, CFSTR("%s(%d) "), v17, v16);
      --v14;
    }
    while (v14);
  }
  CFStringAppendFormat(theString, 0, CFSTR("\n"));
LABEL_15:
  v8 = 1;
  if (!theString)
    return v8;
LABEL_22:
  if (v7 < a2)
  {
    v11 = (a2 - v7);
    CFStringAppendFormat(theString, 0, CFSTR("EAP: %d bytes follow data:\n"), v11);
    print_data_cfstr(theString, (uint64_t)&a1[v7 + 4], v11);
  }
  return v8;
}

uint64_t EAPPacketGetLength(uint64_t a1)
{
  return bswap32(*(unsigned __int16 *)(a1 + 2)) >> 16;
}

void EAPPacketHeaderAppendDescription(unsigned __int8 *a1, uint64_t a2, CFMutableStringRef theString)
{
  uint64_t v3;
  const char *v4;

  v3 = *a1;
  if ((v3 - 1) <= 3)
    v4 = EAPCodeStr_str[(v3 - 1)];
  else
    v4 = "<unknown>";
  CFStringAppendFormat(theString, 0, CFSTR("EAP %s (%d): Identifier %d Length %d\n"), v4, v3, a1[1], a2);
}

uint64_t EAPPacketSetLength(uint64_t result, unsigned int a2)
{
  *(_WORD *)(result + 2) = __rev16(a2);
  return result;
}

uint64_t eaptls_failure_string()
{
  return 0;
}

uint64_t eaptls_server_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = 0;
  if (!*(_BYTE *)(v2 + 141))
    return 0;
  *a2 = 32;
  return v2 + 174;
}

uint64_t eaptls_msk_copy_bytes(uint64_t *a1, _OWORD *a2, int a3)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  if (a3 < 64)
    return 0;
  v3 = *a1;
  if (!*(_BYTE *)(*a1 + 141))
    return 0;
  v4 = *(_OWORD *)(v3 + 142);
  v5 = *(_OWORD *)(v3 + 158);
  v6 = *(_OWORD *)(v3 + 190);
  a2[2] = *(_OWORD *)(v3 + 174);
  a2[3] = v6;
  *a2 = v4;
  a2[1] = v5;
  return 64;
}

CFArrayRef eaptls_require_props(uint64_t a1)
{
  void *values;

  if (*(_DWORD *)(*(_QWORD *)a1 + 128) != 3 || *(_BYTE *)(*(_QWORD *)a1 + 140))
    return 0;
  values = CFSTR("TLSUserTrustProceedCertificateChain");
  return CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x24BDBD690]);
}

const void *eaptls_user_name_copy(const __CFDictionary *Value)
{
  const void *v1;
  SecIdentityRef identityRef;
  SecCertificateRef certificateRef;

  identityRef = 0;
  certificateRef = 0;
  if (Value)
    Value = (const __CFDictionary *)CFDictionaryGetValue(Value, CFSTR("TLSIdentityHandle"));
  if (EAPSecIdentityHandleCreateSecIdentity(Value, &identityRef)
    || SecIdentityCopyCertificate(identityRef, &certificateRef))
  {
    v1 = 0;
  }
  else
  {
    v1 = EAPSecCertificateCopyUserNameString((uint64_t)certificateRef);
  }
  my_CFRelease((const void **)&certificateRef);
  my_CFRelease((const void **)&identityRef);
  return v1;
}

void **eaptls_update_tls_session_data(void **result)
{
  void **v1;
  int v2;
  BOOL v3;

  if (!*((_BYTE *)result + 141))
  {
    v1 = result;
    v3 = 0;
    EAPTLSSessionGetSessionResumed((uint64_t)*result, &v3);
    *((_BYTE *)v1 + 280) = v3;
    *((_BYTE *)v1 + 141) = 0;
    if (!EAPTLSSessionComputeSessionKey((uint64_t)*v1, (uint64_t)"client EAP encryption", 21, (char *)v1 + 142, 128))*((_BYTE *)v1 + 141) = 1;
    result = (void **)EAPTLSSessionGetNegotiatedTLSProtocolVersion(*v1);
    v1[36] = result;
    v2 = *((unsigned __int8 *)v1 + 140);
    if (*((_BYTE *)v1 + 141))
    {
      if (*((_BYTE *)v1 + 140))
      {
LABEL_8:
        if (!v1[34])
          return EAPTLSSessionCopyPeerCertificates((void **)*v1, v1 + 34);
        return result;
      }
      v2 = *((unsigned __int8 *)v1 + 280);
      *((_BYTE *)v1 + 140) = v2;
      *((_BYTE *)v1 + 271) = v2;
    }
    if (!v2)
      return result;
    goto LABEL_8;
  }
  return result;
}

_BYTE *eaptls_handshake(uint64_t *a1, const char *a2, _DWORD *a3)
{
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  const char *v11;
  _BOOL4 v12;
  NSObject *LogHandle;
  os_log_type_t v14;
  const char *v15;
  _BOOL4 v16;
  NSObject *v17;
  os_log_type_t v18;
  const char *v19;
  uint64_t v20;
  BOOL v21;
  _BOOL4 v22;
  NSObject *v23;
  os_log_type_t v24;
  const char *v25;
  _BYTE *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  const char *v30;
  int v31;
  _DWORD *v32;
  char v33;
  _QWORD *v34;
  int v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = *a1;
  if (*(_BYTE *)(*a1 + 271) && !*(_BYTE *)(v6 + 140))
  {
    v12 = EAPTLSSessionIsRevocationStatusCheckRequired(*(_QWORD *)v6);
    LogHandle = EAPLogGetLogHandle();
    v14 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v14))
    {
      v15 = "is";
      if (!v12)
        v15 = "is not";
      v36 = 136315138;
      v37 = (uint64_t)v15;
      _os_log_impl(&dword_206440000, LogHandle, v14, "revocation status check %s required", (uint8_t *)&v36, 0xCu);
    }
    v7 = eaptls_verify_server(a1, a2, v12, a3);
    if (!*(_BYTE *)(v6 + 140))
      return v7;
  }
  else
  {
    v7 = 0;
  }
  v8 = EAPTLSSessionHandshake(*(_QWORD *)v6);
  if ((_DWORD)v8 != -9841)
  {
LABEL_21:
    v20 = v8;
    v36 = 0;
    if (EAPTLSSessionGetState(*(_QWORD *)v6, (SSLSessionState *)&v36))
      v21 = 0;
    else
      v21 = v36 == 2;
    if (v21)
      eaptls_update_tls_session_data((void **)v6);
    if ((_DWORD)v20 == -9803)
    {
      if (!*(_QWORD *)(v6 + 40))
        return v7;
    }
    else if ((_DWORD)v20)
    {
      v27 = EAPLogGetLogHandle();
      v28 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = EAPSSLErrorString(v20);
        v36 = 136315394;
        v37 = v29;
        v38 = 2048;
        v39 = (int)v20;
        _os_log_impl(&dword_206440000, v27, v28, "SSLHandshake failed, %s (%ld)", (uint8_t *)&v36, 0x16u);
      }
      *(_DWORD *)(v6 + 124) = v20;
      my_CFRelease((const void **)(v6 + 272));
      EAPTLSSessionCopyPeerCertificates(*(void ***)v6, (_QWORD *)(v6 + 272));
      *(_DWORD *)(v6 + 104) = 2;
      EAPTLSSessionClose(*(_QWORD *)v6, v30);
      if (!*(_QWORD *)(v6 + 40))
      {
        if ((_DWORD)v20 != -9802)
          return v7;
        v33 = (char)a2;
        v31 = 0;
        v34 = 0;
        v32 = 0;
        return EAPTLSPacketCreate(2, 13, v33, v31, v34, v32);
      }
    }
    else if (!*(_BYTE *)(v6 + 140))
    {
      my_CFRelease((const void **)(v6 + 272));
      EAPTLSSessionCopyPeerCertificates(*(void ***)v6, (_QWORD *)(v6 + 272));
      v22 = EAPTLSSessionIsRevocationStatusCheckRequired(*(_QWORD *)v6);
      v23 = EAPLogGetLogHandle();
      v24 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v23, v24))
      {
        v25 = "is";
        if (!v22)
          v25 = "is not";
        v36 = 136315138;
        v37 = (uint64_t)v25;
        _os_log_impl(&dword_206440000, v23, v24, "revocation status check %s required", (uint8_t *)&v36, 0xCu);
      }
      v26 = eaptls_verify_server(a1, a2, v22, a3);
      if (!*(_BYTE *)(v6 + 140))
      {
        v7 = v26;
        v9 = EAPLogGetLogHandle();
        v10 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v9, v10))
          return v7;
        LOWORD(v36) = 0;
        v11 = "trust_proceed is FALSE?";
        goto LABEL_8;
      }
    }
    v31 = *(_DWORD *)(v6 + 120);
    v32 = (_DWORD *)(v6 + 72);
    v33 = (char)a2;
    v34 = (_QWORD *)(v6 + 40);
    return EAPTLSPacketCreate(2, 13, v33, v31, v34, v32);
  }
  if (!*(_BYTE *)(v6 + 271))
  {
    *(_BYTE *)(v6 + 271) = 1;
    my_CFRelease((const void **)(v6 + 272));
    EAPTLSSessionCopyPeerCertificates(*(void ***)v6, (_QWORD *)(v6 + 272));
    v16 = EAPTLSSessionIsRevocationStatusCheckRequired(*(_QWORD *)v6);
    v17 = EAPLogGetLogHandle();
    v18 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = "is";
      if (!v16)
        v19 = "is not";
      v36 = 136315138;
      v37 = (uint64_t)v19;
      _os_log_impl(&dword_206440000, v17, v18, "revocation status check %s required", (uint8_t *)&v36, 0xCu);
    }
    v7 = eaptls_verify_server(a1, a2, v16, a3);
    if (!*(_BYTE *)(v6 + 140))
      return v7;
    v8 = EAPTLSSessionHandshake(*(_QWORD *)v6);
    goto LABEL_21;
  }
  v9 = EAPLogGetLogHandle();
  v10 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v9, v10))
  {
    LOWORD(v36) = 0;
    v11 = "AuthCompleted again?";
LABEL_8:
    _os_log_impl(&dword_206440000, v9, v10, v11, (uint8_t *)&v36, 2u);
  }
  return v7;
}

uint64_t md5_init(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  *a3 = 0;
  *a2 = 0;
  return 0;
}

uint64_t md5_process(uint64_t a1, unsigned __int8 *a2, _QWORD *a3, _DWORD *a4, _DWORD *a5)
{
  int v5;
  uint64_t result;
  unsigned int Length;
  unsigned int v11;
  NSObject *v12;
  os_log_type_t v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  NSObject *LogHandle;
  os_log_type_t v18;
  uint64_t v19;
  _BYTE *v20;
  int v21;
  _BYTE *v22;
  int v23;
  unsigned int v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  *a4 = 0;
  *a5 = 0;
  *a3 = 0;
  v5 = *a2;
  if (v5 == 4)
  {
    *a4 = 1;
    return 2;
  }
  if (v5 == 3)
    return 1;
  result = 0;
  if (v5 == 1)
  {
    if (!*(_QWORD *)(a1 + 64))
    {
      result = 0;
      *a4 = 3;
      return result;
    }
    Length = EAPPacketGetLength((uint64_t)a2);
    v11 = Length;
    if (Length > 5)
    {
      if ((unint64_t)a2[5] + 6 <= Length)
      {
        v21 = *(_DWORD *)(a1 + 48) + 22;
        v22 = malloc_type_malloc(v21, 0x83AC3849uLL);
        v20 = v22;
        if (v22)
        {
          *v22 = 2;
          v22[1] = a2[1];
          EAPPacketSetLength((uint64_t)v22, (unsigned __int16)v21);
          *((_WORD *)v20 + 2) = 4100;
          chap_md5(a2[1], *(const void **)(a1 + 64), *(_DWORD *)(a1 + 72), a2 + 6, a2[5], v20 + 6);
          memmove(v20 + 22, *(const void **)(a1 + 40), *(unsigned int *)(a1 + 48));
        }
        goto LABEL_16;
      }
      LogHandle = EAPLogGetLogHandle();
      v18 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v18))
      {
        v19 = a2[5] + 6;
        v23 = 67109376;
        v24 = v11;
        v25 = 2048;
        v26 = v19;
        v14 = "value too short (length %d < %ld)";
        v15 = LogHandle;
        v16 = v18;
        goto LABEL_14;
      }
    }
    else
    {
      v12 = EAPLogGetLogHandle();
      v13 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v12, v13))
      {
        v23 = 67109376;
        v24 = v11;
        v25 = 2048;
        v26 = 6;
        v14 = "header too short (length %d < %ld)";
        v15 = v12;
        v16 = v13;
LABEL_14:
        _os_log_impl(&dword_206440000, v15, v16, v14, (uint8_t *)&v23, 0x12u);
      }
    }
    v20 = 0;
LABEL_16:
    result = 0;
    *a3 = v20;
  }
  return result;
}

CFArrayRef md5_require_props(uint64_t a1)
{
  void *values;

  if (*(_QWORD *)(a1 + 64))
    return 0;
  values = CFSTR("UserPassword");
  return CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x24BDBD690]);
}

void md5_free_packet(int a1, void *a2)
{
  if (a2)
    free(a2);
}

uint64_t eapfast_failure_string()
{
  return 0;
}

uint64_t eapfast_server_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = 0;
  if (!*(_BYTE *)(v2 + 33277))
    return 0;
  *a2 = 32;
  return v2 + 33310;
}

uint64_t eapfast_msk_copy_bytes(uint64_t a1, _OWORD *a2, int a3)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  if (a3 < 64 || !*(_BYTE *)(*(_QWORD *)a1 + 33277))
    return 0;
  v3 = *(_OWORD *)(*(_QWORD *)a1 + 33278);
  v4 = *(_OWORD *)(*(_QWORD *)a1 + 33294);
  v5 = *(_OWORD *)(*(_QWORD *)a1 + 33326);
  a2[2] = *(_OWORD *)(*(_QWORD *)a1 + 33310);
  a2[3] = v5;
  *a2 = v3;
  a2[1] = v4;
  return 64;
}

CFArrayRef eapfast_require_props(uint64_t *a1)
{
  uint64_t v1;
  CFArrayRef result;
  void *values;

  v1 = *a1;
  if (*(_DWORD *)(*a1 + 140) != 3)
    return 0;
  if (!*(_BYTE *)(v1 + 33276))
  {
    values = CFSTR("TLSUserTrustProceedCertificateChain");
    return CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x24BDBD690]);
  }
  if (!*(_BYTE *)(v1 + 144))
    return 0;
  result = *(CFArrayRef *)(v1 + 312);
  if (result)
    return (CFArrayRef)CFRetain(result);
  return result;
}

__CFDictionary *eapfast_publish_props_copy(uint64_t *a1)
{
  uint64_t v1;
  _BYTE *v2;
  const __CFArray *v3;
  __CFArray *CFDataArray;
  __CFDictionary *v5;
  const __CFDictionary *v6;
  __CFDictionary *MutableCopy;
  CFNumberRef v8;
  const void *v9;
  const void *v10;
  const char *v11;
  CFNumberRef v12;
  SSLCipherSuite cipherSuite;
  int v15;
  const void *valuePtr;

  cipherSuite = 0;
  v1 = *a1;
  v2 = (_BYTE *)(*a1 + 33276);
  v3 = *(const __CFArray **)(*a1 + 33408);
  if (v3)
  {
    CFDataArray = EAPSecCertificateArrayCreateCFDataArray(v3);
    if (!CFDataArray)
      return 0;
  }
  else
  {
    CFDataArray = 0;
  }
  if (*(_BYTE *)(v1 + 144) && (v6 = *(const __CFDictionary **)(v1 + 320)) != 0)
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v6);
  else
    MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v5 = MutableCopy;
  if (CFDataArray)
  {
    CFDictionarySetValue(MutableCopy, CFSTR("TLSServerCertificateChain"), CFDataArray);
    CFRelease(CFDataArray);
  }
  if (*(_QWORD *)v1)
  {
    SSLGetNegotiatedCipher(*(SSLContextRef *)v1, &cipherSuite);
    if (cipherSuite)
    {
      LODWORD(valuePtr) = cipherSuite;
      v8 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
      CFDictionarySetValue(v5, CFSTR("TLSNegotiatedCipher"), v8);
      CFRelease(v8);
    }
  }
  v9 = (const void *)*MEMORY[0x24BDBD270];
  if (v2[190])
    CFDictionarySetValue(v5, CFSTR("EAPFASTPACWasProvisioned"), (const void *)*MEMORY[0x24BDBD270]);
  if (v2[176])
    v10 = v9;
  else
    v10 = (const void *)*MEMORY[0x24BDBD268];
  CFDictionarySetValue(v5, CFSTR("TLSSessionWasResumed"), v10);
  if (*(_QWORD *)(v1 + 152))
  {
    v11 = *(const char **)(v1 + 336);
    v15 = *(_DWORD *)(v1 + 328);
    if (v15)
    {
      if (v11)
      {
        valuePtr = CFStringCreateWithCString(0, v11, 0x600u);
        CFDictionarySetValue(v5, CFSTR("InnerEAPTypeName"), valuePtr);
        my_CFRelease(&valuePtr);
      }
      valuePtr = CFNumberCreate(0, kCFNumberIntType, &v15);
      CFDictionarySetValue(v5, CFSTR("InnerEAPType"), valuePtr);
      my_CFRelease(&valuePtr);
    }
  }
  if (*(_DWORD *)(v1 + 140) == 3 && !*v2)
  {
    v12 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(v1 + 33272));
    CFDictionarySetValue(v5, CFSTR("TLSTrustClientStatus"), v12);
    CFRelease(v12);
  }
  return v5;
}

__CFString *eapfast_copy_packet_description(unsigned __int8 *a1, _BYTE *a2)
{
  uint64_t Length;
  uint64_t v5;
  __CFString *Mutable;
  __CFString *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  _WORD *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t MessageLength;
  const char *v15;
  unint64_t v16;

  Length = EAPPacketGetLength((uint64_t)a1);
  *a2 = 0;
  if (*a1 - 1 > 1)
    return 0;
  v5 = Length;
  Mutable = CFStringCreateMutable(0, 0);
  v7 = Mutable;
  if (v5 > 5)
  {
    v8 = a1[5];
    v9 = "Response";
    if (*a1 == 1)
      v9 = "Request";
    v10 = " [";
    if (v8 < 8)
      v10 = (const char *)&unk_206473DB9;
    CFStringAppendFormat(Mutable, 0, CFSTR("EAP-FAST Version %d %s: Identifier %d Length %d Flags 0x%x%s"), v8 & 7, v9, a1[1], v5, v8, v10);
    v11 = a1 + 6;
    v12 = (v5 - 6);
    v13 = a1[5];
    if ((v13 & 0x20) != 0)
    {
      CFStringAppendFormat(v7, 0, CFSTR(" start"));
      v13 = a1[5];
    }
    MessageLength = (v5 - 6);
    if ((v13 & 0x80) != 0 && v5 >= 0xA)
    {
      v11 = a1 + 10;
      v12 = (v5 - 10);
      MessageLength = EAPTLSLengthIncludedPacketGetMessageLength((uint64_t)a1);
      CFStringAppendFormat(v7, 0, CFSTR(" length=%u"), MessageLength);
      v13 = a1[5];
    }
    if ((v13 & 0x40) != 0)
    {
      CFStringAppendFormat(v7, 0, CFSTR(" more"));
      v13 = a1[5];
    }
    if (v13 >= 8)
      v15 = " ]";
    else
      v15 = (const char *)&unk_206473DB9;
    CFStringAppendFormat(v7, 0, CFSTR("%s Data Length %d\n"), v15, v12);
    if (MessageLength <= 0x20000)
    {
      if ((a1[5] & 0x20) != 0 && v12 >= 5 && *v11 == 1024)
      {
        v16 = bswap32((unsigned __int16)v11[1]) >> 16;
        CFStringAppendFormat(v7, 0, CFSTR("Authority ID Data Length %d ID "), v16);
        if ((unint64_t)v12 - 4 < v16)
        {
          LODWORD(v16) = (unsigned __int16)(v12 - 4);
          CFStringAppendFormat(v7, 0, CFSTR("> available %d! "), (unsigned __int16)(v12 - 4));
        }
        print_bytes_cfstr(v7, (uint64_t)(v11 + 2), v16);
        CFStringAppendFormat(v7, 0, CFSTR("\n"));
      }
      else
      {
        print_data_cfstr(v7, (uint64_t)v11, v12);
      }
      *a2 = 1;
    }
    else
    {
      CFStringAppendFormat(v7, 0, CFSTR("potential DOS attack %u > %d\n"), MessageLength, 0x20000);
      CFStringAppendFormat(v7, 0, CFSTR("bogus EAP Packet:\n"));
      print_data_cfstr(v7, (uint64_t)a1, v5);
    }
  }
  else
  {
    CFStringAppendFormat(Mutable, 0, CFSTR("EAPTLSPacket header truncated %d < %d\n"), v5, 6);
  }
  return v7;
}

_BYTE *eapfast_tunnel(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *a1;
  if (eapfast_eap())
    return EAPTLSPacketCreate2(2, 43, *(_BYTE *)(a2 + 1), *(_DWORD *)(v3 + 128), (_QWORD *)(v3 + 48), (_DWORD *)(v3 + 80), 0);
  else
    return 0;
}

_BYTE *eapfast_handshake(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  const __CFDictionary *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *LogHandle;
  os_log_type_t v16;
  uint64_t v17;
  const char *v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  const __CFDictionary *v22;
  UInt8 *v23;
  int v24;
  void *Value;
  const __CFData *v26;
  CFPropertyListRef v27;
  const __CFArray *v28;
  const UInt8 *BytePtr;
  unsigned __int16 Length;
  int pac;
  int v32;
  CFMutableArrayRef MutableCopy;
  int v34;
  int v35;
  NSObject *v36;
  os_log_type_t v37;
  const char *v38;
  const __CFString *v39;
  const __CFString *v40;
  int v41;
  _DWORD *v42;
  _QWORD *v43;
  uint8_t *v46;
  os_log_t v47;
  os_log_type_t v48;
  NSObject *v49;
  uint64_t v50;
  uint8_t *v51;
  __int128 v52;
  __int128 v53;
  os_log_type_t type;
  NSObject *log;
  uint64_t v56;
  uint8_t *v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint8_t v62[4];
  uint64_t v63;
  __int16 v64;
  int v65;
  const void *v66[8];
  CFMutableArrayRef v67;
  uint8_t buf[4];
  uint64_t v69;
  __int16 v70;
  int v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v6 = *(const __CFDictionary **)a1;
  v7 = *(_QWORD *)a1 + 33276;
  if (*(_BYTE *)(*(_QWORD *)a1 + 33406) && !*(_BYTE *)v7)
  {
    v8 = eapfast_verify_server((const __CFDictionary **)a1, *(_BYTE *)(a2 + 1), a3);
    if (!*(_BYTE *)v7)
      return v8;
  }
  else
  {
    v8 = 0;
  }
  v9 = SSLHandshake(*(SSLContextRef *)v6);
  if ((_DWORD)v9 != -9841)
    goto LABEL_13;
  if (!*(_BYTE *)(v7 + 130))
  {
    *(_BYTE *)(v7 + 130) = 1;
    my_CFRelease((const void **)v6 + 4176);
    EAPSSLCopyPeerCertificates(*(SSLContext **)v6, (_QWORD *)v6 + 4176);
    v8 = eapfast_verify_server((const __CFDictionary **)a1, *(_BYTE *)(a2 + 1), a3);
    if (!*(_BYTE *)v7)
      return v8;
    v9 = SSLHandshake(*(SSLContextRef *)v6);
LABEL_13:
    v13 = v9;
    if ((_DWORD)v9 == -9803)
    {
LABEL_39:
      if (*((_QWORD *)v6 + 6))
      {
        v41 = *((_DWORD *)v6 + 32);
        v42 = (_DWORD *)((char *)v6 + 80);
        v43 = (_QWORD *)((char *)v6 + 48);
      }
      else
      {
        v41 = 0;
        v43 = 0;
        v42 = 0;
      }
      return EAPTLSPacketCreate(2, 43, *(_BYTE *)(a2 + 1), v41, v43, v42);
    }
    if ((_DWORD)v9)
    {
      LogHandle = EAPLogGetLogHandle();
      v16 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v16))
      {
        *(_DWORD *)buf = 136315394;
        v69 = EAPSSLErrorString(v13);
        v70 = 1024;
        v71 = v13;
        v18 = "SSLHandshake failed, %s (%d)";
        v19 = buf;
LABEL_29:
        _os_log_impl(&dword_206440000, LogHandle, v16, v18, v19, 0x12u);
      }
    }
    else
    {
      if (!*(_BYTE *)v7)
      {
        my_CFRelease((const void **)v6 + 4176);
        EAPSSLCopyPeerCertificates(*(SSLContext **)v6, (_QWORD *)v6 + 4176);
        v8 = eapfast_verify_server((const __CFDictionary **)a1, *(_BYTE *)(a2 + 1), a3);
        if (!*(_BYTE *)v7)
        {
          v10 = EAPLogGetLogHandle();
          v11 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v10, v11))
            return v8;
          *(_WORD *)buf = 0;
          v12 = "trust_proceed is FALSE?";
          goto LABEL_8;
        }
      }
      v60 = 0;
      v61 = 0;
      v58 = 64;
      LODWORD(v13) = ssl_get_server_client_random(*(_QWORD *)v6, (uint64_t)v66, &v58);
      if ((_DWORD)v13)
        goto LABEL_30;
      v59 = 48;
      v14 = SSLInternalMasterSecret();
      if ((_DWORD)v14)
      {
        v13 = v14;
        LogHandle = EAPLogGetLogHandle();
        v16 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(LogHandle, v16))
        {
          v17 = EAPSSLErrorString(v13);
          *(_DWORD *)v62 = 136315394;
          v63 = v17;
          v64 = 1024;
          v65 = v13;
          v18 = "SSLInternalMasterSecret failed, %s (%d)";
LABEL_28:
          v19 = v62;
          goto LABEL_29;
        }
      }
      else
      {
        v20 = SSLGetCipherSizes();
        if (!(_DWORD)v20)
        {
          v56 = 2 * ((int)v61 + (int)v60);
          if ((v56 + 72) < 0x101)
            v46 = buf;
          else
            v46 = (uint8_t *)malloc_type_malloc((int)v56 + 72, 0x7954BC1DuLL);
          v13 = SSLInternal_PRF();
          if ((_DWORD)v13)
          {
            v57 = v46;
            v47 = EAPLogGetLogHandle();
            v48 = _SC_syslog_os_log_mapping();
            log = v47;
            v49 = v47;
            v46 = v57;
            type = v48;
            if (os_log_type_enabled(v49, v48))
            {
              v50 = EAPSSLErrorString(v13);
              *(_DWORD *)v62 = 136315394;
              v63 = v50;
              v64 = 1024;
              v65 = v13;
              _os_log_impl(&dword_206440000, log, type, "SSLInternal_PRF failed, %s (%d)\n", v62, 0x12u);
            }
          }
          else
          {
            v51 = &v46[(int)v56];
            v52 = *(_OWORD *)v51;
            v53 = *((_OWORD *)v51 + 1);
            *(_QWORD *)((char *)v6 + 33501) = *((_QWORD *)v51 + 4);
            *(_OWORD *)((char *)v6 + 33469) = v52;
            *(_OWORD *)((char *)v6 + 33485) = v53;
            *(_OWORD *)((char *)v6 + 33509) = *(_OWORD *)&v46[v56 + 40];
            *(_OWORD *)((char *)v6 + 33525) = *(_OWORD *)(v51 + 56);
          }
          if (v46 && v46 != buf)
            free(v46);
          if (!(_DWORD)v13)
          {
            *((_BYTE *)v6 + 144) = 1;
            v66[0] = (const void *)32;
            LOBYTE(v67) = 0;
            if (!SSLGetResumableSessionInfo())
              *(_BYTE *)(v7 + 176) = (_BYTE)v67 != 0;
            if (!eapfast_eap())
              return v8;
            return EAPTLSPacketCreate2(2, 43, *(_BYTE *)(a2 + 1), *((_DWORD *)v6 + 32), (_QWORD *)v6 + 6, (_DWORD *)v6 + 20, 0);
          }
          goto LABEL_30;
        }
        v13 = v20;
        LogHandle = EAPLogGetLogHandle();
        v16 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(LogHandle, v16))
        {
          v21 = EAPSSLErrorString(v13);
          *(_DWORD *)v62 = 136315394;
          v63 = v21;
          v64 = 1024;
          v65 = v13;
          v18 = "SSLGetCipherSizes failed, %s (%d)";
          goto LABEL_28;
        }
      }
    }
LABEL_30:
    *((_DWORD *)v6 + 34) = v13;
    my_CFRelease((const void **)v6 + 4176);
    EAPSSLCopyPeerCertificates(*(SSLContext **)v6, (_QWORD *)v6 + 4176);
    *((_DWORD *)v6 + 28) = 2;
    SSLClose(*(SSLContextRef *)v6);
    if ((_DWORD)v13 == -9825)
    {
      v22 = *(const __CFDictionary **)(v7 + 180);
      if (v22)
      {
        v23 = *(UInt8 **)(a1 + 40);
        v24 = *(_DWORD *)(a1 + 48);
        v67 = 0;
        Value = (void *)CFDictionaryGetValue(v22, CFSTR("PACKeyKeychainItemID"));
        v26 = (const __CFData *)CFDictionaryGetValue(v22, CFSTR("AuthorityID"));
        v27 = pac_list_copy();
        v66[0] = v27;
        if (v27)
        {
          v28 = (const __CFArray *)v27;
          BytePtr = CFDataGetBytePtr(v26);
          Length = CFDataGetLength(v26);
          pac = pac_list_find_pac(v28, BytePtr, Length, v23, v24);
          if (pac != -1)
          {
            v32 = pac;
            MutableCopy = CFArrayCreateMutableCopy(0, 0, v28);
            v67 = MutableCopy;
            CFArrayRemoveValueAtIndex(MutableCopy, v32);
            v34 = EAPSecKeychainPasswordItemRemove(0, Value);
            if (v34)
            {
              v35 = v34;
              v36 = EAPLogGetLogHandle();
              v37 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v36, v37))
              {
                v38 = EAPSecurityErrorString(v35);
                *(_DWORD *)buf = 136315394;
                v69 = (uint64_t)v38;
                v70 = 1024;
                v71 = v35;
                _os_log_impl(&dword_206440000, v36, v37, "EAP-FAST: EAPSecKeychainPasswordItemRemove failed, %s (%d)", buf, 0x12u);
              }
            }
            v39 = (const __CFString *)*MEMORY[0x24BDBD590];
            v40 = (const __CFString *)*MEMORY[0x24BDBD570];
            CFPreferencesSetValue(CFSTR("PACList"), MutableCopy, CFSTR("com.apple.network.eapclient.eapfast"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
            my_CFRelease((const void **)&v67);
            CFPreferencesSynchronize(CFSTR("com.apple.network.eapclient.eapfast"), v39, v40);
          }
        }
        my_CFRelease(v66);
      }
    }
    goto LABEL_39;
  }
  v10 = EAPLogGetLogHandle();
  v11 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v10, v11))
  {
    *(_WORD *)buf = 0;
    v12 = "AuthCompleted again?";
LABEL_8:
    _os_log_impl(&dword_206440000, v10, v11, v12, buf, 2u);
  }
  return v8;
}

void make_error(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  _DWORD *v4;
  NSObject *LogHandle;
  os_log_type_t v6;
  int v7;
  NSObject *v8;
  os_log_type_t v9;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = *(int *)(a1 + 12);
  if (*(_DWORD *)(a1 + 8) - (int)v3 <= 7)
  {
    LogHandle = EAPLogGetLogHandle();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v6))
    {
      v7 = *(_DWORD *)(a1 + 8) - *(_DWORD *)(a1 + 12);
      v10[0] = 67109376;
      v10[1] = 8;
      v11 = 1024;
      v12 = v7;
      _os_log_impl(&dword_206440000, LogHandle, v6, "EAP-FAST: BufferAdvanceWritePtr failed: %d > %d", (uint8_t *)v10, 0xEu);
    }
    v8 = EAPLogGetLogHandle();
    v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v9))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_206440000, v8, v9, "EAP-FAST: make_error(): buffer too small", (uint8_t *)v10, 2u);
    }
  }
  else
  {
    v4 = (_DWORD *)(*(_QWORD *)a1 + v3);
    *(_DWORD *)(a1 + 12) = v3 + 8;
    *v4 = 67110272;
    v4[1] = bswap32(a2);
  }
}

void make_nak(uint64_t a1, _WORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *LogHandle;
  os_log_type_t v6;
  int v7;
  NSObject *v8;
  os_log_type_t v9;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = *(int *)(a1 + 12);
  if (*(_DWORD *)(a1 + 8) - (int)v3 <= 9)
  {
    LogHandle = EAPLogGetLogHandle();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v6))
    {
      v7 = *(_DWORD *)(a1 + 8) - *(_DWORD *)(a1 + 12);
      v10[0] = 67109376;
      v10[1] = 10;
      v11 = 1024;
      v12 = v7;
      _os_log_impl(&dword_206440000, LogHandle, v6, "EAP-FAST: BufferAdvanceWritePtr failed: %d > %d", (uint8_t *)v10, 0xEu);
    }
    v8 = EAPLogGetLogHandle();
    v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v9))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_206440000, v8, v9, "EAP-FAST: make_nak(): buffer too small", (uint8_t *)v10, 2u);
    }
  }
  else
  {
    v4 = *(_QWORD *)a1 + v3;
    *(_DWORD *)(a1 + 12) = v3 + 10;
    *(_DWORD *)v4 = 100664448;
    *(_WORD *)(v4 + 8) = *a2 & 0xFF3F;
    *(_DWORD *)(v4 + 4) = 0;
  }
}

void make_intermediate_result(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *LogHandle;
  os_log_type_t v5;
  int v6;
  NSObject *v7;
  os_log_type_t v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(int *)(a1 + 12);
  if (*(_DWORD *)(a1 + 8) - (int)v2 <= 5)
  {
    LogHandle = EAPLogGetLogHandle();
    v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v5))
    {
      v6 = *(_DWORD *)(a1 + 8) - *(_DWORD *)(a1 + 12);
      v9[0] = 67109376;
      v9[1] = 6;
      v10 = 1024;
      v11 = v6;
      _os_log_impl(&dword_206440000, LogHandle, v5, "EAP-FAST: BufferAdvanceWritePtr failed: %d > %d", (uint8_t *)v9, 0xEu);
    }
    v7 = EAPLogGetLogHandle();
    v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v7, v8))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl(&dword_206440000, v7, v8, "EAP-FAST: make_intermediate_result(): buffer too small", (uint8_t *)v9, 2u);
    }
  }
  else
  {
    v3 = *(_QWORD *)a1 + v2;
    *(_DWORD *)(a1 + 12) = v2 + 6;
    *(_DWORD *)v3 = 33557120;
    *(_WORD *)(v3 + 4) = 256;
  }
}

BOOL process_crypto_binding(uint64_t a1, __int128 *a2, uint64_t a3)
{
  NSObject *LogHandle;
  os_log_type_t v5;
  _BOOL8 result;
  int v7;
  const char *v8;
  uint8_t *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  NSObject *v15;
  os_log_type_t v16;
  int v17;
  int v18;
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  int v22;
  __int128 *v23;
  uint64_t v24;
  __int128 v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int16 v33;
  unsigned int v34;
  __int128 v35;
  __int128 v36;
  _BYTE buf[32];
  uint64_t v38;
  _BYTE v39[28];
  __int128 macOut;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v34 = 0;
  if ((*(_DWORD *)(a3 + 8) - *(_DWORD *)(a3 + 12)) <= 0x3B)
  {
    LogHandle = EAPLogGetLogHandle();
    v5 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(LogHandle, v5);
    if (!result)
      return result;
    v7 = *(_DWORD *)(a3 + 8) - *(_DWORD *)(a3 + 12);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v7;
    *(_WORD *)&buf[8] = 2048;
    *(_QWORD *)&buf[10] = 60;
    v8 = "EAP-FAST: process_crypto_binding: buffer too small %d < %ld";
    v9 = buf;
    v10 = LogHandle;
    v11 = v5;
    v12 = 18;
    goto LABEL_15;
  }
  if (*((_BYTE *)a2 + 5) != 1)
  {
    v15 = EAPLogGetLogHandle();
    v16 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(v15, v16);
    if (!result)
      return result;
    v18 = *((unsigned __int8 *)a2 + 5);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v18;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = 1;
    v8 = "EAP-FAST: process_crypto_binding version is %d != %d";
    goto LABEL_11;
  }
  if (*((unsigned __int8 *)a2 + 6) != *(unsigned __int8 *)(a1 + 133))
  {
    v19 = EAPLogGetLogHandle();
    v20 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(v19, v20);
    if (!result)
      return result;
    v21 = *((unsigned __int8 *)a2 + 6);
    v22 = *(unsigned __int8 *)(a1 + 133);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v21;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v22;
    v8 = "EAP-FAST: process_crypto_binding received_version is %d != %d";
    v9 = buf;
    v10 = v19;
    v11 = v20;
    goto LABEL_14;
  }
  if (*((_BYTE *)a2 + 7))
  {
    v15 = EAPLogGetLogHandle();
    v16 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(v15, v16);
    if (!result)
      return result;
    v17 = *((unsigned __int8 *)a2 + 7);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v17;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = 0;
    v8 = "EAP-FAST: process_crypto_binding sub_type %d != %d";
LABEL_11:
    v9 = buf;
    v10 = v15;
    v11 = v16;
LABEL_14:
    v12 = 14;
LABEL_15:
    _os_log_impl(&dword_206440000, v10, v11, v8, v9, v12);
    return 0;
  }
  v23 = (__int128 *)EAPClientModulePluginSessionKey(*(_QWORD *)(a1 + 152), a1 + 160, (uint64_t)&v34);
  if (v23)
  {
    v24 = v34;
    if (v34 < 0x21)
    {
      __memcpy_chk();
      if ((_DWORD)v24 != 32)
        bzero((char *)&v35 + v24, 32 - v24);
    }
    else
    {
      v34 = 32;
      v25 = v23[1];
      v35 = *v23;
      v36 = v25;
    }
  }
  else
  {
    if (*(_BYTE *)(a1 + 33467))
    {
      v26 = EAPLogGetLogHandle();
      v27 = _SC_syslog_os_log_mapping();
      result = os_log_type_enabled(v26, v27);
      if (result)
      {
        *(_WORD *)buf = 0;
        v8 = "EAP-FAST: anonymous PAC provisioning requires MSCHAPv2 - possible malicious server";
        v9 = buf;
LABEL_34:
        v10 = v26;
        v11 = v27;
        v12 = 2;
        goto LABEL_15;
      }
      return result;
    }
    v35 = 0u;
    v36 = 0u;
  }
  T_PRF((const void *)(a1 + 33469), 40, "Inner Methods Compound Keys", 0x1Bu, &v35, 32, buf, 60);
  v28 = *(_QWORD *)a3 + *(int *)(a3 + 12);
  v29 = *a2;
  v30 = a2[1];
  *(_QWORD *)(v28 + 32) = *((_QWORD *)a2 + 4);
  *(_OWORD *)v28 = v29;
  *(_OWORD *)(v28 + 16) = v30;
  *(_QWORD *)(v28 + 40) = 0;
  *(_QWORD *)(v28 + 48) = 0;
  *(_DWORD *)(v28 + 56) = 0;
  CCHmac(0, v39, 0x14uLL, (const void *)v28, 0x3CuLL, &macOut);
  if (cc_cmp_safe())
  {
    v26 = EAPLogGetLogHandle();
    v27 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(v26, v27);
    if (result)
    {
      v33 = 0;
      v8 = "EAP-FAST: process_crypto_binding Compound MAC is incorrect";
LABEL_33:
      v9 = (uint8_t *)&v33;
      goto LABEL_34;
    }
  }
  else
  {
    *(_DWORD *)v28 = 939527296;
    *(_BYTE *)(v28 + 6) = *(_BYTE *)(a1 + 134);
    *(_BYTE *)(v28 + 39) |= 1u;
    *(_BYTE *)(v28 + 7) = 1;
    CCHmac(0, v39, 0x14uLL, (const void *)v28, 0x3CuLL, &macOut);
    v31 = macOut;
    *(_DWORD *)(v28 + 56) = v41;
    *(_OWORD *)(v28 + 40) = v31;
    if (BufferAdvanceWritePtr(a3, 60))
    {
      v32 = *(_OWORD *)&buf[16];
      *(_OWORD *)(a1 + 33469) = *(_OWORD *)buf;
      *(_OWORD *)(a1 + 33485) = v32;
      *(_QWORD *)(a1 + 33501) = v38;
      return 1;
    }
    v26 = EAPLogGetLogHandle();
    v27 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(v26, v27);
    if (result)
    {
      v33 = 0;
      v8 = "EAP-FAST: process_crypto_binding: buffer too small";
      goto LABEL_33;
    }
  }
  return result;
}

void eapfast_compute_session_key(uint64_t a1)
{
  const void *v2;

  v2 = (const void *)(a1 + 33469);
  T_PRF((const void *)(a1 + 33469), 40, "Session Key Generating Function", 0x1Fu, 0, 0, (_DWORD *)(a1 + 33278), 64);
  T_PRF(v2, 40, "Extended Session Key Generating Function", 0x28u, 0, 0, (_DWORD *)(a1 + 33342), 64);
  *(_BYTE *)(a1 + 33277) = 1;
}

void make_pac_request(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *LogHandle;
  os_log_type_t v5;
  int v6;
  NSObject *v7;
  os_log_type_t v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(int *)(a1 + 12);
  if (*(_DWORD *)(a1 + 8) - (int)v2 <= 9)
  {
    LogHandle = EAPLogGetLogHandle();
    v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v5))
    {
      v6 = *(_DWORD *)(a1 + 8) - *(_DWORD *)(a1 + 12);
      v9[0] = 67109376;
      v9[1] = 10;
      v10 = 1024;
      v11 = v6;
      _os_log_impl(&dword_206440000, LogHandle, v5, "EAP-FAST: BufferAdvanceWritePtr failed: %d > %d", (uint8_t *)v9, 0xEu);
    }
    v7 = EAPLogGetLogHandle();
    v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v7, v8))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl(&dword_206440000, v7, v8, "EAP-FAST: make_pac_request(): buffer too small", (uint8_t *)v9, 2u);
    }
  }
  else
  {
    v3 = *(_QWORD *)a1 + v2;
    *(_DWORD *)(a1 + 12) = v2 + 10;
    *(_QWORD *)v3 = 0x2000A0006000B00;
    *(_WORD *)(v3 + 8) = 256;
  }
}

BOOL BufferAdvanceWritePtr(uint64_t a1, int a2)
{
  int v4;
  int v5;
  NSObject *LogHandle;
  os_log_type_t v7;
  int v8;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *(_DWORD *)(a1 + 12);
  v5 = *(_DWORD *)(a1 + 8) - v4;
  if (v5 < a2)
  {
    LogHandle = EAPLogGetLogHandle();
    v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v7))
    {
      v8 = *(_DWORD *)(a1 + 8) - *(_DWORD *)(a1 + 12);
      v10[0] = 67109376;
      v10[1] = a2;
      v11 = 1024;
      v12 = v8;
      _os_log_impl(&dword_206440000, LogHandle, v7, "EAP-FAST: BufferAdvanceWritePtr failed: %d > %d", (uint8_t *)v10, 0xEu);
    }
  }
  else
  {
    *(_DWORD *)(a1 + 12) = v4 + a2;
  }
  return v5 >= a2;
}

uint64_t peap_failure_string()
{
  return 0;
}

uint64_t peap_server_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = 0;
  if ((*(_DWORD *)(v2 + 328) != 6 || *(_DWORD *)(v2 + 124) || *(_DWORD *)(v2 + 104) != 1)
    && (!*(_BYTE *)(v2 + 1397) || *(_DWORD *)(v2 + 144) != 1))
  {
    return 0;
  }
  *a2 = 32;
  return v2 + 1430;
}

uint64_t peap_msk_copy_bytes(uint64_t *a1, _OWORD *a2, int a3)
{
  uint64_t v3;
  __int128 *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  if (a3 < 64)
    return 0;
  v3 = *a1;
  if ((*(_DWORD *)(*a1 + 328) != 6 || *(_DWORD *)(v3 + 124) || *(_DWORD *)(v3 + 104) != 1)
    && (!*(_BYTE *)(v3 + 1397) || *(_DWORD *)(v3 + 144) != 1))
  {
    return 0;
  }
  v4 = (__int128 *)(v3 + 1398);
  v5 = *v4;
  v6 = v4[1];
  v7 = v4[3];
  a2[2] = v4[2];
  a2[3] = v7;
  *a2 = v5;
  a2[1] = v6;
  return 64;
}

CFArrayRef peap_require_props(uint64_t *a1)
{
  uint64_t v1;
  CFArrayRef result;
  void *values;

  v1 = *a1;
  if (*(_DWORD *)(*a1 + 136) != 3)
    return 0;
  if (!*(_BYTE *)(v1 + 1396))
  {
    values = CFSTR("TLSUserTrustProceedCertificateChain");
    return CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x24BDBD690]);
  }
  if (!*(_BYTE *)(v1 + 140))
    return 0;
  result = *(CFArrayRef *)(v1 + 312);
  if (result)
    return (CFArrayRef)CFRetain(result);
  return result;
}

__CFDictionary *peap_publish_props_copy(uint64_t *a1)
{
  uint64_t v1;
  const __CFArray *v2;
  __CFArray *CFDataArray;
  __CFArray *v4;
  const __CFDictionary *v5;
  __CFDictionary *MutableCopy;
  __CFDictionary *v7;
  const void **v8;
  CFNumberRef v9;
  const char *v10;
  CFNumberRef v11;
  SSLCipherSuite cipherSuite;
  __CFArray *v14;
  int v15;
  const void *valuePtr;

  cipherSuite = 0;
  v1 = *a1;
  v2 = *(const __CFArray **)(*a1 + 1528);
  if (!v2)
    return 0;
  CFDataArray = EAPSecCertificateArrayCreateCFDataArray(v2);
  v14 = CFDataArray;
  if (!CFDataArray)
    return 0;
  v4 = CFDataArray;
  if (*(_BYTE *)(v1 + 140) && (v5 = *(const __CFDictionary **)(v1 + 320)) != 0)
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v5);
  else
    MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v7 = MutableCopy;
  CFDictionarySetValue(MutableCopy, CFSTR("TLSServerCertificateChain"), v4);
  v8 = (const void **)MEMORY[0x24BDBD270];
  if (!*(_BYTE *)(v1 + 1537))
    v8 = (const void **)MEMORY[0x24BDBD268];
  CFDictionarySetValue(v7, CFSTR("TLSSessionWasResumed"), *v8);
  my_CFRelease((const void **)&v14);
  SSLGetNegotiatedCipher(*(SSLContextRef *)v1, &cipherSuite);
  if (cipherSuite)
  {
    LODWORD(valuePtr) = cipherSuite;
    v9 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(v7, CFSTR("TLSNegotiatedCipher"), v9);
    CFRelease(v9);
  }
  if (*(_QWORD *)(v1 + 152))
  {
    v10 = *(const char **)(v1 + 336);
    v15 = *(_DWORD *)(v1 + 328);
    if (v15)
    {
      if (v10)
      {
        valuePtr = CFStringCreateWithCString(0, v10, 0x600u);
        CFDictionarySetValue(v7, CFSTR("InnerEAPTypeName"), valuePtr);
        my_CFRelease(&valuePtr);
      }
      valuePtr = CFNumberCreate(0, kCFNumberIntType, &v15);
      CFDictionarySetValue(v7, CFSTR("InnerEAPType"), valuePtr);
      my_CFRelease(&valuePtr);
    }
  }
  if (*(_DWORD *)(v1 + 136) == 3 && !*(_BYTE *)(v1 + 1396))
  {
    v11 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(v1 + 1392));
    CFDictionarySetValue(v7, CFSTR("TLSTrustClientStatus"), v11);
    CFRelease(v11);
  }
  return v7;
}

__CFString *peap_copy_packet_description(unsigned __int8 *a1, _BYTE *a2)
{
  uint64_t Length;
  uint64_t v5;
  __CFString *Mutable;
  __CFString *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t MessageLength;
  const char *v15;

  Length = EAPPacketGetLength((uint64_t)a1);
  *a2 = 0;
  if (*a1 - 1 > 1)
    return 0;
  v5 = Length;
  Mutable = CFStringCreateMutable(0, 0);
  v7 = Mutable;
  if (v5 > 5)
  {
    v8 = a1[5];
    v9 = "Response";
    if (*a1 == 1)
      v9 = "Request";
    v10 = " [";
    if (v8 < 8)
      v10 = (const char *)&unk_206473DB9;
    CFStringAppendFormat(Mutable, 0, CFSTR("PEAP Version %d %s: Identifier %d Length %d Flags 0x%x%s"), v8 & 7, v9, a1[1], v5, v8, v10);
    v11 = (uint64_t)(a1 + 6);
    v12 = (v5 - 6);
    v13 = a1[5];
    if ((v13 & 0x20) != 0)
    {
      CFStringAppendFormat(v7, 0, CFSTR(" start"));
      v13 = a1[5];
    }
    MessageLength = (v5 - 6);
    if ((v13 & 0x80) != 0 && v5 >= 0xA)
    {
      v11 = (uint64_t)(a1 + 10);
      v12 = (v5 - 10);
      MessageLength = EAPTLSLengthIncludedPacketGetMessageLength((uint64_t)a1);
      CFStringAppendFormat(v7, 0, CFSTR(" length=%u"), MessageLength);
      v13 = a1[5];
    }
    if ((v13 & 0x40) != 0)
    {
      CFStringAppendFormat(v7, 0, CFSTR(" more"));
      v13 = a1[5];
    }
    if (v13 >= 8)
      v15 = " ]";
    else
      v15 = (const char *)&unk_206473DB9;
    CFStringAppendFormat(v7, 0, CFSTR("%s Data Length %d\n"), v15, v12);
    if (MessageLength <= 0x20000)
    {
      print_data_cfstr(v7, v11, v12);
      *a2 = 1;
    }
    else
    {
      CFStringAppendFormat(v7, 0, CFSTR("potential DOS attack %u > %d\n"), MessageLength, 0x20000);
      CFStringAppendFormat(v7, 0, CFSTR("bogus EAP Packet:\n"));
      print_data_cfstr(v7, (uint64_t)a1, v5);
    }
  }
  else
  {
    CFStringAppendFormat(Mutable, 0, CFSTR("EAPTLSPacket header truncated %d < %d\n"), v5, 6);
  }
  return v7;
}

_BYTE *peap_tunnel()
{
  uint64_t *v0;
  int *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  _BYTE *v8;
  int v9;
  signed int v10;
  char v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *LogHandle;
  os_log_type_t v18;
  uint64_t v19;
  size_t v20;
  int Length;
  __CFString *Mutable;
  int IsValid;
  NSObject *v24;
  os_log_type_t v25;
  const char *v26;
  char *v27;
  char *v28;
  _BOOL4 v29;
  char *v30;
  NSObject *v31;
  os_log_type_t v32;
  const char *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint32_t v36;
  unsigned int v37;
  unsigned int v38;
  NSObject *v39;
  os_log_type_t v40;
  __CFString *v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  int v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  unsigned int v51;
  unsigned int v52;
  _BYTE *result;
  int v54;
  size_t v55;
  size_t processed;
  char v57;
  uint8_t buf[4];
  _BYTE v59[18];
  char v60[2048];
  _WORD v61[1024];
  uint64_t v62;

  v0 = (uint64_t *)MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v5 = (uint64_t)v0;
  v62 = *MEMORY[0x24BDAC8D0];
  v6 = *v0;
  v57 = 0;
  v55 = 0;
  processed = 0;
  v54 = 2048;
  v7 = 2 * (*(_DWORD *)(v6 + 124) == 0);
  if (*(_DWORD *)(v6 + 76) != *(unsigned __int8 *)(v3 + 1))
  {
    *(_QWORD *)(v6 + 24) = 0;
    v8 = &v61[v7];
    v15 = SSLRead(*(SSLContextRef *)v6, v8, 2048 - v7 * 2, &processed);
    if ((_DWORD)v15)
    {
      v16 = v15;
      LogHandle = EAPLogGetLogHandle();
      v18 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v18))
      {
        v19 = EAPSSLErrorString(v16);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v59 = v19;
        *(_WORD *)&v59[8] = 1024;
        *(_DWORD *)&v59[10] = v16;
        _os_log_impl(&dword_206440000, LogHandle, v18, "SSLRead failed, %s (%d)", buf, 0x12u);
      }
      *(_DWORD *)(v6 + 104) = 2;
      *(_DWORD *)(v6 + 132) = v16;
      return 0;
    }
    if (!*(_DWORD *)(v6 + 124))
    {
      v20 = processed;
      if (processed < 5
        || *v8 != 1
        || v8[4] != 33
        || (Length = EAPPacketGetLength((uint64_t)&v61[v7]), v20 = processed, processed != Length))
      {
        v61[0] = *(_WORD *)v4;
        processed = v20 + 4;
        v8 = v61;
        EAPPacketSetLength((uint64_t)v61, (unsigned __int16)(v20 + 4));
      }
    }
    if (*(_BYTE *)(v5 + 8))
    {
      Mutable = CFStringCreateMutable(0, 0);
      IsValid = EAPPacketIsValid(v8, (unsigned __int16)processed, Mutable);
      if (Mutable)
      {
        v24 = EAPLogGetLogHandle();
        v25 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v24, v25))
        {
          v26 = " Invalid";
          if (IsValid)
            v26 = (const char *)&unk_206473DB9;
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v59 = v26;
          *(_WORD *)&v59[8] = 2112;
          *(_QWORD *)&v59[10] = Mutable;
          _os_log_impl(&dword_206440000, v24, v25, "PEAP Receive EAP Payload%s:\n%@", buf, 0x16u);
        }
        CFRelease(Mutable);
      }
      if ((IsValid & 1) == 0)
        goto LABEL_34;
    }
    else if ((EAPPacketIsValid(v8, (unsigned __int16)processed, 0) & 1) == 0)
    {
LABEL_34:
      if (*(_BYTE *)(v5 + 8))
        return 0;
      v31 = EAPLogGetLogHandle();
      v32 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v31, v32))
        return 0;
      *(_WORD *)buf = 0;
      v33 = "PEAP Receive EAP Payload Invalid";
      v34 = v31;
      v35 = v32;
      v36 = 2;
      goto LABEL_40;
    }
LABEL_3:
    switch(*v8)
    {
      case 1:
        v9 = v8[4];
        if (v9 != 33)
        {
          if (v9 == 2)
          {
            v10 = v54;
            v11 = v8[1];
            v14 = 2;
            v12 = 0;
            v13 = 0;
          }
          else
          {
            if (v9 != 1)
            {
LABEL_27:
              v27 = peap_eap_process(v5, v8, v60, &v54, v2, &v57);
LABEL_43:
              v28 = v27;
LABEL_44:
              v29 = 0;
              if (!v28)
                goto LABEL_71;
              goto LABEL_45;
            }
            v10 = v54;
            v11 = v8[1];
            v12 = *(void **)(v5 + 40);
            v13 = *(_DWORD *)(v5 + 48);
            v14 = 1;
          }
          v27 = EAPPacketCreate(v60, v10, 2, v11, v14, v12, v13, &v54);
          goto LABEL_43;
        }
        v37 = EAPPacketGetLength((uint64_t)v8);
        if (v37 > 8)
        {
          if ((*(_WORD *)(v8 + 5) & 0xFF3F) != 0x300)
            return 0;
          v51 = *(unsigned __int16 *)(v8 + 9);
          v52 = __rev16(v51);
          if (v52 == 1 || v52 == 2)
            *(_DWORD *)(v6 + 144) = v52;
          v28 = EAPPacketCreate(v60, v54, 2, v8[1], 33, 0, 6, &v54);
          v29 = 0;
          *(_DWORD *)(v28 + 5) = 33555328;
          *(_WORD *)(v28 + 9) = v51;
          if (!v28)
            goto LABEL_71;
LABEL_45:
          if (*(_BYTE *)(v5 + 8))
          {
            v41 = CFStringCreateMutable(0, 0);
            v42 = EAPPacketGetLength((uint64_t)v28);
            EAPPacketIsValid((unsigned __int8 *)v28, v42, v41);
            v43 = EAPLogGetLogHandle();
            v44 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v43, v44))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v59 = v41;
              _os_log_impl(&dword_206440000, v43, v44, "PEAP Send EAP Payload:\n%@", buf, 0xCu);
            }
            CFRelease(v41);
          }
          v45 = v54;
          if (!*(_DWORD *)(v6 + 124) && v54 >= 5 && *v28 == 2 && v28[4] == 33)
            v7 = 0;
          v46 = *(void **)(v6 + 352);
          if (v46 && v46 != (void *)(v6 + 360))
          {
            free(v46);
            v45 = v54;
          }
          *(_QWORD *)(v6 + 352) = 0;
          v47 = SSLWrite(*(SSLContextRef *)v6, &v28[v7 * 2], (int)(v45 - v7 * 2), &v55);
          if (v28 != v60)
          {
            if (!v57)
            {
              free(v28);
              if ((_DWORD)v47)
              {
LABEL_61:
                v48 = EAPLogGetLogHandle();
                v49 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v48, v49))
                {
                  v50 = EAPSSLErrorString(v47);
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)v59 = v50;
                  *(_WORD *)&v59[8] = 2048;
                  *(_QWORD *)&v59[10] = (int)v47;
                  _os_log_impl(&dword_206440000, v48, v49, "SSLWrite failed, %s (%ld)", buf, 0x16u);
                  if (!v29)
                    return 0;
                  goto LABEL_72;
                }
LABEL_71:
                if (!v29)
                  return 0;
              }
LABEL_72:
              result = EAPTLSPacketCreate2(2, 25, *(_BYTE *)(v4 + 1), *(_DWORD *)(v6 + 120), (_QWORD *)(v6 + 40), (_DWORD *)(v6 + 72), 0);
              if (result && *(_QWORD *)(v6 + 40))
              {
                if (*(_BYTE *)(v6 + 128))
                  result[5] |= 0x80u;
              }
              return result;
            }
            EAPClientModulePluginFreePacket(*(_QWORD *)(v6 + 152), v6 + 160, (uint64_t)v28);
          }
          if ((_DWORD)v47)
            goto LABEL_61;
          goto LABEL_72;
        }
        v38 = v37;
        v39 = EAPLogGetLogHandle();
        v40 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v39, v40))
          return 0;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v59 = v38;
        *(_WORD *)&v59[4] = 2048;
        *(_QWORD *)&v59[6] = 9;
        v33 = "packet too short %d < %ld";
        v34 = v39;
        v35 = v40;
        v36 = 18;
        break;
      case 2:
        goto LABEL_27;
      case 3:
        v28 = peap_eap_process(v5, v8, v60, &v54, v2, &v57);
        v29 = *(_DWORD *)(v6 + 124) == 1;
        if (!v28)
          goto LABEL_71;
        goto LABEL_45;
      case 4:
        v30 = peap_eap_process(v5, v8, v60, &v54, v2, &v57);
        v28 = v30;
        if (*(_DWORD *)(v6 + 124) != 1)
          goto LABEL_44;
        *(_DWORD *)(v6 + 144) = 2;
        v29 = 1;
        if (!v30)
          goto LABEL_71;
        goto LABEL_45;
      default:
        return 0;
    }
LABEL_40:
    _os_log_impl(&dword_206440000, v34, v35, v33, buf, v36);
    return 0;
  }
  memoryBufferClear(v6 + 8);
  v8 = *(_BYTE **)(v6 + 352);
  if (v8)
    goto LABEL_3;
  return 0;
}

_BYTE *peap_handshake(uint64_t *a1, char a2, _DWORD *a3)
{
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  const char *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  NSObject *LogHandle;
  os_log_type_t v19;
  char v20;
  int v21;
  _QWORD *v22;
  _DWORD *v23;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = *a1;
  if (*(_BYTE *)(*a1 + 1526) && !*(_BYTE *)(v6 + 1396))
  {
    v7 = peap_verify_server(a1, a2, a3);
    if (!*(_BYTE *)(v6 + 1396))
      return v7;
  }
  else
  {
    v7 = 0;
  }
  v8 = SSLHandshake(*(SSLContextRef *)v6);
  if ((_DWORD)v8 != -9841)
    goto LABEL_13;
  if (!*(_BYTE *)(v6 + 1526))
  {
    *(_BYTE *)(v6 + 1526) = 1;
    my_CFRelease((const void **)(v6 + 1528));
    EAPSSLCopyPeerCertificates(*(SSLContext **)v6, (_QWORD *)(v6 + 1528));
    v7 = peap_verify_server(a1, a2, a3);
    if (!*(_BYTE *)(v6 + 1396))
      return v7;
    v8 = SSLHandshake(*(SSLContextRef *)v6);
LABEL_13:
    v12 = v8;
    if ((_DWORD)v8 == -9803)
    {
      if (!*(_QWORD *)(v6 + 40))
        return v7;
    }
    else if ((_DWORD)v8)
    {
      LogHandle = EAPLogGetLogHandle();
      v19 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v19))
      {
        *(_DWORD *)buf = 136315394;
        v26 = EAPSSLErrorString(v12);
        v27 = 1024;
        LODWORD(v28) = v12;
        _os_log_impl(&dword_206440000, LogHandle, v19, "SSLHandshake failed, %s (%d)", buf, 0x12u);
      }
      *(_DWORD *)(v6 + 132) = v12;
      my_CFRelease((const void **)(v6 + 1528));
      EAPSSLCopyPeerCertificates(*(SSLContext **)v6, (_QWORD *)(v6 + 1528));
      *(_DWORD *)(v6 + 104) = 2;
      SSLClose(*(SSLContextRef *)v6);
      if (!*(_QWORD *)(v6 + 40))
      {
        if ((_DWORD)v12 != -9802)
          return v7;
        v20 = a2;
        v21 = 0;
        v22 = 0;
        v23 = 0;
        return EAPTLSPacketCreate(2, 25, v20, v21, v22, v23);
      }
    }
    else
    {
      if (!*(_BYTE *)(v6 + 1396))
      {
        my_CFRelease((const void **)(v6 + 1528));
        EAPSSLCopyPeerCertificates(*(SSLContext **)v6, (_QWORD *)(v6 + 1528));
        v13 = peap_verify_server(a1, a2, a3);
        if (!*(_BYTE *)(v6 + 1396))
        {
          v7 = v13;
          v9 = EAPLogGetLogHandle();
          v10 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v9, v10))
            return v7;
          *(_WORD *)buf = 0;
          v11 = "trust_proceed is FALSE?";
          goto LABEL_8;
        }
      }
      *(_BYTE *)(v6 + 140) = 1;
      *(_BYTE *)(v6 + 1397) = 0;
      v14 = EAPTLSComputeKeyData();
      if ((_DWORD)v14)
      {
        v15 = v14;
        v16 = EAPLogGetLogHandle();
        v17 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v16, v17))
        {
          *(_DWORD *)buf = 136315394;
          v26 = EAPSSLErrorString(v15);
          v27 = 2048;
          v28 = (int)v15;
          _os_log_impl(&dword_206440000, v16, v17, "EAPTLSComputeSessionKey failed, %s, (%ld)", buf, 0x16u);
        }
      }
      else
      {
        *(_BYTE *)(v6 + 1397) = 1;
      }
      if (!SSLGetResumableSessionInfo())
        *(_BYTE *)(v6 + 1537) = 0;
    }
    v21 = *(_DWORD *)(v6 + 120);
    v23 = (_DWORD *)(v6 + 72);
    v20 = a2;
    v22 = (_QWORD *)(v6 + 40);
    return EAPTLSPacketCreate(2, 25, v20, v21, v22, v23);
  }
  v9 = EAPLogGetLogHandle();
  v10 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v9, v10))
  {
    *(_WORD *)buf = 0;
    v11 = "AuthCompleted again?";
LABEL_8:
    _os_log_impl(&dword_206440000, v9, v10, v11, buf, 2u);
  }
  return v7;
}

void save_last_packet(uint64_t a1, const void *a2)
{
  void *v2;
  unsigned int Length;
  size_t v6;
  void *v7;

  v2 = *(void **)(a1 + 352);
  if (v2 != a2)
  {
    Length = EAPPacketGetLength((uint64_t)a2);
    v6 = Length;
    if (Length < 0x401)
      v7 = (void *)(a1 + 360);
    else
      v7 = malloc_type_malloc(Length, 0x86AD3027uLL);
    *(_QWORD *)(a1 + 352) = v7;
    memcpy(v7, a2, v6);
    if (v2)
    {
      if (v2 != (void *)(a1 + 360))
        free(v2);
    }
  }
}

NSObject *_SIMCopyIMSI(const __CFDictionary *a1)
{
  void *v2;
  id v3;
  const void *Value;
  CFTypeID TypeID;
  void *v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  const char *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x20BCF5E5C]();
  v3 = objc_alloc_init(MEMORY[0x24BDC2810]);
  if (v3)
  {
    if (a1
      && (Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x24BDC30C0]), TypeID = CFStringGetTypeID(), Value)
      && CFGetTypeID(Value) == TypeID)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", Value);
      SubscriptionContextMatchingSlotGet(v3, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_6;
    }
    else
    {
      SubscriptionContextUserPreferredGet(v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
LABEL_6:
        EAPLogGetLogHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v8, v9))
        {
          *(_WORD *)buf = 0;
          v10 = "failed to get the preferred subscription context";
LABEL_15:
          _os_log_impl(&dword_206440000, v8, v9, v10, buf, 2u);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
    }
    v17 = 0;
    v11 = (void *)objc_msgSend(v3, "copyMobileSubscriberIdentity:error:", v7, &v17);
    v12 = v17;
    if (!v12)
    {
      v8 = v11;

      v15 = v8;
      goto LABEL_17;
    }
    v8 = v12;
    EAPLogGetLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v8;
      _os_log_impl(&dword_206440000, v13, v14, "CoreTelephonyClient.copyMobileSubscriberIdentity failed with error: %@", buf, 0xCu);
    }

    goto LABEL_16;
  }
  EAPLogGetLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v8, v9))
  {
    *(_WORD *)buf = 0;
    v10 = "failed to get the CoreTelephonyClient instance";
    goto LABEL_15;
  }
LABEL_16:
  v15 = 0;
LABEL_17:

  objc_autoreleasePoolPop(v2);
  return v15;
}

id SubscriptionContextMatchingSlotGet(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  os_log_type_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  uint8_t v32[128];
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v31 = 0;
  objc_msgSend(a1, "getSubscriptionInfoWithError:", &v31);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v31;
  if (v5)
  {
    EAPLogGetLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v6, v7))
    {
LABEL_5:
      v12 = 0;
      goto LABEL_20;
    }
    *(_DWORD *)buf = 138412290;
    v34 = v5;
    v8 = "CoreTelephonyClient.getSubscriptionInfoWithError failed with error: %@";
    v9 = v6;
    v10 = v7;
    v11 = 12;
LABEL_4:
    _os_log_impl(&dword_206440000, v9, v10, v8, buf, v11);
    goto LABEL_5;
  }
  if (!v4)
  {
    objc_msgSend(0, "subscriptions");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21
      || (v22 = (void *)v21,
          objc_msgSend(0, "subscriptions"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v24 = objc_msgSend(v23, "count"),
          v23,
          v22,
          !v24))
    {
      EAPLogGetLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      v25 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v6, v25))
        goto LABEL_5;
      *(_WORD *)buf = 0;
      v8 = "failed to get the subscription contexts";
      v9 = v6;
      v10 = v25;
      v11 = 2;
      goto LABEL_4;
    }
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v4, "subscriptions");
  v6 = objc_claimAutoreleasedReturnValue();
  v12 = (id)-[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v12)
  {
    v26 = v4;
    v13 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v6);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        if (v15)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), "uuid");
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (void *)v16;
            objc_msgSend(v15, "uuid");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqual:", v3);

            if (v19)
            {
              v12 = v15;
              goto LABEL_19;
            }
          }
        }
      }
      v12 = (id)-[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v12)
        continue;
      break;
    }
LABEL_19:
    v4 = v26;
  }
LABEL_20:

  return v12;
}

id SubscriptionContextUserPreferredGet(void *a1)
{
  void *v1;
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint32_t v8;
  id v9;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  os_log_type_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v27 = 0;
  objc_msgSend(a1, "getSubscriptionInfoWithError:", &v27);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v27;
  if (v2)
  {
    EAPLogGetLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v3, v4))
    {
LABEL_5:
      v9 = 0;
      goto LABEL_6;
    }
    *(_DWORD *)buf = 138412290;
    v30 = v2;
    v5 = "CoreTelephonyClient.getSubscriptionInfoWithError failed with error: %@";
    v6 = v3;
    v7 = v4;
    v8 = 12;
LABEL_4:
    _os_log_impl(&dword_206440000, v6, v7, v5, buf, v8);
    goto LABEL_5;
  }
  if (!v1)
  {
    objc_msgSend(0, "subscriptions");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18
      || (v19 = (void *)v18,
          objc_msgSend(0, "subscriptions"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v20, "count"),
          v20,
          v19,
          !v21))
    {
      EAPLogGetLogHandle();
      v3 = objc_claimAutoreleasedReturnValue();
      v22 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v3, v22))
        goto LABEL_5;
      *(_WORD *)buf = 0;
      v5 = "failed to get the subscription contexts";
      v6 = v3;
      v7 = v22;
      v8 = 2;
      goto LABEL_4;
    }
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v1, "subscriptions", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v9 = (id)-[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v9)
  {
    v11 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v3);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if (v13)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "userDataPreferred");
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = (void *)v14;
            objc_msgSend(v13, "userDataPreferred");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "BOOLValue");

            if (v17)
            {
              v9 = v13;
              goto LABEL_6;
            }
          }
        }
      }
      v9 = (id)-[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_6:

  return v9;
}

id _SIMCopyRealm(const __CFDictionary *a1)
{
  void *v2;
  id v3;
  const void *Value;
  CFTypeID TypeID;
  void *v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  const char *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  id v17;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x20BCF5E5C]();
  v3 = objc_alloc_init(MEMORY[0x24BDC2810]);
  if (!v3)
  {
    EAPLogGetLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v9))
    {
      *(_WORD *)buf = 0;
      v10 = "failed to get the CoreTelephonyClient instance";
      goto LABEL_15;
    }
LABEL_16:

    v7 = 0;
    v16 = 0;
    v11 = 0;
    v13 = 0;
LABEL_17:
    v17 = 0;
    goto LABEL_18;
  }
  if (a1
    && (Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x24BDC30C0]), TypeID = CFStringGetTypeID(), Value)
    && CFGetTypeID(Value) == TypeID)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", Value);
    SubscriptionContextMatchingSlotGet(v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_6;
  }
  else
  {
    SubscriptionContextUserPreferredGet(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_6:
      EAPLogGetLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v8, v9))
      {
        *(_WORD *)buf = 0;
        v10 = "failed to get the preferred subscription context";
LABEL_15:
        _os_log_impl(&dword_206440000, v8, v9, v10, buf, 2u);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  v23 = 0;
  v11 = (void *)objc_msgSend(v3, "copyMobileSubscriberCountryCode:error:", v7, &v23);
  v12 = v23;
  if (v12)
  {
    v13 = v12;
    EAPLogGetLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v14, v15))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v13;
      _os_log_impl(&dword_206440000, v14, v15, "CoreTelephonyClient.copyMobileSubscriberCountryCode failed with error: %@", buf, 0xCu);
    }

    v16 = 0;
    goto LABEL_17;
  }
  v22 = 0;
  v16 = (void *)objc_msgSend(v3, "copyMobileSubscriberNetworkCode:error:", v7, &v22);
  v13 = v22;
  if (v13)
  {
    EAPLogGetLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v19, v20))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v13;
      _os_log_impl(&dword_206440000, v19, v20, "CoreTelephonyClient.copyMobileSubscriberNetworkCode failed with error: %@", buf, 0xCu);
    }

    goto LABEL_17;
  }
  if (v11 && v16)
  {
    if (objc_msgSend(v16, "length") == 2)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0%@"), v16);
      v21 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v21;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("wlan.mnc%@.mcc%@.3gppnetwork.org"), v16, v11);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v13 = 0;
  }
  else
  {
    v17 = 0;
  }
LABEL_18:

  objc_autoreleasePoolPop(v2);
  return v17;
}

uint64_t _SIMIsOOBPseudonymSupported(BOOL *a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  os_log_type_t v13;
  const char *v14;
  uint64_t v15;
  id v17;
  uint8_t buf[4];
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x20BCF5E5C]();
  *a1 = 0;
  v3 = objc_alloc_init(MEMORY[0x24BDC2810]);
  v4 = v3;
  if (!v3)
  {
    EAPLogGetLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v13 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v10, v13))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v14 = "failed to get the CoreTelephonyClient instance";
LABEL_11:
    _os_log_impl(&dword_206440000, v10, v13, v14, buf, 2u);
    goto LABEL_12;
  }
  SubscriptionContextUserPreferredGet(v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    EAPLogGetLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v13 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v10, v13))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v14 = "failed to get the user preferred subscription context";
    goto LABEL_11;
  }
  v6 = v5;
  v7 = *MEMORY[0x24BDC2A80];
  v17 = 0;
  v8 = objc_msgSend(v4, "context:supportedIdentityProtectionFor:error:", v5, v7, &v17);
  v9 = v17;
  if (!v9)
  {
    *a1 = v8 == 2;
    v15 = 1;
    v10 = v6;
    goto LABEL_13;
  }
  v10 = v9;
  EAPLogGetLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v11, v12))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v10;
    _os_log_impl(&dword_206440000, v11, v12, "CoreTelephonyClient.supportedIdentityProtectionFor failed with error: %@", buf, 0xCu);
  }

LABEL_12:
  v15 = 0;
LABEL_13:

  objc_autoreleasePoolPop(v2);
  return v15;
}

NSObject *_SIMCopyOOBPseudonym()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  os_log_type_t v11;
  const char *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x20BCF5E5C]();
  v1 = objc_alloc_init(MEMORY[0x24BDC2810]);
  v2 = v1;
  if (!v1)
  {
    EAPLogGetLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    v11 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v6, v11))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v12 = "failed to get the CoreTelephonyClient instance";
LABEL_11:
    _os_log_impl(&dword_206440000, v6, v11, v12, buf, 2u);
    goto LABEL_12;
  }
  SubscriptionContextUserPreferredGet(v1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    EAPLogGetLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    v11 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v6, v11))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v12 = "failed to get the user preferred subscription context";
    goto LABEL_11;
  }
  v4 = (void *)v3;
  v5 = *MEMORY[0x24BDC2A80];
  v15 = 0;
  objc_msgSend(v2, "context:getPseudoIdentityFor:error:", v3, v5, &v15);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v15;
  if (!v7)
  {
    v6 = v6;

    v13 = v6;
    goto LABEL_13;
  }
  v8 = v7;
  EAPLogGetLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v9, v10))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v8;
    _os_log_impl(&dword_206440000, v9, v10, "CoreTelephonyClient.getPseudoIdentityFor failed with error: %@", buf, 0xCu);
  }

LABEL_12:
  v13 = 0;
LABEL_13:

  objc_autoreleasePoolPop(v0);
  return v13;
}

NSObject *_SIMCopyEncryptedIMSIInfo(int a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  const char *v15;
  void *v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  void *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x20BCF5E5C]();
  v3 = objc_alloc_init(MEMORY[0x24BDC2810]);
  v4 = v3;
  if (!v3)
  {
    EAPLogGetLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v13, v14))
    {
      *(_WORD *)buf = 0;
      v15 = "failed to get the CoreTelephonyClient instance";
LABEL_13:
      _os_log_impl(&dword_206440000, v13, v14, v15, buf, 2u);
    }
LABEL_14:
    v6 = 0;
    v8 = 0;
    v16 = 0;
    v11 = 0;
    v7 = 0;
    v17 = 0;
LABEL_21:

    goto LABEL_22;
  }
  SubscriptionContextUserPreferredGet(v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    EAPLogGetLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v13, v14))
    {
      *(_WORD *)buf = 0;
      v15 = "failed to get the user preferred subscription context";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v6 = (void *)v5;
  v7 = _SIMCopyIMSI(0);
  if (!v7)
  {
    v8 = 0;
    v16 = 0;
    v11 = 0;
    v17 = 0;
LABEL_22:
    v13 = 0;
    goto LABEL_23;
  }
  v8 = _SIMCopyRealm(0);
  if (a1 == 18)
    v9 = CFSTR("1%@");
  else
    v9 = CFSTR("0%@");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v21 = v2;
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@@%@"), v10, v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v10;
  }
  v16 = v12;
  v22 = 0;
  objc_msgSend(v4, "context:getEncryptedIdentity:error:", v6, v12, &v22);
  v13 = objc_claimAutoreleasedReturnValue();
  v17 = v22;
  if (v17)
  {
    EAPLogGetLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v17;
      _os_log_impl(&dword_206440000, v18, v19, "CoreTelephonyClient.getEncryptedIdentity failed with error: %@", buf, 0xCu);
    }

    v2 = v21;
    goto LABEL_21;
  }
LABEL_23:

  objc_autoreleasePoolPop(v2);
  return v13;
}

void _SIMReportDecryptionError(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  os_log_type_t v10;
  const char *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x20BCF5E5C]();
  v3 = objc_alloc_init(MEMORY[0x24BDC2810]);
  v4 = v3;
  if (!v3)
  {
    EAPLogGetLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v10))
    {
      LOWORD(v12) = 0;
      v11 = "failed to get the CoreTelephonyClient instance";
LABEL_10:
      _os_log_impl(&dword_206440000, v8, v10, v11, (uint8_t *)&v12, 2u);
    }
LABEL_11:
    v6 = 0;
    v7 = 0;
LABEL_12:

    goto LABEL_13;
  }
  SubscriptionContextUserPreferredGet(v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    EAPLogGetLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v10))
    {
      LOWORD(v12) = 0;
      v11 = "failed to get the user preferred subscription context";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v6 = (void *)v5;
  objc_msgSend(v4, "context:evaluateMobileSubscriberIdentity:", v5, a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    EAPLogGetLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v9))
    {
      v12 = 138412290;
      v13 = v7;
      _os_log_impl(&dword_206440000, v8, v9, "CoreTelephonyClient.evaluateMobileSubscriberIdentity failed with error: %@", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_12;
  }
LABEL_13:

  objc_autoreleasePoolPop(v2);
}

uint64_t _SIMCreateAuthResponse(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  dispatch_semaphore_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  dispatch_time_t v15;
  NSObject *v16;
  os_log_type_t v17;
  os_log_type_t v18;
  uint64_t v19;
  _QWORD v21[6];
  uint8_t v22[16];
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v4 = (void *)MEMORY[0x20BCF5E5C]();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v5 = objc_alloc_init(MEMORY[0x24BDC2810]);
  v6 = v5;
  if (!v5)
  {
    EAPLogGetLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v9, v10))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206440000, v9, v10, "failed to get the CoreTelephonyClient instance", buf, 2u);
    }

    v8 = 0;
    goto LABEL_18;
  }
  if (a1)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", a1);
    SubscriptionContextMatchingSlotGet(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_17;
    goto LABEL_9;
  }
  SubscriptionContextUserPreferredGet(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
LABEL_9:
    *(_QWORD *)buf = 0;
    v24 = buf;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__0;
    v27 = __Block_byref_object_dispose__0;
    v28 = 0;
    v11 = dispatch_semaphore_create(0);
    v12 = (void *)*((_QWORD *)v24 + 5);
    *((_QWORD *)v24 + 5) = v11;

    v13 = *((_QWORD *)v24 + 5);
    if (v13)
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDC27E0]), "initWithData:", a2);
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = ___SIMCreateAuthResponse_block_invoke;
      v21[3] = &unk_24BF0D150;
      v21[4] = &v29;
      v21[5] = buf;
      objc_msgSend(v6, "generateAuthenticationInfoUsingSim:authParams:completion:", v8, v14, v21);
      v15 = dispatch_time(0, 20000000000);
      if (dispatch_semaphore_wait(*((dispatch_semaphore_t *)v24 + 5), v15))
      {
        EAPLogGetLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v16, v17))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl(&dword_206440000, v16, v17, "timed out while waiting for response", v22, 2u);
        }

      }
    }
    else
    {
      EAPLogGetLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      v18 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v14, v18))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_206440000, v14, v18, "dispatch_semaphore_create() failed", v22, 2u);
      }
    }

    _Block_object_dispose(buf, 8);
    if (v13)
      goto LABEL_17;
LABEL_18:
    v19 = 0;
    goto LABEL_19;
  }
LABEL_17:
  v19 = v30[3];
LABEL_19:

  _Block_object_dispose(&v29, 8);
  objc_autoreleasePoolPop(v4);
  return v19;
}

void sub_20645F028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
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

uint64_t SIMAuthenticateGSM(const __CFDictionary *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  const void *Value;
  CFTypeID TypeID;
  uint64_t v8;
  void *v9;
  void *v10;
  const void *v11;
  const void *v12;
  CFDataRef v13;
  int v14;
  CFDictionaryRef v15;
  int v16;
  const __CFDictionary *v17;
  const __CFData *v18;
  const __CFData *v19;
  NSObject *v21;
  os_log_type_t v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  void *v26;
  void *key;
  uint64_t v28;
  void *v30;
  void *values[2];
  void *keys[4];
  CFRange v35;
  CFRange v36;

  keys[3] = *(void **)MEMORY[0x24BDAC8D0];
  if (a1)
  {
    Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x24BDC30C0]);
    TypeID = CFStringGetTypeID();
    if (Value && CFGetTypeID(Value) != TypeID)
      Value = 0;
  }
  else
  {
    Value = 0;
  }
  if (a3 >= 1)
  {
    v8 = 0;
    v30 = (void *)*MEMORY[0x24BDC30E0];
    v9 = (void *)*MEMORY[0x24BDC30D8];
    v10 = (void *)*MEMORY[0x24BDC30B0];
    v11 = (const void *)*MEMORY[0x24BDC30A8];
    key = (void *)*MEMORY[0x24BDC3078];
    v12 = (const void *)*MEMORY[0x24BDC30C8];
    v26 = (void *)*MEMORY[0x24BDC3080];
    v28 = a3;
    while (1)
    {
      v13 = CFDataCreate(0, (const UInt8 *)(a2 + 16 * v8), 16);
      keys[0] = v30;
      keys[1] = v10;
      values[0] = v9;
      values[1] = v13;
      v14 = 2;
      v15 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      CFRelease(v13);
      do
      {
        v16 = v14;
        v17 = (const __CFDictionary *)_SIMCreateAuthResponse((uint64_t)Value, (uint64_t)v15);
        if (v17)
          break;
        --v14;
      }
      while (v16);
      CFRelease(v15);
      if (!v17)
        break;
      v18 = (const __CFData *)CFDictionaryGetValue(v17, v11);
      if (!v18 && (v18 = (const __CFData *)CFDictionaryGetValue(v17, key)) == 0 || CFDataGetLength(v18) != 8)
      {
        EAPLogGetLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v21, v22))
        {
          LOWORD(keys[0]) = 0;
          v23 = "bogus Kc value";
          goto LABEL_25;
        }
LABEL_26:

        CFRelease(v17);
        return 0;
      }
      v35.location = 0;
      v35.length = 8;
      CFDataGetBytes(v18, v35, (UInt8 *)(a4 + (8 * v8)));
      v19 = (const __CFData *)CFDictionaryGetValue(v17, v12);
      if (!v19 && (v19 = (const __CFData *)CFDictionaryGetValue(v17, v26)) == 0 || CFDataGetLength(v19) != 4)
      {
        EAPLogGetLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v21, v22))
        {
          LOWORD(keys[0]) = 0;
          v23 = "bogus SRES value";
LABEL_25:
          _os_log_impl(&dword_206440000, v21, v22, v23, (uint8_t *)keys, 2u);
        }
        goto LABEL_26;
      }
      v36.location = 0;
      v36.length = 4;
      CFDataGetBytes(v19, v36, (UInt8 *)(a5 + (4 * v8)));
      CFRelease(v17);
      if (++v8 == v28)
        return 1;
    }
    EAPLogGetLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v24, v25))
    {
      LOWORD(keys[0]) = 0;
      _os_log_impl(&dword_206440000, v24, v25, "Could not access SIM", (uint8_t *)keys, 2u);
    }

  }
  return 0;
}

BOOL SIMAuthenticateAKA(const __CFDictionary *a1, void *a2, void *a3, const void **a4)
{
  const void *Value;
  CFTypeID TypeID;
  void *v9;
  void *v10;
  CFDictionaryRef v11;
  int v12;
  int v13;
  const __CFDictionary *v14;
  const void *v15;
  const void *v16;
  const void *v17;
  BOOL v18;
  const void *v20;
  NSObject *v21;
  os_log_type_t v22;
  const void *v23;
  const void **v24;
  const void *v25;
  void *values[3];
  void *keys[4];

  keys[3] = *(void **)MEMORY[0x24BDAC8D0];
  *(_OWORD *)a4 = 0u;
  *((_OWORD *)a4 + 1) = 0u;
  if (a1)
  {
    Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x24BDC30C0]);
    TypeID = CFStringGetTypeID();
    if (Value && CFGetTypeID(Value) != TypeID)
      Value = 0;
  }
  else
  {
    Value = 0;
  }
  v9 = (void *)*MEMORY[0x24BDC30D0];
  v10 = (void *)*MEMORY[0x24BDC30B0];
  keys[0] = *(void **)MEMORY[0x24BDC30E0];
  keys[1] = v10;
  values[0] = v9;
  values[1] = a2;
  keys[2] = *(void **)MEMORY[0x24BDC3088];
  values[2] = a3;
  v11 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v12 = 2;
  do
  {
    v13 = v12;
    v14 = (const __CFDictionary *)_SIMCreateAuthResponse((uint64_t)Value, (uint64_t)v11);
    if (v14)
      break;
    v12 = v13 - 1;
  }
  while (v13);
  CFRelease(v11);
  if (v14)
  {
    *(_OWORD *)a4 = 0u;
    *((_OWORD *)a4 + 1) = 0u;
    v15 = CFDictionaryGetValue(v14, (const void *)*MEMORY[0x24BDC3098]);
    v16 = CFDictionaryGetValue(v14, (const void *)*MEMORY[0x24BDC30A0]);
    v17 = CFDictionaryGetValue(v14, (const void *)*MEMORY[0x24BDC30B8]);
    if (v15)
      v18 = v16 == 0;
    else
      v18 = 1;
    if (v18 || v17 == 0)
    {
      v20 = CFDictionaryGetValue(v14, (const void *)*MEMORY[0x24BDC3090]);
      if (!v20)
      {
LABEL_25:
        CFRelease(v14);
        return v14 != 0;
      }
      v25 = v20;
      v24 = a4 + 3;
    }
    else
    {
      v23 = v17;
      my_FieldSetRetainedCFType(a4, v15);
      my_FieldSetRetainedCFType(a4 + 1, v16);
      v24 = a4 + 2;
      v25 = v23;
    }
    my_FieldSetRetainedCFType(v24, v25);
    goto LABEL_25;
  }
  EAPLogGetLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v21, v22))
  {
    LOWORD(keys[0]) = 0;
    _os_log_impl(&dword_206440000, v21, v22, "Could not access SIM", (uint8_t *)keys, 2u);
  }

  return v14 != 0;
}

double AKAAuthResultsInit(_OWORD *a1)
{
  double result;

  result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

SIMStatusIndicator *_SIMAccessConnectionCreate(uint64_t a1, uint64_t a2)
{
  void *v4;
  SIMStatusIndicator *v5;

  v4 = (void *)MEMORY[0x20BCF5E5C]();
  v5 = objc_alloc_init(SIMStatusIndicator);
  -[SIMStatusIndicator setCallback:](v5, "setCallback:", a1);
  -[SIMStatusIndicator setApplicationContext:](v5, "setApplicationContext:", a2);
  -[SIMStatusIndicator createConnection](v5, "createConnection");
  objc_autoreleasePoolPop(v4);
  return v5;
}

void AKAAuthResultsSetIK(uint64_t a1, const void *a2)
{
  my_FieldSetRetainedCFType((const void **)(a1 + 8), a2);
}

void AKAAuthResultsSetRES(uint64_t a1, const void *a2)
{
  my_FieldSetRetainedCFType((const void **)(a1 + 16), a2);
}

void AKAAuthResultsSetAUTS(uint64_t a1, const void *a2)
{
  my_FieldSetRetainedCFType((const void **)(a1 + 24), a2);
}

void AKAAuthResultsRelease(const void **a1)
{
  my_FieldSetRetainedCFType(a1, 0);
  my_FieldSetRetainedCFType(a1 + 1, 0);
  my_FieldSetRetainedCFType(a1 + 2, 0);
  my_FieldSetRetainedCFType(a1 + 3, 0);
}

CFArrayRef eapgtc_require_props(uint64_t a1)
{
  void *values;

  if (*(_QWORD *)(a1 + 64))
    return 0;
  values = CFSTR("UserPassword");
  return CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x24BDBD690]);
}

BOOL eapttls_eap()
{
  uint64_t *v0;
  int *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  char *v7;
  unsigned __int8 *v8;
  __CFString *Mutable;
  uint64_t Length;
  NSObject *LogHandle;
  os_log_type_t v12;
  void *v13;
  BOOL v14;
  int v15;
  int v16;
  int v17;
  size_t v18;
  _DWORD *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL8 result;
  uint64_t v24;
  const char *v25;
  uint8_t *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint32_t v29;
  __CFString *v30;
  int IsValid;
  int v32;
  NSObject *v33;
  os_log_type_t v34;
  const char *v35;
  NSObject *v36;
  os_log_type_t v37;
  int v38;
  char v39;
  void *v40;
  int v41;
  int v42;
  NSObject *v43;
  os_log_type_t v44;
  signed int __len[3];
  int v46;
  char v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  uint8_t v52[4];
  const char *v53;
  __int16 v54;
  __CFString *v55;
  unsigned __int8 v56[2048];
  uint64_t v57;

  v0 = (uint64_t *)MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v3 = (uint64_t)v0;
  v57 = *MEMORY[0x24BDAC8D0];
  v47 = 0;
  v4 = *v0;
  *(_QWORD *)&__len[1] = 0;
  if (*(_DWORD *)(v4 + 76) == *(unsigned __int8 *)(v5 + 1))
  {
    memoryBufferClear(v4 + 8);
    v6 = *(unsigned __int8 **)(v4 + 496);
    if (v6)
    {
LABEL_3:
      __len[0] = 2048;
      switch(*v6)
      {
        case 1u:
          v38 = v6[4];
          if (v38 == 2)
          {
            v39 = v6[1];
            v40 = 0;
            v42 = 2;
            v41 = 0;
          }
          else
          {
            if (v38 != 1)
            {
LABEL_4:
              v7 = eapttls_eap_process(v3, v6, (char *)v52, __len, v2, &v47);
              goto LABEL_5;
            }
            v39 = v6[1];
            v40 = *(void **)(v3 + 40);
            v41 = *(_DWORD *)(v3 + 48);
            v42 = 1;
          }
          v7 = EAPPacketCreate((char *)v52, 2048, 2, v39, v42, v40, v41, __len);
LABEL_5:
          v8 = (unsigned __int8 *)v7;
          if (!v7)
            return 0;
          if (*(_BYTE *)(v3 + 8))
          {
            Mutable = CFStringCreateMutable(0, 0);
            Length = EAPPacketGetLength((uint64_t)v8);
            EAPPacketIsValid(v8, Length, Mutable);
            LogHandle = EAPLogGetLogHandle();
            v12 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(LogHandle, v12))
            {
              *(_DWORD *)buf = 138412290;
              v49 = (uint64_t)Mutable;
              _os_log_impl(&dword_206440000, LogHandle, v12, "TTLS Send EAP Payload:\n%@", buf, 0xCu);
            }
            CFRelease(Mutable);
          }
          v13 = *(void **)(v4 + 496);
          if (v13)
            v14 = v13 == (void *)(v4 + 504);
          else
            v14 = 1;
          if (!v14)
            free(v13);
          *(_QWORD *)(v4 + 496) = 0;
          v15 = __len[0] + 8;
          if (__len[0] + 8 <= 0)
            v16 = -(-(__len[0] + 8) & 3);
          else
            v16 = (__len[0] + 8) & 3;
          v17 = __len[0] - v16 + 12;
          if (!v16)
            v17 = __len[0] + 8;
          v18 = v17;
          v19 = malloc_type_malloc(v17, 0xAA1E9BBFuLL);
          bzero(v19, v18);
          *v19 = 1325400064;
          v19[1] = bswap32(v15 & 0xFFFFFF);
          memmove(v19 + 2, v8, __len[0]);
          v20 = SSLWrite(*(SSLContextRef *)v4, v19, v18, (size_t *)&__len[1]);
          free(v19);
          if (v8 == v52)
            goto LABEL_23;
          if (v47)
          {
            EAPClientModulePluginFreePacket(*(_QWORD *)(v4 + 296), v4 + 304, (uint64_t)v8);
LABEL_23:
            if ((_DWORD)v20)
              goto LABEL_24;
          }
          else
          {
            free(v8);
            if ((_DWORD)v20)
            {
LABEL_24:
              v21 = EAPLogGetLogHandle();
              v22 = _SC_syslog_os_log_mapping();
              result = os_log_type_enabled(v21, v22);
              if (!result)
                return result;
              v24 = EAPSSLErrorString(v20);
              *(_DWORD *)buf = 136315394;
              v49 = v24;
              v50 = 2048;
              v51 = (int)v20;
              v25 = "SSLWrite failed, %s (%ld)";
              v26 = buf;
              v27 = v21;
              v28 = v22;
              v29 = 22;
LABEL_48:
              _os_log_impl(&dword_206440000, v27, v28, v25, v26, v29);
              return 0;
            }
          }
          return 1;
        case 2u:
        case 3u:
        case 4u:
          goto LABEL_4;
        default:
          return 0;
      }
    }
    return 0;
  }
  v46 = 2048;
  if (eapttls_eap_read_avp(v0, v56, (unsigned int *)&v46))
  {
    if (!*(_BYTE *)(v3 + 8))
    {
      v6 = v56;
      if ((EAPPacketIsValid(v56, (unsigned __int16)v46, 0) & 1) != 0)
        goto LABEL_3;
      goto LABEL_45;
    }
    v30 = CFStringCreateMutable(0, 0);
    IsValid = EAPPacketIsValid(v56, (unsigned __int16)v46, v30);
    v32 = IsValid;
    if (v30)
    {
      v33 = EAPLogGetLogHandle();
      v34 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = " Invalid";
        if (v32)
          v35 = (const char *)&unk_206473DB9;
        *(_DWORD *)v52 = 136315394;
        v53 = v35;
        v54 = 2112;
        v55 = v30;
        _os_log_impl(&dword_206440000, v33, v34, "TTLS Receive EAP Payload%s:\n%@", v52, 0x16u);
      }
      CFRelease(v30);
      if ((v32 & 1) == 0)
      {
LABEL_45:
        if (!*(_BYTE *)(v3 + 8))
        {
          v43 = EAPLogGetLogHandle();
          v44 = _SC_syslog_os_log_mapping();
          result = os_log_type_enabled(v43, v44);
          if (!result)
            return result;
          *(_WORD *)v52 = 0;
          v25 = "TTLS Receive EAP Payload Invalid";
          v26 = v52;
          v27 = v43;
          v28 = v44;
          v29 = 2;
          goto LABEL_48;
        }
        return 0;
      }
    }
    else if ((IsValid & 1) == 0)
    {
      goto LABEL_45;
    }
    v6 = v56;
    goto LABEL_3;
  }
  v36 = EAPLogGetLogHandle();
  v37 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v36, v37))
  {
    *(_WORD *)v52 = 0;
    _os_log_impl(&dword_206440000, v36, v37, "TTLS EAP Payload is missing", v52, 2u);
  }
  result = 0;
  *(_DWORD *)(v4 + 104) = 2;
  return result;
}

uint64_t eapttls_eap_read_avp(uint64_t *a1, void *a2, unsigned int *a3)
{
  char v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  size_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  NSObject *LogHandle;
  os_log_type_t v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint32_t v23;
  NSObject *v24;
  os_log_type_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t result;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  size_t processed;
  uint64_t data;
  uint8_t buf[4];
  _BYTE v38[10];
  int v39;
  uint64_t v40;

  v5 = 0;
  v40 = *MEMORY[0x24BDAC8D0];
  data = 0;
  v6 = *a1;
  v7 = *a3;
  while (1)
  {
    processed = 0;
    v8 = SSLRead(*(SSLContextRef *)v6, &data, 8uLL, &processed);
    if ((_DWORD)v8)
      break;
    if (processed != 8)
    {
      LogHandle = EAPLogGetLogHandle();
      v19 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v19))
      {
        *(_WORD *)buf = 0;
        v20 = "EAP AVP is invalid";
        v21 = LogHandle;
        v22 = v19;
        v23 = 2;
        goto LABEL_25;
      }
LABEL_26:
      LODWORD(v14) = 0;
LABEL_27:
      if ((v5 & 1) != 0)
        return 1;
      goto LABEL_32;
    }
    v9 = bswap32(HIDWORD(data));
    v10 = v9 & 0xFFFFFF;
    if ((v9 & 0xFFFFFF) <= 8)
    {
      v24 = EAPLogGetLogHandle();
      v25 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v24, v25))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v38 = v10;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = 8;
        v20 = "EAP AVP is too short %d <= %d";
        v21 = v24;
        v22 = v25;
        goto LABEL_24;
      }
      goto LABEL_26;
    }
    if ((v9 & 3) != 0)
      v11 = (v9 & 0xFFFFFC) - 4;
    else
      v11 = (v9 & 0xFFFFFF) - 8;
    if (v11 > v7)
    {
      v26 = EAPLogGetLogHandle();
      v27 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v26, v27))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v38 = v11;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = v7;
        v20 = "EAP AVP is too large %d > %d";
        v21 = v26;
        v22 = v27;
LABEL_24:
        v23 = 14;
LABEL_25:
        _os_log_impl(&dword_206440000, v21, v22, v20, buf, v23);
      }
      goto LABEL_26;
    }
    if (v5 & 1 | ((_DWORD)data != 1325400064))
    {
      MEMORY[0x24BDAC7A8]();
      v12 = SSLRead(*(SSLContextRef *)v6, (char *)&processed - ((v11 + 15) & 0x1FFFFFFF0), v11, &processed);
      if ((_DWORD)v12)
      {
        v14 = v12;
        v29 = EAPLogGetLogHandle();
        v30 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v29, v30))
        {
          v31 = EAPSSLErrorString(v14);
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v38 = v31;
          *(_WORD *)&v38[8] = 1024;
          v39 = v14;
          _os_log_impl(&dword_206440000, v29, v30, "SSLRead failed, %s (%d)", buf, 0x12u);
        }
        if ((v5 & 1) == 0)
          goto LABEL_32;
        return 1;
      }
    }
    else
    {
      v13 = SSLRead(*(SSLContextRef *)v6, a2, v11, &processed);
      if ((_DWORD)v13)
      {
        v14 = v13;
        v32 = EAPLogGetLogHandle();
        v33 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v32, v33))
        {
          v34 = EAPSSLErrorString(v14);
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v38 = v34;
          *(_WORD *)&v38[8] = 1024;
          v39 = v14;
          _os_log_impl(&dword_206440000, v32, v33, "SSLRead failed, %s (%d)", buf, 0x12u);
        }
        goto LABEL_32;
      }
      *a3 = processed;
      v5 = 1;
    }
  }
  v14 = v8;
  if ((_DWORD)v8 == -9803)
    goto LABEL_27;
  v15 = EAPLogGetLogHandle();
  v16 = _SC_syslog_os_log_mapping();
  if (!os_log_type_enabled(v15, v16))
    goto LABEL_27;
  v17 = EAPSSLErrorString(v14);
  *(_DWORD *)buf = 136315394;
  *(_QWORD *)v38 = v17;
  *(_WORD *)&v38[8] = 1024;
  v39 = v14;
  _os_log_impl(&dword_206440000, v15, v16, "SSLRead failed, %s (%d)", buf, 0x12u);
  if ((v5 & 1) != 0)
    return 1;
LABEL_32:
  result = 0;
  *(_DWORD *)(v6 + 124) = v14;
  return result;
}

char *eapttls_eap_process(uint64_t a1, unsigned __int8 *a2, char *a3, signed int *a4, int *a5, _BYTE *a6)
{
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v15;
  unsigned int v16;
  int v17;
  uint64_t v18;
  NSObject *LogHandle;
  os_log_type_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  _UNKNOWN **v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  NSObject *v33;
  os_log_type_t v34;
  int v35;
  uint64_t v36;
  uint8_t buf[4];
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v11 = *(_QWORD *)a1;
  v36 = 0;
  *a6 = 0;
  v12 = *a2;
  if (v12 == 2)
  {
    v21 = a2[4];
    v22 = *(_QWORD *)(v11 + 296);
    if (v22)
      LODWORD(v22) = EAPClientModulePluginEAPType(v22);
    if ((_DWORD)v22 != v21)
      return (char *)v36;
    goto LABEL_15;
  }
  if (v12 == 1)
  {
    v13 = a2[4];
    if (!a2[4])
      return (char *)v36;
    v15 = *(_QWORD *)(v11 + 296);
    if (v15)
      LODWORD(v15) = EAPClientModulePluginEAPType(v15);
    if ((_DWORD)v15 != v13)
    {
      v16 = a2[4];
      if (v16 <= 0x1A && ((1 << v16) & 0x4000050) != 0)
      {
        eap_client_free_1(v11);
        v17 = a2[4];
        v18 = *(_QWORD *)a1;
        *(_DWORD *)(v18 + 472) = 0;
        *(_QWORD *)(v18 + 480) = 0;
        if (*(_QWORD *)(v18 + 296))
        {
          LogHandle = EAPLogGetLogHandle();
          v20 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v20))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_206440000, LogHandle, v20, "eap_client_init: already initialized\n", buf, 2u);
          }
          goto LABEL_15;
        }
        v29 = EAPClientModuleLookup(v17);
        if (v29)
        {
          v30 = (uint64_t)v29;
          my_CFRelease((const void **)(v18 + 456));
          my_CFRelease((const void **)(v18 + 464));
          *(_QWORD *)(v18 + 448) = 0;
          *(_OWORD *)(v18 + 416) = 0u;
          *(_OWORD *)(v18 + 432) = 0u;
          *(_OWORD *)(v18 + 384) = 0u;
          *(_OWORD *)(v18 + 400) = 0u;
          *(_OWORD *)(v18 + 352) = 0u;
          *(_OWORD *)(v18 + 368) = 0u;
          *(_OWORD *)(v18 + 320) = 0u;
          *(_OWORD *)(v18 + 336) = 0u;
          *(_OWORD *)(v18 + 304) = 0u;
          *(_DWORD *)(v18 + 320) = *(_DWORD *)(a1 + 16);
          *(_QWORD *)(v18 + 344) = *(_QWORD *)(a1 + 40);
          *(_DWORD *)(v18 + 352) = *(_DWORD *)(a1 + 48);
          *(_QWORD *)(v18 + 368) = *(_QWORD *)(a1 + 64);
          *(_DWORD *)(v18 + 376) = *(_DWORD *)(a1 + 72);
          *(_QWORD *)(v18 + 384) = *(_QWORD *)(a1 + 80);
          *(_DWORD *)(v18 + 488) = EAPClientModulePluginInit(v30, v18 + 304, v18 + 456, v18 + 492);
          *(_QWORD *)(v18 + 480) = EAPClientModulePluginEAPName(v30);
          *(_DWORD *)(v18 + 472) = v17;
          if (!*(_DWORD *)(v18 + 488))
          {
            *(_QWORD *)(v18 + 296) = v30;
            goto LABEL_15;
          }
        }
        if (*(_DWORD *)(v11 + 488) == 3)
        {
          *a5 = 3;
          save_last_packet_0(v11, a2);
          return (char *)v36;
        }
        v33 = EAPLogGetLogHandle();
        v34 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v33, v34))
        {
          v35 = a2[4];
          *(_DWORD *)buf = 67109120;
          v38 = v35;
          _os_log_impl(&dword_206440000, v33, v34, "eap_client_init type %d failed", buf, 8u);
        }
        v32 = *(_DWORD *)(v11 + 488);
      }
      else
      {
        v31 = *(int *)(v11 + 1528);
        if ((int)v31 <= 2)
        {
          *(_DWORD *)(v11 + 1528) = v31 + 1;
          buf[0] = inner_auth_types_1[v31];
          return EAPPacketCreate(a3, *a4, 2, a2[1], 3, buf, 1, a4);
        }
        v32 = 5;
      }
      *a5 = v32;
      *(_DWORD *)(v11 + 104) = 2;
      return (char *)v36;
    }
  }
LABEL_15:
  if (*(_QWORD *)(v11 + 296))
  {
    my_CFRelease((const void **)(v11 + 456));
    my_CFRelease((const void **)(v11 + 464));
    v23 = *(_QWORD *)a1;
    v24 = *(_QWORD *)a1 + 304;
    *(_QWORD *)(v23 + 344) = *(_QWORD *)(a1 + 40);
    *(_DWORD *)(v23 + 352) = *(_DWORD *)(a1 + 48);
    *(_QWORD *)(v23 + 368) = *(_QWORD *)(a1 + 64);
    *(_DWORD *)(v23 + 376) = *(_DWORD *)(a1 + 72);
    *(_DWORD *)(v23 + 324) = *(_DWORD *)(a1 + 20);
    *(_QWORD *)(v23 + 384) = *(_QWORD *)(a1 + 80);
    v25 = EAPClientModulePluginProcess(*(_QWORD *)(v23 + 296), v24, (uint64_t)a2, (uint64_t)&v36, v23 + 488, v23 + 492);
    v26 = v36;
    if (v36)
    {
      *a6 = 1;
      *a4 = EAPPacketGetLength(v26);
    }
    *(_QWORD *)(v11 + 464) = EAPClientModulePluginPublishProperties(*(_QWORD *)(v11 + 296), v11 + 304);
    if (v25 == 2)
    {
      *(_DWORD *)(v11 + 292) = 2;
      v27 = *(_DWORD *)(v11 + 488);
      goto LABEL_24;
    }
    if (v25 == 1)
    {
      *(_DWORD *)(v11 + 292) = 1;
      return (char *)v36;
    }
    if (!v25 && *(_DWORD *)(v11 + 488) == 3)
    {
      *(_QWORD *)(v11 + 456) = EAPClientModulePluginRequireProperties(*(_QWORD *)(v11 + 296), v11 + 304);
      save_last_packet_0(v11, a2);
      v27 = *(_DWORD *)(v11 + 488);
      *(_DWORD *)(v11 + 128) = v27;
LABEL_24:
      *a5 = v27;
    }
  }
  return (char *)v36;
}

void save_last_packet_0(uint64_t a1, const void *a2)
{
  void *v2;
  unsigned int Length;
  size_t v6;
  void *v7;

  v2 = *(void **)(a1 + 496);
  if (v2 != a2)
  {
    Length = EAPPacketGetLength((uint64_t)a2);
    v6 = Length;
    if (Length < 0x401)
      v7 = (void *)(a1 + 504);
    else
      v7 = malloc_type_malloc(Length, 0x60B4E9D9uLL);
    *(_QWORD *)(a1 + 496) = v7;
    memcpy(v7, a2, v6);
    if (v2)
    {
      if (v2 != (void *)(a1 + 504))
        free(v2);
    }
  }
}

uint64_t eapttls_failure_string()
{
  return 0;
}

uint64_t eapttls_msk_copy_bytes(uint64_t *a1, _OWORD *a2, int a3)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  if (a3 < 64)
    return 0;
  v3 = *a1;
  if (!*(_BYTE *)(*a1 + 149))
    return 0;
  v4 = *(_OWORD *)(v3 + 150);
  v5 = *(_OWORD *)(v3 + 166);
  v6 = *(_OWORD *)(v3 + 198);
  a2[2] = *(_OWORD *)(v3 + 182);
  a2[3] = v6;
  *a2 = v4;
  a2[1] = v5;
  return 64;
}

CFArrayRef eapttls_require_props(_QWORD *a1)
{
  uint64_t v1;
  CFArrayRef result;
  __CFString *v3;
  void *values;

  v1 = *a1;
  if (*(_DWORD *)(*a1 + 128) != 3)
    return 0;
  if (!*(_BYTE *)(v1 + 148))
  {
    v3 = CFSTR("TLSUserTrustProceedCertificateChain");
    goto LABEL_11;
  }
  if (*(_DWORD *)(v1 + 132) != 5)
  {
    if (a1[8])
      return 0;
    v3 = CFSTR("UserPassword");
LABEL_11:
    values = v3;
    return CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x24BDBD690]);
  }
  if (!*(_BYTE *)(v1 + 136))
    return 0;
  result = *(CFArrayRef *)(v1 + 456);
  if (result)
    return (CFArrayRef)CFRetain(result);
  return result;
}

_BYTE *eapttls_tunnel(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v5;
  int v6;
  int v7;
  char v9;
  int v10;
  _QWORD *v11;
  _DWORD *v12;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *LogHandle;
  os_log_type_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  size_t v22;
  unsigned __int8 *v23;
  size_t processed;
  uint64_t data;
  int v26;
  _BYTE buf[12];
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)a1;
  v6 = *(unsigned __int8 *)(a2 + 1);
  if (!*(_BYTE *)(*(_QWORD *)a1 + 137))
  {
    if (*(_DWORD *)(v5 + 76) == v6)
      memoryBufferClear(v5 + 8);
    if (*(_QWORD *)(a1 + 64))
      return eapttls_start_inner_auth((uint64_t *)a1, v6);
    v14 = 0;
    *a3 = 3;
    return v14;
  }
  v7 = *(_DWORD *)(v5 + 132);
  if (v7 != 4)
  {
    if (v7 == 5)
    {
      if (eapttls_eap())
      {
        v9 = *(_BYTE *)(a2 + 1);
        v10 = *(_DWORD *)(v5 + 120);
        v11 = (_QWORD *)(v5 + 40);
        v12 = (_DWORD *)(v5 + 72);
        return EAPTLSPacketCreate(2, 21, v9, v10, v11, v12);
      }
      return 0;
    }
LABEL_11:
    v9 = *(_BYTE *)(a2 + 1);
    v10 = 0;
    v11 = 0;
    v12 = 0;
    return EAPTLSPacketCreate(2, 21, v9, v10, v11, v12);
  }
  if (*(_DWORD *)(v5 + 76) == v6)
    goto LABEL_11;
  v26 = 0;
  processed = 0;
  data = 0;
  v15 = SSLRead(*(SSLContextRef *)v5, &data, 0xCuLL, &processed);
  if ((_DWORD)v15)
  {
    v16 = v15;
    LogHandle = EAPLogGetLogHandle();
    v18 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v18))
    {
      v19 = EAPSSLErrorString(v16);
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v19;
      v28 = 2048;
      v29 = (int)v16;
      _os_log_impl(&dword_206440000, LogHandle, v18, "SSLRead failed, %s (%ld)", buf, 0x16u);
    }
    v14 = 0;
    *(_DWORD *)(v5 + 104) = 2;
    *(_DWORD *)(v5 + 124) = v16;
    return v14;
  }
  if (processed == 12
    && (v20 = bswap32(HIDWORD(data)), (v20 & 0x80000000) != 0)
    && (_DWORD)data == 436207616
    && v26 == 922812416
    && (v21 = v20 & 0xFFFFFF, v21 <= 0x20000))
  {
    v22 = v21 - 12;
    *(_QWORD *)buf = v21 - 12;
    v23 = (unsigned __int8 *)malloc_type_malloc(v21 - 12, 0x6E36CB3FuLL);
    if (SSLRead(*(SSLContextRef *)v5, v23, v22, (size_t *)buf) || *(_QWORD *)buf < 0x2BuLL)
    {
      v14 = 0;
      *(_DWORD *)(v5 + 104) = 2;
      if (!v23)
        return v14;
    }
    else if (*v23 == *(unsigned __int8 *)(v5 + 1588)
           && MSChap2AuthResponseValid(*(UInt8 **)(a1 + 64), *(_DWORD *)(a1 + 72), (const void *)(v5 + 1548), (const void *)(v5 + 1532), (const void *)(v5 + 1572), *(char **)(a1 + 40), v23 + 1))
    {
      v14 = EAPTLSPacketCreate(2, 21, v6, 0, 0, 0);
    }
    else
    {
      v14 = 0;
      *(_DWORD *)(v5 + 104) = 2;
    }
    free(v23);
  }
  else
  {
    v14 = 0;
    *(_DWORD *)(v5 + 104) = 2;
  }
  return v14;
}

_BYTE *eapttls_handshake(uint64_t *a1, char a2, _DWORD *a3)
{
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  NSObject *LogHandle;
  os_log_type_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  NSObject *v17;
  os_log_type_t v18;
  int v19;
  _DWORD *v20;
  char v21;
  _QWORD *v22;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = *a1;
  if (*(_BYTE *)(*a1 + 278) && !*(_BYTE *)(v6 + 148))
  {
    v7 = eapttls_verify_server(a1, a2, a3);
    if (!*(_BYTE *)(v6 + 148))
      return v7;
  }
  else
  {
    v7 = 0;
  }
  v8 = SSLHandshake(*(SSLContextRef *)v6);
  if ((_DWORD)v8 != -9841)
    goto LABEL_13;
  if (!*(_BYTE *)(v6 + 278))
  {
    *(_BYTE *)(v6 + 278) = 1;
    my_CFRelease((const void **)(v6 + 280));
    EAPSSLCopyPeerCertificates(*(SSLContext **)v6, (_QWORD *)(v6 + 280));
    v7 = eapttls_verify_server(a1, a2, a3);
    if (!*(_BYTE *)(v6 + 148))
      return v7;
    v8 = SSLHandshake(*(SSLContextRef *)v6);
LABEL_13:
    v12 = v8;
    if ((_DWORD)v8 == -9803)
    {
      if (!*(_QWORD *)(v6 + 40))
        return v7;
    }
    else
    {
      if (!(_DWORD)v8)
      {
        if (!*(_BYTE *)(v6 + 148))
        {
          my_CFRelease((const void **)(v6 + 280));
          EAPSSLCopyPeerCertificates(*(SSLContext **)v6, (_QWORD *)(v6 + 280));
          v7 = eapttls_verify_server(a1, a2, a3);
          if (!*(_BYTE *)(v6 + 148))
          {
            LogHandle = EAPLogGetLogHandle();
            v10 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(LogHandle, v10))
              return v7;
            *(_WORD *)buf = 0;
            v11 = "trust_proceed is FALSE?";
            goto LABEL_8;
          }
        }
        *(_BYTE *)(v6 + 136) = 1;
        *(_BYTE *)(v6 + 149) = 0;
        v13 = EAPTLSComputeKeyData();
        if ((_DWORD)v13)
        {
          v14 = v13;
          v15 = EAPLogGetLogHandle();
          v16 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v15, v16))
          {
            *(_DWORD *)buf = 136315394;
            v26 = EAPSSLErrorString(v14);
            v27 = 2048;
            v28 = (int)v14;
            _os_log_impl(&dword_206440000, v15, v16, "EAPTLSComputeSessionKey failed, %s (%ld)", buf, 0x16u);
          }
        }
        else
        {
          *(_BYTE *)(v6 + 149) = 1;
        }
        if (!SSLGetResumableSessionInfo())
          *(_BYTE *)(v6 + 289) = 0;
        if (!a1[8])
        {
          *(_DWORD *)(v6 + 128) = 3;
          *a3 = 3;
          return v7;
        }
        return eapttls_start_inner_auth(a1, a2);
      }
      v17 = EAPLogGetLogHandle();
      v18 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v17, v18))
      {
        *(_DWORD *)buf = 136315394;
        v26 = EAPSSLErrorString(v12);
        v27 = 2048;
        v28 = (int)v12;
        _os_log_impl(&dword_206440000, v17, v18, "SSLHandshake failed, %s (%ld)", buf, 0x16u);
      }
      *(_DWORD *)(v6 + 124) = v12;
      my_CFRelease((const void **)(v6 + 280));
      EAPSSLCopyPeerCertificates(*(SSLContext **)v6, (_QWORD *)(v6 + 280));
      *(_DWORD *)(v6 + 104) = 2;
      SSLClose(*(SSLContextRef *)v6);
      if (!*(_QWORD *)(v6 + 40))
      {
        if ((_DWORD)v12 != -9802)
          return v7;
        v21 = a2;
        v19 = 0;
        v22 = 0;
        v20 = 0;
        return EAPTLSPacketCreate(2, 21, v21, v19, v22, v20);
      }
    }
    v19 = *(_DWORD *)(v6 + 120);
    v20 = (_DWORD *)(v6 + 72);
    v21 = a2;
    v22 = (_QWORD *)(v6 + 40);
    return EAPTLSPacketCreate(2, 21, v21, v19, v22, v20);
  }
  LogHandle = EAPLogGetLogHandle();
  v10 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v10))
  {
    *(_WORD *)buf = 0;
    v11 = "AuthCompleted again?";
LABEL_8:
    _os_log_impl(&dword_206440000, LogHandle, v10, v11, buf, 2u);
  }
  return v7;
}

uint64_t EAPTLSLengthIncludedPacketGetMessageLength(uint64_t a1)
{
  return bswap32(*(_DWORD *)(a1 + 6));
}

uint64_t EAPTLSLengthIncludedPacketSetMessageLength(uint64_t result, unsigned int a2)
{
  *(_DWORD *)(result + 6) = bswap32(a2);
  return result;
}

double memoryBufferInit(_OWORD *a1)
{
  double result;

  result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

void *memoryBufferAllocate(uint64_t a1, size_t size)
{
  void *result;

  result = malloc_type_malloc(size, 0x645E8704uLL);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = size;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 24) = 0;
  return result;
}

uint64_t memoryBufferIsComplete(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

BOOL memoryBufferAddData(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t v3;
  size_t v4;
  size_t v5;
  uint64_t v8;
  size_t v9;

  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v5 = v3 + a3;
  if (v3 + a3 <= v4)
  {
    memmove((void *)(*(_QWORD *)a1 + v3), a2, a3);
    v8 = *(_QWORD *)(a1 + 8);
    v9 = *(_QWORD *)(a1 + 16) + a3;
    *(_QWORD *)(a1 + 16) = v9;
    if (v9 == v8)
    {
      *(_QWORD *)(a1 + 16) = 0;
      *(_BYTE *)(a1 + 24) = 1;
    }
  }
  return v5 <= v4;
}

_BYTE *memoryIOSetDebug(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

__CFString *EAPTLSPacketCopyDescription(unsigned __int8 *a1, _BYTE *a2)
{
  uint64_t Length;
  uint64_t v5;
  __CFString *Mutable;
  const char *v7;
  const char *v8;
  const char *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;

  Length = EAPPacketGetLength((uint64_t)a1);
  *a2 = 0;
  if (*a1 - 1 > 1)
    return 0;
  v5 = Length;
  Mutable = CFStringCreateMutable(0, 0);
  if (v5 <= 5)
  {
    CFStringAppendFormat(Mutable, 0, CFSTR("EAPTLSPacket header truncated %d < %d\n"), v5, 6);
    return Mutable;
  }
  v7 = EAPTypeStr(a1[4]);
  if (*a1 == 1)
    v8 = "Request";
  else
    v8 = "Response";
  v9 = " [";
  if (!a1[5])
    v9 = (const char *)&unk_206473DB9;
  CFStringAppendFormat(Mutable, 0, CFSTR("%s %s: Identifier %d Length %d Flags 0x%x%s"), v7, v8, a1[1], v5, a1[5], v9);
  v10 = a1[5];
  if ((v10 & 0x20) != 0)
  {
    CFStringAppendFormat(Mutable, 0, CFSTR(" start"));
    v10 = a1[5];
  }
  if ((v10 & 0x80) != 0)
  {
    if (v5 <= 9)
    {
      CFStringAppendFormat(Mutable, 0, CFSTR("\nEAPTLSLengthIncludedPacket header truncated %d < %d\n"), v5, 10);
      return Mutable;
    }
    v11 = (uint64_t)(a1 + 10);
    v12 = (v5 - 10);
    v13 = bswap32(*(_DWORD *)(a1 + 6));
    CFStringAppendFormat(Mutable, 0, CFSTR(" length=%u"), v13);
    v10 = a1[5];
    if ((v10 & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  v11 = (uint64_t)(a1 + 6);
  v12 = (v5 - 6);
  v13 = v12;
  if ((v10 & 0x40) != 0)
  {
LABEL_14:
    CFStringAppendFormat(Mutable, 0, CFSTR(" more"));
    v10 = a1[5];
  }
LABEL_15:
  if (v10)
    v14 = " ]";
  else
    v14 = (const char *)&unk_206473DB9;
  CFStringAppendFormat(Mutable, 0, CFSTR("%s Data Length %d\n"), v14, v12);
  if (v13 <= 0x20000)
  {
    print_data_cfstr(Mutable, v11, v12);
    *a2 = 1;
  }
  else
  {
    CFStringAppendFormat(Mutable, 0, CFSTR("rejecting packet to avoid DOS attack %u > %d\n"), v13, 0x20000);
  }
  return Mutable;
}

uint64_t EAPTLSSecTrustEvaluate(__SecTrust *a1, SecTrustResultType *a2)
{
  BOOL v4;
  uint64_t TrustResult;
  NSObject *LogHandle;
  os_log_type_t v7;
  NSObject *v8;
  os_log_type_t v9;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  error = 0;
  v4 = SecTrustEvaluateWithError(a1, &error);
  TrustResult = SecTrustGetTrustResult(a1, a2);
  if (!v4 && error)
  {
    LogHandle = EAPLogGetLogHandle();
    v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v7))
    {
      *(_DWORD *)buf = 138412290;
      v13 = error;
      _os_log_impl(&dword_206440000, LogHandle, v7, "SecTrustEvaluateWithError failed, %@\n", buf, 0xCu);
    }
    CFRelease(error);
  }
  if ((_DWORD)TrustResult)
  {
    v8 = EAPLogGetLogHandle();
    v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v13) = TrustResult;
      _os_log_impl(&dword_206440000, v8, v9, "SecTrustGetTrustResult failed, %d\n", buf, 8u);
    }
  }
  return TrustResult;
}

uint64_t EAPTLSCopyIdentityTrustChain(__SecIdentity *a1, CFDictionaryRef theDict, __CFArray **a3)
{
  const __CFDictionary *v6;
  CFTypeID TypeID;
  const __CFArray *v8;
  CFTypeID v9;
  uint64_t result;
  const __CFDictionary *Value;
  const void *v12;
  CFTypeID v13;
  __CFArray *Mutable;
  __CFArray *v15;
  CFRange v16;

  if (!a1)
  {
    if (theDict)
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, CFSTR("TLSIdentityHandle"));
      if (Value)
        return EAPSecIdentityHandleCreateSecIdentityTrustChain(Value, a3);
    }
    goto LABEL_11;
  }
  if (!theDict)
    return EAPSecIdentityCreateTrustChain(a1, a3);
  v6 = (const __CFDictionary *)CFDictionaryGetValue(theDict, CFSTR("TLSIdentityHandle"));
  TypeID = CFDictionaryGetTypeID();
  if (v6 && CFGetTypeID(v6) == TypeID)
  {
    v8 = (const __CFArray *)CFDictionaryGetValue(v6, CFSTR("TLSClientIdentityTrustChain"));
    v9 = CFArrayGetTypeID();
    if (v8 && CFGetTypeID(v8) == v9)
      return EAPSecIdentityCreateTrustChainWithPersistentCertificateRefs(a1, v8, a3);
LABEL_11:
    *a3 = 0;
    return 4294967246;
  }
  v12 = CFDictionaryGetValue(theDict, CFSTR("TLSClientIdentityTrustChainCertificates"));
  v13 = CFArrayGetTypeID();
  if (!v12 || CFGetTypeID(v12) != v13)
    return EAPSecIdentityCreateTrustChain(a1, a3);
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  if (!Mutable)
    return 4294967188;
  v15 = Mutable;
  CFArrayAppendValue(Mutable, a1);
  v16.length = CFArrayGetCount((CFArrayRef)v12);
  v16.location = 0;
  CFArrayAppendArray(v15, (CFArrayRef)v12, v16);
  result = 0;
  *a3 = v15;
  return result;
}

_QWORD *EAPTLSSessionCreateContext(const __CFDictionary *a1, int a2, const void *a3, const __CFArray *a4, unsigned int *a5)
{
  _QWORD *v10;
  const void *ValueAtIndex;
  CFIndex Count;
  CFMutableArrayRef MutableCopy;
  EAPBoringSSLSession *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  const char *v18;
  uint8_t *v19;
  SSLContext *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  NSObject *LogHandle;
  os_log_type_t v27;
  uint64_t v28;
  uint8_t v30[12];
  int v31;
  CFMutableArrayRef v32;
  unsigned int v33;
  uint8_t buf[32];
  __int128 v35;
  const void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v33 = 0;
  v32 = 0;
  v10 = malloc_type_malloc(0x10uLL, 0xE0040E685C293uLL);
  *v10 = 0;
  v10[1] = 0;
  if (!EAPOLControlPrefsGetUseBoringSSL())
  {
    v20 = EAPTLSMemIOContextCreate(a1, 0, a3, 0, (OSStatus *)&v33);
    if (!v20 || v33)
    {
      LogHandle = EAPLogGetLogHandle();
      v27 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v27))
      {
        v28 = EAPSSLErrorString(v33);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v28;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = (int)v33;
        _os_log_impl(&dword_206440000, LogHandle, v27, "EAPTLSMemIOContextCreate failed, %s (%ld)", buf, 0x16u);
      }
      if (!v20)
        goto LABEL_28;
    }
    else
    {
      if (!a4 || CFArrayGetCount(a4) < 1 || (v33 = SSLSetCertificate(v20, a4)) == 0)
      {
        *v10 = v20;
        v16 = EAPLogGetLogHandle();
        v17 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v16, v17))
          goto LABEL_28;
        *(_WORD *)buf = 0;
        v18 = "TLS(SecureTransport) session started";
        v19 = buf;
        goto LABEL_27;
      }
      v21 = EAPLogGetLogHandle();
      v22 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = EAPSSLErrorString(v33);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = (int)v33;
        _os_log_impl(&dword_206440000, v21, v22, "SSLSetCertificate failed, %s (%ld)", buf, 0x16u);
      }
    }
    CFRelease(v20);
    goto LABEL_28;
  }
  v35 = 0u;
  memset(buf, 0, sizeof(buf));
  v31 = 0;
  EAPBoringSSLUtilGetPreferredTLSVersions(a1, (__int16 *)&v31 + 1, (__int16 *)&v31);
  *(_WORD *)&buf[16] = HIWORD(v31);
  *(_WORD *)&buf[18] = v31;
  *(_QWORD *)&buf[24] = EAPTLSSessionMemoryIORead;
  *(_QWORD *)&v35 = EAPTLSSessionMemoryIOWrite;
  DWORD2(v35) = a2;
  v36 = a3;
  if (a4 && CFArrayGetCount(a4) >= 1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a4, 0);
    if (isA_SecIdentity(ValueAtIndex))
      *(_QWORD *)buf = ValueAtIndex;
    if (CFArrayGetCount(a4) >= 2)
    {
      Count = CFArrayGetCount(a4);
      MutableCopy = CFArrayCreateMutableCopy(0, Count, a4);
      v32 = MutableCopy;
      CFArrayRemoveValueAtIndex(MutableCopy, 0);
      *(_QWORD *)&buf[8] = MutableCopy;
    }
  }
  v14 = EAPBoringSSLSessionContextCreate((uint64_t)buf, 0);
  my_CFRelease((const void **)&v32);
  if (v14)
  {
    v10[1] = v14;
    EAPBoringSSLSessionStart(v14, v15);
    v16 = EAPLogGetLogHandle();
    v17 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v16, v17))
      goto LABEL_28;
    *(_WORD *)v30 = 0;
    v18 = "TLS(boringssl) session started";
    v19 = v30;
LABEL_27:
    _os_log_impl(&dword_206440000, v16, v17, v18, v19, 2u);
    goto LABEL_28;
  }
  v24 = EAPLogGetLogHandle();
  v25 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v24, v25))
  {
    *(_WORD *)v30 = 0;
    _os_log_impl(&dword_206440000, v24, v25, "EAPBoringSSLSessionContextCreate failed", v30, 2u);
  }
  v33 = -67671;
LABEL_28:
  if (a5)
    *a5 = v33;
  return v10;
}

uint64_t EAPTLSSessionMemoryIORead(uint64_t a1, void *a2, size_t *a3)
{
  if (memoryBufferIsComplete(*(_QWORD *)(a1 + 8)))
  {
    if (EAPSSLMemoryIORead(a1, a2, a3) == -9803)
      return 4294967246;
  }
  else
  {
    *a3 = 0;
  }
  return 0;
}

void EAPTLSSessionFreeContext(uint64_t a1)
{
  void *v2;

  if (a1)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      EAPBoringSSLSessionContextFree(v2);
    }
    else if (*(_QWORD *)a1)
    {
      CFRelease(*(CFTypeRef *)a1);
    }
    free((void *)a1);
  }
}

SSLContext *EAPTLSSessionClose(uint64_t a1, const char *a2)
{
  SSLContext *result;

  if (!a1)
    return (SSLContext *)4294967246;
  if (*(_QWORD *)(a1 + 8))
  {
    EAPBoringSSLSessionStop(*(void **)(a1 + 8), a2);
  }
  else
  {
    result = *(SSLContext **)a1;
    if (!result)
      return result;
    SSLClose(result);
  }
  return 0;
}

uint64_t EAPTLSSessionSetPeerID(uint64_t *a1, const void *a2, size_t a3)
{
  uint64_t result;

  result = 4294967246;
  if (a1 && a2 && a3)
  {
    if (a1[1])
    {
      return 0;
    }
    else
    {
      result = *a1;
      if (*a1)
        return SSLSetPeerID((SSLContextRef)result, a2, a3);
    }
  }
  return result;
}

uint64_t EAPTLSSessionGetState(uint64_t result, SSLSessionState *state)
{
  void *v3;
  SSLSessionState v4;
  unsigned int v5;

  if (!state)
    return 4294967246;
  *state = kSSLIdle;
  if (result)
  {
    v3 = *(void **)(result + 8);
    if (v3)
    {
      v5 = 0;
      result = EAPBoringSSLSessionGetCurrentState(v3, &v5);
      v4 = v5;
      if (v5 >= 3)
        v4 = kSSLClosed;
      *state = v4;
    }
    else
    {
      result = *(_QWORD *)result;
      if (result)
        return SSLGetSessionState((SSLContextRef)result, state);
    }
  }
  return result;
}

uint64_t EAPTLSSessionHandshake(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  SSLContext *v3;
  NSObject *LogHandle;
  os_log_type_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 4294967246;
  if (*(_QWORD *)(a1 + 8))
  {
    v1 = EAPBoringSSLSessionHandshake(*(void **)(a1 + 8));
LABEL_7:
    v2 = v1;
    goto LABEL_8;
  }
  v3 = *(SSLContext **)a1;
  if (v3)
  {
    v1 = SSLHandshake(v3);
    goto LABEL_7;
  }
  v2 = 0;
LABEL_8:
  LogHandle = EAPLogGetLogHandle();
  v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v5))
  {
    v7 = 136315394;
    v8 = EAPSecurityErrorString(v2);
    v9 = 1024;
    v10 = v2;
    _os_log_impl(&dword_206440000, LogHandle, v5, "received handshake status [%s]:[%d]", (uint8_t *)&v7, 0x12u);
  }
  return v2;
}

void **EAPTLSSessionCopyPeerCertificates(void **result, _QWORD *a2)
{
  if (result && a2)
  {
    *a2 = 0;
    if (result[1])
    {
      return (void **)EAPBoringSSLSessionCopyServerCertificates(result[1], a2);
    }
    else
    {
      result = (void **)*result;
      if (result)
        return (void **)EAPSSLCopyPeerCertificates((SSLContext *)result, a2);
    }
  }
  return result;
}

void *EAPTLSSessionGetSecTrust(uint64_t a1, const char *a2)
{
  void *result;

  result = *(void **)(a1 + 8);
  if (result)
    return EAPBoringSSLSessionGetSecTrust(result, a2);
  return result;
}

BOOL EAPTLSSessionIsRevocationStatusCheckRequired(_BOOL8 result)
{
  uint64_t v1;
  NSObject *LogHandle;
  os_log_type_t v3;
  void *v4;
  int NegotiatedTLSVersion;
  NSObject *v6;
  os_log_type_t v7;
  unsigned __int16 v8;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = result;
    if (EAPOLControlPrefsGetRevocationCheck() != 1)
      return 0;
    LogHandle = EAPLogGetLogHandle();
    v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v3))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206440000, LogHandle, v3, "revocation check preference is enabled", buf, 2u);
    }
    v4 = *(void **)(v1 + 8);
    if (!v4)
      return 0;
    v8 = 0;
    NegotiatedTLSVersion = EAPBoringSSLSessionGetNegotiatedTLSVersion(v4, &v8);
    v6 = EAPLogGetLogHandle();
    v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v6, v7))
    {
      *(_DWORD *)buf = 67109120;
      v10 = v8;
      _os_log_impl(&dword_206440000, v6, v7, "negotiated TLS protocol version is [%04X]", buf, 8u);
    }
    return !NegotiatedTLSVersion && v8 == 772;
  }
  return result;
}

uint64_t EAPTLSSessionComputeSessionKey(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5)
{
  if (!a1)
    return 4294967246;
  if (*(_QWORD *)(a1 + 8))
    return EAPBoringSSLSessionComputeKeyData(*(void **)(a1 + 8), a4, a5);
  if (*(_QWORD *)a1)
    return EAPTLSComputeKeyData();
  else
    return 4294967246;
}

void EAPTLSSessionGetSessionResumed(uint64_t a1, BOOL *a2)
{
  uint64_t SessionResumed;
  uint64_t v4;
  NSObject *LogHandle;
  os_log_type_t v6;
  uint64_t v7;
  BOOL v8;
  char v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 8))
    {
      SessionResumed = EAPBoringSSLSessionGetSessionResumed(*(void **)(a1 + 8), &v9);
    }
    else
    {
      if (!*(_QWORD *)a1)
      {
        v8 = 0;
        goto LABEL_12;
      }
      SessionResumed = SSLGetResumableSessionInfo();
    }
    v4 = SessionResumed;
    if ((_DWORD)SessionResumed)
    {
      LogHandle = EAPLogGetLogHandle();
      v6 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v6))
      {
        v7 = EAPSSLErrorString(v4);
        *(_DWORD *)buf = 136315394;
        v11 = v7;
        v12 = 2048;
        v13 = (int)v4;
        _os_log_impl(&dword_206440000, LogHandle, v6, "EAP-TLS session failed to get session resumed info, %s (%ld)", buf, 0x16u);
      }
      return;
    }
    v8 = v9 != 0;
LABEL_12:
    *a2 = v8;
  }
}

_QWORD *EAPTLSSessionGetNegotiatedTLSProtocolVersion(_QWORD *result)
{
  __int16 v1;

  if (result)
  {
    if (*result)
      return 0;
    result = (_QWORD *)result[1];
    if (result)
    {
      v1 = 0;
      if (!EAPBoringSSLSessionGetNegotiatedTLSVersion(result, &v1) && (unsigned __int16)(v1 - 769) <= 3u)
        return (_QWORD *)*((_QWORD *)&off_24BF0D328 + (__int16)(v1 - 769));
      return 0;
    }
  }
  return result;
}

SSLContext *EAPTLSSessionGetNegotiatedCipher(SSLContext *result, SSLCipherSuite *a2)
{
  if (result && a2)
  {
    *a2 = 0;
    result = *(SSLContext **)result;
    if (result)
      return (SSLContext *)SSLGetNegotiatedCipher(result, a2);
  }
  return result;
}

uint64_t eapsim_init(uint64_t a1)
{
  int v2;
  const __CFDictionary *v3;
  const __CFString *v4;
  const __CFString *v5;
  int v6;
  NSObject *LogHandle;
  os_log_type_t v8;
  _BOOL4 v9;
  const void *Value;
  void *v11;
  uint64_t v12;
  int identity_type;
  __int128 v14;
  int plist_int;
  NSObject *v16;
  os_log_type_t v17;
  int v18;
  __int128 *MasterKey;
  uint64_t v20;
  _BOOL4 v21;
  uint64_t result;
  NSObject *v23;
  os_log_type_t v24;
  _QWORD *v25;
  int v26;
  _BOOL4 v27;
  NSObject *v28;
  os_log_type_t v29;
  _QWORD *v30;
  char v31;
  NSObject *v32;
  os_log_type_t v33;
  os_log_type_t v34;
  char v35;
  unsigned __int8 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint8_t buf[4];
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v39 = 0;
  v37 = 0u;
  v38 = 0u;
  v2 = SIMStaticInitFromProperties((const void **)&v37, *(const __CFDictionary **)(a1 + 80));
  v3 = *(const __CFDictionary **)(a1 + 80);
  if (!v2)
  {
    v5 = (const __CFString *)SIMCopyIMSI(v3);
    LogHandle = EAPLogGetLogHandle();
    v8 = _SC_syslog_os_log_mapping();
    v9 = os_log_type_enabled(LogHandle, v8);
    if (!v5)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_206440000, LogHandle, v8, "EAP-SIM: no SIM available", buf, 2u);
      }
      return 16;
    }
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206440000, LogHandle, v8, "EAP-SIM: SIM found", buf, 2u);
    }
    v6 = 0;
LABEL_8:
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("TLSTrustExceptionsID"));
    v11 = malloc_type_malloc(0x718uLL, 0x1070040CC9F52CAuLL);
    if (!v11)
    {
      CFRelease(v5);
      SIMStaticInitFromProperties((const void **)&v37, 0);
      return 2;
    }
    v12 = (uint64_t)v11;
    bzero(v11, 0x718uLL);
    *(_DWORD *)(v12 + 16) = -1;
    identity_type = S_get_identity_type(*(const void **)(a1 + 80));
    *(_QWORD *)(v12 + 264) = EAPSIMAKAPersistentStateCreate(18, 20, v5, identity_type, Value);
    CFRelease(v5);
    v14 = v38;
    *(_OWORD *)(v12 + 40) = v37;
    *(_OWORD *)(v12 + 56) = v14;
    *(_QWORD *)(v12 + 72) = v39;
    plist_int = S_get_plist_int(*(const __CFDictionary **)(a1 + 80), CFSTR("EAPSIMNumberOfRANDs"), 3);
    *(_DWORD *)(v12 + 24) = plist_int;
    if ((plist_int & 0xFFFFFFFE) != 2)
    {
      v16 = EAPLogGetLogHandle();
      v17 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = *(_DWORD *)(v12 + 24);
        *(_DWORD *)buf = 67109120;
        v41 = v18;
        _os_log_impl(&dword_206440000, v16, v17, "eapsim: EAPSIMNumberOfRands %d is invalid, using 3 instead", buf, 8u);
      }
      *(_DWORD *)(v12 + 24) = 3;
    }
    if (EAPSIMAKAPersistentStateGetReauthID(*(_QWORD *)(v12 + 264)))
    {
      MasterKey = (__int128 *)EAPSIMAKAPersistentStateGetMasterKey(*(_QWORD *)(v12 + 264));
      fips186_2prf(MasterKey, v12 + 80);
      *(_BYTE *)(v12 + 240) = 1;
      if (EAPSIMAKAPersistentStateGetReauthIDUsed(*(_QWORD *)(v12 + 264)))
        EAPSIMAKAPersistentStateSetReauthIDUsed(*(_QWORD *)(v12 + 264), 0);
    }
    v20 = *(_QWORD *)(v12 + 264);
    if (v20)
      v21 = EAPSIMAKAPersistentStateTemporaryUsernameAvailable(v20);
    else
      v21 = 0;
    v36 = 0;
    if (*(_QWORD *)(a1 + 56))
      goto LABEL_26;
    v35 = 0;
    v25 = EAPSIMAKAInitEncryptedIdentityInfo(18, *(CFDictionaryRef *)(a1 + 80), v6, &v36, &v35);
    *(_QWORD *)(v12 + 280) = v25;
    v26 = v36;
    if (v36 != 1 || v25)
    {
LABEL_36:
      if (v26 == 1)
      {
        v30 = *(_QWORD **)(v12 + 280);
        if (v30)
        {
          if (*v30)
            v31 = v21;
          else
            v31 = 1;
          if ((v31 & 1) == 0)
          {
            *(_BYTE *)(v12 + 296) = 1;
            v32 = EAPLogGetLogHandle();
            v33 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v32, v33))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_206440000, v32, v33, "EAP-SIM: using out-of-band pseudonym as an identity", buf, 2u);
            }
          }
        }
      }
LABEL_26:
      result = 0;
      *(_QWORD *)v12 = a1;
      *(_QWORD *)a1 = v12;
      return result;
    }
    v27 = v35 == 1 && v21;
    v28 = EAPLogGetLogHandle();
    if (v27)
    {
      v29 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v28, v29))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_206440000, v28, v29, "EAP-SIM: out-of-band pseudonym is not required as in-band pseudonym is available", buf, 2u);
      }
      v26 = v36;
      goto LABEL_36;
    }
    v34 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v28, v34))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206440000, v28, v34, "EAP-SIM: failed to get privacy protected identity", buf, 2u);
    }
    EAPSIMContextFree(v12);
    return 16;
  }
  v4 = (const __CFString *)copy_static_imsi(v3);
  if (v4)
  {
    v5 = v4;
    v6 = 1;
    goto LABEL_8;
  }
  v23 = EAPLogGetLogHandle();
  v24 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v23, v24))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_206440000, v23, v24, "eapsim: static triplets specified but IMSI missing", buf, 2u);
  }
  SIMStaticInitFromProperties((const void **)&v37, 0);
  return 4;
}

void eapsim_free(uint64_t *a1)
{
  EAPSIMContextFree(*a1);
  *a1 = 0;
}

uint64_t eapsim_process(uint64_t *a1, unsigned __int8 *a2, uint64_t *a3, int *a4, _DWORD *a5)
{
  uint64_t v5;
  int v6;
  NSObject *LogHandle;
  os_log_type_t v8;
  uint8_t v10[16];

  v5 = *a1;
  *a4 = 0;
  *a5 = 0;
  v6 = *a2;
  switch(v6)
  {
    case 4:
      *(_DWORD *)(v5 + 16) = -1;
      *(_DWORD *)(v5 + 8) = 2;
      *a4 = 1;
      break;
    case 3:
      *(_DWORD *)(v5 + 16) = -1;
      if (*(_DWORD *)(v5 + 12) == 4)
      {
        *(_DWORD *)(v5 + 8) = 1;
        EAPSIMAKAPersistentStateSave(*(_QWORD *)(v5 + 264), *(unsigned __int8 *)(v5 + 240));
        if (*(_BYTE *)(v5 + 296))
        {
          LogHandle = EAPLogGetLogHandle();
          v8 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v8))
          {
            *(_WORD *)v10 = 0;
            _os_log_impl(&dword_206440000, LogHandle, v8, "eapsim: requesting out-of-band psuedonym refresh", v10, 2u);
          }
          SIMReportDecryptionError(0);
        }
      }
      break;
    case 1:
      *a3 = eapsim_request(v5, a2, a4, a5);
      break;
  }
  return *(unsigned int *)(v5 + 8);
}

uint64_t eapsim_failure_string()
{
  return 0;
}

uint64_t eapsim_session_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2;

  v2 = *a1;
  if (*(_DWORD *)(*a1 + 12) != 4 || !*(_BYTE *)(v2 + 240))
    return 0;
  *a2 = 32;
  return v2 + 112;
}

uint64_t eapsim_server_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2;

  v2 = *a1;
  if (*(_DWORD *)(*a1 + 12) != 4 || !*(_BYTE *)(v2 + 240))
    return 0;
  *a2 = 32;
  return v2 + 144;
}

uint64_t eapsim_msk_copy_bytes(uint64_t *a1, _OWORD *a2, int a3)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  if (a3 < 64)
    return 0;
  v3 = *a1;
  if (!*(_BYTE *)(*a1 + 240) || *(_DWORD *)(v3 + 12) != 4)
    return 0;
  v4 = *(_OWORD *)(v3 + 112);
  v5 = *(_OWORD *)(v3 + 128);
  v6 = *(_OWORD *)(v3 + 160);
  a2[2] = *(_OWORD *)(v3 + 144);
  a2[3] = v6;
  *a2 = v4;
  a2[1] = v5;
  return 64;
}

CFDictionaryRef eapsim_publish_props(uint64_t a1)
{
  void *keys;

  keys = CFSTR("EAPAKASIMNotificationActionInfo");
  if (*(_QWORD *)(*(_QWORD *)a1 + 288))
    return CFDictionaryCreate(0, (const void **)&keys, (const void **)(*(_QWORD *)a1 + 288), 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  else
    return 0;
}

void *eapsim_user_name_copy(const __CFDictionary *a1)
{
  const __CFString *v2;
  const __CFString *v3;
  const void **v4;
  int identity_type;
  void *v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t SSID;
  NSObject *LogHandle;
  os_log_type_t v14;
  const void *v15;
  int v16;
  NSObject *v17;
  os_log_type_t v18;
  os_log_type_t v19;
  char v21;
  __int16 v22;
  const __CFString *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v22 = 0;
  v2 = (const __CFString *)copy_static_imsi(a1);
  v23 = v2;
  v3 = v2;
  if (!v2)
  {
    v3 = (const __CFString *)SIMCopyIMSI(a1);
    v23 = v3;
    if (!v3)
    {
LABEL_29:
      v4 = 0;
      v8 = 0;
      goto LABEL_30;
    }
  }
  v4 = (const void **)EAPSIMAKAInitEncryptedIdentityInfo(18, a1, v2 != 0, (_BYTE *)&v22 + 1, (char *)&v22);
  identity_type = S_get_identity_type(a1);
  v6 = EAPSIMAKAPersistentStateCreate(18, 20, v3, identity_type, 0);
  my_CFRelease((const void **)&v23);
  if (v6)
  {
    v7 = EAPSIMAKAPersistentStateTemporaryUsernameAvailable((uint64_t)v6);
    if (v4 && !EAPSIMAKAPersistentStateTemporaryUsernameAvailable((uint64_t)v6))
    {
      if (*v4)
      {
        LogHandle = EAPLogGetLogHandle();
        v14 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(LogHandle, v14))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_206440000, LogHandle, v14, "EAP-SIM: using out-of-band pseudonym as an identity", buf, 2u);
        }
        v15 = *v4;
      }
      else
      {
        v15 = v4[1];
      }
      v8 = (void *)CFRetain(v15);
      goto LABEL_19;
    }
    v21 = 0;
    v8 = (void *)sim_identity_create((uint64_t)v6, a1, identity_type, 1, &v21, 0);
    if (v21)
    {
      v9 = 1;
      EAPSIMAKAPersistentStateSetReauthIDUsed((uint64_t)v6, 1);
      v10 = EAPLogGetLogHandle();
      v11 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v10, v11))
      {
        SSID = EAPSIMAKAPersistentStateGetSSID((uint64_t)v6);
        *(_DWORD *)buf = 138412546;
        v25 = v8;
        v26 = 2112;
        v27 = SSID;
        _os_log_impl(&dword_206440000, v10, v11, "EAP-SIM is using fast re-auth id %@ for ssid : %@", buf, 0x16u);
      }
    }
    else
    {
      if (!EAPSIMAKAPersistentStateGetReauthIDUsed((uint64_t)v6))
      {
LABEL_19:
        EAPSIMAKAPersistentStateRelease((uint64_t)v6);
        goto LABEL_20;
      }
      EAPSIMAKAPersistentStateSetReauthID((uint64_t)v6, 0);
      EAPSIMAKAPersistentStateSetReauthIDUsed((uint64_t)v6, 0);
      v9 = 0;
    }
    EAPSIMAKAPersistentStateSave((uint64_t)v6, v9);
    goto LABEL_19;
  }
  v7 = 0;
  v8 = 0;
LABEL_20:
  if (HIBYTE(v22) != 1 || v4)
    goto LABEL_30;
  v16 = v22;
  v17 = EAPLogGetLogHandle();
  if (!v7 || v16 != 1)
  {
    v19 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v17, v19))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206440000, v17, v19, "EAP-SIM: failed to get privacy protected identity", buf, 2u);
    }
    goto LABEL_29;
  }
  v18 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v17, v18))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_206440000, v17, v18, "EAP-SIM: out-of-band pseudonym is not required as in-band pseudonym is available", buf, 2u);
  }
  v4 = 0;
LABEL_30:
  EAPSIMAKAClearEncryptedIdentityInfo(v4);
  return v8;
}

CFStringRef eapsim_copy_identity(CFDictionaryRef *a1)
{
  _QWORD *v2;
  const void *v3;
  CFStringRef result;

  v2 = *a1;
  v3 = (const void *)*((_QWORD *)*a1 + 4);
  if (v3)
    CFRelease(v3);
  v2[4] = 0;
  *(_QWORD *)((char *)v2 + 12) = 0xFFFFFFFF00000000;
  if (!v2[35] || EAPSIMAKAPersistentStateTemporaryUsernameAvailable(v2[33]))
    return sim_identity_create(v2[33], a1[10], 13, 1, 0, 0);
  result = *(CFStringRef *)(v2[35] + 8);
  if (result)
    return (CFStringRef)CFRetain(result);
  return result;
}

uint64_t SIMStaticInitFromProperties(const void **a1, const __CFDictionary *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  const __CFArray *v6;
  CFTypeRef v7;
  CFTypeRef v8;
  const __CFArray *v9;
  CFIndex Count;
  uint64_t result;
  const void *Value;
  const void *v13;
  CFTypeID TypeID;
  CFTypeID v15;
  NSObject *LogHandle;
  os_log_type_t v17;
  const void *v18;
  const void *v19;
  uint8_t buf[8];

  my_CFRelease(a1);
  my_CFRelease(a1 + 1);
  my_CFRelease(a1 + 2);
  v4 = a1 + 3;
  my_CFRelease(a1 + 3);
  v5 = a1 + 4;
  my_CFRelease(a1 + 4);
  if (!a2)
    return 0;
  v6 = (const __CFArray *)copy_data_array(a2, CFSTR("EAPSIMKcList"), 8u);
  *(_QWORD *)buf = v6;
  v7 = copy_data_array(a2, CFSTR("EAPSIMSRESList"), 4u);
  v18 = v7;
  v8 = copy_data_array(a2, CFSTR("EAPSIMSRANDList"), 0x10u);
  v19 = v8;
  if (v6)
  {
    if (v7)
    {
      v9 = (const __CFArray *)v8;
      Count = CFArrayGetCount(v6);
      if (Count == CFArrayGetCount((CFArrayRef)v7) && (!v9 || Count == CFArrayGetCount(v9)))
      {
        *a1 = v6;
        a1[1] = v7;
        result = 1;
        a1[2] = v9;
        return result;
      }
    }
  }
  my_CFRelease((const void **)buf);
  my_CFRelease(&v18);
  my_CFRelease(&v19);
  Value = CFDictionaryGetValue(a2, CFSTR("EAPSIMAKAKi"));
  v13 = CFDictionaryGetValue(a2, CFSTR("EAPSIMAKAOPc"));
  TypeID = CFDataGetTypeID();
  if (!Value)
    return 0;
  if (CFGetTypeID(Value) != TypeID)
    return 0;
  v15 = CFDataGetTypeID();
  if (!v13
    || CFGetTypeID(v13) != v15
    || CFDataGetLength((CFDataRef)Value) != 16
    || CFDataGetLength((CFDataRef)v13) != 16)
  {
    return 0;
  }
  LogHandle = EAPLogGetLogHandle();
  v17 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v17))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_206440000, LogHandle, v17, "eapsim: using MILENAGE based soft-sim.", buf, 2u);
  }
  *v4 = Value;
  *v5 = v13;
  CFRetain(Value);
  CFRetain(v13);
  return 1;
}

CFTypeRef copy_static_imsi(const __CFDictionary *a1)
{
  const void *Value;
  CFTypeID TypeID;
  CFTypeID v4;

  if (a1
    && ((Value = CFDictionaryGetValue(a1, CFSTR("EAPSIMIMSI")), TypeID = CFStringGetTypeID(), Value)
     && CFGetTypeID(Value) == TypeID
     || (Value = CFDictionaryGetValue(a1, CFSTR("EAPSIMAKAIMSI")), v4 = CFStringGetTypeID(), Value)
     && CFGetTypeID(Value) == v4))
  {
    return CFRetain(Value);
  }
  else
  {
    return 0;
  }
}

uint64_t S_get_identity_type(const void *a1)
{
  const void *Value;
  CFTypeID TypeID;

  if (!a1)
    return EAPSIMAKAIdentityTypeGetAttributeType(a1);
  Value = CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("EAPSIMAKAIdentityType"));
  TypeID = CFStringGetTypeID();
  if (!Value)
  {
    a1 = 0;
    return EAPSIMAKAIdentityTypeGetAttributeType(a1);
  }
  if (CFGetTypeID(Value) == TypeID)
    return EAPSIMAKAIdentityTypeGetAttributeType(Value);
  else
    return EAPSIMAKAIdentityTypeGetAttributeType(0);
}

uint64_t S_get_plist_int(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t v3;
  const __CFNumber *Value;
  CFTypeID TypeID;
  unsigned int valuePtr;

  v3 = a3;
  valuePtr = a3;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  TypeID = CFNumberGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID)
  {
    if (CFNumberGetValue(Value, kCFNumberIntType, &valuePtr))
      return valuePtr;
    else
      return v3;
  }
  return v3;
}

void EAPSIMContextFree(uint64_t a1)
{
  void *v2;
  const void *v3;

  v2 = *(void **)(a1 + 304);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a1 + 304) = 0;
    *(_DWORD *)(a1 + 312) = 0;
  }
  SIMStaticInitFromProperties((const void **)(a1 + 40), 0);
  EAPSIMAKAPersistentStateRelease(*(_QWORD *)(a1 + 264));
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
  *(_QWORD *)(a1 + 32) = 0;
  EAPSIMAKAClearEncryptedIdentityInfo(*(const void ***)(a1 + 280));
  my_CFRelease((const void **)(a1 + 288));
  bzero((void *)a1, 0x718uLL);
  free((void *)a1);
}

CFTypeRef copy_data_array(const __CFDictionary *a1, const void *a2, unsigned int a3)
{
  const __CFArray *Value;
  CFTypeID TypeID;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  uint64_t v9;
  const void *ValueAtIndex;
  CFTypeID v11;

  Value = (const __CFArray *)CFDictionaryGetValue(a1, a2);
  TypeID = CFArrayGetTypeID();
  if (Value)
  {
    if (CFGetTypeID(Value) == TypeID)
    {
      Count = CFArrayGetCount(Value);
      if (Count)
      {
        v7 = Count;
        if (Count < 1)
          return CFRetain(Value);
        v8 = 0;
        v9 = a3;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(Value, v8);
          v11 = CFDataGetTypeID();
          if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != v11 || CFDataGetLength((CFDataRef)ValueAtIndex) != v9)
            break;
          if (v7 == ++v8)
            return CFRetain(Value);
        }
      }
    }
  }
  return 0;
}

void EAPSIMContextSetVersionList(uint64_t a1, void *__s2, int a3)
{
  int v4;
  size_t v6;
  void *v7;
  void *v8;
  void *v9;

  if (__s2)
  {
    v4 = a3;
    v6 = (2 * a3);
    v7 = *(void **)(a1 + 304);
    if (v7)
    {
      if (*(_DWORD *)(a1 + 312) != a3)
        goto LABEL_6;
      if (!memcmp(v7, __s2, (2 * a3)))
        return;
      v7 = *(void **)(a1 + 304);
      if (v7)
LABEL_6:
        free(v7);
    }
    v8 = malloc_type_malloc(v6, 0xAD6792FuLL);
    *(_QWORD *)(a1 + 304) = v8;
    memmove(v8, __s2, v6);
  }
  else
  {
    v9 = *(void **)(a1 + 304);
    if (!v9)
      return;
    free(v9);
    v4 = 0;
    *(_QWORD *)(a1 + 304) = 0;
  }
  *(_DWORD *)(a1 + 312) = v4;
}

void EAPSIMContextSetLastIdentity(uint64_t a1, CFTypeRef cf)
{
  const void *v4;
  const __CFString *v5;
  void *ExternalRepresentation;
  const __CFString *v7;

  v4 = *(const void **)(a1 + 32);
  if (v4)
    CFRelease(v4);
  *(_QWORD *)(a1 + 32) = 0;
  if (cf)
  {
    if (*(_QWORD *)(a1 + 280)
      && (!EAPSIMAKAPersistentStateTemporaryUsernameAvailable(*(_QWORD *)(a1 + 264)) || *(_BYTE *)(a1 + 28) == 10))
    {
      v5 = **(const __CFString ***)(a1 + 280);
      if (!v5)
      {
        v7 = sim_identity_create(*(_QWORD *)(a1 + 264), *(CFDictionaryRef *)(*(_QWORD *)a1 + 80), 10, 0, 0, 0);
        *(_QWORD *)(a1 + 32) = CFStringCreateExternalRepresentation(0, v7, 0x8000100u, 0);
        my_CFRelease((const void **)&v7);
        return;
      }
      ExternalRepresentation = CFStringCreateExternalRepresentation(0, v5, 0x8000100u, 0);
    }
    else
    {
      ExternalRepresentation = (void *)CFRetain(cf);
    }
    *(_QWORD *)(a1 + 32) = ExternalRepresentation;
  }
}

CFStringRef sim_identity_create(uint64_t a1, CFDictionaryRef theDict, int a3, int a4, _BYTE *a5, _DWORD *a6)
{
  BOOL v11;
  const void *Value;
  CFTypeID TypeID;
  CFTypeID v14;
  const void *v15;
  uint64_t Pseudonym;
  const void *v17;
  uint64_t ReauthID;
  int ReauthIDUsed;
  const void *v20;
  const __CFString *v21;
  CFStringRef v22;
  const void *v23;
  CFTypeID v24;
  int plist_int;
  int v26;
  CFAbsoluteTime Current;
  const __CFDate *v28;
  NSObject *LogHandle;
  os_log_type_t v30;
  uint64_t IMSI;
  CFStringRef v32;
  uint64_t v34;
  const void *v35;
  uint8_t buf[8];
  CFDateRef otherDate;

  if (a5)
    *a5 = 0;
  if (CFDictionaryContainsKey(theDict, CFSTR("EAPSIMAKAIMSI")) | a4)
    v11 = theDict == 0;
  else
    v11 = 1;
  if (v11
    || ((Value = CFDictionaryGetValue(theDict, CFSTR("EAPSIMRealm")), TypeID = CFStringGetTypeID(), !Value)
     || CFGetTypeID(Value) != TypeID)
    && ((Value = CFDictionaryGetValue(theDict, CFSTR("EAPSIMAKARealm")), v14 = CFStringGetTypeID(), !Value)
     || CFGetTypeID(Value) != v14)
    || (v15 = CFRetain(Value), (v35 = v15) == 0))
  {
    v15 = SIMCopyRealm(theDict);
    v35 = v15;
  }
  if (a5)
    *a5 = 0;
  if (!a1)
  {
    v22 = 0;
    goto LABEL_54;
  }
  otherDate = 0;
  Pseudonym = EAPSIMAKAPersistentStateGetPseudonym(a1, &otherDate);
  v17 = (const void *)Pseudonym;
  if (a3 == 17 || a3 == 13)
  {
    ReauthID = EAPSIMAKAPersistentStateGetReauthID(a1);
    ReauthIDUsed = EAPSIMAKAPersistentStateGetReauthIDUsed(a1);
    if (a3 == 13 && ReauthID && !ReauthIDUsed)
    {
      if (a5)
        *a5 = 1;
      v20 = (const void *)ReauthID;
      goto LABEL_24;
    }
    if (v17)
    {
      if (v15)
      {
        v21 = CFStringCreateWithFormat(0, 0, CFSTR("%@@%@"), v17, v15);
LABEL_44:
        v22 = v21;
        if (v21)
          goto LABEL_54;
        goto LABEL_45;
      }
      v20 = v17;
LABEL_24:
      v21 = (const __CFString *)CFRetain(v20);
      goto LABEL_44;
    }
  }
  else
  {
    v23 = 0;
    if (a3 != 10)
      goto LABEL_46;
    if (!Pseudonym)
      goto LABEL_46;
    v23 = CFDictionaryGetValue(theDict, CFSTR("EAPSIMAKAConservativePeer"));
    v24 = CFBooleanGetTypeID();
    if (!v23)
      goto LABEL_46;
    if (CFGetTypeID(v23) == v24 && CFBooleanGetValue((CFBooleanRef)v23))
    {
      plist_int = S_get_plist_int(theDict, CFSTR("EAPSIMAKAPseudonymIdentityLifetimeHours"), 24);
      v26 = plist_int <= 24 ? 24 : plist_int;
      if (otherDate)
      {
        Current = CFAbsoluteTimeGetCurrent();
        v28 = CFDateCreate(0, Current);
        v23 = v28;
        if (v28 && CFDateGetTimeIntervalSinceDate(v28, otherDate) < (double)(3600 * v26))
        {
          LogHandle = EAPLogGetLogHandle();
          v30 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v30))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_206440000, LogHandle, v30, "EAP Peer is in conservative mode and pseudonym is not expired yet.", buf, 2u);
          }
          v22 = 0;
          if (a6)
            *a6 = 17;
          goto LABEL_53;
        }
        goto LABEL_46;
      }
    }
  }
LABEL_45:
  v23 = 0;
LABEL_46:
  IMSI = EAPSIMAKAPersistentStateGetIMSI(a1);
  if (v15)
    v32 = CFStringCreateWithFormat(0, 0, CFSTR("1%@@%@"), IMSI, v15);
  else
    v32 = CFStringCreateWithFormat(0, 0, CFSTR("1%@"), IMSI, v34);
  v22 = v32;
  if (a6 && !v32)
    *a6 = 16;
  if (v23)
LABEL_53:
    CFRelease(v23);
LABEL_54:
  my_CFRelease(&v35);
  return v22;
}

uint64_t eapsim_request(uint64_t a1, unsigned __int8 *a2, int *a3, _DWORD *a4)
{
  unsigned int Length;
  size_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  size_t v13;
  NSObject *LogHandle;
  os_log_type_t v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  uint64_t client_error;
  int v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  NSObject *v27;
  os_log_type_t v28;
  char *String;
  uint8_t buf[4];
  _DWORD v31[7];

  *(_QWORD *)&v31[5] = *MEMORY[0x24BDAC8D0];
  Length = EAPPacketGetLength((uint64_t)a2);
  TLVListSizeof();
  MEMORY[0x24BDAC7A8]();
  v11 = &buf[-v10];
  if ((v12 & 0x7FFFFFE00) != 0)
    v13 = 512;
  else
    v13 = v9;
  bzero(&buf[-v10], v13);
  TLVListInit(v11);
  if (Length <= 8)
  {
    LogHandle = EAPLogGetLogHandle();
    v15 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v15))
    {
      *(_DWORD *)buf = 67109376;
      v31[0] = Length;
      LOWORD(v31[1]) = 2048;
      *(_QWORD *)((char *)&v31[1] + 2) = 8;
      v16 = "length %d <= %ld";
      v17 = LogHandle;
      v18 = v15;
      v19 = 18;
LABEL_15:
      _os_log_impl(&dword_206440000, v17, v18, v16, buf, v19);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!TLVListParse_0((uint64_t)v11, a2 + 8, Length - 8))
  {
    v23 = EAPLogGetLogHandle();
    v24 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = TLVListErrorString((uint64_t)v11);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v31 = v25;
      v16 = "parse failed: %s";
      v17 = v23;
      v18 = v24;
      v19 = 12;
      goto LABEL_15;
    }
LABEL_16:
    client_error = 0;
    *a3 = 17;
    goto LABEL_21;
  }
  if (*(_DWORD *)(a1 + 12) && *(_DWORD *)(a1 + 16) == a2[1])
    return a1 + 316;
  v21 = a2[5];
  switch(a2[5])
  {
    case 0xAu:
      v22 = eapsim_start(a1, (uint64_t)a2, (unsigned __int8 ***)v11, a3);
      goto LABEL_20;
    case 0xBu:
      v22 = (uint64_t)eapsim_challenge(a1, (uint64_t)a2, (unsigned __int8 ***)v11, a3);
      goto LABEL_20;
    case 0xCu:
      v22 = (uint64_t)eapsim_notification(a1, a2, (unsigned __int8 ***)v11, a3, a4);
      goto LABEL_20;
    case 0xDu:
      v22 = (uint64_t)eapsim_reauthentication(a1, a2, (unsigned __int8 ***)v11, a3);
LABEL_20:
      client_error = v22;
      break;
    default:
      *a3 = 17;
      v27 = EAPLogGetLogHandle();
      v28 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v27, v28))
      {
        String = EAPSIMAKAPacketSubtypeGetString(v21);
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v31 = String;
        _os_log_impl(&dword_206440000, v27, v28, "unexpected Subtype %s", buf, 0xCu);
      }
      client_error = 0;
      *a3 = 17;
      break;
  }
LABEL_21:
  TLVListFree((uint64_t)v11);
  if (*a3)
    *(_QWORD *)(a1 + 8) = 0x500000002;
  if (!client_error)
  {
    if (*a3 != 17)
      return 0;
    client_error = eapsim_make_client_error(a1, (uint64_t)a2, 0);
    if (!client_error)
      return client_error;
  }
  *(_DWORD *)(a1 + 16) = a2[1];
  return client_error;
}

uint64_t eapsim_start(uint64_t a1, uint64_t a2, unsigned __int8 ***a3, int *a4)
{
  size_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  size_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  int v17;
  _WORD *v18;
  uint64_t response;
  NSObject *LogHandle;
  os_log_type_t v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint32_t v25;
  int v26;
  void *v28;
  int v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  int v33;
  int v34;
  int v35;
  NSObject *v36;
  os_log_type_t v37;
  int v38;
  int v39;
  NSObject *v40;
  os_log_type_t v41;
  const char *String;
  int v43;
  const void *v44;
  CFTypeID TypeID;
  const void *ExternalRepresentation;
  uint64_t *v47;
  _BOOL4 v48;
  uint64_t *v49;
  uint64_t v50;
  const char *v51;
  int v52;
  NSObject *v53;
  os_log_type_t v54;
  NSObject *v55;
  os_log_type_t v56;
  const __CFString *v57;
  NSObject *v58;
  os_log_type_t v59;
  const char *v60;
  const char *v61;
  int v62;
  uint8_t *v63;
  NSObject *v64;
  os_log_type_t v65;
  uint32_t v66;
  const UInt8 *BytePtr;
  signed int Length;
  _BYTE *TLV;
  _BYTE *v70;
  __int16 v71;
  NSObject *v72;
  os_log_type_t v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint64_t v77;
  NSObject *v78;
  os_log_type_t v79;
  uint64_t v80;
  _WORD v81[3];
  char v82;
  const void *v83;
  _BYTE buf[14];
  int v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  TLVBufferSizeof();
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)v81 - v9;
  if ((v11 & 0x7FFFFFE00) != 0)
    v12 = 512;
  else
    v12 = v8;
  bzero((char *)v81 - v9, v12);
  v83 = 0;
  v13 = TLVListLookupAttribute(a3, 15);
  if (!v13)
  {
    LogHandle = EAPLogGetLogHandle();
    v21 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v21))
    {
LABEL_16:
      response = 0;
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v22 = "eapsim: Start is missing AT_VERSION_LIST";
    v23 = LogHandle;
    v24 = v21;
    v25 = 2;
    goto LABEL_15;
  }
  v14 = bswap32(*(unsigned __int16 *)(v13 + 2));
  v15 = HIWORD(v14);
  if (HIWORD(v14) >= 2u)
  {
    v16 = v14 >> 17;
    if (v14 >> 17 <= 1)
      v17 = 1;
    else
      v17 = v14 >> 17;
    v18 = (_WORD *)(v13 + 4);
    while (*v18 != 256)
    {
      ++v18;
      if (!--v17)
        goto LABEL_12;
    }
    if (v15 < 4)
    {
      v28 = *(void **)(a1 + 304);
      if (v28)
      {
        free(v28);
        *(_QWORD *)(a1 + 304) = 0;
        *(_DWORD *)(a1 + 312) = 0;
      }
    }
    else
    {
      EAPSIMContextSetVersionList(a1, (void *)(v13 + 4), v16);
    }
    if (*(_DWORD *)(a1 + 12) == 1)
    {
      v29 = *(_DWORD *)(a1 + 20);
      if (v29)
      {
LABEL_31:
        *(_DWORD *)(a1 + 20) = v29 + 1;
        if (v29 >= 3)
        {
          v31 = EAPLogGetLogHandle();
          v32 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v31, v32))
            goto LABEL_16;
          v33 = *(_DWORD *)(a1 + 20);
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&buf[4] = v33;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = 3;
          v22 = "eapsim: too many Start packets (%d > %d)";
          v23 = v31;
          v24 = v32;
          v25 = 14;
          goto LABEL_15;
        }
        v34 = TLVListLookupIdentityAttribute((int *)a3);
        v35 = v34;
        switch(v34)
        {
          case 10:
            if (*(int *)(a1 + 20) < 2)
              goto LABEL_47;
            v39 = *(unsigned __int8 *)(a1 + 28);
            if (v39 == 13 || v39 == 17)
              goto LABEL_47;
            v40 = EAPLogGetLogHandle();
            v41 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v40, v41))
              goto LABEL_16;
            String = EAPSIMAKAAttributeTypeGetString(*(unsigned __int8 *)(a1 + 28));
            v43 = *(_DWORD *)(a1 + 20);
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = String;
            *(_WORD *)&buf[12] = 1024;
            v85 = v43;
            v22 = "eapsim: AT_PERMANENT_ID_REQ follows %s at Start #%d";
            break;
          case 17:
            if (*(int *)(a1 + 20) < 2 || *(_BYTE *)(a1 + 28) == 13)
              goto LABEL_47;
            v40 = EAPLogGetLogHandle();
            v41 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v40, v41))
              goto LABEL_16;
            v61 = EAPSIMAKAAttributeTypeGetString(*(unsigned __int8 *)(a1 + 28));
            v62 = *(_DWORD *)(a1 + 20);
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = v61;
            *(_WORD *)&buf[12] = 1024;
            v85 = v62;
            v22 = "eapsim: AT_FULLAUTH_ID_REQ follows %s at Start #%d";
            break;
          case 13:
            if (*(int *)(a1 + 20) >= 2)
            {
              v36 = EAPLogGetLogHandle();
              v37 = _SC_syslog_os_log_mapping();
              if (!os_log_type_enabled(v36, v37))
                goto LABEL_16;
              v38 = *(_DWORD *)(a1 + 20);
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v38;
              v22 = "eapsim: AT_ANY_ID_REQ at Start #%d";
              v23 = v36;
              v24 = v37;
              v25 = 8;
              goto LABEL_15;
            }
LABEL_47:
            *(_BYTE *)(a1 + 296) = 0;
            *(_BYTE *)(a1 + 28) = v34;
            response = eapsim_make_response(a1, a2, 10, (uint64_t)v10);
            v82 = 0;
            v44 = *(const void **)(*(_QWORD *)a1 + 56);
            TypeID = CFDataGetTypeID();
            if (v44 && CFGetTypeID(v44) == TypeID && CFDataGetLength(*(CFDataRef *)(*(_QWORD *)a1 + 56)) >= 1)
            {
              ExternalRepresentation = CFRetain(*(CFTypeRef *)(*(_QWORD *)a1 + 56));
              v83 = ExternalRepresentation;
LABEL_86:
              BytePtr = CFDataGetBytePtr((CFDataRef)ExternalRepresentation);
              Length = CFDataGetLength((CFDataRef)ExternalRepresentation);
              if (!TLVBufferAddIdentity((uint64_t)v10, BytePtr, Length))
              {
                v72 = EAPLogGetLogHandle();
                v73 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v72, v73))
                {
                  v74 = TLVBufferErrorString((uint64_t)v10);
                  *(_DWORD *)buf = 136315138;
                  *(_QWORD *)&buf[4] = v74;
                  _os_log_impl(&dword_206440000, v72, v73, "eapsim: can't add AT_IDENTITY, %s", buf, 0xCu);
                }
                *a4 = 8;
                goto LABEL_101;
              }
              if (v82)
              {
LABEL_91:
                v71 = TLVBufferUsed((uint64_t)v10);
                EAPPacketSetLength(response, (unsigned __int16)(v71 + 8));
                goto LABEL_19;
              }
LABEL_88:
              *(_BYTE *)(a1 + 240) = 0;
              TLV = TLVBufferAllocateTLV((uint64_t)v10, 16, 4);
              if (!TLV)
              {
                v75 = EAPLogGetLogHandle();
                v76 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v75, v76))
                {
                  v77 = TLVBufferErrorString((uint64_t)v10);
                  *(_DWORD *)buf = 136315138;
                  *(_QWORD *)&buf[4] = v77;
                  _os_log_impl(&dword_206440000, v75, v76, "eapsim: failed allocating AT_SELECTED_VERSION, %s", buf, 0xCu);
                }
                response = 0;
                v26 = 8;
                goto LABEL_18;
              }
              *((_WORD *)TLV + 1) = 256;
              v70 = TLVBufferAllocateTLV((uint64_t)v10, 7, 20);
              if (v70)
              {
                *((_WORD *)v70 + 1) = 0;
                *(_OWORD *)(v70 + 4) = *(_OWORD *)(a1 + 241);
                goto LABEL_91;
              }
              v78 = EAPLogGetLogHandle();
              v79 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v78, v79))
              {
                v80 = TLVBufferErrorString((uint64_t)v10);
                *(_DWORD *)buf = 136315138;
                *(_QWORD *)&buf[4] = v80;
                v60 = "eapsim: failed allocating AT_NONCE_MT, %s";
                v63 = buf;
                v64 = v78;
                v65 = v79;
                v66 = 12;
                goto LABEL_100;
              }
LABEL_101:
              response = 0;
              goto LABEL_19;
            }
            v47 = *(uint64_t **)(a1 + 280);
            if (v47)
            {
              if (!v47[2])
              {
                v50 = *v47;
                if (v35 == 10 && v50)
                {
                  *a4 = 17;
                  if (EAPSIMAKAPersistentStateTemporaryUsernameAvailable(*(_QWORD *)(a1 + 264)))
                  {
                    v53 = EAPLogGetLogHandle();
                    v54 = _SC_syslog_os_log_mapping();
                    if (os_log_type_enabled(v53, v54))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_206440000, v53, v54, "eapsim: purging all the temporary identities", buf, 2u);
                    }
                    EAPSIMAKAPersistentStatePurgeTemporaryIDs(*(_QWORD *)(a1 + 264));
                  }
                  v55 = EAPLogGetLogHandle();
                  v56 = _SC_syslog_os_log_mapping();
                  if (os_log_type_enabled(v55, v56))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_206440000, v55, v56, "eapsim: requesting out-of-band psuedonym", buf, 2u);
                  }
                  SIMReportDecryptionError(0);
                  goto LABEL_101;
                }
LABEL_70:
                if (v50 && !EAPSIMAKAPersistentStateTemporaryUsernameAvailable(*(_QWORD *)(a1 + 264)))
                {
                  ExternalRepresentation = CFStringCreateExternalRepresentation(0, **(CFStringRef **)(a1 + 280), 0x8000100u, 0);
                  v83 = ExternalRepresentation;
                  EAPSIMContextSetLastIdentity(a1, ExternalRepresentation);
                  *(_BYTE *)(a1 + 296) = 1;
                  goto LABEL_86;
                }
                goto LABEL_72;
              }
              v48 = EAPSIMAKAPersistentStateTemporaryUsernameAvailable(*(_QWORD *)(a1 + 264));
              v49 = *(uint64_t **)(a1 + 280);
              if (v35 == 10 || !v48)
              {
                ExternalRepresentation = CFRetain((CFTypeRef)v49[2]);
                v83 = ExternalRepresentation;
                EAPSIMContextSetLastIdentity(a1, ExternalRepresentation);
                goto LABEL_86;
              }
              if (v49)
              {
                v50 = *v49;
                goto LABEL_70;
              }
            }
LABEL_72:
            v57 = sim_identity_create(*(_QWORD *)(a1 + 264), *(CFDictionaryRef *)(*(_QWORD *)a1 + 80), v35, 0, &v82, a4);
            *(_QWORD *)buf = v57;
            if (!v57)
            {
              if (*a4 == 17)
              {
                v58 = EAPLogGetLogHandle();
                v59 = _SC_syslog_os_log_mapping();
                if (!os_log_type_enabled(v58, v59))
                  goto LABEL_101;
                v81[0] = 0;
                v60 = "eapsim: protocol error.";
              }
              else
              {
                if (*a4 != 16)
                  goto LABEL_101;
                v58 = EAPLogGetLogHandle();
                v59 = _SC_syslog_os_log_mapping();
                if (!os_log_type_enabled(v58, v59))
                  goto LABEL_101;
                v81[0] = 0;
                v60 = "eapsim: can't find SIM identity";
              }
              v63 = (uint8_t *)v81;
              v64 = v58;
              v65 = v59;
              v66 = 2;
LABEL_100:
              _os_log_impl(&dword_206440000, v64, v65, v60, v63, v66);
              goto LABEL_101;
            }
            ExternalRepresentation = CFStringCreateExternalRepresentation(0, v57, 0x8000100u, 0);
            v83 = ExternalRepresentation;
            EAPSIMContextSetLastIdentity(a1, ExternalRepresentation);
            my_CFRelease((const void **)buf);
            goto LABEL_86;
          default:
            if (*(int *)(a1 + 20) < 2)
            {
              *(_BYTE *)(a1 + 296) = 0;
              *(_BYTE *)(a1 + 28) = v34;
              response = eapsim_make_response(a1, a2, 10, (uint64_t)v10);
              goto LABEL_88;
            }
            v40 = EAPLogGetLogHandle();
            v41 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v40, v41))
              goto LABEL_16;
            v51 = EAPSIMAKAAttributeTypeGetString(*(unsigned __int8 *)(a1 + 28));
            v52 = *(_DWORD *)(a1 + 20);
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = v51;
            *(_WORD *)&buf[12] = 1024;
            v85 = v52;
            v22 = "eapsim: no *ID_REQ follows %s at Start #%d";
            break;
        }
        v23 = v40;
        v24 = v41;
        v25 = 18;
LABEL_15:
        _os_log_impl(&dword_206440000, v23, v24, v22, buf, v25);
        goto LABEL_16;
      }
    }
    else
    {
      *(_DWORD *)(a1 + 20) = 0;
      *(_BYTE *)(a1 + 28) = 0;
      *(_QWORD *)(a1 + 8) = 0x100000000;
    }
    v30 = 0;
    do
    {
      *(_DWORD *)(a1 + 241 + v30) = arc4random();
      v30 += 4;
    }
    while ((_DWORD)v30 != 16);
    v29 = *(_DWORD *)(a1 + 20);
    goto LABEL_31;
  }
LABEL_12:
  response = eapsim_make_client_error(a1, a2, 1u);
LABEL_17:
  v26 = 17;
LABEL_18:
  *a4 = v26;
LABEL_19:
  my_CFRelease(&v83);
  return response;
}

const void *eapsim_challenge(uint64_t a1, uint64_t a2, unsigned __int8 ***a3, int *a4)
{
  size_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  size_t v12;
  uint64_t v13;
  unint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  int v17;
  const void *client_error;
  NSObject *LogHandle;
  os_log_type_t v20;
  const char *v21;
  uint8_t *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint32_t v25;
  int v26;
  NSObject *v28;
  os_log_type_t v29;
  int8x16_t *v30;
  int v31;
  int v32;
  BOOL v33;
  int v34;
  _QWORD *v35;
  _QWORD *v36;
  int v37;
  _QWORD *v38;
  uint64_t v40;
  int v41;
  uint8_t *v42;
  uint8_t *v43;
  const __CFArray *v44;
  CFIndex Count;
  CFIndex v46;
  CFIndex v47;
  const __CFData *ValueAtIndex;
  const UInt8 *BytePtr;
  const __CFData *v51;
  const __CFData *v52;
  const UInt8 *v53;
  uint8_t *v54;
  uint8_t *v55;
  int8x8_t *v56;
  int v57;
  int8x16_t *v58;
  UInt8 *v59;
  NSObject *v60;
  os_log_type_t v61;
  const char *v62;
  const __CFData *v63;
  const UInt8 *v64;
  CC_LONG Length;
  const UInt8 *v66;
  const void *v67;
  __int16 *p_data;
  CC_LONG v69;
  unsigned __int8 *MasterKey;
  __int128 *v71;
  uint64_t v72;
  _BYTE *TLV;
  _BYTE *v74;
  __int16 v75;
  NSObject *v76;
  os_log_type_t v77;
  int v78;
  NSObject *v79;
  os_log_type_t v80;
  uint64_t v81;
  uint64_t v82;
  const void *v83;
  uint8_t *v84;
  uint64_t *v85;
  CC_SHA1_CTX c;
  __int16 data;
  uint8_t v88[4];
  uint64_t v89;
  uint8_t v90[12];
  uint8_t buf[4];
  int v92;
  __int16 v93;
  int v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  data = 256;
  memset(&c, 0, sizeof(c));
  TLVBufferSizeof();
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v82 - v9;
  if ((v11 & 0x7FFFFFE00) != 0)
    v12 = 512;
  else
    v12 = v8;
  bzero((char *)&v82 - v9, v12);
  if (*(_DWORD *)(a1 + 12) != 1)
  {
    LogHandle = EAPLogGetLogHandle();
    v20 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v20))
    {
      *(_WORD *)buf = 0;
      v21 = "eapsim: Challenge sent without Start";
LABEL_14:
      v22 = buf;
LABEL_15:
      v23 = LogHandle;
      v24 = v20;
      v25 = 2;
LABEL_16:
      _os_log_impl(&dword_206440000, v23, v24, v21, v22, v25);
    }
LABEL_17:
    client_error = 0;
LABEL_18:
    v26 = 17;
    goto LABEL_19;
  }
  *(_DWORD *)(a1 + 12) = 2;
  EAPSIMAKAPersistentStateSetCounter(*(_QWORD *)(a1 + 264), 1);
  EAPSIMAKAPersistentStateSetReauthID(*(_QWORD *)(a1 + 264), 0);
  *(_BYTE *)(a1 + 272) = 0;
  v13 = TLVListLookupAttribute(a3, 1);
  if (!v13)
  {
    LogHandle = EAPLogGetLogHandle();
    v20 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v20))
    {
      *(_WORD *)buf = 0;
      v21 = "eapsim: Challenge is missing AT_RAND";
      goto LABEL_14;
    }
    goto LABEL_17;
  }
  v14 = (4 * (unint64_t)*(unsigned __int8 *)(v13 + 1) + 0xFFFFFFFFCLL) >> 4;
  if (*(_DWORD *)(a1 + 24) > (int)v14)
  {
    v15 = EAPLogGetLogHandle();
    v16 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = *(_DWORD *)(a1 + 24);
      *(_DWORD *)buf = 67109376;
      v92 = v14;
      v93 = 1024;
      v94 = v17;
      _os_log_impl(&dword_206440000, v15, v16, "eapsim: Challenge AT_RAND has %d RANDs, policy requires %d", buf, 0xEu);
    }
    client_error = (const void *)eapsim_make_client_error(a1, a2, 2u);
    goto LABEL_18;
  }
  if ((int)v14 >= 4)
  {
    v28 = EAPLogGetLogHandle();
    v29 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v28, v29))
      goto LABEL_17;
    *(_DWORD *)buf = 67109376;
    v92 = v14;
    v93 = 1024;
    v94 = 3;
    v21 = "eapsim: Challenge AT_RAND has %d RANDs > %d";
    v22 = buf;
    v23 = v28;
    v24 = v29;
    v25 = 14;
    goto LABEL_16;
  }
  v30 = (int8x16_t *)(v13 + 4);
  if ((int)v14 >= 2)
  {
    v31 = 0;
    v32 = v14 - 1;
    v33 = 1;
    v34 = v14 - 1;
    v35 = (_QWORD *)(v13 + 4);
    while (1)
    {
      v36 = v35;
      v35 += 2;
      if (++v31 < (int)v14)
        break;
LABEL_33:
      --v34;
      v33 = v31 < v32;
      if (v31 == v32)
        goto LABEL_34;
    }
    v37 = v34;
    v38 = v35;
    while (*v36 != *v38 || v36[1] != v38[1])
    {
      v38 += 2;
      if (!--v37)
        goto LABEL_33;
    }
LABEL_34:
    if (v33)
    {
      LogHandle = EAPLogGetLogHandle();
      v20 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v20))
        goto LABEL_17;
      *(_WORD *)buf = 0;
      v21 = "eapsim: Challenge AT_RAND has duplicate RANDs";
      goto LABEL_14;
    }
  }
  v40 = *(_QWORD *)(a1 + 40);
  v85 = &v82;
  v83 = (const void *)a2;
  if (v40)
  {
    if ((int)v14 >= 1)
    {
      v41 = 0;
      v42 = v90;
      v43 = buf;
      do
      {
        v84 = v42;
        v44 = *(const __CFArray **)(a1 + 56);
        if (v44)
        {
          Count = CFArrayGetCount(v44);
          if (Count < 1)
            goto LABEL_59;
          v46 = Count;
          v47 = 0;
          while (1)
          {
            ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), v47);
            BytePtr = CFDataGetBytePtr(ValueAtIndex);
            if (v30->i64[0] == *(_QWORD *)BytePtr && v30->i64[1] == *((_QWORD *)BytePtr + 1))
              break;
            if (v46 == ++v47)
              goto LABEL_59;
          }
          if ((_DWORD)v47 == -1)
          {
LABEL_59:
            v60 = EAPLogGetLogHandle();
            v61 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v60, v61))
            {
              *(_WORD *)v88 = 0;
              v62 = "eapsim: can't find static RAND value";
              goto LABEL_80;
            }
            goto LABEL_81;
          }
        }
        else
        {
          LODWORD(v47) = 0;
        }
        v51 = (const __CFData *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 40), (int)v47);
        *(_QWORD *)v43 = *(_QWORD *)CFDataGetBytePtr(v51);
        v43 += 8;
        v52 = (const __CFData *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 48), (int)v47);
        v53 = CFDataGetBytePtr(v52);
        v54 = v84;
        *(_DWORD *)v84 = *(_DWORD *)v53;
        v42 = v54 + 4;
        ++v30;
        ++v41;
      }
      while (v41 != (_DWORD)v14);
    }
  }
  else if (*(_QWORD *)(a1 + 64) && *(_QWORD *)(a1 + 72))
  {
    if ((int)v14 >= 1)
    {
      v55 = v90;
      v56 = (int8x8_t *)buf;
      v57 = v14;
      do
      {
        v58 = (int8x16_t *)CFDataGetBytePtr(*(CFDataRef *)(a1 + 72));
        v59 = (UInt8 *)CFDataGetBytePtr(*(CFDataRef *)(a1 + 64));
        sim_simulator_gsm_milenage_algo(v58, v59, v30, v55, v56++);
        v55 += 4;
        ++v30;
        --v57;
      }
      while (v57);
    }
  }
  else if ((SIMAuthenticateGSM(*(const __CFDictionary **)(*(_QWORD *)a1 + 80), (uint64_t)v30, v14, (uint64_t)buf, (uint64_t)v90) & 1) == 0)
  {
    v60 = EAPLogGetLogHandle();
    v61 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v60, v61))
    {
      *(_WORD *)v88 = 0;
      v62 = "SIMAuthenticateGSM failed";
LABEL_80:
      _os_log_impl(&dword_206440000, v60, v61, v62, v88, 2u);
    }
LABEL_81:
    client_error = 0;
    v78 = 8;
    goto LABEL_82;
  }
  CC_SHA1_Init(&c);
  v63 = *(const __CFData **)(a1 + 32);
  if (v63)
  {
    v64 = CFDataGetBytePtr(v63);
    Length = CFDataGetLength(*(CFDataRef *)(a1 + 32));
    v66 = v64;
  }
  else
  {
    v66 = *(const UInt8 **)(*(_QWORD *)a1 + 40);
    Length = *(_DWORD *)(*(_QWORD *)a1 + 48);
  }
  CC_SHA1_Update(&c, v66, Length);
  v67 = v83;
  CC_SHA1_Update(&c, buf, 8 * v14);
  CC_SHA1_Update(&c, (const void *)(a1 + 241), 0x10u);
  p_data = *(__int16 **)(a1 + 304);
  if (p_data)
  {
    v69 = 2 * *(_DWORD *)(a1 + 312);
  }
  else
  {
    p_data = &data;
    v69 = 2;
  }
  CC_SHA1_Update(&c, p_data, v69);
  CC_SHA1_Update(&c, &data, 2u);
  MasterKey = (unsigned __int8 *)EAPSIMAKAPersistentStateGetMasterKey(*(_QWORD *)(a1 + 264));
  CC_SHA1_Final(MasterKey, &c);
  v71 = (__int128 *)EAPSIMAKAPersistentStateGetMasterKey(*(_QWORD *)(a1 + 264));
  fips186_2prf(v71, a1 + 80);
  v72 = TLVListLookupAttribute(a3, 11);
  if (!v72)
  {
    v76 = EAPLogGetLogHandle();
    v77 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v76, v77))
    {
      *(_WORD *)v88 = 0;
      _os_log_impl(&dword_206440000, v76, v77, "eapsim: Challenge is missing AT_MAC", v88, 2u);
    }
    client_error = 0;
    v78 = 17;
LABEL_82:
    *a4 = v78;
    return client_error;
  }
  if (!EAPSIMAKAKeyInfoVerifyMAC(a1 + 80, v67, v72 + 4, (const void *)(a1 + 241), 16))
  {
    LogHandle = EAPLogGetLogHandle();
    v20 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v20))
      goto LABEL_17;
    *(_WORD *)v88 = 0;
    v21 = "eapsim: Challenge AT_MAC not valid";
    v22 = v88;
    goto LABEL_15;
  }
  if (!eapsim_challenge_process_encr_data(a1, a3))
    goto LABEL_17;
  client_error = (const void *)eapsim_make_response(a1, (uint64_t)v67, 11, (uint64_t)v10);
  TLV = TLVBufferAllocateTLV((uint64_t)v10, 11, 20);
  if (TLV)
  {
    v74 = TLV;
    *((_WORD *)TLV + 1) = 0;
    v75 = TLVBufferUsed((uint64_t)v10);
    EAPPacketSetLength((uint64_t)client_error, (unsigned __int16)(v75 + 8));
    EAPSIMAKAKeyInfoSetMAC(a1 + 80, client_error, v74 + 4, v90, 4 * v14);
    *(_DWORD *)(a1 + 12) = 4;
    *(_BYTE *)(a1 + 240) = 1;
    return client_error;
  }
  v79 = EAPLogGetLogHandle();
  v80 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v79, v80))
  {
    v81 = TLVBufferErrorString((uint64_t)v10);
    *(_DWORD *)v88 = 136315138;
    v89 = v81;
    _os_log_impl(&dword_206440000, v79, v80, "eapsim: failed allocating AT_MAC, %s", v88, 0xCu);
  }
  client_error = 0;
  v26 = 8;
LABEL_19:
  *a4 = v26;
  return client_error;
}

const void *eapsim_notification(uint64_t a1, const void *a2, unsigned __int8 ***a3, int *a4, _DWORD *a5)
{
  size_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  size_t v14;
  uint64_t v15;
  unsigned int v16;
  NSObject *v17;
  os_log_type_t v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint32_t v22;
  NSObject *LogHandle;
  os_log_type_t v24;
  uint64_t v25;
  unsigned int Counter;
  size_t v27;
  uint64_t v28;
  unsigned __int8 ***v29;
  uint64_t v30;
  size_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  const void *response;
  int v42;
  _BYTE *TLV;
  __int16 v45;
  const char *String;
  NSObject *v47;
  os_log_type_t v48;
  _BOOL4 v49;
  const char *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint32_t v53;
  NSObject *v54;
  os_log_type_t v55;
  const char *v56;
  NSObject *v57;
  os_log_type_t v58;
  uint32_t v59;
  int v60;
  NSObject *v61;
  os_log_type_t v62;
  uint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  const __CFDictionary *v66;
  const __CFDictionary *v67;
  NSObject *v68;
  os_log_type_t v69;
  uint64_t v70;
  uint64_t v71;
  unsigned int v72;
  size_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  size_t v77;
  NSObject *v78;
  os_log_type_t v79;
  NSObject *v80;
  os_log_type_t v81;
  NSObject *v82;
  os_log_type_t v83;
  uint64_t v84;
  int v85;
  uint64_t v86;
  const void *v87;
  void *v88;
  __CFString *v89;
  unsigned int v90;
  uint64_t *v91;
  uint8_t v92[4];
  uint64_t v93;
  uint8_t buf[4];
  _BYTE v95[10];
  uint64_t v96;
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  TLVBufferSizeof();
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v86 - v11;
  if ((v13 & 0x7FFFFFE00) != 0)
    v14 = 512;
  else
    v14 = v10;
  bzero((char *)&v86 - v11, v14);
  *a4 = 0;
  *a5 = 0;
  v15 = TLVListLookupAttribute(a3, 12);
  if (!v15)
  {
    LogHandle = EAPLogGetLogHandle();
    v24 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v24))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v19 = "eapsim: Notification does not contain AT_NOTIFICATION attribute";
LABEL_32:
    v20 = LogHandle;
    v21 = v24;
    v22 = 2;
    goto LABEL_33;
  }
  v16 = bswap32(*(unsigned __int16 *)(v15 + 2)) >> 16;
  if (v16 >= 0xC000)
  {
    v17 = EAPLogGetLogHandle();
    v18 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v95 = v16;
      v19 = "eapsim: Notification code '%d' indicates success before authentication";
      v20 = v17;
      v21 = v18;
      v22 = 8;
LABEL_33:
      _os_log_impl(&dword_206440000, v20, v21, v19, buf, v22);
    }
LABEL_34:
    response = 0;
    v42 = 17;
LABEL_35:
    *a4 = v42;
    return response;
  }
  v25 = TLVListLookupAttribute(a3, 11);
  if (v25)
  {
    if ((v16 & 0x4000) != 0)
    {
      LogHandle = EAPLogGetLogHandle();
      v24 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v24))
        goto LABEL_34;
      *(_WORD *)buf = 0;
      v19 = "eapsim: Notification incorrectly contains AT_MAC";
      goto LABEL_32;
    }
    if (!EAPSIMAKAKeyInfoVerifyMAC(a1 + 80, a2, v25 + 4, 0, 0))
    {
      LogHandle = EAPLogGetLogHandle();
      v24 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v24))
        goto LABEL_34;
      *(_WORD *)buf = 0;
      v19 = "eapsim: Notification AT_MAC not valid";
      goto LABEL_32;
    }
  }
  else if ((v16 & 0x4000) == 0)
  {
    LogHandle = EAPLogGetLogHandle();
    v24 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v24))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v19 = "eapsim: Notification is missing AT_MAC";
    goto LABEL_32;
  }
  Counter = EAPSIMAKAPersistentStateGetCounter(*(_QWORD *)(a1 + 264));
  if ((v16 & 0x4000) == 0 && *(_BYTE *)(a1 + 272))
  {
    v90 = Counter;
    TLVListSizeof();
    v91 = &v86;
    MEMORY[0x24BDAC7A8]();
    v29 = (unsigned __int8 ***)((char *)&v86 - v28);
    if ((v30 & 0x7FFFFFE00) != 0)
      v31 = 512;
    else
      v31 = v27;
    bzero((char *)&v86 - v28, v31);
    v32 = TLVListLookupAttribute(a3, 130);
    v33 = TLVListLookupAttribute(a3, 129);
    v34 = v33;
    if (v32 && v33)
    {
      TLVListInit(v29);
      v87 = (const void *)(a1 + 80);
      v35 = EAPSIMAKAKeyInfoDecryptTLVList((const void *)(a1 + 80), v32, v34, (uint64_t)v29);
      if (!v35)
      {
        v64 = EAPLogGetLogHandle();
        v65 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v64, v65))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_206440000, v64, v65, "eapsim: failed to decrypt Notification AT_ENCR_DATA", buf, 2u);
        }
        v60 = 8;
        goto LABEL_57;
      }
      v88 = v35;
      v89 = TLVListCopyDescription(v29);
      v36 = EAPLogGetLogHandle();
      v37 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v36, v37))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v95 = v89;
        _os_log_impl(&dword_206440000, v36, v37, "Decrypted TLVs:\n%@", buf, 0xCu);
      }
      CFRelease(v89);
      v38 = TLVListLookupAttribute(v29, 19);
      v39 = v38;
      if (v38)
        v40 = bswap32(*(unsigned __int16 *)(v38 + 2)) >> 16;
      else
        v40 = 0;
      free(v88);
      TLVListFree((uint64_t)v29);
      if (v39)
      {
        v72 = v90;
        if (v40 == v90)
        {
          response = (const void *)eapsim_make_response(a1, (uint64_t)a2, 12, (uint64_t)v12);
          TLVBufferSizeof();
          MEMORY[0x24BDAC7A8]();
          v75 = (char *)&v86 - v74;
          if ((v76 & 0x7FFFFFE00) != 0)
            v77 = 512;
          else
            v77 = v73;
          bzero((char *)&v86 - v74, v77);
          TLVBufferInit((uint64_t)v75, (uint64_t)buf, 16);
          if (TLVBufferAddCounter((uint64_t)v75, v72))
          {
            if (EAPSIMAKAKeyInfoEncryptTLVs(v87, (uint64_t)v12, (uint64_t)v75))
            {
              if (!v25)
                goto LABEL_40;
              goto LABEL_38;
            }
            v85 = 8;
          }
          else
          {
            v82 = EAPLogGetLogHandle();
            v83 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v82, v83))
            {
              v84 = TLVBufferErrorString((uint64_t)v75);
              *(_DWORD *)v92 = 136315138;
              v93 = v84;
              _os_log_impl(&dword_206440000, v82, v83, "eapsim: failed to allocate AT_COUNTER, %s", v92, 0xCu);
            }
            v85 = 2;
          }
          *a4 = v85;
          return 0;
        }
        v80 = EAPLogGetLogHandle();
        v81 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v80, v81))
          goto LABEL_49;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v95 = v40;
        *(_WORD *)&v95[4] = 1024;
        *(_DWORD *)&v95[6] = v72;
        v56 = "eapsim: Notification AT_COUNTER (%d) does not match current counter (%d)";
        v57 = v80;
        v58 = v81;
        v59 = 14;
      }
      else
      {
        v78 = EAPLogGetLogHandle();
        v79 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v78, v79))
          goto LABEL_49;
        *(_WORD *)buf = 0;
        v56 = "eapsim:  Notification AT_ENCR_DATA missing AT_COUNTER";
        v57 = v78;
        v58 = v79;
        v59 = 2;
      }
    }
    else
    {
      v54 = EAPLogGetLogHandle();
      v55 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v54, v55))
      {
LABEL_49:
        v60 = 17;
LABEL_57:
        *a4 = v60;
        return 0;
      }
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v95 = v32;
      *(_WORD *)&v95[8] = 2048;
      v96 = v34;
      v56 = "eapsim: Notification after re-auth missing AT_ENCR_DATA (%p) or AT_IV (%p)";
      v57 = v54;
      v58 = v55;
      v59 = 22;
    }
    _os_log_impl(&dword_206440000, v57, v58, v56, buf, v59);
    goto LABEL_49;
  }
  response = (const void *)eapsim_make_response(a1, (uint64_t)a2, 12, (uint64_t)v12);
  if (!v25)
    goto LABEL_40;
LABEL_38:
  TLV = TLVBufferAllocateTLV((uint64_t)v12, 11, 20);
  if (!TLV)
  {
    v61 = EAPLogGetLogHandle();
    v62 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v61, v62))
    {
      v63 = TLVBufferErrorString((uint64_t)v12);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v95 = v63;
      _os_log_impl(&dword_206440000, v61, v62, "eapsim: failed allocating AT_MAC, %s", buf, 0xCu);
    }
    response = 0;
    v42 = 2;
    goto LABEL_35;
  }
  v25 = (uint64_t)TLV;
  *((_WORD *)TLV + 1) = 0;
LABEL_40:
  v45 = TLVBufferUsed((uint64_t)v12);
  EAPPacketSetLength((uint64_t)response, (unsigned __int16)(v45 + 8));
  if (v25)
    EAPSIMAKAKeyInfoSetMAC(a1 + 80, response, (_OWORD *)(v25 + 4), 0, 0);
  if ((v16 & 0x8000) != 0)
  {
    *(_DWORD *)(a1 + 12) = 4;
    return response;
  }
  *(_DWORD *)(a1 + 12) = 5;
  *a4 = 1002;
  *a5 = EAPSIMAKAStatusForATNotificationCode(v16);
  String = ATNotificationCodeGetString(v16);
  v47 = EAPLogGetLogHandle();
  v48 = _SC_syslog_os_log_mapping();
  v49 = os_log_type_enabled(v47, v48);
  if (String)
  {
    if (!v49)
      goto LABEL_62;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v95 = String;
    v50 = "eapsim: Notification: %s";
    v51 = v47;
    v52 = v48;
    v53 = 12;
  }
  else
  {
    if (!v49)
      goto LABEL_62;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v95 = v16;
    v50 = "eapsim: Notification code '%d' unrecognized failure";
    v51 = v47;
    v52 = v48;
    v53 = 8;
  }
  _os_log_impl(&dword_206440000, v51, v52, v50, buf, v53);
LABEL_62:
  v66 = (const __CFDictionary *)EAPSIMAKAActionInfoForNotificationCode(*(const __CFDictionary **)(*(_QWORD *)a1 + 80), v16);
  if (v66)
  {
    v67 = v66;
    *(_QWORD *)(a1 + 288) = CFDictionaryCreateCopy(0, v66);
    v68 = EAPLogGetLogHandle();
    v69 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v68, v69))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v95 = v67;
      _os_log_impl(&dword_206440000, v68, v69, "eapsim: Notification Action Info: %@", buf, 0xCu);
    }
  }
  else if (*a5 == 19)
  {
    v70 = *(_QWORD *)(a1 + 280);
    if (v70)
    {
      v71 = *(_QWORD *)(v70 + 16);
      if (v71)
        SIMReportDecryptionError(v71);
    }
  }
  return response;
}

const void *eapsim_reauthentication(uint64_t a1, const void *a2, unsigned __int8 ***a3, int *a4)
{
  size_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  size_t v12;
  size_t v13;
  uint64_t v14;
  unsigned __int8 ***v15;
  uint64_t v16;
  size_t v17;
  size_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  size_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  CFStringRef StringFromAttribute;
  CFStringRef v35;
  const void *response;
  BOOL v37;
  unsigned int v38;
  _BYTE *TLV;
  _BYTE *v40;
  __int16 v41;
  uint64_t v42;
  NSObject *LogHandle;
  os_log_type_t v44;
  const char *v45;
  NSObject *v47;
  os_log_type_t v48;
  NSObject *v49;
  os_log_type_t v50;
  NSObject *v51;
  os_log_type_t v52;
  int v53;
  NSObject *v54;
  os_log_type_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  __CFString *v63;
  uint8_t v64[4];
  uint64_t v65;
  uint8_t buf[4];
  __CFString *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  TLVBufferSizeof();
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v60 - v9;
  if ((v11 & 0x7FFFFFE00) != 0)
    v12 = 512;
  else
    v12 = v8;
  bzero((char *)&v60 - v9, v12);
  TLVListSizeof();
  MEMORY[0x24BDAC7A8]();
  v15 = (unsigned __int8 ***)((char *)&v60 - v14);
  if ((v16 & 0x7FFFFFE00) != 0)
    v17 = 512;
  else
    v17 = v13;
  bzero((char *)&v60 - v14, v17);
  TLVBufferSizeof();
  MEMORY[0x24BDAC7A8]();
  v20 = (char *)&v60 - v19;
  if ((v21 & 0x7FFFFFE00) != 0)
    v22 = 512;
  else
    v22 = v18;
  bzero((char *)&v60 - v19, v22);
  TLVListInit(v15);
  if (!*(_BYTE *)(a1 + 240))
  {
    LogHandle = EAPLogGetLogHandle();
    v44 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v44))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v45 = "eapsim: Reauthentication but no key info available";
LABEL_40:
    _os_log_impl(&dword_206440000, LogHandle, v44, v45, buf, 2u);
    goto LABEL_41;
  }
  if (!EAPSIMAKAPersistentStateGetReauthID(*(_QWORD *)(a1 + 264)))
  {
    LogHandle = EAPLogGetLogHandle();
    v44 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v44))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v45 = "eapsim: received Reauthentication but don't have reauth id";
    goto LABEL_40;
  }
  *(_QWORD *)(a1 + 8) = 0x300000000;
  EAPSIMAKAPersistentStateSetReauthID(*(_QWORD *)(a1 + 264), 0);
  v23 = TLVListLookupAttribute(a3, 11);
  if (!v23)
  {
    LogHandle = EAPLogGetLogHandle();
    v44 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v44))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v45 = "eapsim: Reauthentication is missing AT_MAC";
    goto LABEL_40;
  }
  if (!EAPSIMAKAKeyInfoVerifyMAC(a1 + 80, a2, v23 + 4, 0, 0))
  {
    LogHandle = EAPLogGetLogHandle();
    v44 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v44))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v45 = "eapsim: Reauthentication AT_MAC not valid";
    goto LABEL_40;
  }
  v24 = TLVListLookupAttribute(a3, 130);
  v25 = TLVListLookupAttribute(a3, 129);
  v26 = v25;
  if (!v24 || !v25)
  {
    if (!v24)
    {
      v47 = EAPLogGetLogHandle();
      v48 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v47, v48))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_206440000, v47, v48, "eapsim:  Reauthentication missing AT_ENCR_DATA", buf, 2u);
      }
    }
    if (v26)
      goto LABEL_41;
    LogHandle = EAPLogGetLogHandle();
    v44 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v44))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v45 = "eapsim:  Reauthentication missing AT_IV";
    goto LABEL_40;
  }
  v27 = EAPSIMAKAKeyInfoDecryptTLVList((const void *)(a1 + 80), v24, v25, (uint64_t)v15);
  if (v27)
  {
    v62 = v27;
    v63 = TLVListCopyDescription(v15);
    v28 = EAPLogGetLogHandle();
    v29 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v28, v29))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v63;
      _os_log_impl(&dword_206440000, v28, v29, "Decrypted TLVs:\n%@", buf, 0xCu);
    }
    CFRelease(v63);
    v30 = TLVListLookupAttribute(v15, 21);
    v31 = TLVListLookupAttribute(v15, 19);
    v32 = v31;
    if (!v30 || !v31)
    {
      if (!v30)
      {
        v49 = EAPLogGetLogHandle();
        v50 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v49, v50))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_206440000, v49, v50, "eapsim:  Reauthentication AT_ENCR_DATA missing AT_NONCE_S", buf, 2u);
        }
      }
      if (!v32)
      {
        v51 = EAPLogGetLogHandle();
        v52 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v51, v52))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_206440000, v51, v52, "eapsim:  Reauthentication AT_ENCR_DATA missing AT_COUNTER", buf, 2u);
        }
      }
      response = 0;
      v53 = 17;
      goto LABEL_66;
    }
    v61 = v30;
    v33 = bswap32(*(unsigned __int16 *)(v31 + 2)) >> 16;
    LODWORD(v63) = EAPSIMAKAPersistentStateGetCounter(*(_QWORD *)(a1 + 264));
    if (v33 >= v63)
    {
      v60 = v32;
      StringFromAttribute = TLVListCreateStringFromAttribute((uint64_t)v15, 133);
      if (StringFromAttribute)
      {
        v35 = StringFromAttribute;
        EAPSIMAKAPersistentStateSetReauthID(*(_QWORD *)(a1 + 264), StringFromAttribute);
        CFRelease(v35);
      }
      EAPSIMAKAPersistentStateSetCounter(*(_QWORD *)(a1 + 264), v33 + 1);
      v32 = v60;
    }
    response = (const void *)eapsim_make_response(a1, (uint64_t)a2, 13, (uint64_t)v20);
    TLVBufferInit((uint64_t)v10, (uint64_t)buf, 16);
    if (TLVBufferAddCounter((uint64_t)v10, v33))
    {
      LODWORD(v60) = v33;
      v37 = v33 >= v63;
      v38 = v63;
      if (v37 || TLVBufferAddCounterTooSmall((uint64_t)v10))
      {
        if (!EAPSIMAKAKeyInfoEncryptTLVs((const void *)(a1 + 80), (uint64_t)v20, (uint64_t)v10))
          goto LABEL_65;
        TLV = TLVBufferAllocateTLV((uint64_t)v20, 11, 20);
        if (TLV)
        {
          v40 = TLV;
          *((_WORD *)TLV + 1) = 0;
          v41 = TLVBufferUsed((uint64_t)v20);
          EAPPacketSetLength((uint64_t)response, (unsigned __int16)(v41 + 8));
          v42 = v61;
          EAPSIMAKAKeyInfoSetMAC(a1 + 80, response, v40 + 4, (const void *)(v61 + 4), 16);
          if (v60 >= v38)
          {
            *(_DWORD *)(a1 + 12) = 4;
            eapsim_compute_reauth_key(a1, v32, v42);
            *(_BYTE *)(a1 + 240) = 1;
            *(_BYTE *)(a1 + 272) = 1;
          }
          else
          {
            *(_BYTE *)(a1 + 240) = 0;
          }
          goto LABEL_67;
        }
        v54 = EAPLogGetLogHandle();
        v55 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v54, v55))
          goto LABEL_65;
        v59 = TLVBufferErrorString((uint64_t)v20);
        *(_DWORD *)v64 = 136315138;
        v65 = v59;
        v57 = "eapsim: failed allocating AT_MAC, %s";
        goto LABEL_64;
      }
      v54 = EAPLogGetLogHandle();
      v55 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v54, v55))
      {
        v58 = TLVBufferErrorString((uint64_t)v20);
        *(_DWORD *)v64 = 136315138;
        v65 = v58;
        v57 = "eapsim: failed allocating AT_COUNTER_TOO_SMALL, %s";
        goto LABEL_64;
      }
    }
    else
    {
      v54 = EAPLogGetLogHandle();
      v55 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v54, v55))
      {
        v56 = TLVBufferErrorString((uint64_t)v20);
        *(_DWORD *)v64 = 136315138;
        v65 = v56;
        v57 = "eapsim: failed allocating AT_COUNTER, %s";
LABEL_64:
        _os_log_impl(&dword_206440000, v54, v55, v57, v64, 0xCu);
      }
    }
LABEL_65:
    response = 0;
    v53 = 8;
LABEL_66:
    *a4 = v53;
LABEL_67:
    free(v62);
    goto LABEL_42;
  }
  LogHandle = EAPLogGetLogHandle();
  v44 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v44))
  {
    *(_WORD *)buf = 0;
    v45 = "eapsim: failed to decrypt Reauthentication AT_ENCR_DATA";
    goto LABEL_40;
  }
LABEL_41:
  response = 0;
  *a4 = 17;
LABEL_42:
  TLVListFree((uint64_t)v15);
  return response;
}

uint64_t eapsim_make_client_error(uint64_t a1, uint64_t a2, unsigned int a3)
{
  size_t v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  size_t v10;
  uint64_t response;
  _BYTE *TLV;
  __int16 v13;
  NSObject *LogHandle;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  TLVBufferSizeof();
  MEMORY[0x24BDAC7A8]();
  v8 = &buf[-v7];
  if ((v9 & 0x7FFFFFE00) != 0)
    v10 = 512;
  else
    v10 = v6;
  bzero(&buf[-v7], v10);
  response = eapsim_make_response(a1, a2, 14, (uint64_t)v8);
  TLV = TLVBufferAllocateTLV((uint64_t)v8, 22, 4);
  if (TLV)
  {
    *((_WORD *)TLV + 1) = __rev16(a3);
    v13 = TLVBufferUsed((uint64_t)v8);
    EAPPacketSetLength(response, (unsigned __int16)(v13 + 8));
  }
  else
  {
    LogHandle = EAPLogGetLogHandle();
    v15 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v15))
    {
      v16 = TLVBufferErrorString((uint64_t)v8);
      *(_DWORD *)buf = 136315138;
      v19 = v16;
      _os_log_impl(&dword_206440000, LogHandle, v15, "eapsim: failed allocating AT_CLIENT_ERROR_CODE, %s", buf, 0xCu);
    }
    return 0;
  }
  return response;
}

uint64_t eapsim_make_response(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v7;

  v7 = a1 + 316;
  TLVBufferInit(a4, a1 + 324, 1492);
  *(_BYTE *)(a1 + 316) = 2;
  *(_BYTE *)(a1 + 317) = *(_BYTE *)(a2 + 1);
  *(_BYTE *)(a1 + 320) = 18;
  *(_BYTE *)(a1 + 321) = a3;
  *(_WORD *)(a1 + 322) = 0;
  return v7;
}

BOOL eapsim_challenge_process_encr_data(uint64_t a1, unsigned __int8 ***a2)
{
  size_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSObject *v15;
  os_log_type_t v16;
  CFStringRef StringFromAttribute;
  CFStringRef v18;
  CFStringRef v19;
  CFStringRef v20;
  _BOOL8 result;
  NSObject *LogHandle;
  os_log_type_t v23;
  const char *v24;
  uint8_t buf[4];
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  TLVListSizeof();
  MEMORY[0x24BDAC7A8]();
  v6 = &buf[-v5];
  if ((v7 & 0x7FFFFFE00) != 0)
    v8 = 512;
  else
    v8 = v4;
  bzero(&buf[-v5], v8);
  TLVListInit(v6);
  v9 = TLVListLookupAttribute(a2, 130);
  if (!v9)
    return 1;
  v10 = v9;
  v11 = TLVListLookupAttribute(a2, 129);
  if (!v11)
  {
    LogHandle = EAPLogGetLogHandle();
    v23 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(LogHandle, v23);
    if (!result)
      return result;
    *(_WORD *)buf = 0;
    v24 = "eapsim: Challenge missing AT_IV";
    goto LABEL_19;
  }
  v12 = EAPSIMAKAKeyInfoDecryptTLVList((const void *)(a1 + 80), v10, v11, (uint64_t)v6);
  if (v12)
  {
    v13 = v12;
    v14 = TLVListCopyDescription((unsigned __int8 ***)v6);
    v15 = EAPLogGetLogHandle();
    v16 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v14;
      _os_log_impl(&dword_206440000, v15, v16, "Decrypted TLVs:\n%@", buf, 0xCu);
    }
    CFRelease(v14);
    StringFromAttribute = TLVListCreateStringFromAttribute((uint64_t)v6, 133);
    if (StringFromAttribute)
    {
      v18 = StringFromAttribute;
      EAPSIMAKAPersistentStateSetReauthID(*(_QWORD *)(a1 + 264), StringFromAttribute);
      CFRelease(v18);
    }
    v19 = TLVListCreateStringFromAttribute((uint64_t)v6, 132);
    if (v19)
    {
      v20 = v19;
      EAPSIMAKAPersistentStateSetPseudonym(*(_QWORD *)(a1 + 264), v19);
      CFRelease(v20);
    }
    free(v13);
    TLVListFree((uint64_t)v6);
    return 1;
  }
  LogHandle = EAPLogGetLogHandle();
  v23 = _SC_syslog_os_log_mapping();
  result = os_log_type_enabled(LogHandle, v23);
  if (result)
  {
    *(_WORD *)buf = 0;
    v24 = "eapsim: Challenge decrypt AT_ENCR_DATA failed";
LABEL_19:
    _os_log_impl(&dword_206440000, LogHandle, v23, v24, buf, 2u);
    return 0;
  }
  return result;
}

double eapsim_compute_reauth_key(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const __CFData *v6;
  const UInt8 *BytePtr;
  CC_LONG Length;

  v6 = *(const __CFData **)(a1 + 32);
  if (v6)
  {
    BytePtr = CFDataGetBytePtr(v6);
    Length = CFDataGetLength(*(CFDataRef *)(a1 + 32));
  }
  else
  {
    BytePtr = *(const UInt8 **)(*(_QWORD *)a1 + 40);
    Length = *(_DWORD *)(*(_QWORD *)a1 + 48);
  }
  return EAPSIMAKAKeyInfoComputeReauthKey((_OWORD *)(a1 + 80), *(_QWORD *)(a1 + 264), BytePtr, Length, a2, a3);
}

double fips186_2prf(__int128 *a1, uint64_t a2)
{
  int v3;
  __int128 v4;
  unsigned int v5;
  uint64_t i;
  unsigned int v7;
  unsigned int v8;
  uint64_t j;
  unsigned int v10;
  unsigned int v11;
  uint64_t k;
  unsigned int v13;
  unsigned int v14;
  uint64_t m;
  unsigned int v16;
  double result;
  __int128 v18;
  int v19;
  __int128 v20;
  _BYTE v21[28];
  _BYTE v22[19];
  char v23;
  _QWORD v24[2];
  int v25;
  __int128 v26;
  int v27;
  __int128 v28;
  int v29;
  __int128 v30;
  int v31;
  _OWORD v32[6];
  uint64_t v33;

  v3 = 0;
  v33 = *MEMORY[0x24BDAC8D0];
  memset(v32, 0, 92);
  v28 = 0uLL;
  v29 = 0;
  v26 = 0uLL;
  v27 = 0;
  v24[0] = 0;
  v24[1] = 0;
  v25 = 0;
  v4 = *a1;
  v31 = *((_DWORD *)a1 + 4);
  v30 = v4;
  memset(v22, 0, sizeof(v22));
  v23 = 1;
  do
  {
    fr_SHA1Init((uint64_t)v32);
    v20 = 0u;
    memset(v21, 0, sizeof(v21));
    v18 = v30;
    v19 = v31;
    fr_SHA1Transform((int *)v32, (unsigned int *)&v18);
    fr_SHA1FinalNoLen((uint64_t)&v28, (uint64_t)v32);
    v5 = 0;
    for (i = 19; i != -1; --i)
    {
      v7 = v5 + *((unsigned __int8 *)&v30 + i) + *((unsigned __int8 *)&v28 + i);
      *((_BYTE *)v24 + i) = v7;
      v5 = v7 >> 8;
    }
    v8 = 0;
    for (j = 19; j != -1; --j)
    {
      v10 = v8 + *((unsigned __int8 *)v24 + j) + v22[j];
      *((_BYTE *)&v30 + j) = v10;
      v8 = v10 >> 8;
    }
    fr_SHA1Init((uint64_t)v32);
    v20 = 0u;
    memset(v21, 0, sizeof(v21));
    v18 = v30;
    v19 = v31;
    fr_SHA1Transform((int *)v32, (unsigned int *)&v18);
    fr_SHA1FinalNoLen((uint64_t)&v26, (uint64_t)v32);
    v11 = 0;
    for (k = 19; k != -1; --k)
    {
      v13 = v11 + *((unsigned __int8 *)&v30 + k) + *((unsigned __int8 *)&v26 + k);
      *((_BYTE *)v24 + k) = v13;
      v11 = v13 >> 8;
    }
    v14 = 0;
    for (m = 19; m != -1; --m)
    {
      v16 = v14 + *((unsigned __int8 *)v24 + m) + v22[m];
      *((_BYTE *)&v30 + m) = v16;
      v14 = v16 >> 8;
    }
    *(_OWORD *)a2 = v28;
    *(_DWORD *)(a2 + 16) = v29;
    result = *(double *)&v26;
    *(_OWORD *)(a2 + 20) = v26;
    *(_DWORD *)(a2 + 36) = v27;
    a2 += 40;
    ++v3;
  }
  while (v3 != 4);
  return result;
}

uint64_t fr_SHA1Transform(int *a1, unsigned int *a2)
{
  int v2;
  int v3;
  int v4;
  unint64_t v5;
  unsigned int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  unint64_t v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  unint64_t v25;
  int v26;
  int v27;
  unsigned int v28;
  int v29;
  unsigned int v30;
  unsigned int v31;
  int v32;
  int v33;
  unint64_t v34;
  int v35;
  int v36;
  unsigned int v37;
  unsigned int v38;
  int v39;
  unint64_t v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  unint64_t v49;
  int v50;
  unsigned int v51;
  int v52;
  unsigned int v53;
  int v54;
  int v55;
  unint64_t v56;
  int v57;
  int v58;
  unsigned int v59;
  int v60;
  unsigned int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  unsigned int v67;
  int v68;
  unsigned int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  unsigned int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  int v121;
  int v122;
  unsigned int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  int v128;
  int v129;
  int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  int v139;
  unsigned int v140;
  int v141;
  unsigned int v142;
  int v143;
  int v144;
  int v145;
  unsigned int v146;
  int v147;
  unint64_t v148;
  int v149;
  int v150;
  unsigned int v151;
  int v152;
  unint64_t v153;
  int v154;
  int v155;
  unsigned int v156;
  int v157;
  unint64_t v158;
  int v159;
  int v160;
  unsigned int v161;
  int v162;
  unint64_t v163;
  int v164;
  int v165;
  unsigned int v166;
  int v167;
  unint64_t v168;
  int v169;
  int v170;
  unsigned int v171;
  int v172;
  unint64_t v173;
  int v174;
  int v175;
  int v176;
  unsigned int v177;
  int v178;
  unint64_t v179;
  int v180;
  int v181;
  unsigned int v182;
  int v183;
  unint64_t v184;
  int v185;
  int v186;
  unsigned int v187;
  int v188;
  unsigned int v189;
  int v190;
  int v191;
  int v192;
  unint64_t v193;
  int v194;
  int v195;
  unsigned int v196;
  unsigned int v197;
  int v198;
  int v199;
  unint64_t v200;
  int v201;
  int v202;
  unsigned int v203;
  int v204;
  unint64_t v205;
  int v206;
  int v207;
  unsigned int v208;
  int v209;
  unint64_t v210;
  int v211;
  int v212;
  int v213;
  int v214;
  unint64_t v215;
  int v216;
  int v217;
  unint64_t v218;
  int v219;
  int v220;
  int v221;
  unsigned int v222;
  int v223;
  unint64_t v224;
  int v225;
  int v226;
  int v227;
  int v228;
  int v229;
  unsigned int v230;
  int v231;
  int v232;
  unint64_t v233;
  int v234;
  int v235;
  unsigned int v236;
  unsigned int v237;
  int v238;
  int v239;
  unint64_t v240;
  int v241;
  int v242;
  int v243;
  unsigned int v244;
  int v245;
  unint64_t v246;
  int v247;
  int v248;
  unsigned int v249;
  int v250;
  unint64_t v251;
  int v252;
  int v253;
  int v254;
  int v255;
  unint64_t v256;
  unsigned int v257;
  int v258;
  unint64_t v259;
  int v260;
  int v261;
  unsigned int v262;
  unint64_t v263;
  int v264;
  int v265;
  int v266;
  unsigned int v267;
  int v268;
  unint64_t v269;
  int v270;
  int v271;
  int v272;
  int v273;
  unsigned int v274;
  int v275;
  unint64_t v276;
  int v277;
  int v278;
  int v279;
  int v280;
  int v281;
  unint64_t v282;
  int v283;
  int v284;
  int v285;
  int v286;
  unint64_t v287;
  int v288;
  int v289;
  int v290;
  int v291;
  unint64_t v292;
  int v293;
  int v294;
  unint64_t v295;
  int v296;
  int v297;
  int v298;
  int v299;
  unint64_t v300;
  int v301;
  int v302;
  int v303;
  unsigned int v304;
  int v305;
  unint64_t v306;
  int v307;
  int v308;
  int v309;
  unsigned int v310;
  int v311;
  unint64_t v312;
  int v313;
  int v314;
  int v315;
  int v316;
  unsigned int v317;
  int v318;
  unint64_t v319;
  int v320;
  int v321;
  int v322;
  unsigned int v323;
  int v324;
  unint64_t v325;
  int v326;
  int v327;
  int v328;
  int v329;
  unsigned int v330;
  int v331;
  unint64_t v332;
  int v333;
  int v334;
  int v335;
  int v336;
  unint64_t v337;
  int v338;
  int v339;
  int v340;
  unsigned int v341;
  int v342;
  unint64_t v343;
  int v344;
  int v345;
  int v346;
  unint64_t v347;
  int v348;
  unsigned int v349;
  int v350;
  int v351;
  unint64_t v352;
  int v353;
  unsigned int v354;
  int v355;
  unint64_t v356;
  int v357;
  int v358;
  int v359;
  unint64_t v360;
  int v361;
  unsigned int v362;
  int v363;
  int v364;
  unint64_t v365;
  int v366;
  unsigned int v367;
  int v368;
  unint64_t v369;
  int v370;
  int v371;
  int v372;
  unint64_t v373;
  int v374;
  unsigned int v375;
  int v376;
  int v377;
  unint64_t v378;
  int v379;
  unsigned int v380;
  int v381;
  unint64_t v382;
  int v383;
  int v384;
  int v385;
  unint64_t v386;
  int v387;
  unsigned int v388;
  int v389;
  int v390;
  unint64_t v391;
  int v392;
  unsigned int v393;
  int v394;
  unint64_t v395;
  int v396;
  int v397;
  int v398;
  int v399;
  unint64_t v400;
  int v401;
  int v402;
  unsigned int v403;
  int v404;
  int v405;
  unint64_t v406;
  int v407;
  unsigned int v408;
  int v409;
  unint64_t v410;
  uint64_t result;
  int v412;
  int v413;
  int v414;
  unint64_t v415;
  int v416;
  unsigned int v417;
  int v418;
  int v419;
  unint64_t v420;
  int v421;
  unsigned int v422;
  int v423;
  unint64_t v424;
  int v425;
  int v426;
  int v427;
  unint64_t v428;
  int v429;
  unsigned int v430;
  int v431;
  int v432;
  unint64_t v433;
  int v434;
  int v435;
  int v436;
  int v437;
  int v438;
  int v439;
  int v440;
  int v441;
  int v442;
  int v443;
  int v444;
  int v445;
  int v446;
  int v447;
  int v448;
  int v449;
  int v450;
  int v451;
  int v452;
  int v453;
  int v454;
  int v455;
  int v456;
  int v457;
  int v458;
  int v459;
  int v460;
  int v461;
  int v462;
  int v463;
  int v464;
  int v465;
  int v466;
  int v467;
  int v468;
  int v469;
  int v470;
  int v471;
  int v472;
  int v473;
  int v474;
  unsigned int v475;
  int v476;
  int v477;
  int v478;
  unsigned int v479;
  int v480;
  int v481;
  int v482;
  int v483;
  int v485;
  int v486;
  int v487;

  v2 = *a1;
  v3 = a1[1];
  HIDWORD(v5) = v3;
  LODWORD(v5) = v3;
  v4 = v5 >> 2;
  v6 = bswap32(*a2);
  HIDWORD(v5) = *a1;
  LODWORD(v5) = *a1;
  v7 = a1[3];
  v487 = a1[2];
  v485 = v7;
  v486 = v3;
  v8 = (v5 >> 27) + a1[4] + v6 + (v487 & v3 | v7 & ~v3) + 1518500249;
  HIDWORD(v5) = v8;
  LODWORD(v5) = v8;
  v9 = v5 >> 27;
  HIDWORD(v5) = v8;
  LODWORD(v5) = v8;
  v10 = v5 >> 2;
  v483 = v2;
  HIDWORD(v5) = *a1;
  LODWORD(v5) = *a1;
  v11 = v5 >> 2;
  v12 = bswap32(a2[1]);
  v13 = v7 + v12 + (v2 & __ROR4__(v3, 2) | v487 & ~v2) + 1518500249 + v9;
  v14 = v13 & __ROR4__(v8, 2);
  v16 = __PAIR64__(v13, __ROR4__(v2, 2));
  v15 = v8 & v16;
  LODWORD(v16) = v13;
  v17 = bswap32(a2[2]);
  v18 = v487 + v17 + (v15 | v4 & ~v8) + 1518500249 + (v16 >> 27);
  HIDWORD(v16) = v18;
  LODWORD(v16) = v18;
  v19 = bswap32(a2[3]);
  v20 = v4 + v19 + (v14 | v11 & ~v13) + 1518500249 + (v16 >> 27);
  HIDWORD(v16) = v20;
  LODWORD(v16) = v20;
  v21 = v16 >> 2;
  HIDWORD(v16) = v13;
  LODWORD(v16) = v13;
  v22 = v16 >> 2;
  HIDWORD(v16) = v20;
  LODWORD(v16) = v20;
  v23 = v16 >> 27;
  v25 = __PAIR64__(v18, __ROR4__(v13, 2));
  v24 = v18 & v25;
  LODWORD(v25) = v18;
  v26 = v25 >> 2;
  v27 = v20 & __ROR4__(v18, 2);
  v28 = bswap32(a2[4]);
  v29 = v11 + v28 + (v24 | v10 & ~v18) + 1518500249 + v23;
  HIDWORD(v25) = v29;
  LODWORD(v25) = v29;
  v30 = bswap32(a2[5]);
  v31 = v30 + v10 + (v27 | v22 & ~v20) + 1518500249 + (v25 >> 27);
  HIDWORD(v25) = v31;
  LODWORD(v25) = v31;
  v32 = v25 >> 27;
  v34 = __PAIR64__(v31, __ROR4__(v20, 2));
  v33 = v29 & v34;
  LODWORD(v34) = v31;
  v35 = v34 >> 2;
  HIDWORD(v34) = v29;
  LODWORD(v34) = v29;
  v36 = v34 >> 2;
  v37 = bswap32(a2[6]);
  v38 = v37 + v22 + (v33 | v26 & ~v29) + 1518500249 + v32;
  v40 = __PAIR64__(v38, __ROR4__(v29, 2));
  v39 = v31 & v40;
  LODWORD(v40) = v38;
  v41 = bswap32(a2[7]);
  v42 = v41 + v26 + (v39 | v21 & ~v31) + 1518500249 + (v40 >> 27);
  HIDWORD(v40) = v42;
  LODWORD(v40) = v42;
  v43 = bswap32(a2[8]);
  v44 = v43 + v21 + (v38 & __ROR4__(v31, 2) | v36 & ~v38) + 1518500249 + (v40 >> 27);
  HIDWORD(v40) = v44;
  LODWORD(v40) = v44;
  v45 = v40 >> 2;
  HIDWORD(v40) = v38;
  LODWORD(v40) = v38;
  v46 = v40 >> 2;
  HIDWORD(v40) = v44;
  LODWORD(v40) = v44;
  v47 = v40 >> 27;
  v49 = __PAIR64__(v42, __ROR4__(v38, 2));
  v48 = v42 & v49;
  LODWORD(v49) = v42;
  v50 = v49 >> 2;
  v51 = bswap32(a2[9]);
  v52 = v51 + v36 + (v48 | v35 & ~v42) + 1518500249 + v47;
  HIDWORD(v49) = v52;
  LODWORD(v49) = v52;
  v475 = v51;
  v479 = bswap32(a2[10]);
  v53 = v479 + v35 + (v44 & __ROR4__(v42, 2) | v46 & ~v44) + 1518500249 + (v49 >> 27);
  HIDWORD(v49) = v53;
  LODWORD(v49) = v53;
  v54 = v49 >> 27;
  v56 = __PAIR64__(v53, __ROR4__(v44, 2));
  v55 = v52 & v56;
  LODWORD(v56) = v53;
  v57 = v56 >> 2;
  HIDWORD(v56) = v52;
  LODWORD(v56) = v52;
  v58 = v56 >> 2;
  v59 = bswap32(a2[11]);
  v60 = v59 + v46 + (v55 | v50 & ~v52) + 1518500249 + v54;
  HIDWORD(v56) = v60;
  LODWORD(v56) = v60;
  v61 = bswap32(a2[12]);
  v62 = v61 + v50 + (v53 & __ROR4__(v52, 2) | v45 & ~v53) + 1518500249 + (v56 >> 27);
  HIDWORD(v56) = v62;
  LODWORD(v56) = v62;
  v63 = v56 >> 27;
  HIDWORD(v56) = v62;
  LODWORD(v56) = v62;
  v64 = v56 >> 2;
  HIDWORD(v56) = v60;
  LODWORD(v56) = v60;
  v65 = v56 >> 2;
  v66 = v62 & __ROR4__(v60, 2);
  v67 = bswap32(a2[13]);
  v68 = v67 + v45 + (v60 & __ROR4__(v53, 2) | v58 & ~v60) + 1518500249 + v63;
  HIDWORD(v56) = v68;
  LODWORD(v56) = v68;
  v69 = bswap32(a2[14]);
  v70 = v69 + v58 + (v66 | v57 & ~v62) + 1518500249 + (v56 >> 27);
  HIDWORD(v56) = v70;
  LODWORD(v56) = v70;
  v71 = v56 >> 27;
  HIDWORD(v56) = v68;
  LODWORD(v56) = v68;
  v72 = v56 >> 2;
  HIDWORD(v56) = v17 ^ v6 ^ v43 ^ v67;
  LODWORD(v56) = HIDWORD(v56);
  v73 = v56 >> 31;
  v74 = HIDWORD(v56);
  v456 = HIDWORD(v56);
  v75 = bswap32(a2[15]);
  v76 = v75 + v57 + (v68 & __ROR4__(v62, 2) | v65 & ~v68) + 1518500249 + v71;
  HIDWORD(v56) = v76;
  LODWORD(v56) = v76;
  v77 = v56 >> 27;
  HIDWORD(v56) = v70;
  LODWORD(v56) = v70;
  v78 = v56 >> 2;
  v79 = v19 ^ v12 ^ v51 ^ v69;
  HIDWORD(v56) = v79;
  LODWORD(v56) = v79;
  v80 = v56 >> 31;
  v81 = v73 + v65 + (v70 & __ROR4__(v68, 2) | v64 & ~v70) + 1518500249 + v77;
  HIDWORD(v56) = v81;
  LODWORD(v56) = v81;
  v82 = v56 >> 27;
  HIDWORD(v56) = v76;
  LODWORD(v56) = v76;
  v83 = v56 >> 2;
  HIDWORD(v56) = v28 ^ v17 ^ v479 ^ v75;
  LODWORD(v56) = HIDWORD(v56);
  v459 = v56 >> 31;
  v84 = HIDWORD(v56);
  v85 = v80 + v64 + (v76 & __ROR4__(v70, 2) | v72 & ~v76) + 1518500249 + v82;
  HIDWORD(v56) = v85;
  LODWORD(v56) = v85;
  v86 = v56 >> 27;
  LODWORD(v56) = v30 ^ v19 ^ v59 ^ __ROR4__(v74, 31);
  v87 = v56;
  HIDWORD(v56) = v56;
  v88 = v56 >> 31;
  v89 = v459 + v72 + (v81 & __ROR4__(v76, 2) | v78 & ~v81) + 1518500249 + v86;
  HIDWORD(v56) = v89;
  LODWORD(v56) = v89;
  v90 = v56 >> 27;
  HIDWORD(v56) = v85;
  LODWORD(v56) = v85;
  v91 = v56 >> 2;
  v93 = v88 + v78 + (v85 & __ROR4__(v81, 2) | v83 & ~v85) + 1518500249 + v90;
  LODWORD(v56) = v37 ^ v28 ^ v61 ^ __ROR4__(v79, 31);
  v92 = v56;
  HIDWORD(v56) = v56;
  v472 = v56 >> 31;
  HIDWORD(v56) = v93;
  LODWORD(v56) = v93;
  v94 = v472 + v83 + (v91 ^ __ROR4__(v81, 2) ^ v89) + 1859775393 + (v56 >> 27);
  HIDWORD(v56) = v81;
  LODWORD(v56) = v81;
  v95 = v56 >> 2;
  HIDWORD(v56) = v89;
  LODWORD(v56) = v89;
  v96 = v56 >> 2;
  v97 = v84;
  LODWORD(v56) = v41 ^ v30 ^ v67 ^ __ROR4__(v84, 31);
  v98 = v56;
  HIDWORD(v56) = v56;
  v466 = v56 >> 31;
  v99 = v466 + v95 + (v96 ^ __ROR4__(v85, 2) ^ v93) + 1859775393;
  HIDWORD(v56) = v94;
  LODWORD(v56) = v94;
  v100 = v56 >> 27;
  HIDWORD(v56) = v93;
  LODWORD(v56) = v93;
  v101 = v56 >> 2;
  v102 = v99 + v100;
  v104 = v87;
  LODWORD(v56) = v43 ^ v37 ^ v69 ^ __ROR4__(v87, 31);
  v103 = v56;
  HIDWORD(v56) = v56;
  v453 = v56 >> 31;
  HIDWORD(v56) = v102;
  LODWORD(v56) = v102;
  v105 = v453 + v91 + (v101 ^ __ROR4__(v89, 2) ^ v94) + 1859775393 + (v56 >> 27);
  HIDWORD(v56) = v94;
  LODWORD(v56) = v94;
  v106 = v56 >> 2;
  v107 = v106 ^ __ROR4__(v93, 2);
  LODWORD(v56) = v475 ^ v41 ^ v75 ^ __ROR4__(v92, 31);
  v108 = v56;
  HIDWORD(v56) = v56;
  v442 = v56 >> 31;
  v109 = v442 + v96 + (v107 ^ v102) + 1859775393;
  HIDWORD(v56) = v105;
  LODWORD(v56) = v105;
  v110 = v56 >> 27;
  HIDWORD(v56) = v102;
  LODWORD(v56) = v102;
  v111 = v56 >> 2;
  v112 = v109 + v110;
  LODWORD(v56) = v479 ^ v43 ^ __ROR4__(v456, 31) ^ __ROR4__(v98, 31);
  v113 = v56;
  HIDWORD(v56) = v56;
  v440 = v56 >> 31;
  HIDWORD(v56) = v112;
  LODWORD(v56) = v112;
  v114 = v440 + v101 + (v111 ^ __ROR4__(v94, 2) ^ v105) + 1859775393 + (v56 >> 27);
  HIDWORD(v56) = v105;
  LODWORD(v56) = v105;
  v115 = v56 >> 2;
  v116 = v115 ^ __ROR4__(v102, 2);
  v117 = v59 ^ v475 ^ __ROR4__(v79, 31) ^ __ROR4__(v103, 31);
  HIDWORD(v56) = v117;
  LODWORD(v56) = v117;
  v118 = v56 >> 31;
  v119 = v118 + v106 + (v116 ^ v112) + 1859775393;
  HIDWORD(v56) = v114;
  LODWORD(v56) = v114;
  v120 = v56 >> 27;
  HIDWORD(v56) = v112;
  LODWORD(v56) = v112;
  v121 = v56 >> 2;
  v122 = v119 + v120;
  v123 = v61;
  v124 = v61 ^ v479 ^ __ROR4__(v97, 31) ^ __ROR4__(v108, 31);
  HIDWORD(v56) = v124;
  LODWORD(v56) = v124;
  v469 = v56 >> 31;
  HIDWORD(v56) = v122;
  LODWORD(v56) = v122;
  v125 = v469 + v111 + (v121 ^ __ROR4__(v105, 2) ^ v114) + 1859775393 + (v56 >> 27);
  HIDWORD(v56) = v114;
  LODWORD(v56) = v114;
  v126 = v56 >> 2;
  v127 = v67 ^ v59 ^ __ROR4__(v87, 31) ^ __ROR4__(v113, 31);
  HIDWORD(v56) = v127;
  LODWORD(v56) = v127;
  v476 = v56 >> 31;
  v128 = v476 + v115 + (v126 ^ __ROR4__(v112, 2) ^ v122) + 1859775393;
  HIDWORD(v56) = v125;
  LODWORD(v56) = v125;
  v129 = v56 >> 27;
  HIDWORD(v56) = v122;
  LODWORD(v56) = v122;
  v130 = v56 >> 2;
  v131 = v128 + v129;
  LODWORD(v56) = v69 ^ v123 ^ __ROR4__(v92, 31) ^ __ROR4__(v117, 31);
  v132 = v56;
  HIDWORD(v56) = v56;
  v450 = v56 >> 31;
  HIDWORD(v56) = v128 + v129;
  LODWORD(v56) = v128 + v129;
  v133 = v450 + v121 + (v130 ^ __ROR4__(v114, 2) ^ v125) + 1859775393 + (v56 >> 27);
  HIDWORD(v56) = v125;
  LODWORD(v56) = v125;
  v134 = v56 >> 2;
  v135 = v134 ^ __ROR4__(v122, 2) ^ (v128 + v129);
  LODWORD(v56) = v75 ^ v67 ^ __ROR4__(v98, 31) ^ __ROR4__(v124, 31);
  v136 = v56;
  HIDWORD(v56) = v56;
  v463 = v56 >> 31;
  v137 = v463 + v126 + v135 + 1859775393;
  HIDWORD(v56) = v133;
  LODWORD(v56) = v133;
  v138 = v56 >> 27;
  HIDWORD(v56) = v131;
  LODWORD(v56) = v131;
  v139 = v56 >> 2;
  v140 = v137 + v138;
  LODWORD(v56) = v69 ^ __ROR4__(v456, 31) ^ __ROR4__(v103, 31) ^ __ROR4__(v127, 31);
  v141 = v56;
  HIDWORD(v56) = v56;
  v480 = v56 >> 31;
  HIDWORD(v56) = v140;
  LODWORD(v56) = v140;
  v142 = v480 + v130 + (v139 ^ __ROR4__(v125, 2) ^ v133) + 1859775393 + (v56 >> 27);
  HIDWORD(v56) = v133;
  LODWORD(v56) = v133;
  v143 = v56 >> 2;
  LODWORD(v56) = v75 ^ __ROR4__(v79, 31) ^ __ROR4__(v108, 31) ^ __ROR4__(v132, 31);
  v144 = v56;
  HIDWORD(v56) = v56;
  v145 = v56 >> 31;
  HIDWORD(v56) = v142;
  LODWORD(v56) = v142;
  v146 = v145 + v134 + (v143 ^ __ROR4__(v131, 2) ^ v140) + 1859775393 + (v56 >> 27);
  v148 = __PAIR64__(v140, __ROR4__(v456, 31));
  v147 = v459 ^ v148;
  LODWORD(v148) = v140;
  v149 = v148 >> 2;
  LODWORD(v148) = v147 ^ __ROR4__(v113, 31) ^ __ROR4__(v136, 31);
  v150 = v148;
  HIDWORD(v148) = v148;
  v460 = v148 >> 31;
  HIDWORD(v148) = v146;
  LODWORD(v148) = v146;
  v151 = v460 + v139 + (v149 ^ __ROR4__(v133, 2) ^ v142) + 1859775393 + (v148 >> 27);
  v153 = __PAIR64__(v142, __ROR4__(v79, 31));
  v152 = v88 ^ v153;
  LODWORD(v153) = v142;
  v154 = v153 >> 2;
  LODWORD(v153) = v152 ^ __ROR4__(v117, 31) ^ __ROR4__(v141, 31);
  v155 = v153;
  HIDWORD(v153) = v153;
  v457 = v153 >> 31;
  HIDWORD(v153) = v151;
  LODWORD(v153) = v151;
  v156 = v457 + v143 + (v154 ^ __ROR4__(v140, 2) ^ v146) + 1859775393 + (v153 >> 27);
  v158 = __PAIR64__(v146, __ROR4__(v97, 31));
  v157 = v472 ^ v158;
  LODWORD(v158) = v146;
  v159 = v158 >> 2;
  LODWORD(v158) = v157 ^ __ROR4__(v124, 31) ^ __ROR4__(v144, 31);
  v160 = v158;
  HIDWORD(v158) = v158;
  v448 = v158 >> 31;
  HIDWORD(v158) = v156;
  LODWORD(v158) = v156;
  v161 = v448 + v149 + (v159 ^ __ROR4__(v142, 2) ^ v151) + 1859775393 + (v158 >> 27);
  v163 = __PAIR64__(v151, __ROR4__(v104, 31));
  v162 = v466 ^ v163;
  LODWORD(v163) = v151;
  v164 = v163 >> 2;
  LODWORD(v163) = v162 ^ __ROR4__(v127, 31) ^ __ROR4__(v150, 31);
  v165 = v163;
  HIDWORD(v163) = v163;
  v446 = v163 >> 31;
  HIDWORD(v163) = v161;
  LODWORD(v163) = v161;
  v166 = v446 + v154 + (v164 ^ __ROR4__(v146, 2) ^ v156) + 1859775393 + (v163 >> 27);
  v168 = __PAIR64__(v156, __ROR4__(v92, 31));
  v167 = v453 ^ v168;
  LODWORD(v168) = v156;
  v169 = v168 >> 2;
  LODWORD(v168) = v167 ^ __ROR4__(v132, 31) ^ __ROR4__(v155, 31);
  v170 = v168;
  HIDWORD(v168) = v168;
  v444 = v168 >> 31;
  HIDWORD(v168) = v166;
  LODWORD(v168) = v166;
  v171 = v444 + v159 + (v169 ^ __ROR4__(v151, 2) ^ v161) + 1859775393 + (v168 >> 27);
  v173 = __PAIR64__(v161, __ROR4__(v98, 31));
  v172 = v442 ^ v173;
  LODWORD(v173) = v161;
  v174 = v173 >> 2;
  LODWORD(v173) = v172 ^ __ROR4__(v136, 31) ^ __ROR4__(v160, 31);
  v175 = v173;
  HIDWORD(v173) = v173;
  v176 = v173 >> 31;
  HIDWORD(v173) = v171;
  LODWORD(v173) = v171;
  v177 = v176 + v164 + (v174 ^ __ROR4__(v156, 2) ^ v166) + 1859775393 + (v173 >> 27);
  v179 = __PAIR64__(v166, __ROR4__(v103, 31));
  v178 = v440 ^ v179;
  LODWORD(v179) = v166;
  v180 = v179 >> 2;
  LODWORD(v179) = v178 ^ __ROR4__(v141, 31) ^ __ROR4__(v165, 31);
  v181 = v179;
  HIDWORD(v179) = v179;
  v454 = v179 >> 31;
  HIDWORD(v179) = v177;
  LODWORD(v179) = v177;
  v182 = v454 + v169 + (v180 ^ __ROR4__(v161, 2) ^ v171) + 1859775393 + (v179 >> 27);
  v184 = __PAIR64__(v171, __ROR4__(v108, 31));
  v183 = v118 ^ v184;
  LODWORD(v184) = v171;
  v185 = v184 >> 2;
  LODWORD(v184) = v183 ^ __ROR4__(v144, 31) ^ __ROR4__(v170, 31);
  v186 = v184;
  HIDWORD(v184) = v184;
  v473 = v184 >> 31;
  HIDWORD(v184) = v182;
  LODWORD(v184) = v182;
  v187 = v473 + v174 + (v185 ^ __ROR4__(v166, 2) ^ v177) + 1859775393 + (v184 >> 27);
  LODWORD(v184) = v469 ^ __ROR4__(v113, 31) ^ __ROR4__(v150, 31) ^ __ROR4__(v175, 31);
  v188 = v184;
  HIDWORD(v184) = v184;
  v470 = v184 >> 31;
  HIDWORD(v184) = v187;
  LODWORD(v184) = v187;
  v189 = v470
       + v180
       + ((v182 | __ROR4__(v177, 2)) & __ROR4__(v171, 2) | v182 & __ROR4__(v177, 2))
       + (v184 >> 27)
       - 1894007588;
  v190 = v476 ^ __ROR4__(v117, 31) ^ __ROR4__(v155, 31) ^ __ROR4__(v181, 31);
  HIDWORD(v184) = v190;
  LODWORD(v184) = v190;
  v467 = v184 >> 31;
  HIDWORD(v184) = v189;
  LODWORD(v184) = v189;
  v191 = v467 + v185 + ((v187 | __ROR4__(v182, 2)) & __ROR4__(v177, 2) | v187 & __ROR4__(v182, 2)) + (v184 >> 27);
  v193 = __PAIR64__(v177, __ROR4__(v124, 31));
  v192 = v450 ^ v193;
  LODWORD(v193) = v177;
  v194 = v193 >> 2;
  HIDWORD(v193) = v192 ^ __ROR4__(v160, 31) ^ __ROR4__(v186, 31);
  LODWORD(v193) = HIDWORD(v193);
  v195 = HIDWORD(v193);
  v477 = v193 >> 31;
  v196 = v191 - 1894007588;
  HIDWORD(v193) = v191 - 1894007588;
  LODWORD(v193) = v191 - 1894007588;
  v197 = v477 + v194 + ((v189 | __ROR4__(v187, 2)) & __ROR4__(v182, 2) | v189 & __ROR4__(v187, 2)) + (v193 >> 27);
  v198 = ((v191 - 1894007588) | __ROR4__(v189, 2)) & __ROR4__(v187, 2) | (v191 - 1894007588) & __ROR4__(v189, 2);
  v200 = __PAIR64__(v182, __ROR4__(v127, 31));
  v199 = v463 ^ v200;
  LODWORD(v200) = v182;
  v201 = v200 >> 2;
  LODWORD(v200) = v199 ^ __ROR4__(v165, 31) ^ __ROR4__(v188, 31);
  v202 = v200;
  HIDWORD(v200) = v200;
  v451 = v200 >> 31;
  v197 -= 1894007588;
  HIDWORD(v200) = v197;
  LODWORD(v200) = v197;
  v203 = v451 + v201 + v198 + (v200 >> 27);
  v205 = __PAIR64__(v187, __ROR4__(v132, 31));
  v204 = v480 ^ v205;
  LODWORD(v205) = v187;
  v206 = v205 >> 2;
  v203 -= 1894007588;
  LODWORD(v205) = v204 ^ __ROR4__(v170, 31) ^ __ROR4__(v190, 31);
  v207 = v205;
  HIDWORD(v205) = v205;
  v464 = v205 >> 31;
  HIDWORD(v205) = v203;
  LODWORD(v205) = v203;
  v208 = v464 + v206 + ((v197 | __ROR4__(v196, 2)) & __ROR4__(v189, 2) | v197 & __ROR4__(v196, 2)) + (v205 >> 27);
  v210 = __PAIR64__(v189, __ROR4__(v136, 31));
  v209 = v145 ^ v210;
  LODWORD(v210) = v189;
  v211 = v210 >> 2;
  v212 = v209 ^ __ROR4__(v175, 31) ^ __ROR4__(v195, 31);
  v213 = v195;
  v215 = __PAIR64__(v212, __ROR4__(v197, 2));
  v214 = v203 & v215;
  LODWORD(v215) = v212;
  v481 = v215 >> 31;
  v208 -= 1894007588;
  HIDWORD(v215) = v208;
  LODWORD(v215) = v208;
  v216 = v481 + v211 + ((v203 | __ROR4__(v197, 2)) & __ROR4__(v196, 2) | v214) + (v215 >> 27);
  v218 = __PAIR64__(v196, __ROR4__(v141, 31));
  v217 = v460 ^ v218;
  LODWORD(v218) = v196;
  v219 = v218 >> 2;
  v220 = v217 ^ __ROR4__(v181, 31) ^ __ROR4__(v202, 31);
  v438 = v207;
  v439 = v202;
  HIDWORD(v218) = v220;
  LODWORD(v218) = v220;
  v461 = v218 >> 31;
  v221 = v461 + v219 + ((v208 | __ROR4__(v203, 2)) & __ROR4__(v197, 2) | v208 & __ROR4__(v203, 2));
  v222 = v216 - 1894007588;
  HIDWORD(v218) = v216 - 1894007588;
  LODWORD(v218) = v216 - 1894007588;
  v223 = v221 + (v218 >> 27);
  v224 = __PAIR64__(v197, __ROR4__(v208, 2));
  v225 = (v222 | __ROR4__(v208, 2)) & __ROR4__(v203, 2) | v222 & v224;
  LODWORD(v224) = v197;
  v226 = v224 >> 2;
  v228 = v207;
  LODWORD(v224) = v457 ^ __ROR4__(v144, 31) ^ __ROR4__(v186, 31) ^ __ROR4__(v207, 31);
  v227 = v224;
  HIDWORD(v224) = v224;
  v458 = v224 >> 31;
  v229 = v458 + v226 + v225;
  v230 = v223 - 1894007588;
  HIDWORD(v224) = v223 - 1894007588;
  LODWORD(v224) = v223 - 1894007588;
  v231 = v229 + (v224 >> 27);
  v233 = __PAIR64__(v203, __ROR4__(v150, 31));
  v232 = v448 ^ v233;
  LODWORD(v233) = v203;
  v234 = v233 >> 2;
  LODWORD(v233) = v232 ^ __ROR4__(v188, 31) ^ __ROR4__(v212, 31);
  v235 = v233;
  HIDWORD(v233) = v233;
  v449 = v233 >> 31;
  v236 = v231 - 1894007588;
  HIDWORD(v233) = v231 - 1894007588;
  LODWORD(v233) = v231 - 1894007588;
  v237 = v449 + v234 + ((v230 | __ROR4__(v222, 2)) & __ROR4__(v208, 2) | v230 & __ROR4__(v222, 2)) + (v233 >> 27);
  v238 = ((v231 - 1894007588) | __ROR4__(v230, 2)) & __ROR4__(v222, 2) | (v231 - 1894007588) & __ROR4__(v230, 2);
  v240 = __PAIR64__(v208, __ROR4__(v155, 31));
  v239 = v446 ^ v240;
  LODWORD(v240) = v208;
  v241 = v240 >> 2;
  v242 = v239 ^ __ROR4__(v190, 31) ^ __ROR4__(v220, 31);
  v243 = v220;
  HIDWORD(v240) = v242;
  LODWORD(v240) = v242;
  v447 = v240 >> 31;
  v237 -= 1894007588;
  HIDWORD(v240) = v237;
  LODWORD(v240) = v237;
  v244 = v447 + v241 + v238 + (v240 >> 27);
  v246 = __PAIR64__(v222, __ROR4__(v160, 31));
  v245 = v444 ^ v246;
  LODWORD(v246) = v222;
  v247 = v246 >> 2;
  v244 -= 1894007588;
  LODWORD(v246) = v245 ^ __ROR4__(v195, 31) ^ __ROR4__(v227, 31);
  v248 = v246;
  HIDWORD(v246) = v246;
  v445 = v246 >> 31;
  HIDWORD(v246) = v244;
  LODWORD(v246) = v244;
  v249 = v445 + v247 + ((v237 | __ROR4__(v236, 2)) & __ROR4__(v230, 2) | v237 & __ROR4__(v236, 2)) + (v246 >> 27);
  v251 = __PAIR64__(v230, __ROR4__(v165, 31));
  v250 = v176 ^ v251;
  LODWORD(v251) = v230;
  v252 = v251 >> 2;
  v253 = v250 ^ __ROR4__(v439, 31);
  LODWORD(v251) = __ROR4__(v235, 31);
  v254 = v253 ^ v251;
  v436 = v235;
  v437 = v242;
  v256 = __PAIR64__(v253 ^ v251, __ROR4__(v237, 2));
  v255 = v244 & v256;
  LODWORD(v256) = v254;
  v443 = v256 >> 31;
  v249 -= 1894007588;
  HIDWORD(v256) = v249;
  LODWORD(v256) = v249;
  v257 = v443 + v252 + ((v244 | __ROR4__(v237, 2)) & __ROR4__(v236, 2) | v255) + (v256 >> 27);
  v259 = __PAIR64__(v236, __ROR4__(v170, 31));
  v258 = v454 ^ v259;
  LODWORD(v259) = v236;
  v260 = v259 >> 2;
  LODWORD(v259) = v258 ^ __ROR4__(v228, 31) ^ __ROR4__(v242, 31);
  v261 = v259;
  HIDWORD(v259) = v259;
  v455 = v259 >> 31;
  v257 -= 1894007588;
  HIDWORD(v259) = v257;
  LODWORD(v259) = v257;
  v262 = v455 + v260 + ((v249 | __ROR4__(v244, 2)) & __ROR4__(v237, 2) | v249 & __ROR4__(v244, 2)) + (v259 >> 27);
  v263 = __PAIR64__(v237, __ROR4__(v249, 2));
  v264 = (v257 | __ROR4__(v249, 2)) & __ROR4__(v244, 2) | v257 & v263;
  LODWORD(v263) = v237;
  v265 = v263 >> 2;
  LODWORD(v263) = v473 ^ __ROR4__(v175, 31) ^ __ROR4__(v212, 31) ^ __ROR4__(v248, 31);
  v266 = v263;
  HIDWORD(v263) = v263;
  v441 = v263 >> 31;
  v262 -= 1894007588;
  HIDWORD(v263) = v262;
  LODWORD(v263) = v262;
  v267 = v441 + v265 + v264 + (v263 >> 27);
  v269 = __PAIR64__(v244, __ROR4__(v181, 31));
  v268 = v470 ^ v269;
  LODWORD(v269) = v244;
  v270 = v269 >> 2;
  v271 = v243;
  v272 = v268 ^ __ROR4__(v243, 31) ^ __ROR4__(v254, 31);
  v273 = v254;
  v435 = v254;
  HIDWORD(v269) = v272;
  LODWORD(v269) = v272;
  v474 = v269 >> 31;
  v267 -= 1894007588;
  HIDWORD(v269) = v267;
  LODWORD(v269) = v267;
  v274 = v474 + v270 + ((v262 | __ROR4__(v257, 2)) & __ROR4__(v249, 2) | v262 & __ROR4__(v257, 2)) + (v269 >> 27);
  v276 = __PAIR64__(v249, __ROR4__(v186, 31));
  v275 = v467 ^ v276;
  LODWORD(v276) = v249;
  v277 = v276 >> 2;
  v278 = v227;
  LODWORD(v276) = v275 ^ __ROR4__(v227, 31) ^ __ROR4__(v261, 31);
  v279 = v276;
  HIDWORD(v276) = v276;
  v471 = v276 >> 31;
  v274 -= 1894007588;
  HIDWORD(v276) = v274;
  LODWORD(v276) = v274;
  v280 = v471 + v277 + ((v267 | __ROR4__(v262, 2)) & __ROR4__(v257, 2) | v267 & __ROR4__(v262, 2)) + (v276 >> 27);
  v282 = __PAIR64__(v257, __ROR4__(v188, 31));
  v281 = v477 ^ v282;
  LODWORD(v282) = v257;
  v283 = v282 >> 2;
  LODWORD(v282) = v281 ^ __ROR4__(v235, 31) ^ __ROR4__(v266, 31);
  v284 = v282;
  HIDWORD(v282) = v282;
  v478 = v282 >> 31;
  HIDWORD(v282) = v280 - 1894007588;
  LODWORD(v282) = v280 - 1894007588;
  v285 = v478 + v283 + ((v274 | __ROR4__(v267, 2)) & __ROR4__(v262, 2) | v274 & __ROR4__(v267, 2)) + (v282 >> 27);
  v287 = __PAIR64__(v262, __ROR4__(v190, 31));
  v286 = v451 ^ v287;
  LODWORD(v287) = v262;
  v288 = v287 >> 2;
  v289 = v286 ^ __ROR4__(v242, 31);
  LODWORD(v287) = __ROR4__(v272, 31);
  v290 = v289 ^ v287;
  v292 = __PAIR64__(v289 ^ v287, __ROR4__(v274, 2));
  v291 = (v280 - 1894007588) & v292;
  LODWORD(v292) = v290;
  v468 = v292 >> 31;
  HIDWORD(v292) = v285 - 1894007588;
  LODWORD(v292) = v285 - 1894007588;
  v293 = v468 + v288 + (((v280 - 1894007588) | __ROR4__(v274, 2)) & __ROR4__(v267, 2) | v291) + (v292 >> 27);
  v295 = __PAIR64__(v267, __ROR4__(v213, 31));
  v294 = v464 ^ v295;
  LODWORD(v295) = v267;
  v296 = v295 >> 2;
  v297 = v248;
  LODWORD(v295) = v294 ^ __ROR4__(v248, 31) ^ __ROR4__(v279, 31);
  v298 = v295;
  HIDWORD(v295) = v295;
  v465 = v295 >> 31;
  v293 -= 1894007588;
  HIDWORD(v295) = v293;
  LODWORD(v295) = v293;
  v299 = v465
       + v296
       + (((v285 - 1894007588) | __ROR4__(v280 - 1894007588, 2)) & __ROR4__(v274, 2) | (v285 - 1894007588) & __ROR4__(v280 - 1894007588, 2))
       + (v295 >> 27);
  v300 = __PAIR64__(v274, __ROR4__(v285 - 1894007588, 2));
  v301 = (v293 | __ROR4__(v285 - 1894007588, 2)) & __ROR4__(v280 - 1894007588, 2) | v293 & v300;
  LODWORD(v300) = v274;
  v302 = v300 >> 2;
  LODWORD(v300) = v481 ^ __ROR4__(v439, 31) ^ __ROR4__(v273, 31) ^ __ROR4__(v284, 31);
  v303 = v300;
  HIDWORD(v300) = v300;
  v452 = v300 >> 31;
  HIDWORD(v300) = v299 - 1894007588;
  LODWORD(v300) = v299 - 1894007588;
  v304 = v452 + v302 + v301 + (v300 >> 27) - 1894007588;
  v306 = __PAIR64__(v280 - 1894007588, __ROR4__(v438, 31));
  v305 = v461 ^ v306;
  LODWORD(v306) = v280 - 1894007588;
  v307 = v306 >> 2;
  HIDWORD(v306) = v293;
  LODWORD(v306) = v293;
  v308 = v306 >> 2;
  LODWORD(v306) = v305 ^ __ROR4__(v261, 31) ^ __ROR4__(v290, 31);
  v309 = v306;
  HIDWORD(v306) = v306;
  v482 = v306 >> 31;
  HIDWORD(v306) = v304;
  LODWORD(v306) = v304;
  v310 = v482 + v307 + (v308 ^ __ROR4__(v285 - 1894007588, 2) ^ (v299 - 1894007588)) - 899497514 + (v306 >> 27);
  v312 = __PAIR64__(v285 - 1894007588, __ROR4__(v212, 31));
  v311 = v458 ^ v312;
  LODWORD(v312) = v285 - 1894007588;
  v313 = v312 >> 2;
  HIDWORD(v312) = v299 - 1894007588;
  LODWORD(v312) = v299 - 1894007588;
  v314 = v312 >> 2;
  LODWORD(v312) = v311 ^ __ROR4__(v266, 31) ^ __ROR4__(v298, 31);
  v315 = v312;
  HIDWORD(v312) = v312;
  v316 = v312 >> 31;
  HIDWORD(v312) = v310;
  LODWORD(v312) = v310;
  v317 = v316 + v313 + (v314 ^ __ROR4__(v293, 2) ^ v304) - 899497514 + (v312 >> 27);
  v319 = __PAIR64__(v304, __ROR4__(v271, 31));
  v318 = v449 ^ v319;
  LODWORD(v319) = v304;
  v320 = v319 >> 2;
  LODWORD(v319) = v318 ^ __ROR4__(v272, 31) ^ __ROR4__(v303, 31);
  v321 = v319;
  HIDWORD(v319) = v319;
  v322 = v319 >> 31;
  HIDWORD(v319) = v317;
  LODWORD(v319) = v317;
  v323 = v322 + v308 + (v320 ^ __ROR4__(v299 - 1894007588, 2) ^ v310) - 899497514 + (v319 >> 27);
  v325 = __PAIR64__(v310, __ROR4__(v278, 31));
  v324 = v447 ^ v325;
  LODWORD(v325) = v310;
  v326 = v325 >> 2;
  v327 = v326 ^ __ROR4__(v304, 2) ^ v317;
  LODWORD(v325) = v324 ^ __ROR4__(v279, 31) ^ __ROR4__(v309, 31);
  v328 = v325;
  HIDWORD(v325) = v325;
  v329 = v325 >> 31;
  HIDWORD(v325) = v323;
  LODWORD(v325) = v323;
  v330 = v329 + v314 + v327 - 899497514 + (v325 >> 27);
  v332 = __PAIR64__(v317, __ROR4__(v436, 31));
  v331 = v445 ^ v332;
  LODWORD(v332) = v317;
  v333 = v332 >> 2;
  LODWORD(v332) = v331 ^ __ROR4__(v284, 31) ^ __ROR4__(v315, 31);
  v334 = v332;
  HIDWORD(v332) = v332;
  v462 = v332 >> 31;
  HIDWORD(v332) = v330;
  LODWORD(v332) = v330;
  v335 = v462 + v320 + (v333 ^ __ROR4__(v310, 2) ^ v323) - 899497514 + (v332 >> 27);
  v337 = __PAIR64__(v323, __ROR4__(v437, 31));
  v336 = v443 ^ v337;
  LODWORD(v337) = v323;
  v338 = v337 >> 2;
  LODWORD(v337) = v336 ^ __ROR4__(v290, 31) ^ __ROR4__(v321, 31);
  v339 = v337;
  HIDWORD(v337) = v337;
  v340 = v337 >> 31;
  HIDWORD(v337) = v335;
  LODWORD(v337) = v335;
  v341 = v340 + v326 + (v338 ^ __ROR4__(v317, 2) ^ v330) - 899497514 + (v337 >> 27);
  v343 = __PAIR64__(v330, __ROR4__(v328, 31));
  v342 = v455 ^ __ROR4__(v297, 31) ^ __ROR4__(v298, 31) ^ v343;
  LODWORD(v343) = v330;
  v344 = v343 >> 2;
  HIDWORD(v343) = v342;
  LODWORD(v343) = v342;
  v345 = (v343 >> 31) + v333 + (v344 ^ __ROR4__(v323, 2) ^ v335);
  v347 = __PAIR64__(v341, __ROR4__(v334, 31));
  v346 = v441 ^ __ROR4__(v435, 31) ^ __ROR4__(v303, 31) ^ v347;
  LODWORD(v347) = v341;
  v348 = v347 >> 27;
  HIDWORD(v347) = v346;
  LODWORD(v347) = v346;
  v349 = v345 - 899497514 + v348;
  v350 = (v347 >> 31) + v338;
  HIDWORD(v347) = v335;
  LODWORD(v347) = v335;
  v351 = v347 >> 2;
  v352 = __PAIR64__(v349, __ROR4__(v330, 2));
  v353 = v350 + (v351 ^ v352 ^ v341) - 899497514;
  LODWORD(v352) = v349;
  v354 = v353 + (v352 >> 27);
  v356 = __PAIR64__(v341, __ROR4__(v339, 31));
  v355 = v474 ^ __ROR4__(v261, 31) ^ __ROR4__(v309, 31) ^ v356;
  LODWORD(v356) = v341;
  v357 = v356 >> 2;
  HIDWORD(v356) = v355;
  LODWORD(v356) = v355;
  v358 = (v356 >> 31) + v344 + (v357 ^ __ROR4__(v335, 2) ^ v349);
  v360 = __PAIR64__(v354, __ROR4__(v342, 31));
  v359 = v471 ^ __ROR4__(v266, 31) ^ __ROR4__(v315, 31) ^ v360;
  LODWORD(v360) = v354;
  v361 = v360 >> 27;
  HIDWORD(v360) = v359;
  LODWORD(v360) = v359;
  v362 = v358 - 899497514 + v361;
  v363 = (v360 >> 31) + v351;
  HIDWORD(v360) = v349;
  LODWORD(v360) = v349;
  v364 = v360 >> 2;
  v365 = __PAIR64__(v362, __ROR4__(v341, 2));
  v366 = v363 + (v364 ^ v365 ^ v354) - 899497514;
  LODWORD(v365) = v362;
  v367 = v366 + (v365 >> 27);
  v369 = __PAIR64__(v354, __ROR4__(v346, 31));
  v368 = v478 ^ __ROR4__(v272, 31) ^ __ROR4__(v321, 31) ^ v369;
  LODWORD(v369) = v354;
  v370 = v369 >> 2;
  HIDWORD(v369) = v368;
  LODWORD(v369) = v368;
  v371 = (v369 >> 31) + v357 + (v370 ^ __ROR4__(v349, 2) ^ v362);
  v373 = __PAIR64__(v367, __ROR4__(v355, 31));
  v372 = v468 ^ __ROR4__(v279, 31) ^ __ROR4__(v328, 31) ^ v373;
  LODWORD(v373) = v367;
  v374 = v373 >> 27;
  HIDWORD(v373) = v372;
  LODWORD(v373) = v372;
  v375 = v371 - 899497514 + v374;
  v376 = (v373 >> 31) + v364;
  HIDWORD(v373) = v362;
  LODWORD(v373) = v362;
  v377 = v373 >> 2;
  v378 = __PAIR64__(v375, __ROR4__(v354, 2));
  v379 = v376 + (v377 ^ v378 ^ v367) - 899497514;
  LODWORD(v378) = v375;
  v380 = v379 + (v378 >> 27);
  v382 = __PAIR64__(v367, __ROR4__(v359, 31));
  v381 = v465 ^ __ROR4__(v284, 31) ^ __ROR4__(v334, 31) ^ v382;
  LODWORD(v382) = v367;
  v383 = v382 >> 2;
  HIDWORD(v382) = v381;
  LODWORD(v382) = v381;
  v384 = (v382 >> 31) + v370 + (v383 ^ __ROR4__(v362, 2) ^ v375);
  v386 = __PAIR64__(v380, __ROR4__(v368, 31));
  v385 = v452 ^ __ROR4__(v290, 31) ^ __ROR4__(v339, 31) ^ v386;
  LODWORD(v386) = v380;
  v387 = v386 >> 27;
  HIDWORD(v386) = v385;
  LODWORD(v386) = v385;
  v388 = v384 - 899497514 + v387;
  v389 = (v386 >> 31) + v377;
  HIDWORD(v386) = v375;
  LODWORD(v386) = v375;
  v390 = v386 >> 2;
  v391 = __PAIR64__(v388, __ROR4__(v367, 2));
  v392 = v389 + (v390 ^ v391 ^ v380) - 899497514;
  LODWORD(v391) = v388;
  v393 = v392 + (v391 >> 27);
  v395 = __PAIR64__(v380, __ROR4__(v342, 31));
  v394 = v482 ^ __ROR4__(v298, 31) ^ v395;
  LODWORD(v395) = v380;
  v396 = v395 >> 2;
  v397 = v394 ^ __ROR4__(v372, 31);
  HIDWORD(v395) = v397;
  LODWORD(v395) = v397;
  v398 = (v395 >> 31) + v383 + (v396 ^ __ROR4__(v375, 2) ^ v388);
  v400 = __PAIR64__(v393, __ROR4__(v346, 31));
  v399 = v316 ^ __ROR4__(v303, 31) ^ v400;
  LODWORD(v400) = v393;
  v401 = v400 >> 27;
  v402 = v399 ^ __ROR4__(v381, 31);
  HIDWORD(v400) = v402;
  LODWORD(v400) = v402;
  v403 = v398 - 899497514 + v401;
  v404 = (v400 >> 31) + v390;
  HIDWORD(v400) = v388;
  LODWORD(v400) = v388;
  v405 = v400 >> 2;
  v406 = __PAIR64__(v403, __ROR4__(v380, 2));
  v407 = v404 + (v405 ^ v406 ^ v393);
  LODWORD(v406) = v403;
  v408 = v407 - 899497514 + (v406 >> 27);
  v410 = __PAIR64__(v393, __ROR4__(v355, 31));
  v409 = v322 ^ __ROR4__(v309, 31) ^ v410;
  LODWORD(v410) = v393;
  result = (v410 >> 2);
  v412 = v409 ^ __ROR4__(v385, 31);
  HIDWORD(v410) = v412;
  LODWORD(v410) = v412;
  v413 = (v410 >> 31) + v396 + (result ^ __ROR4__(v388, 2) ^ v403);
  v415 = __PAIR64__(v408, __ROR4__(v397, 31));
  v414 = v329 ^ __ROR4__(v315, 31) ^ __ROR4__(v359, 31) ^ v415;
  LODWORD(v415) = v408;
  v416 = v415 >> 27;
  HIDWORD(v415) = v414;
  LODWORD(v415) = v414;
  v417 = v413 - 899497514 + v416;
  v418 = (v415 >> 31) + v405;
  HIDWORD(v415) = v403;
  LODWORD(v415) = v403;
  v419 = v415 >> 2;
  v420 = __PAIR64__(v417, __ROR4__(v393, 2));
  v421 = v418 + (v419 ^ v420 ^ v408);
  LODWORD(v420) = v417;
  v422 = v421 - 899497514 + (v420 >> 27);
  v424 = __PAIR64__(v408, __ROR4__(v402, 31));
  v423 = v462 ^ __ROR4__(v321, 31) ^ __ROR4__(v368, 31) ^ v424;
  LODWORD(v424) = v408;
  v425 = v424 >> 2;
  HIDWORD(v424) = v423;
  LODWORD(v424) = v423;
  v426 = (v424 >> 31) + result + (v425 ^ __ROR4__(v403, 2) ^ v417);
  v428 = __PAIR64__(v422, __ROR4__(v412, 31));
  v427 = v340 ^ __ROR4__(v328, 31) ^ __ROR4__(v372, 31) ^ v428;
  LODWORD(v428) = v422;
  v429 = v428 >> 27;
  HIDWORD(v428) = v427;
  LODWORD(v428) = v427;
  v430 = v426 - 899497514 + v429;
  v431 = v483 + (v428 >> 31) + v419;
  HIDWORD(v428) = v417;
  LODWORD(v428) = v417;
  v432 = v428 >> 2;
  v433 = __PAIR64__(v430, __ROR4__(v408, 2));
  v434 = v431 + (v432 ^ v433 ^ v422) - 899497514;
  LODWORD(v433) = v430;
  *a1 = v434 + (v433 >> 27);
  a1[1] = v430 + v486;
  HIDWORD(v433) = v422;
  LODWORD(v433) = v422;
  a1[2] = (v433 >> 2) + v487;
  a1[3] = v432 + v485;
  a1[4] += v425;
  return result;
}

double fr_SHA1Init(uint64_t a1)
{
  double result;

  *(_OWORD *)a1 = xmmword_206472F70;
  *(_DWORD *)(a1 + 24) = 0;
  *(_QWORD *)&result = 3285377520;
  *(_QWORD *)(a1 + 16) = 3285377520;
  return result;
}

double fr_SHA1FinalNoLen(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t i;
  double result;

  v2 = 0;
  for (i = 0; i != 20; ++i)
  {
    *(_BYTE *)(a1 + i) = *(_DWORD *)(a2 + (i & 0xFFFFFFFC)) >> (~(_BYTE)v2 & 0x18);
    v2 += 8;
  }
  result = 0.0;
  *(_OWORD *)(a2 + 76) = 0u;
  *(_OWORD *)(a2 + 60) = 0u;
  *(_OWORD *)(a2 + 44) = 0u;
  *(_OWORD *)(a2 + 28) = 0u;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 20) = 0;
  return result;
}

__CFDictionary *EAPClientConfigurationCopyShareable(const __CFDictionary *a1)
{
  const __CFArray *v2;
  const __CFArray *v3;
  CFMutableArrayRef MutableCopy;
  CFTypeID TypeID;
  CFIndex Count;
  CFIndex v7;
  const void *ValueAtIndex;
  CFTypeID v9;
  NSObject *v10;
  os_log_type_t v11;
  NSObject *LogHandle;
  os_log_type_t v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  __CFDictionary *v17;
  const __CFDictionary *v19;
  int v20;
  int v21;
  NSObject *v22;
  os_log_type_t v23;
  const char *v24;
  __CFDictionary *v25;
  __SecIdentity *v26;
  const void *EAP;
  const void *v28;
  OSStatus v29;
  OSStatus v30;
  NSObject *v31;
  os_log_type_t v32;
  const char *v33;
  NSObject *v34;
  os_log_type_t v35;
  __CFArray *Mutable;
  CFArrayRef v37;
  OSStatus v38;
  CFDataRef v39;
  CFDataRef v40;
  const void *v41;
  const __CFDictionary *v42;
  CFMutableDictionaryRef v43;
  const void *v44;
  const void *v45;
  const __CFDictionary *v46;
  const void *v47;
  const void *v48;
  const void *v49;
  const void *v50;
  CFMutableDictionaryRef v51;
  NSObject *v52;
  os_log_type_t v53;
  const char *v54;
  NSObject *v55;
  os_log_type_t v56;
  uint32_t v57;
  NSObject *v58;
  os_log_type_t v59;
  int v60;
  int v61;
  NSObject *v62;
  os_log_type_t v63;
  CFIndex CertificateCount;
  uint64_t v65;
  CFIndex i;
  __SecCertificate *CertificateAtIndex;
  NSObject *v68;
  os_log_type_t v69;
  CFDataRef value;
  __CFDictionary *v71;
  CFMutableArrayRef v72;
  __CFDictionary *v73;
  __CFArray *v74;
  CFDataRef v75;
  CFMutableDictionaryRef v76;
  const void *v77;
  SecKeyRef privateKeyRef;
  SecIdentityRef identityRef;
  int v80;
  SecTrustRef trust;
  const void *v82;
  CFArrayRef v83;
  uint8_t buf[8];
  const void *valuePtr[2];

  valuePtr[1] = *(const void **)MEMORY[0x24BDAC8D0];
  v72 = 0;
  v73 = 0;
  v71 = 0;
  if (a1)
  {
    v2 = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("AcceptEAPTypes"));
    if (!v2)
      goto LABEL_27;
    v3 = v2;
    if (!CFArrayGetCount(v2))
      goto LABEL_27;
    MutableCopy = CFArrayCreateMutableCopy(0, 0, v3);
    v72 = MutableCopy;
    TypeID = CFArrayGetTypeID();
    if (!MutableCopy || CFGetTypeID(MutableCopy) != TypeID)
      goto LABEL_24;
    Count = CFArrayGetCount(MutableCopy);
    if (Count >= 1)
    {
      v7 = 0;
      do
      {
        LODWORD(valuePtr[0]) = 0;
        ValueAtIndex = CFArrayGetValueAtIndex(MutableCopy, v7);
        v9 = CFNumberGetTypeID();
        if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != v9)
          goto LABEL_24;
        if (CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberIntType, valuePtr) == 1
          && (LODWORD(valuePtr[0]) > 0x2B || ((1 << SLOBYTE(valuePtr[0])) & 0x80002202000) == 0))
        {
          CFArrayRemoveValueAtIndex(MutableCopy, v7);
          --Count;
          --v7;
        }
      }
      while (++v7 < Count);
    }
    if (!Count)
    {
LABEL_24:
      LogHandle = EAPLogGetLogHandle();
      v13 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v13))
      {
LABEL_27:
        v17 = 0;
LABEL_28:
        my_CFRelease((const void **)&v72);
        my_CFRelease((const void **)&v73);
        my_CFRelease((const void **)&v71);
        return v17;
      }
      LOWORD(valuePtr[0]) = 0;
      v14 = "EAP types are not shareable";
LABEL_26:
      _os_log_impl(&dword_206440000, LogHandle, v13, v14, (uint8_t *)valuePtr, 2u);
      goto LABEL_27;
    }
    if (my_CFDictionaryGetBooleanValue(a1, CFSTR("OneTimeUserPassword"), 0))
    {
      v10 = EAPLogGetLogHandle();
      v11 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v10, v11))
      {
        LOWORD(valuePtr[0]) = 0;
        _os_log_impl(&dword_206440000, v10, v11, "EAP Configuration has \"OneTimePassword\" Enabled", (uint8_t *)valuePtr, 2u);
      }
      LogHandle = EAPLogGetLogHandle();
      v13 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v13))
        goto LABEL_27;
      LOWORD(valuePtr[0]) = 0;
      v14 = "EAP configuration is not shareable";
      goto LABEL_26;
    }
    v19 = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("TLSIdentityHandle"));
    if (!v19)
    {
      v25 = 0;
      goto LABEL_39;
    }
    privateKeyRef = 0;
    identityRef = 0;
    v76 = 0;
    v77 = 0;
    v75 = 0;
    v20 = EAPSecIdentityHandleCreateSecIdentity(v19, &identityRef);
    if (v20)
    {
      v21 = v20;
      v22 = EAPLogGetLogHandle();
      v23 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v22, v23))
      {
LABEL_35:
        v71 = 0;
LABEL_36:
        LogHandle = EAPLogGetLogHandle();
        v13 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(LogHandle, v13))
          goto LABEL_27;
        LOWORD(valuePtr[0]) = 0;
        v14 = "Failed to get identity from identity handle";
        goto LABEL_26;
      }
      LODWORD(valuePtr[0]) = 67109120;
      HIDWORD(valuePtr[0]) = v21;
      v24 = "EAPSecIdentityHandleCreateSecIdentity() failed: (%d)";
LABEL_34:
      _os_log_impl(&dword_206440000, v22, v23, v24, (uint8_t *)valuePtr, 8u);
      goto LABEL_35;
    }
    v26 = identityRef;
    if (!identityRef)
    {
      v22 = EAPLogGetLogHandle();
      v23 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v22, v23))
        goto LABEL_35;
      valuePtr[0] = (const void *)67109120;
      v24 = "Failed to find identity in the keychain: (%d)";
      goto LABEL_34;
    }
    valuePtr[0] = 0;
    v83 = 0;
    trust = 0;
    v80 = 0;
    v74 = 0;
    EAP = (const void *)SecPolicyCreateEAP();
    v82 = EAP;
    if (EAP)
    {
      v28 = EAP;
      v29 = SecIdentityCopyCertificate(v26, (SecCertificateRef *)valuePtr);
      if (v29)
      {
        v30 = v29;
        v31 = EAPLogGetLogHandle();
        v32 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v31, v32))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v30;
          v33 = "SecIdentityCopyCertificate failed: (%d)";
LABEL_54:
          _os_log_impl(&dword_206440000, v31, v32, v33, buf, 8u);
          goto LABEL_55;
        }
        goto LABEL_55;
      }
      v37 = CFArrayCreate(0, valuePtr, 1, MEMORY[0x24BDBD690]);
      v83 = v37;
      my_CFRelease(valuePtr);
      v30 = SecTrustCreateWithCertificates(v37, v28, &trust);
      my_CFRelease((const void **)&v83);
      if (v30)
      {
        v31 = EAPLogGetLogHandle();
        v32 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v31, v32))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v30;
          v33 = "SecTrustCreateWithCertificates failed: (%d)";
          goto LABEL_54;
        }
LABEL_55:
        Mutable = 0;
        goto LABEL_56;
      }
      v60 = EAPTLSSecTrustEvaluate(trust, (SecTrustResultType *)&v80);
      if (v60)
      {
        v61 = v60;
        v62 = EAPLogGetLogHandle();
        v63 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v62, v63))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v61;
          _os_log_impl(&dword_206440000, v62, v63, "SecTrustEvaluate failed: (%d)", buf, 8u);
        }
      }
      CertificateCount = SecTrustGetCertificateCount(trust);
      if (CertificateCount)
      {
        v65 = CertificateCount;
        Mutable = CFArrayCreateMutable(0, CertificateCount, MEMORY[0x24BDBD690]);
        if (v65 >= 1)
        {
          for (i = 0; i != v65; ++i)
          {
            *(_QWORD *)buf = 0;
            CertificateAtIndex = SecTrustGetCertificateAtIndex(trust, i);
            *(_QWORD *)buf = SecCertificateCopyData(CertificateAtIndex);
            CFArrayAppendValue(Mutable, *(const void **)buf);
            my_CFRelease((const void **)buf);
          }
        }
        v30 = 0;
        v74 = Mutable;
      }
      else
      {
        v68 = EAPLogGetLogHandle();
        v69 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v68, v69))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_206440000, v68, v69, "SecTrustGetCertificateCount returned 0", buf, 2u);
        }
        Mutable = 0;
        v30 = -50;
      }
    }
    else
    {
      v34 = EAPLogGetLogHandle();
      v35 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v34, v35))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_206440000, v34, v35, "SecPolicyCreateEAP failed", buf, 2u);
      }
      Mutable = 0;
      v30 = 0;
    }
LABEL_56:
    my_CFRelease((const void **)&trust);
    my_CFRelease(&v82);
    if (v30 || !Mutable)
    {
      v52 = EAPLogGetLogHandle();
      v53 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v52, v53))
        goto LABEL_86;
      LODWORD(valuePtr[0]) = 67109120;
      HIDWORD(valuePtr[0]) = v30;
      v54 = "Failed to get a certificate chain from identity: (%d)";
    }
    else
    {
      v38 = SecIdentityCopyPrivateKey(identityRef, &privateKeyRef);
      if (!v38 && privateKeyRef)
      {
        v39 = SecKeyCopyExternalRepresentation(privateKeyRef, 0);
        v75 = v39;
        if (v39)
        {
          v40 = v39;
          v41 = (const void *)MEMORY[0x20BCF59AC](privateKeyRef);
          v77 = v41;
          if (v41)
          {
            v42 = (const __CFDictionary *)v41;
            value = v40;
            v43 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            v76 = v43;
            v44 = (const void *)*MEMORY[0x24BDE9028];
            v45 = CFDictionaryGetValue(v42, (const void *)*MEMORY[0x24BDE9028]);
            v46 = v42;
            v47 = (const void *)*MEMORY[0x24BDE9050];
            v48 = CFDictionaryGetValue(v46, (const void *)*MEMORY[0x24BDE9050]);
            if (v45 && v48)
            {
              v49 = v45;
              v50 = v48;
              CFDictionaryAddValue(v43, v44, v49);
              CFDictionaryAddValue(v43, v47, v50);
              v51 = v43;
              v25 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
              CFDictionaryAddValue(v25, CFSTR("certificates"), Mutable);
              CFDictionaryAddValue(v25, CFSTR("key"), value);
              CFDictionaryAddValue(v25, CFSTR("attributes"), v51);
              goto LABEL_87;
            }
            v58 = EAPLogGetLogHandle();
            v59 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v58, v59))
            {
              LOWORD(valuePtr[0]) = 0;
              v54 = "Failed to find class and/or type item attributes for private key";
              goto LABEL_84;
            }
LABEL_86:
            v25 = 0;
LABEL_87:
            my_CFRelease((const void **)&identityRef);
            my_CFRelease(&v77);
            my_CFRelease((const void **)&v76);
            my_CFRelease((const void **)&v74);
            my_CFRelease((const void **)&privateKeyRef);
            my_CFRelease((const void **)&v74);
            my_CFRelease((const void **)&v75);
            v71 = v25;
            if (!v25)
              goto LABEL_36;
LABEL_39:
            v73 = CFDictionaryCreateMutableCopy(0, 0, a1);
            CFDictionaryRemoveValue(v73, CFSTR("TLSIdentityHandle"));
            CFDictionarySetValue(v73, CFSTR("AcceptEAPTypes"), MutableCopy);
            v17 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            CFDictionaryAddValue(v17, CFSTR("EAPClientConfiguration"), v73);
            if (v25)
              CFDictionaryAddValue(v17, CFSTR("TLSShareableIdentityInfo"), v25);
            goto LABEL_28;
          }
          v58 = EAPLogGetLogHandle();
          v59 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v58, v59))
            goto LABEL_86;
          LOWORD(valuePtr[0]) = 0;
          v54 = "Failed to get all the keychain item attributes for private key";
        }
        else
        {
          v58 = EAPLogGetLogHandle();
          v59 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v58, v59))
            goto LABEL_86;
          LOWORD(valuePtr[0]) = 0;
          v54 = "Failed to get an external representation of private key";
        }
LABEL_84:
        v55 = v58;
        v56 = v59;
        v57 = 2;
        goto LABEL_85;
      }
      v52 = EAPLogGetLogHandle();
      v53 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v52, v53))
        goto LABEL_86;
      LODWORD(valuePtr[0]) = 67109120;
      HIDWORD(valuePtr[0]) = v38;
      v54 = "Failed to get a private key from identity: (%d)";
    }
    v55 = v52;
    v56 = v53;
    v57 = 8;
LABEL_85:
    _os_log_impl(&dword_206440000, v55, v56, v54, (uint8_t *)valuePtr, v57);
    goto LABEL_86;
  }
  v15 = EAPLogGetLogHandle();
  v16 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v15, v16))
  {
    LOWORD(valuePtr[0]) = 0;
    _os_log_impl(&dword_206440000, v15, v16, "Invalid parameters", (uint8_t *)valuePtr, 2u);
  }
  return 0;
}

__CFDictionary *EAPClientConfigurationCopyAndImport(const void *a1)
{
  CFTypeID TypeID;
  const void *Value;
  CFTypeID v4;
  const void *v5;
  CFTypeID v6;
  const void *v7;
  CFTypeID v8;
  CFIndex Count;
  unint64_t v10;
  const void *v11;
  CFTypeID v12;
  const void *v13;
  CFTypeID v14;
  const __CFAllocator *v15;
  const __CFData *ValueAtIndex;
  const void *v17;
  const void *v18;
  __CFDictionary *Mutable;
  const void *v20;
  const void *v21;
  const void *v22;
  const void *v23;
  OSStatus v24;
  OSStatus v25;
  NSObject *v26;
  os_log_type_t v27;
  OSStatus v28;
  OSStatus v29;
  NSObject *v30;
  os_log_type_t v31;
  const char *v32;
  NSObject *LogHandle;
  os_log_type_t v34;
  const char *v35;
  __CFDictionary *MutableCopy;
  NSObject *v38;
  os_log_type_t v39;
  const char *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  NSObject *v44;
  os_log_type_t v45;
  uint32_t v46;
  CFIndex v47;
  const __CFData *v48;
  SecCertificateRef v49;
  OSStatus v50;
  OSStatus v51;
  NSObject *v52;
  os_log_type_t v53;
  NSObject *v54;
  os_log_type_t v55;
  const char *v56;
  uint32_t v57;
  NSObject *v58;
  os_log_type_t v59;
  NSObject *v60;
  os_log_type_t v61;
  CFTypeRef v62;
  CFTypeRef v63;
  uint8_t v64[8];
  CFTypeRef result;
  const void *v66;
  SecKeyRef v67;
  uint8_t v68[8];
  uint8_t v69[4];
  OSStatus v70;
  uint8_t buf[8];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  TypeID = CFDictionaryGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID)
  {
    LogHandle = EAPLogGetLogHandle();
    v34 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v34))
    {
      *(_WORD *)v68 = 0;
      v35 = "Invalid parameters";
LABEL_28:
      _os_log_impl(&dword_206440000, LogHandle, v34, v35, v68, 2u);
    }
    return 0;
  }
  Value = CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("EAPClientConfiguration"));
  v4 = CFDictionaryGetTypeID();
  if (!Value || CFGetTypeID(Value) != v4)
  {
    LogHandle = EAPLogGetLogHandle();
    v34 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v34))
    {
      *(_WORD *)v68 = 0;
      v35 = "Missing EAP Configuration dictionary";
      goto LABEL_28;
    }
    return 0;
  }
  v5 = CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("TLSShareableIdentityInfo"));
  v6 = CFDictionaryGetTypeID();
  if (!v5 || CFGetTypeID(v5) != v6)
    return (__CFDictionary *)CFRetain(Value);
  v63 = 0;
  v66 = 0;
  v67 = 0;
  result = 0;
  v7 = CFDictionaryGetValue((CFDictionaryRef)v5, CFSTR("certificates"));
  v8 = CFArrayGetTypeID();
  if (!v7 || CFGetTypeID(v7) != v8)
  {
    v38 = EAPLogGetLogHandle();
    v39 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v38, v39))
    {
LABEL_35:
      LogHandle = EAPLogGetLogHandle();
      v34 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v34))
        return 0;
      *(_WORD *)v68 = 0;
      v35 = "Failed to create shareable identity handle from shareable identity info";
      goto LABEL_28;
    }
    *(_WORD *)v64 = 0;
    v40 = "Failed to get certitifate array";
LABEL_34:
    _os_log_impl(&dword_206440000, v38, v39, v40, v64, 2u);
    goto LABEL_35;
  }
  Count = CFArrayGetCount((CFArrayRef)v7);
  if (Count <= 0)
  {
    v38 = EAPLogGetLogHandle();
    v39 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v38, v39))
      goto LABEL_35;
    *(_WORD *)v64 = 0;
    v40 = "Failed to get valid certitifate array";
    goto LABEL_34;
  }
  v10 = Count;
  v11 = CFDictionaryGetValue((CFDictionaryRef)v5, CFSTR("key"));
  v12 = CFDataGetTypeID();
  if (!v11 || CFGetTypeID(v11) != v12)
  {
    v38 = EAPLogGetLogHandle();
    v39 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v38, v39))
      goto LABEL_35;
    *(_WORD *)v64 = 0;
    v40 = "Failed to get key data";
    goto LABEL_34;
  }
  v13 = CFDictionaryGetValue((CFDictionaryRef)v5, CFSTR("attributes"));
  v14 = CFDictionaryGetTypeID();
  if (!v13 || CFGetTypeID(v13) != v14)
  {
    v38 = EAPLogGetLogHandle();
    v39 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v38, v39))
      goto LABEL_35;
    *(_WORD *)v64 = 0;
    v40 = "Failed to get attributes dictionary";
    goto LABEL_34;
  }
  v15 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex((CFArrayRef)v7, 0);
  *(_QWORD *)v68 = SecCertificateCreateWithData(v15, ValueAtIndex);
  if (!*(_QWORD *)v68)
  {
    v41 = EAPLogGetLogHandle();
    v42 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v41, v42))
      goto LABEL_69;
    *(_WORD *)v64 = 0;
    v32 = "SecCertificateCreateWithData returned NULL";
LABEL_49:
    v43 = v64;
    v44 = v41;
    v45 = v42;
    v46 = 2;
LABEL_50:
    _os_log_impl(&dword_206440000, v44, v45, v32, v43, v46);
    goto LABEL_69;
  }
  v67 = SecKeyCreateWithData((CFDataRef)v11, (CFDictionaryRef)v13, 0);
  if (!v67)
  {
    v41 = EAPLogGetLogHandle();
    v42 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v41, v42))
      goto LABEL_69;
    *(_WORD *)v64 = 0;
    v32 = "SecKeyCreateWithData returned NULL";
    goto LABEL_49;
  }
  v17 = (const void *)SecIdentityCreate();
  v66 = v17;
  if (!v17)
  {
    v41 = EAPLogGetLogHandle();
    v42 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v41, v42))
      goto LABEL_69;
    *(_WORD *)v64 = 0;
    v32 = "SecIdentityCreate returned NULL";
    goto LABEL_49;
  }
  v18 = v17;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *(_QWORD *)v64 = Mutable;
  v20 = (const void *)*MEMORY[0x24BDE8F50];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8F50], CFSTR("com.apple.identities"));
  v21 = (const void *)*MEMORY[0x24BDBD270];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9538], (const void *)*MEMORY[0x24BDBD270]);
  v22 = (const void *)*MEMORY[0x24BDE9560];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9560], v18);
  v23 = (const void *)*MEMORY[0x24BDE94D0];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE94D0], v21);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8F60], (const void *)*MEMORY[0x24BDE8F88]);
  v24 = SecItemAdd(Mutable, &result);
  if (v24)
  {
    v25 = v24;
    if (v24 != -25299)
    {
      v30 = EAPLogGetLogHandle();
      v31 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v30, v31))
        goto LABEL_69;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v25;
      v32 = "Failed to store identity in keychain (%d)";
      goto LABEL_65;
    }
    v26 = EAPLogGetLogHandle();
    v27 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v26, v27))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206440000, v26, v27, "The identity already exists in keychain", buf, 2u);
    }
    v28 = SecItemCopyMatching(Mutable, &result);
    if (v28)
    {
      v29 = v28;
      v30 = EAPLogGetLogHandle();
      v31 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v30, v31))
        goto LABEL_69;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v29;
      v32 = "Failed to get persistent reference for identity in keychain (%d)";
LABEL_65:
      v43 = buf;
      v44 = v30;
      v45 = v31;
      v46 = 8;
      goto LABEL_50;
    }
  }
  CFDictionarySetValue(Mutable, v20, CFSTR("com.apple.certificates"));
  CFDictionaryRemoveValue(Mutable, v23);
  if (v10 < 2)
    goto LABEL_68;
  v47 = 1;
  while (1)
  {
    v48 = (const __CFData *)CFArrayGetValueAtIndex((CFArrayRef)v7, v47);
    *(_QWORD *)buf = 0;
    v49 = SecCertificateCreateWithData(v15, v48);
    *(_QWORD *)buf = v49;
    if (!v49)
      break;
    CFDictionarySetValue(Mutable, v22, v49);
    v50 = SecItemAdd(Mutable, 0);
    if (v50)
    {
      v51 = v50;
      if (v50 == -25299)
      {
        v52 = EAPLogGetLogHandle();
        v53 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v52, v53))
        {
          *(_WORD *)v69 = 0;
          v54 = v52;
          v55 = v53;
          v56 = "The anchor certificate already exists in keychain";
          v57 = 2;
LABEL_60:
          _os_log_impl(&dword_206440000, v54, v55, v56, v69, v57);
        }
      }
      else
      {
        v58 = EAPLogGetLogHandle();
        v59 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v58, v59))
        {
          *(_DWORD *)v69 = 67109120;
          v70 = v51;
          v54 = v58;
          v55 = v59;
          v56 = "Failed to store anchor certificate in keychain (%d)";
          v57 = 8;
          goto LABEL_60;
        }
      }
    }
    my_CFRelease((const void **)buf);
    if (v10 == ++v47)
      goto LABEL_68;
  }
  v60 = EAPLogGetLogHandle();
  v61 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v60, v61))
  {
    *(_WORD *)v69 = 0;
    _os_log_impl(&dword_206440000, v60, v61, "SecCertificateCreateWithData returned NULL anchor certificate", v69, 2u);
  }
LABEL_68:
  my_CFRelease((const void **)v64);
LABEL_69:
  my_CFRelease((const void **)&v67);
  my_CFRelease((const void **)v68);
  my_CFRelease(&v66);
  v62 = result;
  v63 = result;
  if (!result)
    goto LABEL_35;
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)Value);
  CFDictionaryAddValue(MutableCopy, CFSTR("TLSIdentityHandle"), v62);
  my_CFRelease(&v63);
  return MutableCopy;
}

uint64_t eapol_socket(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  NSObject *LogHandle;
  os_log_type_t v7;
  int *v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  int *v12;
  char *v13;
  int *v14;
  char *v15;
  void *v16;
  uint64_t v17;
  int *v18;
  char *v19;
  unsigned int v20;
  int v21;
  int *v22;
  char *v23;
  int *v24;
  int *v25;
  char *v26;
  int *v27;
  int v29;
  int v30;
  uint8_t buf[4];
  char *v32;
  _BYTE v33[24];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v30 = -2000189298;
  v29 = 1;
  memset(v33, 0, 18);
  v3 = socket(27, 3, 0);
  if ((v3 & 0x80000000) != 0)
  {
    LogHandle = EAPLogGetLogHandle();
    v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v7))
    {
      v8 = __error();
      v9 = strerror(*v8);
      *(_DWORD *)buf = 136315138;
      v32 = v9;
      _os_log_impl(&dword_206440000, LogHandle, v7, "socket() failed: %s", buf, 0xCu);
    }
    goto LABEL_11;
  }
  v4 = v3;
  __strlcpy_chk();
  *(_WORD *)v33 = 6930;
  if (bind(v4, (const sockaddr *)v33, 0x12u) < 0)
  {
    v10 = EAPLogGetLogHandle();
    v11 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = __error();
      v13 = strerror(*v12);
      *(_DWORD *)buf = 136315138;
      v32 = v13;
      _os_log_impl(&dword_206440000, v10, v11, "bind() failed: %s", buf, 0xCu);
    }
    close(v4);
LABEL_11:
    syslog(5, "eapol_socket: ndrv_socket failed");
    return 0xFFFFFFFFLL;
  }
  if (ioctl(v4, 0x8004667EuLL, &v29) < 0)
  {
    v14 = __error();
    strerror(*v14);
    syslog(5, "eapol_socket: FIONBIO failed, %s");
LABEL_20:
    close(v4);
    return 0xFFFFFFFFLL;
  }
  if ((a2 & 1) != 0)
  {
    v5 = 2;
  }
  else
  {
    *(_QWORD *)&v33[2] = 0x600060000;
    *(_DWORD *)&v33[14] = 0;
    *(_WORD *)&v33[18] = 0;
    *(_WORD *)v33 = 4628;
    *(_WORD *)&v33[12] = 768;
    *(_DWORD *)&v33[8] = 12746753;
    if (setsockopt(v4, 0, 5, v33, 0x14u) < 0)
    {
      v25 = __error();
      v26 = strerror(*v25);
      syslog(5, "setsockopt(NDRV_ADDMULTICAST) failed: %s", v26);
      v27 = __error();
      strerror(*v27);
      syslog(5, "eapol_socket: ndrv_socket_add_multicast failed, %s");
      goto LABEL_20;
    }
    v5 = 1;
  }
  *(_QWORD *)&v33[8] = 0;
  v15 = (char *)malloc_type_malloc(32 * v5, 0x1000040E0EAB150uLL);
  v16 = v15;
  v17 = 0;
  *(_QWORD *)v33 = 0x8021EC00000001;
  *(_DWORD *)&v33[8] = v5;
  *(_QWORD *)&v33[16] = v15;
  v18 = &v30;
  do
  {
    v19 = &v15[v17];
    v20 = *(unsigned __int16 *)v18;
    v18 = (int *)((char *)v18 + 2);
    *(_DWORD *)v19 = 131076;
    *((_WORD *)v19 + 2) = bswap32(v20) >> 16;
    v17 += 32;
  }
  while (32 * v5 != v17);
  v21 = setsockopt(v4, 0, 4, v33, 0x18u);
  free(v16);
  if (v21 < 0)
  {
    v22 = __error();
    v23 = strerror(*v22);
    syslog(5, "setsockopt(NDRV_SETDMXSPEC) failed: %s", v23);
    v24 = __error();
    strerror(*v24);
    syslog(5, "eapol_socket: ndrv_socket_bind failed, %s");
    goto LABEL_20;
  }
  return v4;
}

const char *EAPOLPacketTypeStr(unsigned int a1)
{
  if (a1 > 4)
    return "<unknown>";
  else
    return EAPOLPacketTypeStr_str[a1];
}

uint64_t EAPOLPacketIsValid(unsigned __int8 *a1, uint64_t a2, CFMutableStringRef theString)
{
  int v4;
  uint64_t v6;
  const char *v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t IsValid;
  uint64_t v13;
  unsigned int v14;
  unint64_t v15;
  const char *v16;
  uint64_t v17;
  __CFString *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a2;
  if (a2 <= 3)
  {
    if (theString)
      CFStringAppendFormat(theString, 0, CFSTR("EAPOLPacket truncated header %d < %d\n"), a2, 4);
    return 0;
  }
  if (theString)
  {
    v6 = a1[1];
    if (v6 > 4)
      v7 = "<unknown>";
    else
      v7 = EAPOLPacketTypeStr_str[a1[1]];
    CFStringAppendFormat(theString, 0, CFSTR("EAPOL: proto version 0x%x type %s (%d) length %d\n"), *a1, v7, v6, bswap32(*((unsigned __int16 *)a1 + 1)) >> 16);
    v8 = *((unsigned __int16 *)a1 + 1);
    v10 = __rev16(v8);
    v9 = v4 - 4;
    if (v4 - 4 < bswap32(v8) >> 16)
    {
      CFStringAppendFormat(theString, 0, CFSTR("EAPOLPacket truncated %d < %d\n"), (v4 - 4), v10);
      return 0;
    }
  }
  else
  {
    v8 = *((unsigned __int16 *)a1 + 1);
    v9 = a2 - 4;
    if ((int)a2 - 4 < bswap32(v8) >> 16)
      return 0;
    v10 = __rev16(v8);
  }
  IsValid = 1;
  switch(a1[1])
  {
    case 0u:
      IsValid = EAPPacketIsValid(a1 + 4, v10, theString);
      goto LABEL_37;
    case 1u:
    case 2u:
    case 4u:
      goto LABEL_37;
    case 3u:
      if (v8)
      {
        v13 = a1[4];
        if ((_DWORD)v13 == 254 || (_DWORD)v13 == 2)
        {
          if (v10 > 0x5E)
          {
            v14 = *(unsigned __int16 *)(a1 + 97);
            v15 = __rev16(v14);
            if ((unint64_t)v10 - 95 >= v15)
            {
              if (!theString)
                return 1;
              v20 = bswap32(*(unsigned __int16 *)(a1 + 7)) >> 16;
              v21 = bswap32(*(unsigned __int16 *)(a1 + 5)) >> 16;
              CFStringAppendFormat(theString, 0, CFSTR("EAPOL Key Descriptor: type IEEE 802.11 (%d)\n"), a1[4]);
              CFStringAppendFormat(theString, 0, CFSTR("%-18s0x%04x\n"), "key_information:", v21);
              CFStringAppendFormat(theString, 0, CFSTR("%-18s%d\n"), "key_length:", v20);
              CFStringAppendFormat(theString, 0, CFSTR("%-18s"), "replay_counter:");
              print_bytes_cfstr(theString, (uint64_t)(a1 + 9), 8);
              CFStringAppendFormat(theString, 0, CFSTR("\n"));
              CFStringAppendFormat(theString, 0, CFSTR("%-18s"), "key_nonce:");
              print_bytes_cfstr(theString, (uint64_t)(a1 + 17), 32);
              CFStringAppendFormat(theString, 0, CFSTR("\n"));
              CFStringAppendFormat(theString, 0, CFSTR("%-18s"), "EAPOL_key_IV:");
              print_bytes_cfstr(theString, (uint64_t)(a1 + 49), 16);
              CFStringAppendFormat(theString, 0, CFSTR("\n"));
              CFStringAppendFormat(theString, 0, CFSTR("%-18s"), "key_RSC:");
              print_bytes_cfstr(theString, (uint64_t)(a1 + 65), 8);
              CFStringAppendFormat(theString, 0, CFSTR("\n"));
              CFStringAppendFormat(theString, 0, CFSTR("%-18s"), "key_reserved:");
              print_bytes_cfstr(theString, (uint64_t)(a1 + 73), 8);
              CFStringAppendFormat(theString, 0, CFSTR("\n"));
              CFStringAppendFormat(theString, 0, CFSTR("%-18s"), "key_MIC:");
              print_bytes_cfstr(theString, (uint64_t)(a1 + 81), 16);
              CFStringAppendFormat(theString, 0, CFSTR("\n"));
              CFStringAppendFormat(theString, 0, CFSTR("%-18s%d\n"), "key_data_length:", v15);
              if (!v14)
                goto LABEL_18;
              CFStringAppendFormat(theString, 0, CFSTR("%-18s"), "key_data:");
              v17 = (uint64_t)(a1 + 99);
              v18 = theString;
              v19 = v15;
              goto LABEL_49;
            }
            if (!theString)
              return 0;
            CFStringAppendFormat(theString, 0, CFSTR("%s(IEEE80211) Key Data truncated %d < %d\n"), "EAPOLKeyDescriptor", (v10 - 95), v15);
          }
          else
          {
            if (!theString)
              return 0;
            CFStringAppendFormat(theString, 0, CFSTR("%s(IEEE80211) length %d < %d\n"), "EAPOLKeyDescriptor", v10, 95);
          }
        }
        else
        {
          if ((_DWORD)v13 == 1)
          {
            if (v10 <= 0x2B)
            {
              if (!theString)
                return 0;
              CFStringAppendFormat(theString, 0, CFSTR("%s(RC4) length %d < %d\n"), "EAPOLKeyDescriptor", v10, 44);
              goto LABEL_36;
            }
            if (!theString)
              return IsValid;
            if ((a1[31] & 0x80u) != 0)
              v16 = "Unicast";
            else
              v16 = "Broadcast";
            CFStringAppendFormat(theString, 0, CFSTR("EAPOL Key Descriptor: type RC4 (%d) length %d %s index %d\n"), v13, bswap32(*(unsigned __int16 *)(a1 + 5)) >> 16, v16, a1[31] & 0x7F);
            CFStringAppendFormat(theString, 0, CFSTR("%-16s"), "replay_counter:");
            print_bytes_cfstr(theString, (uint64_t)(a1 + 7), 8);
            CFStringAppendFormat(theString, 0, CFSTR("\n"));
            CFStringAppendFormat(theString, 0, CFSTR("%-16s"), "key_IV:");
            print_bytes_cfstr(theString, (uint64_t)(a1 + 15), 16);
            CFStringAppendFormat(theString, 0, CFSTR("\n"));
            CFStringAppendFormat(theString, 0, CFSTR("%-16s"), "key_signature:");
            print_bytes_cfstr(theString, (uint64_t)(a1 + 32), 16);
            CFStringAppendFormat(theString, 0, CFSTR("\n"));
            if ((_DWORD)v10 == 44)
            {
LABEL_18:
              IsValid = 1;
              goto LABEL_37;
            }
            CFStringAppendFormat(theString, 0, CFSTR("%-16s"), "key:");
            v17 = (uint64_t)(a1 + 48);
            v18 = theString;
            v19 = v10 - 44;
LABEL_49:
            print_bytes_cfstr(v18, v17, v19);
            CFStringAppendFormat(theString, 0, CFSTR("\n"));
            goto LABEL_18;
          }
          if (!theString)
            return 0;
          CFStringAppendFormat(theString, 0, CFSTR("%s Type %d unrecognized\n"), "EAPOLKeyDescriptor", v13, v24);
        }
      }
      else
      {
        if (!theString)
          return 0;
        CFStringAppendFormat(theString, 0, CFSTR("EAPOLPacket empty body\n"), v22, v23, v24);
      }
LABEL_36:
      IsValid = 0;
LABEL_37:
      if (theString && v9 > v10)
      {
        CFStringAppendFormat(theString, 0, CFSTR("EAPOL: %d bytes follow body:\n"), v9 - v10);
        print_data_cfstr(theString, (uint64_t)&a1[v10 + 4], v9 - v10);
      }
      return IsValid;
    default:
      if (!theString)
        return 1;
      CFStringAppendFormat(theString, 0, CFSTR("EAPOLPacket type %d unrecognized\n"), a1[1]);
      print_data_cfstr(theString, (uint64_t)(a1 + 4), v10);
      goto LABEL_18;
  }
}

uint64_t EAPOLPacketValid(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  __CFString *Mutable;
  uint64_t IsValid;

  if (!a3)
    return EAPOLPacketIsValid(a1, a2, 0);
  Mutable = CFStringCreateMutable(0, 0);
  IsValid = EAPOLPacketIsValid(a1, a2, Mutable);
  if (Mutable)
  {
    SCPrint();
    CFRelease(Mutable);
  }
  return IsValid;
}

uint64_t EAPOLPacketSetLength(uint64_t result, unsigned int a2)
{
  *(_WORD *)(result + 2) = __rev16(a2);
  return result;
}

uint64_t EAPOLPacketGetLength(uint64_t a1)
{
  return bswap32(*(unsigned __int16 *)(a1 + 2)) >> 16;
}

uint64_t EAPOLRC4KeyDescriptorSetLength(uint64_t result, unsigned int a2)
{
  *(_WORD *)(result + 1) = __rev16(a2);
  return result;
}

uint64_t EAPOLKeyDescriptorSetLength(uint64_t result, unsigned int a2)
{
  *(_WORD *)(result + 1) = __rev16(a2);
  return result;
}

uint64_t EAPOLRC4KeyDescriptorGetLength(uint64_t a1)
{
  return bswap32(*(unsigned __int16 *)(a1 + 1)) >> 16;
}

uint64_t EAPOLKeyDescriptorGetLength(uint64_t a1)
{
  return bswap32(*(unsigned __int16 *)(a1 + 1)) >> 16;
}

uint64_t EAPOLIEEE80211KeyDescriptorGetLength(uint64_t a1)
{
  return bswap32(*(unsigned __int16 *)(a1 + 3)) >> 16;
}

uint64_t EAPOLIEEE80211KeyDescriptorGetInformation(uint64_t a1)
{
  return bswap32(*(unsigned __int16 *)(a1 + 1)) >> 16;
}

uint64_t EAPOLIEEE80211KeyDescriptorGetKeyDataLength(uint64_t a1)
{
  return bswap32(*(unsigned __int16 *)(a1 + 93)) >> 16;
}

uint64_t EAPSIMAKAPersistentStateGetMasterKey(uint64_t a1)
{
  return a1 + 76;
}

uint64_t EAPSIMAKAPersistentStateGetMasterKeySize(uint64_t a1)
{
  return *(unsigned int *)(a1 + 72);
}

uint64_t EAPSIMAKAPersistentStateGetIMSI(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t EAPSIMAKAPersistentStateGetPseudonym(uint64_t a1, _QWORD *a2)
{
  if (a2)
    *a2 = *(_QWORD *)(a1 + 40);
  return *(_QWORD *)(a1 + 32);
}

BOOL EAPSIMAKAPersistentStateTemporaryUsernameAvailable(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32) || *(_QWORD *)(a1 + 48) != 0;
}

void EAPSIMAKAPersistentStatePurgeTemporaryIDs(uint64_t a1)
{
  EAPSIMAKAPersistentStateSetPseudonymAndTime(a1, 0, 0);
  if (*(_BYTE *)(a1 + 4) == 13)
    my_FieldSetRetainedCFType((const void **)(a1 + 48), 0);
  *(_BYTE *)(a1 + 56) = 0;
  EAPSIMAKAPersistentStateSave(a1, 0);
}

void EAPSIMAKAPersistentStateSetPseudonym(uint64_t a1, const void *a2)
{
  EAPSIMAKAPersistentStateSetPseudonymAndTime(a1, a2, 0);
}

void EAPSIMAKAPersistentStateSetReauthID(uint64_t a1, const void *a2)
{
  if (*(_BYTE *)(a1 + 4) == 13)
    my_FieldSetRetainedCFType((const void **)(a1 + 48), a2);
}

uint64_t EAPSIMAKAPersistentStateSetReauthIDUsed(uint64_t result, char a2)
{
  *(_BYTE *)(result + 56) = a2;
  return result;
}

void EAPSIMAKAPersistentStateSave(uint64_t a1, int a2)
{
  const void *v4;
  __CFDictionary *Mutable;
  CFNumberRef v6;
  CFDataRef v7;
  __CFString *v8;
  int v9;
  NSObject *LogHandle;
  os_log_type_t v11;
  const void *v12;
  CFNumberRef v13;
  const __CFString *v14;
  const __CFString *v15;
  CFMutableDictionaryRef theDict;
  uint8_t buf[4];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  theDict = 0;
  if (*(_BYTE *)(a1 + 4) != 10)
  {
    IMSIListRemoveMatches(*(_DWORD *)a1, (unsigned int (*)(const __CFString *, const void *, uint64_t))IMSIDoesNotMatch, *(_QWORD *)(a1 + 8));
    if (*(_QWORD *)(a1 + 32))
    {
      v4 = *(const void **)(a1 + 40);
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      theDict = Mutable;
      CFDictionarySetValue(Mutable, CFSTR("Pseudonym"), *(const void **)(a1 + 32));
      if (v4)
        CFDictionarySetValue(Mutable, CFSTR("PseudonymStartTime"), v4);
      if (!a2 || !*(_QWORD *)(a1 + 48))
        goto LABEL_20;
      if (Mutable)
      {
LABEL_12:
        v6 = CFNumberCreate(0, kCFNumberSInt16Type, (const void *)(a1 + 28));
        CFDictionarySetValue(Mutable, CFSTR("ReauthCounter"), v6);
        CFRelease(v6);
        CFDictionarySetValue(Mutable, CFSTR("ReauthID"), *(const void **)(a1 + 48));
        if (*(_BYTE *)(a1 + 56))
          CFDictionarySetValue(Mutable, CFSTR("IsReauthIDUsedBefore"), (const void *)*MEMORY[0x24BDBD270]);
        v7 = CFDataCreate(0, (const UInt8 *)(a1 + 76), *(int *)(a1 + 72));
        v8 = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("com.apple.network.%@.master-key.%@"), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8), *(_QWORD *)(a1 + 8));
        if (EAPSecKeychainPasswordItemSet(0, v8, v7))
        {
          v9 = EAPSecKeychainPasswordItemCreateWithAccess(0, 0, v8, 0, 0, 0, v7);
          CFRelease(v8);
          if (v9)
          {
            LogHandle = EAPLogGetLogHandle();
            v11 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(LogHandle, v11))
            {
              *(_DWORD *)buf = 67109120;
              v18 = v9;
              _os_log_impl(&dword_206440000, LogHandle, v11, "Failed to update/create a keychain item: %d", buf, 8u);
            }
          }
        }
        else
        {
          CFRelease(v8);
        }
        CFRelease(v7);
LABEL_20:
        if (Mutable)
        {
          v12 = *(const void **)(a1 + 16);
          if (v12)
          {
            CFDictionarySetValue(Mutable, CFSTR("SSID"), v12);
            v13 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(a1 + 24));
            Mutable = theDict;
            CFDictionarySetValue(theDict, CFSTR("GenerationID"), v13);
            CFRelease(v13);
          }
        }
        goto LABEL_23;
      }
    }
    else
    {
      Mutable = 0;
      if (!a2 || !*(_QWORD *)(a1 + 48))
      {
LABEL_23:
        ProtoInfoChangedCheck(*(_QWORD *)(a1 + 64));
        v14 = (const __CFString *)*MEMORY[0x24BDBD590];
        v15 = (const __CFString *)*MEMORY[0x24BDBD570];
        CFPreferencesSetValue(*(CFStringRef *)(a1 + 8), Mutable, **(CFStringRef **)(a1 + 64), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
        my_CFRelease((const void **)&theDict);
        CFPreferencesSynchronize(**(CFStringRef **)(a1 + 64), v14, v15);
        ProtoInfoNotifyChange();
        return;
      }
    }
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    theDict = Mutable;
    goto LABEL_12;
  }
}

uint64_t EAPSIMAKAPersistentStateGetSSID(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

void EAPSIMAKAPersistentStateSetPseudonymAndTime(uint64_t a1, const void *a2, const void *a3)
{
  CFAbsoluteTime Current;
  CFDateRef v7;

  if (*(_BYTE *)(a1 + 4) != 10)
  {
    my_FieldSetRetainedCFType((const void **)(a1 + 32), a2);
    if (!a2 || a3)
    {
      my_FieldSetRetainedCFType((const void **)(a1 + 40), a3);
    }
    else
    {
      Current = CFAbsoluteTimeGetCurrent();
      v7 = CFDateCreate(0, Current);
      my_FieldSetRetainedCFType((const void **)(a1 + 40), v7);
      if (v7)
        CFRelease(v7);
    }
  }
}

uint64_t EAPSIMAKAPersistentStateGetReauthID(uint64_t a1)
{
  return *(_QWORD *)(a1 + 48);
}

uint64_t EAPSIMAKAPersistentStateGetReauthIDUsed(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 56);
}

uint64_t EAPSIMAKAPersistentStateGetCounter(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 28);
}

uint64_t EAPSIMAKAPersistentStateSetCounter(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 28) = a2;
  return result;
}

void *EAPSIMAKAPersistentStateCreate(int a1, int a2, const __CFString *a3, int a4, const void *a5)
{
  __CFString **v10;
  uint64_t v11;
  void *v12;
  CFPropertyListRef v13;
  CFTypeID TypeID;
  const __CFNumber *v15;
  CFTypeID v16;
  int v17;
  NSObject *LogHandle;
  os_log_type_t v19;
  CFTypeID v20;
  const void *v21;
  const void *v22;
  CFTypeID v23;
  CFTypeID v24;
  const void *Value;
  CFTypeID v26;
  const void *v27;
  CFTypeID v28;
  const void *v29;
  CFTypeID v30;
  const __CFBoolean *v31;
  CFTypeID v32;
  uint64_t v33;
  __CFString *v34;
  int v35;
  const __CFData *v36;
  CFIndex Length;
  NSObject *v38;
  os_log_type_t v39;
  const __CFData *v41;
  int valuePtr;
  const void *v43;
  uint8_t buf[8];
  uint8_t v45[4];
  int v46;
  uint64_t v47;
  CFRange v48;

  v47 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    LogHandle = EAPLogGetLogHandle();
    v19 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v19))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206440000, LogHandle, v19, "imsi is NULL", buf, 2u);
    }
    return 0;
  }
  v10 = ProtoInfoForType(a1);
  if (!v10)
    return 0;
  v11 = (uint64_t)v10;
  v12 = malloc_type_malloc((a2 + 76), 0xAB2526ACuLL);
  *(_OWORD *)v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  *((_OWORD *)v12 + 2) = 0u;
  *((_OWORD *)v12 + 3) = 0u;
  *((_OWORD *)v12 + 4) = 0u;
  *(_DWORD *)v12 = a1;
  *((_QWORD *)v12 + 1) = CFRetain(a3);
  *((_QWORD *)v12 + 8) = v11;
  *((_DWORD *)v12 + 18) = a2;
  *((_BYTE *)v12 + 4) = a4;
  *((_DWORD *)v12 + 6) = EAPOLSIMGenerationGet();
  if (a5)
    *((_QWORD *)v12 + 2) = CFRetain(a5);
  if (a4 == 10)
    return v12;
  v43 = 0;
  valuePtr = 0;
  ProtoInfoChangedCheck(v11);
  v13 = CFPreferencesCopyValue(a3, *(CFStringRef *)v11, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  v43 = v13;
  TypeID = CFDictionaryGetTypeID();
  if (!v13)
  {
    CFStringGetTypeID();
    goto LABEL_57;
  }
  if (CFGetTypeID(v13) != TypeID)
  {
    v20 = CFStringGetTypeID();
    if (CFGetTypeID(v13) == v20)
    {
      v21 = 0;
      v22 = v13;
LABEL_56:
      EAPSIMAKAPersistentStateSetPseudonymAndTime((uint64_t)v12, v22, v21);
    }
LABEL_57:
    my_CFRelease(&v43);
    return v12;
  }
  if (!a5)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)v13, CFSTR("SSID"));
    v26 = CFStringGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == v26)
        *((_QWORD *)v12 + 2) = CFRetain(Value);
    }
  }
  v15 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v13, CFSTR("GenerationID"));
  v16 = CFNumberGetTypeID();
  if (v15 && CFGetTypeID(v15) == v16)
  {
    CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr);
    v17 = valuePtr;
  }
  else
  {
    v17 = 0;
    valuePtr = 0;
  }
  if (*((_DWORD *)v12 + 6) == v17)
  {
    v22 = CFDictionaryGetValue((CFDictionaryRef)v13, CFSTR("Pseudonym"));
    v23 = CFStringGetTypeID();
    if (v22 && CFGetTypeID(v22) == v23)
      goto LABEL_24;
    v22 = CFDictionaryGetValue((CFDictionaryRef)v13, CFSTR("PseudonymID"));
    v24 = CFStringGetTypeID();
    if (v22)
    {
      if (CFGetTypeID(v22) == v24)
      {
LABEL_24:
        v21 = CFDictionaryGetValue((CFDictionaryRef)v13, CFSTR("PseudonymStartTime"));
        goto LABEL_31;
      }
      v22 = 0;
    }
    v21 = 0;
LABEL_31:
    if (a4 == 13)
    {
      v41 = 0;
      v27 = CFDictionaryGetValue((CFDictionaryRef)v13, CFSTR("ReauthCounter"));
      v28 = CFNumberGetTypeID();
      if (v27 && CFGetTypeID(v27) != v28)
        v27 = 0;
      v29 = CFDictionaryGetValue((CFDictionaryRef)v13, CFSTR("ReauthID"));
      v30 = CFStringGetTypeID();
      if (v29 && CFGetTypeID(v29) != v30)
        v29 = 0;
      v31 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v13, CFSTR("IsReauthIDUsedBefore"));
      v32 = CFBooleanGetTypeID();
      if (v31)
      {
        if (CFGetTypeID(v31) == v32)
          LOBYTE(v31) = CFBooleanGetValue(v31);
        else
          LOBYTE(v31) = 0;
      }
      v33 = *(_QWORD *)(v11 + 8);
      *(_QWORD *)buf = 0;
      v34 = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("com.apple.network.%@.master-key.%@"), v33, a3);
      v35 = EAPSecKeychainPasswordItemCopy(0, v34, buf);
      CFRelease(v34);
      if (v35 != -25300 && v35)
      {
        v38 = EAPLogGetLogHandle();
        v39 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v38, v39))
        {
          *(_DWORD *)v45 = 67109120;
          v46 = v35;
          _os_log_impl(&dword_206440000, v38, v39, "Failed to read a keychain item: %d", v45, 8u);
        }
        v41 = 0;
      }
      else
      {
        v36 = *(const __CFData **)buf;
        v41 = *(const __CFData **)buf;
        if (v27)
        {
          if (v29)
          {
            if (*(_QWORD *)buf)
            {
              Length = CFDataGetLength(*(CFDataRef *)buf);
              if (Length == a2)
              {
                v48.length = Length;
                *(_WORD *)buf = 0;
                v48.location = 0;
                CFDataGetBytes(v36, v48, (UInt8 *)v12 + 76);
                CFNumberGetValue((CFNumberRef)v27, kCFNumberSInt16Type, buf);
                *((_WORD *)v12 + 14) = *(_WORD *)buf;
                if (*((_BYTE *)v12 + 4) == 13)
                  my_FieldSetRetainedCFType((const void **)v12 + 6, v29);
                *((_BYTE *)v12 + 56) = (_BYTE)v31;
              }
            }
          }
        }
      }
      my_CFRelease((const void **)&v41);
    }
    if (!v22)
      goto LABEL_57;
    goto LABEL_56;
  }
  my_CFRelease(&v43);
  IMSIListRemoveMatches(18, (unsigned int (*)(const __CFString *, const void *, uint64_t))IMSIMatchesEverything, 0);
  IMSIListRemoveMatches(23, (unsigned int (*)(const __CFString *, const void *, uint64_t))IMSIMatchesEverything, 0);
  return v12;
}

__CFString **ProtoInfoForType(int a1)
{
  NSObject *LogHandle;
  os_log_type_t v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (a1 == 18)
    return S_eapsim_info;
  if (a1 == 23)
    return S_eapaka_info;
  LogHandle = EAPLogGetLogHandle();
  v4 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v4))
  {
    v5[0] = 67109120;
    v5[1] = a1;
    _os_log_impl(&dword_206440000, LogHandle, v4, "unrecognized type %d", (uint8_t *)v5, 8u);
  }
  return 0;
}

void ProtoInfoChangedCheck(uint64_t a1)
{
  uint32_t v2;
  uint32_t v3;
  NSObject *LogHandle;
  os_log_type_t v5;
  const char *v6;
  uint32_t v7;
  uint32_t v8;
  int v9;
  int v10;
  int check;
  uint8_t buf[4];
  uint32_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  check = 0;
  if ((prefs_did_change_S_token_valid & 1) == 0)
  {
    v2 = notify_register_check("com.apple.network.eapclient.eapsimaka.prefs", &prefs_did_change_S_token);
    if (v2)
    {
      v3 = v2;
      LogHandle = EAPLogGetLogHandle();
      v5 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v5))
        return;
      *(_DWORD *)buf = 67109120;
      v13 = v3;
      v6 = "notify_register_check returned %d";
LABEL_9:
      _os_log_impl(&dword_206440000, LogHandle, v5, v6, buf, 8u);
      return;
    }
    prefs_did_change_S_token_valid = 1;
  }
  v7 = notify_check(prefs_did_change_S_token, &check);
  if (v7)
  {
    v8 = v7;
    LogHandle = EAPLogGetLogHandle();
    v5 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v5))
      return;
    *(_DWORD *)buf = 67109120;
    v13 = v8;
    v6 = "notify_check returned %d";
    goto LABEL_9;
  }
  v9 = prefs_did_change_S_generation;
  if (check)
    v9 = ++prefs_did_change_S_generation;
  v10 = *(_DWORD *)(a1 + 16);
  *(_DWORD *)(a1 + 16) = v9;
  if (v10 != v9)
    CFPreferencesSynchronize(*(CFStringRef *)a1, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
}

void IMSIListRemoveMatches(int a1, unsigned int (*a2)(const __CFString *, const void *, uint64_t), uint64_t a3)
{
  __CFString **v5;
  __CFString **v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFArray *v9;
  const __CFArray *v10;
  CFIndex v11;
  const __CFString *ValueAtIndex;
  CFPropertyListRef v13;
  const void *v14;
  CFTypeID TypeID;
  __CFString *v16;
  int v17;

  v5 = ProtoInfoForType(a1);
  if (v5)
  {
    v6 = v5;
    ProtoInfoChangedCheck((uint64_t)v5);
    v7 = (const __CFString *)*MEMORY[0x24BDBD590];
    v8 = (const __CFString *)*MEMORY[0x24BDBD570];
    v9 = CFPreferencesCopyKeyList(*v6, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    if (v9)
    {
      v10 = v9;
      if (CFArrayGetCount(v9) >= 1)
      {
        v11 = 0;
        v17 = 0;
        do
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v10, v11);
          v13 = CFPreferencesCopyValue(ValueAtIndex, *v6, v7, v8);
          if (v13)
          {
            v14 = v13;
            TypeID = CFDictionaryGetTypeID();
            if (CFGetTypeID(v14) == TypeID && a2(ValueAtIndex, v14, a3))
            {
              CFPreferencesSetValue(ValueAtIndex, 0, *v6, v7, v8);
              CFPreferencesSynchronize(*v6, v7, v8);
              v16 = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("com.apple.network.%@.master-key.%@"), v6[1], ValueAtIndex);
              EAPSecKeychainPasswordItemRemove(0, v16);
              CFRelease(v16);
              v17 = 1;
            }
            CFRelease(v14);
          }
          ++v11;
        }
        while (CFArrayGetCount(v10) > v11);
        if (v17)
          ProtoInfoNotifyChange();
      }
      CFRelease(v10);
    }
  }
}

BOOL IMSIDoesNotMatch(const void *a1, uint64_t a2, const void *a3)
{
  return my_CFEqual(a1, a3) == 0;
}

void ProtoInfoNotifyChange()
{
  uint32_t v0;
  uint32_t v1;
  NSObject *LogHandle;
  os_log_type_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v0 = notify_post("com.apple.network.eapclient.eapsimaka.prefs");
  if (v0)
  {
    v1 = v0;
    LogHandle = EAPLogGetLogHandle();
    v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v3))
    {
      v4[0] = 67109120;
      v4[1] = v1;
      _os_log_impl(&dword_206440000, LogHandle, v3, "notify_post returned %d", (uint8_t *)v4, 8u);
    }
  }
}

void EAPSIMAKAPersistentStateRelease(uint64_t a1)
{
  my_CFRelease((const void **)(a1 + 8));
  my_CFRelease((const void **)(a1 + 16));
  if (*(_BYTE *)(a1 + 4) == 13)
    my_FieldSetRetainedCFType((const void **)(a1 + 48), 0);
  EAPSIMAKAPersistentStateSetPseudonymAndTime(a1, 0, 0);
  free((void *)a1);
}

void EAPSIMAKAPersistentStateForgetSSID(uint64_t a1)
{
  IMSIListRemoveMatches(18, (unsigned int (*)(const __CFString *, const void *, uint64_t))IMSIMatchesSSID, a1);
  IMSIListRemoveMatches(23, (unsigned int (*)(const __CFString *, const void *, uint64_t))IMSIMatchesSSID, a1);
}

BOOL IMSIMatchesSSID(int a1, CFDictionaryRef theDict, const void *a3)
{
  const void *Value;

  Value = CFDictionaryGetValue(theDict, CFSTR("SSID"));
  return my_CFEqual(a3, Value) != 0;
}

uint64_t IMSIMatchesEverything()
{
  return 1;
}

char *EAPSIMAKAPacketSubtypeGetString(int a1)
{
  char v1;
  char *v2;

  v1 = a1 - 1;
  if ((a1 - 1) < 0xE && ((0x3E1Bu >> v1) & 1) != 0)
    return off_24BF0D470[v1];
  v2 = EAPSIMAKAPacketSubtypeGetString_buf;
  snprintf(EAPSIMAKAPacketSubtypeGetString_buf, 8uLL, "%d", a1);
  return v2;
}

const char *EAPSIMAKAAttributeTypeGetString(int a1)
{
  const char *v1;

  v1 = "AT_RAND";
  switch(a1)
  {
    case 1:
      return v1;
    case 2:
      v1 = "AT_AUTN";
      break;
    case 3:
      v1 = "AT_RES";
      break;
    case 4:
      v1 = "AT_AUTS";
      break;
    case 5:
    case 8:
    case 9:
    case 18:
LABEL_22:
      v1 = EAPSIMAKAAttributeTypeGetString_buf;
      snprintf(EAPSIMAKAAttributeTypeGetString_buf, 8uLL, "%d", a1);
      break;
    case 6:
      v1 = "AT_PADDING";
      break;
    case 7:
      v1 = "AT_NONCE_MT";
      break;
    case 10:
      v1 = "AT_PERMANENT_ID_REQ";
      break;
    case 11:
      v1 = "AT_MAC";
      break;
    case 12:
      v1 = "AT_NOTIFICATION";
      break;
    case 13:
      v1 = "AT_ANY_ID_REQ";
      break;
    case 14:
      v1 = "AT_IDENTITY";
      break;
    case 15:
      v1 = "AT_VERSION_LIST";
      break;
    case 16:
      v1 = "AT_SELECTED_VERSION";
      break;
    case 17:
      v1 = "AT_FULLAUTH_ID_REQ";
      break;
    case 19:
      v1 = "AT_COUNTER";
      break;
    case 20:
      v1 = "AT_COUNTER_TOO_SMALL";
      break;
    case 21:
      v1 = "AT_NONCE_S";
      break;
    case 22:
      v1 = "AT_CLIENT_ERROR_CODE";
      break;
    default:
      switch(a1)
      {
        case 129:
          v1 = "AT_IV";
          break;
        case 130:
          v1 = "AT_ENCR_DATA";
          break;
        case 132:
          v1 = "AT_NEXT_PSEUDONYM";
          break;
        case 133:
          v1 = "AT_NEXT_REAUTH_ID";
          break;
        case 134:
          v1 = "AT_CHECKCODE";
          break;
        case 135:
          v1 = "AT_RESULT_IND";
          break;
        default:
          goto LABEL_22;
      }
      break;
  }
  return v1;
}

const char *ATNotificationCodeGetString(int a1)
{
  if (a1 >= 0x4000)
  {
    switch(a1)
    {
      case 0x8000:
        return "Success";
      case 0x4001:
        return "Identity Decryption Failure Before Authentication";
      case 0x4000:
        return "General Failure Before Authentication";
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        return "General Failure After Authentication";
      case 1026:
        return "Temporarily Denied Access";
      case 1031:
        return "Not Subscribed";
    }
  }
  return 0;
}

__CFString *EAPSIMAKAPacketCopyDescription(unsigned __int8 *a1, char *a2)
{
  uint64_t Length;
  uint64_t v5;
  __CFString *Mutable;
  char v7;
  const char *v9;
  const char *v10;
  uint64_t v11;
  char *String;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  _BYTE v16[80];
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  Length = EAPPacketGetLength((uint64_t)a1);
  if (*a1 - 1 > 1)
  {
    Mutable = 0;
  }
  else
  {
    v5 = Length;
    Mutable = CFStringCreateMutable(0, 0);
    if (v5 <= 7)
    {
      CFStringAppendFormat(Mutable, 0, CFSTR("EAPSIMAKAPacket truncated header %d < %d\n"), v5, 8);
      goto LABEL_6;
    }
    v9 = EAPTypeStr(a1[4]);
    if (*a1 == 1)
      v10 = "Request";
    else
      v10 = "Response";
    v11 = a1[1];
    String = EAPSIMAKAPacketSubtypeGetString(a1[5]);
    CFStringAppendFormat(Mutable, 0, CFSTR("%s %s: Identifier %d Length %d [%s] Length %d\n"), v9, v10, v11, v5, String, (v5 - 8));
    if ((_DWORD)v5 == 8)
    {
LABEL_17:
      v7 = 1;
      goto LABEL_7;
    }
    v28 = 0;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0;
    v19 = 0u;
    memset(v16, 0, sizeof(v16));
    v15 = 0;
    v17 = 0;
    if (TLVListParse_0((uint64_t)&v15, a1 + 8, (int)v5 - 8))
    {
      v13 = TLVListCopyDescription((unsigned __int8 ***)&v15);
      if (v15 && v15 != v16)
        free(v15);
      v15 = 0;
      v17 = 0;
      CFStringAppendFormat(Mutable, 0, CFSTR("%@"), v13);
      CFRelease(v13);
      goto LABEL_17;
    }
    CFStringAppendFormat(Mutable, 0, CFSTR("failed to parse TLVs: %s\n"), &v18, v14);
  }
LABEL_6:
  v7 = 0;
LABEL_7:
  *a2 = v7;
  return Mutable;
}

uint64_t TLVListSizeof()
{
  return 256;
}

_QWORD *TLVListInit(_QWORD *result)
{
  *result = 0;
  result[11] = 0;
  return result;
}

uint64_t TLVListErrorString(uint64_t a1)
{
  return a1 + 96;
}

__CFString *TLVListCopyDescription(unsigned __int8 ***a1)
{
  __CFString *Mutable;
  int v3;
  unsigned __int8 **v4;
  unsigned __int8 *v5;
  uint64_t v6;
  const char *String;
  const char *v8;
  const char *v9;
  uint64_t v10;
  __CFString *v11;
  int v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __CFString *v20;
  unint64_t v21;
  unsigned __int8 *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  char __str[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  Mutable = CFStringCreateMutable(0, 0);
  if (*((int *)a1 + 22) >= 1)
  {
    v3 = 0;
    v4 = *a1;
    while (2)
    {
      v5 = *v4;
      v6 = 4 * (*v4)[1];
      String = EAPSIMAKAAttributeTypeGetString(**v4);
      CFStringAppendFormat(Mutable, 0, CFSTR("%s: Length %d\n"), String, v6);
      v8 = EAPSIMAKAAttributeTypeGetString(*v5);
      v9 = v8 + 3;
      switch(*v5)
      {
        case 1u:
          CFStringAppendFormat(Mutable, 0, CFSTR("%18s:\t"), "(reserved)");
          print_bytes_cfstr(Mutable, (uint64_t)(v5 + 2), 2);
          CFStringAppendFormat(Mutable, 0, CFSTR("\n%18s: (n=%d)\n"), v9, (unsigned __int16)((int)(v6 - 4 + ((((_DWORD)v6 - 4) & 0xF000u) >> 12)) >> 4));
          if (v6 >= 0x14)
          {
            v16 = 0;
            v17 = (uint64_t)(v5 + 4);
            if ((unsigned __int16)((int)(v6 - 4 + ((((_DWORD)v6 - 4) & 0xF000u) >> 12)) >> 4) <= 1u)
              v18 = 1;
            else
              v18 = (unsigned __int16)((int)(v6 - 4 + ((((_DWORD)v6 - 4) & 0xF000u) >> 12)) >> 4);
            do
            {
              CFStringAppendFormat(Mutable, 0, CFSTR("%18d:\t"), v16);
              print_bytes_cfstr(Mutable, v17, 16);
              CFStringAppendFormat(Mutable, 0, CFSTR("\n"));
              v16 = (v16 + 1);
              v17 += 16;
            }
            while (v18 != (_DWORD)v16);
          }
          goto LABEL_23;
        case 2u:
        case 7u:
        case 0xBu:
        case 0x15u:
LABEL_4:
          CFStringAppendFormat(Mutable, 0, CFSTR("%18s:\t"), "(reserved)");
          print_bytes_cfstr(Mutable, (uint64_t)(v5 + 2), 2);
          CFStringAppendFormat(Mutable, 0, CFSTR("\n%18s:\t"), v9);
          v10 = (uint64_t)(v5 + 4);
          v11 = Mutable;
          v12 = 16;
          goto LABEL_21;
        case 3u:
          v19 = bswap32(*((unsigned __int16 *)v5 + 1)) >> 16;
          LODWORD(v6) = (v19 + 7) >> 3;
          CFStringAppendFormat(Mutable, 0, CFSTR("%18s: %d bits (%d bytes)\n"), v8 + 3, v19, v6);
          v10 = (uint64_t)(v5 + 4);
          goto LABEL_20;
        case 4u:
          v6 = (v6 - 2);
          v28 = v6;
          CFStringAppendFormat(Mutable, 0, CFSTR("%18s: %d bytes\n"), v8 + 3);
          goto LABEL_19;
        case 5u:
        case 8u:
        case 9u:
        case 0x12u:
          goto LABEL_23;
        case 6u:
          v6 = (v6 - 2);
          CFStringAppendFormat(Mutable, 0, CFSTR("%18s: %d bytes\n"), v8 + 3, v6);
          CFStringAppendFormat(Mutable, 0, CFSTR("%18s\t"), &unk_206473DB9);
LABEL_19:
          v10 = (uint64_t)(v5 + 2);
          goto LABEL_20;
        case 0xAu:
        case 0xDu:
        case 0x11u:
        case 0x14u:
LABEL_8:
          CFStringAppendFormat(Mutable, 0, CFSTR("%18s:\t"), "(reserved)");
          v10 = (uint64_t)(v5 + 2);
          v11 = Mutable;
          v12 = 2;
          goto LABEL_21;
        case 0xCu:
        case 0x10u:
        case 0x13u:
        case 0x16u:
          CFStringAppendFormat(Mutable, 0, CFSTR("%18s:\t%04d\n"), v8 + 3, bswap32(*((unsigned __int16 *)v5 + 1)) >> 16);
          goto LABEL_23;
        case 0xEu:
LABEL_6:
          v13 = bswap32(*((unsigned __int16 *)v5 + 1));
          CFStringAppendFormat(Mutable, 0, CFSTR("%18s: Actual Length %d\n"), v8 + 3, HIWORD(v13));
          v14 = (uint64_t)(v5 + 4);
          print_data_cfstr(Mutable, v14, HIWORD(v13));
          v15 = v6 - HIWORD(v13);
          LODWORD(v6) = v15 - 4;
          if (v15 == 4)
            goto LABEL_23;
          snprintf(__str, 0x80uLL, "(%d pad bytes)", v15 - 4);
          CFStringAppendFormat(Mutable, 0, CFSTR("%18s:\t"), __str);
          v10 = v14 + HIWORD(v13);
LABEL_20:
          v11 = Mutable;
          v12 = v6;
LABEL_21:
          print_bytes_cfstr(v11, v10, v12);
          v20 = Mutable;
LABEL_22:
          CFStringAppendFormat(v20, 0, CFSTR("\n"), v27, v28);
LABEL_23:
          ++v3;
          ++v4;
          if (v3 >= *((_DWORD *)a1 + 22))
            return Mutable;
          continue;
        case 0xFu:
          v21 = bswap32(*((unsigned __int16 *)v5 + 1)) >> 16;
          CFStringAppendFormat(Mutable, 0, CFSTR("%18s: Actual Length %d\n"), v8 + 3, v21);
          v22 = v5 + 4;
          if ((v21 >> 1))
          {
            v23 = 0;
            do
            {
              CFStringAppendFormat(Mutable, 0, CFSTR("%18d:\t%04d\n"), v23, bswap32(*(unsigned __int16 *)&v22[2 * v23]) >> 16);
              ++v23;
            }
            while ((v21 >> 1) != (_DWORD)v23);
          }
          v24 = v6 - v21 - 4;
          snprintf(__str, 0x80uLL, "(%d pad bytes)", v24);
          CFStringAppendFormat(Mutable, 0, CFSTR("%18s:\t"), __str);
          print_bytes_cfstr(Mutable, (uint64_t)&v22[v21], v24);
          v20 = Mutable;
          goto LABEL_22;
        default:
          switch(*v5)
          {
            case 0x81u:
              goto LABEL_4;
            case 0x82u:
              CFStringAppendFormat(Mutable, 0, CFSTR("%18s:\t"), "(reserved)");
              print_bytes_cfstr(Mutable, (uint64_t)(v5 + 2), 2);
              v25 = (v6 - 4);
              CFStringAppendFormat(Mutable, 0, CFSTR("\n%18s: Length %d\n"), v9, v25);
              print_data_cfstr(Mutable, (uint64_t)(v5 + 4), v25);
              break;
            case 0x84u:
            case 0x85u:
              goto LABEL_6;
            case 0x87u:
              goto LABEL_8;
            default:
              goto LABEL_23;
          }
          goto LABEL_23;
      }
    }
  }
  return Mutable;
}

void TLVListFree(uint64_t a1)
{
  void *v2;
  void *v3;
  BOOL v4;

  v3 = (void *)(a1 + 8);
  v2 = *(void **)a1;
  if (v2)
    v4 = v2 == v3;
  else
    v4 = 1;
  if (!v4)
    free(v2);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 88) = 0;
}

uint64_t EAPSIMAKAStatusForATNotificationCode(int a1)
{
  if (a1 >= 0x4000)
  {
    switch(a1)
    {
      case 0x8000:
        return 0;
      case 0x4001:
        return 19;
      case 0x4000:
        return 2;
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        return 1;
      case 1026:
        return 3;
      case 1031:
        return 4;
    }
  }
  return 5;
}

void EAPSIMAKAKeyInfoComputeMAC(uint64_t a1, const void *a2, uint64_t a3, const void *a4, int a5, void *a6)
{
  int v12;
  CCHmacContext v13;
  _QWORD data[3];

  data[2] = *MEMORY[0x24BDAC8D0];
  memset(&v13, 0, sizeof(v13));
  data[0] = 0;
  data[1] = 0;
  v12 = EAPPacketGetLength((uint64_t)a2) - (a3 - (_DWORD)a2);
  CCHmacInit(&v13, 0, (const void *)(a1 + 16), 0x10uLL);
  CCHmacUpdate(&v13, a2, (int)a3 - (int)a2);
  CCHmacUpdate(&v13, data, 0x10uLL);
  CCHmacUpdate(&v13, (const void *)(a3 + 16), v12 - 16);
  if (a4)
    CCHmacUpdate(&v13, a4, a5);
  CCHmacFinal(&v13, a6);
}

BOOL EAPSIMAKAKeyInfoVerifyMAC(uint64_t a1, const void *a2, uint64_t a3, const void *a4, int a5)
{
  _BYTE v6[20];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  EAPSIMAKAKeyInfoComputeMAC(a1, a2, a3, a4, a5, v6);
  return cc_cmp_safe() == 0;
}

double EAPSIMAKAKeyInfoSetMAC(uint64_t a1, const void *a2, _OWORD *a3, const void *a4, int a5)
{
  double result;
  double v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  EAPSIMAKAKeyInfoComputeMAC(a1, a2, (uint64_t)a3, a4, a5, v7);
  result = v7[0];
  *a3 = *(_OWORD *)v7;
  return result;
}

void *EAPSIMAKAKeyInfoDecryptTLVList(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  void *v9;
  CCCryptorStatus v10;
  CCCryptorStatus v11;
  NSObject *LogHandle;
  os_log_type_t v13;
  const char *v14;
  CCCryptorStatus v15;
  CCCryptorStatus v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  int v20;
  CCCryptorStatus v21;
  CCCryptorStatus v22;
  NSObject *v23;
  os_log_type_t v24;
  int v25;
  NSObject *v27;
  os_log_type_t v28;
  NSObject *v29;
  os_log_type_t v30;
  size_t v31;
  CCCryptorRef cryptorRef;
  uint8_t buf[4];
  _DWORD v34[7];

  *(_QWORD *)&v34[5] = *MEMORY[0x24BDAC8D0];
  v31 = 0;
  cryptorRef = 0;
  v8 = 4 * *(unsigned __int8 *)(a2 + 1) - 4;
  v9 = malloc_type_malloc(v8, 0xC1456794uLL);
  v10 = CCCryptorCreate(1u, 0, 0, a1, 0x10uLL, (const void *)(a3 + 4), &cryptorRef);
  if (v10)
  {
    v11 = v10;
    LogHandle = EAPLogGetLogHandle();
    v13 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v13))
    {
      *(_DWORD *)buf = 67109120;
      v34[0] = v11;
      v14 = "CCCryptoCreate failed with %d";
LABEL_7:
      v17 = LogHandle;
      v18 = v13;
      v19 = 8;
LABEL_8:
      _os_log_impl(&dword_206440000, v17, v18, v14, buf, v19);
    }
  }
  else
  {
    v15 = CCCryptorUpdate(cryptorRef, (const void *)(a2 + 4), v8, v9, v8, &v31);
    if (v15)
    {
      v16 = v15;
      LogHandle = EAPLogGetLogHandle();
      v13 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v13))
      {
        *(_DWORD *)buf = 67109120;
        v34[0] = v16;
        v14 = "CCCryptoUpdate failed with %d";
        goto LABEL_7;
      }
    }
    else
    {
      if (v31 != v8)
      {
        v27 = EAPLogGetLogHandle();
        v28 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v27, v28))
          goto LABEL_9;
        *(_DWORD *)buf = 67109376;
        v34[0] = v31;
        LOWORD(v34[1]) = 1024;
        *(_DWORD *)((char *)&v34[1] + 2) = v8;
        v14 = "decryption consumed %d bytes (!= %d bytes)";
        v17 = v27;
        v18 = v28;
        v19 = 14;
        goto LABEL_8;
      }
      if (TLVListParse_0(a4, (unsigned __int8 *)v9, v8))
      {
        v20 = 0;
        goto LABEL_10;
      }
      v29 = EAPLogGetLogHandle();
      v30 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v29, v30))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v34 = a4 + 96;
        v14 = "TLVListParse failed on AT_ENCR_DATA, %s";
        v17 = v29;
        v18 = v30;
        v19 = 12;
        goto LABEL_8;
      }
    }
  }
LABEL_9:
  v20 = 1;
LABEL_10:
  if (cryptorRef)
  {
    v21 = CCCryptorRelease(cryptorRef);
    if (v21)
    {
      v22 = v21;
      v23 = EAPLogGetLogHandle();
      v24 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v23, v24))
      {
        *(_DWORD *)buf = 67109120;
        v34[0] = v22;
        _os_log_impl(&dword_206440000, v23, v24, "CCCryptoRelease failed with %d", buf, 8u);
      }
    }
  }
  if (v9)
    v25 = v20;
  else
    v25 = 0;
  if (v25 == 1)
  {
    free(v9);
    return 0;
  }
  return v9;
}

BOOL EAPSIMAKAKeyInfoEncryptTLVs(const void *a1, uint64_t a2, uint64_t a3)
{
  int v6;
  int v7;
  int v8;
  __CFString *v9;
  NSObject *v10;
  os_log_type_t v11;
  _BYTE *TLV;
  uint64_t v13;
  char *v14;
  _BYTE *v15;
  _BYTE *v16;
  unsigned __int8 *v17;
  int v18;
  CCCryptorStatus v19;
  CCCryptorStatus v20;
  NSObject *v21;
  os_log_type_t v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  NSObject *v26;
  os_log_type_t v27;
  _BOOL8 result;
  int v29;
  int v30;
  const char *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint32_t v34;
  NSObject *LogHandle;
  os_log_type_t v36;
  NSObject *v37;
  os_log_type_t v38;
  NSObject *v39;
  CCCryptorStatus v40;
  CCCryptorStatus v41;
  NSObject *v42;
  os_log_type_t v43;
  uint32_t v44;
  char v45;
  CCCryptorStatus v46;
  CCCryptorStatus v47;
  NSObject *v48;
  os_log_type_t v49;
  NSObject *v50;
  os_log_type_t v51;
  NSObject *v52;
  os_log_type_t v53;
  CCCryptorRef cryptorRef;
  size_t dataOutMoved;
  void *v56;
  _OWORD v57[15];
  uint64_t v58;
  uint8_t buf[4];
  _BYTE v60[10];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  memset(v57, 0, sizeof(v57));
  v58 = 0;
  v6 = *(_DWORD *)(a3 + 12);
  if (v6 <= 0)
    v7 = -(-v6 & 0xF);
  else
    v7 = v6 & 0xF;
  if (v7)
  {
    v8 = v6 - v7 + 16;
    if (v8 != v6)
    {
      if (!TLVBufferAddPadding(a3, v8 - v6))
      {
        LogHandle = EAPLogGetLogHandle();
        v36 = _SC_syslog_os_log_mapping();
        result = os_log_type_enabled(LogHandle, v36);
        if (!result)
          return result;
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v60 = a2 + 16;
        v31 = "failed to add AT_PADDING, %s";
LABEL_30:
        v32 = LogHandle;
LABEL_31:
        v33 = v36;
LABEL_32:
        v34 = 12;
LABEL_33:
        _os_log_impl(&dword_206440000, v32, v33, v31, buf, v34);
        return 0;
      }
      v6 = *(_DWORD *)(a3 + 12);
    }
  }
  if (v6 != *(_DWORD *)(a3 + 8))
  {
    v26 = EAPLogGetLogHandle();
    v27 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(v26, v27);
    if (!result)
      return result;
    v30 = *(_DWORD *)(a3 + 8);
    v29 = *(_DWORD *)(a3 + 12);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v60 = v29;
    *(_WORD *)&v60[4] = 1024;
    *(_DWORD *)&v60[6] = v30;
    v31 = "nested encrypted TLVs length %d != %d";
    v32 = v26;
    v33 = v27;
    v34 = 14;
    goto LABEL_33;
  }
  v56 = 0;
  *(_QWORD *)&v57[5] = 0;
  if (!TLVListParse_0((uint64_t)&v56, *(unsigned __int8 **)a3, v6))
  {
    v37 = EAPLogGetLogHandle();
    v38 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(v37, v38);
    if (!result)
      return result;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v60 = (char *)&v57[5] + 8;
    v31 = "nested TLVs TLVListParse failed, %s";
    v32 = v37;
    v33 = v38;
    goto LABEL_32;
  }
  v9 = TLVListCopyDescription((unsigned __int8 ***)&v56);
  if (v56 && v56 != v57)
    free(v56);
  v56 = 0;
  *(_QWORD *)&v57[5] = 0;
  v10 = EAPLogGetLogHandle();
  v11 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v10, v11))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v60 = v9;
    _os_log_impl(&dword_206440000, v10, v11, "Encrypted TLVs:\n%@", buf, 0xCu);
  }
  CFRelease(v9);
  TLV = TLVBufferAllocateTLV(a2, 129, 20);
  if (!TLV)
  {
    LogHandle = EAPLogGetLogHandle();
    v36 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(LogHandle, v36);
    if (!result)
      return result;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v60 = a2 + 16;
    v31 = "failed to allocate AT_IV, %s";
    goto LABEL_30;
  }
  v13 = 0;
  *((_WORD *)TLV + 1) = 0;
  v14 = TLV + 4;
  do
  {
    *(_DWORD *)&v14[v13] = arc4random();
    v13 += 4;
  }
  while ((_DWORD)v13 != 16);
  v15 = TLVBufferAllocateTLV(a2, 130, *(_DWORD *)(a3 + 12) + 4);
  if (!v15)
  {
    v39 = EAPLogGetLogHandle();
    v36 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(v39, v36);
    if (!result)
      return result;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v60 = a3 + 16;
    v31 = "failed to allocate AT_ENCR_DATA, %s";
    v32 = v39;
    goto LABEL_31;
  }
  v16 = v15;
  *((_WORD *)v15 + 1) = 0;
  v17 = *(unsigned __int8 **)a3;
  v18 = *(_DWORD *)(a3 + 12);
  cryptorRef = 0;
  dataOutMoved = 0;
  v19 = CCCryptorCreate(0, 0, 0, a1, 0x10uLL, v14, &cryptorRef);
  if (v19)
  {
    v20 = v19;
    v21 = EAPLogGetLogHandle();
    v22 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v21, v22))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v60 = v20;
      v23 = "encrypt CCCryptoCreate failed with %d";
      v24 = v21;
      v25 = v22;
LABEL_40:
      v44 = 8;
LABEL_41:
      _os_log_impl(&dword_206440000, v24, v25, v23, buf, v44);
      goto LABEL_42;
    }
    goto LABEL_42;
  }
  v40 = CCCryptorUpdate(cryptorRef, v17, v18, v16 + 4, v18, &dataOutMoved);
  if (v40)
  {
    v41 = v40;
    v42 = EAPLogGetLogHandle();
    v43 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v42, v43))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v60 = v41;
      v23 = "encrypt CCCryptoUpdate failed with %d";
      v24 = v42;
      v25 = v43;
      goto LABEL_40;
    }
LABEL_42:
    v45 = 0;
    goto LABEL_43;
  }
  if (dataOutMoved != v18)
  {
    v52 = EAPLogGetLogHandle();
    v53 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v52, v53))
      goto LABEL_42;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v60 = dataOutMoved;
    *(_WORD *)&v60[4] = 1024;
    *(_DWORD *)&v60[6] = v18;
    v23 = "encryption consumed %d, should have been %d";
    v24 = v52;
    v25 = v53;
    v44 = 14;
    goto LABEL_41;
  }
  v45 = 1;
LABEL_43:
  v46 = CCCryptorRelease(cryptorRef);
  if (v46)
  {
    v47 = v46;
    v48 = EAPLogGetLogHandle();
    v49 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v48, v49))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v60 = v47;
      _os_log_impl(&dword_206440000, v48, v49, "CCCryptoRelease failed with %d", buf, 8u);
    }
  }
  if ((v45 & 1) != 0)
    return 1;
  v50 = EAPLogGetLogHandle();
  v51 = _SC_syslog_os_log_mapping();
  result = os_log_type_enabled(v50, v51);
  if (result)
  {
    *(_WORD *)buf = 0;
    v31 = "failed to encrypt AT_ENCR_DATA";
    v32 = v50;
    v33 = v51;
    v34 = 2;
    goto LABEL_33;
  }
  return result;
}

uint64_t TLVBufferUsed(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

uint64_t TLVBufferAddPadding(uint64_t a1, unsigned int a2)
{
  uint64_t result;

  if (a2 <= 0xC && ((1 << a2) & 0x1110) != 0)
  {
    result = (uint64_t)TLVBufferAllocateTLV(a1, 6, a2);
    if (result)
    {
      bzero((void *)(result + 2), a2 - 2);
      return 1;
    }
    else
    {
      strcpy((char *)(a1 + 16), "couldn't allocate TLV");
    }
  }
  else
  {
    snprintf((char *)(a1 + 16), 0xA0uLL, "invalid AT_PADDING %d", a2);
    return 0;
  }
  return result;
}

uint64_t TLVBufferErrorString(uint64_t a1)
{
  return a1 + 16;
}

_BYTE *TLVBufferAllocateTLV(uint64_t a1, char a2, int a3)
{
  _BYTE *v3;
  int v4;
  int v5;
  uint64_t v6;

  if (a3 < 2)
    return 0;
  if (a3 <= 0)
    v4 = -(-a3 & 3);
  else
    v4 = a3 & 3;
  v5 = a3 - v4 + 4;
  if (!v4)
    v5 = a3;
  if (v5 < 1021)
  {
    v6 = *(int *)(a1 + 12);
    if (*(_DWORD *)(a1 + 8) - (int)v6 >= v5)
    {
      v3 = (_BYTE *)(*(_QWORD *)a1 + v6);
      *v3 = a2;
      v3[1] = v5 / 4;
      *(_DWORD *)(a1 + 12) = v6 + v5;
      return v3;
    }
    snprintf((char *)(a1 + 16), 0xA0uLL, "available space %d < required %d");
  }
  else
  {
    snprintf((char *)(a1 + 16), 0xA0uLL, "padded_length %d > max length %d");
  }
  return 0;
}

double EAPSIMAKAKeyInfoComputeReauthKey(_OWORD *a1, uint64_t a2, const void *a3, CC_LONG a4, uint64_t a5, uint64_t a6)
{
  const void *MasterKey;
  CC_LONG MasterKeySize;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double result;
  __int128 v18;
  CC_SHA1_CTX v19;
  __int128 md;
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
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  memset(&v19, 0, sizeof(v19));
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
  CC_SHA1_Init(&v19);
  CC_SHA1_Update(&v19, a3, a4);
  CC_SHA1_Update(&v19, (const void *)(a5 + 2), 2u);
  CC_SHA1_Update(&v19, (const void *)(a6 + 4), 0x10u);
  MasterKey = (const void *)EAPSIMAKAPersistentStateGetMasterKey(a2);
  MasterKeySize = EAPSIMAKAPersistentStateGetMasterKeySize(a2);
  CC_SHA1_Update(&v19, MasterKey, MasterKeySize);
  CC_SHA1_Final((unsigned __int8 *)&md, &v19);
  fips186_2prf(&md, (uint64_t)&v21);
  v14 = v22;
  a1[2] = v21;
  a1[3] = v14;
  v15 = v24;
  a1[4] = v23;
  a1[5] = v15;
  v16 = v26;
  a1[6] = v25;
  a1[7] = v16;
  result = *(double *)&v27;
  v18 = v28;
  a1[8] = v27;
  a1[9] = v18;
  return result;
}

uint64_t EAPSIMAKAIdentityTypeGetAttributeType(CFTypeRef cf2)
{
  if (!cf2)
    return 13;
  if (CFEqual(CFSTR("FullAuthentication"), cf2))
    return 17;
  if (CFEqual(CFSTR("Permanent"), cf2))
    return 10;
  return 13;
}

_QWORD *EAPSIMAKAInitEncryptedIdentityInfo(int a1, CFDictionaryRef theDict, int a3, _BYTE *a4, char *a5)
{
  const void *Value;
  CFTypeID TypeID;
  NSObject *v12;
  os_log_type_t v13;
  const void *v14;
  CFTypeID v15;
  const void *v16;
  const __CFString *v17;
  CFTypeID v18;
  NSObject *LogHandle;
  os_log_type_t v20;
  _QWORD *result;
  unint64_t v22;
  CFTypeID v23;
  const __CFString *v24;
  CFTypeID v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  NSObject *v29;
  CFStringRef v30;
  CFStringRef v31;
  NSObject *v32;
  os_log_type_t v33;
  const char *v34;
  CFStringRef v35;
  NSObject *v36;
  const __CFDictionary *v37;
  CFTypeID v38;
  const void *v39;
  const __CFString *v40;
  id v41;
  uint8_t buf[8];
  NSObject *v43;
  const void *v44;
  char v45;
  unint64_t v46;
  CFStringRef Copy;

  v46 = 0;
  Copy = 0;
  v45 = 0;
  v43 = 0;
  v44 = 0;
  *a4 = 1;
  *a5 = 0;
  Value = CFDictionaryGetValue(theDict, CFSTR("EAPSIMAKAEncryptedIdentityEnabled"));
  TypeID = CFBooleanGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID || !CFBooleanGetValue((CFBooleanRef)Value))
  {
    *a4 = 0;
    LogHandle = EAPLogGetLogHandle();
    v20 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v20))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206440000, LogHandle, v20, "The carrier does not support privacy protection", buf, 2u);
    }
    return 0;
  }
  v12 = EAPLogGetLogHandle();
  v13 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v12, v13))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_206440000, v12, v13, "The carrier supports privacy protection", buf, 2u);
  }
  v14 = CFDictionaryGetValue(theDict, CFSTR("EAPSIMAKARealm"));
  v15 = CFStringGetTypeID();
  if (!v14)
  {
    v16 = 0;
    if (a3)
      goto LABEL_11;
LABEL_25:
    v26 = SIMCopyRealm(0);
    v44 = v26;
    if (SIMIsOOBPseudonymSupported((BOOL *)&v45))
    {
      if (v45)
      {
        v27 = EAPLogGetLogHandle();
        v28 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v27, v28))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_206440000, v27, v28, "The carrier supports OOB pseudonym", buf, 2u);
        }
        v29 = SIMCopyOOBPseudonym();
        v46 = (unint64_t)v29;
        if (v29)
        {
          if (v26)
          {
            v30 = CFStringCreateWithFormat(0, 0, CFSTR("%@@%@"), v29, v26);
            my_CFRelease((const void **)&v46);
            v31 = 0;
            v22 = 0;
            v46 = (unint64_t)v30;
            goto LABEL_52;
          }
          goto LABEL_51;
        }
        v32 = EAPLogGetLogHandle();
        v33 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v32, v33))
        {
          *(_WORD *)buf = 0;
          v34 = "failed to get OOB pseudonym";
          goto LABEL_50;
        }
      }
      else
      {
        v36 = SIMCopyEncryptedIMSIInfo(a1);
        v43 = v36;
        if (v36)
        {
          v37 = (const __CFDictionary *)v36;
          v22 = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)v36, (const void *)*MEMORY[0x24BDC2A78]);
          v38 = CFDataGetTypeID();
          if (!v22)
          {
            v31 = 0;
            goto LABEL_52;
          }
          if (CFGetTypeID((CFTypeRef)v22) == v38)
          {
            CFRetain((CFTypeRef)v22);
            v39 = CFDictionaryGetValue(v37, (const void *)*MEMORY[0x24BDC2A88]);
            v40 = (const __CFString *)isA_CFString(v39);
            Copy = v40;
            if (v40)
              CFRetain(v40);
            else
              Copy = CFStringCreateCopy(0, CFSTR("anonymous"));
            if (v16)
            {
              v35 = CFStringCreateWithFormat(0, 0, CFSTR("%@@%@"), Copy, v16);
              goto LABEL_38;
            }
            v31 = Copy;
            if (!v26)
              goto LABEL_52;
            v41 = v26;
LABEL_37:
            v35 = CFStringCreateWithFormat(0, 0, CFSTR("%@@%@"), v31, v41);
LABEL_38:
            v31 = v35;
            my_CFRelease((const void **)&Copy);
            goto LABEL_52;
          }
        }
        else
        {
          v32 = EAPLogGetLogHandle();
          v33 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v32, v33))
          {
            *(_WORD *)buf = 0;
            v34 = "failed to get encrypted idenity";
            goto LABEL_50;
          }
        }
      }
    }
    else
    {
      v32 = EAPLogGetLogHandle();
      v33 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v32, v33))
      {
        *(_WORD *)buf = 0;
        v34 = "check for OOB pseudonym support failed";
LABEL_50:
        _os_log_impl(&dword_206440000, v32, v33, v34, buf, 2u);
      }
    }
LABEL_51:
    v31 = 0;
    v22 = 0;
    goto LABEL_52;
  }
  if (CFGetTypeID(v14) == v15)
    v16 = v14;
  else
    v16 = 0;
  if (!a3)
    goto LABEL_25;
LABEL_11:
  v17 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("EAPSIMAKAOutOfBandPseudonym"));
  v18 = CFStringGetTypeID();
  if (!v17 || CFGetTypeID(v17) != v18)
  {
    v46 = 0;
    v22 = (unint64_t)CFDictionaryGetValue(theDict, CFSTR("EAPSIMAKAEncryptedUserName"));
    v23 = CFDataGetTypeID();
    if (!v22 || CFGetTypeID((CFTypeRef)v22) != v23)
      return 0;
    CFRetain((CFTypeRef)v22);
    v24 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("EAPSIMAKAAnonymousUserName"));
    v25 = CFStringGetTypeID();
    if (v24 && CFGetTypeID(v24) == v25)
    {
      Copy = v24;
      CFRetain(v24);
    }
    else
    {
      Copy = 0;
      Copy = CFStringCreateCopy(0, CFSTR("anonymous"));
    }
    v31 = Copy;
    if (!v16)
      goto LABEL_52;
    v41 = 0;
    goto LABEL_37;
  }
  v46 = (unint64_t)v17;
  if (v16)
    v46 = (unint64_t)CFStringCreateWithFormat(0, 0, CFSTR("%@@%@"), v17, v16);
  else
    CFRetain(v17);
  v31 = 0;
  v22 = 0;
  v45 = 1;
LABEL_52:
  my_CFRelease((const void **)&v43);
  my_CFRelease(&v44);
  *a5 = v45;
  if (!(v22 | v46))
    return 0;
  result = malloc_type_malloc(0x18uLL, 0x6004045F868BCuLL);
  result[1] = 0;
  result[2] = 0;
  *result = 0;
  if (v45)
  {
    *result = v46;
  }
  else
  {
    result[1] = v31;
    result[2] = v22;
  }
  return result;
}

const void *isA_CFString(const void *a1)
{
  CFTypeID TypeID;

  TypeID = CFStringGetTypeID();
  if (!a1)
    return 0;
  if (CFGetTypeID(a1) == TypeID)
    return a1;
  return 0;
}

void EAPSIMAKAClearEncryptedIdentityInfo(const void **a1)
{
  if (a1)
  {
    my_CFRelease(a1 + 1);
    my_CFRelease(a1 + 2);
    my_CFRelease(a1);
    free(a1);
  }
}

const void *EAPSIMAKAActionInfoForNotificationCode(const __CFDictionary *a1, int a2)
{
  const __CFArray *Value;
  CFTypeID TypeID;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  const void *ValueAtIndex;
  CFTypeID v9;
  const void *v10;
  CFTypeID v11;
  int valuePtr;

  if (!a2 || a2 == 1031 || a2 == 1026)
  {
    Value = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("EAPSIMAKANotificationActions"));
    TypeID = CFArrayGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID)
      {
        Count = CFArrayGetCount(Value);
        if ((unint64_t)(Count - 1) <= 9)
        {
          v6 = Count;
          v7 = 0;
          while (1)
          {
            valuePtr = 0;
            ValueAtIndex = CFArrayGetValueAtIndex(Value, v7);
            v9 = CFDictionaryGetTypeID();
            if (!ValueAtIndex)
              break;
            if (CFGetTypeID(ValueAtIndex) != v9)
              break;
            v10 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("Code"));
            v11 = CFNumberGetTypeID();
            if (!v10 || CFGetTypeID(v10) != v11 || !CFNumberGetValue((CFNumberRef)v10, kCFNumberIntType, &valuePtr))
              break;
            if (valuePtr != a2)
            {
              ValueAtIndex = 0;
              if (v6 != ++v7)
                continue;
            }
            return ValueAtIndex;
          }
        }
      }
    }
  }
  return 0;
}

uint64_t TLVBufferSizeof()
{
  return 176;
}

uint64_t TLVBufferInit(uint64_t result, uint64_t a2, int a3)
{
  *(_QWORD *)result = a2;
  *(_DWORD *)(result + 8) = a3;
  *(_DWORD *)(result + 12) = 0;
  *(_BYTE *)(result + 16) = 0;
  return result;
}

uint64_t TLVBufferAddIdentity(uint64_t a1, const void *a2, signed int a3)
{
  uint64_t result;

  result = (uint64_t)TLVBufferAllocateTLV(a1, 14, a3 + 4);
  if (result)
  {
    *(_WORD *)(result + 2) = bswap32(a3) >> 16;
    memmove((void *)(result + 4), a2, a3);
    return 1;
  }
  return result;
}

uint64_t TLVBufferAddCounter(uint64_t a1, unsigned int a2)
{
  uint64_t result;

  result = (uint64_t)TLVBufferAllocateTLV(a1, 19, 4);
  if (result)
  {
    *(_WORD *)(result + 2) = __rev16(a2);
    return 1;
  }
  return result;
}

uint64_t TLVBufferAddCounterTooSmall(uint64_t a1)
{
  uint64_t result;

  result = (uint64_t)TLVBufferAllocateTLV(a1, 20, 4);
  if (result)
  {
    *(_WORD *)(result + 2) = 0;
    return 1;
  }
  return result;
}

_DWORD *TLVListAddAttribute(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  char *v4;
  int v5;
  int v6;
  void *v7;
  uint64_t v8;

  v3 = result;
  v4 = *(char **)result;
  if (*(_QWORD *)result)
  {
    v5 = result[22];
    if (v5 == result[23])
    {
      v6 = v5 + 10;
      result[23] = v6;
      if (v4 == (char *)(result + 2))
      {
        v7 = malloc_type_malloc(8 * v6, 0xC0040B8AA526DuLL);
        *(_QWORD *)v3 = v7;
        result = memmove(v7, v4, 8 * (int)v3[22]);
        v4 = *(char **)v3;
      }
      else
      {
        result = reallocf(v4, 8 * v6);
        v4 = (char *)result;
        *(_QWORD *)v3 = result;
      }
    }
  }
  else
  {
    v4 = (char *)(result + 2);
    *(_QWORD *)result = result + 2;
    result[23] = 10;
  }
  v8 = (int)v3[22];
  v3[22] = v8 + 1;
  *(_QWORD *)&v4[8 * v8] = a2;
  return result;
}

uint64_t TLVCheckValidity(uint64_t a1, unsigned __int8 *a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  const char *v6;
  int v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  char *v15;
  const char *String;
  uint64_t v18;
  const char *v20;
  uint64_t v21;
  uint64_t v22;

  v2 = a2[1];
  if (!a2[1])
    return 1;
  v3 = 4 * v2;
  v4 = 2;
  switch(*a2)
  {
    case 1u:
      if (v2 <= 1)
      {
        v15 = (char *)(a1 + 96);
        v4 = 1;
        String = EAPSIMAKAAttributeTypeGetString(1);
        snprintf(v15, 0xA0uLL, "%s truncated %d <= %d", String, v3, 4);
        return v4;
      }
      if ((((_DWORD)v3 - 4) & 0xC) == 0)
        return 0;
      snprintf((char *)(a1 + 96), 0xA0uLL, "AT_RAND rand length %d not multiple of %d");
      return 1;
    case 2u:
    case 7u:
    case 0xBu:
    case 0x15u:
LABEL_8:
      if (v2 <= 1)
      {
        v5 = (char *)(a1 + 96);
        v7 = *a2;
        goto LABEL_10;
      }
      v8 = (v3 - 4);
      if ((_DWORD)v3 == 20)
        return 0;
      v5 = (char *)(a1 + 96);
      v9 = EAPSIMAKAAttributeTypeGetString(*a2);
      v10 = 16;
LABEL_19:
      v21 = v8;
      v22 = v10;
      v20 = v9;
      v6 = "%s invalid length %d != %d";
      goto LABEL_38;
    case 3u:
      if (v2 <= 1)
      {
        v5 = (char *)(a1 + 96);
        v7 = 3;
LABEL_10:
        v21 = 4 * v2;
        v22 = 4;
        v20 = EAPSIMAKAAttributeTypeGetString(v7);
        v6 = "%s truncated %d <= %d";
        goto LABEL_38;
      }
      v12 = ((bswap32(*((unsigned __int16 *)a2 + 1)) >> 16) + 7) >> 3;
      v13 = (v3 - 4);
      if ((int)v12 > (int)v13)
      {
        v5 = (char *)(a1 + 96);
        v14 = 3;
        goto LABEL_37;
      }
      return 0;
    case 4u:
      v8 = (v3 - 2);
      if ((_DWORD)v3 == 16)
        return 0;
      v5 = (char *)(a1 + 96);
      v9 = EAPSIMAKAAttributeTypeGetString(4);
      v10 = 14;
      goto LABEL_19;
    case 5u:
    case 8u:
    case 9u:
    case 0x12u:
      return v4;
    case 6u:
      if (v3 > 0xC || ((1 << (4 * v2)) & 0x1110) == 0)
      {
        snprintf((char *)(a1 + 96), 0xA0uLL, "AT_PADDING length %d not 4, 8, or 12");
      }
      else
      {
        v18 = 0;
        while (!a2[v18 + 2])
        {
          v4 = 0;
          if ((_DWORD)v3 - 2 == (_DWORD)++v18)
            return v4;
        }
        snprintf((char *)(a1 + 96), 0xA0uLL, "AT_PADDING non-zero value 0x%x at offset %d");
      }
      return 1;
    case 0xAu:
    case 0xCu:
    case 0xDu:
    case 0x10u:
    case 0x11u:
    case 0x13u:
    case 0x14u:
    case 0x16u:
LABEL_3:
      if (v2 == 1)
        return 0;
      v5 = (char *)(a1 + 96);
      v20 = EAPSIMAKAAttributeTypeGetString(*a2);
      v21 = v3;
      v6 = "%s length %d != 4";
      goto LABEL_38;
    case 0xEu:
    case 0xFu:
LABEL_6:
      if (v2 <= 1)
      {
        v5 = (char *)(a1 + 96);
        v21 = 4 * v2;
        v22 = 4;
        v20 = EAPSIMAKAAttributeTypeGetString(*a2);
        v6 = "%s empty/truncated (%d <= %d)";
LABEL_38:
        snprintf(v5, 0xA0uLL, v6, v20, v21, v22);
        return 1;
      }
      v11 = bswap32(*((unsigned __int16 *)a2 + 1));
      v12 = HIWORD(v11);
      v13 = (v3 - 4);
      if ((int)v13 < (int)HIWORD(v11))
      {
        v5 = (char *)(a1 + 96);
        v14 = *a2;
LABEL_37:
        v21 = v12;
        v22 = v13;
        v20 = EAPSIMAKAAttributeTypeGetString(v14);
        v6 = "%s actual length %d > TLV length %d";
        goto LABEL_38;
      }
      v4 = 0;
      if (*a2 == 15 && (v11 & 0x10000) != 0)
      {
        snprintf((char *)(a1 + 96), 0xA0uLL, "AT_VERSION_LIST actual length %d not multiple of 2");
        return 1;
      }
      break;
    default:
      switch(*a2)
      {
        case 0x81u:
          goto LABEL_8;
        case 0x82u:
          if (v2 > 1)
            return 0;
          snprintf((char *)(a1 + 96), 0xA0uLL, "AT_ENCR_DATA empty/truncated (%d <= %d)");
          return 1;
        case 0x84u:
        case 0x85u:
          goto LABEL_6;
        case 0x87u:
          goto LABEL_3;
        default:
          return v4;
      }
  }
  return v4;
}

uint64_t TLVListLookupAttribute(unsigned __int8 ***a1, int a2)
{
  int v2;
  unsigned __int8 **i;
  uint64_t result;

  v2 = *((_DWORD *)a1 + 22);
  if (v2 < 1)
    return 0;
  for (i = *a1; ; ++i)
  {
    result = (uint64_t)*i;
    if (**i == a2)
      break;
    if (!--v2)
      return 0;
  }
  return result;
}

CFStringRef TLVCreateString(uint64_t a1)
{
  const __CFData *v1;
  CFStringRef v2;

  v1 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)(a1 + 4), bswap32(*(unsigned __int16 *)(a1 + 2)) >> 16, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v2 = CFStringCreateFromExternalRepresentation(0, v1, 0x8000100u);
  CFRelease(v1);
  return v2;
}

CFStringRef TLVListCreateStringFromAttribute(uint64_t a1, int a2)
{
  int v2;
  uint64_t *i;

  if ((a2 & 0xFE) != 0x84)
    return 0;
  v2 = *(_DWORD *)(a1 + 88);
  if (v2 < 1)
    return 0;
  for (i = *(uint64_t **)a1; *(unsigned __int8 *)*i != a2; ++i)
  {
    if (!--v2)
      return 0;
  }
  return TLVCreateString(*i);
}

uint64_t TLVListLookupIdentityAttribute(int *a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned __int8 **v3;
  int v4;

  v1 = 0;
  while (a1[22] < 1)
  {
LABEL_6:
    if (++v1 == 3)
      return 0;
  }
  v2 = TLVListLookupIdentityAttribute_S_types[v1];
  v3 = *(unsigned __int8 ***)a1;
  v4 = a1[22];
  while (**v3 != (_DWORD)v2)
  {
    ++v3;
    if (!--v4)
      goto LABEL_6;
  }
  return v2;
}

uint64_t eapaka_introspect(char *__s1)
{
  const char *v2;
  char **v3;
  char *v4;

  v2 = "version";
  v3 = &off_24BF0D4F0;
  while (strcmp(__s1, v2))
  {
    v4 = *v3;
    v3 += 2;
    v2 = v4;
    if (!v4)
      return 0;
  }
  return (uint64_t)*(v3 - 1);
}

uint64_t eapaka_version()
{
  return 1;
}

uint64_t eapaka_type()
{
  return 23;
}

const char *eapaka_name()
{
  return "EAP-AKA";
}

uint64_t eapaka_init(uint64_t a1)
{
  const __CFDictionary *v2;
  const void *Value;
  const void *v4;
  const void *v5;
  BOOL v6;
  const void *v8;
  CFTypeID TypeID;
  int v10;
  NSObject *LogHandle;
  os_log_type_t v12;
  CFTypeID v13;
  NSObject *v14;
  os_log_type_t v15;
  CFTypeID v16;
  const __CFString *v17;
  const __CFString *v18;
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  NSObject *v22;
  os_log_type_t v23;
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  const void *v27;
  void *v28;
  uint64_t v29;
  int identity_type;
  __int128 *MasterKey;
  uint64_t v32;
  _BOOL4 v33;
  uint64_t result;
  _QWORD *v35;
  int v36;
  _BOOL4 v37;
  NSObject *v38;
  os_log_type_t v39;
  _QWORD *v40;
  char v41;
  NSObject *v42;
  os_log_type_t v43;
  os_log_type_t v44;
  char v45;
  unsigned __int8 v46;
  __int128 v47;
  const void *v48;
  uint8_t buf[16];

  v47 = 0uLL;
  v48 = 0;
  v2 = *(const __CFDictionary **)(a1 + 80);
  if (v2)
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("EAPAKARES"));
    v4 = CFDictionaryGetValue(v2, CFSTR("EAPAKACk"));
    v5 = CFDictionaryGetValue(v2, CFSTR("EAPAKAIk"));
    v6 = !Value && v4 == 0;
    if (!v6 || v5 != 0)
    {
      v8 = v5;
      TypeID = CFDataGetTypeID();
      if (v4 && CFGetTypeID(v4) == TypeID)
      {
        v10 = 1;
      }
      else
      {
        LogHandle = EAPLogGetLogHandle();
        v12 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(LogHandle, v12))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_206440000, LogHandle, v12, "invalid/missing EAPAKACk property", buf, 2u);
        }
        v10 = 0;
      }
      v13 = CFDataGetTypeID();
      if (!v8 || CFGetTypeID(v8) != v13)
      {
        v14 = EAPLogGetLogHandle();
        v15 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v14, v15))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_206440000, v14, v15, "invalid/missing EAPAKAIk property", buf, 2u);
        }
        v10 = 0;
      }
      v16 = CFDataGetTypeID();
      if (Value && CFGetTypeID(Value) == v16)
      {
        my_FieldSetRetainedCFType((const void **)&v47 + 1, v4);
        my_FieldSetRetainedCFType(&v48, v8);
        my_FieldSetRetainedCFType((const void **)&v47, Value);
        if (v10)
        {
          v17 = (const __CFString *)copy_static_imsi_0(*(const __CFDictionary **)(a1 + 80));
          if (!v17)
          {
            my_CFRelease((const void **)&v47);
            my_CFRelease((const void **)&v47 + 1);
            my_CFRelease(&v48);
            return 4;
          }
          v18 = v17;
          v19 = EAPLogGetLogHandle();
          v20 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v19, v20))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_206440000, v19, v20, "EAP-AKA: using static information", buf, 2u);
          }
          v21 = 1;
          goto LABEL_34;
        }
      }
      else
      {
        v22 = EAPLogGetLogHandle();
        v23 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v22, v23))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_206440000, v22, v23, "invalid/missing EAPAKARES property", buf, 2u);
        }
        my_FieldSetRetainedCFType((const void **)&v47 + 1, v4);
        my_FieldSetRetainedCFType(&v48, v8);
        my_FieldSetRetainedCFType((const void **)&v47, Value);
      }
    }
  }
  v18 = (const __CFString *)SIMCopyIMSI(*(const __CFDictionary **)(a1 + 80));
  v24 = EAPLogGetLogHandle();
  v25 = _SC_syslog_os_log_mapping();
  v26 = os_log_type_enabled(v24, v25);
  if (!v18)
  {
    if (v26)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206440000, v24, v25, "EAP-AKA: no SIM available", buf, 2u);
    }
    return 16;
  }
  if (v26)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_206440000, v24, v25, "EAP-AKA: SIM found", buf, 2u);
  }
  v21 = 0;
LABEL_34:
  v27 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), CFSTR("TLSTrustExceptionsID"));
  v28 = malloc_type_malloc(0x6F0uLL, 0x1060040FE550C1BuLL);
  if (!v28)
  {
    CFRelease(v18);
    my_CFRelease((const void **)&v47);
    my_CFRelease((const void **)&v47 + 1);
    my_CFRelease(&v48);
    return 2;
  }
  v29 = (uint64_t)v28;
  bzero(v28, 0x6F0uLL);
  *(_DWORD *)(v29 + 16) = -1;
  *(_OWORD *)(v29 + 248) = v47;
  *(_QWORD *)(v29 + 264) = v48;
  identity_type = S_get_identity_type(*(const void **)(a1 + 80));
  *(_QWORD *)(v29 + 208) = EAPSIMAKAPersistentStateCreate(23, 20, v18, identity_type, v27);
  CFRelease(v18);
  if (EAPSIMAKAPersistentStateGetReauthID(*(_QWORD *)(v29 + 208)))
  {
    MasterKey = (__int128 *)EAPSIMAKAPersistentStateGetMasterKey(*(_QWORD *)(v29 + 208));
    fips186_2prf(MasterKey, v29 + 40);
    *(_BYTE *)(v29 + 200) = 1;
    if (EAPSIMAKAPersistentStateGetReauthIDUsed(*(_QWORD *)(v29 + 208)))
      EAPSIMAKAPersistentStateSetReauthIDUsed(*(_QWORD *)(v29 + 208), 0);
  }
  v32 = *(_QWORD *)(v29 + 208);
  if (v32)
    v33 = EAPSIMAKAPersistentStateTemporaryUsernameAvailable(v32);
  else
    v33 = 0;
  v46 = 0;
  if (*(_QWORD *)(a1 + 56))
    goto LABEL_46;
  v45 = 0;
  v35 = EAPSIMAKAInitEncryptedIdentityInfo(23, *(CFDictionaryRef *)(a1 + 80), v21, &v46, &v45);
  *(_QWORD *)(v29 + 224) = v35;
  v36 = v46;
  if (v46 == 1 && !v35)
  {
    v37 = v45 == 1 && v33;
    v38 = EAPLogGetLogHandle();
    if (v37)
    {
      v39 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v38, v39))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_206440000, v38, v39, "EAP-AKA: out-of-band pseudonym is not required as in-band pseudonym is available", buf, 2u);
      }
      v36 = v46;
      goto LABEL_57;
    }
    v44 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v38, v44))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206440000, v38, v44, "EAP-AKA: failed to get privacy protected identity", buf, 2u);
    }
    EAPAKAContextFree(v29);
    return 16;
  }
LABEL_57:
  if (v36 == 1)
  {
    v40 = *(_QWORD **)(v29 + 224);
    if (v40)
    {
      if (*v40)
        v41 = v33;
      else
        v41 = 1;
      if ((v41 & 1) == 0)
      {
        *(_BYTE *)(v29 + 240) = 1;
        v42 = EAPLogGetLogHandle();
        v43 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v42, v43))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_206440000, v42, v43, "EAP-AKA: using out-of-band pseudonym as an identity", buf, 2u);
        }
      }
    }
  }
LABEL_46:
  result = 0;
  *(_QWORD *)v29 = a1;
  *(_QWORD *)a1 = v29;
  return result;
}

void eapaka_free(uint64_t *a1)
{
  EAPAKAContextFree(*a1);
  *a1 = 0;
}

uint64_t eapaka_process(uint64_t *a1, unsigned __int8 *a2, uint64_t *a3, int *a4, _DWORD *a5)
{
  uint64_t v5;
  int v6;
  NSObject *LogHandle;
  os_log_type_t v8;
  uint8_t v10[16];

  v5 = *a1;
  *a4 = 0;
  *a5 = 0;
  v6 = *a2;
  switch(v6)
  {
    case 4:
      *(_DWORD *)(v5 + 16) = -1;
      *(_DWORD *)(v5 + 8) = 2;
      *a4 = 1;
      break;
    case 3:
      *(_DWORD *)(v5 + 16) = -1;
      if (*(_DWORD *)(v5 + 12) == 4)
      {
        *(_DWORD *)(v5 + 8) = 1;
        EAPSIMAKAPersistentStateSave(*(_QWORD *)(v5 + 208), *(unsigned __int8 *)(v5 + 200));
        if (*(_BYTE *)(v5 + 240))
        {
          LogHandle = EAPLogGetLogHandle();
          v8 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v8))
          {
            *(_WORD *)v10 = 0;
            _os_log_impl(&dword_206440000, LogHandle, v8, "eapaka: requesting out-of-band psuedonym refresh", v10, 2u);
          }
          SIMReportDecryptionError(0);
        }
      }
      break;
    case 1:
      *a3 = eapaka_request(v5, a2, a4, a5);
      break;
  }
  return *(unsigned int *)(v5 + 8);
}

uint64_t eapaka_failure_string()
{
  return 0;
}

uint64_t eapaka_session_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2;

  v2 = *a1;
  if (*(_DWORD *)(*a1 + 12) != 4 || !*(_BYTE *)(v2 + 200))
    return 0;
  *a2 = 32;
  return v2 + 72;
}

uint64_t eapaka_server_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2;

  v2 = *a1;
  if (*(_DWORD *)(*a1 + 12) != 4 || !*(_BYTE *)(v2 + 200))
    return 0;
  *a2 = 32;
  return v2 + 104;
}

uint64_t eapaka_msk_copy_bytes(uint64_t *a1, _OWORD *a2, int a3)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  if (a3 < 64)
    return 0;
  v3 = *a1;
  if (!*(_BYTE *)(*a1 + 200) || *(_DWORD *)(v3 + 12) != 4)
    return 0;
  v4 = *(_OWORD *)(v3 + 72);
  v5 = *(_OWORD *)(v3 + 88);
  v6 = *(_OWORD *)(v3 + 120);
  a2[2] = *(_OWORD *)(v3 + 104);
  a2[3] = v6;
  *a2 = v4;
  a2[1] = v5;
  return 64;
}

CFDictionaryRef eapaka_publish_props(uint64_t a1)
{
  void *keys;

  keys = CFSTR("EAPAKASIMNotificationActionInfo");
  if (*(_QWORD *)(*(_QWORD *)a1 + 232))
    return CFDictionaryCreate(0, (const void **)&keys, (const void **)(*(_QWORD *)a1 + 232), 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  else
    return 0;
}

void *eapaka_user_name_copy(const __CFDictionary *a1)
{
  const __CFString *v2;
  const __CFString *v3;
  int v4;
  NSObject *v5;
  const void **v6;
  int identity_type;
  void *v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t SSID;
  NSObject *LogHandle;
  os_log_type_t v16;
  const void *v17;
  int v18;
  NSObject *v19;
  os_log_type_t v20;
  os_log_type_t v21;
  char v23;
  __int16 v24;
  NSObject *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  v2 = (const __CFString *)copy_static_imsi_0(a1);
  v25 = v2;
  if (v2)
  {
    v3 = v2;
    v4 = 1;
  }
  else
  {
    v5 = SIMCopyIMSI(a1);
    v25 = v5;
    if (!v5)
    {
LABEL_31:
      v6 = 0;
      v10 = 0;
      goto LABEL_32;
    }
    v3 = (const __CFString *)v5;
    v4 = 0;
  }
  v6 = (const void **)EAPSIMAKAInitEncryptedIdentityInfo(23, a1, v4, (_BYTE *)&v24 + 1, (char *)&v24);
  identity_type = S_get_identity_type(a1);
  v8 = EAPSIMAKAPersistentStateCreate(23, 20, v3, identity_type, 0);
  my_CFRelease((const void **)&v25);
  if (v8)
  {
    v9 = EAPSIMAKAPersistentStateTemporaryUsernameAvailable((uint64_t)v8);
    if (v6 && !EAPSIMAKAPersistentStateTemporaryUsernameAvailable((uint64_t)v8))
    {
      if (*v6)
      {
        LogHandle = EAPLogGetLogHandle();
        v16 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(LogHandle, v16))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_206440000, LogHandle, v16, "EAP-AKA: using out-of-band pseudonym as an identity", buf, 2u);
        }
        v17 = *v6;
      }
      else
      {
        v17 = v6[1];
      }
      v10 = (void *)CFRetain(v17);
      goto LABEL_21;
    }
    v23 = 0;
    v10 = (void *)sim_identity_create_0((uint64_t)v8, a1, identity_type, 1, &v23, 0);
    if (v23)
    {
      v11 = 1;
      EAPSIMAKAPersistentStateSetReauthIDUsed((uint64_t)v8, 1);
      v12 = EAPLogGetLogHandle();
      v13 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v12, v13))
      {
        SSID = EAPSIMAKAPersistentStateGetSSID((uint64_t)v8);
        *(_DWORD *)buf = 138412546;
        v27 = v10;
        v28 = 2112;
        v29 = SSID;
        _os_log_impl(&dword_206440000, v12, v13, "EAP-AKA is using fast re-auth id %@ for ssid : %@", buf, 0x16u);
      }
    }
    else
    {
      if (!EAPSIMAKAPersistentStateGetReauthIDUsed((uint64_t)v8))
      {
LABEL_21:
        EAPSIMAKAPersistentStateRelease((uint64_t)v8);
        goto LABEL_22;
      }
      EAPSIMAKAPersistentStateSetReauthID((uint64_t)v8, 0);
      EAPSIMAKAPersistentStateSetReauthIDUsed((uint64_t)v8, 0);
      v11 = 0;
    }
    EAPSIMAKAPersistentStateSave((uint64_t)v8, v11);
    goto LABEL_21;
  }
  v9 = 0;
  v10 = 0;
LABEL_22:
  if (HIBYTE(v24) != 1 || v6)
    goto LABEL_32;
  v18 = v24;
  v19 = EAPLogGetLogHandle();
  if (!v9 || v18 != 1)
  {
    v21 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v19, v21))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206440000, v19, v21, "EAP-AKA: failed to get privacy protected identity", buf, 2u);
    }
    goto LABEL_31;
  }
  v20 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v19, v20))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_206440000, v19, v20, "EAP-AKA: out-of-band pseudonym is not required as in-band pseudonym is available", buf, 2u);
  }
  v6 = 0;
LABEL_32:
  EAPSIMAKAClearEncryptedIdentityInfo(v6);
  return v10;
}

CFStringRef eapaka_copy_identity(CFDictionaryRef *a1)
{
  _QWORD *v2;
  const void *v3;
  CFStringRef result;

  v2 = *a1;
  v3 = (const void *)*((_QWORD *)*a1 + 4);
  if (v3)
    CFRelease(v3);
  v2[4] = 0;
  *(_QWORD *)((char *)v2 + 12) = 0xFFFFFFFF00000000;
  if (!v2[28] || EAPSIMAKAPersistentStateTemporaryUsernameAvailable(v2[26]))
    return sim_identity_create_0(v2[26], a1[10], 13, 1, 0, 0);
  result = *(CFStringRef *)(v2[28] + 8);
  if (result)
    return (CFStringRef)CFRetain(result);
  return result;
}

CFTypeRef copy_static_imsi_0(const __CFDictionary *a1)
{
  const void *Value;
  CFTypeID TypeID;

  if (a1
    && (Value = CFDictionaryGetValue(a1, CFSTR("EAPSIMAKAIMSI")), TypeID = CFStringGetTypeID(), Value)
    && CFGetTypeID(Value) == TypeID)
  {
    return CFRetain(Value);
  }
  else
  {
    return 0;
  }
}

void EAPAKAContextFree(uint64_t a1)
{
  const void *v2;

  EAPSIMAKAPersistentStateRelease(*(_QWORD *)(a1 + 208));
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
  *(_QWORD *)(a1 + 32) = 0;
  my_CFRelease((const void **)(a1 + 248));
  my_CFRelease((const void **)(a1 + 256));
  my_CFRelease((const void **)(a1 + 264));
  EAPSIMAKAClearEncryptedIdentityInfo(*(const void ***)(a1 + 224));
  my_CFRelease((const void **)(a1 + 232));
  bzero((void *)a1, 0x6F0uLL);
  free((void *)a1);
}

void EAPAKAContextSetLastIdentity(uint64_t a1, CFTypeRef cf)
{
  const void *v4;
  const __CFString *v5;
  void *ExternalRepresentation;
  const __CFString *v7;

  v4 = *(const void **)(a1 + 32);
  if (v4)
    CFRelease(v4);
  *(_QWORD *)(a1 + 32) = 0;
  if (cf)
  {
    if (*(_QWORD *)(a1 + 224)
      && (!EAPSIMAKAPersistentStateTemporaryUsernameAvailable(*(_QWORD *)(a1 + 208)) || *(_BYTE *)(a1 + 28) == 10))
    {
      v5 = **(const __CFString ***)(a1 + 224);
      if (!v5)
      {
        v7 = sim_identity_create_0(*(_QWORD *)(a1 + 208), *(CFDictionaryRef *)(*(_QWORD *)a1 + 80), 10, 0, 0, 0);
        *(_QWORD *)(a1 + 32) = CFStringCreateExternalRepresentation(0, v7, 0x8000100u, 0);
        my_CFRelease((const void **)&v7);
        return;
      }
      ExternalRepresentation = CFStringCreateExternalRepresentation(0, v5, 0x8000100u, 0);
    }
    else
    {
      ExternalRepresentation = (void *)CFRetain(cf);
    }
    *(_QWORD *)(a1 + 32) = ExternalRepresentation;
  }
}

CFStringRef sim_identity_create_0(uint64_t a1, CFDictionaryRef theDict, int a3, int a4, _BYTE *a5, _DWORD *a6)
{
  BOOL v11;
  const void *Value;
  CFTypeID TypeID;
  uint64_t Pseudonym;
  const void *v15;
  uint64_t ReauthID;
  int ReauthIDUsed;
  const void *v18;
  const __CFString *v19;
  CFStringRef v20;
  const void *v21;
  CFTypeID v22;
  const __CFNumber *v23;
  CFTypeID v24;
  int v25;
  uint64_t IMSI;
  CFStringRef v27;
  int v29;
  CFAbsoluteTime Current;
  const __CFDate *v31;
  NSObject *LogHandle;
  os_log_type_t v33;
  uint64_t v34;
  const void *v35;
  CFDateRef otherDate;
  uint8_t valuePtr[16];

  if (a5)
    *a5 = 0;
  if (CFDictionaryContainsKey(theDict, CFSTR("EAPSIMAKAIMSI")) | a4)
    v11 = theDict == 0;
  else
    v11 = 1;
  if (!v11
    && (Value = CFDictionaryGetValue(theDict, CFSTR("EAPSIMAKARealm")), TypeID = CFStringGetTypeID(), Value)
    && CFGetTypeID(Value) == TypeID)
  {
    CFRetain(Value);
  }
  else
  {
    Value = SIMCopyRealm(theDict);
  }
  v35 = Value;
  if (a5)
    *a5 = 0;
  if (!a1)
  {
    v20 = 0;
    goto LABEL_47;
  }
  otherDate = 0;
  Pseudonym = EAPSIMAKAPersistentStateGetPseudonym(a1, &otherDate);
  v15 = (const void *)Pseudonym;
  if (a3 == 17 || a3 == 13)
  {
    ReauthID = EAPSIMAKAPersistentStateGetReauthID(a1);
    ReauthIDUsed = EAPSIMAKAPersistentStateGetReauthIDUsed(a1);
    if (a3 == 13 && ReauthID && !ReauthIDUsed)
    {
      if (a5)
        *a5 = 1;
      v18 = (const void *)ReauthID;
      goto LABEL_22;
    }
    if (v15)
    {
      if (Value)
      {
        v19 = CFStringCreateWithFormat(0, 0, CFSTR("%@@%@"), v15, Value, v35);
LABEL_37:
        v20 = v19;
        if (v19)
          goto LABEL_47;
        goto LABEL_38;
      }
      v18 = v15;
LABEL_22:
      v19 = (const __CFString *)CFRetain(v18);
      goto LABEL_37;
    }
  }
  else
  {
    v21 = 0;
    if (a3 != 10)
      goto LABEL_39;
    if (!Pseudonym)
      goto LABEL_39;
    v21 = CFDictionaryGetValue(theDict, CFSTR("EAPSIMAKAConservativePeer"));
    v22 = CFBooleanGetTypeID();
    if (!v21)
      goto LABEL_39;
    if (CFGetTypeID(v21) == v22 && CFBooleanGetValue((CFBooleanRef)v21))
    {
      *(_DWORD *)valuePtr = 24;
      v23 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("EAPSIMAKAPseudonymIdentityLifetimeHours"));
      v24 = CFNumberGetTypeID();
      if (v23)
      {
        v25 = 24;
        if (CFGetTypeID(v23) == v24)
        {
          if (CFNumberGetValue(v23, kCFNumberIntType, valuePtr))
            v25 = *(_DWORD *)valuePtr;
          else
            v25 = 24;
        }
      }
      else
      {
        v25 = 24;
      }
      v29 = v25 <= 24 ? 24 : v25;
      if (otherDate)
      {
        Current = CFAbsoluteTimeGetCurrent();
        v31 = CFDateCreate(0, Current);
        v21 = v31;
        if (v31 && CFDateGetTimeIntervalSinceDate(v31, otherDate) < (double)(3600 * v29))
        {
          LogHandle = EAPLogGetLogHandle();
          v33 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v33))
          {
            *(_WORD *)valuePtr = 0;
            _os_log_impl(&dword_206440000, LogHandle, v33, "EAP Peer is in conservative mode and pseudonym is not expired yet.", valuePtr, 2u);
          }
          v20 = 0;
          if (a6)
            *a6 = 17;
          goto LABEL_46;
        }
        goto LABEL_39;
      }
    }
  }
LABEL_38:
  v21 = 0;
LABEL_39:
  IMSI = EAPSIMAKAPersistentStateGetIMSI(a1);
  if (Value)
    v27 = CFStringCreateWithFormat(0, 0, CFSTR("0%@@%@"), IMSI, Value);
  else
    v27 = CFStringCreateWithFormat(0, 0, CFSTR("0%@"), IMSI, v34);
  v20 = v27;
  if (a6 && !v27)
    *a6 = 16;
  if (v21)
LABEL_46:
    CFRelease(v21);
LABEL_47:
  my_CFRelease(&v35);
  return v20;
}

uint64_t eapaka_request(uint64_t a1, unsigned __int8 *a2, int *a3, _DWORD *a4)
{
  unsigned int Length;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  uint64_t v18;
  unsigned __int8 ***v19;
  uint64_t v20;
  size_t v21;
  NSObject *LogHandle;
  os_log_type_t v23;
  const char *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint32_t v27;
  uint64_t client_error_packet;
  unsigned int v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  NSObject *v35;
  os_log_type_t v36;
  char *String;
  _BYTE buf[24];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  Length = EAPPacketGetLength((uint64_t)a2);
  v9 = TLVListSizeof();
  MEMORY[0x24BDAC7A8](v9, v10, v11, v12, v13, v14, v15, v16, *(_QWORD *)buf, *(_QWORD *)&buf[8], *(_QWORD *)&buf[16], v39);
  v19 = (unsigned __int8 ***)&buf[-v18];
  if ((v20 & 0x7FFFFFE00) != 0)
    v21 = 512;
  else
    v21 = v17;
  bzero(&buf[-v18], v21);
  TLVListInit(v19);
  if (Length <= 8)
  {
    LogHandle = EAPLogGetLogHandle();
    v23 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v23))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = Length;
      *(_WORD *)&buf[8] = 2048;
      *(_QWORD *)&buf[10] = 8;
      v24 = "length %d <= %ld";
      v25 = LogHandle;
      v26 = v23;
      v27 = 18;
LABEL_17:
      _os_log_impl(&dword_206440000, v25, v26, v24, buf, v27);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (TLVListParse_0((uint64_t)v19, a2 + 8, Length - 8))
  {
    if (*(_DWORD *)(a1 + 12) && *(_DWORD *)(a1 + 16) == a2[1])
      return a1 + 272;
    v29 = a2[5];
    if (v29 > 0xB)
    {
      if (v29 == 12)
      {
        v30 = (uint64_t)eapaka_notification(a1, a2, v19, a3, a4);
        goto LABEL_36;
      }
      if (v29 == 13)
      {
        v30 = (uint64_t)eapaka_reauthentication(a1, a2, v19, a3);
        goto LABEL_36;
      }
    }
    else
    {
      if (v29 == 1)
      {
        v30 = (uint64_t)eapaka_challenge(a1, a2, v19, a3);
        goto LABEL_36;
      }
      if (v29 == 5)
      {
        v30 = eapaka_identity(a1, (uint64_t)a2, (int *)v19, a3);
LABEL_36:
        client_error_packet = v30;
        goto LABEL_19;
      }
    }
    *a3 = 17;
    v35 = EAPLogGetLogHandle();
    v36 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v35, v36))
    {
      String = EAPSIMAKAPacketSubtypeGetString(v29);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = String;
      _os_log_impl(&dword_206440000, v35, v36, "unexpected Subtype %s", buf, 0xCu);
    }
    client_error_packet = 0;
    *a3 = 17;
    goto LABEL_19;
  }
  v31 = EAPLogGetLogHandle();
  v32 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = TLVListErrorString((uint64_t)v19);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v33;
    v24 = "parse failed: %s";
    v25 = v31;
    v26 = v32;
    v27 = 12;
    goto LABEL_17;
  }
LABEL_18:
  client_error_packet = 0;
  *a3 = 17;
LABEL_19:
  TLVListFree((uint64_t)v19);
  if (*a3)
    *(_QWORD *)(a1 + 8) = 0x500000002;
  if (!client_error_packet)
  {
    if (*a3 != 17)
      return 0;
    client_error_packet = make_client_error_packet(a1, (uint64_t)a2);
    if (!client_error_packet)
      return client_error_packet;
  }
  *(_DWORD *)(a1 + 16) = a2[1];
  return client_error_packet;
}

const void *eapaka_challenge(uint64_t a1, const void *a2, unsigned __int8 ***a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  size_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFAllocator *v27;
  CFDataRef v28;
  CFDataRef v29;
  double v30;
  NSObject *LogHandle;
  os_log_type_t v32;
  const char *v33;
  BOOL v34;
  const __CFData *v35;
  const __CFData *v36;
  const UInt8 *BytePtr;
  CC_LONG Length;
  const UInt8 *v39;
  const __CFData *v40;
  char v41;
  const void *response_packet;
  int v43;
  NSObject *v44;
  os_log_type_t v45;
  _BYTE *v46;
  const UInt8 *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  const __CFData *v51;
  const UInt8 *v52;
  CC_LONG v53;
  const UInt8 *v54;
  CC_LONG v55;
  unsigned __int8 *MasterKey;
  __int128 *v57;
  _BYTE *TLV;
  _BYTE *v59;
  const __CFData *v60;
  int v61;
  _BYTE *v62;
  size_t v63;
  void *v64;
  const UInt8 *v65;
  __int16 v66;
  int v67;
  NSObject *v69;
  os_log_type_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  CC_SHA1_CTX c;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  _BYTE v78[10];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v75 = 0u;
  v76 = 0u;
  memset(&c.data[1], 0, 64);
  v8 = TLVBufferSizeof();
  MEMORY[0x24BDAC7A8](v8, v9, v10, v11, v12, v13, v14, v15, 0, 0, 0, 0);
  v18 = (char *)&c - v17;
  if ((v19 & 0x7FFFFFE00) != 0)
    v20 = 512;
  else
    v20 = v16;
  bzero((char *)&c - v17, v20);
  AKAAuthResultsInit(&v75);
  *(_QWORD *)(a1 + 8) = 0x200000000;
  EAPSIMAKAPersistentStateSetCounter(*(_QWORD *)(a1 + 208), 1);
  EAPSIMAKAPersistentStateSetReauthID(*(_QWORD *)(a1 + 208), 0);
  *(_BYTE *)(a1 + 216) = 0;
  v21 = TLVListLookupAttribute(a3, 1);
  if (!v21)
  {
    LogHandle = EAPLogGetLogHandle();
    v32 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v32))
      goto LABEL_38;
    *(_WORD *)buf = 0;
    v33 = "eapaka: Challenge is missing AT_RAND";
    goto LABEL_37;
  }
  v22 = v21;
  v23 = TLVListLookupAttribute(a3, 2);
  if (!v23)
  {
    LogHandle = EAPLogGetLogHandle();
    v32 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v32))
      goto LABEL_38;
    *(_WORD *)buf = 0;
    v33 = "eapaka: Challenge is missing AT_AUTN";
    goto LABEL_37;
  }
  v24 = v23;
  v25 = TLVListLookupAttribute(a3, 11);
  if (!v25)
  {
    LogHandle = EAPLogGetLogHandle();
    v32 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v32))
      goto LABEL_38;
    *(_WORD *)buf = 0;
    v33 = "eapaka: Challenge is missing AT_MAC";
    goto LABEL_37;
  }
  v26 = v25;
  v27 = (const __CFAllocator *)*MEMORY[0x24BDBD258];
  v28 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)(v22 + 4), 16, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v29 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)(v24 + 4), 16, v27);
  if (*(_QWORD *)(a1 + 256))
  {
    v30 = AKAAuthResultsInit(&v75);
    AKAAuthResultsSetCK(&v75, *(_QWORD *)(a1 + 256), v30);
    AKAAuthResultsSetIK((uint64_t)&v75, *(const void **)(a1 + 264));
    AKAAuthResultsSetRES((uint64_t)&v75, *(const void **)(a1 + 248));
    CFRelease(v28);
    CFRelease(v29);
  }
  else
  {
    v34 = SIMAuthenticateAKA(*(const __CFDictionary **)(*(_QWORD *)a1 + 80), v28, v29, (const void **)&v75);
    CFRelease(v28);
    CFRelease(v29);
    if (!v34)
      goto LABEL_46;
  }
  v35 = (const __CFData *)v75;
  if ((_QWORD)v75)
  {
    CC_SHA1_Init(&c);
    v36 = *(const __CFData **)(a1 + 32);
    if (v36)
    {
      BytePtr = CFDataGetBytePtr(v36);
      Length = CFDataGetLength(*(CFDataRef *)(a1 + 32));
      v39 = BytePtr;
    }
    else
    {
      v39 = *(const UInt8 **)(*(_QWORD *)a1 + 40);
      Length = *(_DWORD *)(*(_QWORD *)a1 + 48);
    }
    CC_SHA1_Update(&c, v39, Length);
    v51 = (const __CFData *)*((_QWORD *)&v75 + 1);
    v52 = CFDataGetBytePtr(*((CFDataRef *)&v75 + 1));
    v53 = CFDataGetLength(v51);
    CC_SHA1_Update(&c, v52, v53);
    v54 = CFDataGetBytePtr(v35);
    v55 = CFDataGetLength(v35);
    CC_SHA1_Update(&c, v54, v55);
    MasterKey = (unsigned __int8 *)EAPSIMAKAPersistentStateGetMasterKey(*(_QWORD *)(a1 + 208));
    CC_SHA1_Final(MasterKey, &c);
    v57 = (__int128 *)EAPSIMAKAPersistentStateGetMasterKey(*(_QWORD *)(a1 + 208));
    fips186_2prf(v57, a1 + 40);
    if (EAPSIMAKAKeyInfoVerifyMAC(a1 + 40, a2, v26 + 4, 0, 0))
    {
      if (eapaka_challenge_process_encr_data(a1, a3))
      {
        response_packet = (const void *)make_response_packet(a1, (uint64_t)a2, 1, (uint64_t)v18);
        TLV = TLVBufferAllocateTLV((uint64_t)v18, 11, 20);
        if (TLV)
        {
          v59 = TLV;
          *((_WORD *)TLV + 1) = 0;
          v60 = (const __CFData *)v76;
          v61 = CFDataGetLength((CFDataRef)v76);
          v62 = TLVBufferAllocateTLV((uint64_t)v18, 3, v61 + 4);
          if (v62)
          {
            v63 = v61;
            *((_WORD *)v62 + 1) = bswap32(8 * v61) >> 16;
            v64 = v62 + 4;
            v65 = CFDataGetBytePtr(v60);
            memmove(v64, v65, v63);
            v66 = TLVBufferUsed((uint64_t)v18);
            EAPPacketSetLength((uint64_t)response_packet, (unsigned __int16)(v66 + 8));
            EAPSIMAKAKeyInfoSetMAC(a1 + 40, response_packet, v59 + 4, 0, 0);
            *(_DWORD *)(a1 + 12) = 4;
            *(_BYTE *)(a1 + 200) = 1;
            goto LABEL_40;
          }
          v69 = EAPLogGetLogHandle();
          v70 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v69, v70))
            goto LABEL_46;
          v73 = TLVBufferErrorString((uint64_t)v18);
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v78 = v73;
          v72 = "eapaka: failed allocating AT_RES, %s";
          goto LABEL_45;
        }
        v69 = EAPLogGetLogHandle();
        v70 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v69, v70))
        {
          v71 = TLVBufferErrorString((uint64_t)v18);
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v78 = v71;
          v72 = "eapaka: failed allocating AT_MAC, %s";
LABEL_45:
          _os_log_impl(&dword_206440000, v69, v70, v72, buf, 0xCu);
        }
LABEL_46:
        response_packet = 0;
        v67 = 8;
        goto LABEL_39;
      }
LABEL_38:
      response_packet = 0;
      v67 = 17;
LABEL_39:
      *a4 = v67;
      goto LABEL_40;
    }
    LogHandle = EAPLogGetLogHandle();
    v32 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v32))
      goto LABEL_38;
    *(_WORD *)buf = 0;
    v33 = "eapaka: Challenge AT_MAC not valid";
LABEL_37:
    _os_log_impl(&dword_206440000, LogHandle, v32, v33, buf, 2u);
    goto LABEL_38;
  }
  v40 = (const __CFData *)*((_QWORD *)&v76 + 1);
  if (*((_QWORD *)&v76 + 1))
    v41 = 4;
  else
    v41 = 2;
  response_packet = (const void *)make_response_packet(a1, (uint64_t)a2, v41, (uint64_t)v18);
  if (v40)
  {
    v43 = CFDataGetLength(v40);
    if (v43 != 14)
    {
      v44 = EAPLogGetLogHandle();
      v45 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v44, v45))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v78 = v43;
        *(_WORD *)&v78[4] = 1024;
        *(_DWORD *)&v78[6] = 14;
        _os_log_impl(&dword_206440000, v44, v45, "eapaka: SIM bogus AUTS size %d (should be %d)", buf, 0xEu);
      }
      *a4 = 8;
    }
    v46 = TLVBufferAllocateTLV((uint64_t)v18, 4, 16);
    v47 = CFDataGetBytePtr(v40);
    v48 = *((_WORD *)v47 + 6);
    v49 = *((_DWORD *)v47 + 2);
    *(_QWORD *)(v46 + 2) = *(_QWORD *)v47;
    *(_DWORD *)(v46 + 10) = v49;
    *((_WORD *)v46 + 7) = v48;
  }
  v50 = TLVBufferUsed((uint64_t)v18);
  EAPPacketSetLength((uint64_t)response_packet, (unsigned __int16)(v50 + 8));
LABEL_40:
  AKAAuthResultsRelease((const void **)&v75);
  return response_packet;
}

uint64_t eapaka_identity(uint64_t a1, uint64_t a2, int *a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  size_t v20;
  int v21;
  int *v22;
  NSObject *LogHandle;
  os_log_type_t v24;
  int v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint32_t v29;
  int v30;
  int v31;
  NSObject *v32;
  os_log_type_t v33;
  int v34;
  int v35;
  NSObject *v36;
  os_log_type_t v37;
  const char *String;
  int v39;
  uint64_t response_packet;
  const void *v41;
  CFTypeID TypeID;
  const void *ExternalRepresentation;
  uint64_t *v44;
  _BOOL4 v45;
  uint64_t *v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  NSObject *v50;
  os_log_type_t v51;
  NSObject *v52;
  os_log_type_t v53;
  const __CFString *v54;
  NSObject *v55;
  os_log_type_t v56;
  const char *v57;
  const char *v58;
  int v59;
  int v60;
  const UInt8 *BytePtr;
  signed int Length;
  __int16 v64;
  NSObject *v65;
  os_log_type_t v66;
  uint64_t v67;
  uint64_t v68;
  const void *v69;
  _BYTE buf[18];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  HIBYTE(v68) = 0;
  v8 = TLVBufferSizeof();
  MEMORY[0x24BDAC7A8](v8, v9, v10, v11, v12, v13, v14, v15, v68, 0, *(_QWORD *)buf, *(_QWORD *)&buf[8]);
  v18 = (char *)&v68 - v17;
  if ((v19 & 0x7FFFFFE00) != 0)
    v20 = 512;
  else
    v20 = v16;
  bzero((char *)&v68 - v17, v20);
  if (*(_DWORD *)(a1 + 12) == 1)
  {
    v22 = (int *)(a1 + 20);
    v21 = *(_DWORD *)(a1 + 20);
    *(_DWORD *)(a1 + 20) = v21 + 1;
    if (v21 >= 3)
    {
      LogHandle = EAPLogGetLogHandle();
      v24 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v24))
      {
        v25 = *v22;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = v25;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = 3;
        v26 = "eapaka: too many Identity packets (%d > %d)";
        v27 = LogHandle;
        v28 = v24;
        v29 = 14;
LABEL_55:
        _os_log_impl(&dword_206440000, v27, v28, v26, buf, v29);
        goto LABEL_56;
      }
      goto LABEL_56;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 20) = 1;
    v22 = (int *)(a1 + 20);
    *(_BYTE *)(a1 + 28) = 0;
    *(_QWORD *)(a1 + 8) = 0x100000000;
  }
  v30 = TLVListLookupIdentityAttribute(a3);
  v31 = v30;
  if (v30 == 10)
  {
    if (*v22 < 2)
      goto LABEL_22;
    v35 = *(unsigned __int8 *)(a1 + 28);
    if (v35 == 13 || v35 == 17)
      goto LABEL_22;
    v36 = EAPLogGetLogHandle();
    v37 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v36, v37))
      goto LABEL_56;
    String = EAPSIMAKAAttributeTypeGetString(*(unsigned __int8 *)(a1 + 28));
    v39 = *(_DWORD *)(a1 + 20);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = String;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v39;
    v26 = "eapaka: AT_PERMANENT_ID_REQ follows %s at Identity #%d";
LABEL_54:
    v27 = v36;
    v28 = v37;
    v29 = 18;
    goto LABEL_55;
  }
  if (v30 == 17)
  {
    if (*v22 < 2 || *(_BYTE *)(a1 + 28) == 13)
      goto LABEL_22;
    v36 = EAPLogGetLogHandle();
    v37 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v36, v37))
      goto LABEL_56;
    v58 = EAPSIMAKAAttributeTypeGetString(*(unsigned __int8 *)(a1 + 28));
    v59 = *(_DWORD *)(a1 + 20);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = v58;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v59;
    v26 = "eapaka: AT_FULLAUTH_ID_REQ follows %s at Identity #%d";
    goto LABEL_54;
  }
  if (v30 != 13)
  {
    v48 = EAPLogGetLogHandle();
    v49 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v48, v49))
    {
      *(_WORD *)buf = 0;
      v26 = "eapaka: AKA-Identity missing *ID_REQ";
      v27 = v48;
      v28 = v49;
      v29 = 2;
      goto LABEL_55;
    }
    goto LABEL_56;
  }
  if (*v22 >= 2)
  {
    v32 = EAPLogGetLogHandle();
    v33 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = *v22;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v34;
      v26 = "eapaka: AT_ANY_ID_REQ at Identity #%d";
      v27 = v32;
      v28 = v33;
      v29 = 8;
      goto LABEL_55;
    }
LABEL_56:
    response_packet = 0;
    v60 = 17;
LABEL_57:
    *a4 = v60;
    goto LABEL_58;
  }
LABEL_22:
  *(_BYTE *)(a1 + 240) = 0;
  *(_BYTE *)(a1 + 28) = v30;
  response_packet = make_response_packet(a1, a2, 5, (uint64_t)v18);
  v41 = *(const void **)(*(_QWORD *)a1 + 56);
  TypeID = CFDataGetTypeID();
  if (v41 && CFGetTypeID(v41) == TypeID && CFDataGetLength(*(CFDataRef *)(*(_QWORD *)a1 + 56)) >= 1)
  {
    ExternalRepresentation = CFRetain(*(CFTypeRef *)(*(_QWORD *)a1 + 56));
    v69 = ExternalRepresentation;
    goto LABEL_64;
  }
  v44 = *(uint64_t **)(a1 + 224);
  if (!v44)
  {
LABEL_45:
    v54 = sim_identity_create_0(*(_QWORD *)(a1 + 208), *(CFDictionaryRef *)(*(_QWORD *)a1 + 80), v31, 0, (_BYTE *)&v68 + 7, a4);
    *(_QWORD *)buf = v54;
    if (v54)
    {
      ExternalRepresentation = CFStringCreateExternalRepresentation(0, v54, 0x8000100u, 0);
      v69 = ExternalRepresentation;
      EAPAKAContextSetLastIdentity(a1, ExternalRepresentation);
      my_CFRelease((const void **)buf);
      goto LABEL_64;
    }
    if (*a4 == 17)
    {
      v55 = EAPLogGetLogHandle();
      v56 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v55, v56))
      {
LABEL_62:
        response_packet = 0;
        goto LABEL_58;
      }
      LOWORD(v68) = 0;
      v57 = "eapaka: protocol error.";
    }
    else
    {
      if (*a4 != 16)
        goto LABEL_62;
      v55 = EAPLogGetLogHandle();
      v56 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v55, v56))
        goto LABEL_62;
      LOWORD(v68) = 0;
      v57 = "eapaka: can't find SIM identity";
    }
    _os_log_impl(&dword_206440000, v55, v56, v57, (uint8_t *)&v68, 2u);
    goto LABEL_62;
  }
  if (v44[2])
  {
    v45 = EAPSIMAKAPersistentStateTemporaryUsernameAvailable(*(_QWORD *)(a1 + 208));
    v46 = *(uint64_t **)(a1 + 224);
    if (v31 == 10 || !v45)
    {
      ExternalRepresentation = CFRetain((CFTypeRef)v46[2]);
      v69 = ExternalRepresentation;
      EAPAKAContextSetLastIdentity(a1, ExternalRepresentation);
      goto LABEL_64;
    }
    if (!v46)
      goto LABEL_45;
    v47 = *v46;
  }
  else
  {
    v47 = *v44;
    if (v31 == 10 && v47)
    {
      *a4 = 17;
      if (EAPSIMAKAPersistentStateTemporaryUsernameAvailable(*(_QWORD *)(a1 + 208)))
      {
        v50 = EAPLogGetLogHandle();
        v51 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v50, v51))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_206440000, v50, v51, "eapaka: purging all the temporary identities", buf, 2u);
        }
        EAPSIMAKAPersistentStatePurgeTemporaryIDs(*(_QWORD *)(a1 + 208));
      }
      v52 = EAPLogGetLogHandle();
      v53 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v52, v53))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_206440000, v52, v53, "eapaka: requesting out-of-band psuedonym", buf, 2u);
      }
      SIMReportDecryptionError(0);
      goto LABEL_62;
    }
  }
  if (!v47 || EAPSIMAKAPersistentStateTemporaryUsernameAvailable(*(_QWORD *)(a1 + 208)))
    goto LABEL_45;
  ExternalRepresentation = CFStringCreateExternalRepresentation(0, **(CFStringRef **)(a1 + 224), 0x8000100u, 0);
  v69 = ExternalRepresentation;
  EAPAKAContextSetLastIdentity(a1, ExternalRepresentation);
  *(_BYTE *)(a1 + 240) = 1;
LABEL_64:
  BytePtr = CFDataGetBytePtr((CFDataRef)ExternalRepresentation);
  Length = CFDataGetLength((CFDataRef)ExternalRepresentation);
  if (!TLVBufferAddIdentity((uint64_t)v18, BytePtr, Length))
  {
    v65 = EAPLogGetLogHandle();
    v66 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v65, v66))
    {
      v67 = TLVBufferErrorString((uint64_t)v18);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v67;
      _os_log_impl(&dword_206440000, v65, v66, "eapaka: can't add AT_IDENTITY, %s", buf, 0xCu);
    }
    response_packet = 0;
    v60 = 8;
    goto LABEL_57;
  }
  if (!HIBYTE(v68))
    *(_BYTE *)(a1 + 200) = 0;
  v64 = TLVBufferUsed((uint64_t)v18);
  EAPPacketSetLength(response_packet, (unsigned __int16)(v64 + 8));
LABEL_58:
  my_CFRelease(&v69);
  return response_packet;
}

const void *eapaka_notification(uint64_t a1, const void *a2, unsigned __int8 ***a3, int *a4, _DWORD *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  size_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  size_t v22;
  uint64_t v23;
  unsigned int v24;
  NSObject *v25;
  os_log_type_t v26;
  const char *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint32_t v30;
  NSObject *LogHandle;
  os_log_type_t v32;
  uint64_t v33;
  unsigned int Counter;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  size_t v43;
  uint64_t v44;
  unsigned __int8 ***v45;
  uint64_t v46;
  size_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  os_log_type_t v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int v56;
  const void *response_packet;
  int v58;
  _BYTE *TLV;
  __int16 v61;
  const char *String;
  NSObject *v63;
  os_log_type_t v64;
  _BOOL4 v65;
  const char *v66;
  NSObject *v67;
  os_log_type_t v68;
  uint32_t v69;
  NSObject *v70;
  os_log_type_t v71;
  const char *v72;
  NSObject *v73;
  os_log_type_t v74;
  uint32_t v75;
  int v76;
  NSObject *v77;
  os_log_type_t v78;
  uint64_t v79;
  NSObject *v80;
  os_log_type_t v81;
  const __CFDictionary *v82;
  const __CFDictionary *v83;
  NSObject *v84;
  os_log_type_t v85;
  uint64_t v86;
  uint64_t v87;
  unsigned int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  size_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  size_t v101;
  NSObject *v102;
  os_log_type_t v103;
  NSObject *v104;
  os_log_type_t v105;
  NSObject *v106;
  os_log_type_t v107;
  uint64_t v108;
  int v109;
  uint64_t v110;
  const void *v111;
  void *v112;
  __CFString *v113;
  unsigned int v114;
  uint64_t *v115;
  uint8_t v116[4];
  uint64_t v117;
  uint8_t buf[4];
  _BYTE v119[10];
  uint64_t v120;
  uint64_t v121;

  v121 = *MEMORY[0x24BDAC8D0];
  v10 = TLVBufferSizeof();
  MEMORY[0x24BDAC7A8](v10, v11, v12, v13, v14, v15, v16, v17, v110, v111, v112, v113);
  v20 = (char *)&v110 - v19;
  if ((v21 & 0x7FFFFFE00) != 0)
    v22 = 512;
  else
    v22 = v18;
  bzero((char *)&v110 - v19, v22);
  *a4 = 0;
  *a5 = 0;
  v23 = TLVListLookupAttribute(a3, 12);
  if (!v23)
  {
    LogHandle = EAPLogGetLogHandle();
    v32 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v32))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v27 = "eapaka: Notification does not contain AT_NOTIFICATION attribute";
LABEL_32:
    v28 = LogHandle;
    v29 = v32;
    v30 = 2;
    goto LABEL_33;
  }
  v24 = bswap32(*(unsigned __int16 *)(v23 + 2)) >> 16;
  if (v24 >= 0xC000)
  {
    v25 = EAPLogGetLogHandle();
    v26 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v25, v26))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v119 = v24;
      v27 = "eapaka: Notification code '%d' indicates success before authentication";
      v28 = v25;
      v29 = v26;
      v30 = 8;
LABEL_33:
      _os_log_impl(&dword_206440000, v28, v29, v27, buf, v30);
    }
LABEL_34:
    response_packet = 0;
    v58 = 17;
LABEL_35:
    *a4 = v58;
    return response_packet;
  }
  v33 = TLVListLookupAttribute(a3, 11);
  if (v33)
  {
    if ((v24 & 0x4000) != 0)
    {
      LogHandle = EAPLogGetLogHandle();
      v32 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v32))
        goto LABEL_34;
      *(_WORD *)buf = 0;
      v27 = "eapaka: Notification incorrectly contains AT_MAC";
      goto LABEL_32;
    }
    if (!EAPSIMAKAKeyInfoVerifyMAC(a1 + 40, a2, v33 + 4, 0, 0))
    {
      LogHandle = EAPLogGetLogHandle();
      v32 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v32))
        goto LABEL_34;
      *(_WORD *)buf = 0;
      v27 = "eapaka: Notification AT_MAC not valid";
      goto LABEL_32;
    }
  }
  else if ((v24 & 0x4000) == 0)
  {
    LogHandle = EAPLogGetLogHandle();
    v32 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v32))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v27 = "eapaka: Notification is missing AT_MAC";
    goto LABEL_32;
  }
  Counter = EAPSIMAKAPersistentStateGetCounter(*(_QWORD *)(a1 + 208));
  if ((v24 & 0x4000) == 0 && *(_BYTE *)(a1 + 216))
  {
    v114 = Counter;
    v35 = TLVListSizeof();
    v115 = &v110;
    MEMORY[0x24BDAC7A8](v35, v36, v37, v38, v39, v40, v41, v42, v110, v111, v112, v113);
    v45 = (unsigned __int8 ***)((char *)&v110 - v44);
    if ((v46 & 0x7FFFFFE00) != 0)
      v47 = 512;
    else
      v47 = v43;
    bzero((char *)&v110 - v44, v47);
    v48 = TLVListLookupAttribute(a3, 130);
    v49 = TLVListLookupAttribute(a3, 129);
    v50 = v49;
    if (v48 && v49)
    {
      TLVListInit(v45);
      v111 = (const void *)(a1 + 40);
      v51 = EAPSIMAKAKeyInfoDecryptTLVList((const void *)(a1 + 40), v48, v50, (uint64_t)v45);
      if (!v51)
      {
        v80 = EAPLogGetLogHandle();
        v81 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v80, v81))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_206440000, v80, v81, "eapaka: failed to decrypt Notification AT_ENCR_DATA", buf, 2u);
        }
        v76 = 8;
        goto LABEL_57;
      }
      v112 = v51;
      v113 = TLVListCopyDescription(v45);
      v52 = EAPLogGetLogHandle();
      v53 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v52, v53))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v119 = v113;
        _os_log_impl(&dword_206440000, v52, v53, "Decrypted TLVs:\n%@", buf, 0xCu);
      }
      CFRelease(v113);
      v54 = TLVListLookupAttribute(v45, 19);
      v55 = v54;
      if (v54)
        v56 = bswap32(*(unsigned __int16 *)(v54 + 2)) >> 16;
      else
        v56 = 0;
      free(v112);
      TLVListFree((uint64_t)v45);
      if (v55)
      {
        v88 = v114;
        if (v56 == v114)
        {
          response_packet = (const void *)make_response_packet(a1, (uint64_t)a2, 12, (uint64_t)v20);
          v89 = TLVBufferSizeof();
          MEMORY[0x24BDAC7A8](v89, v90, v91, v92, v93, v94, v95, v96, v110, v111, v112, v113);
          v99 = (char *)&v110 - v98;
          if ((v100 & 0x7FFFFFE00) != 0)
            v101 = 512;
          else
            v101 = v97;
          bzero((char *)&v110 - v98, v101);
          TLVBufferInit((uint64_t)v99, (uint64_t)buf, 16);
          if (TLVBufferAddCounter((uint64_t)v99, v88))
          {
            if (EAPSIMAKAKeyInfoEncryptTLVs(v111, (uint64_t)v20, (uint64_t)v99))
            {
              if (!v33)
                goto LABEL_40;
              goto LABEL_38;
            }
            v109 = 8;
          }
          else
          {
            v106 = EAPLogGetLogHandle();
            v107 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v106, v107))
            {
              v108 = TLVBufferErrorString((uint64_t)v99);
              *(_DWORD *)v116 = 136315138;
              v117 = v108;
              _os_log_impl(&dword_206440000, v106, v107, "eapaka: failed to allocate AT_COUNTER, %s", v116, 0xCu);
            }
            v109 = 2;
          }
          *a4 = v109;
          return 0;
        }
        v104 = EAPLogGetLogHandle();
        v105 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v104, v105))
          goto LABEL_49;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v119 = v56;
        *(_WORD *)&v119[4] = 1024;
        *(_DWORD *)&v119[6] = v88;
        v72 = "eapaka: Notification AT_COUNTER (%d) does not match current counter (%d)";
        v73 = v104;
        v74 = v105;
        v75 = 14;
      }
      else
      {
        v102 = EAPLogGetLogHandle();
        v103 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v102, v103))
          goto LABEL_49;
        *(_WORD *)buf = 0;
        v72 = "eapaka:  Notification AT_ENCR_DATA missing AT_COUNTER";
        v73 = v102;
        v74 = v103;
        v75 = 2;
      }
    }
    else
    {
      v70 = EAPLogGetLogHandle();
      v71 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v70, v71))
      {
LABEL_49:
        v76 = 17;
LABEL_57:
        *a4 = v76;
        return 0;
      }
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v119 = v48;
      *(_WORD *)&v119[8] = 2048;
      v120 = v50;
      v72 = "eapaka: Notification after re-auth missing AT_ENCR_DATA (%p) or AT_IV (%p)";
      v73 = v70;
      v74 = v71;
      v75 = 22;
    }
    _os_log_impl(&dword_206440000, v73, v74, v72, buf, v75);
    goto LABEL_49;
  }
  response_packet = (const void *)make_response_packet(a1, (uint64_t)a2, 12, (uint64_t)v20);
  if (!v33)
    goto LABEL_40;
LABEL_38:
  TLV = TLVBufferAllocateTLV((uint64_t)v20, 11, 20);
  if (!TLV)
  {
    v77 = EAPLogGetLogHandle();
    v78 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v77, v78))
    {
      v79 = TLVBufferErrorString((uint64_t)v20);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v119 = v79;
      _os_log_impl(&dword_206440000, v77, v78, "eapaka: failed allocating AT_MAC, %s", buf, 0xCu);
    }
    response_packet = 0;
    v58 = 2;
    goto LABEL_35;
  }
  v33 = (uint64_t)TLV;
  *((_WORD *)TLV + 1) = 0;
LABEL_40:
  v61 = TLVBufferUsed((uint64_t)v20);
  EAPPacketSetLength((uint64_t)response_packet, (unsigned __int16)(v61 + 8));
  if (v33)
    EAPSIMAKAKeyInfoSetMAC(a1 + 40, response_packet, (_OWORD *)(v33 + 4), 0, 0);
  if ((v24 & 0x8000) != 0)
  {
    *(_DWORD *)(a1 + 12) = 4;
    return response_packet;
  }
  *(_DWORD *)(a1 + 12) = 5;
  *a4 = 1002;
  *a5 = EAPSIMAKAStatusForATNotificationCode(v24);
  String = ATNotificationCodeGetString(v24);
  v63 = EAPLogGetLogHandle();
  v64 = _SC_syslog_os_log_mapping();
  v65 = os_log_type_enabled(v63, v64);
  if (String)
  {
    if (!v65)
      goto LABEL_62;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v119 = String;
    v66 = "eapaka: Notification: %s";
    v67 = v63;
    v68 = v64;
    v69 = 12;
  }
  else
  {
    if (!v65)
      goto LABEL_62;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v119 = v24;
    v66 = "eapaka: Notification code '%d' unrecognized failure";
    v67 = v63;
    v68 = v64;
    v69 = 8;
  }
  _os_log_impl(&dword_206440000, v67, v68, v66, buf, v69);
LABEL_62:
  v82 = (const __CFDictionary *)EAPSIMAKAActionInfoForNotificationCode(*(const __CFDictionary **)(*(_QWORD *)a1 + 80), v24);
  if (v82)
  {
    v83 = v82;
    *(_QWORD *)(a1 + 232) = CFDictionaryCreateCopy(0, v82);
    v84 = EAPLogGetLogHandle();
    v85 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v84, v85))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v119 = v83;
      _os_log_impl(&dword_206440000, v84, v85, "eapaka: Notification Action Info: %@", buf, 0xCu);
    }
  }
  else if (*a5 == 19)
  {
    v86 = *(_QWORD *)(a1 + 224);
    if (v86)
    {
      v87 = *(_QWORD *)(v86 + 16);
      if (v87)
        SIMReportDecryptionError(v87);
    }
  }
  return response_packet;
}

const void *eapaka_reauthentication(uint64_t a1, const void *a2, unsigned __int8 ***a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  size_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  size_t v29;
  uint64_t v30;
  unsigned __int8 ***v31;
  uint64_t v32;
  size_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  size_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  size_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  os_log_type_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int v57;
  CFStringRef StringFromAttribute;
  CFStringRef v59;
  const void *response_packet;
  BOOL v61;
  unsigned int v62;
  _BYTE *TLV;
  _BYTE *v64;
  __int16 v65;
  uint64_t v66;
  NSObject *LogHandle;
  os_log_type_t v68;
  const char *v69;
  NSObject *v71;
  os_log_type_t v72;
  NSObject *v73;
  os_log_type_t v74;
  NSObject *v75;
  os_log_type_t v76;
  int v77;
  NSObject *v78;
  os_log_type_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  __CFString *v87;
  uint8_t v88[4];
  uint64_t v89;
  uint8_t buf[4];
  __CFString *v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v8 = TLVBufferSizeof();
  MEMORY[0x24BDAC7A8](v8, v9, v10, v11, v12, v13, v14, v15, v84, v85, v86, v87);
  v18 = (char *)&v84 - v17;
  if ((v19 & 0x7FFFFFE00) != 0)
    v20 = 512;
  else
    v20 = v16;
  bzero((char *)&v84 - v17, v20);
  v21 = TLVListSizeof();
  MEMORY[0x24BDAC7A8](v21, v22, v23, v24, v25, v26, v27, v28, v84, v85, v86, v87);
  v31 = (unsigned __int8 ***)((char *)&v84 - v30);
  if ((v32 & 0x7FFFFFE00) != 0)
    v33 = 512;
  else
    v33 = v29;
  bzero((char *)&v84 - v30, v33);
  v34 = TLVBufferSizeof();
  MEMORY[0x24BDAC7A8](v34, v35, v36, v37, v38, v39, v40, v41, v84, v85, v86, v87);
  v44 = (char *)&v84 - v43;
  if ((v45 & 0x7FFFFFE00) != 0)
    v46 = 512;
  else
    v46 = v42;
  bzero((char *)&v84 - v43, v46);
  TLVListInit(v31);
  if (!*(_BYTE *)(a1 + 200))
  {
    LogHandle = EAPLogGetLogHandle();
    v68 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v68))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v69 = "eapaka: Reauthentication but no key info available";
LABEL_40:
    _os_log_impl(&dword_206440000, LogHandle, v68, v69, buf, 2u);
    goto LABEL_41;
  }
  if (!EAPSIMAKAPersistentStateGetReauthID(*(_QWORD *)(a1 + 208)))
  {
    LogHandle = EAPLogGetLogHandle();
    v68 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v68))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v69 = "eapaka: received Reauthentication but don't have reauth id";
    goto LABEL_40;
  }
  *(_QWORD *)(a1 + 8) = 0x300000000;
  EAPSIMAKAPersistentStateSetReauthID(*(_QWORD *)(a1 + 208), 0);
  v47 = TLVListLookupAttribute(a3, 11);
  if (!v47)
  {
    LogHandle = EAPLogGetLogHandle();
    v68 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v68))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v69 = "eapaka: Reauthentication is missing AT_MAC";
    goto LABEL_40;
  }
  if (!EAPSIMAKAKeyInfoVerifyMAC(a1 + 40, a2, v47 + 4, 0, 0))
  {
    LogHandle = EAPLogGetLogHandle();
    v68 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v68))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v69 = "eapaka: Reauthentication AT_MAC not valid";
    goto LABEL_40;
  }
  v48 = TLVListLookupAttribute(a3, 130);
  v49 = TLVListLookupAttribute(a3, 129);
  v50 = v49;
  if (!v48 || !v49)
  {
    if (!v48)
    {
      v71 = EAPLogGetLogHandle();
      v72 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v71, v72))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_206440000, v71, v72, "eapaka:  Reauthentication missing AT_ENCR_DATA", buf, 2u);
      }
    }
    if (v50)
      goto LABEL_41;
    LogHandle = EAPLogGetLogHandle();
    v68 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v68))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v69 = "eapaka:  Reauthentication missing AT_IV";
    goto LABEL_40;
  }
  v51 = EAPSIMAKAKeyInfoDecryptTLVList((const void *)(a1 + 40), v48, v49, (uint64_t)v31);
  if (v51)
  {
    v86 = v51;
    v87 = TLVListCopyDescription(v31);
    v52 = EAPLogGetLogHandle();
    v53 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v52, v53))
    {
      *(_DWORD *)buf = 138412290;
      v91 = v87;
      _os_log_impl(&dword_206440000, v52, v53, "Decrypted TLVs:\n%@", buf, 0xCu);
    }
    CFRelease(v87);
    v54 = TLVListLookupAttribute(v31, 21);
    v55 = TLVListLookupAttribute(v31, 19);
    v56 = v55;
    if (!v54 || !v55)
    {
      if (!v54)
      {
        v73 = EAPLogGetLogHandle();
        v74 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v73, v74))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_206440000, v73, v74, "eapaka: Reauthentication AT_ENCR_DATA missing AT_NONCE_S", buf, 2u);
        }
      }
      if (!v56)
      {
        v75 = EAPLogGetLogHandle();
        v76 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v75, v76))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_206440000, v75, v76, "eapaka: Reauthentication AT_ENCR_DATA missing AT_COUNTER", buf, 2u);
        }
      }
      response_packet = 0;
      v77 = 17;
      goto LABEL_66;
    }
    v85 = v54;
    v57 = bswap32(*(unsigned __int16 *)(v55 + 2)) >> 16;
    LODWORD(v87) = EAPSIMAKAPersistentStateGetCounter(*(_QWORD *)(a1 + 208));
    if (v57 >= v87)
    {
      v84 = v56;
      StringFromAttribute = TLVListCreateStringFromAttribute((uint64_t)v31, 133);
      if (StringFromAttribute)
      {
        v59 = StringFromAttribute;
        EAPSIMAKAPersistentStateSetReauthID(*(_QWORD *)(a1 + 208), StringFromAttribute);
        CFRelease(v59);
      }
      EAPSIMAKAPersistentStateSetCounter(*(_QWORD *)(a1 + 208), v57 + 1);
      v56 = v84;
    }
    response_packet = (const void *)make_response_packet(a1, (uint64_t)a2, 13, (uint64_t)v44);
    TLVBufferInit((uint64_t)v18, (uint64_t)buf, 16);
    if (TLVBufferAddCounter((uint64_t)v18, v57))
    {
      LODWORD(v84) = v57;
      v61 = v57 >= v87;
      v62 = v87;
      if (v61 || TLVBufferAddCounterTooSmall((uint64_t)v18))
      {
        if (!EAPSIMAKAKeyInfoEncryptTLVs((const void *)(a1 + 40), (uint64_t)v44, (uint64_t)v18))
          goto LABEL_65;
        TLV = TLVBufferAllocateTLV((uint64_t)v44, 11, 20);
        if (TLV)
        {
          v64 = TLV;
          *((_WORD *)TLV + 1) = 0;
          v65 = TLVBufferUsed((uint64_t)v44);
          EAPPacketSetLength((uint64_t)response_packet, (unsigned __int16)(v65 + 8));
          v66 = v85;
          EAPSIMAKAKeyInfoSetMAC(a1 + 40, response_packet, v64 + 4, (const void *)(v85 + 4), 16);
          if (v84 >= v62)
          {
            *(_DWORD *)(a1 + 12) = 4;
            eapaka_compute_reauth_key(a1, v56, v66);
            *(_BYTE *)(a1 + 200) = 1;
            *(_BYTE *)(a1 + 216) = 1;
          }
          else
          {
            *(_BYTE *)(a1 + 200) = 0;
          }
          goto LABEL_67;
        }
        v78 = EAPLogGetLogHandle();
        v79 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v78, v79))
          goto LABEL_65;
        v83 = TLVBufferErrorString((uint64_t)v44);
        *(_DWORD *)v88 = 136315138;
        v89 = v83;
        v81 = "eapaka: failed allocating AT_MAC, %s";
        goto LABEL_64;
      }
      v78 = EAPLogGetLogHandle();
      v79 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v78, v79))
      {
        v82 = TLVBufferErrorString((uint64_t)v44);
        *(_DWORD *)v88 = 136315138;
        v89 = v82;
        v81 = "eapaka: failed allocating AT_COUNTER_TOO_SMALL, %s";
        goto LABEL_64;
      }
    }
    else
    {
      v78 = EAPLogGetLogHandle();
      v79 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v78, v79))
      {
        v80 = TLVBufferErrorString((uint64_t)v44);
        *(_DWORD *)v88 = 136315138;
        v89 = v80;
        v81 = "eapaka: failed allocating AT_COUNTER, %s";
LABEL_64:
        _os_log_impl(&dword_206440000, v78, v79, v81, v88, 0xCu);
      }
    }
LABEL_65:
    response_packet = 0;
    v77 = 8;
LABEL_66:
    *a4 = v77;
LABEL_67:
    free(v86);
    goto LABEL_42;
  }
  LogHandle = EAPLogGetLogHandle();
  v68 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v68))
  {
    *(_WORD *)buf = 0;
    v69 = "eapaka: failed to decrypt Reauthentication AT_ENCR_DATA";
    goto LABEL_40;
  }
LABEL_41:
  response_packet = 0;
  *a4 = 17;
LABEL_42:
  TLVListFree((uint64_t)v31);
  return response_packet;
}

uint64_t make_client_error_packet(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  size_t v16;
  uint64_t response_packet;
  _BYTE *TLV;
  __int16 v19;
  NSObject *LogHandle;
  os_log_type_t v21;
  uint64_t v22;
  __int128 buf;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = TLVBufferSizeof();
  MEMORY[0x24BDAC7A8](v4, v5, v6, v7, v8, v9, v10, v11, buf, *((_QWORD *)&buf + 1), v25, v26);
  v14 = (char *)&buf - v13;
  if ((v15 & 0x7FFFFFE00) != 0)
    v16 = 512;
  else
    v16 = v12;
  bzero((char *)&buf - v13, v16);
  response_packet = make_response_packet(a1, a2, 14, (uint64_t)v14);
  TLV = TLVBufferAllocateTLV((uint64_t)v14, 22, 4);
  if (TLV)
  {
    *((_WORD *)TLV + 1) = 0;
    v19 = TLVBufferUsed((uint64_t)v14);
    EAPPacketSetLength(response_packet, (unsigned __int16)(v19 + 8));
  }
  else
  {
    LogHandle = EAPLogGetLogHandle();
    v21 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v21))
    {
      v22 = TLVBufferErrorString((uint64_t)v14);
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v22;
      _os_log_impl(&dword_206440000, LogHandle, v21, "eapaka: failed allocating AT_CLIENT_ERROR_CODE, %s", (uint8_t *)&buf, 0xCu);
    }
    return 0;
  }
  return response_packet;
}

uint64_t make_response_packet(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v7;

  v7 = a1 + 272;
  TLVBufferInit(a4, a1 + 280, 1492);
  *(_BYTE *)(a1 + 272) = 2;
  *(_BYTE *)(a1 + 273) = *(_BYTE *)(a2 + 1);
  *(_BYTE *)(a1 + 276) = 23;
  *(_BYTE *)(a1 + 277) = a3;
  *(_WORD *)(a1 + 278) = 0;
  return v7;
}

BOOL eapaka_challenge_process_encr_data(uint64_t a1, unsigned __int8 ***a2)
{
  size_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSObject *v15;
  os_log_type_t v16;
  CFStringRef StringFromAttribute;
  CFStringRef v18;
  CFStringRef v19;
  CFStringRef v20;
  _BOOL8 result;
  NSObject *LogHandle;
  os_log_type_t v23;
  const char *v24;
  uint8_t buf[4];
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  TLVListSizeof();
  MEMORY[0x24BDAC7A8]();
  v6 = &buf[-v5];
  if ((v7 & 0x7FFFFFE00) != 0)
    v8 = 512;
  else
    v8 = v4;
  bzero(&buf[-v5], v8);
  TLVListInit(v6);
  v9 = TLVListLookupAttribute(a2, 130);
  if (!v9)
    return 1;
  v10 = v9;
  v11 = TLVListLookupAttribute(a2, 129);
  if (!v11)
  {
    LogHandle = EAPLogGetLogHandle();
    v23 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(LogHandle, v23);
    if (!result)
      return result;
    *(_WORD *)buf = 0;
    v24 = "eapaka: Challenge missing AT_IV";
    goto LABEL_19;
  }
  v12 = EAPSIMAKAKeyInfoDecryptTLVList((const void *)(a1 + 40), v10, v11, (uint64_t)v6);
  if (v12)
  {
    v13 = v12;
    v14 = TLVListCopyDescription((unsigned __int8 ***)v6);
    v15 = EAPLogGetLogHandle();
    v16 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v14;
      _os_log_impl(&dword_206440000, v15, v16, "Decrypted TLVs:\n%@", buf, 0xCu);
    }
    CFRelease(v14);
    StringFromAttribute = TLVListCreateStringFromAttribute((uint64_t)v6, 133);
    if (StringFromAttribute)
    {
      v18 = StringFromAttribute;
      EAPSIMAKAPersistentStateSetReauthID(*(_QWORD *)(a1 + 208), StringFromAttribute);
      CFRelease(v18);
    }
    v19 = TLVListCreateStringFromAttribute((uint64_t)v6, 132);
    if (v19)
    {
      v20 = v19;
      EAPSIMAKAPersistentStateSetPseudonym(*(_QWORD *)(a1 + 208), v19);
      CFRelease(v20);
    }
    free(v13);
    TLVListFree((uint64_t)v6);
    return 1;
  }
  LogHandle = EAPLogGetLogHandle();
  v23 = _SC_syslog_os_log_mapping();
  result = os_log_type_enabled(LogHandle, v23);
  if (result)
  {
    *(_WORD *)buf = 0;
    v24 = "eapaka: Challenge decrypt AT_ENCR_DATA failed";
LABEL_19:
    _os_log_impl(&dword_206440000, LogHandle, v23, v24, buf, 2u);
    return 0;
  }
  return result;
}

double eapaka_compute_reauth_key(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const __CFData *v6;
  const UInt8 *BytePtr;
  CC_LONG Length;

  v6 = *(const __CFData **)(a1 + 32);
  if (v6)
  {
    BytePtr = CFDataGetBytePtr(v6);
    Length = CFDataGetLength(*(CFDataRef *)(a1 + 32));
  }
  else
  {
    BytePtr = *(const UInt8 **)(*(_QWORD *)a1 + 40);
    Length = *(_DWORD *)(*(_QWORD *)a1 + 48);
  }
  return EAPSIMAKAKeyInfoComputeReauthKey((_OWORD *)(a1 + 40), *(_QWORD *)(a1 + 208), BytePtr, Length, a2, a3);
}

os_log_t EAPLogGetLogHandle()
{
  os_log_t result;

  result = (os_log_t)S_eap_logger;
  if (!S_eap_logger)
  {
    result = os_log_create("com.apple.eapol", "Framework");
    S_eap_logger = (uint64_t)result;
  }
  return result;
}

os_log_t EAPLogInit(os_log_t result)
{
  if (result <= 3)
  {
    result = os_log_create("com.apple.eapol", S_eap_os_log_categories[result]);
    S_eap_logger = (uint64_t)result;
  }
  return result;
}

void EAPOLControlPrefsSynchronize()
{
  if (S_prefs)
    SCPreferencesSynchronize((SCPreferencesRef)S_prefs);
  if (S_managed_prefs)
    SCPreferencesSynchronize((SCPreferencesRef)S_managed_prefs);
}

const __SCPreferences *EAPOLControlPrefsInit(__CFRunLoop *a1, uint64_t (*a2)(_QWORD))
{
  const __SCPreferences *result;
  const __CFString *v5;
  __CFRunLoopSource *v6;
  CFRunLoopSourceContext context;

  result = SCPreferencesCreate(0, CFSTR("EAPOLControlPrefs"), CFSTR("com.apple.eapolclient.plist"));
  S_prefs = (uint64_t)result;
  if (a1)
  {
    if (a2)
    {
      S_callback = a2;
      SCPreferencesSetCallback(result, (SCPreferencesCallBack)EAPOLControlPrefsChanged, 0);
      v5 = (const __CFString *)*MEMORY[0x24BDBD598];
      SCPreferencesScheduleWithRunLoop((SCPreferencesRef)S_prefs, a1, (CFStringRef)*MEMORY[0x24BDBD598]);
      memset(&context, 0, 72);
      context.perform = (void (__cdecl *)(void *))prefs_changed;
      v6 = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &context);
      CFRunLoopAddSource(a1, v6, v5);
      dispatch_get_global_queue(0, 0);
      _scprefs_observer_watch();
      return (const __SCPreferences *)S_prefs;
    }
  }
  return result;
}

uint64_t EAPOLControlPrefsChanged()
{
  uint64_t result;

  if (S_callback)
    return S_callback(S_prefs);
  return result;
}

uint64_t EAPOLControlPrefsGetLogFlags()
{
  const __SCPreferences *v0;
  CFPropertyListRef Value;
  CFTypeID TypeID;
  const __SCPreferences *v3;
  CFTypeID v4;
  unsigned int valuePtr;

  valuePtr = 0;
  v0 = (const __SCPreferences *)S_managed_prefs;
  if (!S_managed_prefs)
  {
    v0 = SCPreferencesCreate(0, CFSTR("EAPOLControlPrefs"), CFSTR("/Library/Managed Preferences/mobile/com.apple.eapol.control.plist"));
    S_managed_prefs = (uint64_t)v0;
  }
  Value = SCPreferencesGetValue(v0, CFSTR("LogFlags"));
  TypeID = CFNumberGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
  {
    v3 = (const __SCPreferences *)S_prefs;
    if (!S_prefs)
    {
      v3 = SCPreferencesCreate(0, CFSTR("EAPOLControlPrefs"), CFSTR("com.apple.eapolclient.plist"));
      S_prefs = (uint64_t)v3;
    }
    Value = SCPreferencesGetValue(v3, CFSTR("LogFlags"));
    v4 = CFNumberGetTypeID();
    if (!Value || CFGetTypeID(Value) != v4)
      return 0;
  }
  CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, &valuePtr);
  return valuePtr;
}

uint64_t EAPOLControlPrefsGetUseBoringSSL()
{
  return prefs_get_BOOLean(CFSTR("UseBoringSSL"));
}

uint64_t prefs_get_BOOLean(CFStringRef key)
{
  const __SCPreferences *v2;
  const __CFBoolean *Value;
  CFTypeID TypeID;
  const __SCPreferences *v5;
  CFTypeID v6;

  v2 = (const __SCPreferences *)S_managed_prefs;
  if (!S_managed_prefs)
  {
    v2 = SCPreferencesCreate(0, CFSTR("EAPOLControlPrefs"), CFSTR("/Library/Managed Preferences/mobile/com.apple.eapol.control.plist"));
    S_managed_prefs = (uint64_t)v2;
  }
  Value = (const __CFBoolean *)SCPreferencesGetValue(v2, key);
  TypeID = CFBooleanGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID)
    return CFBooleanGetValue(Value);
  v5 = (const __SCPreferences *)S_prefs;
  if (!S_prefs)
  {
    v5 = SCPreferencesCreate(0, CFSTR("EAPOLControlPrefs"), CFSTR("com.apple.eapolclient.plist"));
    S_prefs = (uint64_t)v5;
  }
  Value = (const __CFBoolean *)SCPreferencesGetValue(v5, key);
  v6 = CFBooleanGetTypeID();
  if (Value && CFGetTypeID(Value) == v6)
    return CFBooleanGetValue(Value);
  else
    return 1;
}

uint64_t EAPOLControlPrefsSetLogFlags(int a1)
{
  CFNumberRef v2;
  int valuePtr;

  valuePtr = a1;
  if (a1)
  {
    v2 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
    prefs_set_number(v2);
    my_CFRelease((const void **)&v2);
  }
  else
  {
    prefs_set_number(0);
  }
  return EAPOLControlPrefsSave();
}

SCPreferencesRef prefs_set_number(const void *a1)
{
  const __SCPreferences *v2;
  SCPreferencesRef result;
  CFTypeID TypeID;

  v2 = (const __SCPreferences *)S_prefs;
  if (S_prefs
    || (result = SCPreferencesCreate(0, CFSTR("EAPOLControlPrefs"), CFSTR("com.apple.eapolclient.plist")),
        v2 = result,
        (S_prefs = (uint64_t)result) != 0))
  {
    TypeID = CFNumberGetTypeID();
    if (a1 && CFGetTypeID(a1) == TypeID)
      return (SCPreferencesRef)SCPreferencesSetValue(v2, CFSTR("LogFlags"), a1);
    else
      return (SCPreferencesRef)SCPreferencesRemoveValue(v2, CFSTR("LogFlags"));
  }
  return result;
}

uint64_t EAPOLControlPrefsSave()
{
  uint64_t result;
  uint64_t v1;

  result = S_prefs;
  if (S_prefs)
  {
    v1 = SCPreferencesCommitChanges((SCPreferencesRef)S_prefs);
    SCPreferencesSynchronize((SCPreferencesRef)S_prefs);
    return v1;
  }
  return result;
}

uint64_t EAPOLControlPrefsSetUseBoringSSL(int a1)
{
  const void **v1;

  v1 = (const void **)MEMORY[0x24BDBD270];
  if (!a1)
    v1 = (const void **)MEMORY[0x24BDBD268];
  prefs_set_BOOLean(CFSTR("UseBoringSSL"), *v1);
  return EAPOLControlPrefsSave();
}

SCPreferencesRef prefs_set_BOOLean(const __CFString *a1, const void *a2)
{
  const __SCPreferences *v4;
  SCPreferencesRef result;
  CFTypeID TypeID;

  v4 = (const __SCPreferences *)S_prefs;
  if (S_prefs
    || (result = SCPreferencesCreate(0, CFSTR("EAPOLControlPrefs"), CFSTR("com.apple.eapolclient.plist")),
        v4 = result,
        (S_prefs = (uint64_t)result) != 0))
  {
    TypeID = CFBooleanGetTypeID();
    if (a2 && CFGetTypeID(a2) == TypeID)
      return (SCPreferencesRef)SCPreferencesSetValue(v4, a1, a2);
    else
      return (SCPreferencesRef)SCPreferencesRemoveValue(v4, a1);
  }
  return result;
}

uint64_t EAPOLControlPrefsSetRevocationCheck(int a1)
{
  const void **v1;

  v1 = (const void **)MEMORY[0x24BDBD270];
  if (!a1)
    v1 = (const void **)MEMORY[0x24BDBD268];
  prefs_set_BOOLean(CFSTR("EnableRevocationCheck"), *v1);
  return EAPOLControlPrefsSave();
}

uint64_t EAPOLControlPrefsGetRevocationCheck()
{
  return prefs_get_BOOLean(CFSTR("EnableRevocationCheck"));
}

uint64_t prefs_changed()
{
  uint64_t result;

  if (S_callback)
    return S_callback(S_prefs);
  return result;
}

void __enable_prefs_observer_block_invoke(uint64_t a1)
{
  __CFRunLoopSource *v2;
  __CFRunLoop *v3;

  v2 = *(__CFRunLoopSource **)(a1 + 32);
  if (v2)
  {
    CFRunLoopSourceSignal(v2);
    v3 = *(__CFRunLoop **)(a1 + 40);
    if (v3)
      CFRunLoopWakeUp(v3);
  }
}

BOOL EAPTLSSecTrustSaveExceptionsBinding(__SecTrust *a1, const __CFString *a2, const void *a3, void *a4)
{
  CFDataRef v7;
  CFDataRef v8;
  const __CFString *v9;
  const __CFString *v10;
  __CFDictionary *v11;
  const __CFDictionary *v12;
  CFTypeID TypeID;
  const void *Value;
  CFTypeID v15;
  const void *v16;
  CFTypeID v17;
  __CFDictionary *MutableCopy;
  NSObject *LogHandle;
  os_log_type_t v20;
  const CFDictionaryKeyCallBacks *v21;
  const CFDictionaryValueCallBacks *v22;
  __CFDictionary *v23;
  CFDataRef v25;
  CFTypeRef cf;
  __CFDictionary *v27;
  void *values;
  void *keys;
  uint8_t buf[8];

  v7 = SecTrustCopyExceptions(a1);
  v8 = v7;
  v25 = v7;
  if (v7)
  {
    keys = a4;
    *(_QWORD *)buf = a3;
    values = v7;
    exceptions_change_check();
    v9 = (const __CFString *)*MEMORY[0x24BDBD590];
    v10 = (const __CFString *)*MEMORY[0x24BDBD570];
    v11 = (__CFDictionary *)CFPreferencesCopyValue(a2, CFSTR("com.apple.network.eapclient.tls.TrustExceptions"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    v27 = v11;
    if (v11)
    {
      v12 = v11;
      TypeID = CFDictionaryGetTypeID();
      if (CFGetTypeID(v12) == TypeID)
      {
        Value = CFDictionaryGetValue(v12, a3);
        v15 = CFDictionaryGetTypeID();
        if (Value && CFGetTypeID(Value) == v15)
        {
          cf = Value;
          v16 = CFDictionaryGetValue((CFDictionaryRef)Value, a4);
          v17 = CFDataGetTypeID();
          if (v16 && CFGetTypeID(v16) == v17 && CFEqual(v16, v8))
            goto LABEL_17;
          MutableCopy = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)Value);
          CFDictionarySetValue(MutableCopy, a4, v8);
        }
        else
        {
          MutableCopy = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        }
        cf = MutableCopy;
        v23 = CFDictionaryCreateMutableCopy(0, 0, v12);
        CFDictionarySetValue(v23, a3, MutableCopy);
        CFRelease(v12);
LABEL_16:
        v27 = v23;
        CFRelease(MutableCopy);
        CFPreferencesSetValue(a2, v23, CFSTR("com.apple.network.eapclient.tls.TrustExceptions"), v9, v10);
        CFPreferencesSynchronize(CFSTR("com.apple.network.eapclient.tls.TrustExceptions"), v9, v10);
        exceptions_change_notify();
LABEL_17:
        my_CFRelease((const void **)&v27);
        my_CFRelease((const void **)&v25);
        return v8 != 0;
      }
      CFRelease(v12);
    }
    v21 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
    v22 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
    cf = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v23 = CFDictionaryCreate(0, (const void **)buf, &cf, 1, v21, v22);
    MutableCopy = (__CFDictionary *)cf;
    goto LABEL_16;
  }
  LogHandle = EAPLogGetLogHandle();
  v20 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v20))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_206440000, LogHandle, v20, "failed to copy exceptions", buf, 2u);
  }
  return v8 != 0;
}

const void *EAPTLSTrustExceptionsCopy(const __CFString *a1, const void *a2, const void *a3)
{
  CFPropertyListRef v6;
  CFTypeID TypeID;
  const void *Value;
  CFTypeID v9;
  const void *v10;
  CFTypeID v11;
  const void *v13;

  exceptions_change_check();
  v6 = CFPreferencesCopyValue(a1, CFSTR("com.apple.network.eapclient.tls.TrustExceptions"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  v13 = v6;
  TypeID = CFDictionaryGetTypeID();
  if (!v6)
    goto LABEL_8;
  if (CFGetTypeID(v6) != TypeID)
    goto LABEL_8;
  Value = CFDictionaryGetValue((CFDictionaryRef)v6, a2);
  v9 = CFDictionaryGetTypeID();
  if (!Value || CFGetTypeID(Value) != v9)
    goto LABEL_8;
  v10 = CFDictionaryGetValue((CFDictionaryRef)Value, a3);
  v11 = CFDataGetTypeID();
  if (v10)
  {
    if (CFGetTypeID(v10) == v11)
    {
      CFRetain(v10);
      goto LABEL_9;
    }
LABEL_8:
    v10 = 0;
  }
LABEL_9:
  my_CFRelease(&v13);
  return v10;
}

void exceptions_change_check()
{
  uint32_t v0;
  uint32_t v1;
  NSObject *LogHandle;
  os_log_type_t v3;
  const char *v4;
  uint32_t v5;
  uint32_t v6;
  int check;
  uint8_t buf[4];
  uint32_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  check = 0;
  if ((exceptions_change_check_token_valid & 1) == 0)
  {
    v0 = notify_register_check("com.apple.network.eapclient.tls.TrustExceptions", &exceptions_change_check_token);
    if (v0)
    {
      v1 = v0;
      LogHandle = EAPLogGetLogHandle();
      v3 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v3))
        return;
      *(_DWORD *)buf = 67109120;
      v9 = v1;
      v4 = "notify_register_check returned %d";
LABEL_9:
      _os_log_impl(&dword_206440000, LogHandle, v3, v4, buf, 8u);
      return;
    }
    exceptions_change_check_token_valid = 1;
  }
  v5 = notify_check(exceptions_change_check_token, &check);
  if (v5)
  {
    v6 = v5;
    LogHandle = EAPLogGetLogHandle();
    v3 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v3))
      return;
    *(_DWORD *)buf = 67109120;
    v9 = v6;
    v4 = "notify_check returned %d";
    goto LABEL_9;
  }
  if (check)
    CFPreferencesSynchronize(CFSTR("com.apple.network.eapclient.tls.TrustExceptions"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
}

uint64_t EAPTLSSecTrustApplyExceptionsBinding(__SecTrust *a1, const __CFString *a2, const void *a3, const void *a4)
{
  const void *v5;
  uint64_t v6;
  NSObject *LogHandle;
  os_log_type_t v8;
  uint8_t v10[8];
  const void *v11;

  v5 = EAPTLSTrustExceptionsCopy(a2, a3, a4);
  v11 = v5;
  if (!v5)
  {
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  if (!SecTrustSetExceptions(a1, (CFDataRef)v5))
  {
    LogHandle = EAPLogGetLogHandle();
    v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v8))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_206440000, LogHandle, v8, "SecTrustSetExceptions failed", v10, 2u);
    }
    goto LABEL_6;
  }
  v6 = 1;
LABEL_7:
  my_CFRelease(&v11);
  return v6;
}

void EAPTLSRemoveTrustExceptionsBindings(const __CFString *a1, const void *a2)
{
  const __CFString *v4;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  CFTypeID TypeID;
  __CFDictionary *MutableCopy;

  if (my_CFEqual(a1, CFSTR("WirelessSSID")))
    EAPSIMAKAPersistentStateForgetSSID((uint64_t)a2);
  exceptions_change_check();
  v4 = (const __CFString *)*MEMORY[0x24BDBD570];
  v5 = (const __CFDictionary *)CFPreferencesCopyValue(a1, CFSTR("com.apple.network.eapclient.tls.TrustExceptions"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
  if (v5)
  {
    v6 = v5;
    TypeID = CFDictionaryGetTypeID();
    if (CFGetTypeID(v6) == TypeID)
    {
      if (CFDictionaryGetValue(v6, a2))
      {
        MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v6);
        CFDictionaryRemoveValue(MutableCopy, a2);
        CFPreferencesSetValue(a1, MutableCopy, CFSTR("com.apple.network.eapclient.tls.TrustExceptions"), CFSTR("mobile"), v4);
        CFPreferencesSynchronize(CFSTR("com.apple.network.eapclient.tls.TrustExceptions"), CFSTR("mobile"), v4);
        exceptions_change_notify();
        CFRelease(MutableCopy);
      }
    }
    CFRelease(v6);
  }
}

void exceptions_change_notify()
{
  uint32_t v0;
  uint32_t v1;
  NSObject *LogHandle;
  os_log_type_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v0 = notify_post("com.apple.network.eapclient.tls.TrustExceptions");
  if (v0)
  {
    v1 = v0;
    LogHandle = EAPLogGetLogHandle();
    v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v3))
    {
      v4[0] = 67109120;
      v4[1] = v1;
      _os_log_impl(&dword_206440000, LogHandle, v3, "notify_post returned %d", (uint8_t *)v4, 8u);
    }
  }
}

const void *EAPTLSCopyTrustExceptionBindings(const __CFString *a1, const void *a2)
{
  CFPropertyListRef v4;
  CFTypeID TypeID;
  const void *Value;
  CFTypeID v7;
  const void *v9;

  exceptions_change_check();
  v4 = CFPreferencesCopyValue(a1, CFSTR("com.apple.network.eapclient.tls.TrustExceptions"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
  v9 = v4;
  TypeID = CFDictionaryGetTypeID();
  if (!v4 || CFGetTypeID(v4) != TypeID)
    goto LABEL_6;
  Value = CFDictionaryGetValue((CFDictionaryRef)v4, a2);
  v7 = CFDictionaryGetTypeID();
  if (Value)
  {
    if (CFGetTypeID(Value) == v7)
    {
      CFRetain(Value);
      goto LABEL_7;
    }
LABEL_6:
    Value = 0;
  }
LABEL_7:
  my_CFRelease(&v9);
  return Value;
}

void EAPTLSSetTrustExceptionBindings(const __CFString *a1, void *a2, void *a3)
{
  const __CFString *v6;
  CFPropertyListRef v7;
  const __CFDictionary *v8;
  CFTypeID TypeID;
  __CFDictionary *MutableCopy;
  CFTypeRef cf;
  void *values;
  void *keys;

  values = a3;
  keys = a2;
  exceptions_change_check();
  v6 = (const __CFString *)*MEMORY[0x24BDBD570];
  v7 = CFPreferencesCopyValue(a1, CFSTR("com.apple.network.eapclient.tls.TrustExceptions"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
  cf = v7;
  if (v7
    && ((v8 = (const __CFDictionary *)v7, TypeID = CFDictionaryGetTypeID(), CFGetTypeID(v8) == TypeID)
     || (my_CFRelease(&cf), (v8 = (const __CFDictionary *)cf) != 0)))
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v8);
    CFDictionarySetValue(MutableCopy, a2, a3);
    CFRelease(cf);
  }
  else
  {
    MutableCopy = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  }
  cf = MutableCopy;
  CFPreferencesSetValue(a1, MutableCopy, CFSTR("com.apple.network.eapclient.tls.TrustExceptions"), CFSTR("mobile"), v6);
  CFPreferencesSynchronize(CFSTR("com.apple.network.eapclient.tls.TrustExceptions"), CFSTR("mobile"), v6);
  exceptions_change_notify();
  my_CFRelease(&cf);
}

uint64_t eapolcontroller_start(int a1, __int128 *a2, uint64_t a3, int a4, int a5, int a6, _DWORD *a7)
{
  __int128 v9;
  mach_port_name_t reply_port;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  int msg;
  _BYTE msg_4[60];
  int v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  memset(&msg_4[16], 0, 44);
  *(_OWORD *)msg_4 = 0u;
  v9 = a2[1];
  v19 = *a2;
  *(_DWORD *)&msg_4[20] = 3;
  *(_QWORD *)&msg_4[24] = a3;
  *(_DWORD *)&msg_4[32] = 16777472;
  *(_DWORD *)&msg_4[36] = a4;
  *(_DWORD *)&msg_4[40] = a5;
  *(_DWORD *)&msg_4[48] = 1245184;
  *(_DWORD *)&msg_4[52] = a6;
  v17 = 1245184;
  v18 = *MEMORY[0x24BDAC470];
  v20 = v9;
  v21 = a4;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = reply_port;
  msg = -2147478253;
  *(_QWORD *)&msg_4[12] = 0x55F100000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    reply_port = *(_DWORD *)&msg_4[8];
  }
  v11 = mach_msg((mach_msg_header_t *)&msg, 3, 0x70u, 0x30u, reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v11)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg_4[8]);
      return v12;
    }
    if (*(_DWORD *)&msg_4[16] == 71)
    {
      v12 = 4294966988;
    }
    else if (*(_DWORD *)&msg_4[16] == 22101)
    {
      if ((msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)msg_4 == 40)
        {
          if (!*(_DWORD *)&msg_4[4])
          {
            v12 = *(unsigned int *)&msg_4[28];
            if (!*(_DWORD *)&msg_4[28])
            {
              *a7 = *(_DWORD *)&msg_4[32];
              return v12;
            }
            goto LABEL_23;
          }
        }
        else if (*(_DWORD *)msg_4 == 36)
        {
          if (*(_DWORD *)&msg_4[4])
            v13 = 1;
          else
            v13 = *(_DWORD *)&msg_4[28] == 0;
          if (v13)
            v12 = 4294966996;
          else
            v12 = *(unsigned int *)&msg_4[28];
          goto LABEL_23;
        }
      }
      v12 = 4294966996;
    }
    else
    {
      v12 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)&msg);
    return v12;
  }
  mig_put_reply_port(*(mach_port_t *)&msg_4[8]);
  return v12;
}

uint64_t eapolcontroller_stop(mach_port_t a1, __int128 *a2, _DWORD *a3)
{
  __int128 v5;
  mach_port_t reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  mach_msg_header_t msg;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = *MEMORY[0x24BDAC470];
  v5 = a2[1];
  v13 = *a2;
  v14 = v5;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg.msgh_bits = 5395;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x55F200000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v7 = mach_msg(&msg, 3, 0x40u, 0x30u, reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v7)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v8;
    }
    if (msg.msgh_id == 71)
    {
      v8 = 4294966988;
    }
    else if (msg.msgh_id == 22102)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            v8 = v13;
            if (!(_DWORD)v13)
            {
              *a3 = DWORD1(v13);
              return v8;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port)
            v9 = 1;
          else
            v9 = (_DWORD)v13 == 0;
          if (v9)
            v8 = 4294966996;
          else
            v8 = v13;
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
    mach_msg_destroy(&msg);
    return v8;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v8;
}

uint64_t eapolcontroller_update(mach_port_t a1, __int128 *a2, uint64_t a3, int a4, int *a5)
{
  __int128 v7;
  mach_port_t reply_port;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  mach_msg_header_t v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a2[1];
  v19 = *a2;
  v14 = 1;
  v15 = a3;
  v16 = 16777472;
  v17 = a4;
  v18 = *MEMORY[0x24BDAC470];
  v20 = v7;
  v21 = a4;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&v13.msgh_bits = 2147489043;
  v13.msgh_remote_port = a1;
  v13.msgh_local_port = reply_port;
  *(_QWORD *)&v13.msgh_voucher_port = 0x55F300000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&v13);
    reply_port = v13.msgh_local_port;
  }
  v9 = mach_msg(&v13, 3, 0x58u, 0x30u, reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v9)
    {
      mig_dealloc_reply_port(v13.msgh_local_port);
      return v10;
    }
    if (v13.msgh_id == 71)
    {
      v10 = 4294966988;
    }
    else if (v13.msgh_id == 22103)
    {
      if ((v13.msgh_bits & 0x80000000) == 0)
      {
        if (v13.msgh_size == 40)
        {
          if (!v13.msgh_remote_port)
          {
            v10 = HIDWORD(v15);
            if (!HIDWORD(v15))
            {
              *a5 = v16;
              return v10;
            }
            goto LABEL_23;
          }
        }
        else if (v13.msgh_size == 36)
        {
          if (v13.msgh_remote_port)
            v11 = 1;
          else
            v11 = HIDWORD(v15) == 0;
          if (v11)
            v10 = 4294966996;
          else
            v10 = HIDWORD(v15);
          goto LABEL_23;
        }
      }
      v10 = 4294966996;
    }
    else
    {
      v10 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v13);
    return v10;
  }
  mig_put_reply_port(v13.msgh_local_port);
  return v10;
}

uint64_t eapolcontroller_retry(mach_port_t a1, __int128 *a2, _DWORD *a3)
{
  __int128 v5;
  mach_port_t reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  mach_msg_header_t msg;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = *MEMORY[0x24BDAC470];
  v5 = a2[1];
  v13 = *a2;
  v14 = v5;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg.msgh_bits = 5395;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x55F400000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v7 = mach_msg(&msg, 3, 0x40u, 0x30u, reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v7)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v8;
    }
    if (msg.msgh_id == 71)
    {
      v8 = 4294966988;
    }
    else if (msg.msgh_id == 22104)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            v8 = v13;
            if (!(_DWORD)v13)
            {
              *a3 = DWORD1(v13);
              return v8;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port)
            v9 = 1;
          else
            v9 = (_DWORD)v13 == 0;
          if (v9)
            v8 = 4294966996;
          else
            v8 = v13;
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
    mach_msg_destroy(&msg);
    return v8;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v8;
}

uint64_t eapolcontroller_provide_user_input(mach_port_t a1, __int128 *a2, uint64_t a3, int a4, int *a5)
{
  __int128 v7;
  mach_port_t reply_port;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  mach_msg_header_t v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a2[1];
  v19 = *a2;
  v14 = 1;
  v15 = a3;
  v16 = 16777472;
  v17 = a4;
  v18 = *MEMORY[0x24BDAC470];
  v20 = v7;
  v21 = a4;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&v13.msgh_bits = 2147489043;
  v13.msgh_remote_port = a1;
  v13.msgh_local_port = reply_port;
  *(_QWORD *)&v13.msgh_voucher_port = 0x55F700000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&v13);
    reply_port = v13.msgh_local_port;
  }
  v9 = mach_msg(&v13, 3, 0x58u, 0x30u, reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v9)
    {
      mig_dealloc_reply_port(v13.msgh_local_port);
      return v10;
    }
    if (v13.msgh_id == 71)
    {
      v10 = 4294966988;
    }
    else if (v13.msgh_id == 22107)
    {
      if ((v13.msgh_bits & 0x80000000) == 0)
      {
        if (v13.msgh_size == 40)
        {
          if (!v13.msgh_remote_port)
          {
            v10 = HIDWORD(v15);
            if (!HIDWORD(v15))
            {
              *a5 = v16;
              return v10;
            }
            goto LABEL_23;
          }
        }
        else if (v13.msgh_size == 36)
        {
          if (v13.msgh_remote_port)
            v11 = 1;
          else
            v11 = HIDWORD(v15) == 0;
          if (v11)
            v10 = 4294966996;
          else
            v10 = HIDWORD(v15);
          goto LABEL_23;
        }
      }
      v10 = 4294966996;
    }
    else
    {
      v10 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v13);
    return v10;
  }
  mig_put_reply_port(v13.msgh_local_port);
  return v10;
}

uint64_t eapolcontroller_start_system(mach_port_t a1, __int128 *a2, uint64_t a3, int a4, int *a5)
{
  __int128 v7;
  mach_port_t reply_port;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  mach_msg_header_t v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a2[1];
  v19 = *a2;
  v14 = 1;
  v15 = a3;
  v16 = 16777472;
  v17 = a4;
  v18 = *MEMORY[0x24BDAC470];
  v20 = v7;
  v21 = a4;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&v13.msgh_bits = 2147489043;
  v13.msgh_remote_port = a1;
  v13.msgh_local_port = reply_port;
  *(_QWORD *)&v13.msgh_voucher_port = 0x55F800000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&v13);
    reply_port = v13.msgh_local_port;
  }
  v9 = mach_msg(&v13, 3, 0x58u, 0x30u, reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v9)
    {
      mig_dealloc_reply_port(v13.msgh_local_port);
      return v10;
    }
    if (v13.msgh_id == 71)
    {
      v10 = 4294966988;
    }
    else if (v13.msgh_id == 22108)
    {
      if ((v13.msgh_bits & 0x80000000) == 0)
      {
        if (v13.msgh_size == 40)
        {
          if (!v13.msgh_remote_port)
          {
            v10 = HIDWORD(v15);
            if (!HIDWORD(v15))
            {
              *a5 = v16;
              return v10;
            }
            goto LABEL_23;
          }
        }
        else if (v13.msgh_size == 36)
        {
          if (v13.msgh_remote_port)
            v11 = 1;
          else
            v11 = HIDWORD(v15) == 0;
          if (v11)
            v10 = 4294966996;
          else
            v10 = HIDWORD(v15);
          goto LABEL_23;
        }
      }
      v10 = 4294966996;
    }
    else
    {
      v10 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v13);
    return v10;
  }
  mig_put_reply_port(v13.msgh_local_port);
  return v10;
}

uint64_t eapolcontroller_client_get_session(mach_port_t a1, __int128 *a2, _DWORD *a3, _DWORD *a4)
{
  __int128 v7;
  mach_port_t reply_port;
  uint64_t v9;
  uint64_t v10;
  int v11;
  mach_msg_header_t msg;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14 = *MEMORY[0x24BDAC470];
  v7 = a2[1];
  v15 = *a2;
  v16 = v7;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg.msgh_bits = 5395;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x55FB00000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v9 = mach_msg(&msg, 3, 0x40u, 0x3Cu, reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        v10 = 4294966988;
      }
      else if (msg.msgh_id == 22111)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          v10 = 4294966996;
          if ((_DWORD)v14 == 2
            && msg.msgh_size == 52
            && !msg.msgh_remote_port
            && WORD3(v15) << 16 == 1114112
            && WORD1(v16) << 16 == 1114112)
          {
            v10 = 0;
            v11 = DWORD2(v15);
            *a3 = HIDWORD(v14);
            *a4 = v11;
            return v10;
          }
        }
        else if (msg.msgh_size == 36)
        {
          v10 = 4294966996;
          if ((_DWORD)v15)
          {
            if (msg.msgh_remote_port)
              v10 = 4294966996;
            else
              v10 = v15;
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
      mach_msg_destroy(&msg);
      return v10;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v10;
}

void IdentityHandleMatchesCertificate_cold_1()
{
  __assert_rtn("IdentityHandleMatchesCertificate", "EAPCertificateUtil.c", 116, "CFDataGetLength(public_key_hash) == CC_SHA256_DIGEST_LENGTH");
}

void IdentityHandleMatchesCertificate_cold_2()
{
  __assert_rtn("IdentityHandleMatchesCertificate", "EAPCertificateUtil.c", 109, "CFDataGetLength(cert_hash) == CC_SHA256_DIGEST_LENGTH");
}

void EAPSecIdentityHandleCreate_cold_1()
{
  __assert_rtn("EAPSecIdentityHandleCreate", "EAPCertificateUtil.c", 760, "CFDataGetLength(public_key_hash) == CC_SHA256_DIGEST_LENGTH");
}

void EAPSecIdentityHandleCreate_cold_2()
{
  __assert_rtn("EAPSecIdentityHandleCreate", "EAPCertificateUtil.c", 756, "CFDataGetLength(cert_hash) == CC_SHA256_DIGEST_LENGTH");
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x24BDAC0E8](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, dataIn, dataInLength);
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x24BDAC110](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x24BDAC188](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x24BDAC198](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
  MEMORY[0x24BDAC238](*(_QWORD *)&algorithm, key, keyLength, data, dataLength, macOut);
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
  MEMORY[0x24BDAC240](ctx, macOut);
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
  MEMORY[0x24BDAC248](ctx, *(_QWORD *)&algorithm, key, keyLength);
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
  MEMORY[0x24BDAC250](ctx, data, dataLength);
}

unsigned __int8 *__cdecl CC_MD4(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC2E0](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC300](data, *(_QWORD *)&len, md);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC308](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC310](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC318](c, data, *(_QWORD *)&len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC328](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC330](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC338](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x24BDBB7C0](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB810](allocator, capacity, theArray);
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

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB898](theArray, idx, value);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x24BDBBC88](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB8](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

CFTimeInterval CFDateGetTimeIntervalSinceDate(CFDateRef theDate, CFDateRef otherDate)
{
  CFTimeInterval result;

  MEMORY[0x24BDBBDA0](theDate, otherDate);
  return result;
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

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
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

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x24BDBBF10](cf);
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

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x24BDBC168](applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A8](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
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

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC370](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC380](source);
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

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x24BDBC510](alloc, theString, separatorString);
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

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
  MEMORY[0x24BDBC5B8](theString, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x24BDBC5D0](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x24BDBC6A8](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x24BDBC6B0](theString, suffix);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D0](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

CFStringRef SCDynamicStoreKeyCreate(CFAllocatorRef allocator, CFStringRef fmt, ...)
{
  return (CFStringRef)MEMORY[0x24BDF5690](allocator, fmt);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x24BDF56A8](allocator, domain, ifname, entity);
}

int SCError(void)
{
  return MEMORY[0x24BDF56E0]();
}

const char *__cdecl SCErrorString(int status)
{
  return (const char *)MEMORY[0x24BDF56E8](*(_QWORD *)&status);
}

uint64_t SCLog()
{
  return MEMORY[0x24BDF56F0]();
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x24BDF5858](prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x24BDF5860](prefs);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x24BDF5868](allocator, name, prefsID);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x24BDF5870](allocator, name, prefsID, authorization);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x24BDF5880](prefs, key);
}

Boolean SCPreferencesRemoveValue(SCPreferencesRef prefs, CFStringRef key)
{
  return MEMORY[0x24BDF5890](prefs, key);
}

Boolean SCPreferencesScheduleWithRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x24BDF5898](prefs, runLoop, runLoopMode);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return MEMORY[0x24BDF58A0](prefs, callout, context);
}

Boolean SCPreferencesSetValue(SCPreferencesRef prefs, CFStringRef key, CFPropertyListRef value)
{
  return MEMORY[0x24BDF58C0](prefs, key, value);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
  MEMORY[0x24BDF58C8](prefs);
}

uint64_t SCPrint()
{
  return MEMORY[0x24BDF58E0]();
}

OSStatus SSLClose(SSLContextRef context)
{
  return MEMORY[0x24BDE8658](context);
}

OSStatus SSLCopyPeerTrust(SSLContextRef context, SecTrustRef *trust)
{
  return MEMORY[0x24BDE8660](context, trust);
}

SSLContextRef SSLCreateContext(CFAllocatorRef alloc, SSLProtocolSide protocolSide, SSLConnectionType connectionType)
{
  return (SSLContextRef)MEMORY[0x24BDE8668](alloc, *(_QWORD *)&protocolSide, *(_QWORD *)&connectionType);
}

uint64_t SSLGetCipherSizes()
{
  return MEMORY[0x24BDE8678]();
}

OSStatus SSLGetNegotiatedCipher(SSLContextRef context, SSLCipherSuite *cipherSuite)
{
  return MEMORY[0x24BDE8688](context, cipherSuite);
}

uint64_t SSLGetResumableSessionInfo()
{
  return MEMORY[0x24BDE8698]();
}

OSStatus SSLGetSessionState(SSLContextRef context, SSLSessionState *state)
{
  return MEMORY[0x24BDE86A0](context, state);
}

OSStatus SSLHandshake(SSLContextRef context)
{
  return MEMORY[0x24BDE86A8](context);
}

uint64_t SSLInternalClientRandom()
{
  return MEMORY[0x24BDE86B0]();
}

uint64_t SSLInternalMasterSecret()
{
  return MEMORY[0x24BDE86B8]();
}

uint64_t SSLInternalServerRandom()
{
  return MEMORY[0x24BDE86C0]();
}

uint64_t SSLInternalSetMasterSecretFunction()
{
  return MEMORY[0x24BDE86C8]();
}

uint64_t SSLInternalSetSessionTicket()
{
  return MEMORY[0x24BDE86D0]();
}

uint64_t SSLInternal_PRF()
{
  return MEMORY[0x24BDE86D8]();
}

OSStatus SSLRead(SSLContextRef context, void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x24BDE86E0](context, data, dataLength, processed);
}

OSStatus SSLSetCertificate(SSLContextRef context, CFArrayRef certRefs)
{
  return MEMORY[0x24BDE86E8](context, certRefs);
}

OSStatus SSLSetConnection(SSLContextRef context, SSLConnectionRef connection)
{
  return MEMORY[0x24BDE86F8](context, connection);
}

OSStatus SSLSetEnabledCiphers(SSLContextRef context, const SSLCipherSuite *ciphers, size_t numCiphers)
{
  return MEMORY[0x24BDE8700](context, ciphers, numCiphers);
}

OSStatus SSLSetIOFuncs(SSLContextRef context, SSLReadFunc readFunc, SSLWriteFunc writeFunc)
{
  return MEMORY[0x24BDE8708](context, readFunc, writeFunc);
}

OSStatus SSLSetPeerDomainName(SSLContextRef context, const char *peerName, size_t peerNameLen)
{
  return MEMORY[0x24BDE8718](context, peerName, peerNameLen);
}

OSStatus SSLSetPeerID(SSLContextRef context, const void *peerID, size_t peerIDLen)
{
  return MEMORY[0x24BDE8720](context, peerID, peerIDLen);
}

OSStatus SSLSetProtocolVersionMax(SSLContextRef context, SSLProtocol maxVersion)
{
  return MEMORY[0x24BDE8728](context, *(_QWORD *)&maxVersion);
}

OSStatus SSLSetProtocolVersionMin(SSLContextRef context, SSLProtocol minVersion)
{
  return MEMORY[0x24BDE8730](context, *(_QWORD *)&minVersion);
}

uint64_t SSLSetSessionCacheTimeout()
{
  return MEMORY[0x24BDE8738]();
}

OSStatus SSLSetSessionOption(SSLContextRef context, SSLSessionOption option, Boolean value)
{
  return MEMORY[0x24BDE8748](context, *(_QWORD *)&option, value);
}

OSStatus SSLWrite(SSLContextRef context, const void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x24BDE8750](context, data, dataLength, processed);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x24BDE8850](certificate);
}

uint64_t SecCertificateCopySHA256Digest()
{
  return MEMORY[0x24BDE88D0]();
}

uint64_t SecCertificateCopySubjectPublicKeyInfoSHA256Digest()
{
  return MEMORY[0x24BDE88E8]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

uint64_t SecCertificateGetSHA1Digest()
{
  return MEMORY[0x24BDE8938]();
}

CFTypeID SecCertificateGetTypeID(void)
{
  return MEMORY[0x24BDE8948]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x24BDE8A48](identityRef, certificateRef);
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return MEMORY[0x24BDE8A50](identityRef, privateKeyRef);
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x24BDE8A58]();
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x24BDE8A60]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x24BDE8A88](query, attributesToUpdate);
}

uint64_t SecKeyCopyAttributeDictionary()
{
  return MEMORY[0x24BDE8A90]();
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8AA8](key, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B40](keyData, attributes, error);
}

uint64_t SecPolicyCreateEAP()
{
  return MEMORY[0x24BDE8C38]();
}

SecPolicyRef SecPolicyCreateRevocation(CFOptionFlags revocationFlags)
{
  return (SecPolicyRef)MEMORY[0x24BDE8C68](revocationFlags);
}

CFDataRef SecTrustCopyExceptions(SecTrustRef trust)
{
  return (CFDataRef)MEMORY[0x24BDE8DA0](trust);
}

uint64_t SecTrustCopyInputCertificates()
{
  return MEMORY[0x24BDE8DB8]();
}

CFDictionaryRef SecTrustCopyResult(SecTrustRef trust)
{
  return (CFDictionaryRef)MEMORY[0x24BDE8DD0](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x24BDE8DD8](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x24BDE8DF0](trust, error);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x24BDE8DF8](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x24BDE8E00](trust);
}

OSStatus SecTrustGetTrustResult(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x24BDE8E08](trust, result);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x24BDE8E28](trust, anchorCertificates);
}

BOOL SecTrustSetExceptions(SecTrustRef trust, CFDataRef exceptions)
{
  return MEMORY[0x24BDE8E38](trust, exceptions);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x24BDE8E50](trust, policies);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

uint64_t _SC_CFMachPortCreateWithPort()
{
  return MEMORY[0x24BDF5920]();
}

uint64_t _SC_syslog_os_log_mapping()
{
  return MEMORY[0x24BDF5948]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
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

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _scprefs_observer_watch()
{
  return MEMORY[0x24BDF5970]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

au_asid_t audit_session_join(mach_port_name_t port)
{
  return MEMORY[0x24BDAD278](*(_QWORD *)&port);
}

mach_port_name_t audit_session_self(void)
{
  return MEMORY[0x24BDAD280]();
}

int bcmp(const void *a1, const void *a2, size_t a3)
{
  return MEMORY[0x24BDAD2C0](a1, a2, a3);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDAD2C8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x24BDAD2E8]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x24BDAD350]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x24BDAE8C8](*(_QWORD *)&a1, a2);
}

void mach_error(const char *str, mach_error_t error_value)
{
  MEMORY[0x24BDAEB50](str, *(_QWORD *)&error_value);
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

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x24BDAEC08](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgid, *(_QWORD *)&sync, *(_QWORD *)&notify, *(_QWORD *)&notifyPoly, previous);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
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

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x24BDAF140](*(_QWORD *)&token, check);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x24BDE0AF8](connection);
}

nw_protocol_metadata_t nw_connection_copy_protocol_metadata(nw_connection_t connection, nw_protocol_definition_t definition)
{
  return (nw_protocol_metadata_t)MEMORY[0x24BDE0B50](connection, definition);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x24BDE0B68](endpoint, parameters);
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
  MEMORY[0x24BDE0C28](connection, *(_QWORD *)&minimum_incomplete_length, *(_QWORD *)&maximum_length, completion);
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x24BDE0C98](connection, queue);
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
  MEMORY[0x24BDE0CB0](connection, handler);
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x24BDE0CD0](connection);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0E88](hostname, port);
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x24BDE0FA8](error);
}

void nw_framer_async(nw_framer_t framer, nw_framer_block_t async_block)
{
  MEMORY[0x24BDE10E8](framer, async_block);
}

nw_protocol_options_t nw_framer_copy_options(nw_framer_t framer)
{
  return (nw_protocol_options_t)MEMORY[0x24BDE10F0](framer);
}

nw_protocol_definition_t nw_framer_create_definition(const char *identifier, uint32_t flags, nw_framer_start_handler_t start_handler)
{
  return (nw_protocol_definition_t)MEMORY[0x24BDE10F8](identifier, *(_QWORD *)&flags, start_handler);
}

nw_protocol_options_t nw_framer_create_options(nw_protocol_definition_t framer_definition)
{
  return (nw_protocol_options_t)MEMORY[0x24BDE1110](framer_definition);
}

void nw_framer_deliver_input(nw_framer_t framer, const uint8_t *input_buffer, size_t input_length, nw_framer_message_t message, BOOL is_complete)
{
  MEMORY[0x24BDE1118](framer, input_buffer, input_length, message, is_complete);
}

BOOL nw_framer_deliver_input_no_copy(nw_framer_t framer, size_t input_length, nw_framer_message_t message, BOOL is_complete)
{
  return MEMORY[0x24BDE1128](framer, input_length, message, is_complete);
}

void nw_framer_mark_failed_with_error(nw_framer_t framer, int error_code)
{
  MEMORY[0x24BDE1130](framer, *(_QWORD *)&error_code);
}

BOOL nw_framer_parse_output(nw_framer_t framer, size_t minimum_incomplete_length, size_t maximum_length, uint8_t *temp_buffer, nw_framer_parse_completion_t parse)
{
  return MEMORY[0x24BDE1170](framer, minimum_incomplete_length, maximum_length, temp_buffer, parse);
}

void nw_framer_set_input_handler(nw_framer_t framer, nw_framer_input_handler_t input_handler)
{
  MEMORY[0x24BDE1180](framer, input_handler);
}

void nw_framer_set_output_handler(nw_framer_t framer, nw_framer_output_handler_t output_handler)
{
  MEMORY[0x24BDE1190](framer, output_handler);
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x24BDE1528](parameters);
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x24BDE1558]();
}

uint64_t nw_parameters_set_custom_protocols_only()
{
  return MEMORY[0x24BDE1650]();
}

uint64_t nw_protocol_metadata_create_singleton()
{
  return MEMORY[0x24BDE1F38]();
}

nw_protocol_definition_t nw_protocol_options_copy_definition(nw_protocol_options_t options)
{
  return (nw_protocol_definition_t)MEMORY[0x24BDE1F98](options);
}

uint64_t nw_protocol_stack_append_application_protocol()
{
  return MEMORY[0x24BDE2018]();
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x24BDE2600](options);
}

nw_protocol_options_t nw_tls_create_options(void)
{
  return (nw_protocol_options_t)MEMORY[0x24BDE2608]();
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x24BDAFAB8](__ptr, __size);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x24BDAFB80](__from, __to, __ec);
}

SecCertificateRef sec_certificate_copy_ref(sec_certificate_t certificate)
{
  return (SecCertificateRef)MEMORY[0x24BDE9570](certificate);
}

sec_identity_t sec_identity_create(SecIdentityRef identity)
{
  return (sec_identity_t)MEMORY[0x24BDE9580](identity);
}

sec_identity_t sec_identity_create_with_certificates(SecIdentityRef identity, CFArrayRef certificates)
{
  return (sec_identity_t)MEMORY[0x24BDE9588](identity, certificates);
}

BOOL sec_protocol_metadata_access_peer_certificate_chain(sec_protocol_metadata_t metadata, void *handler)
{
  return MEMORY[0x24BDE9590](metadata, handler);
}

uint64_t sec_protocol_metadata_get_eap_key_material()
{
  return MEMORY[0x24BDE95A8]();
}

tls_protocol_version_t sec_protocol_metadata_get_negotiated_tls_protocol_version(sec_protocol_metadata_t metadata)
{
  return (unsigned __int16)MEMORY[0x24BDE95C0](metadata);
}

uint64_t sec_protocol_metadata_get_session_resumed()
{
  return MEMORY[0x24BDE95C8]();
}

uint64_t sec_protocol_options_get_eap_method()
{
  return MEMORY[0x24BDE9600]();
}

uint64_t sec_protocol_options_set_eap_method()
{
  return MEMORY[0x24BDE9618]();
}

void sec_protocol_options_set_local_identity(sec_protocol_options_t options, sec_identity_t identity)
{
  MEMORY[0x24BDE9620](options, identity);
}

void sec_protocol_options_set_max_tls_protocol_version(sec_protocol_options_t options, tls_protocol_version_t version)
{
  MEMORY[0x24BDE9628](options, version);
}

void sec_protocol_options_set_min_tls_protocol_version(sec_protocol_options_t options, tls_protocol_version_t version)
{
  MEMORY[0x24BDE9630](options, version);
}

uint64_t sec_protocol_options_set_tls_early_data_enabled()
{
  return MEMORY[0x24BDE9678]();
}

void sec_protocol_options_set_verify_block(sec_protocol_options_t options, sec_protocol_verify_t verify_block, dispatch_queue_t verify_block_queue)
{
  MEMORY[0x24BDE96B0](options, verify_block, verify_block_queue);
}

SecTrustRef sec_trust_copy_ref(sec_trust_t trust)
{
  return (SecTrustRef)MEMORY[0x24BDE96C0](trust);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
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

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x24BDAFF88](__big, __little, __len);
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

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

kern_return_t task_set_special_port(task_t task, int which_port, mach_port_t special_port)
{
  return MEMORY[0x24BDB01B0](*(_QWORD *)&task, *(_QWORD *)&which_port, *(_QWORD *)&special_port);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x24BDB0380](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x24BDB0390](*(_QWORD *)&target_task, address, size);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x24BDB0418](msg);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

