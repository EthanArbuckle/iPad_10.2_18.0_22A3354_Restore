@implementation VCNetworkSimulator

- (VCNetworkSimulator)init
{
  VCNetworkSimulator *v2;
  VCNetworkSimulator *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCNetworkSimulator;
  v2 = -[VCNetworkSimulator init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_mutex, 0);
    pthread_cond_init(&v3->_packetPushedCondition, 0);
    pthread_cond_init(&v3->_queueEmptyCondition, 0);
  }
  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_10 != -1)
    dispatch_once(&sharedInstance_onceToken_10, &__block_literal_global_61);
  return (id)sharedInstance_sharedNetworkSimulator;
}

VCNetworkSimulator *__36__VCNetworkSimulator_sharedInstance__block_invoke()
{
  VCNetworkSimulator *result;

  result = objc_alloc_init(VCNetworkSimulator);
  sharedInstance_sharedNetworkSimulator = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  pthread_mutex_destroy(&self->_mutex);
  pthread_cond_destroy(&self->_packetPushedCondition);
  pthread_cond_destroy(&self->_queueEmptyCondition);
  v3.receiver = self;
  v3.super_class = (Class)VCNetworkSimulator;
  -[VCNetworkSimulator dealloc](&v3, sel_dealloc);
}

- (id)createDefaultPolicies
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  _QWORD v12[2];
  _QWORD v13[2];
  const __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16 = CFSTR("SingleQueueImpairments");
  v12[0] = CFSTR("time");
  v12[1] = CFSTR("value");
  v13[0] = &unk_1E9EFA1F0;
  v13[1] = &unk_1E9EFA208;
  v14 = CFSTR("FixedBandwidth");
  v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v17[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315650;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCNetworkSimulator createDefaultPolicies]";
      v10 = 1024;
      v11 = 82;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Using default json policies.", (uint8_t *)&v6, 0x1Cu);
    }
  }
  return v2;
}

- (id)loadPoliciesFromJson
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  id v7;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  VCNetworkSimulator *v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  VCNetworkSimulator *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  VCNetworkSimulator *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v3 = objc_msgSend(+[VCTestMonitorManager sharedManager](VCTestMonitorManager, "sharedManager"), "emulatedNetworkConfigPath");
  v4 = (unint64_t)VCDefaults_CopyStringValueForKey(CFSTR("emulatedNetworkConfigJSONString"));
  if (!(v3 | v4))
  {
    if ((VCNetworkSimulator *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCNetworkSimulator loadPoliciesFromJson].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (const __CFString *)-[VCNetworkSimulator performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v9 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v22 = v11;
          v23 = 2080;
          v24 = "-[VCNetworkSimulator loadPoliciesFromJson]";
          v25 = 1024;
          v26 = 94;
          v27 = 2112;
          v28 = (uint64_t)v9;
          v29 = 2048;
          v30 = self;
          v13 = " [%s] %s:%d %@(%p) Error loading json config.";
          goto LABEL_33;
        }
      }
    }
LABEL_41:
    v7 = -[VCNetworkSimulator createDefaultPolicies](self, "createDefaultPolicies");
    if (!v4)
      return v7;
    goto LABEL_11;
  }
  if (v3 && objc_msgSend((id)v3, "length"))
  {
    v5 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v3, 0, &v20);
    if (!v5)
    {
      if ((VCNetworkSimulator *)objc_opt_class() != self)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v6 = (const __CFString *)-[VCNetworkSimulator performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v6 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_41;
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_41;
        *(_DWORD *)buf = 136316674;
        v22 = v18;
        v23 = 2080;
        v24 = "-[VCNetworkSimulator loadPoliciesFromJson]";
        v25 = 1024;
        v26 = 98;
        v27 = 2112;
        v28 = (uint64_t)v6;
        v29 = 2048;
        v30 = self;
        v31 = 2112;
        v32 = v3;
        v33 = 2112;
        v34 = v20;
        v13 = " [%s] %s:%d %@(%p) Error loading json policies from path=%@ error=%@";
        v15 = v19;
        v16 = 68;
LABEL_34:
        _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, v13, buf, v16);
        goto LABEL_41;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_41;
      v17 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_41;
      *(_DWORD *)buf = 136316162;
      v22 = v17;
      v23 = 2080;
      v24 = "-[VCNetworkSimulator loadPoliciesFromJson]";
      v25 = 1024;
      v26 = 98;
      v27 = 2112;
      v28 = v3;
      v29 = 2112;
      v30 = v20;
      v13 = " [%s] %s:%d Error loading json policies from path=%@ error=%@";
LABEL_33:
      v15 = v12;
      v16 = 48;
      goto LABEL_34;
    }
  }
  else
  {
    v5 = objc_msgSend((id)v4, "dataUsingEncoding:", 4);
  }
  v7 = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, 0);
  if (!v7)
  {
    if ((VCNetworkSimulator *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCNetworkSimulator loadPoliciesFromJson].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCNetworkSimulator performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v22 = v14;
          v23 = 2080;
          v24 = "-[VCNetworkSimulator loadPoliciesFromJson]";
          v25 = 1024;
          v26 = 103;
          v27 = 2112;
          v28 = (uint64_t)v10;
          v29 = 2048;
          v30 = self;
          v13 = " [%s] %s:%d %@(%p) Error serializing json policies.";
          goto LABEL_33;
        }
      }
    }
    goto LABEL_41;
  }
  if (v4)
