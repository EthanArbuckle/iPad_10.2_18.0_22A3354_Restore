@implementation ITAttentionAwareIdleTimer

- (ITAttentionAwareIdleTimer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ITAttentionAwareIdleTimer.m"), 42, CFSTR("wrong initializer"));

  return 0;
}

- (ITAttentionAwareIdleTimer)initWithConfigurationIdentifier:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ITAttentionAwareIdleTimer *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)BSDispatchQueueCreateWithQualityOfService();
  v9 = -[ITAttentionAwareIdleTimer initWithConfigurationIdentifier:delegate:calloutQueue:](self, "initWithConfigurationIdentifier:delegate:calloutQueue:", v7, v6, v8);

  return v9;
}

- (ITAttentionAwareIdleTimer)initWithConfigurationIdentifier:(id)a3 delegate:(id)a4 calloutQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  ITAttentionAwarenessClient *v11;
  ITAttentionAwareIdleTimer *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[ITAttentionAwarenessClient initWithCalloutQueue:]([ITAttentionAwarenessClient alloc], "initWithCalloutQueue:", v8);
  v12 = -[ITAttentionAwareIdleTimer _initWithConfigurationIdentifier:delegate:calloutQueue:client:](self, "_initWithConfigurationIdentifier:delegate:calloutQueue:client:", v10, v9, v8, v11);

  return v12;
}

- (id)_initWithConfigurationIdentifier:(id)a3 delegate:(id)a4 calloutQueue:(id)a5 client:(id)a6
{
  id v9;
  id v10;
  id v11;
  ITAttentionAwareIdleTimer *v12;
  ITAttentionAwareIdleTimer *v13;
  uint64_t v14;
  NSString *configurationIdentifier;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)ITAttentionAwareIdleTimer;
  v12 = -[ITAttentionAwareIdleTimer init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_accessLock = 0;
    v14 = objc_msgSend(v9, "copy");
    configurationIdentifier = v13->_configurationIdentifier;
    v13->_configurationIdentifier = (NSString *)v14;

    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v13->_access_client, a6);
    -[ITAttentionAwarenessClient setDelegate:](v13->_access_client, "setDelegate:", v13);
  }

  return v13;
}

- (ITIdleTimerDescriptor)descriptor
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = (void *)-[ITIdleTimerDescriptor copy](self->_access_descriptor, "copy");
  os_unfair_recursive_lock_unlock();
  return (ITIdleTimerDescriptor *)v3;
}

- (void)setDescriptor:(id)a3 resettingTimer:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  SEL v15;
  ITAttentionAwareIdleTimer *v16;
  uint64_t v17;
  ITAttentionAwarenessContext *v18;
  ITAttentionAwarenessContext *access_context;
  ITIdleTimerDescriptor *v20;
  ITIdleTimerDescriptor *access_descriptor;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;

  v4 = a4;
  v25 = a3;
  objc_msgSend(v25, "timeouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ITAttentionAwareIdleTimer.m"), 85, CFSTR("Descriptor must have at least one timeout."));

  }
  v9 = objc_msgSend(v25, "attentionMaintenanceEventMask");
  objc_msgSend(v25, "attentionSamplingStartDelay");
  objc_msgSend(v25, "attentionSamplingPeriod");
  v11 = v10;
  if (v9 < 0)
  {
    if (!BSFloatGreaterThanFloat() || BSFloatEqualToFloat())
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v24 = v11;
      v14 = CFSTR("The sampling period: %g must be valid when face detection is enabled.");
      v15 = a2;
      v16 = self;
      v17 = 92;
      goto LABEL_12;
    }
  }
  else
  {
    if ((BSFloatIsZero() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ITAttentionAwareIdleTimer.m"), 94, CFSTR("Face detection is not enabled, so the sampling period must be zero."));

    }
    if ((BSFloatIsZero() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("Face detection is not enabled, so the sampling delay must be zero.");
      v15 = a2;
      v16 = self;
      v17 = 95;
LABEL_12:
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", v15, v16, CFSTR("ITAttentionAwareIdleTimer.m"), v17, v14, v24);

    }
  }
  os_unfair_recursive_lock_lock_with_options();
  v18 = objc_alloc_init(ITAttentionAwarenessContext);
  access_context = self->_access_context;
  self->_access_context = v18;

  v20 = (ITIdleTimerDescriptor *)objc_msgSend(v25, "copy");
  access_descriptor = self->_access_descriptor;
  self->_access_descriptor = v20;

  -[ITAttentionAwareIdleTimer _access_reconfigureAttentionClientAndReset:](self, "_access_reconfigureAttentionClientAndReset:", v4);
  os_unfair_recursive_lock_unlock();

}

- (void)reset
{
  ITAttentionAwarenessContext *v4;
  ITAttentionAwarenessContext *access_context;
  void *v6;

  os_unfair_recursive_lock_lock_with_options();
  if (!self->_access_descriptor)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ITAttentionAwareIdleTimer.m"), 111, CFSTR("Can't reset timer with nil descriptor"));

  }
  v4 = objc_alloc_init(ITAttentionAwarenessContext);
  access_context = self->_access_context;
  self->_access_context = v4;

  if (!-[ITAttentionAwarenessClient isEnabled](self->_access_client, "isEnabled"))
    -[ITAttentionAwarenessClient setEnabled:](self->_access_client, "setEnabled:", 1);
  -[ITAttentionAwareIdleTimer _access_reconfigureAttentionClientAndReset:](self, "_access_reconfigureAttentionClientAndReset:", 1);
  os_unfair_recursive_lock_unlock();
}

