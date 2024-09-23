@implementation _FEFocusUpdateThrottle

- (_FEFocusUpdateThrottle)initWithUpdateHandler:(id)a3
{
  id v5;
  _FEFocusUpdateThrottle *v6;
  _FEFocusUpdateThrottle *v7;
  uint64_t v8;
  id updateHandler;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusUpdateThrottle.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateHandler"));

  }
  v12.receiver = self;
  v12.super_class = (Class)_FEFocusUpdateThrottle;
  v6 = -[_FEFocusUpdateThrottle init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_currentTimeout = 0.0166666667;
    v8 = MEMORY[0x2426205A4](v5);
    updateHandler = v7->_updateHandler;
    v7->_updateHandler = (id)v8;

  }
  return v7;
}

- (void)teardown
{
  NSTimer **p_updateTimer;
  id WeakRetained;
  id v5;
  _QWORD *v6;
  _QWORD v7[5];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  p_updateTimer = &self->_updateTimer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_updateTimer);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_updateTimer);
    objc_msgSend(v5, "invalidate");

    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __34___FEFocusUpdateThrottle_teardown__block_invoke;
    v7[3] = &unk_250D3A358;
    v7[4] = self;
    v6 = v7;
    if (!qword_256BAFCD8)
    {
      v8 = xmmword_250D3A398;
      v9 = 0;
      qword_256BAFCD8 = _sl_dlopen();
    }
    if (qword_256BAFCD8)
    {
      if (qword_256BAFCD0 != -1)
        dispatch_once(&qword_256BAFCD0, &__block_literal_global_3);
      objc_msgSend((id)_MergedGlobals_6, "_performBlockAfterCATransactionCommits:", v6);
    }
    else
    {
      dispatch_async(MEMORY[0x24BDAC9B8], v6);
    }

  }
}

- (void)scheduleProgrammaticFocusUpdate
{
  double lastUpdate;
  double currentTimeout;
  double Current;
  double v6;
  NSObject *v7;
  void *v8;
  NSTimer **p_updateTimer;
  _QWORD *WeakRetained;
  _QWORD v11[5];
  uint8_t buf[16];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!self->_updateIsScheduled)
  {
    self->_updateIsScheduled = 1;
    lastUpdate = self->_lastUpdate;
    currentTimeout = self->_currentTimeout;
    Current = CFAbsoluteTimeGetCurrent();
    if (self->_nilUpdateCount && (v6 = lastUpdate + currentTimeout - Current, v6 >= 0.0166666667))
    {
      logger();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&buf[4] = v6;
        _os_log_debug_impl(&dword_23C48C000, v7, OS_LOG_TYPE_DEBUG, "Delaying focus update for %.2g seconds due to too many failed focus updates.", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__performScheduledUpdate, 0, 0, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      p_updateTimer = &self->_updateTimer;
      objc_storeWeak((id *)p_updateTimer, v8);

      WeakRetained = objc_loadWeakRetained((id *)p_updateTimer);
      objc_msgSend(WeakRetained, "setTolerance:", 0.0166666667);
    }
    else
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __57___FEFocusUpdateThrottle_scheduleProgrammaticFocusUpdate__block_invoke;
      v11[3] = &unk_250D3A358;
      v11[4] = self;
      WeakRetained = v11;
      if (!qword_256BAFCD8)
      {
        *(_OWORD *)buf = xmmword_250D3A398;
        v13 = 0;
        qword_256BAFCD8 = _sl_dlopen();
      }
      if (qword_256BAFCD8)
      {
        if (qword_256BAFCD0 != -1)
          dispatch_once(&qword_256BAFCD0, &__block_literal_global_3);
        objc_msgSend((id)_MergedGlobals_6, "_performBlockAfterCATransactionCommits:", WeakRetained);
      }
      else
      {
        dispatch_async(MEMORY[0x24BDAC9B8], WeakRetained);
      }
    }

  }
}

- (void)didCreateProgrammaticFocusUpdateContext:(id)a3
{
  id v4;
  void *v5;
  double currentTimeout;
  NSObject *v7;
  double v8;
  unint64_t nilUpdateCount;
  int v10;
  double v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  self->_lastUpdate = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v4, "nextFocusedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self->_nilUpdateCount = 0;
    self->_currentTimeout = 0.0166666667;
  }
  else
  {
    ++self->_nilUpdateCount;
    currentTimeout = self->_currentTimeout;
    if (currentTimeout < 1.0)
    {
      self->_currentTimeout = fmin(currentTimeout * 1.3, 1.0);
      logger();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = self->_currentTimeout;
        nilUpdateCount = self->_nilUpdateCount;
        v10 = 134218240;
        v11 = v8;
        v12 = 2048;
        v13 = nilUpdateCount;
        _os_log_debug_impl(&dword_23C48C000, v7, OS_LOG_TYPE_DEBUG, "Encountered a programmatic focus update to a nil environment. Increasing cooldown period for programmatic focus updates to %.2g due to %lu failed focus updates.", (uint8_t *)&v10, 0x16u);
      }

    }
  }
}

- (void)_performScheduledUpdate
{
  id WeakRetained;

  if (self->_updateIsScheduled)
  {
    self->_updateIsScheduled = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_updateTimer);
    objc_msgSend(WeakRetained, "invalidate");

    (*((void (**)(void))self->_updateHandler + 2))();
  }
}

- (void)reset
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD v4[5];
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  self->_nilUpdateCount = 0;
  v2 = MEMORY[0x24BDAC760];
  self->_currentTimeout = 0.0166666667;
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __31___FEFocusUpdateThrottle_reset__block_invoke;
  v4[3] = &unk_250D3A358;
  v4[4] = self;
  v3 = v4;
  if (!qword_256BAFCD8)
  {
    v5 = xmmword_250D3A398;
    v6 = 0;
    qword_256BAFCD8 = _sl_dlopen();
  }
  if (qword_256BAFCD8)
  {
    if (qword_256BAFCD0 != -1)
      dispatch_once(&qword_256BAFCD0, &__block_literal_global_3);
    objc_msgSend((id)_MergedGlobals_6, "_performBlockAfterCATransactionCommits:", v3);
  }
  else
  {
    dispatch_async(MEMORY[0x24BDAC9B8], v3);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_destroyWeak((id *)&self->_updateTimer);
}

@end
