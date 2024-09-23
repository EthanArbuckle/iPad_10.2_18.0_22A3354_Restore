@implementation VCCannedVideoPacketSource

- (VCCannedVideoPacketSource)initWithMode:(unsigned __int8)a3 filePath:(id)a4
{
  uint64_t v5;
  VCCannedVideoPacketSource *v6;
  uint64_t v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSObject *CustomRootQueue;
  dispatch_queue_t v11;
  const __CFAllocator *v12;
  objc_super v14;
  uint64_t v15;

  v5 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)VCCannedVideoPacketSource;
  v6 = -[VCCannedVideoPacketSource init](&v14, sel_init);
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCannedVideoPacketSource initWithMode:filePath:].cold.1();
    }
    goto LABEL_35;
  }
  v7 = objc_msgSend(a4, "copy");
  v6->_filePath = (NSString *)v7;
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCannedVideoPacketSource initWithMode:filePath:].cold.2();
    }
    goto LABEL_35;
  }
  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6->_rtpCallbacks = v8;
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCannedVideoPacketSource initWithMode:filePath:].cold.3();
    }
    goto LABEL_35;
  }
  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6->_rtcpCallbacks = v9;
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCannedVideoPacketSource initWithMode:filePath:].cold.4();
    }
    goto LABEL_35;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(58);
  v11 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCCannedVideoPacketSource.writequeue", 0, CustomRootQueue);
  v6->_writeQueue = (OS_dispatch_queue *)v11;
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCannedVideoPacketSource initWithMode:filePath:].cold.5();
    }
    goto LABEL_35;
  }
  v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (VCAllocatorFirstCome_Create((const __CFAllocator *)*MEMORY[0x1E0C9AE00], (uint64_t)"com.apple.AVConference.VCCannedVideoPacketSource.CannedVideoPacketBlockBufferHeaderAllocator", &v6->_blockBufferHeaderAllocator))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCannedVideoPacketSource initWithMode:filePath:].cold.8();
    }
    goto LABEL_35;
  }
  if (VCAllocatorFirstCome_Create(v12, (uint64_t)"com.apple.AVConference.VCCannedVideoPacketSource.CannedRTCPPacketAllocator", &v6->_rtcpPacketAllocator))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCannedVideoPacketSource initWithMode:filePath:].cold.7();
    }
    goto LABEL_35;
  }
  if (!-[VCCannedVideoPacketSource setUpSourceFileWithMode:](v6, "setUpSourceFileWithMode:", v5))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCannedVideoPacketSource initWithMode:filePath:].cold.6();
    }
LABEL_35:

    return 0;
  }
  pthread_mutex_init(&v6->_replayMutex, 0);
  pthread_cond_init(&v6->_replayCondition, 0);
  v6->_stateLock._os_unfair_lock_opaque = 0;
  return v6;
}

- (BOOL)setUpSourceFileWithMode:(unsigned __int8)a3
{
  NSFileHandle *v4;
  _BOOL4 v5;
  NSFileHandle *v6;

  self->_mode = a3;
  if (a3 == 2)
  {
    if (!+[VCCannedVideoPacketSource overwriteFileAtPath:](VCCannedVideoPacketSource, "overwriteFileAtPath:", self->_filePath))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v5)
          return v5;
        -[VCCannedVideoPacketSource setUpSourceFileWithMode:].cold.4();
      }
      goto LABEL_21;
    }
    v6 = (NSFileHandle *)(id)objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", self->_filePath);
    self->_fileHandle = v6;
    if (!v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v5)
          return v5;
        -[VCCannedVideoPacketSource setUpSourceFileWithMode:].cold.3();
      }
      goto LABEL_21;
    }
LABEL_10:
    LOBYTE(v5) = 1;
    return v5;
  }
  if (a3 != 1)
    goto LABEL_10;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", self->_filePath) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v5)
        return v5;
      -[VCCannedVideoPacketSource setUpSourceFileWithMode:].cold.2();
    }
    goto LABEL_21;
  }
  v4 = (NSFileHandle *)(id)objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingAtPath:", self->_filePath);
  self->_fileHandle = v4;
  if (v4)
    goto LABEL_10;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v5)
      return v5;
    -[VCCannedVideoPacketSource setUpSourceFileWithMode:].cold.1();
  }
LABEL_21:
  LOBYTE(v5) = 0;
  return v5;
}

- (void)dealloc
{
  NSObject *writeQueue;
  __CFAllocator *blockBufferHeaderAllocator;
  __CFAllocator *rtcpPacketAllocator;
  NSObject *v6;
  objc_super v7;
  _QWORD block[6];

  block[5] = *MEMORY[0x1E0C80C00];
  -[VCCannedVideoPacketSource stopCannedInjection](self, "stopCannedInjection");
  writeQueue = self->_writeQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__VCCannedVideoPacketSource_dealloc__block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = self;
  dispatch_sync(writeQueue, block);

  blockBufferHeaderAllocator = self->_blockBufferHeaderAllocator;
  if (blockBufferHeaderAllocator)
    CFRelease(blockBufferHeaderAllocator);
  rtcpPacketAllocator = self->_rtcpPacketAllocator;
  if (rtcpPacketAllocator)
    CFRelease(rtcpPacketAllocator);
  v6 = self->_writeQueue;
  if (v6)
  {
    dispatch_release(v6);
    self->_writeQueue = 0;
  }
  pthread_mutex_destroy(&self->_replayMutex);
  pthread_cond_destroy(&self->_replayCondition);
  v7.receiver = self;
  v7.super_class = (Class)VCCannedVideoPacketSource;
  -[VCCannedVideoPacketSource dealloc](&v7, sel_dealloc);
}

