@implementation LoopbackSocketTunnel

- (LoopbackSocketTunnel)initWithPort:(unsigned __int16)a3 delegate:(id)a4 error:(id *)a5
{
  unsigned int v7;
  LoopbackSocketTunnel *v8;
  LoopbackSocketTunnel *v9;
  int v10;
  void *v12;
  void *v13;
  CFDictionaryRef v14;
  int v15;
  LoopbackSocketTunnel *v16;
  objc_super v18;
  void *values[2];
  void *keys[3];

  v7 = a3;
  keys[2] = *(void **)MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)LoopbackSocketTunnel;
  v8 = -[LoopbackSocketTunnel init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_port = v7;
    v10 = socket(2, 2, 17);
    *(_QWORD *)&v9->sa.sin_len = 0;
    v9->sockFD = v10;
    v9->foundVTPIP = 0;
    *(_QWORD *)v9->sa.sin_zero = 0;
    *(_WORD *)&v9->sa.sin_len = 528;
    inet_aton("127.0.0.1", &v9->sa.sin_addr);
    if (v7 > 0xFDE7)
    {
      if (v7 != 65000)
      {
        v16 = v9;
        return 0;
      }
    }
    else
    {
      do
      {
        v9->sa.sin_port = bswap32(v7) >> 16;
        if (!bind(v9->sockFD, (const sockaddr *)&v9->sa, 0x10u))
          break;
      }
      while ((unsigned __int16)v7++ < 0xFDE7u);
    }
    v9->_delegate = (LoopbackSocketTunnelDelegate *)a4;
    v12 = (void *)*MEMORY[0x1E0CA52D0];
    keys[0] = *(void **)MEMORY[0x1E0CA52C8];
    keys[1] = v12;
    v13 = (void *)*MEMORY[0x1E0C9AE40];
    values[0] = CFSTR("com.apple.AVConference.LoopbackSocketTunnel.ReceiveProc");
    values[1] = v13;
    v14 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)values, 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v15 = FigThreadCreate();
    if (v14)
      CFRelease(v14);
    if (v15)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[LoopbackSocketTunnel initWithPort:delegate:error:].cold.1();
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[LoopbackSocketTunnel initWithPort:delegate:error:].cold.2();
        }
      }
      +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a5, 32002, 1, v15, 0, CFSTR("LoopbackSocketTunnel init failed"), CFSTR("FigThreadCreate failed"));
      close(v9->sockFD);

      return 0;
    }
  }
  return v9;
}

- (int)sendPacketToVTP:(id)a3
{
  int v3;

  if (!self->foundVTPIP)
    return -1;
  v3 = sendto(self->sockFD, (const void *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 0, (const sockaddr *)&self->vtpSA, 0x10u);
  kdebug_trace();
  return v3;
}

- (void)getIPPort:(tagIPPORT *)a3
{
  SAToIPPORT();
}

- (void)getVTPIPPort:(tagIPPORT *)a3
{
  SAToIPPORT();
}

- (void)setVTPIP:(tagIPPORT *)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t buf[4];
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&self->vtpSA.sin_len = 0;
  *(_QWORD *)self->vtpSA.sin_zero = 0;
  self->foundVTPIP = 1;
  IPPORTToSA();
  IPPORTToStringWithSize();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v6 = v3;
      v7 = 2080;
      v8 = "-[LoopbackSocketTunnel setVTPIP:]";
      v9 = 1024;
      v10 = 117;
      v11 = 2080;
      v12 = &setVTPIP__ip;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d vtpIP = %s", buf, 0x26u);
    }
  }
}

- (void)shutdownSocket
{
  close(self->sockFD);
}

- (int)serverLoopProc
{
  id v3;
  __int128 v4;
  void *i;
  int v6;
  socklen_t v8;
  _QWORD v9[8];

  v9[7] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  memset(&v9[4], 170, 24);
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)v9 = v4;
  *(_OWORD *)&v9[2] = v4;
  for (i = malloc_type_malloc(0x5DCuLL, 0xDB2A6191uLL);
        ;
        -[LoopbackSocketTunnelDelegate loopbackSocketTunnel:receivedData:from:](self->_delegate, "loopbackSocketTunnel:receivedData:from:", self, objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", i, v6, 0), v9))
  {
    v8 = 16;
    v6 = recvfrom(self->sockFD, i, 0x5DCuLL, 0, (sockaddr *)&v9[5], &v8);
    SAToIPPORT();
    kdebug_trace();
    if (v6 < 1)
      break;
  }
  free(i);

  return 0;
}

- (NSObject)optionalArg
{
  return self->optionalArg;
}

- (void)setOptionalArg:(id)a3
{
  self->optionalArg = a3;
}

- (void)initWithPort:delegate:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d FigThreadCreate(LoopbackTunnelReceiveProc) failed %d", v1, 0x22u);
}

- (void)initWithPort:delegate:error:.cold.2()
{
  os_log_t v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2();
  _os_log_fault_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d FigThreadCreate(LoopbackTunnelReceiveProc) failed %d", v1, 0x22u);
}

@end
