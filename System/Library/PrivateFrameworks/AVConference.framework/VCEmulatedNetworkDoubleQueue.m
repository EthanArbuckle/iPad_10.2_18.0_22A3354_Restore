@implementation VCEmulatedNetworkDoubleQueue

- (VCEmulatedNetworkDoubleQueue)initWithPolicies:(id)a3
{
  VCEmulatedNetworkDoubleQueue *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  VCEmulatedNetworkQueue *v8;
  VCEmulatedNetworkQueue *networkQueueA;
  BOOL v10;
  uint64_t v11;
  NSObject *v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)VCEmulatedNetworkDoubleQueue;
  v4 = -[VCEmulatedNetwork initWithPolicies:](&v14, sel_initWithPolicies_);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("DoubleQueueImpairments"));
    v6 = objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("QueueAImpairments"));
    v7 = objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("QueueBImpairments"));
    v4->_networkQueueA = -[VCEmulatedNetworkQueue initWithPolicies:]([VCEmulatedNetworkQueue alloc], "initWithPolicies:", v6);
    v8 = -[VCEmulatedNetworkQueue initWithPolicies:]([VCEmulatedNetworkQueue alloc], "initWithPolicies:", v7);
    v4->_networkQueueB = v8;
    networkQueueA = v4->_networkQueueA;
    if (networkQueueA)
      v10 = v8 == 0;
    else
      v10 = 1;
    if (v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCEmulatedNetworkDoubleQueue initWithPolicies:].cold.1(v11, v12);
      }

      return 0;
    }
    else
    {
      -[VCEmulatedNetworkElement connectTo:](networkQueueA, "connectTo:", v4->super._outputQueue);
      -[VCEmulatedNetworkElement connectTo:](v4->_networkQueueB, "connectTo:", v4->super._outputQueue);
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
  v3.super_class = (Class)VCEmulatedNetworkDoubleQueue;
  -[VCEmulatedNetwork dealloc](&v3, sel_dealloc);
}

- (void)push:(id)a3
{
  char v5;
  int *v6;
  uint64_t v7;
  NSObject *v8;
  void (**pushCompletionHandler)(id, id);

  v5 = objc_msgSend(a3, "packetID");
  v6 = &OBJC_IVAR___VCEmulatedNetworkDoubleQueue__networkQueueA;
  if ((v5 & 1) == 0)
    v6 = &OBJC_IVAR___VCEmulatedNetworkDoubleQueue__networkQueueB;
  if (objc_msgSend(*(id *)((char *)&self->super.super.isa + *v6), "write:", a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCEmulatedNetworkDoubleQueue push:].cold.1(v7, a3, v8);
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
  -[VCEmulatedNetworkQueue runUntilTime:](self->_networkQueueA, "runUntilTime:");
  -[VCEmulatedNetworkQueue runUntilTime:](self->_networkQueueB, "runUntilTime:", a3);
}

- (void)initWithPolicies:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[VCEmulatedNetworkDoubleQueue initWithPolicies:]";
  v6 = 1024;
  v7 = 21;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Cannot create network queue(s) successfully!", (uint8_t *)&v2, 0x1Cu);
}

- (void)push:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = 136315906;
  if ((objc_msgSend(a2, "packetID") & 1) != 0)
    v5 = 65;
  else
    v5 = 66;
  v7 = a1;
  v8 = 2080;
  v9 = "-[VCEmulatedNetworkDoubleQueue push:]";
  v10 = 1024;
  v11 = 50;
  v12 = 1024;
  v13 = v5;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to write to network queue %c", (uint8_t *)&v6, 0x22u);
}

@end
