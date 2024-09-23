@implementation AVCBasebandAudioTap

- (BOOL)setUpPowerSpectrumMeter
{
  AVCAudioPowerSpectrumMeter *powerSpectrumMeter;
  AVCAudioPowerSpectrumMeter *v4;
  OS_dispatch_queue *stateQueue;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  powerSpectrumMeter = self->_powerSpectrumMeter;
  if (!powerSpectrumMeter)
  {
    v4 = [AVCAudioPowerSpectrumMeter alloc];
    stateQueue = self->_stateQueue;
    v7 = xmmword_1D910CEA8;
    v8 = 0x40F5180000000000;
    powerSpectrumMeter = -[AVCAudioPowerSpectrumMeter initWithConfig:delegate:queue:](v4, "initWithConfig:delegate:queue:", &v7, self, stateQueue);
    self->_powerSpectrumMeter = powerSpectrumMeter;
  }
  return powerSpectrumMeter != 0;
}

- (void)cleanUpPowerSpectrumMeter
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);

  self->_powerSpectrumMeter = 0;
}

- (id)dispatchedDelegate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  return objc_loadWeak(&self->_weakDelegate);
}

- (AVCBasebandAudioTap)init
{
  AVCBasebandAudioTap *v2;
  NSObject *CustomRootQueue;
  dispatch_queue_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)AVCBasebandAudioTap;
  v2 = -[AVCBasebandAudioTap init](&v8, sel_init);
  if (!v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCBasebandAudioTap init].cold.1();
    }
    goto LABEL_14;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v4 = dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCBasebandAudioTap.stateQueue", 0, CustomRootQueue);
  v2->_stateQueue = (OS_dispatch_queue *)v4;
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCBasebandAudioTap init].cold.2();
    }
    goto LABEL_14;
  }
  v5 = VCDispatchQueue_GetCustomRootQueue(37);
  v6 = dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCBasebandAudioTap.delegateQueue", 0, v5);
  v2->_delegateQueue = (OS_dispatch_queue *)v6;
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCBasebandAudioTap init].cold.3();
    }
LABEL_14:

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  NSObject *delegateQueue;
  NSObject *stateQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];

  objc_storeWeak(&self->_weakDelegate, 0);
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
    dispatch_release(delegateQueue);
  stateQueue = self->_stateQueue;
  if (stateQueue)
    dispatch_release(stateQueue);
  v5.receiver = self;
  v5.super_class = (Class)AVCBasebandAudioTap;
  -[AVCBasebandAudioTap dealloc](&v5, sel_dealloc);
}

- (AVCBasebandAudioTapDelegate)delegate
{
  NSObject *stateQueue;
  AVCBasebandAudioTapDelegate *v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__13;
  v10 = __Block_byref_object_dispose__13;
  v11 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__AVCBasebandAudioTap_delegate__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  v3 = (AVCBasebandAudioTapDelegate *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__AVCBasebandAudioTap_delegate__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dispatchedDelegate");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setDelegate:(id)a3
{
  NSObject *stateQueue;
  uint64_t v6;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  objc_class *v10;
  NSString *v11;
  uint64_t v12;
  NSObject *v13;
  unint64_t v14;
  SEL *p_name;
  NSString *v16;
  char v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  objc_method_description *v21;
  unsigned int outCount;
  _QWORD block[6];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BYTE v31[28];
  __int16 v32;
  NSString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__AVCBasebandAudioTap_setDelegate___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(stateQueue, block);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 136316674;
      v25 = v6;
      v26 = 2080;
      v27 = "-[AVCBasebandAudioTap setDelegate:]";
      v28 = 1024;
      v29 = 146;
      v30 = 2048;
      *(_QWORD *)v31 = self;
      *(_WORD *)&v31[8] = 2112;
      *(_QWORD *)&v31[10] = v9;
      *(_WORD *)&v31[18] = 2048;
      *(_QWORD *)&v31[20] = a3;
      v32 = 2112;
      v33 = v11;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d self=%p (%@), delegate=%p (%@)", buf, 0x44u);
    }
  }
  outCount = 0;
  v21 = protocol_copyMethodDescriptionList((Protocol *)&unk_1F023C838, 0, 1, &outCount);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v25 = v12;
      v26 = 2080;
      v27 = "-[AVCBasebandAudioTap setDelegate:]";
      v28 = 1024;
      v29 = 146;
      v30 = 1024;
      *(_DWORD *)v31 = outCount;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Protocol AVCBasebandAudioTapDelegate contains %u optional methods.", buf, 0x22u);
    }
  }
  if (outCount)
  {
    v14 = 0;
    p_name = &v21->name;
    do
    {
      v16 = NSStringFromSelector(*p_name);
      NSSelectorFromString(v16);
      v17 = objc_opt_respondsToSelector();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v20 = "does NOT respond";
          if ((v17 & 1) != 0)
            v20 = "responds";
          v25 = v18;
          v26 = 2080;
          v27 = "-[AVCBasebandAudioTap setDelegate:]";
          v28 = 1024;
          v29 = 146;
          v30 = 1024;
          *(_DWORD *)v31 = v14;
          *(_WORD *)&v31[4] = 2080;
          *(_QWORD *)&v31[6] = v20;
          *(_WORD *)&v31[14] = 2112;
          *(_QWORD *)&v31[16] = v16;
          _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %u: Delegate %s to \"%@\", buf, 0x36u);
        }
      }
      ++v14;
      p_name += 2;
    }
    while (v14 < outCount);
  }
  free(v21);
}

