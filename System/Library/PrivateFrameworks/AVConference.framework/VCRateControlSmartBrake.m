@implementation VCRateControlSmartBrake

- (VCRateControlSmartBrake)init
{
  VCRateControlSmartBrake *v2;
  VCRateControlSmartBrake *v3;
  NSObject *CustomRootQueue;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  VCRateControlSmartBrake *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VCRateControlSmartBrake;
  v2 = -[VCObject init](&v11, sel_init);
  v3 = v2;
  if (!v2
    || -[VCRateControlSmartBrake setupModel](v2, "setupModel")
    || -[VCRateControlSmartBrake bindInputBuffers](v3, "bindInputBuffers")
    || -[VCRateControlSmartBrake bindOutputBuffers](v3, "bindOutputBuffers")
    || -[VCRateControlSmartBrake bindLSTMBuffers](v3, "bindLSTMBuffers"))
  {
LABEL_18:

    return 0;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v5 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCRateControlSmartBrake.compilationQueue", 0, CustomRootQueue);
  v3->_compilationQueue = (OS_dispatch_queue *)v5;
  if (!v5)
  {
    if ((VCRateControlSmartBrake *)objc_opt_class() == v3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCRateControlSmartBrake init].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCRateControlSmartBrake performSelector:](v3, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v13 = v7;
          v14 = 2080;
          v15 = "-[VCRateControlSmartBrake init]";
          v16 = 1024;
          v17 = 172;
          v18 = 2112;
          v19 = v6;
          v20 = 2048;
          v21 = v3;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to initialize asynchronous compilation dispatch queue", buf, 0x30u);
        }
      }
    }
    goto LABEL_18;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__VCRateControlSmartBrake_init__block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = v3;
  dispatch_async(v5, block);
  return v3;
}

uint64_t __31__VCRateControlSmartBrake_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "compileModel");
}

- (VCRateControlSmartBrake)initWithCompletionHandler:(id)a3
{
  self->_completionHandler = (id)objc_msgSend(a3, "copy");
  return -[VCRateControlSmartBrake init](self, "init");
}

- (void)dealloc
{
  NSObject *compilationQueue;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  free(self->_dataLSTM);
  compilationQueue = self->_compilationQueue;
  if (compilationQueue)
    dispatch_release(compilationQueue);

  espresso_plan_destroy();
  espresso_context_destroy();
  v4.receiver = self;
  v4.super_class = (Class)VCRateControlSmartBrake;
  -[VCObject dealloc](&v4, sel_dealloc);
}

- (int)setupModel
{
  void *context;
  void *plan;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  VCRateControlSmartBrake *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  context = (void *)espresso_create_context();
  self->_context = context;
  if (!context)
  {
    if ((VCRateControlSmartBrake *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCRateControlSmartBrake setupModel].cold.1();
      }
      return -1;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = (const __CFString *)-[VCRateControlSmartBrake performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v21 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return -1;
    v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return -1;
    v33 = 136316162;
    v34 = v25;
    v35 = 2080;
    v36 = "-[VCRateControlSmartBrake setupModel]";
    v37 = 1024;
    v38 = 212;
    v39 = 2112;
    v40 = v21;
    v41 = 2048;
    v42 = self;
    v27 = " [%s] %s:%d %@(%p) Unable to initialize espresso context";
    goto LABEL_83;
  }
  plan = (void *)espresso_create_plan();
  self->_plan = plan;
  if (!plan)
  {
    if ((VCRateControlSmartBrake *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCRateControlSmartBrake setupModel].cold.2();
      }
      return -1;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = (const __CFString *)-[VCRateControlSmartBrake performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v22 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return -1;
    v28 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return -1;
    v33 = 136316162;
    v34 = v28;
    v35 = 2080;
    v36 = "-[VCRateControlSmartBrake setupModel]";
    v37 = 1024;
    v38 = 214;
    v39 = 2112;
    v40 = v22;
    v41 = 2048;
    v42 = self;
    v27 = " [%s] %s:%d %@(%p) Unable to initialize espresso plan";
LABEL_83:
    _os_log_error_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v33, 0x30u);
    return -1;
  }
  v5 = (void *)objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 310);
  if (!v5)
  {
    if ((VCRateControlSmartBrake *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCRateControlSmartBrake setupModel].cold.6();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCRateControlSmartBrake performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v33 = 136316162;
          v34 = v12;
          v35 = 2080;
          v36 = "-[VCRateControlSmartBrake setupModel]";
          v37 = 1024;
          v38 = 226;
          v39 = 2112;
          v40 = v10;
          v41 = 2048;
          v42 = self;
          _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to load Trial client", (uint8_t *)&v33, 0x30u);
        }
      }
    }
    goto LABEL_27;
  }
  v6 = v5;
  v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "levelForFactor:withNamespaceName:", CFSTR("smartBrakeModel"), CFSTR("AVCONFERENCE_NETWORK_SMART_BRAKE")), "directoryValue"), "path");
  if (!v7)
  {
    if ((VCRateControlSmartBrake *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCRateControlSmartBrake setupModel].cold.7();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[VCRateControlSmartBrake performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        v8 = -1;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v33 = 136316418;
          v34 = v14;
          v35 = 2080;
          v36 = "-[VCRateControlSmartBrake setupModel]";
          v37 = 1024;
          v38 = 223;
          v39 = 2112;
          v40 = v11;
          v41 = 2048;
          v42 = self;
          v43 = 1024;
          v44 = -1;
          _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to load Trial client, switch to bundled model instead returnStatus=%d", (uint8_t *)&v33, 0x36u);
        }
        goto LABEL_28;
      }
    }
