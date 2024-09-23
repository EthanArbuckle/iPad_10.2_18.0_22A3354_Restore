uint64_t CCPipe_getTypeID()
{
  uint64_t result;

  result = __kCCPipeTypeID;
  if (!__kCCPipeTypeID)
  {
    pthread_once(&__gCCPipeTypeInit, (void (*)(void))__CCPipeRegister);
    return __kCCPipeTypeID;
  }
  return result;
}

uint64_t __CCPipeRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kCCPipeTypeID = result;
  return result;
}

double __CCPipeRelease(uint64_t a1)
{
  uint64_t v1;
  const void *v3;
  double result;

  v1 = a1 + 16;
  if (*(_BYTE *)(a1 + 88))
  {
    *(_QWORD *)(a1 + 56) = 0;
    v3 = (const void *)(a1 + 24);
    IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 7u, 0, 0, (const void *)(a1 + 24), 8uLL, 0, 0, 0, 0);
    IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 3u, 0, 0, v3, 8uLL, 0, 0, 0, 0);
  }
  if (*(_QWORD *)v1)
    CFRelease(*(CFTypeRef *)v1);
  *(_QWORD *)(v1 + 80) = 0;
  result = 0.0;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)v1 = 0u;
  return result;
}

BOOL __CCPipeEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef __CCPipeCopyFormattingDesc(uint64_t a1, const __CFDictionary *a2)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, CFSTR("CCPipe@%p"), a1);
}

CFStringRef __CCPipeCopyDebugDesc(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("CCPipe@%p"), a1);
}

uint64_t CCPipe_create(uint64_t *a1, uint64_t a2, mach_port_t *a3, const char *a4)
{
  uint64_t Instance;
  uint64_t v8;
  void *outputStruct;
  uint64_t v10;
  int v11;
  os_log_t v12;
  uint64_t v13;
  size_t v15;
  size_t v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (!__kCCPipeTypeID)
    pthread_once(&__gCCPipeTypeInit, (void (*)(void))__CCPipeRegister);
  Instance = _CFRuntimeCreateInstance();
  if (!Instance)
  {
    v13 = 3825187585;
    if (!a3)
      return v13;
    goto LABEL_15;
  }
  v8 = Instance;
  *a1 = Instance;
  *(_OWORD *)(Instance + 24) = 0u;
  outputStruct = (void *)(Instance + 24);
  *(_OWORD *)(Instance + 72) = 0u;
  *(_OWORD *)(Instance + 88) = 0u;
  *(_OWORD *)(Instance + 40) = 0u;
  *(_OWORD *)(Instance + 56) = 0u;
  *(_QWORD *)(Instance + 16) = a3;
  CFRetain(a3);
  v15 = 8;
  v10 = IOConnectCallMethod(a3[5], 2u, 0, 0, a4, 0x448uLL, 0, 0, outputStruct, &v15);
  if ((_DWORD)v10)
    goto LABEL_10;
  *(_DWORD *)(v8 + 32) = *((_DWORD *)a4 + 3);
  v11 = *(_DWORD *)a4;
  *(_DWORD *)(v8 + 28) = *(_DWORD *)a4;
  *(_QWORD *)(v8 + 40) = *((_QWORD *)a4 + 3);
  *(_DWORD *)(v8 + 48) = 0;
  if (!v11)
  {
    v16[0] = 24;
    v10 = IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(v8 + 16) + 20), 6u, 0, 0, outputStruct, 8uLL, 0, 0, (void *)(v8 + 64), v16);
    if (!(_DWORD)v10)
    {
      v12 = os_log_create(a4 + 580, a4 + 836);
      *(_QWORD *)(v8 + 96) = v12;
      if (v12)
        goto LABEL_8;
      v13 = 3825187587;
      goto LABEL_14;
    }
LABEL_10:
    v13 = v10;
LABEL_14:
    CFRelease((CFTypeRef)v8);
LABEL_15:
    CFRelease(a3);
    return v13;
  }