id __35__AVCBasebandAudioTap_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1)
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_41);
  return (id)sharedInstance_instance_1;
}

AVCBasebandAudioTap *__37__AVCBasebandAudioTap_sharedInstance__block_invoke()
{
  AVCBasebandAudioTap *result;

  result = objc_alloc_init(AVCBasebandAudioTap);
  sharedInstance_instance_1 = (uint64_t)result;
  return result;
}

- (id)registerForTapWithError:(id *)a3
{
  AVCBasebandAudioTapRegistrationResult *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *stateQueue;
  uint64_t v9;
  NSObject *v10;
  AVCBasebandAudioTapRegistrationResult *v11;
  _QWORD block[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  AVCBasebandAudioTap *v27;
  __int16 v28;
  AVCBasebandAudioTapRegistrationResult *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__13;
  v18 = __Block_byref_object_dispose__13;
  v19 = 0;
  v5 = objc_alloc_init(AVCBasebandAudioTapRegistrationResult);
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCBasebandAudioTap-registerForTapWithError");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v21 = v6;
      v22 = 2080;
      v23 = "-[AVCBasebandAudioTap registerForTapWithError:]";
      v24 = 1024;
      v25 = 163;
      v26 = 2048;
      v27 = self;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCBasebandAudioTap-registerForTapWithError [%p]", buf, 0x26u);
    }
  }
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AVCBasebandAudioTap_registerForTapWithError___block_invoke;
  block[3] = &unk_1E9E52988;
  block[5] = v5;
  block[6] = &v14;
  block[4] = self;
  dispatch_sync(stateQueue, block);
  if (a3)
    *a3 = (id)v15[5];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCBasebandAudioTap-registerForTapWithError");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v21 = v9;
      v22 = 2080;
      v23 = "-[AVCBasebandAudioTap registerForTapWithError:]";
      v24 = 1024;
      v25 = 183;
      v26 = 2048;
      v27 = self;
      v28 = 2112;
      v29 = v5;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCBasebandAudioTap-registerForTapWithError [%p] result=%@", buf, 0x30u);
    }
  }
  v11 = v5;
  _Block_object_dispose(&v14, 8);
  return v11;
}