LABEL_27:
    v8 = -1;
    goto LABEL_28;
  }
  v8 = -[VCRateControlSmartBrake setupNetAndConfigFromPath:](self, "setupNetAndConfigFromPath:", v7);
  if (!v8)
  {
    LOBYTE(v9) = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "levelForFactor:withNamespaceName:", CFSTR("smartBrakeModel"), CFSTR("AVCONFERENCE_NETWORK_SMART_BRAKE")), "metadata"), "valueForKey:", CFSTR("version")), "intValue");
    goto LABEL_39;
  }
LABEL_28:
  if ((VCRateControlSmartBrake *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCRateControlSmartBrake setupModel].cold.5();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = (const __CFString *)-[VCRateControlSmartBrake performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v16 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v33 = 136316418;
        v34 = v17;
        v35 = 2080;
        v36 = "-[VCRateControlSmartBrake setupModel]";
        v37 = 1024;
        v38 = 231;
        v39 = 2112;
        v40 = v16;
        v41 = 2048;
        v42 = self;
        v43 = 1024;
        v44 = v8;
        _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to load Trial model, switch to bundled model instead returnStatus=%d", (uint8_t *)&v33, 0x36u);
      }
    }
  }
  v9 = -[VCRateControlSmartBrake setupNetAndConfigFromPath:](self, "setupNetAndConfigFromPath:", 0);
  if (!v9)
  {
LABEL_39:
    self->_config.trialVersion = v9;
    v19 = espresso_plan_build();
    if (!v19)
      return v19;
    if ((VCRateControlSmartBrake *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCRateControlSmartBrake setupModel].cold.3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v23 = (const __CFString *)-[VCRateControlSmartBrake performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v23 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v29 = VRTraceErrorLogLevelToCSTR();
        v30 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v33 = 136316418;
          v34 = v29;
          v35 = 2080;
          v36 = "-[VCRateControlSmartBrake setupModel]";
          v37 = 1024;
          v38 = 242;
          v39 = 2112;
          v40 = v23;
          v41 = 2048;
          v42 = self;
          v43 = 1024;
          v44 = v19;
          v31 = " [%s] %s:%d %@(%p) Unable to build espresso plan, returnStatus=%d";
LABEL_81:
          _os_log_error_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_ERROR, v31, (uint8_t *)&v33, 0x36u);
          return v19;
        }
      }
    }
    return v19;
  }
  v19 = v9;
  if ((VCRateControlSmartBrake *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCRateControlSmartBrake setupModel].cold.4();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v24 = (const __CFString *)-[VCRateControlSmartBrake performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v24 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v32 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v33 = 136316418;
        v34 = v32;
        v35 = 2080;
        v36 = "-[VCRateControlSmartBrake setupModel]";
        v37 = 1024;
        v38 = 234;
        v39 = 2112;
        v40 = v24;
        v41 = 2048;
        v42 = self;
        v43 = 1024;
        v44 = v19;
        v31 = " [%s] %s:%d %@(%p) Unable to load Bundled model returnStatus=%d";
        goto LABEL_81;
      }
    }
  }
  return v19;
}

