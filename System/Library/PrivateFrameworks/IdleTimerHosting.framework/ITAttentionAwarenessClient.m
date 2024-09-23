@implementation ITAttentionAwarenessClient

- (ITAttentionAwarenessClient)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ITAttentionAwarenessClient.m"), 25, CFSTR("wrong initializer"));

  return 0;
}

- (ITAttentionAwarenessClient)initWithCalloutQueue:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  ITAttentionAwarenessClient *v7;

  v4 = (objc_class *)MEMORY[0x24BE09590];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = -[ITAttentionAwarenessClient _initWithCalloutQueue:attentionAwarenessClient:](self, "_initWithCalloutQueue:attentionAwarenessClient:", v5, v6);

  return v7;
}

- (id)_initWithCalloutQueue:(id)a3 attentionAwarenessClient:(id)a4
{
  id v6;
  id v7;
  ITAttentionAwarenessClient *v8;
  ITAttentionAwarenessClient *v9;
  AWAttentionAwarenessClient *access_attentionAwarenessClient;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ITAttentionAwarenessClient;
  v8 = -[ITAttentionAwarenessClient init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_accessLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v8->_access_attentionAwarenessClient, a4);
    objc_initWeak(&location, v9);
    access_attentionAwarenessClient = v9->_access_attentionAwarenessClient;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __77__ITAttentionAwarenessClient__initWithCalloutQueue_attentionAwarenessClient___block_invoke;
    v12[3] = &unk_24D4A2268;
    objc_copyWeak(&v13, &location);
    -[AWAttentionAwarenessClient setEventHandlerWithQueue:block:](access_attentionAwarenessClient, "setEventHandlerWithQueue:block:", v6, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __77__ITAttentionAwarenessClient__initWithCalloutQueue_attentionAwarenessClient___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleAttentionAwarenessEvent:", v5);

}

- (BOOL)isEnabled
{
  ITAttentionAwarenessClient *v2;
  os_unfair_lock_s *p_accessLock;

  v2 = self;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  LOBYTE(v2) = v2->_access_enabled;
  os_unfair_lock_unlock(p_accessLock);
  return (char)v2;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_accessLock;

  v3 = a3;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  if (self->_access_enabled != v3)
  {
    self->_access_enabled = v3;
    if (v3)
      -[ITAttentionAwarenessClient _access_resume](self, "_access_resume");
    else
      -[ITAttentionAwarenessClient _access_suspend](self, "_access_suspend");
  }
  os_unfair_lock_unlock(p_accessLock);
}

- (AWAttentionAwarenessConfiguration)configuration
{
  os_unfair_lock_s *p_accessLock;
  void *v4;
  void *v5;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  -[AWAttentionAwarenessClient configuration](self->_access_attentionAwarenessClient, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_accessLock);
  return (AWAttentionAwarenessConfiguration *)v5;
}

- (void)setConfiguration:(id)a3
{
  -[ITAttentionAwarenessClient setConfiguration:shouldReset:](self, "setConfiguration:shouldReset:", a3, 0);
}

- (void)setConfiguration:(id)a3 shouldReset:(BOOL)a4
{
  _BOOL8 v4;
  os_unfair_lock_s *p_accessLock;
  id v7;
  AWAttentionAwarenessClient *access_attentionAwarenessClient;
  void *v9;

  v4 = a4;
  p_accessLock = &self->_accessLock;
  v7 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  access_attentionAwarenessClient = self->_access_attentionAwarenessClient;
  v9 = (void *)objc_msgSend(v7, "copy");

  -[AWAttentionAwarenessClient setConfiguration:shouldReset:](access_attentionAwarenessClient, "setConfiguration:shouldReset:", v9, v4);
  os_unfair_lock_unlock(p_accessLock);
}

- (void)_access_resume
{
  void *v3;
  NSObject *v4;
  AWAttentionAwarenessClient *access_attentionAwarenessClient;
  AWAttentionAwarenessClient *v6;
  char v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  AWAttentionAwarenessClient *v11;
  id v12;
  uint8_t buf[4];
  AWAttentionAwarenessClient *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_accessLock);
  -[AWAttentionAwarenessClient configuration](self->_access_attentionAwarenessClient, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ITLogIdleTimer();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    access_attentionAwarenessClient = self->_access_attentionAwarenessClient;
    *(_DWORD *)buf = 138543618;
    v14 = access_attentionAwarenessClient;
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_215E50000, v4, OS_LOG_TYPE_DEFAULT, "attention client RESUME client: %{public}@ with configuration: %{public}@", buf, 0x16u);
  }

  v6 = self->_access_attentionAwarenessClient;
  v12 = 0;
  v7 = -[AWAttentionAwarenessClient resumeWithError:](v6, "resumeWithError:", &v12);
  v8 = v12;
  if ((v7 & 1) == 0)
  {
    ITLogIdleTimer();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (AWAttentionAwarenessClient *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v11;
      v15 = 2114;
      v16 = v3;
      v17 = 2114;
      v18 = v8;
      _os_log_error_impl(&dword_215E50000, v9, OS_LOG_TYPE_ERROR, "%{public}@ - attention client %{public}@ cannot resume; error:%{public}@",
        buf,
        0x20u);

    }
  }

}

