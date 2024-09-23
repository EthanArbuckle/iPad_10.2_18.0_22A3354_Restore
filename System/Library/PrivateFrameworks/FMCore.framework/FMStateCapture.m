@implementation FMStateCapture

- (FMStateCapture)init
{
  void *v3;
  FMStateCapture *v4;
  FMStateCapture *v5;
  objc_super v7;

  +[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isInternalBuild"))
  {
    v7.receiver = self;
    v7.super_class = (Class)FMStateCapture;
    self = -[FMStateCapture init](&v7, sel_init);
    v4 = self;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  if (v5)
    -[FMStateCapture registerHandlerforStateCapture](v5, "registerHandlerforStateCapture");
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[FMStateCapture unregisterHandlerforStateCapture](self, "unregisterHandlerforStateCapture");
  v3.receiver = self;
  v3.super_class = (Class)FMStateCapture;
  -[FMStateCapture dealloc](&v3, sel_dealloc);
}

- (void)registerHandlerforStateCapture
{
  NSObject *v3;
  id v4;
  id v5;
  id buf[2];

  LogCategory_Unspecified();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1C9967000, v3, OS_LOG_TYPE_DEFAULT, "FMStateCapture: Registering State Capture Handler.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v4 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v5, buf);
  -[FMStateCapture setHandle:](self, "setHandle:", os_state_add_handler());

  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

uint64_t __48__FMStateCapture_registerHandlerforStateCapture__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_stateCapture");

  return v2;
}

- (void)unregisterHandlerforStateCapture
{
  NSObject *v3;
  int v4;
  unint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  LogCategory_Unspecified();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = -[FMStateCapture handle](self, "handle");
    _os_log_impl(&dword_1C9967000, v3, OS_LOG_TYPE_DEFAULT, "FMStateCapture: Removing State Capture Handler %llu.", (uint8_t *)&v4, 0xCu);
  }

  if (-[FMStateCapture handle](self, "handle"))
  {
    -[FMStateCapture handle](self, "handle");
    os_state_remove_handler();
  }
}

- (os_state_data_s)_stateCapture
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void (**v7)(void);
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  os_state_data_s *v14;
  uint8_t v16[16];
  uint8_t buf[16];

  LogCategory_Unspecified();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9967000, v3, OS_LOG_TYPE_DEFAULT, "FMStateCapture: Starting State Capture...", buf, 2u);
  }

  v4 = (void *)objc_msgSend(&unk_1E82B1430, "mutableCopy");
  -[FMStateCapture stateCaptureBlock](self, "stateCaptureBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    LogCategory_Unspecified();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[FMStateCapture _stateCapture].cold.1(v6);

    -[FMStateCapture stateCaptureBlock](self, "stateCaptureBlock");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValuesForKeysWithDictionary:", v8);

  }
  LogCategory_Unspecified();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_1C9967000, v9, OS_LOG_TYPE_DEFAULT, "FMStateCapture: finished capturing state.", v16, 2u);
  }

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("[%@] state"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[FMStateCapture stateDataForDictionary:title:](self, "stateDataForDictionary:title:", v4, v13);

  return v14;
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
  NSObject *v14;
  NSObject *v15;
  const void *v16;
  unint64_t v17;
  size_t v18;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  LogCategory_Unspecified();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[FMStateCapture stateDataForDictionary:title:].cold.1((uint64_t)v6, (uint64_t)v5, v7);

  if (v5)
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 200, 0, &v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v20;
    if (v9)
    {
      LogCategory_Unspecified();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v9;
        _os_log_impl(&dword_1C9967000, v10, OS_LOG_TYPE_DEFAULT, "Error serializing dictionary for State Capture: %@", buf, 0xCu);
      }
      v11 = 0;
    }
    else
    {
      v12 = objc_msgSend(v8, "length");
      v13 = (os_state_data_s *)malloc_type_calloc(1uLL, v12 + 200, 0x60E97206uLL);
      v11 = v13;
      if (!v13)
      {
LABEL_17:

        goto LABEL_18;
      }
      v13->var0 = 1;
      v13->var1.var1 = v12;
      objc_msgSend(v6, "dataUsingEncoding:", 4);
      v14 = objc_claimAutoreleasedReturnValue();
      v10 = v14;
      if (v14)
      {
        v15 = objc_retainAutorelease(v14);
        v16 = (const void *)-[NSObject bytes](v15, "bytes");
        v17 = -[NSObject length](v15, "length");
        if (v17 >= 0x3F)
          v18 = 63;
        else
          v18 = v17;
        memcpy(v11->var3, v16, v18);
      }
      memcpy(v11->var4, (const void *)objc_msgSend(objc_retainAutorelease(v8), "bytes"), v12);
    }

    goto LABEL_17;
  }
  v11 = 0;
LABEL_18:

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

- (void)_stateCapture
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C9967000, log, OS_LOG_TYPE_DEBUG, "FMStateCapture: running capture block", v1, 2u);
}

- (void)stateDataForDictionary:(os_log_t)log title:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1C9967000, log, OS_LOG_TYPE_DEBUG, "FMStateCapture: Persisting the state for %@ data: \n %@", (uint8_t *)&v3, 0x16u);
}

@end