- (int)setupNetAndConfigFromPath:(id)a3
{
  id v3;
  uint64_t v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  int v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  VCRateControlSmartBrake *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v3 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  if (!a3)
    v3 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", CFSTR("smartBrakeModel"), 0);
  v5 = objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("params.plist"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v5);
  if (!v6)
  {
    if ((VCRateControlSmartBrake *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCRateControlSmartBrake setupNetAndConfigFromPath:].cold.1();
      }
      return -2;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = (const __CFString *)-[VCRateControlSmartBrake performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v18 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return -2;
    v19 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return -2;
    v22 = 136316418;
    v23 = v19;
    v24 = 2080;
    v25 = "-[VCRateControlSmartBrake setupNetAndConfigFromPath:]";
    v26 = 1024;
    v27 = 258;
    v28 = 2112;
    v29 = v18;
    v30 = 2048;
    v31 = self;
    v32 = 2112;
    v33 = v5;
    v17 = " [%s] %s:%d %@(%p) Unable to load config file from configPath=%@";
    goto LABEL_23;
  }
  v7 = v6;
  objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("probabilityThresholdOn")), "floatValue");
  self->_config.thresholdOn = v8;
  objc_msgSend((id)objc_msgSend(v7, "objectForKey:", CFSTR("probabilityThresholdOff")), "floatValue");
  self->_config.thresholdOff = v9;
  self->_config.nBandwidthSigmas = (float)(int)objc_msgSend((id)objc_msgSend(v7, "objectForKey:", CFSTR("nBandwidthSigmas")), "intValue");

  if (self->_config.thresholdOff == 0.0 || self->_config.thresholdOn == 0.0 || self->_config.nBandwidthSigmas == 0.0)
  {
    if ((VCRateControlSmartBrake *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCRateControlSmartBrake setupNetAndConfigFromPath:].cold.2();
      }
      return -2;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCRateControlSmartBrake performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return -2;
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return -2;
    v22 = 136316418;
    v23 = v14;
    v24 = 2080;
    v25 = "-[VCRateControlSmartBrake setupNetAndConfigFromPath:]";
    v26 = 1024;
    v27 = 265;
    v28 = 2112;
    v29 = v13;
    v30 = 2048;
    v31 = self;
    v32 = 2112;
    v33 = v5;
    v17 = " [%s] %s:%d %@(%p) Unable to format model config file from configPath=%@";
LABEL_23:
    _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v22, 0x3Au);
    return -2;
  }
  v10 = (void *)objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("model.espresso.net"));
  objc_msgSend(v10, "UTF8String");
  v11 = espresso_plan_add_network();
  if (v11)
  {
    if ((VCRateControlSmartBrake *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCRateControlSmartBrake setupNetAndConfigFromPath:].cold.3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)-[VCRateControlSmartBrake performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v22 = 136316418;
          v23 = v20;
          v24 = 2080;
          v25 = "-[VCRateControlSmartBrake setupNetAndConfigFromPath:]";
          v26 = 1024;
          v27 = 270;
          v28 = 2112;
          v29 = v12;
          v30 = 2048;
          v31 = self;
          v32 = 2112;
          v33 = (uint64_t)v10;
          _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to format load espresso net file from netPath=%@", (uint8_t *)&v22, 0x3Au);
        }
      }
    }
  }
  return v11;
}

- (int)bindInputBuffers
{
  tagVCRateControlSmartBrakeInputBuffers *p_inputBuffers;
  tagVCRateControlSmartBrakeInputTensor *p_inputTensor;
  int result;
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = xmmword_1D910C080;
  p_inputBuffers = &self->_inputBuffers;
  p_inputTensor = &self->_inputTensor;
  result = _VCRateControlSmartBrake_BindEspressoBuffer(self, (uint64_t)&self->_inputBuffers, (const __CFString *)"time", (uint64_t)&v6, 2, (uint64_t)&self->_inputTensor);
  if (!result)
  {
    result = _VCRateControlSmartBrake_BindEspressoBuffer(self, (uint64_t)&p_inputBuffers->bitrate, (const __CFString *)"bitrate", (uint64_t)&v6, 2, (uint64_t)&p_inputTensor->bitrate);
    if (!result)
    {
      result = _VCRateControlSmartBrake_BindEspressoBuffer(self, (uint64_t)&p_inputBuffers->RTT, (const __CFString *)"RTT", (uint64_t)&v6, 2, (uint64_t)&p_inputTensor->RTT);
      if (!result)
      {
        result = _VCRateControlSmartBrake_BindEspressoBuffer(self, (uint64_t)&p_inputBuffers->OWRD, (const __CFString *)"OWRD", (uint64_t)&v6, 2, (uint64_t)&p_inputTensor->OWRD);
        if (!result)
        {
          result = _VCRateControlSmartBrake_BindEspressoBuffer(self, (uint64_t)&p_inputBuffers->APLR, (const __CFString *)"APLR", (uint64_t)&v6, 2, (uint64_t)&p_inputTensor->APLR);
          if (!result)
            return _VCRateControlSmartBrake_BindEspressoBuffer(self, (uint64_t)&p_inputBuffers->VPLR, (const __CFString *)"VPLR", (uint64_t)&v6, 2, (uint64_t)&p_inputTensor->VPLR);
        }
      }
    }
  }
  return result;
}