- (BOOL)isEnabled
{
  return -[ITAttentionAwarenessClient isEnabled](self->_access_client, "isEnabled");
}

- (void)setEnabled:(BOOL)a3
{
  -[ITAttentionAwarenessClient setEnabled:](self->_access_client, "setEnabled:", a3);
}

- (NSString)description
{
  return (NSString *)-[ITAttentionAwareIdleTimer descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[ITAttentionAwareIdleTimer succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[ITAttentionAwareIdleTimer descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;

  -[ITAttentionAwareIdleTimer succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_access_descriptor, CFSTR("descriptor"));
  return v4;
}

+ (id)_configurationWithIdentifier:(id)a3 descriptor:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  double v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a3;
  v12 = objc_msgSend(v9, "attentionMaintenanceEventMask");
  v13 = objc_msgSend(v9, "attentionRecoveryEventMask");
  v14 = objc_alloc_init(MEMORY[0x24BE09598]);
  objc_msgSend(v14, "setIdentifier:", v11);

  objc_msgSend(v14, "setEventMask:", v12);
  if ((v12 & 0x80) == 0 && (v13 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ITAttentionAwareIdleTimer.m"), 180, CFSTR("Cannot enable face detection for attention recovery exclusive of attention maintenance"));

  }
  else if (!v13)
  {
    goto LABEL_5;
  }
  objc_msgSend(v14, "setAttentionLostEventMask:", v13);
LABEL_5:
  objc_msgSend(v9, "timeouts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    if ((v12 & 0x80) == 0)
      goto LABEL_12;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "description");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ITAttentionAwareIdleTimer.m"), 190, CFSTR("timeouts: <%@> for descriptor: <%@> must have at least one timeout"), v9, v24);

    if ((v12 & 0x80) == 0)
      goto LABEL_12;
  }
  objc_msgSend(v9, "attentionSamplingPeriod");
  v17 = v16;
  objc_msgSend(v14, "setSamplingInterval:");
  objc_msgSend(v9, "attentionSamplingStartDelay");
  v19 = v18;
  if (v18 > 0.0)
    objc_msgSend(v14, "setSamplingDelay:", v18);
  ITLogIdleTimer();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v27 = v19;
    v28 = 2048;
    v29 = v17;
    _os_log_impl(&dword_215E50000, v20, OS_LOG_TYPE_INFO, "Setting auto face detection with sampling delay: %g, period: %g", buf, 0x16u);
  }

LABEL_12:
  objc_msgSend(a1, "_timeoutDictionaryForTimeouts:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTag:", v10);

  objc_msgSend(v14, "setAttentionLostTimeoutDictionary:", v21);
  return v14;
}

- (id)_access_generateConfiguration
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_accessLock);
  return (id)objc_msgSend((id)objc_opt_class(), "_configurationWithIdentifier:descriptor:context:", self->_configurationIdentifier, self->_access_descriptor, self->_access_context);
}

- (void)_access_reconfigureAttentionClientAndReset:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  int v7;
  ITAttentionAwareIdleTimer *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_accessLock);
  -[ITAttentionAwareIdleTimer _access_generateConfiguration](self, "_access_generateConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ITAttentionAwarenessClient setConfiguration:shouldReset:](self->_access_client, "setConfiguration:shouldReset:", v5, v3);
  -[ITAttentionAwarenessClient setEnabled:](self->_access_client, "setEnabled:", 1);
  ITLogIdleTimer();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218242;
    v8 = self;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_215E50000, v6, OS_LOG_TYPE_DEFAULT, "<%p> - reconfigure attention client with configuration:%{public}@", (uint8_t *)&v7, 0x16u);
  }

}

+ (id)_timeoutDictionaryForTimeouts:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "identifier", (_QWORD)v15));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v10, "duration");
        objc_msgSend(v12, "numberWithDouble:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)client:(id)a3 attentionLostTimeoutDidExpire:(id)a4 forContext:(id)a5
{
  id v7;
  int v8;
  id WeakRetained;
  id v10;

  v10 = a4;
  v7 = a5;
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&self->_accessLock);
  os_unfair_recursive_lock_lock_with_options();
  v8 = objc_msgSend(v7, "isEqual:", self->_access_context);

  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "idleTimer:attentionLostTimeoutDidExpire:", self, v10);

  }
  os_unfair_recursive_lock_unlock();

}

- (void)clientDidReset:(id)a3 forUserAttentionEvent:(id)a4 withContext:(id)a5
{
  id v7;
  int v8;
  double v9;
  double v10;
  uint64_t v11;
  id WeakRetained;
  id v13;

  v13 = a4;
  v7 = a5;
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&self->_accessLock);
  os_unfair_recursive_lock_lock_with_options();
  v8 = objc_msgSend(v7, "isEqual:", self->_access_context);

  if (v8)
  {
    objc_msgSend(v13, "timestamp");
    v10 = v9;
    v11 = objc_msgSend(v13, "eventMask");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "idleTimerDidReset:forUserAttention:at:", self, v11, v10);

  }
  os_unfair_recursive_lock_unlock();

}

- (ITAttentionAwarenessContext)_context
{
  ITAttentionAwarenessContext *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_access_context;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (ITIdleTimerDelegate)delegate
{
  return (ITIdleTimerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_access_context, 0);
  objc_storeStrong((id *)&self->_access_descriptor, 0);
  objc_storeStrong((id *)&self->_access_client, 0);
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
}

@end
