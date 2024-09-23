@implementation GKPeerInternal

- (GKPeerInternal)initWithPID:(unsigned int)a3 displayName:(id)a4 serviceName:(id)a5
{
  GKPeerInternal *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKPeerInternal;
  v8 = -[GKPeerInternal init](&v10, sel_init);
  if (v8)
  {
    v8->_serviceName = (NSString *)a5;
    v8->_displayName = (NSString *)a4;
    v8->_pid = a3;
    v8->_isBusy = 0;
    v8->_resolveService = 0;
    v8->_serviceCount = 1;
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  unsigned int pid;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  GKPeerInternal *v14;
  __int16 v15;
  unsigned int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      pid = self->_pid;
      *(_DWORD *)buf = 136316162;
      v8 = v3;
      v9 = 2080;
      v10 = "-[GKPeerInternal dealloc]";
      v11 = 1024;
      v12 = 4530;
      v13 = 2048;
      v14 = self;
      v15 = 1024;
      v16 = pid;
      _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d * GKPeer[%p] %d dealloc", buf, 0x2Cu);
    }
  }
  -[GKPeerInternal stopResolving](self, "stopResolving");

  +[GKPeerInternal freeLookupList:andAddrList:andInterfaceList:count:](GKPeerInternal, "freeLookupList:andAddrList:andInterfaceList:count:", self->_lookupServiceList, self->_addrList, self->_interfaceList, self->_lookupServiceCount);
  v6.receiver = self;
  v6.super_class = (Class)GKPeerInternal;
  -[GKPeerInternal dealloc](&v6, sel_dealloc);
}

- (void)setServiceCount:(int)a3
{
  uint64_t v5;
  NSObject *v6;
  unsigned int pid;
  int serviceCount;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  GKPeerInternal *v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      pid = self->_pid;
      serviceCount = self->_serviceCount;
      v9 = 136316674;
      v10 = v5;
      v11 = 2080;
      v12 = "-[GKPeerInternal setServiceCount:]";
      v13 = 1024;
      v14 = 4540;
      v15 = 2048;
      v16 = self;
      v17 = 1024;
      v18 = pid;
      v19 = 1024;
      v20 = serviceCount;
      v21 = 1024;
      v22 = a3;
      _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKPeer[%p] %d service count old=%d new=%d", (uint8_t *)&v9, 0x38u);
    }
  }
  self->_serviceCount = a3;
}

- (int)serviceCount
{
  return self->_serviceCount;
}