uint64_t __36__VCCannedVideoPacketSource_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "closeFile");
}

- (int)startCannedInjection
{
  os_unfair_lock_s *p_stateLock;
  int v4;
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  void *values[2];

  values[1] = *(void **)MEMORY[0x1E0C80C00];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_mode != 1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCannedVideoPacketSource startCannedInjection].cold.3();
    }
    v4 = 4;
    goto LABEL_6;
  }
  if (self->_cannedReplayThread)
  {
    v4 = 0;
LABEL_6:
    os_unfair_lock_unlock(p_stateLock);
    return v4;
  }
  self->_cannedReplayThreadCanceled = 0;
  values[0] = CFSTR("com.apple.AVConference.VCCannedVideoPacketSource.CannedVideoPacketInjectionThread");
  v5 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], MEMORY[0x1E0CA52C8], (const void **)values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (v5)
  {
    v6 = v5;
    v4 = FigThreadCreate();
    CFRelease(v6);
    if (!v4)
      goto LABEL_6;
    v4 |= 0xA01D0000;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCannedVideoPacketSource startCannedInjection].cold.2();
    }
    os_unfair_lock_unlock(p_stateLock);
    -[VCCannedVideoPacketSource stopCannedInjection](self, "stopCannedInjection");
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCannedVideoPacketSource startCannedInjection].cold.1();
    }
    os_unfair_lock_unlock(p_stateLock);
    return 4;
  }
  return v4;
}

- (int)stopCannedInjection
{
  os_unfair_lock_s *p_stateLock;
  uint64_t v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  pthread_mutex_lock(&self->_replayMutex);
  self->_cannedReplayThreadCanceled = 1;
  pthread_cond_signal(&self->_replayCondition);
  pthread_mutex_unlock(&self->_replayMutex);
  if (self->_cannedReplayThread)
  {
    FigThreadJoin();
    self->_cannedReplayThread = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315650;
        v8 = v4;
        v9 = 2080;
        v10 = "-[VCCannedVideoPacketSource stopCannedInjection]";
        v11 = 1024;
        v12 = 204;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Canned video packet injection thread stopped", (uint8_t *)&v7, 0x1Cu);
      }
    }
  }
  os_unfair_lock_unlock(p_stateLock);
  return 0;
}

+ (BOOL)createFileAtPath:(id)a3
{
  void *v4;
  uint64_t v5;
  BOOL v6;
  int ErrorLogLevelForModule;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  if ((objc_msgSend(v4, "fileExistsAtPath:", a3) & 1) != 0)
    return 1;
  v11 = 0;
  v5 = objc_msgSend(a3, "stringByDeletingLastPathComponent");
  if (objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v11))v6 = v11 == 0;
  else
    v6 = 0;
  if (v6)
  {
    if ((objc_msgSend(v4, "createFileAtPath:contents:attributes:", a3, 0, 0) & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          +[VCCannedVideoPacketSource createFileAtPath:].cold.1();
      }
      return 0;
    }
    return 1;
  }
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (ErrorLogLevelForModule >= 3)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v13 = v9;
      v14 = 2080;
      v15 = "+[VCCannedVideoPacketSource createFileAtPath:]";
      v16 = 1024;
      v17 = 262;
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v11;
      _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create directory=%@ error=%@", buf, 0x30u);
    }
  }
  return 0;
}

+ (BOOL)removeFileAtPath:(id)a3
{
  void *v4;
  int ErrorLogLevelForModule;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  if (!objc_msgSend(v4, "fileExistsAtPath:", a3))
    return 1;
  v10 = 0;
  if (objc_msgSend(v4, "removeItemAtPath:error:", a3, &v10) && v10 == 0)
    return 1;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (ErrorLogLevelForModule >= 3)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v12 = v8;
      v13 = 2080;
      v14 = "+[VCCannedVideoPacketSource removeFileAtPath:]";
      v15 = 1024;
      v16 = 278;
      v17 = 2112;
      v18 = a3;
      v19 = 2112;
      v20 = v10;
      _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to remove file at path=%@ error=%@", buf, 0x30u);
    }
  }
  return 0;
}

+ (BOOL)overwriteFileAtPath:(id)a3
{
  _BOOL4 v4;

  v4 = +[VCCannedVideoPacketSource removeFileAtPath:](VCCannedVideoPacketSource, "removeFileAtPath:");
  if (v4)
    LOBYTE(v4) = +[VCCannedVideoPacketSource createFileAtPath:](VCCannedVideoPacketSource, "createFileAtPath:", a3);
  return v4;
}

