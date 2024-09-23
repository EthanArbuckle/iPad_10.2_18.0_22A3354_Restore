@implementation VCVirtualAVCaptureDeviceInput

- (VCVirtualAVCaptureDeviceInput)initWithDevice:(id)a3 error:(id *)a4
{
  VCVirtualAVCaptureInputPort *v6;
  uint64_t v7;
  void *v8;
  VCVirtualAVCaptureDevice *v9;

  v6 = [VCVirtualAVCaptureInputPort alloc];
  v7 = -[VCVirtualAVCaptureInputPort initWithDevice:mediaType:](v6, "initWithDevice:mediaType:", self, *MEMORY[0x1E0C8A808]);
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureDeviceInput initWithDevice:error:].cold.1();
    }
    goto LABEL_15;
  }
  v8 = (void *)v7;
  self->_ports = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v7, 0);

  if (!self->_ports)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureDeviceInput initWithDevice:error:].cold.2();
    }
    goto LABEL_15;
  }
  v9 = (VCVirtualAVCaptureDevice *)a3;
  self->_device = v9;
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureDeviceInput initWithDevice:error:].cold.3();
    }
LABEL_15:

    return 0;
  }
  -[VCVirtualAVCaptureDevice addDeviceInput:](v9, "addDeviceInput:", self);
  self->_stateLock._os_unfair_lock_opaque = 0;
  return self;
}

- (void)disconnect
{
  os_unfair_lock_s *p_stateLock;
  NSArray *ports;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  ports = self->_ports;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](ports, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(ports);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "disconnect");
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](ports, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v6);
  }
  -[VCVirtualAVCaptureDevice removeDeviceInput:](self->_device, "removeDeviceInput:", self);

  self->_device = 0;
  os_unfair_lock_unlock(p_stateLock);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCVirtualAVCaptureDeviceInput disconnect](self, "disconnect");

  v3.receiver = self;
  v3.super_class = (Class)VCVirtualAVCaptureDeviceInput;
  -[AVCaptureDeviceInput dealloc](&v3, sel_dealloc);
}

- (id)ports
{
  os_unfair_lock_s *p_stateLock;
  NSArray *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = self->_ports;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (id)device
{
  return self->_device;
}

- (void)initWithDevice:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate input port", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDevice:error:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate ports array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDevice:error:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Received nil device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