- (int)bindOutputBuffers
{
  tagVCRateControlSmartBrakeOutputBuffers *p_outputBuffers;
  tagVCRateControlSmartBrakeOutputTensor *p_outputTensor;
  int result;
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = xmmword_1D910C080;
  p_outputBuffers = &self->_outputBuffers;
  p_outputTensor = &self->_outputTensor;
  result = _VCRateControlSmartBrake_BindEspressoBuffer(self, (uint64_t)&self->_outputBuffers, (const __CFString *)"networkCongestionProbability", (uint64_t)&v6, 2, (uint64_t)&self->_outputTensor);
  if (!result)
  {
    result = _VCRateControlSmartBrake_BindEspressoBuffer(self, (uint64_t)&p_outputBuffers->bandwidth, (const __CFString *)"bandwidth", (uint64_t)&v6, 2, (uint64_t)&p_outputTensor->bandwidth);
    if (!result)
      return _VCRateControlSmartBrake_BindEspressoBuffer(self, (uint64_t)&p_outputBuffers->bandwidthSigma, (const __CFString *)"bandwidthSigma", (uint64_t)&v6, 2, (uint64_t)&p_outputTensor->bandwidthSigma);
  }
  return result;
}

- (int)bindLSTMBuffers
{
  __int128 v3;
  int blob_dimensions;
  uint64_t v5;
  float *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  VCRateControlSmartBrake *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  _OWORD v30[2];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30[0] = v3;
  v30[1] = v3;
  blob_dimensions = espresso_network_query_blob_dimensions();
  if (blob_dimensions)
  {
    v11 = blob_dimensions;
    if ((VCRateControlSmartBrake *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCRateControlSmartBrake bindLSTMBuffers].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCRateControlSmartBrake performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v16 = 136316674;
          v17 = v14;
          v18 = 2080;
          v19 = "-[VCRateControlSmartBrake bindLSTMBuffers]";
          v20 = 1024;
          v21 = 325;
          v22 = 2112;
          v23 = v13;
          v24 = 2048;
          v25 = self;
          v26 = 2080;
          v27 = "LSTMStateIn";
          v28 = 1024;
          v29 = v11;
          _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to read %s buffer shape, returnStatus=%d", (uint8_t *)&v16, 0x40u);
        }
      }
    }
  }
  else
  {
    v5 = *((_QWORD *)&v30[0] + 1) * *(_QWORD *)&v30[0];
    self->_dataLSTMSize = *((_QWORD *)&v30[0] + 1) * *(_QWORD *)&v30[0];
    v6 = (float *)malloc_type_malloc(4 * v5, 0x100004052888210uLL);
    v7 = 0;
    self->_dataLSTM = v6;
    v8 = 3;
    do
    {
      v9 = *((_QWORD *)v30 + v7);
      *((_QWORD *)v30 + v7) = *((_QWORD *)v30 + v8);
      *((_QWORD *)v30 + v8) = v9;
      ++v7;
      --v8;
    }
    while (v7 < v8);
    v10 = _VCRateControlSmartBrake_BindEspressoBuffer(self, (uint64_t)&self->_bufferLSTMStateIn, (const __CFString *)"LSTMStateIn", (uint64_t)v30, 4, (uint64_t)v6);
    if (!v10)
      return _VCRateControlSmartBrake_BindEspressoBuffer(self, (uint64_t)&self->_bufferLSTMStateOut, (const __CFString *)"LSTMStateOut", (uint64_t)v30, 4, (uint64_t)self->_dataLSTM);
    return v10;
  }
  return v11;
}

