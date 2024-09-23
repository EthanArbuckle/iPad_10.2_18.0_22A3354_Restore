@implementation VCVirtualAVCaptureConnection

- (VCVirtualAVCaptureConnection)initWithInputPorts:(id)a3 output:(id)a4
{
  AVCaptureOutput *v7;
  NSArray *v8;
  VCVirtualAVCaptureConnection *result;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = (AVCaptureOutput *)a4;
  self->_output = v7;
  if (v7)
  {
    v8 = (NSArray *)objc_msgSend(a3, "copy");
    self->_ports = v8;
    if (v8)
    {
      self->_stateLock._os_unfair_lock_opaque = 0;
      v10.receiver = self;
      v10.super_class = (Class)VCVirtualAVCaptureConnection;
      result = -[AVCaptureConnection initWithInputPorts:output:](&v10, sel_initWithInputPorts_output_, a3, a4);
      if (result)
      {
        result->_videoRetainedBufferCountHintSupported = 1;
        result->_active = 1;
        return result;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVirtualAVCaptureConnection initWithInputPorts:output:].cold.3();
      }
      self = 0;
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureConnection initWithInputPorts:output:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVirtualAVCaptureConnection initWithInputPorts:output:].cold.1();
  }

  return 0;
}

- (void)invalidate
{
  os_unfair_lock_s *p_stateLock;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  self->_active = 0;

  self->_output = 0;
  self->_ports = 0;
  os_unfair_lock_unlock(p_stateLock);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCVirtualAVCaptureConnection invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)VCVirtualAVCaptureConnection;
  -[AVCaptureConnection dealloc](&v3, sel_dealloc);
}

- (id)inputPorts
{
  os_unfair_lock_s *p_stateLock;
  NSArray *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = self->_ports;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (id)output
{
  os_unfair_lock_s *p_stateLock;
  AVCaptureOutput *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = self->_output;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (BOOL)active
{
  VCVirtualAVCaptureConnection *v2;
  os_unfair_lock_s *p_stateLock;

  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LOBYTE(v2) = v2->_active;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (BOOL)isVideoRetainedBufferCountHintSupported
{
  return self->_videoRetainedBufferCountHintSupported;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void)setVideoRetainedBufferCountHintSupported:(BOOL)a3
{
  self->_videoRetainedBufferCountHintSupported = a3;
}

- (int)videoRetainedBufferCountHint
{
  return self->_videoRetainedBufferCountHint;
}

- (void)setVideoRetainedBufferCountHint:(int)a3
{
  self->_videoRetainedBufferCountHint = a3;
}

- (void)initWithInputPorts:output:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Received nil capture output", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithInputPorts:output:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Received nil input port", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithInputPorts:output:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to init superclass", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
