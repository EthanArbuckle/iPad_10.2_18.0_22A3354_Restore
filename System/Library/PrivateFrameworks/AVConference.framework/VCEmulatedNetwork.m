@implementation VCEmulatedNetwork

- (VCEmulatedNetwork)initWithPolicies:(id)a3
{
  VCEmulatedNetwork *v4;
  VCEmulatedOutputQueue *v5;
  uint64_t v6;
  NSObject *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)VCEmulatedNetwork;
  v4 = -[VCEmulatedNetwork init](&v9, sel_init);
  if (v4)
  {
    v4->_policies = (NSDictionary *)a3;
    v5 = -[VCEmulatedNetworkElement initWithPolicies:]([VCEmulatedOutputQueue alloc], "initWithPolicies:", 0);
    v4->_outputQueue = v5;
    if (!v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCEmulatedNetwork initWithPolicies:].cold.1(v6, v7);
      }

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  id pushCompletionHandler;
  id popCompletionHandler;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];

  pushCompletionHandler = self->_pushCompletionHandler;
  if (pushCompletionHandler)
    _Block_release(pushCompletionHandler);
  popCompletionHandler = self->_popCompletionHandler;
  if (popCompletionHandler)
    _Block_release(popCompletionHandler);

  v5.receiver = self;
  v5.super_class = (Class)VCEmulatedNetwork;
  -[VCEmulatedNetwork dealloc](&v5, sel_dealloc);
}

- (void)push:(id)a3
{
  void (**pushCompletionHandler)(id, id);

  -[VCEmulatedNetworkElement write:](self->_outputQueue, "write:");
  pushCompletionHandler = (void (**)(id, id))self->_pushCompletionHandler;
  if (pushCompletionHandler)
    pushCompletionHandler[2](pushCompletionHandler, a3);
}

- (id)copyPacketFromPop
{
  id v3;
  void (**popCompletionHandler)(id, id);
  BOOL v5;

  if (!-[VCEmulatedNetwork numberOfPacketsWaitingInOutputQueue](self, "numberOfPacketsWaitingInOutputQueue"))
    return 0;
  v3 = -[VCEmulatedOutputQueue copyPacketFromPop](self->_outputQueue, "copyPacketFromPop");
  popCompletionHandler = (void (**)(id, id))self->_popCompletionHandler;
  if (popCompletionHandler)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5)
    popCompletionHandler[2](popCompletionHandler, v3);
  return v3;
}

- (unsigned)numberOfPacketsWaitingInOutputQueue
{
  unsigned int result;

  result = -[VCEmulatedOutputQueue numberOfPacketsInOutputQueue](self->_outputQueue, "numberOfPacketsInOutputQueue");
  self->_numberOfPacketsWaitingInOutputQueue = result;
  return result;
}

- (id)pushCompletionHandler
{
  return self->_pushCompletionHandler;
}

- (void)setPushCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)popCompletionHandler
{
  return self->_popCompletionHandler;
}

- (void)setPopCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
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
  v5 = "-[VCEmulatedNetwork initWithPolicies:]";
  v6 = 1024;
  v7 = 22;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Cannot create output queue successfully!", (uint8_t *)&v2, 0x1Cu);
}

@end