LABEL_8:
  v13 = 0;
  *(_QWORD *)(v8 + 56) = 0;
  *(_BYTE *)(v8 + 88) = 1;
  return v13;
}

uint64_t CCPipe_getClientRef(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t CCPipe_getPipeInfo(uint64_t a1)
{
  return a1 + 24;
}

uint64_t CCPipe_capture(uint64_t a1)
{
  __int128 v2;
  uint64_t inputStruct;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12 = v2;
  v11 = v2;
  v10 = v2;
  v9 = v2;
  v8 = v2;
  v7 = v2;
  v6 = v2;
  v5 = v2;
  inputStruct = *(_QWORD *)(a1 + 24);
  __strlcpy_chk();
  return IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0xAu, 0, 0, &inputStruct, 0x88uLL, 0, 0, 0, 0);
}

uint64_t CCPipe_willDropMessage(uint64_t result)
{
  unsigned int *v1;
  unsigned int v2;

  v1 = (unsigned int *)(result + 48);
  do
    v2 = __ldxr(v1);
  while (__stxr(v2 + 1, v1));
  return result;
}

uint64_t CCPipe_logw(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unint64_t a5, uint64_t a6, int a7)
{
  __int128 v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  unint64_t v17;
  _DWORD *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int *v23;
  unsigned int v24;
  unint64_t v25;
  int v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  int v30;
  unsigned int v31;
  unsigned int v32;
  BOOL v33;
  int v34;
  unint64_t v35;
  unint64_t v36;
  _BYTE *v37;
  unint64_t v38;
  unint64_t v39;
  _BYTE *v40;
  _BYTE *v41;
  unsigned int *v42;
  unsigned int v43;
  unsigned int v44;
  unint64_t v45;
  unsigned int v46;
  unint64_t v47;
  unint64_t v48;
  unsigned int *v50;
  unsigned int v51;
  unint64_t v52;
  _DWORD *v53;
  char v54;
  uint64_t v55;
  uint64_t tm_hour;
  uint64_t v57;
  unint64_t v58;
  tm v59;
  time_t v60;
  uint8_t buf[4];
  char *v62;
  __int16 v63;
  uint64_t v64;
  char __str[16];
  __int128 v66;
  unint64_t v67;
  char v68[8];
  uint64_t v69;
  char v70[24];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  if (a7)
  {
    v60 = 0xAAAAAAAAAAAAAAAALL;
    memset(v70, 170, 20);
    memset(&v59, 0, sizeof(v59));
    time(&v60);
    localtime_r(&v60, &v59);
    strftime(v70, 0x14uLL, "%b %d %H:%M:%S", &v59);
    *(_QWORD *)v68 = 0;
    v69 = 0;
    strftime(v68, 0x10uLL, "%z", &v59);
    v67 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)__str = v12;
    v66 = v12;
    v13 = a3 > 7 ? 45 : dword_22942FDE0[a3];
    snprintf(__str, 0x28uLL, "%s.%06d %s <%c>", v70, v59.tm_sec, v68, v13);
    v14 = *(NSObject **)(a1 + 96);
    if (v14)
    {
      v15 = OS_LOG_TYPE_ERROR;
      switch(a3)
      {
        case 0u:
        case 1u:
          goto LABEL_11;
        case 2u:
        case 3u:
        case 4u:
          goto LABEL_10;
        case 5u:
          v15 = OS_LOG_TYPE_INFO;
          goto LABEL_11;
        case 6u:
        case 7u:
          goto LABEL_9;
        default:
          if (a3 == 127)
LABEL_9:
            v15 = OS_LOG_TYPE_DEBUG;
          else
LABEL_10:
            v15 = OS_LOG_TYPE_DEFAULT;
LABEL_11:
          if (os_log_type_enabled(*(os_log_t *)(a1 + 96), v15))
          {
            *(_DWORD *)buf = 136315394;
            v62 = __str;
            v63 = 2080;
            v64 = a4;
            _os_log_impl(&dword_22942D000, v14, v15, "%s %s", buf, 0x16u);
          }
          break;
      }
    }
  }
  if ((_DWORD)a6)
  {
    a6 = 3758097086;
    *(_QWORD *)&v59.tm_sec = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v59.tm_hour = 0xAAAAAAAAAAAAAAAALL;
    gettimeofday((timeval *)&v59, 0);
    v17 = *(_QWORD *)(a1 + 64);
    v16 = *(_QWORD *)(a1 + 72);
    v18 = *(_DWORD **)(a1 + 80);
    *(_DWORD *)buf = -1431655766;
    *(_DWORD *)buf = v18[1];
    *(_DWORD *)v70 = -1431655766;
    *(_DWORD *)v70 = *v18;
    if (*(_DWORD *)buf >= v16)
      return 3758097097;
    tm_hour = v59.tm_hour;
    v57 = *(_QWORD *)&v59.tm_sec;
    if (*(_DWORD *)v70 < *(_DWORD *)buf)
      LODWORD(v19) = *(_DWORD *)v70 + v16 - *(_DWORD *)buf;
    else
      LODWORD(v19) = *(_DWORD *)v70 - *(_DWORD *)buf;
    if (*(_DWORD *)v70 == *(_DWORD *)buf)
      v19 = v16;
    else
      v19 = v19;
    v20 = ((a5 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 36;
    if ((v16 - *(_DWORD *)buf) <= 0x23)
      v20 += (v16 - *(_DWORD *)buf);
    v58 = v19 - 4;
    if (v19 - 4 < v20)
    {
      if (__isCCDaemonRunning() && (*(_DWORD *)(a1 + 32) || v18[2]))
        return a6;
      v52 = v20;
      v53 = v18;
      v54 = a3;
      v22 = *(_QWORD *)(a1 + 64);
      v21 = *(_QWORD *)(a1 + 72);
      v55 = a1;
      v23 = *(unsigned int **)(a1 + 80);
      v24 = 0;
      v25 = v20 + 4;
      if (v25)
      {
        do
        {
          *(_DWORD *)__str = *v23;
          v26 = *(_DWORD *)__str;
          v27 = v22 + *(unsigned int *)__str;
          if (*(_DWORD *)v27 == 80)
          {
            v24 += 4;
            *(_DWORD *)__str += 4;
            v28 = *(_DWORD *)__str % v21;
            *(_DWORD *)__str %= v21;
            while (1)
            {
              v29 = __ldxr(v23);
              if (v29 != v26)
                break;
              if (!__stxr(v28, v23))
                goto LABEL_39;
            }
          }
          else
          {
            if (*(_DWORD *)v27 == 82)
              break;
            v30 = *(unsigned __int16 *)(v27 + 24) + *(unsigned __int8 *)(v27 + 26) + 36;
            v24 += v30;
            *(_DWORD *)__str += v30;
            v31 = *(_DWORD *)__str % v21;
            *(_DWORD *)__str %= v21;
            while (1)
            {
              v32 = __ldxr(v23);
              if (v32 != v26)
                break;
              if (!__stxr(v31, v23))
                goto LABEL_39;
            }
          }
          __clrex();
          printf("Someone changed readPtr %d->%d.\n", v26, *v23);
LABEL_39:
          ;
        }
        while (v25 > v24);
      }
      LODWORD(v20) = v52;
      v18 = v53;
      v33 = v52 >= v24;
      a1 = v55;
      LOBYTE(a3) = v54;
      if (v33)
      {
        v50 = (unsigned int *)(v55 + 48);
        do
          v51 = __ldxr(v50);
        while (__stxr(v51 + 1, v50));
        return a6;
      }
    }
    v34 = v20;
    v35 = (unint64_t)*(unsigned int *)buf >> 2;
    v36 = v16 >> 2;
    if ((v16 - *(_DWORD *)buf) > 0x23)
    {
      v37 = (_BYTE *)(v17 + 4 * v35);
      v38 = (a5 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    }
    else
    {
      v37 = (_BYTE *)v17;
      v38 = (a5 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      if (v36 > v35)
      {
        v39 = v17 + 4 * v35 + 4;
        if (v39 <= v17 + 4 * v36)
          v39 = v17 + 4 * v36;
        memset_pattern16((void *)(v17 + 4 * v35), &unk_22942FE10, ((~v17 - 4 * v35 + v39) & 0xFFFFFFFFFFFFFFFCLL) + 4);
        v37 = (_BYTE *)v17;
      }
    }
    v40 = (_BYTE *)(v17 + 4 * v36);
    *(_DWORD *)v37 = 82;
    if (v37 + 36 == v40)
      v41 = (_BYTE *)v17;
    else
      v41 = v37 + 36;
    v42 = (unsigned int *)(a1 + 48);
    do
    {
      v43 = __ldxr(v42);
      v44 = v43 + 1;
    }
    while (__stxr(v44, v42));
    *((_WORD *)v37 + 3) = v44;
    *(_DWORD *)buf += v34;
    *(_DWORD *)buf %= v16;
    v18[1] = *(_DWORD *)buf;
    *((_WORD *)v37 + 2) = 0;
    *((_QWORD *)v37 + 1) = v57;
    *((_QWORD *)v37 + 2) = tm_hour;
    *((_WORD *)v37 + 12) = a5;
    v37[26] = v38 - a5;
    v37[27] = a3;
    *(_QWORD *)(v37 + 28) = 0;
    if (a5)
    {
      v45 = 0;
      v46 = 1;
      v47 = v58;
      do
      {
        *v41++ = *(_BYTE *)(a4 + v45);
        if (v41 == v40)
          v41 = (_BYTE *)v17;
        v45 = v46++;
      }
      while (v45 < a5);
    }
    else
    {
      v47 = v58;
    }
    if (v38 > a5)
    {
      v48 = a5 - v38;
      do
      {
        *v41++ = 0;
        if (v41 == v40)
          v41 = (_BYTE *)v17;
        v33 = __CFADD__(v48++, 1);
      }
      while (!v33);
    }
    __dmb(0xBu);
    *(_DWORD *)v37 = 87;
    if (*(_DWORD *)(a1 + 32) == 1 && __isCCDaemonRunning() && v47 < *(_QWORD *)(a1 + 40) && !v18[2])
      __sendNotification(a1);
    return 0;
  }
  return a6;
}

BOOL __isCCDaemonRunning()
{
  const __CFDictionary *v0;
  io_service_t MatchingService;
  io_service_t v2;

  v0 = IOServiceMatching("CCCapture");
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v0);
  v2 = MatchingService;
  if (MatchingService)
    IOObjectRelease(MatchingService);
  return v2 != 0;
}

uint64_t __sendNotification(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 9u, 0, 0, (const void *)(a1 + 24), 8uLL, 0, 0, 0, 0);
}

uint64_t CCStream_getTypeID()
{
  uint64_t result;

  result = __kCCStreamTypeID;
  if (!__kCCStreamTypeID)
  {
    pthread_once(&__gCCStreamTypeInit, (void (*)(void))__CCStreamRegister);
    return __kCCStreamTypeID;
  }
  return result;
}

uint64_t __CCStreamRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kCCStreamTypeID = result;
  return result;
}

