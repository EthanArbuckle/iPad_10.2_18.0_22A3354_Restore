@implementation VCNetworkAgent

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_13 != -1)
    dispatch_once(&sharedInstance_onceToken_13, &__block_literal_global_77);
  return (id)sharedInstance_sharedInstance_0;
}

VCNetworkAgent *__32__VCNetworkAgent_sharedInstance__block_invoke()
{
  VCNetworkAgent *result;

  result = objc_alloc_init(VCNetworkAgent);
  sharedInstance_sharedInstance_0 = (uint64_t)result;
  return result;
}

- (VCNetworkAgent)init
{
  VCNetworkAgent *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCNetworkAgent;
  v2 = -[VCNetworkAgent init](&v4, sel_init);
  if (v2)
    v2->agentUUID = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("A2CB4344-1CC7-47EF-8D25-FB68B047620F"));
  return v2;
}

- (void)dealloc
{
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_assertionRefCount >= 1)
  {
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    v4 = (os_log_t *)MEMORY[0x1E0CF2758];
    if (ErrorLogLevelForModule >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v12 = v5;
        v13 = 2080;
        v14 = "-[VCNetworkAgent dealloc]";
        v15 = 1024;
        v16 = 92;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Un-asserting NetworkAgent", buf, 0x1Cu);
      }
    }
    v7 = objc_msgSend(MEMORY[0x1E0CCEC90], "removeActiveAssertionFromNetworkAgent:", self);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v12 = v8;
        v13 = 2080;
        v14 = "-[VCNetworkAgent dealloc]";
        v15 = 1024;
        v16 = 94;
        v17 = 1024;
        v18 = v7;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent has been un-asserted, result=%d", buf, 0x22u);
      }
    }
  }

  v10.receiver = self;
  v10.super_class = (Class)VCNetworkAgent;
  -[VCNetworkAgent dealloc](&v10, sel_dealloc);
}

- (void)addAssertion
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  int assertionRefCount;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (!self->_assertionRefCount)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315650;
        v12 = v3;
        v13 = 2080;
        v14 = "-[VCNetworkAgent addAssertion]";
        v15 = 1024;
        v16 = 107;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Creating an instance of NetworkAgent and asserting it", (uint8_t *)&v11, 0x1Cu);
      }
    }
    v5 = objc_msgSend(MEMORY[0x1E0CCEC90], "addActiveAssertionToNetworkAgent:", self);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315906;
        v12 = v6;
        v13 = 2080;
        v14 = "-[VCNetworkAgent addAssertion]";
        v15 = 1024;
        v16 = 109;
        v17 = 1024;
        v18 = v5;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent has been asserted, result=%d", (uint8_t *)&v11, 0x22u);
      }
    }
  }
  ++self->_assertionRefCount;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      assertionRefCount = self->_assertionRefCount;
      v11 = 136315906;
      v12 = v8;
      v13 = 2080;
      v14 = "-[VCNetworkAgent addAssertion]";
      v15 = 1024;
      v16 = 112;
      v17 = 1024;
      v18 = assertionRefCount;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent refcount is '%d'", (uint8_t *)&v11, 0x22u);
    }
  }
  objc_sync_exit(self);
}

- (void)removeAssertion
{
  int assertionRefCount;
  BOOL v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  assertionRefCount = self->_assertionRefCount;
  v4 = __OFSUB__(assertionRefCount, 1);
  v5 = assertionRefCount - 1;
  if (v5 < 0 == v4)
  {
    self->_assertionRefCount = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = self->_assertionRefCount;
        v14 = 136315906;
        v15 = v6;
        v16 = 2080;
        v17 = "-[VCNetworkAgent removeAssertion]";
        v18 = 1024;
        v19 = 122;
        v20 = 1024;
        v21 = v8;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent refcount is '%d'", (uint8_t *)&v14, 0x22u);
      }
    }
    if (!self->_assertionRefCount)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v14 = 136315650;
          v15 = v9;
          v16 = 2080;
          v17 = "-[VCNetworkAgent removeAssertion]";
          v18 = 1024;
          v19 = 127;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Un-asserting NetworkAgent", (uint8_t *)&v14, 0x1Cu);
        }
      }
      v11 = objc_msgSend(MEMORY[0x1E0CCEC90], "removeActiveAssertionFromNetworkAgent:", self);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v14 = 136315906;
          v15 = v12;
          v16 = 2080;
          v17 = "-[VCNetworkAgent removeAssertion]";
          v18 = 1024;
          v19 = 129;
          v20 = 1024;
          v21 = v11;
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent has been un-asserted, result=%d", (uint8_t *)&v14, 0x22u);
        }
      }
    }
  }
  objc_sync_exit(self);
}

- (const)textString:(id)a3
{
  return (const char *)objc_msgSend(a3, "UTF8String");
}

- (unint64_t)textStringLength:(id)a3
{
  return objc_msgSend(a3, "lengthOfBytesUsingEncoding:", 4);
}

- (BOOL)clearMediaInformationAssertion
{
  return 1;
}

- (BOOL)addMediaInformationAssertion:(id)a3
{
  return 1;
}

- (int)getNetworkAgentRefCount
{
  uint64_t v3;
  NSObject *v4;
  int assertionRefCount;
  int v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      assertionRefCount = self->_assertionRefCount;
      v8 = 136315906;
      v9 = v3;
      v10 = 2080;
      v11 = "-[VCNetworkAgent getNetworkAgentRefCount]";
      v12 = 1024;
      v13 = 259;
      v14 = 1024;
      v15 = assertionRefCount;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent refcount is=%d", (uint8_t *)&v8, 0x22u);
    }
  }
  v6 = self->_assertionRefCount;
  objc_sync_exit(self);
  return v6;
}

+ (id)agentDomain
{
  return CFSTR("WiFiManager");
}

+ (id)agentType
{
  return CFSTR("CallInProgress");
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

- (id)copyAgentData
{
  return 0;
}

- (NSString)agentDescription
{
  return self->agentDescription;
}

- (void)setAgentDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isActive
{
  return self->active;
}

- (void)setActive:(BOOL)a3
{
  self->active = a3;
}

- (BOOL)isKernelActivated
{
  return self->kernelActivated;
}

- (void)setKernelActivated:(BOOL)a3
{
  self->kernelActivated = a3;
}

- (BOOL)isUserActivated
{
  return self->userActivated;
}

- (void)setUserActivated:(BOOL)a3
{
  self->userActivated = a3;
}

- (BOOL)isVoluntary
{
  return self->voluntary;
}

- (void)setVoluntary:(BOOL)a3
{
  self->voluntary = a3;
}

- (BOOL)isSpecificUseOnly
{
  return self->specificUseOnly;
}

- (void)setSpecificUseOnly:(BOOL)a3
{
  self->specificUseOnly = a3;
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