uint64_t ___VCCannedVideoPacketSource_RegisterCannedReplayWriteCallbacks_block_invoke(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v5;
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v5 + 8) == 2)
    {
      v7 = 1;
      _VCCannedVideoPacketSource_WriteBytes(v5, (uint64_t)&v7, 1);
      _VCCannedVideoPacketSource_WriteBytes(v5, (uint64_t)a3, 6064);
      if (!*a3)
      {
        _VCCannedVideoPacketSource_WriteBlockBuffer(v5, (uint64_t)(a3 + 32));
        _VCCannedVideoPacketSource_WriteBlockBuffer(v5, (uint64_t)(a3 + 38));
        _VCCannedVideoPacketSource_WriteBlockBuffer(v5, (uint64_t)(a3 + 44));
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        ___VCCannedVideoPacketSource_RegisterCannedReplayWriteCallbacks_block_invoke_cold_2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      ___VCCannedVideoPacketSource_RegisterCannedReplayWriteCallbacks_block_invoke_cold_1();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t ___VCCannedVideoPacketSource_RegisterCannedReplayWriteCallbacks_block_invoke_48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  OpaqueCMBlockBuffer *v7;
  OpaqueCMBlockBuffer *v9;
  size_t v10;
  char *v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v5 + 8) == 2)
    {
      v12 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8);
      _VCCannedVideoPacketSource_WriteBytes(v5, (uint64_t)&v12, 1);
      _VCCannedVideoPacketSource_WriteBytes(v5, a3, 1640);
      if (*(_BYTE *)(a3 + 8))
      {
        v6 = 0;
        do
          _VCCannedVideoPacketSource_WriteBytes(v5, *(_QWORD *)(a3 + 16 + 8 * v6++), 1036);
        while (v6 < *(unsigned __int8 *)(a3 + 8));
      }
      v7 = *(OpaqueCMBlockBuffer **)(a3 + 96);
      v10 = 0;
      v11 = 0;
      v9 = v7;
      CMBlockBufferGetDataPointer(v7, 0, 0, &v10, &v11);
      _VCCannedVideoPacketSource_WriteBlockBuffer(v5, (uint64_t)&v9);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        ___VCCannedVideoPacketSource_RegisterCannedReplayWriteCallbacks_block_invoke_48_cold_2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      ___VCCannedVideoPacketSource_RegisterCannedReplayWriteCallbacks_block_invoke_48_cold_1();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void ___VCCannedVideoPacketSource_WriteBytes_block_invoke(uint64_t a1)
{
  BOOL v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "writeData:error:", *(_QWORD *)(a1 + 40), v3))
    v2 = v3[0] == 0;
  else
    v2 = 0;
  if (!v2 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      ___VCCannedVideoPacketSource_WriteBytes_block_invoke_cold_1();
  }

}

uint64_t ___VCCannedVideoPacketSource_RegisterRTPCallback_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

uint64_t ___VCCannedVideoPacketSource_RegisterRTCPCallback_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

- (void)initWithMode:filePath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize self", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithMode:filePath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Received nil file path", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithMode:filePath:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create RTP callback map", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithMode:filePath:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create RTCP callback map", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithMode:filePath:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create write queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithMode:filePath:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to set up source file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithMode:filePath:.cold.7()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCannedVideoPacketSource initWithMode:filePath:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create RTCP packet allocator. Err=%d", v2, *(const char **)v3, (unint64_t)"-[VCCannedVideoPacketSource initWithMode:filePath:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)initWithMode:filePath:.cold.8()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCannedVideoPacketSource initWithMode:filePath:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create block buffer allocator. Err=%d", v2, *(const char **)v3, (unint64_t)"-[VCCannedVideoPacketSource initWithMode:filePath:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setUpSourceFileWithMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate file handle for reading", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setUpSourceFileWithMode:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d File does not exist at path=%@");
  OUTLINED_FUNCTION_3();
}

- (void)setUpSourceFileWithMode:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate file handle for writing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setUpSourceFileWithMode:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create file for writing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startCannedInjection
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_15_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Attempting to start canned injection while in mode=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

+ (void)createFileAtPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create file at path=%@");
  OUTLINED_FUNCTION_3();
}

void ___VCCannedVideoPacketSource_RegisterCannedReplayWriteCallbacks_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Attempting to write NULL packet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void ___VCCannedVideoPacketSource_RegisterCannedReplayWriteCallbacks_block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_15_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Attempting to write canned video packet while in mode=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void ___VCCannedVideoPacketSource_RegisterCannedReplayWriteCallbacks_block_invoke_48_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Attempting to write NULL packet list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void ___VCCannedVideoPacketSource_RegisterCannedReplayWriteCallbacks_block_invoke_48_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_15_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Attempting to write canned video packet while in mode=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void ___VCCannedVideoPacketSource_WriteBytes_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to write data. error=%@");
  OUTLINED_FUNCTION_3();
}

@end
