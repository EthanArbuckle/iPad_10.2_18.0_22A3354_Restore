@implementation CSStateCapture

- (CSStateCapture)initWithName:(id)a3
{
  CSStateCapture *v4;
  objc_super v6;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v6.receiver = self;
    v6.super_class = (Class)CSStateCapture;
    self = -[CSStateCapture init](&v6, sel_init);
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[CSStateCapture unregisterHandlerforStateCapture](self, "unregisterHandlerforStateCapture");
  v3.receiver = self;
  v3.super_class = (Class)CSStateCapture;
  -[CSStateCapture dealloc](&v3, sel_dealloc);
}

- (void)registerHandlerforStateCapture
{
  NSObject *v3;
  id v4;
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSStateCapture registerHandlerforStateCapture]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Registering state capture handler", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v4 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v5, (id *)buf);
  -[CSStateCapture setHandle:](self, "setHandle:", os_state_add_handler());

  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

- (void)unregisterHandlerforStateCapture
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSStateCapture unregisterHandlerforStateCapture]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Removing state capture handler", (uint8_t *)&v4, 0xCu);
  }
  if (-[CSStateCapture handle](self, "handle"))
  {
    -[CSStateCapture handle](self, "handle");
    os_state_remove_handler();
  }
}

- (os_state_data_s)_stateCapture
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void (**v6)(void);
  NSObject *v7;
  void *v8;
  void *v9;
  os_state_data_s *v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[CSStateCapture _stateCapture]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Starting state capture", (uint8_t *)&v12, 0xCu);
  }
  -[CSStateCapture stateCaptureBlock](self, "stateCaptureBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
    {
      v12 = 136315138;
      v13 = "-[CSStateCapture _stateCapture]";
      _os_log_debug_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEBUG, "%s Running capture block", (uint8_t *)&v12, 0xCu);
    }
    -[CSStateCapture stateCaptureBlock](self, "stateCaptureBlock");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[CSStateCapture _stateCapture]";
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Finished capturing state", (uint8_t *)&v12, 0xCu);
  }
  objc_msgSend(v4, "stateData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stateDataTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CSStateCapture stateDataForDictionary:title:](self, "stateDataForDictionary:title:", v8, v9);

  return v10;
}

- (os_state_data_s)stateDataForDictionary:(id)a3 title:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  os_state_data_s *v11;
  size_t v12;
  os_state_data_s *v13;
  void *v14;
  void *v15;
  id v16;
  const void *v17;
  unint64_t v18;
  size_t v19;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "-[CSStateCapture stateDataForDictionary:title:]";
    v24 = 2112;
    v25 = v6;
    v26 = 2112;
    v27 = v5;
    _os_log_debug_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEBUG, "%s Persisting the state for %@ data: \n %@", buf, 0x20u);
    if (v5)
      goto LABEL_3;
LABEL_16:
    v11 = 0;
    goto LABEL_17;
  }
  if (!v5)
    goto LABEL_16;
LABEL_3:
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 200, 0, &v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v21;
  if (v9)
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[CSStateCapture stateDataForDictionary:title:]";
      v24 = 2112;
      v25 = v9;
      _os_log_error_impl(&dword_1B502E000, v10, OS_LOG_TYPE_ERROR, "%s Error serializing dictionary for State Capture: %@", buf, 0x16u);
    }
    v11 = 0;
  }
  else
  {
    v12 = objc_msgSend(v8, "length");
    v13 = (os_state_data_s *)malloc_type_calloc(1uLL, v12 + 200, 0x2E596361uLL);
    v11 = v13;
    if (v13)
    {
      v13->var0 = 1;
      v13->var1.var1 = v12;
      objc_msgSend(v6, "dataUsingEncoding:", 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = objc_retainAutorelease(v14);
        v17 = (const void *)objc_msgSend(v16, "bytes");
        v18 = objc_msgSend(v16, "length");
        if (v18 >= 0x3F)
          v19 = 63;
        else
          v19 = v18;
        memcpy(v11->var3, v17, v19);
      }
      memcpy(v11->var4, (const void *)objc_msgSend(objc_retainAutorelease(v8), "bytes"), v12);

    }
  }

LABEL_17:
  return v11;
}

- (id)stateCaptureBlock
{
  return self->_stateCaptureBlock;
}

- (void)setStateCaptureBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)handle
{
  return self->_handle;
}

- (void)setHandle:(unint64_t)a3
{
  self->_handle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateCaptureBlock, 0);
}

uint64_t __48__CSStateCapture_registerHandlerforStateCapture__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v3;

  if (*(_DWORD *)(a2 + 16) != 3)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "_stateCapture");

  return v3;
}

@end