- (void)_access_suspend
{
  NSObject *v3;
  AWAttentionAwarenessClient *access_attentionAwarenessClient;
  char v5;
  id v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_accessLock);
  ITLogIdleTimer();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215E50000, v3, OS_LOG_TYPE_DEFAULT, "attention client SUSPEND", buf, 2u);
  }

  access_attentionAwarenessClient = self->_access_attentionAwarenessClient;
  v12 = 0;
  v5 = -[AWAttentionAwarenessClient suspendWithError:](access_attentionAwarenessClient, "suspendWithError:", &v12);
  v6 = v12;
  if ((v5 & 1) == 0)
  {
    -[AWAttentionAwarenessClient configuration](self->_access_attentionAwarenessClient, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ITLogIdleTimer();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v10;
      v15 = 2114;
      v16 = v11;
      v17 = 2114;
      v18 = v6;
      _os_log_error_impl(&dword_215E50000, v8, OS_LOG_TYPE_ERROR, "%{public}@ - attention client %{public}@ cannot suspend; error:%{public}@",
        buf,
        0x20u);

    }
  }

}

- (void)_handleAttentionAwarenessEvent:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  NSObject *v22;
  ITIdleTimeout *v23;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v4, "tag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  if (v10)
  {
    if ((objc_msgSend(v4, "eventMask") & 1) != 0)
    {
      v12 = objc_opt_class();
      v13 = v4;
      if (v12)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
      }
      else
      {
        v14 = 0;
      }
      v15 = v14;

      if (v15)
      {
        objc_msgSend(v15, "attentionLostTimeout");
        v17 = v16;
        objc_msgSend(v15, "associatedObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_opt_class();
        v20 = v18;
        if (v19)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v21 = v20;
          else
            v21 = 0;
        }
        else
        {
          v21 = 0;
        }
        v22 = v21;

        if (v22)
        {
          v23 = -[ITIdleTimeout initWithDuration:identifier:]([ITIdleTimeout alloc], "initWithDuration:identifier:", -[NSObject unsignedIntegerValue](v22, "unsignedIntegerValue"), v17);
          objc_msgSend(WeakRetained, "client:attentionLostTimeoutDidExpire:forContext:", self, v23, v10);
        }
        else
        {
          ITLogIdleTimer();
          v23 = (ITIdleTimeout *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v23->super, OS_LOG_TYPE_FAULT))
            -[ITAttentionAwarenessClient _handleAttentionAwarenessEvent:].cold.3((uint64_t)self, v15, &v23->super);
        }

      }
      else
      {
        ITLogIdleTimer();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[ITAttentionAwarenessClient _handleAttentionAwarenessEvent:].cold.2((uint64_t)self, (uint64_t)v13, v22);
      }

    }
    else
    {
      ITLogIdleTimer();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[ITAttentionAwarenessClient _handleAttentionAwarenessEvent:].cold.1((uint64_t)v4, v11);

      objc_msgSend(WeakRetained, "clientDidReset:forUserAttentionEvent:withContext:", self, v4, v10);
    }
  }

}

- (AWAttentionAwarenessClient)_access_attentionAwarenessClient
{
  return self->_access_attentionAwarenessClient;
}

- (void)set_access_attentionAwarenessClient:(id)a3
{
  objc_storeStrong((id *)&self->_access_attentionAwarenessClient, a3);
}

- (ITAttentionAwarenessClientDelegate)delegate
{
  return (ITAttentionAwarenessClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_access_attentionAwarenessClient, 0);
}

- (void)_handleAttentionAwarenessEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_215E50000, a2, OS_LOG_TYPE_DEBUG, "attention event: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_handleAttentionAwarenessEvent:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v6;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl(&dword_215E50000, a3, OS_LOG_TYPE_ERROR, "%{public}@ - attention event: expected AWAttentionLostEvent instead of %{public}@", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_0();
}

- (void)_handleAttentionAwarenessEvent:(NSObject *)a3 .cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "associatedObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v6;
  v10 = 2114;
  v11 = v7;
  _os_log_fault_impl(&dword_215E50000, a3, OS_LOG_TYPE_FAULT, "%{public}@ - attention client \"lost event\" timeoutTag is not a NSObject: %{public}@", (uint8_t *)&v8, 0x16u);

  OUTLINED_FUNCTION_0();
}

@end