double __CCStreamRelease(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const void *v4;
  double result;

  v2 = a1 + 16;
  if (*(_BYTE *)(a1 + 112))
  {
    v3 = *(void **)(a1 + 40);
    if (v3)
      free(v3);
    IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)v2 + 20), 5u, 0, 0, (const void *)(a1 + 32), 0x50uLL, 0, 0, 0, 0);
  }
  if (*(_QWORD *)v2)
  {
    CFRelease(*(CFTypeRef *)v2);
    *(_QWORD *)v2 = 0;
  }
  v4 = *(const void **)(a1 + 24);
  if (v4)
    CFRelease(v4);
  *(_QWORD *)(v2 + 96) = 0;
  result = 0.0;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 80) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)v2 = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  return result;
}

BOOL __CCStreamEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef __CCStreamCopyFormattingDesc(uint64_t a1, const __CFDictionary *a2)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, CFSTR("CCStream@%p"), a1);
}

CFStringRef __CCStreamCopyDebugDesc(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("CCStream@%p"), a1);
}

uint64_t CCStream_create(uint64_t *a1, uint64_t a2, _QWORD *a3, const void *a4)
{
  uint64_t Instance;
  uint64_t v8;
  mach_port_t *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  size_t v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (!__kCCStreamTypeID)
    pthread_once(&__gCCStreamTypeInit, (void (*)(void))__CCStreamRegister);
  Instance = _CFRuntimeCreateInstance();
  if (!Instance)
  {
    v12 = 3825187585;
    if (!a3)
      return v12;
    goto LABEL_13;
  }
  v8 = Instance;
  *a1 = Instance;
  v9 = (mach_port_t *)a3[2];
  *(_OWORD *)(Instance + 104) = 0u;
  *(_OWORD *)(Instance + 88) = 0u;
  *(_OWORD *)(Instance + 72) = 0u;
  *(_OWORD *)(Instance + 56) = 0u;
  *(_OWORD *)(Instance + 40) = 0u;
  *(_OWORD *)(Instance + 24) = 0u;
  *(_QWORD *)(Instance + 16) = v9;
  CFRetain(v9);
  *(_QWORD *)(v8 + 24) = a3;
  CFRetain(a3);
  v14[0] = 80;
  v10 = IOConnectCallMethod(v9[5], 4u, 0, 0, a4, 0x450uLL, 0, 0, (void *)(v8 + 32), v14);
  if ((_DWORD)v10)
  {
    v12 = v10;
LABEL_12:
    CFRelease((CFTypeRef)v8);
    CFRelease(v9);
LABEL_13:
    CFRelease(a3);
    return v12;
  }
  *(_QWORD *)(v8 + 48) = 2048;
  v11 = malloc_type_malloc(0x800uLL, 0x9B3177B2uLL);
  *(_QWORD *)(v8 + 40) = v11;
  if (!v11)
  {
    v12 = 3825187586;
    goto LABEL_12;
  }
  bzero(v11, 0x800uLL);
  v12 = 0;
  *(_QWORD *)(v8 + 64) = 0xFFFFFFFF0000007FLL;
  *(_OWORD *)(v8 + 80) = xmmword_22942FE00;
  *(_BYTE *)(v8 + 112) = 1;
  return v12;
}

