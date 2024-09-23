@implementation CAMPowerController

- (CAMPowerController)init
{
  id v2;
  id v3;
  void *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v19;
  NSObject *v20;
  _QWORD aBlock[4];
  id v22;
  id location;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CAMPowerController;
  v2 = -[CAMPowerController init](&v24, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v3;

    *((_QWORD *)v2 + 5) = *MEMORY[0x1E0DC4878];
    *((_DWORD *)v2 + 3) = -1;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.camera.power-controller.assertions", v5);
    v7 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v6;

    objc_initWeak(&location, v2);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __26__CAMPowerController_init__block_invoke;
    aBlock[3] = &unk_1EA329270;
    objc_copyWeak(&v22, &location);
    v8 = _Block_copy(aBlock);
    v9 = notify_register_dispatch("com.apple.system.peakpowerpressurelevel", (int *)v2 + 3, *((dispatch_queue_t *)v2 + 4), v8);
    if ((_DWORD)v9)
    {
      v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CAMPowerController init].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    else
    {
      v20 = v8;
      v19 = v2;
      pl_dispatch_async();

      v10 = v20;
    }

    v17 = v2;
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
  return (CAMPowerController *)v2;
}

void __26__CAMPowerController_init__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  id WeakRetained;
  uint64_t state;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t state64;

  v4 = (void *)MEMORY[0x1DF0B55E8]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  state64 = 0;
  state = notify_get_state(a2, &state64);
  if ((_DWORD)state)
  {
    v7 = state;
    v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __26__CAMPowerController_init__block_invoke_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  else
  {
    objc_msgSend(WeakRetained, "_powerControllerQueue_setPowerPressureLevel:", state64);
  }

  objc_autoreleasePoolPop(v4);
}

- (void)_powerControllerQueue_setPowerPressureLevel:(unsigned int)a3
{
  self->__powerControllerQueue_powerPressureLevel = a3;
}

- (unsigned)generateAssertionIdentifier
{
  int *p_assertionIdentifierGenerator;
  unsigned int result;

  p_assertionIdentifierGenerator = &self->_assertionIdentifierGenerator;
  do
    result = __ldaxr((unsigned int *)p_assertionIdentifierGenerator);
  while (__stlxr(result + 1, (unsigned int *)p_assertionIdentifierGenerator));
  return result;
}

- (void)addAssertionForIndentifier:(unsigned int)a3 withReason:(unsigned int)a4
{
  void *v4;

  -[CAMPowerController _powerControllerQueue](self, "_powerControllerQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pl_dispatch_async();

}

- (OS_dispatch_queue)_powerControllerQueue
{
  return self->__powerControllerQueue;
}

void __60__CAMPowerController_addAssertionForIndentifier_withReason___block_invoke(uint64_t a1)
{
  int *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  int v7;
  int *v8;
  NSObject *v9;
  void *v10;

  v2 = (int *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_assertionsByIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  v8 = (int *)(a1 + 44);
  v7 = *(_DWORD *)(a1 + 44);
  if ((v7 & v6) != 0)
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __60__CAMPowerController_addAssertionForIndentifier_withReason___block_invoke_cold_1(v2, v8, v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7 | v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v3);

    objc_msgSend(*(id *)(a1 + 32), "_startBackgroundTaskIfNeeded");
  }

}

- (NSMutableDictionary)_assertionsByIdentifier
{
  return self->__assertionsByIdentifier;
}

- (void)_startBackgroundTaskIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  unint64_t backgroundTaskIdentifier;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[CAMPowerController _assertionsByIdentifier](self, "_assertionsByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") && self->__backgroundTaskIdentifier == *MEMORY[0x1E0DC4878])
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__CAMPowerController__startBackgroundTaskIfNeeded__block_invoke;
    v8[3] = &unk_1EA328868;
    v9 = v3;
    self->__backgroundTaskIdentifier = objc_msgSend(v5, "beginBackgroundTaskWithName:expirationHandler:", v4, v8);

    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      backgroundTaskIdentifier = self->__backgroundTaskIdentifier;
      *(_DWORD *)buf = 134217984;
      v11 = backgroundTaskIdentifier;
      _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "PowerController: Started background task: %ld", buf, 0xCu);
    }

  }
}

- (void)removeAssertionForIdentifier:(unsigned int)a3 withReason:(unsigned int)a4
{
  void *v4;

  -[CAMPowerController _powerControllerQueue](self, "_powerControllerQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pl_dispatch_async();

}

void __62__CAMPowerController_removeAssertionForIdentifier_withReason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  void *v10;
  os_log_t v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  int v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_assertionsByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      goto LABEL_9;
    }
    v12 = *(_DWORD *)(a1 + 40);
    NSStringFromCAMPowerAssertionReason(*(_DWORD *)(a1 + 44));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 67109634;
    v17 = v12;
    v18 = 2114;
    v19 = v13;
    v20 = 2114;
    v21 = v3;
    _os_log_error_impl(&dword_1DB760000, v11, OS_LOG_TYPE_ERROR, "PowerController %d: Power assertion not found, cannot remove reason %{public}@; existing assertions: %{public}@",
      (uint8_t *)&v16,
      0x1Cu);