- (BOOL)tryDetruncateDisplayName:(id)a3
{
  unint64_t v5;
  _BOOL4 v6;

  v5 = objc_msgSend(a3, "length");
  if (v5 <= -[NSString length](self->_displayName, "length"))
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v6 = -[NSString isEqualToString:](self->_displayName, "isEqualToString:", objc_msgSend(a3, "substringToIndex:", -[NSString length](self->_displayName, "length")));
    if (v6)
    {

      self->_displayName = (NSString *)a3;
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (void)addLookup:(_DNSServiceRef_t *)a3
{
  _DNSServiceRef_t **lookupServiceList;
  int lookupServiceCount;
  int lookupServiceSize;
  int *p_lookupServiceCount;
  _DNSServiceRef_t **v9;
  uint64_t v10;
  id *v11;
  id *v12;
  id *addrList;
  void *v14;
  void *v15;
  unsigned int *interfaceList;
  _DNSServiceRef_t **v17;
  id *v18;
  unsigned int *v19;
  __int128 v20;

  lookupServiceList = self->_lookupServiceList;
  if (lookupServiceList)
  {
    lookupServiceCount = self->_lookupServiceCount;
    lookupServiceSize = self->_lookupServiceSize;
    p_lookupServiceCount = &self->_lookupServiceCount;
    if (lookupServiceCount != lookupServiceSize)
    {
LABEL_11:
      *p_lookupServiceCount = lookupServiceCount + 1;
      lookupServiceList[lookupServiceCount] = a3;
      return;
    }
    v9 = (_DNSServiceRef_t **)malloc_type_realloc(lookupServiceList, 8 * (lookupServiceSize + 16), 0x2004093837F09uLL);
    if (v9)
    {
      v10 = self->_lookupServiceSize + 16;
      self->_lookupServiceSize = v10;
      self->_lookupServiceList = v9;
      v11 = (id *)malloc_type_calloc(v10, 8uLL, 0x80040B8603338uLL);
      if (v11)
      {
        v12 = v11;
        addrList = self->_addrList;
        memcpy(v11, addrList, 8 * self->_lookupServiceSize - 128);
        self->_addrList = v12;
        free(addrList);
        v14 = malloc_type_calloc(self->_lookupServiceSize, 4uLL, 0x100004052888210uLL);
        if (v14)
        {
          v15 = v14;
          interfaceList = self->_interfaceList;
          memset(interfaceList, 255, 4 * self->_lookupServiceSize);
          memcpy(v15, interfaceList, 4 * self->_lookupServiceSize - 64);
          self->_interfaceList = (unsigned int *)v15;
          free(interfaceList);
          lookupServiceList = self->_lookupServiceList;
          lookupServiceCount = self->_lookupServiceCount;
          goto LABEL_11;
        }
      }
    }
    +[GKPeerInternal freeLookupList:andAddrList:andInterfaceList:count:](GKPeerInternal, "freeLookupList:andAddrList:andInterfaceList:count:", self->_lookupServiceList, self->_addrList, self->_interfaceList, self->_lookupServiceCount);
    goto LABEL_14;
  }
  v17 = (_DNSServiceRef_t **)malloc_type_malloc(0x80uLL, 0x2004093837F09uLL);
  self->_lookupServiceList = v17;
  if (!v17)
    return;
  v18 = (id *)malloc_type_calloc(0x10uLL, 8uLL, 0x80040B8603338uLL);
  self->_addrList = v18;
  if (!v18)
  {
    free(self->_lookupServiceList);
LABEL_14:
    self->_lookupServiceList = 0;
    return;
  }
  v19 = (unsigned int *)malloc_type_calloc(0x10uLL, 4uLL, 0x100004052888210uLL);
  self->_interfaceList = v19;
  if (v19)
  {
    lookupServiceCount = 0;
    *(_QWORD *)&v20 = -1;
    *((_QWORD *)&v20 + 1) = -1;
    *((_OWORD *)v19 + 2) = v20;
    *((_OWORD *)v19 + 3) = v20;
    *(_OWORD *)v19 = v20;
    *((_OWORD *)v19 + 1) = v20;
    self->_lookupServiceSize = 16;
    lookupServiceList = self->_lookupServiceList;
    p_lookupServiceCount = &self->_lookupServiceCount;
    goto LABEL_11;
  }
  free(self->_lookupServiceList);
  self->_lookupServiceList = 0;
  free(self->_addrList);
  self->_addrList = 0;
}

+ (void)freeLookupList:(_DNSServiceRef_t *)a3 andAddrList:(id *)a4 andInterfaceList:(unsigned int *)a5 count:(int)a6
{
  uint64_t v9;
  id *v10;
  void *v11;

  if (a3 && a4 && a6 >= 1)
  {
    v9 = a6;
    v10 = a4;
    do
    {
      v11 = *v10++;

      --v9;
    }
    while (v9);
  }
  free(a3);
  free(a4);
  free(a5);
}

- (void)removeAndReturnLookupList:(_DNSServiceRef_t *)a3 andAddrList:(id *)a4 andInterfaceList:(unsigned int *)a5 count:(int *)a6
{
  _DNSServiceRef_t **lookupServiceList;

  lookupServiceList = self->_lookupServiceList;
  if (lookupServiceList)
  {
    *a6 = self->_lookupServiceCount;
    *a3 = lookupServiceList;
    *a4 = self->_addrList;
    *a5 = self->_interfaceList;
    self->_addrList = 0;
    self->_interfaceList = 0;
    self->_lookupServiceList = 0;
    *(_QWORD *)&self->_lookupServiceCount = 0;
  }
  else
  {
    *a6 = 0;
    *a3 = 0;
    *a4 = 0;
    *a5 = 0;
  }
}

- (BOOL)containsLookupService:(_DNSServiceRef_t *)a3
{
  uint64_t v5;
  NSObject *v6;
  unsigned int pid;
  const char *v8;
  int lookupServiceCount;
  _DNSServiceRef_t **lookupServiceList;
  uint64_t v11;
  uint64_t v12;
  _DNSServiceRef_t *v13;
  BOOL result;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      pid = self->_pid;
      v8 = "yes";
      lookupServiceCount = self->_lookupServiceCount;
      if (!self->_lookupServiceList)
        v8 = "no";
      v16 = 136316418;
      v17 = v5;
      v18 = 2080;
      v19 = "-[GKPeerInternal containsLookupService:]";
      v20 = 1024;
      v21 = 4657;
      v22 = 1024;
      v23 = pid;
      v24 = 2080;
      v25 = v8;
      v26 = 1024;
      v27 = lookupServiceCount;
      _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer %d checking lookup service (%s) containing %d", (uint8_t *)&v16, 0x32u);
    }
  }
  lookupServiceList = self->_lookupServiceList;
  if (!lookupServiceList)
    return 0;
  v11 = self->_lookupServiceCount;
  if ((int)v11 < 1)
    return 0;
  v12 = v11 - 1;
  do
  {
    v13 = *lookupServiceList++;
    result = v13 == a3;
  }
  while (v13 != a3 && v12-- != 0);
  return result;
}

