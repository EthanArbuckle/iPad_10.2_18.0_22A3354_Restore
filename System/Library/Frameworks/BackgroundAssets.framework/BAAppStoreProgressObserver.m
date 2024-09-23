@implementation BAAppStoreProgressObserver

+ (id)new
{
  return 0;
}

- (BAAppStoreProgressObserver)init
{

  return 0;
}

- (_BYTE)_initPrivately
{
  _BYTE *v1;
  _BYTE *v2;
  BAAppStoreProgressConfiguration *v3;
  void *v4;
  BAAgentSystemProxy *v5;
  void *v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)BAAppStoreProgressObserver;
  v1 = objc_msgSendSuper2(&v8, sel_init);
  v2 = v1;
  if (v1)
  {
    v1[12] = 1;
    *((_DWORD *)v1 + 2) = 0;
    v3 = objc_alloc_init(BAAppStoreProgressConfiguration);
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

    v5 = objc_alloc_init(BAAgentSystemProxy);
    v6 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v5;

  }
  return v2;
}

+ (id)progressObserverWithConfiguration:(id)a3
{
  id v3;
  _BYTE *inited;

  v3 = a3;
  inited = -[BAAppStoreProgressObserver _initPrivately]([BAAppStoreProgressObserver alloc]);
  objc_msgSend(inited, "updateConfiguration:", v3);

  return inited;
}

- (void)updateConfiguration:(id)a3
{
  void (**v4)(id, void *);
  os_unfair_lock_s *p_lock;
  BAAppStoreProgressConfiguration *v6;
  BAAppStoreProgressConfiguration *v7;
  BAAgentSystemProxy *systemProxy;
  BAAgentSystemProxy *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;

  v4 = (void (**)(id, void *))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_valid)
  {
    v13 = (void *)objc_opt_new();
    v4[2](v4, v13);

    goto LABEL_9;
  }
  self->_configuring = 1;
  v4[2](v4, self);
  self->_configuring = 0;
  v6 = self->_configuration;
  if (!v6)
  {
LABEL_9:
    os_unfair_lock_unlock(p_lock);
    goto LABEL_10;
  }
  v7 = v6;
  self->_observing = 1;
  os_unfair_lock_unlock(&self->_lock);
  systemProxy = self->_systemProxy;
  v14 = 0;
  v9 = systemProxy;
  v10 = -[BAAgentSystemProxy updateAppStoreProgressObservationWithConfiguration:error:](v9, "updateAppStoreProgressObservationWithConfiguration:error:", v7, &v14);
  v11 = v14;

  if (!v10)
  {
    BAClientConnectionLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[BAAppStoreProgressObserver updateConfiguration:].cold.1((uint64_t)v7, (uint64_t)v11, v12);

    os_unfair_lock_lock(&self->_lock);
    self->_observing = 0;
    os_unfair_lock_unlock(&self->_lock);
  }

LABEL_10:
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_valid)
  {
    self->_valid = 0;
    -[BAAgentSystemProxy invalidate](self->_systemProxy, "invalidate");
    -[BAAppStoreProgressObserver setSystemProxy:]((uint64_t)self, 0);
    self->_observing = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)setSystemProxy:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setAppBundleIdentifiers:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_configuring)
  {
    -[BAAppStoreProgressConfiguration setAppBundleIdentifiers:](self->_configuration, "setAppBundleIdentifiers:", v12);

  }
  else
  {
    v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v4)
      -[BAAppStoreProgressObserver setAppBundleIdentifiers:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Cannot invoke setAppBundleIdentifiers: outside of upda"
                               "teConfiguration:";
    __break(1u);
  }
}

- (void)setUpdateHandler:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_configuring)
  {
    -[BAAppStoreProgressConfiguration setUpdateHandler:](self->_configuration, "setUpdateHandler:", v12);

  }
  else
  {
    v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v4)
      -[BAAppStoreProgressObserver setUpdateHandler:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Cannot invoke setUpdateHandler: outside of updateConfiguration:";
    __break(1u);
  }
}

- (void)setHandlerQueue:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_configuring)
  {
    -[BAAppStoreProgressConfiguration setHandlerQueue:](self->_configuration, "setHandlerQueue:", v12);

  }
  else
  {
    v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v4)
      -[BAAppStoreProgressObserver setHandlerQueue:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Cannot invoke setHandlerQueue: outside of updateConfiguration:";
    __break(1u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemProxy, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)updateConfiguration:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_21ABD8000, log, OS_LOG_TYPE_ERROR, "BAAppStoreProgressObserver: Failed to start progress observer. Config: %{public}@ Error: %{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_4();
}

- (void)setAppBundleIdentifiers:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)setUpdateHandler:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)setHandlerQueue:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

@end
