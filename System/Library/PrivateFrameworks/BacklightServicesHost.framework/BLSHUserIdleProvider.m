@implementation BLSHUserIdleProvider

- (BLSHUserIdleProvider)init
{
  BLSHUserIdleProvider *v2;
  BLSHUserIdleProvider *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *attentionLostTimeoutDictionary;
  AWAttentionAwarenessClient *v6;
  AWAttentionAwarenessClient *attentionAwarenessClient;
  AWAttentionAwarenessConfiguration *v8;
  AWAttentionAwarenessConfiguration *attentionAwarenessConfiguration;
  AWAttentionAwarenessClient *v10;
  uint64_t v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BLSHUserIdleProvider;
  v2 = -[BLSHUserIdleProvider init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_shouldNotifyOfUnidleChanged = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    attentionLostTimeoutDictionary = v3->_attentionLostTimeoutDictionary;
    v3->_attentionLostTimeoutDictionary = v4;

    v6 = (AWAttentionAwarenessClient *)objc_alloc_init(MEMORY[0x24BE09590]);
    attentionAwarenessClient = v3->_attentionAwarenessClient;
    v3->_attentionAwarenessClient = v6;

    v8 = (AWAttentionAwarenessConfiguration *)objc_alloc_init(MEMORY[0x24BE09598]);
    attentionAwarenessConfiguration = v3->_attentionAwarenessConfiguration;
    v3->_attentionAwarenessConfiguration = v8;

    -[AWAttentionAwarenessConfiguration setIdentifier:](v3->_attentionAwarenessConfiguration, "setIdentifier:", CFSTR("com.apple.Carousel.BacklightServices.UserIdleProvider"));
    -[AWAttentionAwarenessConfiguration setEventMask:](v3->_attentionAwarenessConfiguration, "setEventMask:", 4095);
    objc_initWeak(&location, v3);
    v10 = v3->_attentionAwarenessClient;
    v11 = MEMORY[0x24BDAC9B8];
    v12 = MEMORY[0x24BDAC9B8];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __28__BLSHUserIdleProvider_init__block_invoke;
    v14[3] = &unk_24D1BE148;
    objc_copyWeak(&v15, &location);
    -[AWAttentionAwarenessClient setEventHandlerWithQueue:block:](v10, "setEventHandlerWithQueue:block:", v11, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __28__BLSHUserIdleProvider_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "eventMask") & 1) != 0)
  {
    objc_msgSend(v3, "associatedObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("zeroTimeout")))
    {
      bls_backlight_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __28__BLSHUserIdleProvider_init__block_invoke_cold_1(v8);

    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("idleTimeout")))
    {
      bls_backlight_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2145AC000, v9, OS_LOG_TYPE_DEFAULT, "BLSHUserIdleProvider received user idle", buf, 2u);
      }

      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "idleProviderDidIdle:", WeakRetained);
    }

  }
  else if (objc_msgSend(WeakRetained, "shouldNotifyOfUnidle"))
  {
    bls_backlight_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_2145AC000, v6, OS_LOG_TYPE_DEFAULT, "BLSHUserIdleProvider received user unidle", v10, 2u);
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "idleProviderDidUnidle:", WeakRetained);
  }

}

- (void)setIdleTimeout:(double)a3 shouldReset:(BOOL)a4
{
  BSDispatchMain();
}

uint64_t __51__BLSHUserIdleProvider_setIdleTimeout_shouldReset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setIdleTimeout:shouldReset:", *(unsigned __int8 *)(a1 + 48), *(double *)(a1 + 40));
}

- (void)setShouldNotifyOfUnidle:(BOOL)a3
{
  BSDispatchMain();
}

uint64_t __48__BLSHUserIdleProvider_setShouldNotifyOfUnidle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setShouldNotifyOfUnidle:", *(unsigned __int8 *)(a1 + 40));
}

- (void)resume
{
  BSDispatchMain();
}

uint64_t __30__BLSHUserIdleProvider_resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resume");
}

- (void)pause
{
  BSDispatchMain();
}

uint64_t __29__BLSHUserIdleProvider_pause__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pause");
}

- (void)reset
{
  BSDispatchMain();
}

uint64_t __29__BLSHUserIdleProvider_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
}

- (void)invalidate
{
  BSDispatchMain();
}