- (void)compileModel
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t error_info;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  id completionHandler;
  _BYTE v25[22];
  __int16 v26;
  int v27;
  __int16 v28;
  _BYTE v29[10];
  _BYTE v30[10];
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  if (self->_dataLSTMSize)
  {
    v3 = 0;
    do
      self->_dataLSTM[v3++] = 0.0;
    while (v3 < self->_dataLSTMSize);
  }
  self->_isStartTimeSet = 0.0;
  if (espresso_plan_execute_sync())
  {
    error_info = espresso_plan_get_error_info();
    v13 = v12;
    if ((VCRateControlSmartBrake *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_18;
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      *(_DWORD *)v25 = 136316418;
      *(_QWORD *)&v25[4] = v17;
      *(_WORD *)&v25[12] = 2080;
      *(_QWORD *)&v25[14] = "-[VCRateControlSmartBrake compileModel]";
      v26 = 1024;
      v27 = 359;
      v28 = 1024;
      *(_DWORD *)v29 = error_info;
      *(_WORD *)&v29[4] = 1024;
      *(_DWORD *)&v29[6] = HIDWORD(error_info);
      *(_WORD *)v30 = 2080;
      *(_QWORD *)&v30[2] = v13;
      v19 = " [%s] %s:%d Error while executing neural network at compilation planStatus=%d, returnStatus=%d, description=%s";
      v20 = v18;
      v21 = 50;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)-[VCRateControlSmartBrake performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_18;
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      *(_DWORD *)v25 = 136316930;
      *(_QWORD *)&v25[4] = v22;
      *(_WORD *)&v25[12] = 2080;
      *(_QWORD *)&v25[14] = "-[VCRateControlSmartBrake compileModel]";
      v26 = 1024;
      v27 = 359;
      v28 = 2112;
      *(_QWORD *)v29 = v14;
      *(_WORD *)&v29[8] = 2048;
      *(_QWORD *)v30 = self;
      *(_WORD *)&v30[8] = 1024;
      v31 = error_info;
      v32 = 1024;
      v33 = HIDWORD(error_info);
      v34 = 2080;
      v35 = v13;
      v19 = " [%s] %s:%d %@(%p) Error while executing neural network at compilation planStatus=%d, returnStatus=%d, description=%s";
      v20 = v23;
      v21 = 70;
    }
    _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, v19, v25, v21);
LABEL_18:
    v16 = 2;
    goto LABEL_19;
  }
  if (self->_dataLSTMSize)
  {
    v15 = 0;
    do
      self->_dataLSTM[v15++] = 0.0;
    while (v15 < self->_dataLSTMSize);
  }
  self->_isStartTimeSet = 0.0;
  v16 = 1;
LABEL_19:
  self->_compilationStatus = v16;
  completionHandler = self->_completionHandler;
  if (completionHandler)
    (*((void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))completionHandler
     + 2))(completionHandler, v4, v5, v6, v7, v8, v9, v10, *(_QWORD *)v25, *(_QWORD *)&v25[8]);
  kdebug_trace();
}

- (tagVCRateControlSmartBrakeConfig)config
{
  tagVCRateControlSmartBrakeConfig *p_config;
  uint64_t v3;
  uint64_t v4;
  tagVCRateControlSmartBrakeConfig result;

  p_config = &self->_config;
  v3 = *(_QWORD *)&self->_config.thresholdOn;
  v4 = *(_QWORD *)&p_config->nBandwidthSigmas;
  result.nBandwidthSigmas = *(float *)&v4;
  result.trialVersion = BYTE4(v4);
  result.thresholdOn = *(float *)&v3;
  result.thresholdOff = *((float *)&v3 + 1);
  return result;
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
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to initialize asynchronous compilation dispatch queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupModel
{
  __int16 v0;
  os_log_t v1;
  uint8_t v2[24];
  int v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  v3 = 223;
  v4 = v0;
  v5 = -1;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unable to load Trial client, switch to bundled model instead returnStatus=%d", v2, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)setupNetAndConfigFromPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to load config file from configPath=%@");
  OUTLINED_FUNCTION_3();
}

- (void)setupNetAndConfigFromPath:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to format model config file from configPath=%@");
  OUTLINED_FUNCTION_3();
}

- (void)setupNetAndConfigFromPath:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to format load espresso net file from netPath=%@");
  OUTLINED_FUNCTION_3();
}

- (void)bindLSTMBuffers
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
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "-[VCRateControlSmartBrake bindLSTMBuffers]";
  v6 = 1024;
  v7 = 325;
  v8 = v0;
  v9 = "LSTMStateIn";
  v10 = 1024;
  v11 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unable to read %s buffer shape, returnStatus=%d", v3, 0x2Cu);
}

@end