uint64_t CCStream_setFlags(uint64_t a1, uint64_t a2)
{
  int v2;
  _DWORD inputStruct[2];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 32);
  inputStruct[1] = -1431655766;
  v5 = a2;
  inputStruct[0] = v2;
  return IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0xBu, 0, 0, inputStruct, 0x10uLL, 0, 0, 0, 0);
}

unint64_t CCStream_getFlags(uint64_t a1)
{
  size_t v2;
  unint64_t outputStruct;
  _QWORD inputStruct[3];

  inputStruct[2] = *MEMORY[0x24BDAC8D0];
  inputStruct[0] = 0xAAAAAAAAAAAAAAAALL;
  inputStruct[1] = 0xAAAAAAAAAAAAAAAALL;
  LODWORD(inputStruct[0]) = *(_DWORD *)(a1 + 32);
  v2 = 8;
  outputStruct = 0xAAAAAAAAAAAAAAAALL;
  if (IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0xCu, 0, 0, inputStruct, 0x10uLL, 0, 0, &outputStruct, &v2))
  {
    return 0;
  }
  else
  {
    return outputStruct;
  }
}

uint64_t CCStream_setLogFlag(uint64_t a1, uint64_t a2)
{
  int v2;
  _DWORD inputStruct[2];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 32);
  inputStruct[1] = -1431655766;
  v5 = a2;
  inputStruct[0] = v2;
  return IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0xDu, 0, 0, inputStruct, 0x10uLL, 0, 0, 0, 0);
}

