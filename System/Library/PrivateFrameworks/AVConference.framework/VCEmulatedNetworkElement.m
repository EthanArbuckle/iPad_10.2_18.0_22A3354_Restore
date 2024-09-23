@implementation VCEmulatedNetworkElement

- (VCEmulatedNetworkElement)initWithPolicies:(id)a3
{
  VCEmulatedNetworkElement *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)VCEmulatedNetworkElement;
  v4 = -[VCEmulatedNetworkElement init](&v6, sel_init);
  if (v4)
  {
    if (CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 4096, &v4->_networkElementQueue))
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCEmulatedNetworkElement initWithPolicies:].cold.1();
      }
      return 0;
    }
    else
    {
      v4->_policies = (NSDictionary *)a3;
    }
  }
  return v4;
}

- (void)dealloc
{
  opaqueCMSimpleQueue *networkElementQueue;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  -[VCEmulatedNetworkElement setProcessCompleteHandler:](self, "setProcessCompleteHandler:", 0);

  -[VCEmulatedNetworkElement drainAndReleasePackets](self, "drainAndReleasePackets");
  networkElementQueue = self->_networkElementQueue;
  if (networkElementQueue)
    CFRelease(networkElementQueue);
  v4.receiver = self;
  v4.super_class = (Class)VCEmulatedNetworkElement;
  -[VCEmulatedNetworkElement dealloc](&v4, sel_dealloc);
}

- (void)drainAndReleasePackets
{
  opaqueCMSimpleQueue *networkElementQueue;

  networkElementQueue = self->_networkElementQueue;
  if (networkElementQueue && CMSimpleQueueGetCount(networkElementQueue) >= 1)
  {
    do

    while (CMSimpleQueueGetCount(self->_networkElementQueue) > 0);
  }
}

- (int)write:(id)a3
{
  int result;

  result = CMSimpleQueueEnqueue(self->_networkElementQueue, a3);
  if (result)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCEmulatedNetworkElement write:].cold.1();
    }

    return -1;
  }
  return result;
}

- (void)runUntilTime:(double)a3
{
  void *v4;
  void (**processCompleteHandler)(id, void *);

  if (CMSimpleQueueGetCount(self->_networkElementQueue) >= 1)
  {
    do
    {
      v4 = (void *)CMSimpleQueueDequeue(self->_networkElementQueue);
      processCompleteHandler = (void (**)(id, void *))self->_processCompleteHandler;
      if (processCompleteHandler)
        processCompleteHandler[2](processCompleteHandler, v4);

    }
    while (CMSimpleQueueGetCount(self->_networkElementQueue) > 0);
  }
}

- (void)connectTo:(id)a3
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  if (a3 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCEmulatedNetworkElement connectTo:].cold.1();
    }
  }
  else
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __38__VCEmulatedNetworkElement_connectTo___block_invoke;
    v3[3] = &unk_1E9E54460;
    v3[4] = a3;
    -[VCEmulatedNetworkElement setProcessCompleteHandler:](self, "setProcessCompleteHandler:", v3);
  }
}

uint64_t __38__VCEmulatedNetworkElement_connectTo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "write:", a2);
}

- (void)connectFrom:(id)a3
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  if (a3 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCEmulatedNetworkElement connectFrom:].cold.1();
    }
  }
  else
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __40__VCEmulatedNetworkElement_connectFrom___block_invoke;
    v3[3] = &unk_1E9E54460;
    v3[4] = self;
    objc_msgSend(a3, "setProcessCompleteHandler:", v3);
  }
}

uint64_t __40__VCEmulatedNetworkElement_connectFrom___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "write:", a2);
}

- (id)processCompleteHandler
{
  return self->_processCompleteHandler;
}

- (void)setProcessCompleteHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)initWithPolicies:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Cannot create network element queue successfully!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)write:.cold.1()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "-[VCEmulatedNetworkElement write:]";
  v6 = 1024;
  v7 = 49;
  v8 = 1024;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to enqueue! status: %d", v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)connectTo:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d A network element cannot connect to itself!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)connectFrom:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d A network element cannot connect to itself!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
