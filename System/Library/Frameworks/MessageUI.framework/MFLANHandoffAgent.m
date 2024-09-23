@implementation MFLANHandoffAgent

- (MFLANHandoffAgent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFLANHandoffAgent;
  return -[MFLANHandoffAgent init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  _Block_release(self->_connectCallbackBlock);
  -[MFLANHandoffAgent stopServer](self, "stopServer");
  v3.receiver = self;
  v3.super_class = (Class)MFLANHandoffAgent;
  -[MFLANHandoffAgent dealloc](&v3, sel_dealloc);
}

- (id)_getDeviceHostname
{
  int v2;
  void *v3;
  ifaddrs *v4;
  ifaddrs *v5;
  sockaddr *ifa_addr;
  in_addr v7;
  ifaddrs *v9;

  v9 = 0;
  v2 = getifaddrs(&v9);
  v3 = 0;
  v4 = v9;
  if (!v2 && v9)
  {
    v5 = v9;
    while (1)
    {
      ifa_addr = v5->ifa_addr;
      if (ifa_addr->sa_family == 2 && !strcmp(v5->ifa_name, "en0"))
        break;
      v5 = v5->ifa_next;
      if (!v5)
      {
        v3 = 0;
        goto LABEL_9;
      }
    }
    v7.s_addr = *(_DWORD *)&ifa_addr->sa_data[2];
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", inet_ntoa(v7));
    v4 = v9;
  }
LABEL_9:
  MEMORY[0x1AF432DA4](v4);
  return v3;
}

- (void)_socketListenerRunLoop
{
  void *v3;
  __CFRunLoop *Current;

  v3 = (void *)MEMORY[0x1AF432E70](self, a2);
  if (!self->_serverRunLoopSource)
    self->_serverRunLoopSource = CFSocketCreateRunLoopSource(0, self->_socket, 0);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, self->_serverRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  CFRunLoopRun();
  self->_serverRunning = 0;
  -[MFLANHandoffAgent _cleanupRunLoopSource](self, "_cleanupRunLoopSource");
  objc_autoreleasePoolPop(v3);
}

- (void)_cleanupRunLoopSource
{
  __CFRunLoop *Current;

  if (self->_serverRunLoopSource)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, self->_serverRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
    CFRelease(self->_serverRunLoopSource);
    self->_serverRunLoopSource = 0;
  }
}

- (void)_cleanupSocket
{
  __CFSocket *socket;

  socket = self->_socket;
  if (socket)
  {
    CFSocketInvalidate(socket);
    CFRelease(self->_socket);
    self->_socket = 0;
  }
}

- (void)stopServer
{
  -[MFLANHandoffAgent _cleanupRunLoopSource](self, "_cleanupRunLoopSource");
  -[MFLANHandoffAgent _cleanupSocket](self, "_cleanupSocket");
  self->_serverRunning = 0;

  self->_handoffContext = 0;
}

- (id)startServerWithCompletion:(id)a3
{
  __CFSocket *v6;
  CFSocketNativeHandle Native;
  const __CFData *v8;
  CFSocketError v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  CFSocketNativeHandle v21;
  uint64_t v22;
  MFLANHandoffContext *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  socklen_t v33;
  int v34;
  CFSocketContext context;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  int v39;
  sockaddr v40;
  UInt8 bytes[8];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (self->_serverRunning)
    return self->_handoffContext;
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = self;
  v6 = CFSocketCreate(0, 2, 1, 6, 2uLL, (CFSocketCallBack)_serverSocketConnectCallback, &context);
  self->_socket = v6;
  if (!v6)
  {
    v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MFLANHandoffAgent startServerWithCompletion:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    return self->_handoffContext;
  }
  Native = CFSocketGetNative(v6);
  v34 = 1;
  setsockopt(Native, 0xFFFF, 4, &v34, 1u);
  v33 = 16;
  *(_QWORD *)bytes = 528;
  v42 = 0;
  v8 = CFDataCreate(0, bytes, 16);
  v9 = CFSocketSetAddress(self->_socket, v8);
  CFRelease(v8);
  if (v9)
  {
    v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MFLANHandoffAgent startServerWithCompletion:].cold.3(v9, v10);
    return self->_handoffContext;
  }
  v19 = -[MFLANHandoffAgent _getDeviceHostname](self, "_getDeviceHostname");
  if (v19)
  {
    v20 = v19;
    *(_QWORD *)&v40.sa_len = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v40.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
    v21 = CFSocketGetNative(self->_socket);
    getsockname(v21, &v40, &v33);
    v22 = bswap32(*(unsigned __int16 *)v40.sa_data) >> 16;
    v23 = objc_alloc_init(MFLANHandoffContext);
    self->_handoffContext = v23;
    -[MFLANHandoffContext setHost:](v23, "setHost:", v20);
    -[MFLANHandoffContext setPort:](self->_handoffContext, "setPort:", v22);
    v24 = MFLogGeneral();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v37 = v20;
      v38 = 1024;
      v39 = v22;
      _os_log_impl(&dword_1AB96A000, v24, OS_LOG_TYPE_INFO, "#Hand-Off [LAN] Successfully created server socket (%@:%d).", buf, 0x12u);
    }
    self->_connectCallbackBlock = _Block_copy(a3);
    objc_msgSend(MEMORY[0x1E0CB3978], "detachNewThreadSelector:toTarget:withObject:", sel__socketListenerRunLoop, self, 0);
    return self->_handoffContext;
  }
  v25 = MFLogGeneral();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    -[MFLANHandoffAgent startServerWithCompletion:].cold.2(v25, v26, v27, v28, v29, v30, v31, v32);
  return 0;
}

- (void)connectToServerWithContext:(id)a3 completion:(id)a4
{
  const __CFString *v6;
  UInt32 v7;
  int v8;
  NSObject *v9;
  unint64_t v10;
  CFReadStreamRef readStream;

  v6 = (const __CFString *)objc_msgSend(a3, "host");
  v7 = objc_msgSend(a3, "port");
  if (v6)
  {
    v8 = v7;
    if (v7)
    {
      v10 = 0xAAAAAAAAAAAAAAAALL;
      readStream = (CFReadStreamRef)0xAAAAAAAAAAAAAAAALL;
      CFStreamCreatePairWithSocketToHost((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6, v7, &readStream, (CFWriteStreamRef *)&v10);
      if (readStream && v10)
      {
        (*((void (**)(id))a4 + 2))(a4);
      }
      else
      {
        v9 = MFLogGeneral();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[MFLANHandoffAgent connectToServerWithContext:completion:].cold.1((uint64_t)v6, v8, v9);
      }
    }
  }
}

- (BOOL)serverRunning
{
  return self->_serverRunning;
}

- (MFLANHandoffContext)handoffContext
{
  return self->_handoffContext;
}

- (void)startServerWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AB96A000, a1, a3, "#Hand-Off [LAN] Failed to create server socket.", a5, a6, a7, a8, 0);
}

- (void)startServerWithCompletion:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AB96A000, a1, a3, "#Hand-Off [LAN] LAN handoff only works over WiFi/ethernet", a5, a6, a7, a8, 0);
}

- (void)startServerWithCompletion:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1AB96A000, a2, OS_LOG_TYPE_ERROR, "#Hand-Off [LAN] Failed to bind server socket [%ld]", (uint8_t *)&v2, 0xCu);
}

- (void)connectToServerWithContext:(os_log_t)log completion:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_1AB96A000, log, OS_LOG_TYPE_ERROR, "#Hand-Off [LAN] Error creating read/write streams for host: %@:%d", (uint8_t *)&v3, 0x12u);
}

@end