LABEL_11:

    goto LABEL_8;
  }
  v6 = objc_msgSend(v4, "intValue");
  v7 = v6;
  v8 = *(_DWORD *)(a1 + 44);
  if ((v8 & v6) == 0)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v14 = *(_DWORD *)(a1 + 40);
    NSStringFromCAMPowerAssertionReason(*(_DWORD *)(a1 + 44));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCAMPowerAssertionReasonBitfield(v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 67109634;
    v17 = v14;
    v18 = 2114;
    v19 = v13;
    v20 = 2114;
    v21 = v15;
    _os_log_error_impl(&dword_1DB760000, v11, OS_LOG_TYPE_ERROR, "PowerController %d: Power assertion was not asserted with reason %{public}@; existing reasons: %{public}@",
      (uint8_t *)&v16,
      0x1Cu);

    goto LABEL_11;
  }
  v9 = v6 & ~v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v2);

  if (!v9)
  {
    objc_msgSend(v3, "removeObjectForKey:", v2);
    objc_msgSend(*(id *)(a1 + 32), "_endBackgroundTaskIfNeeded");
  }
LABEL_9:

}

- (void)_endBackgroundTaskIfNeeded
{
  void *v3;
  unint64_t v4;
  NSObject *v5;
  unint64_t backgroundTaskIdentifier;
  void *v7;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[CAMPowerController _assertionsByIdentifier](self, "_assertionsByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    v4 = *MEMORY[0x1E0DC4878];
    if (self->__backgroundTaskIdentifier != *MEMORY[0x1E0DC4878])
    {
      v5 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        backgroundTaskIdentifier = self->__backgroundTaskIdentifier;
        v8 = 134217984;
        v9 = backgroundTaskIdentifier;
        _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "PowerController: Ending background task: %ld", (uint8_t *)&v8, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "endBackgroundTask:", self->__backgroundTaskIdentifier);

      self->__backgroundTaskIdentifier = v4;
    }
  }

}

uint64_t __26__CAMPowerController_init__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 12));
}

- (void)dealloc
{
  int v3;
  objc_super v4;

  v3 = -[CAMPowerController _powerPressureNotificationToken](self, "_powerPressureNotificationToken");
  if ((v3 & 0x80000000) == 0)
    notify_cancel(v3);
  v4.receiver = self;
  v4.super_class = (Class)CAMPowerController;
  -[CAMPowerController dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[CAMPowerController _assertionsByIdentifier](self, "_assertionsByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "intValue");

        NSStringFromCAMPowerAssertionReasonBitfield(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ backgroundTaskIdentifier:%ld assertions:%@>"), objc_opt_class(), -[CAMPowerController _backgroundTaskIdentifier](self, "_backgroundTaskIdentifier"), v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __50__CAMPowerController__startBackgroundTaskIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __50__CAMPowerController__startBackgroundTaskIfNeeded__block_invoke_cold_1(a1, v2);

}

- (unsigned)powerPressureLevel
{
  void *v3;
  id v5;
  id location;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_initWeak(&location, self);
  -[CAMPowerController _powerControllerQueue](self, "_powerControllerQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_copyWeak(&v5, &location);
  pl_dispatch_sync();

  LODWORD(v3) = *((_DWORD *)v8 + 6);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __40__CAMPowerController_powerPressureLevel__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(WeakRetained, "_powerControllerQueue_powerPressureLevel");

}

- (unint64_t)_backgroundTaskIdentifier
{
  return self->__backgroundTaskIdentifier;
}

- (int)_powerPressureNotificationToken
{
  return self->__powerPressureNotificationToken;
}

- (unsigned)_powerControllerQueue_powerPressureLevel
{
  return self->__powerControllerQueue_powerPressureLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__powerControllerQueue, 0);
  objc_storeStrong((id *)&self->__assertionsByIdentifier, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0_1(&dword_1DB760000, a2, a3, "PowerController: Unable to register for power pressure notification: %d", a5, a6, a7, a8, 0);
}

void __26__CAMPowerController_init__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DB760000, a2, a3, "PowerController: Unable to get power pressure notification state: %d", a5, a6, a7, a8, 0);
}

void __50__CAMPowerController__startBackgroundTaskIfNeeded__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "PowerController: A power assertion expired without finishing! Assertions active: %{public}@", (uint8_t *)&v3, 0xCu);
}

void __60__CAMPowerController_addAssertionForIndentifier_withReason___block_invoke_cold_1(int *a1, int *a2, NSObject *a3)
{
  int v4;
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  NSStringFromCAMPowerAssertionReason(*a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 67109378;
  v6[1] = v4;
  v7 = 2114;
  v8 = v5;
  _os_log_error_impl(&dword_1DB760000, a3, OS_LOG_TYPE_ERROR, "PowerController %d: Power assertion %{public}@ already exists", (uint8_t *)v6, 0x12u);

}

@end
