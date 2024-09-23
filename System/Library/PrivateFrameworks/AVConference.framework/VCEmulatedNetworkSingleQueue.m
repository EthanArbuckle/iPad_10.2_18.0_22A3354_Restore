@implementation VCEmulatedNetworkSingleQueue

- (VCEmulatedNetworkSingleQueue)initWithPolicies:(id)a3
{
  VCEmulatedNetworkSingleQueue *v4;
  VCEmulatedNetworkQueue *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCEmulatedNetworkSingleQueue;
  v4 = -[VCEmulatedNetwork initWithPolicies:](&v7, sel_initWithPolicies_);
  if (v4)
  {
    v5 = -[VCEmulatedNetworkQueue initWithPolicies:]([VCEmulatedNetworkQueue alloc], "initWithPolicies:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SingleQueueImpairments")));
    v4->_networkQueue = v5;
    if (v5)
    {
      -[VCEmulatedNetworkElement connectTo:](v5, "connectTo:", v4->super._outputQueue);
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCEmulatedNetworkSingleQueue initWithPolicies:].cold.1();
      }

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCEmulatedNetworkSingleQueue;
  -[VCEmulatedNetwork dealloc](&v3, sel_dealloc);
}

- (void)push:(id)a3
{
  void (**pushCompletionHandler)(id, id);

  if (-[VCEmulatedNetworkQueue write:](self->_networkQueue, "write:"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCEmulatedNetworkSingleQueue push:].cold.1();
    }
  }
  else
  {
    pushCompletionHandler = (void (**)(id, id))self->super._pushCompletionHandler;
    if (pushCompletionHandler)
      pushCompletionHandler[2](pushCompletionHandler, a3);
  }
}

- (void)runUntilTime:(double)a3
{
  -[VCEmulatedNetworkQueue runUntilTime:](self->_networkQueue, "runUntilTime:", a3);
}

- (void)initWithPolicies:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Cannot create network queue successfully!", v2, v3, v4, v5, 2u);
}

- (void)push:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to write to network queue", v2, v3, v4, v5, 2u);
}

@end