- (void)setAddr:(const sockaddr_in *)a3 interface:(unsigned int)a4 forLookupService:(_DNSServiceRef_t *)a5
{
  int lookupServiceCount;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  char v13;
  unsigned int v14;
  uint64_t v15;
  NSObject *v16;
  unsigned int v17;
  unsigned int pid;
  _DNSServiceRef_t *v19;
  id v20;
  int ErrorLogLevelForModule;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  NSObject *v28;
  _DNSServiceRef_t *v29;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  unsigned int v40;
  __int16 v41;
  unsigned int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  unsigned int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  unsigned int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  unsigned int v62;
  __int16 v63;
  int v64;
  sockaddr_in v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  if (!self->_lookupServiceList)
    return;
  lookupServiceCount = self->_lookupServiceCount;
  if (lookupServiceCount < 1)
    return;
  v7 = 0;
  while (self->_lookupServiceList[v7] != a5)
  {
LABEL_26:
    if (++v7 >= lookupServiceCount)
      return;
  }
  v65 = *a3;
  v65.sin_port = bswap32(LOWORD(self->_servicePort)) >> 16;
  if (lookupServiceCount < 1)
  {
LABEL_23:
    v20 = self->_addrList[v7];
    if (v20)

    self->_addrList[v7] = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v65, 16);
    self->_interfaceList[v7] = a4;
    lookupServiceCount = self->_lookupServiceCount;
    goto LABEL_26;
  }
  v8 = 0;
  while (1)
  {
    v9 = self->_addrList[v8];
    if (!v9)
    {
      v11 = 0;
      v14 = 0;
      v12 = bswap32(v65.sin_addr.s_addr);
LABEL_12:
      v13 = 1;
      goto LABEL_13;
    }
    v10 = objc_msgSend(v9, "bytes");
    v11 = v10;
    v12 = bswap32(v65.sin_addr.s_addr);
    if (!v10)
    {
      v14 = 0;
      goto LABEL_12;
    }
    v13 = 0;
    v14 = bswap32(*(_DWORD *)(v10 + 4));
LABEL_13:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if ((v13 & 1) != 0)
          v17 = 0;
        else
          v17 = bswap32(*(unsigned __int16 *)(v11 + 2)) >> 16;
        pid = self->_pid;
        v19 = self->_lookupServiceList[v7];
        *(_DWORD *)buf = 136318978;
        v34 = v15;
        v35 = 2080;
        v36 = "-[GKPeerInternal setAddr:interface:forLookupService:]";
        v37 = 1024;
        v38 = 4684;
        v39 = 1024;
        v40 = pid;
        v41 = 1024;
        v42 = HIBYTE(v12);
        v43 = 1024;
        v44 = BYTE2(v12);
        v45 = 1024;
        v46 = BYTE1(v12);
        v47 = 1024;
        v48 = v12;
        v49 = 1024;
        v50 = bswap32(v65.sin_port) >> 16;
        v51 = 1024;
        v52 = (int)a5;
        v53 = 1024;
        v54 = HIBYTE(v14);
        v55 = 1024;
        v56 = BYTE2(v14);
        v57 = 1024;
        v58 = BYTE1(v14);
        v59 = 1024;
        v60 = v14;
        v61 = 1024;
        v62 = v17;
        v63 = 1024;
        v64 = (int)v19;
        _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer %d setAddr %u.%u.%u.%u:%u for service %08X compared to %u.%u.%u.%u:%u of service %08X", buf, 0x6Au);
      }
    }
    if ((v13 & 1) == 0 && *(unsigned __int16 *)(v11 + 2) == v65.sin_port && *(_DWORD *)(v11 + 4) == v65.sin_addr.s_addr)
      break;
    if (++v8 >= self->_lookupServiceCount)
      goto LABEL_23;
  }
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if ((_DWORD)v7 == (_DWORD)v8)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v34 = v22;
        v35 = 2080;
        v36 = "-[GKPeerInternal setAddr:interface:forLookupService:]";
        v37 = 1024;
        v38 = 4690;
        v24 = " [%s] %s:%d  - already set to same IP";
        v25 = v23;
        v26 = 28;
        goto LABEL_35;
      }
    }
  }
  else if (ErrorLogLevelForModule >= 7)
  {
    v27 = VRTraceErrorLogLevelToCSTR();
    v28 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v29 = self->_lookupServiceList[v8];
      *(_DWORD *)buf = 136315906;
      v34 = v27;
      v35 = 2080;
      v36 = "-[GKPeerInternal setAddr:interface:forLookupService:]";
      v37 = 1024;
      v38 = 4692;
      v39 = 1024;
      v40 = v29;
      v24 = " [%s] %s:%d  - was set in a previous GetAddrInfo service: %08X (double resolve?)";
      v25 = v28;
      v26 = 34;
LABEL_35:
      _os_log_impl(&dword_215C5C000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
    }
  }
}

