@implementation VCVirtualAVCaptureInputPort

- (VCVirtualAVCaptureInputPort)initWithDevice:(id)a3 mediaType:(id)a4
{
  NSString *v6;
  VCWeakObjectHolder *v7;
  OpaqueCMClock *HostTimeClock;
  NSMutableArray *v9;

  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureInputPort initWithDevice:mediaType:].cold.1();
    }
    goto LABEL_23;
  }
  v6 = (NSString *)objc_msgSend(a4, "copy");
  self->_mediaType = v6;
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureInputPort initWithDevice:mediaType:].cold.2();
    }
    goto LABEL_23;
  }
  v7 = (VCWeakObjectHolder *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF26A0]), "initWithObject:", a3);
  self->_input = v7;
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureInputPort initWithDevice:mediaType:].cold.3();
    }
    goto LABEL_23;
  }
  HostTimeClock = CMClockGetHostTimeClock();
  self->_clock = HostTimeClock;
  if (!HostTimeClock)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureInputPort initWithDevice:mediaType:].cold.4();
    }
    goto LABEL_23;
  }
  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_connections = v9;
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureInputPort initWithDevice:mediaType:].cold.5();
    }
LABEL_23:

    return 0;
  }
  self->_stateLock._os_unfair_lock_opaque = 0;
  return self;
}

- (void)disconnect
{
  os_unfair_lock_s *p_stateLock;
  NSMutableArray *connections;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  connections = self->_connections;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(connections);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v9, "invalidate");
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connections, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
  -[NSMutableArray removeAllObjects](self->_connections, "removeAllObjects");
  os_unfair_lock_unlock(p_stateLock);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCVirtualAVCaptureInputPort disconnect](self, "disconnect");

  v3.receiver = self;
  v3.super_class = (Class)VCVirtualAVCaptureInputPort;
  -[AVCaptureInputPort dealloc](&v3, sel_dealloc);
}

- (void)addConnection:(id)a3
{
  os_unfair_lock_s *p_stateLock;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[NSMutableArray addObject:](self->_connections, "addObject:", a3);
  os_unfair_lock_unlock(p_stateLock);
}

- (id)connections
{
  os_unfair_lock_s *p_stateLock;
  NSMutableArray *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = self->_connections;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (AVCaptureInput)input
{
  os_unfair_lock_s *p_stateLock;
  AVCaptureInput *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = (AVCaptureInput *)-[VCWeakObjectHolder strong](self->_input, "strong");
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (void)setInput:(id)a3
{
  os_unfair_lock_s *p_stateLock;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);

  self->_input = (VCWeakObjectHolder *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF26A0]), "initWithObject:", a3);
  os_unfair_lock_unlock(p_stateLock);
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[NSString isEqual:](self->_mediaType, "isEqual:", *((_QWORD *)a3 + 3));
    if (v5)
      LOBYTE(v5) = self->_input == (VCWeakObjectHolder *)*((_QWORD *)a3 + 2);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OpaqueCMClock)clock
{
  return self->_clock;
}

- (void)setClock:(OpaqueCMClock *)a3
{
  self->_clock = a3;
}

- (void)initWithDevice:mediaType:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Received nil inputDevice", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDevice:mediaType:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Received nil media type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDevice:mediaType:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate weak input device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDevice:mediaType:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to get host time clock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDevice:mediaType:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate connections array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