uint64_t CCStream_clearLogFlag(uint64_t a1, uint64_t a2)
{
  int v2;
  _DWORD inputStruct[2];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 32);
  inputStruct[1] = -1431655766;
  v5 = a2;
  inputStruct[0] = v2;
  return IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0xEu, 0, 0, inputStruct, 0x10uLL, 0, 0, 0, 0);
}

uint64_t CCStream_setConsoleFlags(uint64_t a1, uint64_t a2)
{
  int v2;
  _DWORD inputStruct[2];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 32);
  inputStruct[1] = -1431655766;
  v5 = a2;
  inputStruct[0] = v2;
  return IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0xFu, 0, 0, inputStruct, 0x10uLL, 0, 0, 0, 0);
}

unint64_t CCStream_getConsoleFlags(uint64_t a1)
{
  size_t v2;
  unint64_t outputStruct;
  _QWORD inputStruct[3];

  inputStruct[2] = *MEMORY[0x24BDAC8D0];
  inputStruct[0] = 0xAAAAAAAAAAAAAAAALL;
  inputStruct[1] = 0xAAAAAAAAAAAAAAAALL;
  LODWORD(inputStruct[0]) = *(_DWORD *)(a1 + 32);
  v2 = 8;
  outputStruct = 0xAAAAAAAAAAAAAAAALL;
  if (IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0x10u, 0, 0, inputStruct, 0x10uLL, 0, 0, &outputStruct, &v2))
  {
    return 0;
  }
  else
  {
    return outputStruct;
  }
}