- (void)copyLookupList:(_DNSServiceRef_t *)a3 count:(int *)a4
{
  _DNSServiceRef_t **lookupServiceList;
  _DNSServiceRef_t **v8;

  lookupServiceList = self->_lookupServiceList;
  if (lookupServiceList)
  {
    v8 = (_DNSServiceRef_t **)malloc_type_malloc(8 * self->_lookupServiceCount, 0x2004093837F09uLL);
    *a3 = v8;
    memcpy(v8, self->_lookupServiceList, 8 * self->_lookupServiceCount);
    LODWORD(lookupServiceList) = self->_lookupServiceCount;
  }
  else
  {
    *a3 = 0;
  }
  *a4 = (int)lookupServiceList;
}

- (int)usableAddrs
{
  uint64_t lookupServiceCount;
  int result;
  id *addrList;

  if (!self->_lookupServiceList)
    return 0;
  lookupServiceCount = self->_lookupServiceCount;
  if ((int)lookupServiceCount < 1)
    return 0;
  result = 0;
  addrList = self->_addrList;
  do
  {
    if (*addrList++)
      ++result;
    --lookupServiceCount;
  }
  while (lookupServiceCount);
  return result;
}

- (void)stopResolving
{
  __int128 v3;
  uint64_t v4;
  NSObject *v5;
  unsigned int v6;
  _DNSServiceRef_t **lookupServiceList;
  uint64_t v8;
  os_log_t *v9;
  uint64_t v10;
  NSObject *v11;
  unsigned int pid;
  _DNSServiceRef_t *v13;
  _DNSServiceRef_t *v14;
  _DNSServiceRef_t **p_resolveService;
  _DNSServiceRef_t *resolveService;
  uint64_t v17;
  NSObject *v18;
  unsigned int v19;
  _DNSServiceRef_t *v20;
  uint64_t v21;
  NSObject *v22;
  unsigned int v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  NSObject *v28;
  unsigned int v29;
  __int128 v30;
  _BYTE buf[24];
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[GKSessionInternal lock](self->_session, "lock");
  if (!-[GKSessionInternal isShuttingDown](self->_session, "isShuttingDown"))
  {
    lookupServiceList = self->_lookupServiceList;
    if (lookupServiceList)
    {
      if (self->_lookupServiceCount < 1)
      {
        LODWORD(v8) = 0;
      }
      else
      {
        v8 = 0;
        v9 = (os_log_t *)MEMORY[0x24BDFDC28];
        *(_QWORD *)&v3 = 136316418;
        v30 = v3;
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v10 = VRTraceErrorLogLevelToCSTR();
            v11 = *v9;
            if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
            {
              pid = self->_pid;
              v13 = self->_lookupServiceList[v8];
              *(_DWORD *)buf = v30;
              *(_QWORD *)&buf[4] = v10;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "-[GKPeerInternal stopResolving]";
              *(_WORD *)&buf[22] = 1024;
              LODWORD(v32) = 4744;
              WORD2(v32) = 2048;
              *(_QWORD *)((char *)&v32 + 6) = self;
              HIWORD(v32) = 1024;
              LODWORD(v33) = pid;
              WORD2(v33) = 1024;
              *(_DWORD *)((char *)&v33 + 6) = (_DWORD)v13;
              _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKPeer[%p] %d dealloc lookupService: %08X", buf, 0x32u);
            }
          }
          v14 = self->_lookupServiceList[v8];
          if (v14)
            DNSServiceRefDeallocate(v14);
          ++v8;
        }
        while (v8 < self->_lookupServiceCount);
        lookupServiceList = self->_lookupServiceList;
      }
      free(lookupServiceList);
      p_resolveService = &self->_resolveService;
      resolveService = self->_resolveService;
      self->_lookupServiceList = 0;
      self->_lookupServiceCount = 0;
      if (resolveService)
        goto LABEL_20;
      if ((_DWORD)v8)
      {
LABEL_24:
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_32;
        v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x24BDFDC28];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          goto LABEL_32;
        v23 = self->_pid;
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[GKPeerInternal stopResolving]";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v32) = 4761;
        WORD2(v32) = 2048;
        *(_QWORD *)((char *)&v32 + 6) = self;
        HIWORD(v32) = 1024;
        LODWORD(v33) = v23;
        WORD2(v33) = 1024;
        *(_DWORD *)((char *)&v33 + 6) = v8;
        v24 = " [%s] %s:%d * GKPeer[%p] %d Stopped resolving: %d";
        v25 = v22;
        v26 = 50;
        goto LABEL_31;
      }
    }
    else
    {
      p_resolveService = &self->_resolveService;
      if (self->_resolveService)
      {
        LODWORD(v8) = 0;
LABEL_20:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v17 = VRTraceErrorLogLevelToCSTR();
          v18 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v19 = self->_pid;
            v20 = self->_resolveService;
            *(_DWORD *)buf = 136316418;
            *(_QWORD *)&buf[4] = v17;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[GKPeerInternal stopResolving]";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v32) = 4755;
            WORD2(v32) = 2048;
            *(_QWORD *)((char *)&v32 + 6) = self;
            HIWORD(v32) = 1024;
            LODWORD(v33) = v19;
            WORD2(v33) = 1024;
            *(_DWORD *)((char *)&v33 + 6) = (_DWORD)v20;
            _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKPeer[%p] %d dealloc resolveService: %08X", buf, 0x32u);
          }
        }
        DNSServiceRefDeallocate(*p_resolveService);
        *p_resolveService = 0;
        LODWORD(v8) = v8 + 1;
        goto LABEL_24;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_32;
    v27 = VRTraceErrorLogLevelToCSTR();
    v28 = *MEMORY[0x24BDFDC28];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      goto LABEL_32;
    v29 = self->_pid;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = v27;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[GKPeerInternal stopResolving]";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v32) = 4763;
    WORD2(v32) = 2048;
    *(_QWORD *)((char *)&v32 + 6) = self;
    HIWORD(v32) = 1024;
    LODWORD(v33) = v29;
    v24 = " [%s] %s:%d * GKPeer[%p] %d Nothing to stop resolving";
    v25 = v28;
    v26 = 44;