LABEL_11:
    CFRelease((CFTypeRef)v4);
  return v7;
}

- (void)setupNetwork
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create VCEmulatedNetwork", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

uint64_t __34__VCNetworkSimulator_setupNetwork__block_invoke(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 200) = 0;
  pthread_cond_signal((pthread_cond_t *)(*(_QWORD *)(a1 + 32) + 104));
  return pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)start
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCRealTimeThread_Initialize for network simulator thread FAILED", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stop
{
  tagVCRealTimeThread *thread;
  uint64_t v4;
  NSObject *v5;
  VCEmulatedNetwork *network;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (self->_isStarted)
  {
    if (self->_thread)
    {
      if (-[VCEmulatedNetwork numberOfPacketsWaitingInOutputQueue](self->_network, "numberOfPacketsWaitingInOutputQueue"))
      {
        -[VCNetworkSimulator waitForCondition:withTimeout:conditionPredicate:](self, "waitForCondition:withTimeout:conditionPredicate:", &self->_queueEmptyCondition, &self->_isQueueEmpty, 0.01);
      }
      thread = self->_thread;
      if (thread)
      {
        VCRealTimeThread_Stop((uint64_t)thread);
        VCRealTimeThread_Finalize((uint64_t)self->_thread);
        self->_thread = 0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v4 = VRTraceErrorLogLevelToCSTR();
          v5 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v7 = 136315650;
            v8 = v4;
            v9 = 2080;
            v10 = "-[VCNetworkSimulator stop]";
            v11 = 1024;
            v12 = 170;
            _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCRealTimeThread_Stop for network simulator", (uint8_t *)&v7, 0x1Cu);
          }
        }
      }
    }
    network = self->_network;
    if (network)
    {

      self->_network = 0;
    }
    self->_isStarted = 0;
  }
  objc_sync_exit(self);
}

- (int)processNetwork
{
  -[VCEmulatedNetwork runUntilTime:](self->_network, "runUntilTime:", micro());
  while (-[VCEmulatedNetwork numberOfPacketsWaitingInOutputQueue](self->_network, "numberOfPacketsWaitingInOutputQueue"))-[VCEmulatedNetwork copyPacketFromPop](self->_network, "copyPacketFromPop");
  pthread_mutex_lock(&self->_mutex);
  self->_isQueueEmpty = 1;
  pthread_cond_signal(&self->_queueEmptyCondition);
  pthread_mutex_unlock(&self->_mutex);
  return -[VCNetworkSimulator waitForCondition:withTimeout:conditionPredicate:](self, "waitForCondition:withTimeout:conditionPredicate:", &self->_packetPushedCondition, 0, 0.005);
}

- (int)waitForCondition:(_opaque_pthread_cond_t *)a3 withTimeout:(double)a4 conditionPredicate:(BOOL *)a5
{
  _opaque_pthread_mutex_t *p_mutex;
  int v9;
  int v10;
  timespec v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_mutex = &self->_mutex;
  v13.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v13.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutex_lock(&self->_mutex);
  if (a4 <= 0.0)
  {
    v10 = 60;
  }
  else
  {
    v13.tv_sec = (int)a4;
    v13.tv_nsec = (int)((a4 - (double)(int)a4) * 1000000000.0);
    do
    {
      v9 = pthread_cond_timedwait_relative_np(a3, p_mutex, &v13);
      v10 = v9;
      if (!a5)
        break;
    }
    while (!*a5 && v9 == 0);
  }
  pthread_mutex_unlock(p_mutex);
  return v10;
}

- (VCEmulatedNetwork)network
{
  return self->_network;
}

- (void)loadPoliciesFromJson
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error serializing json policies.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