uint64_t CCStream_setConsoleLogFlag(uint64_t a1, uint64_t a2)
{
  int v2;
  _DWORD inputStruct[2];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 32);
  inputStruct[1] = -1431655766;
  v5 = a2;
  inputStruct[0] = v2;
  return IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0x11u, 0, 0, inputStruct, 0x10uLL, 0, 0, 0, 0);
}

uint64_t CCStream_clearConsoleLogFlag(uint64_t a1, uint64_t a2)
{
  int v2;
  _DWORD inputStruct[2];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 32);
  inputStruct[1] = -1431655766;
  v5 = a2;
  inputStruct[0] = v2;
  return IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0x12u, 0, 0, inputStruct, 0x10uLL, 0, 0, 0, 0);
}

uint64_t CCStream_setLevel(uint64_t a1, int a2)
{
  _DWORD inputStruct[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  inputStruct[0] = *(_DWORD *)(a1 + 32);
  inputStruct[1] = a2;
  return IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0x13u, 0, 0, inputStruct, 8uLL, 0, 0, 0, 0);
}

uint64_t CCStream_getLevel(uint64_t a1)
{
  size_t v2;
  unsigned int outputStruct;
  _DWORD inputStruct[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  inputStruct[0] = *(_DWORD *)(a1 + 32);
  inputStruct[1] = -1431655766;
  outputStruct = -1431655766;
  v2 = 4;
  if (IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0x14u, 0, 0, inputStruct, 8uLL, 0, 0, &outputStruct, &v2))
  {
    return 0;
  }
  else
  {
    return outputStruct;
  }
}

uint64_t CCStream_setConsoleLevel(uint64_t a1, int a2)
{
  _DWORD inputStruct[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  inputStruct[0] = *(_DWORD *)(a1 + 32);
  inputStruct[1] = a2;
  return IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0x15u, 0, 0, inputStruct, 8uLL, 0, 0, 0, 0);
}

uint64_t CCStream_getConsoleLevel(uint64_t a1)
{
  size_t v2;
  unsigned int outputStruct;
  _DWORD inputStruct[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  inputStruct[0] = *(_DWORD *)(a1 + 32);
  inputStruct[1] = -1431655766;
  outputStruct = -1431655766;
  v2 = 4;
  if (IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0x16u, 0, 0, inputStruct, 8uLL, 0, 0, &outputStruct, &v2))
  {
    return 0;
  }
  else
  {
    return outputStruct;
  }
}

unint64_t CCStream_logEmergency(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 0, -1, a2, &a9);
}

