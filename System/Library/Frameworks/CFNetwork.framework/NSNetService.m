@implementation NSNetService

- (NSNetService)init
{
  NSNetService *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NSNetService;
  v2 = -[NSNetService init](&v4, sel_init);
  if (v2)

  return 0;
}

- (NSNetService)initWithCFNetService:(__CFNetService *)a3
{
  NSNetService *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  void *v8;
  CFNetServiceMonitorRef v9;
  const char *v10;
  CFNetServiceMonitorRef v11;
  id Property;
  CFNetServiceClientContext clientContext;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NSNetService;
  v4 = -[NSNetService init](&v15, sel_init);
  v5 = (uint64_t)v4;
  if (v4)
  {
    if (a3)
    {
      v4->_netService = a3;
      *(_QWORD *)(v5 + 24) = objc_alloc_init(NSNetServicesInternal);
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
      v8 = *(void **)(v5 + 24);
      if (v8)
        objc_setProperty_atomic(v8, v6, v7, 8);
      clientContext.version = 0;
      clientContext.info = -[_NSNetServiceWeakObject initWithObject:]([_NSNetServiceWeakObject alloc], (void *)v5);
      clientContext.retain = (CFAllocatorRetainCallBack)MEMORY[0x1E0C98BD0];
      clientContext.release = (CFAllocatorReleaseCallBack)MEMORY[0x1E0C98BC0];
      clientContext.copyDescription = 0;
      v9 = CFNetServiceMonitorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CFNetServiceRef *)(v5 + 8), (CFNetServiceMonitorClientCallBack)_netServiceMonitorCallBack, &clientContext);
      if (v9)
      {
        v11 = v9;
        Property = *(id *)(v5 + 24);
        if (Property)
          Property = objc_getProperty(Property, v10, 8, 1);
        objc_msgSend(Property, "addObject:", v11);
        CFRelease(v11);
      }
      -[NSNetService _scheduleInDefaultRunLoopForMode:](v5, (const __CFString *)*MEMORY[0x1E0C9B270]);
    }
    else
    {

      return 0;
    }
  }
  return (NSNetService *)v5;
}

- (NSNetService)initWithDomain:(NSString *)domain type:(NSString *)type name:(NSString *)name port:(int)port
{
  id v10;
  const __CFAllocator *v11;
  CFNetServiceRef v12;
  const char *v13;
  void *v14;
  void *v15;
  CFNetServiceMonitorRef v16;
  const char *v17;
  CFNetServiceMonitorRef v18;
  id Property;
  CFNetServiceClientContext clientContext;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)NSNetService;
  v10 = -[NSNetService init](&v22, sel_init);
  if (!v10)
    goto LABEL_11;
  v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v12 = CFNetServiceCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)domain, (CFStringRef)type, (CFStringRef)name, port);
  *((_QWORD *)v10 + 1) = v12;
  if (!v12)
  {
    *((_QWORD *)v10 + 1) = 0;
LABEL_11:

    return 0;
  }
  *((_QWORD *)v10 + 3) = objc_alloc_init(NSNetServicesInternal);
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v15 = (void *)*((_QWORD *)v10 + 3);
  if (v15)
    objc_setProperty_atomic(v15, v13, v14, 8);
  clientContext.version = 0;
  clientContext.info = -[_NSNetServiceWeakObject initWithObject:]([_NSNetServiceWeakObject alloc], v10);
  clientContext.retain = (CFAllocatorRetainCallBack)MEMORY[0x1E0C98BD0];
  clientContext.release = (CFAllocatorReleaseCallBack)MEMORY[0x1E0C98BC0];
  clientContext.copyDescription = 0;
  v16 = CFNetServiceMonitorCreate(v11, *((CFNetServiceRef *)v10 + 1), (CFNetServiceMonitorClientCallBack)_netServiceMonitorCallBack, &clientContext);
  if (v16)
  {
    v18 = v16;
    Property = (id)*((_QWORD *)v10 + 3);
    if (Property)
      Property = objc_getProperty(Property, v17, 8, 1);
    objc_msgSend(Property, "addObject:", v18);
    CFRelease(v18);
  }
  -[NSNetService _scheduleInDefaultRunLoopForMode:]((uint64_t)v10, (const __CFString *)*MEMORY[0x1E0C9B270]);
  return (NSNetService *)v10;
}