LABEL_31:
    _os_log_impl(&dword_215C5C000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
    goto LABEL_32;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->_pid;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[GKPeerInternal stopResolving]";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v32) = 4734;
      WORD2(v32) = 2048;
      *(_QWORD *)((char *)&v32 + 6) = self;
      HIWORD(v32) = 1024;
      LODWORD(v33) = v6;
      _os_log_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKPeer[%p] %d avoiding overrelease", buf, 0x2Cu);
    }
  }
  -[GKPeerInternal clearResolving](self, "clearResolving");
LABEL_32:
  -[GKSessionInternal unlock](self->_session, "unlock", v30, *(_OWORD *)buf, *(_QWORD *)&buf[16], v32, v33);
}

- (void)clearResolving
{
  _DNSServiceRef_t **lookupServiceList;

  lookupServiceList = self->_lookupServiceList;
  if (lookupServiceList)
  {
    free(lookupServiceList);
    self->_lookupServiceList = 0;
    self->_lookupServiceCount = 0;
  }
  if (self->_resolveService)
    self->_resolveService = 0;
}

- (void)stopTXTRecordMonitoring
{
  uint64_t v3;
  NSObject *v4;
  unsigned int pid;
  _DNSServiceRef_t *txtRecordService;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  GKPeerInternal *v14;
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[GKSessionInternal lock](self->_session, "lock");
  if (!-[GKSessionInternal isShuttingDown](self->_session, "isShuttingDown"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        pid = self->_pid;
        txtRecordService = self->_txtRecordService;
        v7 = 136316418;
        v8 = v3;
        v9 = 2080;
        v10 = "-[GKPeerInternal stopTXTRecordMonitoring]";
        v11 = 1024;
        v12 = 4783;
        v13 = 2048;
        v14 = self;
        v15 = 1024;
        v16 = pid;
        v17 = 1024;
        v18 = (int)txtRecordService;
        _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKPeer[%p] %d => calling DNSServiceRefDeallocate(_txtRecordService) (%08X)", (uint8_t *)&v7, 0x32u);
      }
    }
    DNSServiceRefDeallocate(self->_txtRecordService);
    self->_txtRecordService = 0;
  }
  -[GKSessionInternal unlock](self->_session, "unlock");
}