unint64_t __logv(uint64_t a1, signed int a2, uint64_t a3, const char *a4, va_list a5)
{
  uint64_t v9;
  signed int Level;
  signed int ConsoleLevel;
  unint64_t Flags;
  unint64_t result;
  _BOOL4 v15;
  uint64_t v16;
  _BOOL4 v18;
  int v19;
  BOOL v20;
  char *v21;
  _BYTE *v22;
  size_t v23;
  uint64_t v24;
  unint64_t v25;
  _BYTE *v26;
  int v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int *v30;
  unsigned int v31;
  size_t v32;
  char *v33;
  unsigned int *v34;
  unsigned int v35;

  v9 = *(_QWORD *)(a1 + 24);
  Level = CCStream_getLevel(a1);
  ConsoleLevel = CCStream_getConsoleLevel(a1);
  Flags = CCStream_getFlags(a1);
  result = CCStream_getConsoleFlags(a1);
  v15 = (Flags & a3) != 0 || a3 == -1;
  v16 = Level >= a2 && v15;
  v18 = (result & a3) != 0 || a3 == -1;
  v19 = ConsoleLevel >= a2 && v18;
  v20 = ConsoleLevel < a2 && Level < a2;
  if (!v20 && v16 | v19)
  {
    v21 = *(char **)(a1 + 40);
    if (v21)
    {
      v22 = (_BYTE *)(a1 + 56);
      if (!*(_BYTE *)(a1 + 56))
      {
        v23 = *(_QWORD *)(a1 + 48);
        *v22 = 1;
        result = vsnprintf(v21, v23, a4, a5);
        if ((result & 0x80000000) == 0)
        {
          if (v23 > result)
          {
            v25 = result;
LABEL_29:
            result = CCPipe_logw(v9, v24, a2, (uint64_t)v21, v25, v16, v19);
            goto LABEL_44;
          }
          if (result > 0x5000)
          {
            result = printf("CCLogStream::log - Grown more than expected (%d)\n", result);
            v30 = (unsigned int *)(v9 + 48);
            do
              v31 = __ldxr(v30);
            while (__stxr(v31 + 1, v30));
            goto LABEL_44;
          }
          v32 = (result + 1);
          result = (unint64_t)malloc_type_malloc(v32, 0x227BF63uLL);
          if (!result)
          {
            v34 = (unsigned int *)(v9 + 48);
            do
              v35 = __ldxr(v34);
            while (__stxr(v35 + 1, v34));
            goto LABEL_44;
          }
          v33 = (char *)result;
          free(v21);
          *(_QWORD *)(a1 + 40) = v33;
          *(_QWORD *)(a1 + 48) = v32;
          result = vsnprintf(v33, v32, a4, a5);
          if ((result & 0x80000000) == 0)
          {
            v25 = result;
            v21 = v33;
            goto LABEL_29;
          }
        }
LABEL_44:
        *v22 = 0;
        return result;
      }
    }
    else
    {
      result = printf("%s(): scratchBuffer is NULL\n", "__logv");
      v27 = *(unsigned __int8 *)(a1 + 56);
      v26 = (_BYTE *)(a1 + 56);
      if (!v27)
      {
        *v26 = 1;
        v22 = v26;
        goto LABEL_44;
      }
    }
    v28 = (unsigned int *)(v9 + 48);
    do
      v29 = __ldxr(v28);
    while (__stxr(v29 + 1, v28));
  }
  return result;
}

unint64_t CCStream_logEmergencyIf(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 0, a2, a3, &a9);
}

unint64_t CCStream_logAlert(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 1, -1, a2, &a9);
}

unint64_t CCStream_logAlertIf(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 1, a2, a3, &a9);
}

unint64_t CCStream_logCrit(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 2, -1, a2, &a9);
}

unint64_t CCStream_logCritIf(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 2, a2, a3, &a9);
}

unint64_t CCStream_logWarn(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 3, -1, a2, &a9);
}

unint64_t CCStream_logWarnIf(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 3, a2, a3, &a9);
}

unint64_t CCStream_logNotice(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 4, -1, a2, &a9);
}