- (NSNetService)initWithDomain:(NSString *)domain type:(NSString *)type name:(NSString *)name
{
  return -[NSNetService initWithDomain:type:name:port:](self, "initWithDomain:type:name:port:", domain, type, name, 0xFFFFFFFFLL);
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak(&self->_delegate, delegate);
}

- (BOOL)includesPeerToPeer
{
  const __CFBoolean *Info;

  if (self)
    self = (NSNetService *)self->_netService;
  Info = (const __CFBoolean *)CFNetServiceGetInfo((uint64_t)self, 7u);
  if (Info)
    LOBYTE(Info) = CFBooleanGetValue(Info) != 0;
  return (char)Info;
}

- (void)setIncludesPeerToPeer:(BOOL)includesPeerToPeer
{
  const void **v3;

  if (self)
    self = (NSNetService *)self->_netService;
  v3 = (const void **)MEMORY[0x1E0C9AE50];
  if (!includesPeerToPeer)
    v3 = (const void **)MEMORY[0x1E0C9AE40];
  _ServiceSetInfo((__CFNetService *)self, 7u, *v3, 0);
}

- (void)_setIncludesAWDL:(BOOL)a3
{
  const void **v3;

  if (self)
    self = (NSNetService *)self->_netService;
  v3 = (const void **)MEMORY[0x1E0C9AE50];
  if (!a3)
    v3 = (const void **)MEMORY[0x1E0C9AE40];
  _ServiceSetInfo((__CFNetService *)self, 9u, *v3, 0);
}

- (void)scheduleInRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode
{
  __CFRunLoop *v6;
  __CFRunLoop *v7;
  const char *v8;
  id reserved;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = -[NSRunLoop getCFRunLoop](aRunLoop, "getCFRunLoop");
  if (v6)
  {
    v7 = v6;
    -[NSNetServicesInternal setScheduledRunLoop:andMode:]((_QWORD *)self->_reserved, v6, mode);
    CFNetServiceScheduleWithRunLoop((CFNetServiceRef)self->_netService, v7, (CFStringRef)mode);
    reserved = self->_reserved;
    v10 = reserved ? objc_getProperty(reserved, v8, 8, 1) : 0;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          CFNetServiceMonitorScheduleWithRunLoop(*(CFNetServiceMonitorRef *)(*((_QWORD *)&v15 + 1) + 8 * v14++), v7, (CFStringRef)mode);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }
  }
}