uint64_t __47__AVCBasebandAudioTap_registerForTapWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[24];
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "setUpPowerSpectrumMeter") & 1) != 0)
  {
    v2 = a1 + 48;
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "registerPowerSpectrumForCellularTapType:error:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!(_DWORD)v3 || (v4 = *(_QWORD *)(*(_QWORD *)v2 + 8), v6 = *(_QWORD *)(v4 + 40), v5 = v4 + 40, v6))
    {
      if (objc_opt_class() == *(_QWORD *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __47__AVCBasebandAudioTap_registerForTapWithError___block_invoke_cold_2();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v8 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
        else
          v8 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v13 = *(_QWORD *)(a1 + 32);
            v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
            *(_DWORD *)v23 = 136316418;
            *(_QWORD *)&v23[4] = v11;
            *(_WORD *)&v23[12] = 2080;
            *(_QWORD *)&v23[14] = "-[AVCBasebandAudioTap registerForTapWithError:]_block_invoke";
            *(_WORD *)&v23[22] = 1024;
            LODWORD(v24) = 169;
            WORD2(v24) = 2112;
            *(_QWORD *)((char *)&v24 + 6) = v8;
            HIWORD(v24) = 2048;
            v25 = v13;
            LOWORD(v26) = 2112;
            *(_QWORD *)((char *)&v26 + 2) = v14;
            v15 = " [%s] %s:%d %@(%p) Failed to register uplink tap with error=%@";
LABEL_31:
            _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, v15, v23, 0x3Au);
          }
        }
      }
    }
    else
    {
      v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "registerPowerSpectrumForCellularTapType:error:", 1, v5);
      if ((_DWORD)v3 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40))
      {
        v3 = 1;
        goto LABEL_7;
      }
      if (objc_opt_class() == *(_QWORD *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __47__AVCBasebandAudioTap_registerForTapWithError___block_invoke_cold_1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v9 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
        else
          v9 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v16 = VRTraceErrorLogLevelToCSTR();
          v12 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v17 = *(_QWORD *)(a1 + 32);
            v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
            *(_DWORD *)v23 = 136316418;
            *(_QWORD *)&v23[4] = v16;
            *(_WORD *)&v23[12] = 2080;
            *(_QWORD *)&v23[14] = "-[AVCBasebandAudioTap registerForTapWithError:]_block_invoke";
            *(_WORD *)&v23[22] = 1024;
            LODWORD(v24) = 172;
            WORD2(v24) = 2112;
            *(_QWORD *)((char *)&v24 + 6) = v9;
            HIWORD(v24) = 2048;
            v25 = v17;
            LOWORD(v26) = 2112;
            *(_QWORD *)((char *)&v26 + 2) = v18;
            v15 = " [%s] %s:%d %@(%p) Failed to register downlink tap with error=%@";
            goto LABEL_31;
          }
        }
      }
    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32031, 0, CFSTR("Failed to set up XPC connection for AVCBasebandAudioTap"));
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __47__AVCBasebandAudioTap_registerForTapWithError___block_invoke_cold_3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v21 = *(_QWORD *)(a1 + 32);
          v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          *(_DWORD *)v23 = 136316418;
          *(_QWORD *)&v23[4] = v19;
          *(_WORD *)&v23[12] = 2080;
          *(_QWORD *)&v23[14] = "-[AVCBasebandAudioTap registerForTapWithError:]_block_invoke";
          *(_WORD *)&v23[22] = 1024;
          LODWORD(v24) = 166;
          WORD2(v24) = 2112;
          *(_QWORD *)((char *)&v24 + 6) = v10;
          HIWORD(v24) = 2048;
          v25 = v21;
          LOWORD(v26) = 2112;
          *(_QWORD *)((char *)&v26 + 2) = v22;
          _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) error=%@", v23, 0x3Au);
        }
      }
    }
    v3 = 0;
  }