unint64_t CCStream_logNoticeIf(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 4, a2, a3, &a9);
}

unint64_t CCStream_logInfo(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 5, -1, a2, &a9);
}

unint64_t CCStream_logInfoIf(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 5, a2, a3, &a9);
}

unint64_t CCStream_logDebug(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 6, -1, a2, &a9);
}

unint64_t CCStream_logDebugIf(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 6, a2, a3, &a9);
}

unint64_t CCStream_logSpam(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 7, -1, a2, &a9);
}

unint64_t CCStream_logSpamIf(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 7, a2, a3, &a9);
}

unint64_t CCStream_log(uint64_t a1, signed int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, a2, -1, a3, &a9);
}

unint64_t CCStream_logIf(uint64_t a1, signed int a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, a2, a3, a4, &a9);
}

uint64_t CC_getTypeID()
{
  uint64_t result;

  result = __kCCTypeID;
  if (!__kCCTypeID)
  {
    pthread_once(&__gCCTypeInit, (void (*)(void))__CCRegister);
    return __kCCTypeID;
  }
  return result;
}

uint64_t __CCRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kCCTypeID = result;
  return result;
}

void __CCRelease(uint64_t a1)
{
  uint64_t v2;
  mach_port_t v3;

  v2 = a1 + 16;
  if (*(_BYTE *)(a1 + 32))
  {
    v3 = *(_DWORD *)(a1 + 20);
    if (v3)
    {
      IOConnectCallScalarMethod(v3, 1u, 0, 0, 0, 0);
      IOServiceClose(*(_DWORD *)(a1 + 20));
    }
  }
  if (*(_DWORD *)v2)
  {
    IOObjectRelease(*(_DWORD *)v2);
    *(_DWORD *)v2 = 0;
  }
  os_activity_end(*(os_activity_t *)(a1 + 24));
  *(_QWORD *)v2 = 0;
  *(_QWORD *)(v2 + 8) = 0;
  *(_QWORD *)(v2 + 16) = 0;
}

BOOL __CCEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef __CCCopyFormattingDesc(uint64_t a1, const __CFDictionary *a2)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, CFSTR("CC@%p"), a1);
}

CFStringRef __CCCopyDebugDesc(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("CC@%p"), a1);
}

uint64_t CC_create(_QWORD *a1)
{
  _QWORD *Instance;
  _QWORD *v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  uint64_t v6;
  uint64_t v7;

  if (!__kCCTypeID)
    pthread_once(&__gCCTypeInit, (void (*)(void))__CCRegister);
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  if (!Instance)
    return 3825187585;
  v3 = Instance;
  *a1 = Instance;
  Instance[2] = 0;
  Instance[3] = 0;
  Instance[4] = 0;
  v4 = IOServiceMatching("CoreCaptureResponder");
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v4);
  if (!MatchingService)
  {
    v7 = 0;
    goto LABEL_12;
  }
  *((_DWORD *)v3 + 4) = MatchingService;
  v6 = IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0x123u, (io_connect_t *)v3 + 5);
  if ((_DWORD)v6)
  {
    v7 = v6;
    goto LABEL_12;
  }
  v7 = IOConnectCallScalarMethod(*((_DWORD *)v3 + 5), 0, 0, 0, 0, 0);
  if ((_DWORD)v7)
  {
LABEL_12:
    CFRelease(v3);
    return v7;
  }
  v3[3] = _os_activity_start(&dword_22942D000, "CoreCapture Userspace", OS_ACTIVITY_FLAG_DEFAULT);
  *((_BYTE *)v3 + 32) = 1;
  return v7;
}

uint64_t CC_getConnectRef(uint64_t a1)
{
  return *(unsigned int *)(a1 + 20);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

os_activity_t _os_activity_start(void *dso, const char *description, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB28](dso, description, *(_QWORD *)&flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x24BDAEAA0](a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

void os_activity_end(os_activity_t activity)
{
  MEMORY[0x24BDAF298](activity);
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

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x24BDAFF28](a1, a2, a3, a4);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