- (void)removeFromRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode
{
  __CFRunLoop *v6;
  __CFRunLoop *v7;
  const char *v8;
  id reserved;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = -[NSRunLoop getCFRunLoop](aRunLoop, "getCFRunLoop");
  if (v6)
  {
    v7 = v6;
    if (self)
    {
      CFNetServiceUnscheduleFromRunLoop((CFNetServiceRef)self->_netService, v6, (CFStringRef)mode);
      reserved = self->_reserved;
      self = reserved ? (NSNetService *)objc_getProperty(reserved, v8, 8, 1) : 0;
    }
    else
    {
      CFNetServiceUnscheduleFromRunLoop(0, v6, (CFStringRef)mode);
    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v10 = -[NSNetService countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(self);
          CFNetServiceMonitorUnscheduleFromRunLoop(*(CFNetServiceMonitorRef *)(*((_QWORD *)&v14 + 1) + 8 * i), v7, (CFStringRef)mode);
        }
        v11 = -[NSNetService countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }
  }
}

- (NSString)domain
{
  NSString *result;

  result = (NSString *)self->_netService;
  if (result)
    return (NSString *)CFNetServiceGetInfo((uint64_t)result, 0);
  return result;
}

- (NSString)type
{
  NSString *result;

  result = (NSString *)self->_netService;
  if (result)
    return (NSString *)CFNetServiceGetInfo((uint64_t)result, 4u);
  return result;
}

- (NSString)name
{
  NSString *result;

  result = (NSString *)self->_netService;
  if (result)
    return (NSString *)CFNetServiceGetInfo((uint64_t)result, 2u);
  return result;
}

- (NSString)hostName
{
  NSString *result;

  result = (NSString *)self->_netService;
  if (result)
    return (NSString *)CFNetServiceGetInfo((uint64_t)result, 5u);
  return result;
}

- (NSArray)addresses
{
  NSArray *result;
  void *Info;

  result = (NSArray *)self->_netService;
  if (result)
  {
    Info = (void *)CFNetServiceGetInfo((uint64_t)result, 3u);
    if (Info)
      return (NSArray *)(id)objc_msgSend(Info, "copy");
    else
      return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  }
  return result;
}

- (NSInteger)port
{
  int *netService;

  netService = (int *)self->_netService;
  if (netService)
    return netService[14];
  else
    return -1;
}

- (void)publishWithOptions:(NSNetServiceOptions)options
{
  id v5;
  _QWORD *reserved;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSInteger v10;
  const __CFBoolean *Info;
  uint64_t v12;
  CFNumberRef v13;
  unsigned int valuePtr;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void *v18;
  NSNetService *v19;
  char __str[8];
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void *v23;
  NSNetService *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((options & 2) != 0)
  {
    if (self)
    {
      v5 = -[NSArray firstObject](-[NSString componentsSeparatedByString:](-[NSString lowercaseString](-[NSNetService type](self, "type"), "lowercaseString"), "componentsSeparatedByString:", CFSTR(",")), "firstObject");
      if ((objc_msgSend((id)objc_msgSend(v5, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("."))), "hasSuffix:", CFSTR("_tcp")) & 1) != 0)
      {
        reserved = self->_reserved;
        if (!reserved || !reserved[2])
        {
          v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          v8 = dispatch_queue_create("com.apple.NSNetServices.tcplistener-queue", v7);
          v9 = tcp_listener_create();
          dispatch_release(v8);
          -[NSNetServicesInternal setListener:]((uint64_t)self->_reserved, v9);
          tcp_listener_release();
          v10 = -[NSNetService port](self, "port");
          if (v10)
          {
            snprintf(__str, 0x20uLL, "%d", v10);
            tcp_listener_set_port();
          }
          if (-[NSNetService includesPeerToPeer](self, "includesPeerToPeer")
            || (Info = (const __CFBoolean *)CFNetServiceGetInfo((uint64_t)self->_netService, 9u)) != 0
            && CFBooleanGetValue(Info))
          {
            tcp_listener_set_interface();
          }
          v12 = MEMORY[0x1E0C809B0];
          *(_QWORD *)__str = MEMORY[0x1E0C809B0];
          v21 = 3221225472;
          v22 = __34__NSNetService_publishWithServer___block_invoke;
          v23 = &unk_1E14FB7F0;
          v24 = self;
          tcp_listener_set_accept_handler();
          v15 = v12;
          v16 = 3221225472;
          v17 = __34__NSNetService_publishWithServer___block_invoke_3;
          v18 = &unk_1E14FB818;
          v19 = self;
          tcp_listener_set_error_handler();
          tcp_listener_start();
          valuePtr = __rev16(tcp_listener_get_port());
          v13 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
          _ServiceSetInfo((__CFNetService *)self->_netService, 8u, v13, 0);
          CFRelease(v13);
          -[NSNetService _internal_publishWithOptions:]((uint64_t)self, options);
        }
      }
      else if (-[NSNetService delegate](self, "delegate"))
      {
        -[NSNetService delegate](self, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(-[NSNetService delegate](self, "delegate"), "netService:didNotPublish:", self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", &unk_1E152A688, CFSTR("NSNetServicesErrorCode"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 10), CFSTR("NSNetServicesErrorDomain"), 0));
      }
    }
  }
  else
  {
    -[NSNetService _internal_publishWithOptions:]((uint64_t)self, options);
  }
}

- (void)publish
{
  -[NSNetService publishWithOptions:](self, "publishWithOptions:", -[NSString isEqual:](-[NSNetService name](self, "name"), "isEqual:", &stru_1E1500C68) ^ 1);
}

- (void)stop
{
  __CFNetService *netService;

  netService = (__CFNetService *)self->_netService;
  if (netService)
  {
    CFNetServiceSetClient(netService, 0, 0);
    CFNetServiceCancel((CFNetServiceRef)self->_netService);
  }
  -[NSNetServicesInternal setListener:]((uint64_t)self->_reserved, 0);
  if (-[NSNetService delegate](self, "delegate"))
  {
    -[NSNetService delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(-[NSNetService delegate](self, "delegate"), "netServiceDidStop:", self);
  }
}

- (void)dealloc
{
  __CFNetService *netService;
  objc_super v4;
  CFNetServiceClientContext clientContext;

  netService = (__CFNetService *)self->_netService;
  if (netService)
  {
    memset(&clientContext, 0, sizeof(clientContext));
    CFNetServiceSetClient(netService, 0, &clientContext);

  }
  objc_storeWeak(&self->_delegate, 0);

  v4.receiver = self;
  v4.super_class = (Class)NSNetService;
  -[NSNetService dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p> %@ %@ %@ %d"), objc_opt_class(), self, -[NSNetService domain](self, "domain"), -[NSNetService type](self, "type"), -[NSNetService name](self, "name"), -[NSNetService port](self, "port"));
}

- (unint64_t)hash
{
  return CFHash(self->_netService);
}

- (BOOL)isEqual:(id)a3
{
  const void *v5;

  objc_opt_self();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (a3)
    v5 = (const void *)*((_QWORD *)a3 + 1);
  else
    v5 = 0;
  return CFEqual(self->_netService, v5) != 0;
}

- (BOOL)getInputStream:(NSInputStream *)inputStream outputStream:(NSOutputStream *)outputStream
{
  id v7;
  __CFNetService *netService;

  v7 = -[NSNetService delegate](self, "delegate");
  if (self)
    netService = (__CFNetService *)self->_netService;
  else
    netService = 0;
  CFStreamCreatePairWithSocketToNetService((CFAllocatorRef)*MEMORY[0x1E0C9AE00], netService, (CFReadStreamRef *)inputStream, (CFWriteStreamRef *)outputStream);
  -[NSNetService setDelegate:](self, "setDelegate:", v7);

  return ((unint64_t)inputStream | (unint64_t)outputStream) != 0;
}

- (void)resolveWithTimeout:(NSTimeInterval)timeout
{
  int v5;
  id v6;
  void *v7;
  uint64_t v8;
  CFNetServiceClientContext clientContext;
  CFStreamError error;

  error.domain = 0;
  *(_QWORD *)&error.error = 0;
  if (self->_netService)
  {
    clientContext.version = 0;
    clientContext.info = -[_NSNetServiceWeakObject initWithObject:]([_NSNetServiceWeakObject alloc], self);
    clientContext.retain = (CFAllocatorRetainCallBack)MEMORY[0x1E0C98BD0];
    clientContext.release = (CFAllocatorReleaseCallBack)MEMORY[0x1E0C98BC0];
    clientContext.copyDescription = 0;
    CFNetServiceSetClient((CFNetServiceRef)self->_netService, (CFNetServiceClientCallBack)_netServiceDispatchCallbackForResolving, &clientContext);
    v5 = CFNetServiceResolveWithTimeout((CFNetServiceRef)self->_netService, timeout, &error);
    v6 = -[NSNetService delegate](self, "delegate");
    if (v5)
    {
      if (v6)
      {
        -[NSNetService delegate](self, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(-[NSNetService delegate](self, "delegate"), "netServiceWillResolve:", self);
      }
    }
    else if (v6)
    {
      -[NSNetService delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v7 = (void *)MEMORY[0x1E0C99D80];
        v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", error.error);
        objc_msgSend(-[NSNetService delegate](self, "delegate"), "netService:didNotResolve:", self, objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, CFSTR("NSNetServicesErrorCode"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", error.domain), CFSTR("NSNetServicesErrorDomain"), 0));
      }
    }
  }
}

- (void)resolve
{
  -[NSNetService resolveWithTimeout:](self, "resolveWithTimeout:", 10.0);
}

- (void)startMonitoring
{
  id reserved;
  id Property;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self && (reserved = self->_reserved) != 0)
    Property = objc_getProperty(reserved, a2, 8, 1);
  else
    Property = 0;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v4 = objc_msgSend(Property, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(Property);
        CFNetServiceMonitorStart(*(CFNetServiceMonitorRef *)(*((_QWORD *)&v8 + 1) + 8 * v7++), kCFNetServiceMonitorTXT, 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(Property, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)stopMonitoring
{
  id reserved;
  id Property;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self && (reserved = self->_reserved) != 0)
    Property = objc_getProperty(reserved, a2, 8, 1);
  else
    Property = 0;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v4 = objc_msgSend(Property, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(Property);
        CFNetServiceMonitorStop(*(CFNetServiceMonitorRef *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(Property, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (BOOL)setTXTRecordData:(NSData *)recordData
{
  if (self)
    self = (NSNetService *)self->_netService;
  return _ServiceSetInfo((__CFNetService *)self, 1u, recordData, 1) != 0;
}

- (NSData)TXTRecordData
{
  id v3;
  __CFNetService *netService;

  v3 = objc_alloc(MEMORY[0x1E0C99D50]);
  if (self)
    netService = (__CFNetService *)self->_netService;
  else
    netService = 0;
  return (NSData *)(id)objc_msgSend(v3, "initWithData:", CFNetServiceGetTXTData(netService));
}

- (uint64_t)_dispatchCallBackWithError:(uint64_t)a3
{
  void *v4;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  if (!result)
    return result;
  v4 = (void *)result;
  if ((_DWORD)a3)
  {
    if ((_DWORD)a3 == -72002)
    {
      result = objc_msgSend((id)result, "delegate");
LABEL_13:
      if (result)
      {
        objc_msgSend(v4, "delegate");
        result = objc_opt_respondsToSelector();
        if ((result & 1) != 0)
        {
          v7 = (void *)MEMORY[0x1E0C99D80];
          v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
          return objc_msgSend((id)objc_msgSend(v4, "delegate"), "netService:didNotResolve:", v4, objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, CFSTR("NSNetServicesErrorCode"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a2), CFSTR("NSNetServicesErrorDomain"), 0));
        }
      }
      return result;
    }
    if ((int)a3 == -72005)
    {
      result = objc_msgSend((id)result, "delegate");
      if (!result)
        return result;
LABEL_17:
      objc_msgSend(v4, "delegate");
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
        return objc_msgSend((id)objc_msgSend(v4, "delegate"), "netServiceDidStop:", v4);
      return result;
    }
    if ((int)a3 == -72007)
    {
      v6 = objc_msgSend((id)objc_msgSend((id)result, "addresses"), "count");
      result = objc_msgSend(v4, "delegate");
      if (v6)
      {
        if (!result)
          return result;
        goto LABEL_17;
      }
      goto LABEL_13;
    }
    result = objc_msgSend((id)result, "delegate");
    if (result)
    {
      objc_msgSend(v4, "delegate");
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
      {
        v9 = (void *)MEMORY[0x1E0C99D80];
        v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
        return objc_msgSend((id)objc_msgSend(v4, "delegate"), "netService:didNotPublish:", v4, objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, CFSTR("NSNetServicesErrorCode"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a2), CFSTR("NSNetServicesErrorDomain"), 0));
      }
    }
  }
  else
  {
    result = objc_msgSend((id)result, "delegate");
    if (result)
    {
      objc_msgSend(v4, "delegate");
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
        return objc_msgSend((id)objc_msgSend(v4, "delegate"), "netServiceDidResolveAddress:", v4);
    }
  }
  return result;
}

- (uint64_t)_internal_publishWithOptions:(uint64_t)result
{
  CFNetServiceRef *v3;
  int v4;
  void *v5;
  uint64_t v6;
  CFNetServiceClientContext clientContext;
  CFStreamError error;

  if (result)
  {
    v3 = (CFNetServiceRef *)result;
    if (objc_msgSend((id)result, "port") == -1)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: cannot publish an NSNetService created for resolution."), CFSTR("-[NSNetService _internal_publishWithOptions:"));
    error.domain = 0;
    *(_QWORD *)&error.error = 0;
    clientContext.version = 0;
    clientContext.info = -[_NSNetServiceWeakObject initWithObject:]([_NSNetServiceWeakObject alloc], v3);
    clientContext.retain = (CFAllocatorRetainCallBack)MEMORY[0x1E0C98BD0];
    clientContext.release = (CFAllocatorReleaseCallBack)MEMORY[0x1E0C98BC0];
    clientContext.copyDescription = 0;
    CFNetServiceSetClient(v3[1], (CFNetServiceClientCallBack)_netServiceDispatchCallbackForPublishing, &clientContext);
    v4 = CFNetServiceRegisterWithOptions(v3[1], a2, &error);
    result = -[CFNetServiceRef delegate](v3, "delegate");
    if (v4)
    {
      if (result)
      {
        -[CFNetServiceRef delegate](v3, "delegate");
        result = objc_opt_respondsToSelector();
        if ((result & 1) != 0)
          return objc_msgSend((id)-[CFNetServiceRef delegate](v3, "delegate"), "netServiceWillPublish:", v3);
      }
    }
    else if (result)
    {
      -[CFNetServiceRef delegate](v3, "delegate");
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
      {
        v5 = (void *)MEMORY[0x1E0C99D80];
        v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", error.error);
        return objc_msgSend((id)-[CFNetServiceRef delegate](v3, "delegate"), "netService:didNotPublish:", v3, objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, CFSTR("NSNetServicesErrorCode"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", error.domain), CFSTR("NSNetServicesErrorDomain"), 0));
      }
    }
  }
  return result;
}

void __34__NSNetService_publishWithServer___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t Instance;
  const char *v5;
  _QWORD *v6;
  SocketStream *v7;
  const char *v8;
  SocketStream *v9;
  uint64_t v10;
  CFTypeRef *v11;
  CFTypeRef v12;
  CFTypeRef v13;
  _QWORD block[9];
  uint64_t v15;
  uint64_t v16;

  if (objc_msgSend(*(id *)(a1 + 32), "delegate")
    && (objc_msgSend(*(id *)(a1 + 32), "delegate"), (objc_opt_respondsToSelector() & 1) != 0))
  {
    v15 = 0;
    v16 = 0;
    if (TCFObject<SocketStream>::Class(void)::sOnce != -1)
      dispatch_once(&TCFObject<SocketStream>::Class(void)::sOnce, &__block_literal_global_303);
    Instance = _CFRuntimeCreateInstance();
    if (Instance)
    {
      v6 = (_QWORD *)Instance;
      v7 = (SocketStream *)(Instance + 16);
      bzero((void *)(Instance + 16), 0x2B8uLL);
      SocketStream::SocketStream(v7, v8);
      SocketStream::commonInitialization(v9);
      tcp_connection_retain();
      v6[76] = a2;
      (*(void (**)(SocketStream *, uint64_t *, uint64_t *))(v6[2] + 64))(v7, &v16, &v15);
      CFRelease(v6);
    }
    else
    {
      SocketStream::SocketStream(0, v5);
    }
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(CFTypeRef **)(v10 + 24);
    if (v11)
    {
      objc_sync_enter(*(id *)(v10 + 24));
      v12 = CFRetain(v11[3]);
      v13 = CFRetain(v11[4]);
      objc_sync_exit(v11);
      v10 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v12 = 0;
      v13 = 0;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__NSNetService_publishWithServer___block_invoke_2;
    block[3] = &unk_1E14FB7C8;
    block[4] = v10;
    block[5] = v16;
    block[6] = v15;
    block[7] = v13;
    block[8] = v12;
    if (v12)
      dispatch_async(MEMORY[0x1E0C80D38], block);
    else
      __34__NSNetService_publishWithServer___block_invoke_2((uint64_t)block);
  }
  else
  {
    tcp_connection_cancel();
  }
}

uint64_t __34__NSNetService_publishWithServer___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "delegate");
  if (result)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "netService:didNotPublish:", *(_QWORD *)(a1 + 32), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2), CFSTR("NSNetServicesErrorCode"), &unk_1E152A6A0, CFSTR("NSNetServicesErrorDomain"), 0));
  }
  return result;
}

void __34__NSNetService_publishWithServer___block_invoke_2(uint64_t a1)
{
  const void *v2;
  const void *v3;

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "netService:didAcceptConnectionWithInputStream:outputStream:", *(_QWORD *)(a1 + 32), *(id *)(a1 + 40), *(id *)(a1 + 48));
  v2 = *(const void **)(a1 + 56);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 64);
  if (v3)
    CFRelease(v3);
}

- (CFRunLoopRef)_scheduleInDefaultRunLoopForMode:(uint64_t)a1
{
  CFRunLoopRef result;
  __CFRunLoop *v5;
  const char *v6;
  void *v7;
  id v8;
  CFRunLoopRef v9;
  uint64_t v10;
  __CFRunLoop *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  result = CFRunLoopGetCurrent();
  if (result)
  {
    v5 = result;
    -[NSNetServicesInternal setScheduledRunLoop:andMode:](*(_QWORD **)(a1 + 24), result, a2);
    CFNetServiceScheduleWithRunLoop(*(CFNetServiceRef *)(a1 + 8), v5, a2);
    v7 = *(void **)(a1 + 24);
    v8 = v7 ? objc_getProperty(v7, v6, 8, 1) : 0;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    result = (CFRunLoopRef)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (result)
    {
      v9 = result;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v8);
          CFNetServiceMonitorScheduleWithRunLoop(*(CFNetServiceMonitorRef *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), v5, a2);
          v11 = (__CFRunLoop *)((char *)v11 + 1);
        }
        while (v9 != v11);
        result = (CFRunLoopRef)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        v9 = result;
      }
      while (result);
    }
  }
  return result;
}

+ (NSDictionary)dictionaryFromTXTRecordData:(NSData *)txtData
{
  const __CFAllocator *v3;
  NSData *v4;

  if (txtData)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4 = txtData;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: cannot convert nil to a dictionary."), CFSTR("+[NSNetService dictionaryFromTXTRecordData:"));
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4 = 0;
  }
  return (NSDictionary *)CFNetServiceCreateDictionaryWithTXTData(v3, (CFDataRef)v4);
}

+ (NSData)dataFromTXTRecordDictionary:(NSDictionary *)txtDictionary
{
  const __CFAllocator *v3;
  NSDictionary *v4;

  if (txtDictionary)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4 = txtDictionary;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: cannot convert nil to a TXT record."), CFSTR("+[NSNetService dataFromTXTRecordDictionary:]"));
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4 = 0;
  }
  return (NSData *)CFNetServiceCreateTXTDataWithDictionary(v3, (CFDictionaryRef)v4);
}

@end