LABEL_7:
  objc_msgSend(*(id *)(a1 + 40), "setDidSucceed:", v3, *(_OWORD *)v23, *(_QWORD *)&v23[16], v24, v25, v26);
  objc_msgSend(*(id *)(a1 + 40), "setTapToken:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "sessionToken"));
  objc_msgSend(*(id *)(a1 + 40), "setUplinkToken:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "streamTokenForCellularTapType:", 0));
  return objc_msgSend(*(id *)(a1 + 40), "setDownlinkToken:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "streamTokenForCellularTapType:", 1));
}

- (BOOL)unregisterFromTapWithError:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  NSObject *stateQueue;
  uint64_t v8;
  NSObject *v9;
  int v10;
  char v11;
  _QWORD block[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  AVCBasebandAudioTap *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__13;
  v18 = __Block_byref_object_dispose__13;
  v19 = 0;
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCBasebandAudioTap-unregisterFromTapWithError");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v25 = v5;
      v26 = 2080;
      v27 = "-[AVCBasebandAudioTap unregisterFromTapWithError:]";
      v28 = 1024;
      v29 = 190;
      v30 = 2048;
      v31 = self;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCBasebandAudioTap-unregisterFromTapWithError [%p]", buf, 0x26u);
    }
  }
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AVCBasebandAudioTap_unregisterFromTapWithError___block_invoke;
  block[3] = &unk_1E9E555F0;
  block[4] = self;
  block[5] = &v20;
  block[6] = &v14;
  dispatch_sync(stateQueue, block);
  if (a3)
    *a3 = (id)v15[5];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCBasebandAudioTap-unregisterFromTapWithError");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = *((unsigned __int8 *)v21 + 24);
      *(_DWORD *)buf = 136316162;
      v25 = v8;
      v26 = 2080;
      v27 = "-[AVCBasebandAudioTap unregisterFromTapWithError:]";
      v28 = 1024;
      v29 = 208;
      v30 = 2048;
      v31 = self;
      v32 = 1024;
      v33 = v10;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCBasebandAudioTap-unregisterFromTapWithError [%p] success=%{BOOL}d", buf, 0x2Cu);
    }
  }
  v11 = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v11;
}

uint64_t __50__AVCBasebandAudioTap_unregisterFromTapWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  BOOL v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  _BYTE v27[24];
  __int128 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return objc_msgSend(*(id *)(a1 + 32), "cleanUpPowerSpectrumMeter", *(_OWORD *)v27, *(_QWORD *)&v27[16], v28, v29);
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return objc_msgSend(*(id *)(a1 + 32), "cleanUpPowerSpectrumMeter", *(_OWORD *)v27, *(_QWORD *)&v27[16], v28, v29);
      *(_DWORD *)v27 = 136315650;
      *(_QWORD *)&v27[4] = v19;
      *(_WORD *)&v27[12] = 2080;
      *(_QWORD *)&v27[14] = "-[AVCBasebandAudioTap unregisterFromTapWithError:]_block_invoke";
      *(_WORD *)&v27[22] = 1024;
      LODWORD(v28) = 192;
      v21 = " [%s] %s:%d powerSpectrumMeter is nil, implicitly successful unregistration";
      v22 = v20;
      v23 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v18 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return objc_msgSend(*(id *)(a1 + 32), "cleanUpPowerSpectrumMeter", *(_OWORD *)v27, *(_QWORD *)&v27[16], v28, v29);
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return objc_msgSend(*(id *)(a1 + 32), "cleanUpPowerSpectrumMeter", *(_OWORD *)v27, *(_QWORD *)&v27[16], v28, v29);
      v26 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v27 = 136316162;
      *(_QWORD *)&v27[4] = v24;
      *(_WORD *)&v27[12] = 2080;
      *(_QWORD *)&v27[14] = "-[AVCBasebandAudioTap unregisterFromTapWithError:]_block_invoke";
      *(_WORD *)&v27[22] = 1024;
      LODWORD(v28) = 192;
      WORD2(v28) = 2112;
      *(_QWORD *)((char *)&v28 + 6) = v18;
      HIWORD(v28) = 2048;
      v29 = v26;
      v21 = " [%s] %s:%d %@(%p) powerSpectrumMeter is nil, implicitly successful unregistration";
      v22 = v25;
      v23 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, v21, v27, v23);
    return objc_msgSend(*(id *)(a1 + 32), "cleanUpPowerSpectrumMeter", *(_OWORD *)v27, *(_QWORD *)&v27[16], v28, v29);
  }
  v3 = a1 + 48;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "unregisterPowerSpectrumForCellularTapType:error:", 1, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v3 + 8) + 40))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __50__AVCBasebandAudioTap_unregisterFromTapWithError___block_invoke_cold_2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v14 = *(_QWORD *)(a1 + 32);
          v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          *(_DWORD *)v27 = 136316418;
          *(_QWORD *)&v27[4] = v5;
          *(_WORD *)&v27[12] = 2080;
          *(_QWORD *)&v27[14] = "-[AVCBasebandAudioTap unregisterFromTapWithError:]_block_invoke";
          *(_WORD *)&v27[22] = 1024;
          LODWORD(v28) = 195;
          WORD2(v28) = 2112;
          *(_QWORD *)((char *)&v28 + 6) = v4;
          HIWORD(v28) = 2048;
          v29 = v14;
          v30 = 2112;
          v31 = v15;
          _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to unregister downlink tap with error=%@", v27, 0x3Au);
        }
      }
    }
  }
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "unregisterPowerSpectrumForCellularTapType:error:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v8 = 0;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v7)
    v8 = *(_BYTE *)(v9 + 24) != 0;
  *(_BYTE *)(v9 + 24) = v8;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v3 + 8) + 40))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __50__AVCBasebandAudioTap_unregisterFromTapWithError___block_invoke_cold_1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v16 = *(_QWORD *)(a1 + 32);
          v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          *(_DWORD *)v27 = 136316418;
          *(_QWORD *)&v27[4] = v11;
          *(_WORD *)&v27[12] = 2080;
          *(_QWORD *)&v27[14] = "-[AVCBasebandAudioTap unregisterFromTapWithError:]_block_invoke";
          *(_WORD *)&v27[22] = 1024;
          LODWORD(v28) = 200;
          WORD2(v28) = 2112;
          *(_QWORD *)((char *)&v28 + 6) = v10;
          HIWORD(v28) = 2048;
          v29 = v16;
          v30 = 2112;
          v31 = v17;
          _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to unregister uplink tap with error=%@", v27, 0x3Au);
        }
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "cleanUpPowerSpectrumMeter", *(_OWORD *)v27, *(_QWORD *)&v27[16], v28, v29);
}