- (void)cleanupForGKTable:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  unsigned int pid;
  uint64_t v8;
  NSObject *v9;
  _DNSServiceRef_t *txtRecordService;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  GKPeerInternal *v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      pid = self->_pid;
      v11 = 136316418;
      v12 = v5;
      v13 = 2080;
      v14 = "-[GKPeerInternal cleanupForGKTable:]";
      v15 = 1024;
      v16 = 4791;
      v17 = 2048;
      v18 = self;
      v19 = 1024;
      v20 = pid;
      v21 = 2048;
      v22 = a3;
      _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKPeer[%p] %d cleanup for table[%p]", (uint8_t *)&v11, 0x36u);
    }
  }
  -[GKPeerInternal stopResolving](self, "stopResolving");
  -[GKSessionInternal lock](self->_session, "lock");
  if (!-[GKSessionInternal isShuttingDown](self->_session, "isShuttingDown"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        txtRecordService = self->_txtRecordService;
        v11 = 136315906;
        v12 = v8;
        v13 = 2080;
        v14 = "-[GKPeerInternal cleanupForGKTable:]";
        v15 = 1024;
        v16 = 4795;
        v17 = 1024;
        LODWORD(v18) = (_DWORD)txtRecordService;
        _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_txtRecordService) (%08X)", (uint8_t *)&v11, 0x22u);
      }
    }
    DNSServiceRefDeallocate(self->_txtRecordService);
    self->_txtRecordService = 0;
  }
  -[GKSessionInternal unlock](self->_session, "unlock");
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unsigned)pid
{
  return self->_pid;
}

- (BOOL)isBusy
{
  return self->_isBusy;
}

- (void)setBusy:(BOOL)a3
{
  self->_isBusy = a3;
}

- (_DNSServiceRef_t)resolveService
{
  return self->_resolveService;
}

- (void)setResolveService:(_DNSServiceRef_t *)a3
{
  self->_resolveService = a3;
}

- (_DNSServiceRef_t)txtRecordService
{
  return self->_txtRecordService;
}

- (void)setTxtRecordService:(_DNSServiceRef_t *)a3
{
  self->_txtRecordService = a3;
}

- (unsigned)servicePort
{
  return self->_servicePort;
}

- (void)setServicePort:(unsigned int)a3
{
  self->_servicePort = a3;
}

- (BOOL)moreResolvesComing
{
  return self->_moreResolvesComing;
}

- (void)setMoreResolvesComing:(BOOL)a3
{
  self->_moreResolvesComing = a3;
}

- (GKSessionInternal)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (double)connectTimeout
{
  return self->_connectTimeout;
}

- (void)setConnectTimeout:(double)a3
{
  self->_connectTimeout = a3;
}

- (BOOL)needsToTimeout
{
  return self->_needsToTimeout;
}

- (void)setNeedsToTimeout:(BOOL)a3
{
  self->_needsToTimeout = a3;
}

@end
