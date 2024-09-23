@implementation VCXPCConnection

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)stopTimeoutTimer
{
  NSObject *timeoutTimer;

  if (self->_timeoutTimerStarted)
  {
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      dispatch_source_set_timer(timeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0x1DCD6500uLL);
      self->_timeoutTimerStarted = 0;
    }
  }
}

- (void)startTimeoutTimer
{
  NSObject *timeoutTimer;
  dispatch_time_t v4;

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v4 = dispatch_time(0, 11000000000);
    dispatch_source_set_timer(timeoutTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    self->_timeoutTimerStarted = 1;
  }
}

- (void)setPersistent:(BOOL)a3
{
  OS_os_transaction *transaction;

  self->_isPersistent = a3;
  if (a3)
  {
    transaction = self->_transaction;
    if (transaction)
    {

      self->_transaction = 0;
    }
  }
}

- (void)setLastCalledApiName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSData)tokenData
{
  return self->tokenData;
}

- (void)setTokenData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (id)context
{
  return self->context;
}

- (void)setConnection:(id)a3
{
  OS_xpc_object *connection;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  connection = self->_connection;
  if (connection == a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315650;
        v9 = v6;
        v10 = 2080;
        v11 = "-[VCXPCConnection setConnection:]";
        v12 = 1024;
        v13 = 211;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d setting connection again with same value", (uint8_t *)&v8, 0x1Cu);
      }
    }
  }
  else
  {
    if (connection)
    {
      xpc_connection_cancel(connection);
      xpc_release(self->_connection);
    }
    if (a3)
      xpc_retain(a3);
    self->_connection = (OS_xpc_object *)a3;
  }
}

- (VCXPCConnection)init
{
  VCXPCConnection *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCXPCConnection;
  v2 = -[VCXPCConnection init](&v4, sel_init);
  if (v2)
    v2->_lastCalledApiName = (NSString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  return v2;
}

- (void)createTimeoutTimer
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "AVConferenceXPCServer [%s] %s:%d Failed to create timeoutQueueLabel for PID %d", v2, v3, v4, 124);
  OUTLINED_FUNCTION_3();
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setPid:(int)pid
{
  int *p_pid;
  OS_os_transaction *transaction;
  char *v6;
  _OWORD buffer[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  self->_pid = pid;
  p_pid = &self->_pid;
  transaction = self->_transaction;
  if (transaction)
  {

    self->_transaction = 0;
    pid = self->_pid;
  }
  memset(buffer, 0, sizeof(buffer));
  proc_name(pid, buffer, 0x20u);
  v6 = 0;
  asprintf(&v6, "AVConference %d %s", *p_pid, (const char *)buffer);
  if (v6)
  {
    self->_transaction = (OS_os_transaction *)FigOSTransactionCreate();
    free(v6);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCXPCConnection setPid:].cold.1();
  }
}

- (void)dealloc
{
  OS_os_transaction *transaction;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  -[VCXPCConnection destroyTimeoutTimer](self, "destroyTimeoutTimer");
  -[VCXPCConnection setConnection:](self, "setConnection:", 0);
  -[VCXPCConnection setContext:](self, "setContext:", 0);
  -[VCXPCConnection setTokenData:](self, "setTokenData:", 0);
  -[VCXPCConnection setLastCalledApiName:](self, "setLastCalledApiName:", 0);
  transaction = self->_transaction;
  if (transaction)
  {

    self->_transaction = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VCXPCConnection;
  -[VCXPCConnection dealloc](&v4, sel_dealloc);
}

- (void)destroyTimeoutTimer
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  const char *v4;
  int v5;
  const void *v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  LODWORD(v6) = 145;
  WORD2(v6) = 2048;
  HIWORD(v6) = v0;
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v1, v2, "AVConferenceXPCServer [%s] %s:%d [%p] timer has been cancelled", v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)selfTerminateDueToTimeout:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  uint64_t v8;
  _BYTE v9[3];
  _BYTE v10[5];
  _BYTE buffer[3];
  _BYTE v12[1029];

  *(_QWORD *)&v12[1021] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "pid");
  bzero(v12, 0x3FDuLL);
  memset(buffer, 63, sizeof(buffer));
  proc_name(v4, buffer, 0x400u);
  v5 = getpid();
  bzero(v10, 0x3FDuLL);
  memset(v9, 63, sizeof(v9));
  proc_name(v5, v9, 0x400u);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  v8 = objc_msgSend(v6, "stringWithFormat:", CFSTR("%s: Terminating %s [%d] due to timeout (client %s [%d]) (API NAME: %@)"), class_getName(v7), v9, v5, buffer, v4, objc_msgSend(a3, "lastCalledApiName"));
  VCTerminateProcess(v8, CFSTR("AVConferenceXPCServer"), 0);
}

- (int)pid
{
  return self->_pid;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<VCXPCConnection connection: %p client pid: %d, context: %@>\n"), self->_connection, self->_pid, self->context);
}

- (BOOL)isPersistent
{
  return self->_isPersistent;
}

- (NSString)lastCalledApiName
{
  return self->_lastCalledApiName;
}

- (void)setPid:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "AVConferenceXPCServer [%s] %s:%d Failed to create description for PID %d", v2, v3, v4, 182);
  OUTLINED_FUNCTION_3();
}

@end