+ (id)registerForTapWithError:(id *)a3
{
  return -[AVCBasebandAudioTap registerForTapWithError:](+[AVCBasebandAudioTap sharedInstance](AVCBasebandAudioTap, "sharedInstance"), "registerForTapWithError:", a3);
}

+ (BOOL)unregisterFromTapWithError:(id *)a3
{
  return -[AVCBasebandAudioTap unregisterFromTapWithError:](+[AVCBasebandAudioTap sharedInstance](AVCBasebandAudioTap, "sharedInstance"), "unregisterFromTapWithError:", a3);
}

- (void)meterServerDidDisconnect:(id)a3
{
  id v4;
  NSObject *delegateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  -[AVCBasebandAudioTap cleanUpPowerSpectrumMeter](self, "cleanUpPowerSpectrumMeter");
  v4 = -[AVCBasebandAudioTap dispatchedDelegate](self, "dispatchedDelegate");
  if (v4)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__AVCBasebandAudioTap_meterServerDidDisconnect___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = v4;
    block[5] = self;
    dispatch_async(delegateQueue, block);
  }
}

uint64_t __48__AVCBasebandAudioTap_meterServerDidDisconnect___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "serverDidDisconnectForTap:", *(_QWORD *)(a1 + 40));
}

- (void)init
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate delegateQueue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __47__AVCBasebandAudioTap_registerForTapWithError___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to register downlink tap with error=%@");
  OUTLINED_FUNCTION_3();
}

void __47__AVCBasebandAudioTap_registerForTapWithError___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to register uplink tap with error=%@");
  OUTLINED_FUNCTION_3();
}

void __47__AVCBasebandAudioTap_registerForTapWithError___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d error=%@");
  OUTLINED_FUNCTION_3();
}

void __50__AVCBasebandAudioTap_unregisterFromTapWithError___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to unregister uplink tap with error=%@");
  OUTLINED_FUNCTION_3();
}

void __50__AVCBasebandAudioTap_unregisterFromTapWithError___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to unregister downlink tap with error=%@");
  OUTLINED_FUNCTION_3();
}

@end