uint64_t __34__BLSHUserIdleProvider_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_setIdleTimeout:(double)a3 shouldReset:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSMutableDictionary *attentionLostTimeoutDictionary;
  id v11;
  void *v12;
  AWAttentionAwarenessConfiguration *attentionAwarenessConfiguration;
  void *v14;
  AWAttentionAwarenessClient *attentionAwarenessClient;
  AWAttentionAwarenessConfiguration *v16;
  id v17;
  NSObject *v18;
  double idleTimeout;
  _BOOL4 shouldNotifyOfUnidleChanged;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  bls_backlight_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    idleTimeout = self->_idleTimeout;
    shouldNotifyOfUnidleChanged = self->_shouldNotifyOfUnidleChanged;
    *(_DWORD *)buf = 134218752;
    v25 = a3;
    v26 = 2048;
    v27 = idleTimeout;
    v28 = 1024;
    v29 = v4;
    v30 = 1024;
    v31 = shouldNotifyOfUnidleChanged;
    _os_log_debug_impl(&dword_2145AC000, v7, OS_LOG_TYPE_DEBUG, "BLSHUserIdleProvider _setIdleTimeout %lf currentTimeout %lf shouldReset=%{BOOL}u _shouldNotifyOfUnidleChanged=%{BOOL}u", buf, 0x22u);
  }

  if (vabdd_f64(a3, self->_idleTimeout) > 2.22044605e-16 || self->_shouldNotifyOfUnidleChanged)
  {
    bls_backlight_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v25 = a3;
      v26 = 1024;
      LODWORD(v27) = v4;
      _os_log_impl(&dword_2145AC000, v8, OS_LOG_TYPE_DEFAULT, "BLSHUserIdleProvider updating timeout %lf shouldReset=%{BOOL}u", buf, 0x12u);
    }

    self->_shouldNotifyOfUnidleChanged = 0;
    self->_idleTimeout = a3;
    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    attentionLostTimeoutDictionary = self->_attentionLostTimeoutDictionary;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __52__BLSHUserIdleProvider__setIdleTimeout_shouldReset___block_invoke;
    v22[3] = &unk_24D1BE198;
    v11 = v9;
    v23 = v11;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](attentionLostTimeoutDictionary, "enumerateKeysAndObjectsUsingBlock:", v22);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", CFSTR("idleTimeout"), v12);

    attentionAwarenessConfiguration = self->_attentionAwarenessConfiguration;
    v14 = (void *)objc_msgSend(v11, "copy");
    -[AWAttentionAwarenessConfiguration setAttentionLostTimeoutDictionary:](attentionAwarenessConfiguration, "setAttentionLostTimeoutDictionary:", v14);

    attentionAwarenessClient = self->_attentionAwarenessClient;
    v16 = self->_attentionAwarenessConfiguration;
    v21 = 0;
    -[AWAttentionAwarenessClient setConfiguration:shouldReset:error:](attentionAwarenessClient, "setConfiguration:shouldReset:error:", v16, v4, &v21);
    v17 = v21;
    if (v17)
    {
      bls_backlight_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[BLSHUserIdleProvider _setIdleTimeout:shouldReset:].cold.1();

    }
  }
  else if (v4)
  {
    -[BLSHUserIdleProvider _reset](self, "_reset");
  }
}

void __52__BLSHUserIdleProvider__setIdleTimeout_shouldReset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("idleTimeout")) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);

}

- (void)_setShouldNotifyOfUnidle:(BOOL)a3
{
  NSMutableDictionary *attentionLostTimeoutDictionary;
  NSMutableDictionary *v5;
  id v6;

  if (self->_shouldNotifyOfUnidle != a3)
  {
    self->_shouldNotifyOfUnidleChanged = 1;
    self->_shouldNotifyOfUnidle = a3;
    attentionLostTimeoutDictionary = self->_attentionLostTimeoutDictionary;
    if (a3)
    {
      -[NSMutableDictionary setObject:forKey:](attentionLostTimeoutDictionary, "setObject:forKey:", CFSTR("zeroTimeout"), &unk_24D1DD478);
    }
    else
    {
      -[NSMutableDictionary removeAllObjects](attentionLostTimeoutDictionary, "removeAllObjects");
      v5 = self->_attentionLostTimeoutDictionary;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_idleTimeout);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", CFSTR("idleTimeout"), v6);

    }
  }
}

- (void)_pause
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_0_7(&dword_2145AC000, v0, v1, "error starting up attention awareness client %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_resume
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_0_7(&dword_2145AC000, v0, v1, "error resuming attention awareness client %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_reset
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_0_7(&dword_2145AC000, v0, v1, "could not reset user idle provider error=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_invalidate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_0_7(&dword_2145AC000, v0, v1, "error invalidating attention awareness client %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (BLSHUserIdleProvidingDelegate)delegate
{
  return (BLSHUserIdleProvidingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldNotifyOfUnidle
{
  return self->_shouldNotifyOfUnidle;
}

- (double)idleTimeout
{
  return self->_idleTimeout;
}

- (AWAttentionAwarenessClient)attentionAwarenessClient
{
  return self->_attentionAwarenessClient;
}

- (void)setAttentionAwarenessClient:(id)a3
{
  objc_storeStrong((id *)&self->_attentionAwarenessClient, a3);
}

- (AWAttentionAwarenessConfiguration)attentionAwarenessConfiguration
{
  return self->_attentionAwarenessConfiguration;
}

- (void)setAttentionAwarenessConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_attentionAwarenessConfiguration, a3);
}

- (NSMutableDictionary)attentionLostTimeoutDictionary
{
  return self->_attentionLostTimeoutDictionary;
}

- (void)setAttentionLostTimeoutDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_attentionLostTimeoutDictionary, a3);
}

- (BOOL)shouldNotifyOfUnidleChanged
{
  return self->_shouldNotifyOfUnidleChanged;
}

- (void)setShouldNotifyOfUnidleChanged:(BOOL)a3
{
  self->_shouldNotifyOfUnidleChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attentionLostTimeoutDictionary, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessConfiguration, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __28__BLSHUserIdleProvider_init__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2145AC000, log, OS_LOG_TYPE_DEBUG, "ignoring zero timeout idle", v1, 2u);
}

- (void)_setIdleTimeout:shouldReset:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_0_7(&dword_2145AC000, v0, v1, "could not update idle timeout for user idle provider error=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
