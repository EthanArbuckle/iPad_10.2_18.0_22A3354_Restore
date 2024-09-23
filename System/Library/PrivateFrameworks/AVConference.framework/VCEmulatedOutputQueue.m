@implementation VCEmulatedOutputQueue

- (void)runUntilTime:(double)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCEmulatedOutputQueue runUntilTime:].cold.1();
  }
}

- (void)connectFrom:(id)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCEmulatedOutputQueue connectFrom:].cold.1();
  }
}

- (unsigned)numberOfPacketsInOutputQueue
{
  unsigned int result;

  result = CMSimpleQueueGetCount(self->super._networkElementQueue);
  self->_numberOfPacketsInOutputQueue = result;
  return result;
}

- (id)copyPacketFromPop
{
  return (id)CMSimpleQueueDequeue(self->super._networkElementQueue);
}

- (void)runUntilTime:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No processing should be run for the output queue!", v2, v3, v4, v5, 2u);
}

- (void)connectFrom:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Cannot not call connect from for the output queue!", v2, v3, v4, v5, 2u);
}

@end
