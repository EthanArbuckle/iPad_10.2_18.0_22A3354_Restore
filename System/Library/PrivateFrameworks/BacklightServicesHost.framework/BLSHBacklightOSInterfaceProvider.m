@implementation BLSHBacklightOSInterfaceProvider

+ (BLSHBacklightOSInterfaceProvider)sharedProvider
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)&_classLock);
  v2 = (id)_sharedProvider;
  os_unfair_lock_unlock((os_unfair_lock_t)&_classLock);
  return (BLSHBacklightOSInterfaceProvider *)v2;
}

+ (void)setSharedProvider:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_classLock);
  v4 = (void *)_sharedProvider;
  _sharedProvider = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&_classLock);
}

- (BLSHBacklightOSInterfaceProvider)initWithPlatformProvider:(id)a3
{
  id v5;
  BLSHBacklightOSInterfaceProvider *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BLSHWatchdogProvider *v12;
  void *v13;
  BLSHCriticalAssertProvider *v14;
  void *v15;
  char v16;
  double v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  char v30;
  char v31;
  _BYTE *v32;
  uint64_t v33;
  void *v34;
  float v35;
  float v36;
  uint64_t v37;
  NSObject *v38;
  unint64_t v39;
  const __CFString *v40;
  int v41;
  int v42;
  int v43;
  BLSHSuppressionEvent *v44;
  void *v45;
  void *v46;
  char v47;
  uint64_t v48;
  void *v49;
  unint64_t v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  id v55;
  NSObject *v56;
  unint64_t v58;
  const __CFString *v59;
  void *v60;
  void *v61;
  id v62;
  objc_super v63;
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  const __CFString *v67;
  __int16 v68;
  _BYTE v69[10];
  __int16 v70;
  int v71;
  _QWORD v72[2];
  _QWORD v73[3];

  v73[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v63.receiver = self;
  v63.super_class = (Class)BLSHBacklightOSInterfaceProvider;
  v6 = -[BLSHBacklightOSInterfaceProvider init](&v63, sel_init);
  v7 = (uint64_t)v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(v7 + 32);
    *(_QWORD *)(v7 + 32) = v8;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v10;

    objc_storeStrong((id *)(v7 + 8), a3);
    v12 = -[BLSHWatchdogProvider initWithDelegate:]([BLSHWatchdogProvider alloc], "initWithDelegate:", v7);
    v13 = *(void **)(v7 + 16);
    *(_QWORD *)(v7 + 16) = v12;

    v14 = objc_alloc_init(BLSHCriticalAssertProvider);
    v15 = *(void **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = v14;

    v16 = objc_opt_respondsToSelector();
    LODWORD(v17) = 1.0;
    if ((v16 & 1) != 0)
      objc_msgSend(v5, "backlightDimmedFactor", v17);
    *(_DWORD *)(v7 + 136) = LODWORD(v17);
    if (MGGetBoolAnswer())
    {
      LOBYTE(v18) = MGGetBoolAnswer();
      LOBYTE(v19) = 1;
    }
    else
    {
      LOBYTE(v18) = MGGetBoolAnswer();
      LOBYTE(v19) = v18;
    }
    if (os_variant_has_internal_diagnostics())
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.BacklightServices"));
      objc_msgSend(v20, "valueForKey:", CFSTR("deviceSupportsAlwaysOnOverride"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v19 = objc_msgSend(v21, "BOOLValue");
        bls_backlight_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v65 = v7;
          v66 = 1024;
          LODWORD(v67) = v19;
          _os_log_impl(&dword_2145AC000, v22, OS_LOG_TYPE_DEFAULT, "OSIP:%p deviceSupportsAlwaysOnOverride set to %{BOOL}u - use 'login -f mobile defaults delete com.apple.BacklightServices deviceSupportsAlwaysOnOverride' to remove", buf, 0x12u);
        }

      }
      objc_msgSend(v20, "valueForKey:", CFSTR("deviceSupportsAlwaysOnFlipbookOverride"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v18 = objc_msgSend(v23, "BOOLValue");
        bls_backlight_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v65 = v7;
          v66 = 1024;
          LODWORD(v67) = v18;
          _os_log_impl(&dword_2145AC000, v24, OS_LOG_TYPE_DEFAULT, "OSIP:%p deviceSupportsAlwaysOnFlipbookOverride set to %{BOOL}u - use 'login -f mobile defaults delete com.apple.BacklightServices deviceSupportsAlwaysOnFlipbookOverride' to remove", buf, 0x12u);
        }

      }
      v72[0] = CFSTR("flipbookDiagnosticsFrameLimit");
      v72[1] = CFSTR("flipbookDiagnosticsMemoryLimit");
      v73[0] = &unk_24D1DD360;
      v73[1] = &unk_24D1DD378;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "registerDefaults:", v25);

      *(_QWORD *)(v7 + 192) = objc_msgSend(v20, "integerForKey:", CFSTR("flipbookDiagnosticsFrameLimit"));
      *(_QWORD *)(v7 + 200) = objc_msgSend(v20, "integerForKey:", CFSTR("flipbookDiagnosticsMemoryLimit")) << 20;

    }
    *(_BYTE *)(v7 + 130) = v19;
    *(_BYTE *)(v7 + 131) = v18;
    objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stateControl");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(void **)(v7 + 64);
    *(_QWORD *)(v7 + 64) = v27;

    *(_QWORD *)(v7 + 96) = objc_msgSend(*(id *)(v7 + 64), "displayState");
    if (!*(_QWORD *)(v7 + 64))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CADisplayStateControl nil - this process needs entitlement: 'com.apple.QuartzCore.display-state'"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BLSHBacklightOSInterfaceProvider initWithPlatformProvider:].cold.1();
      objc_msgSend(objc_retainAutorelease(v61), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x2145B1D10);
    }
    v29 = objc_alloc_init(MEMORY[0x24BE1A2E8]);
    objc_msgSend(v29, "activate");
    v30 = objc_msgSend(v29, "supported");
    v31 = v30;
    if ((v30 & 1) != 0)
    {
      v32 = (_BYTE *)(v7 + 133);
      *(_BYTE *)(v7 + 133) = v30;
      *(_QWORD *)(v7 + 120) = 3;
      objc_storeStrong((id *)(v7 + 56), v29);
      *(_QWORD *)(v7 + 112) = objc_msgSend(*(id *)(v7 + 56), "displayMode");
      objc_msgSend(*(id *)(v7 + 56), "setCompletionDelegate:", v7);
    }
    else
    {
      objc_msgSend(v29, "cancel");
      v32 = (_BYTE *)(v7 + 133);
      *(_BYTE *)(v7 + 133) = v31;
      v33 = objc_msgSend(objc_alloc(MEMORY[0x24BE0BDE8]), "initWithIdentifier:", CFSTR("backlightServices.setCBDisplayMode"));
      v34 = *(void **)(v7 + 80);
      *(_QWORD *)(v7 + 80) = v33;

      *(_QWORD *)(v7 + 120) = 3;
      BKSHIDServicesGetBacklightFactor();
      v36 = fabsf(v35);
      v37 = 4;
      if (fabsf(v35 + -1.0) <= 0.001)
        v37 = 3;
      if (v36 <= 0.001)
        v37 = 0;
      *(_QWORD *)(v7 + 112) = v37;
    }
    *(_QWORD *)(v7 + 104) = *(_QWORD *)(v7 + 96) != 1;
    -[BLSHBacklightOSInterfaceProvider notifyDisplayBlankedIfChangedForCADisplayState:](v7, *(_QWORD *)(v7 + 96));
    *(_BYTE *)(v7 + 132) = +[BLSHBacklightOSInterfaceProvider sysctlKernSpecialMode]();
    bls_backlight_log();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = *(_QWORD *)(v7 + 112);
      if (v39 > 4)
        v40 = CFSTR("Invalid");
      else
        v40 = off_24D1BC1B0[v39];
      v41 = *(unsigned __int8 *)(v7 + 130);
      v42 = *(unsigned __int8 *)(v7 + 131);
      v43 = *v32;
      *(_DWORD *)buf = 134219010;
      v65 = v7;
      v66 = 2114;
      v67 = v40;
      v68 = 1024;
      *(_DWORD *)v69 = v41;
      *(_WORD *)&v69[4] = 1024;
      *(_DWORD *)&v69[6] = v42;
      v70 = 1024;
      v71 = v43;
      _os_log_impl(&dword_2145AC000, v38, OS_LOG_TYPE_DEFAULT, "OSIP:%p startup cbDisplayMode:%{public}@ dsao:%{BOOL}u dsaof:%{BOOL}u dscs:%{BOOL}u", buf, 0x28u);
    }

    v44 = -[BLSHSuppressionEvent initWithType:reason:timestamp:]([BLSHSuppressionEvent alloc], "initWithType:reason:timestamp:", 2, 0, mach_continuous_time());
    v45 = *(void **)(v7 + 48);
    *(_QWORD *)(v7 + 48) = v44;

    if (objc_msgSend(MEMORY[0x24BDC1420], "isAvailable"))
    {
      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.BacklightServices"));
      v47 = objc_msgSend(v46, "BOOLForKey:", CFSTR("disableSuppression"));

      if ((v47 & 1) == 0)
      {
        v48 = objc_msgSend(objc_alloc(MEMORY[0x24BDC1420]), "initWithClientType:", 1);
        v49 = *(void **)(v7 + 72);
        *(_QWORD *)(v7 + 72) = v48;

      }
    }
    if (*v32)
    {
      v50 = *(_QWORD *)(v7 + 112);
      if (v50 > 4)
        v51 = CFSTR("Invalid");
      else
        v51 = off_24D1BC1B0[v50];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("OSIP:%p initWithPlatformProvider: transitionToDisplayMode:%@ withDuration:0"), v7, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLSHBacklightOSInterfaceProvider scheduleOSIPWatchdogWithExplanation:type:]((os_unfair_lock_s *)v7, v52, 0);
      v53 = *(void **)(v7 + 56);
      v54 = *(_QWORD *)(v7 + 112);
      v62 = 0;
      objc_msgSend(v53, "transitionToDisplayMode:withDuration:error:", v54, &v62, 0.0);
      v55 = v62;
      if (v55)
      {
        bls_backlight_log();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
        {
          v58 = *(_QWORD *)(v7 + 112);
          if (v58 > 4)
            v59 = CFSTR("Invalid");
          else
            v59 = off_24D1BC1B0[v58];
          objc_msgSend(v55, "bls_loggingString");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v65 = v7;
          v66 = 2114;
          v67 = v59;
          v68 = 2114;
          *(_QWORD *)v69 = v60;
          _os_log_fault_impl(&dword_2145AC000, v56, OS_LOG_TYPE_FAULT, "OSIP:%p could not transitionToDisplayMode:%{public}@ during init error:%{public}@", buf, 0x20u);

        }
      }

    }
    if (*v32)
      BKSHIDServicesNotifyBacklightFactorWithFadeDurationAsync();
    else
      BKSHIDServicesSetBacklightFactorWithFadeDurationAsync();

  }
  return (BLSHBacklightOSInterfaceProvider *)v7;
}

- (void)notifyDisplayBlankedIfChangedForCADisplayState:(uint64_t)a1
{
  char v4;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    v4 = (a2 != 1) ^ (*(_QWORD *)(a1 + 104) == 1);
    *(_QWORD *)(a1 + 104) = a2;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    if ((v4 & 1) == 0)
    {
      kdebug_trace();
      BKSDisplayServicesNotifyDisplayBlanked();
    }
  }
}

+ (uint64_t)sysctlKernSpecialMode
{
  uint64_t v0;
  int v1;
  size_t v2;
  NSObject *v3;
  NSObject *v4;
  size_t v6;
  int v7;

  v0 = objc_opt_self();
  v7 = 0;
  v6 = 4;
  v1 = sysctlbyname("kern.aotmode", &v7, &v6, 0, 0);
  v2 = v6;
  bls_backlight_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v1 || v2 != 4)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      +[BLSHBacklightOSInterfaceProvider sysctlKernSpecialMode].cold.1(v0, v1, v4);
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    +[BLSHBacklightOSInterfaceProvider sysctlKernSpecialMode].cold.2();
  }

  return v7 & 1;
}

- (void)scheduleOSIPWatchdogWithExplanation:(unint64_t)a3 type:
{
  os_unfair_lock_s *v5;
  id v6;
  int *v7;
  int *v8;
  id obj;

  if (a1)
  {
    v5 = a1 + 22;
    v6 = a2;
    os_unfair_lock_lock(v5);
    -[os_unfair_lock_s scheduleWatchdogWithDelegate:explanation:timeout:](a1, "scheduleWatchdogWithDelegate:explanation:timeout:", a1, v6, -[BLSHBacklightOSInterfaceProvider timeoutForWatchdogType:](a1, a3));
    obj = (id)objc_claimAutoreleasedReturnValue();

    if (a3 <= 2)
    {
      v7 = off_24D1BC180[a3];
      v8 = off_24D1BC198[a3];
      objc_msgSend(*(id *)((char *)&a1->_os_unfair_lock_opaque + *v7), "invalidate:", 1);
      objc_storeStrong((id *)((char *)a1 + *v7), obj);
      *(_QWORD *)((char *)&a1->_os_unfair_lock_opaque + *v8) = a3;
    }
    os_unfair_lock_unlock(a1 + 22);

  }
}

- (void)registerHandlersForService:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  +[BLSHTransparentFlipbookAttributeHandler registerHandlerForService:provider:](BLSHTransparentFlipbookAttributeHandler, "registerHandlerForService:provider:");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[BLSHWatchdogProvider registerHandlersForService:](self->_watchdogProvider, "registerHandlersForService:", v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler != nil"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHBacklightOSInterfaceProvider registerHandlersForService:].cold.1();
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)registerSceneWorkspace:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet addObject:](self->_lock_sceneWorkspaces, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)deregisterSceneWorkspace:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet removeObject:](self->_lock_sceneWorkspaces, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (id)sceneWithIdentityToken:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_lock_sceneWorkspaces;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "sceneWithIdentityToken:", v4, (_QWORD)v15);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BE38100], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sceneFromIdentityToken:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (BOOL)isKernelAlwaysOnMode
{
  BLSHBacklightOSInterfaceProvider *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_kernelSpecialMode;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setKernelAlwaysOnMode:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  int lock_kernelSpecialMode;
  int v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  uint8_t buf[4];
  BLSHBacklightOSInterfaceProvider *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_kernelSpecialMode = self->_lock_kernelSpecialMode;
  self->_lock_kernelSpecialMode = v3;
  os_unfair_lock_unlock(p_lock);
  if (lock_kernelSpecialMode != v3)
  {
    if (v3)
      v7 = 5;
    else
      v7 = 0;
    v11 = v7;
    v8 = sysctlbyname("kern.aotmode", 0, 0, &v11, 4uLL);
    bls_backlight_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218496;
        v13 = self;
        v14 = 1024;
        v15 = v11;
        v16 = 1024;
        v17 = v8;
        _os_log_error_impl(&dword_2145AC000, v10, OS_LOG_TYPE_ERROR, "OSIP:%p failed to set kernel aotMode:%x status:%d", buf, 0x18u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[BLSHBacklightOSInterfaceProvider setKernelAlwaysOnMode:].cold.1();
    }

  }
}

- (void)dispatchToMainQueueAfterSecondsDelay:(double)a3 identifier:(id)a4 block:(id)a5
{
  int64_t v5;
  dispatch_time_t v6;
  dispatch_block_t block;

  v5 = (uint64_t)(a3 * 1000000000.0);
  block = a5;
  v6 = dispatch_time(0, v5);
  dispatch_after(v6, MEMORY[0x24BDAC9B8], block);

}

- (int64_t)cbDisplayMode
{
  os_unfair_lock_s *p_lock;
  int64_t lock_cbDisplayMode;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_cbDisplayMode = self->_lock_cbDisplayMode;
  os_unfair_lock_unlock(p_lock);
  return lock_cbDisplayMode;
}

- (void)transitionToDisplayMode:(int64_t)a3 withDuration:(double)a4
{
  os_unfair_lock_s *p_lock;
  int64_t lock_cbDisplayMode;
  unint64_t v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  CBDisplayStateClient *displayStateClient;
  id v18;
  NSObject *v19;
  NSObject *v20;
  float backlightDimmedFactor;
  double v22;
  NSObject *v23;
  BSContinuousMachTimer *setCBDisplayModeTimer;
  const __CFString *v25;
  _BOOL4 displayStateClientSupported;
  const char *v27;
  const __CFString *v28;
  const __CFString *v29;
  unint64_t v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  _QWORD v35[6];
  id v36;
  uint8_t buf[4];
  BLSHBacklightOSInterfaceProvider *v38;
  __int16 v39;
  _BYTE v40[18];
  __int16 v41;
  double v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_displayStateClientSupported && (self->_lock_cbFlipbookState & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    if ((unint64_t)a3 > 4)
      v29 = CFSTR("Invalid");
    else
      v29 = off_24D1BC1B0[a3];
    v30 = self->_lock_cbFlipbookState - 1;
    if (v30 > 2)
      v31 = CFSTR("WillTurnOn");
    else
      v31 = off_24D1BC1D8[v30];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cannot change cb display mode to %@, flipbook state:%@ is transitioning"), v29, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHBacklightOSInterfaceProvider transitionToDisplayMode:withDuration:].cold.1();
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145B2A58);
  }
  lock_cbDisplayMode = self->_lock_cbDisplayMode;
  v9 = lock_cbDisplayMode - 1;
  v10 = a3 - 1;
  if (self->_deviceSupportsAlwaysOn)
    v11 = ((unint64_t)(a3 - 1) < 2) ^ ((unint64_t)(lock_cbDisplayMode - 1) < 2);
  else
    v11 = 0;
  if (v9 > 3)
    v12 = 0;
  else
    v12 = qword_21462C210[v9];
  if (v10 > 3)
    v13 = 0;
  else
    v13 = qword_21462C210[v10];
  self->_lock_cbDisplayMode = a3;
  os_unfair_lock_unlock(p_lock);
  if (lock_cbDisplayMode != a3)
  {
    if (self->_displayStateClientSupported)
    {
      bls_backlight_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        if ((unint64_t)a3 > 4)
          v25 = CFSTR("Invalid");
        else
          v25 = off_24D1BC1B0[a3];
        *(_DWORD *)buf = 134218498;
        v38 = self;
        v39 = 2114;
        *(_QWORD *)v40 = v25;
        *(_WORD *)&v40[8] = 2048;
        *(double *)&v40[10] = a4;
        _os_log_debug_impl(&dword_2145AC000, v14, OS_LOG_TYPE_DEBUG, "OSIP:%p transitionToDisplayMode:%{public}@ withDuration:%fs", buf, 0x20u);
      }

      if ((unint64_t)a3 > 4)
        v15 = CFSTR("Invalid");
      else
        v15 = off_24D1BC1B0[a3];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("OSIP:%p transitionToDisplayMode:%@ withDuration:%fs"), self, v15, *(_QWORD *)&a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLSHBacklightOSInterfaceProvider scheduleOSIPWatchdogWithExplanation:type:]((os_unfair_lock_s *)self, v16, 0);
      displayStateClient = self->_displayStateClient;
      v36 = 0;
      -[CBDisplayStateClient transitionToDisplayMode:withDuration:error:](displayStateClient, "transitionToDisplayMode:withDuration:error:", a3, &v36, a4);
      v18 = v36;
      if (v18)
      {
        bls_backlight_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          if ((unint64_t)a3 > 4)
            v28 = CFSTR("Invalid");
          else
            v28 = off_24D1BC1B0[a3];
          v33 = v28;
          objc_msgSend(v18, "bls_loggingString");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v38 = self;
          v39 = 2114;
          *(_QWORD *)v40 = v33;
          *(_WORD *)&v40[8] = 2114;
          *(_QWORD *)&v40[10] = v34;
          _os_log_fault_impl(&dword_2145AC000, v19, OS_LOG_TYPE_FAULT, "OSIP:%p could not transitionToDisplayMode:%{public}@ error:%{public}@", buf, 0x20u);

        }
      }

    }
    if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      bls_backlight_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        v38 = self;
        v39 = 1024;
        *(_DWORD *)v40 = v10 < 2;
        *(_WORD *)&v40[4] = 2048;
        *(double *)&v40[6] = a4;
        _os_log_debug_impl(&dword_2145AC000, v20, OS_LOG_TYPE_DEBUG, "OSIP:%p (platformProvider) useAlwaysOnBrightnessCurve:%{BOOL}u withDuration:%fs", buf, 0x1Cu);
      }

      -[BLSHBacklightPlatformProvider useAlwaysOnBrightnessCurve:withRampDuration:](self->_platformProvider, "useAlwaysOnBrightnessCurve:withRampDuration:", v10 < 2, a4);
    }
    if (v12 != v13)
    {
      if (v13 == 1)
      {
        backlightDimmedFactor = 1.0;
      }
      else
      {
        backlightDimmedFactor = 0.0;
        if (v13 == 2)
          backlightDimmedFactor = self->_backlightDimmedFactor;
      }
      if (v11)
        v22 = 0.0;
      else
        v22 = a4;
      bls_backlight_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        displayStateClientSupported = self->_displayStateClientSupported;
        *(_DWORD *)buf = 134218754;
        v38 = self;
        if (displayStateClientSupported)
          v27 = "Notify";
        else
          v27 = "Set";
        v39 = 2080;
        *(_QWORD *)v40 = v27;
        *(_WORD *)&v40[8] = 2048;
        *(double *)&v40[10] = backlightDimmedFactor;
        v41 = 2048;
        v42 = v22;
        _os_log_debug_impl(&dword_2145AC000, v23, OS_LOG_TYPE_DEBUG, "OSIP:%p %sBacklightFactor:%f WithFadeDuration:%fs", buf, 0x2Au);
      }

      if (self->_displayStateClientSupported)
        BKSHIDServicesNotifyBacklightFactorWithFadeDurationAsync();
      else
        BKSHIDServicesSetBacklightFactorWithFadeDurationAsync();
    }
    if (!self->_displayStateClientSupported)
    {
      setCBDisplayModeTimer = self->_setCBDisplayModeTimer;
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __73__BLSHBacklightOSInterfaceProvider_transitionToDisplayMode_withDuration___block_invoke;
      v35[3] = &unk_24D1BBF58;
      v35[4] = self;
      v35[5] = a3;
      -[BSContinuousMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](setCBDisplayModeTimer, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x24BDAC9B8], v35, a4, 0.016);
    }
  }
}

uint64_t __73__BLSHBacklightOSInterfaceProvider_transitionToDisplayMode_withDuration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didCompleteTransitionToDisplayMode:withError:", *(_QWORD *)(a1 + 40), 0);
}

- (BOOL)supportsFlipbookState
{
  return self->_displayStateClientSupported;
}

- (int64_t)cbFlipbookState
{
  os_unfair_lock_s *p_lock;
  int64_t lock_cbFlipbookState;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_cbFlipbookState = self->_lock_cbFlipbookState;
  os_unfair_lock_unlock(p_lock);
  return lock_cbFlipbookState;
}

- (void)switchToFlipbookState:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  unint64_t v6;
  const __CFString *v7;
  NSObject *v8;
  CBDisplayStateClient *displayStateClient;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  BLSHBacklightOSInterfaceProvider *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_cbFlipbookState = a3;
  os_unfair_lock_unlock(p_lock);
  if (self->_displayStateClientSupported)
  {
    v6 = a3 - 1;
    if ((unint64_t)(a3 - 1) > 2)
      v7 = CFSTR("WillTurnOn");
    else
      v7 = off_24D1BC1D8[v6];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("OSIP:%p switchToFlipbookState:%@"), self, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    -[BLSHBacklightOSInterfaceProvider scheduleOSIPWatchdogWithExplanation:type:]((os_unfair_lock_s *)self, v8, 1uLL);
    displayStateClient = self->_displayStateClient;
    v14 = 0;
    -[CBDisplayStateClient switchToFlipbookState:error:](displayStateClient, "switchToFlipbookState:error:", a3, &v14);
    v10 = v14;
    if (v10)
    {
      bls_backlight_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        if (v6 > 2)
          v12 = CFSTR("WillTurnOn");
        else
          v12 = off_24D1BC1D8[v6];
        objc_msgSend(v10, "bls_loggingString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v16 = self;
        v17 = 2114;
        v18 = v12;
        v19 = 2114;
        v20 = v13;
        _os_log_fault_impl(&dword_2145AC000, v11, OS_LOG_TYPE_FAULT, "OSIP:%p could not switchToFlipbookState:%{public}@ error:%{public}@", buf, 0x20u);

      }
    }

  }
  else
  {
    bls_backlight_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BLSHBacklightOSInterfaceProvider switchToFlipbookState:].cold.1((uint64_t)self, a3, v8);
  }

}

- (id)acquireDisplayPowerAssertionForReason:(int64_t)a3
{
  void *v4;

  if (a3 == 1)
    kdebug_trace();
  v4 = (void *)-[CADisplayStateControl createPowerAssertionWithReason:identifier:](self->_displayStateControl, "createPowerAssertionWithReason:identifier:", 1, CFSTR("BacklightServices"));
  objc_msgSend(v4, "acquire");
  return v4;
}

- (int64_t)caDisplayState
{
  os_unfair_lock_s *p_lock;
  int64_t lock_caDisplayState;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_caDisplayState = self->_lock_caDisplayState;
  os_unfair_lock_unlock(p_lock);
  return lock_caDisplayState;
}

- (int64_t)caDisplayPowerState
{
  return -[CADisplayStateControl powerState](self->_displayStateControl, "powerState");
}

- (void)transitionToCADisplayState:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  _BOOL4 lock_flipbookTransparent;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CADisplayStateControl *displayStateControl;
  _QWORD v19[6];
  uint8_t buf[4];
  BLSHBacklightOSInterfaceProvider *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_caDisplayState = a3;
  if (a3 == 2)
  {
    lock_flipbookTransparent = self->_lock_flipbookTransparent;
    os_unfair_lock_unlock(p_lock);
    if (lock_flipbookTransparent)
    {
      bls_backlight_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v21 = self;
        _os_log_impl(&dword_2145AC000, v7, OS_LOG_TYPE_INFO, "OSIP:%p flipbook transparent, will transition to CADisplayStateOn not CADisplayStateFlipBook", buf, 0xCu);
      }

      a3 = 1;
    }
    else
    {
      a3 = 2;
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
  v8 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromCADisplayState();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("OSIP:%p transitionToCADisplayState:%@"), self, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  bls_backlight_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[BLSHBacklightOSInterfaceProvider transitionToCADisplayState:].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

  -[BLSHBacklightOSInterfaceProvider scheduleOSIPWatchdogWithExplanation:type:]((os_unfair_lock_s *)self, v10, 2uLL);
  displayStateControl = self->_displayStateControl;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __63__BLSHBacklightOSInterfaceProvider_transitionToCADisplayState___block_invoke;
  v19[3] = &unk_24D1BBFD0;
  v19[4] = self;
  v19[5] = a3;
  -[CADisplayStateControl transitionToDisplayState:withCompletion:](displayStateControl, "transitionToDisplayState:withCompletion:", a3, v19);

}

void __63__BLSHBacklightOSInterfaceProvider_transitionToCADisplayState___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  dispatch_time_t v21;
  uint64_t v22;
  _QWORD block[5];
  id v24;
  uint64_t v25;
  _QWORD v26[8];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  double v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  bls_backlight_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (*(_QWORD *)(a1 + 40) == a2)
    v8 = OS_LOG_TYPE_INFO;
  else
    v8 = 16 * (a3 == 0);
  if (os_log_type_enabled(v6, v8))
  {
    v9 = *(_QWORD *)(a1 + 32);
    NSStringFromCADisplayStateTransitionStatus();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCADisplayState();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCADisplayState();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v28 = v9;
    v29 = 2114;
    v30 = v10;
    v31 = 2114;
    v32 = *(double *)&v11;
    v33 = 2114;
    v34 = v12;
    _os_log_impl(&dword_2145AC000, v7, v8, "OSIP:%p completion(%{public}@->%{public}@) transitionToDisplayState:%{public}@", buf, 0x2Au);

  }
  v13 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __63__BLSHBacklightOSInterfaceProvider_transitionToCADisplayState___block_invoke_107;
  v26[3] = &unk_24D1BBF80;
  v14 = *(_QWORD *)(a1 + 40);
  v26[4] = *(_QWORD *)(a1 + 32);
  v26[5] = a3;
  v26[6] = a2;
  v26[7] = v14;
  v15 = MEMORY[0x2199D2BD8](v26);
  v16 = (void *)v15;
  v17 = *(double *)(*(_QWORD *)(a1 + 32) + 184);
  if (v17 <= 0.1)
  {
    (*(void (**)(uint64_t))(v15 + 16))(v15);
  }
  else
  {
    bls_diagnostics_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(a1 + 32);
      NSStringFromCADisplayState();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v28 = v19;
      v29 = 2114;
      v30 = v20;
      v31 = 2048;
      v32 = v17;
      _os_log_impl(&dword_2145AC000, v18, OS_LOG_TYPE_DEFAULT, "OSIP:%p delayCompletionsForTesting:YES, delaying CATransitionToDisplayState:%{public}@ completion by %.2fs", buf, 0x20u);

    }
    v21 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __63__BLSHBacklightOSInterfaceProvider_transitionToCADisplayState___block_invoke_109;
    block[3] = &unk_24D1BBFA8;
    v22 = *(_QWORD *)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v25 = v22;
    v24 = v16;
    dispatch_after(v21, MEMORY[0x24BDAC9B8], block);

  }
}

void __63__BLSHBacklightOSInterfaceProvider_transitionToCADisplayState___block_invoke_107(uint64_t *a1)
{
  id v2;

  -[BLSHBacklightOSInterfaceProvider clearCAWatchdog](a1[4]);
  if (!a1[5])
    -[BLSHBacklightOSInterfaceProvider notifyDisplayBlankedIfChangedForCADisplayState:](a1[4], a1[6]);
  objc_msgSend((id)a1[4], "displayStateDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "osInterfaceProvider:didCompleteTransitionToCADisplayState:currentState:transitionStatus:", a1[4], a1[7], a1[6], a1[5]);

}

- (void)clearCAWatchdog
{
  void *v2;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    objc_msgSend(*(id *)(a1 + 152), "invalidate:", 2);
    v2 = *(void **)(a1 + 152);
    *(_QWORD *)(a1 + 152) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

uint64_t __63__BLSHBacklightOSInterfaceProvider_transitionToCADisplayState___block_invoke_109(uint64_t a1)
{
  NSObject *v2;

  bls_diagnostics_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __63__BLSHBacklightOSInterfaceProvider_transitionToCADisplayState___block_invoke_109_cold_1(a1, v2);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)createDisplayPowerResourceHintWithState:(unint64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74F50]), "initWithResourceType:andState:", 2, (int)a3);
  +[BLSHAsyncDisplayPowerResourceHint hintWithHint:](BLSHAsyncDisplayPowerResourceHint, "hintWithHint:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isShowingBlankingWindow
{
  return -[BLSHBacklightPlatformProvider isShowingBlankingWindow](self->_platformProvider, "isShowingBlankingWindow");
}

- (void)setShowingBlankingWindow:(BOOL)a3 fadeDuration:(double)a4
{
  -[BLSHBacklightPlatformProvider showBlankingWindow:withFadeDuration:](self->_platformProvider, "showBlankingWindow:withFadeDuration:", a3, a4);
}

- (id)scheduleWatchdogWithDelegate:(id)a3 explanation:(id)a4 timeout:(double)a5
{
  return -[BLSHWatchdogProvider scheduleWatchdogWithDelegate:explanation:timeout:](self->_watchdogProvider, "scheduleWatchdogWithDelegate:explanation:timeout:", a3, a4, a5);
}

- (id)createPowerAssertionWithIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BEB3730];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithIdentifier:", v4);

  return v5;
}

- (id)createSystemActivityAssertionWithIdentifier:(id)a3 configurator:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x24BEB3738];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithIdentifier:configurator:", v7, v6);

  return v8;
}

- (id)createFlipbook
{
  return +[BLSHFlipbook createWithPlatformProvider:](BLSHFlipbook, "createWithPlatformProvider:", self->_platformProvider);
}

- (id)systemSleepMonitor
{
  return (id)objc_msgSend(MEMORY[0x24BEB3740], "monitorUsingMainQueue");
}

- (id)observeSignificantTimeChangeWithIdentifier:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;

  v5 = a3;
  v6 = a4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy_;
  v16[4] = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDF75A0];
  v9 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __87__BLSHBacklightOSInterfaceProvider_observeSignificantTimeChangeWithIdentifier_handler___block_invoke;
  v14[3] = &unk_24D1BBFF8;
  v10 = v6;
  v15 = v10;
  objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v8, 0, 0, v14);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __87__BLSHBacklightOSInterfaceProvider_observeSignificantTimeChangeWithIdentifier_handler___block_invoke_2;
  v13[3] = &unk_24D1BC020;
  v13[4] = v16;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BE98]), "initWithIdentifier:forReason:invalidationBlock:", v5, CFSTR("observeSignificantTimeChange"), v13);
  _Block_object_dispose(v16, 8);

  return v11;
}

uint64_t __87__BLSHBacklightOSInterfaceProvider_observeSignificantTimeChangeWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__BLSHBacklightOSInterfaceProvider_observeSignificantTimeChangeWithIdentifier_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (BOOL)deviceSupportsAlwaysOn
{
  return self->_deviceSupportsAlwaysOn;
}

- (BOOL)deviceSupportsAlwaysOnFlipbook
{
  return self->_deviceSupportsAlwaysOnFlipbook;
}

- (BOOL)isSuppressionServiceActive
{
  BLSHBacklightOSInterfaceProvider *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_suppressionServiceActive;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSuppressionServiceActive:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    *(_BYTE *)(a1 + 128) = a2;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BLSHSuppressionEvent)lastSuppressionEvent
{
  os_unfair_lock_s *p_lock;
  BLSHSuppressionEvent *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_lastSuppressionEvent;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setLastSuppressionEvent:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    objc_storeStrong((id *)(a1 + 48), a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }

}

- (void)startSuppressionServiceWithHandler:(id)a3
{
  id v4;
  CMSuppressionManager *suppressionManager;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[BLSHBacklightOSInterfaceProvider setSuppressionServiceActive:]((uint64_t)self, 1);
  -[CMSuppressionManager startService](self->_suppressionManager, "startService");
  suppressionManager = self->_suppressionManager;
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71__BLSHBacklightOSInterfaceProvider_startSuppressionServiceWithHandler___block_invoke;
  v8[3] = &unk_24D1BC048;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[CMSuppressionManager startSuppressionUpdatesToQueue:withHandler:](suppressionManager, "startSuppressionUpdatesToQueue:withHandler:", v6, v8);

}

void __71__BLSHBacklightOSInterfaceProvider_startSuppressionServiceWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  BLSHSuppressionEvent *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    bls_backlight_log();
    v8 = (BLSHSuppressionEvent *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_FAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v7, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedFailureReason");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 134218754;
      v13 = v9;
      v14 = 2114;
      v15 = v5;
      v16 = 2114;
      v17 = v10;
      v18 = 2114;
      v19 = v11;
      _os_log_fault_impl(&dword_2145AC000, &v8->super, OS_LOG_TYPE_FAULT, "OSIP:%p suppression event error - event:%{public}@ error:%{public}@ reason:%{public}@", (uint8_t *)&v12, 0x2Au);

    }
    goto LABEL_7;
  }
  if ((unint64_t)(objc_msgSend(v5, "type") - 1) <= 1)
  {
    objc_msgSend(v5, "timestamp");
    BLSMachTimeFromNSTimeInterval();
    v8 = -[BLSHSuppressionEvent initWithCoreMotionEvent:timestamp:]([BLSHSuppressionEvent alloc], "initWithCoreMotionEvent:timestamp:", v5, BLSMachContinuousTimeFromMachAbsoluteTime());
    -[BLSHBacklightOSInterfaceProvider setLastSuppressionEvent:](*(_QWORD *)(a1 + 32), v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_7:

  }
}

- (void)endSuppressionService
{
  BLSHSuppressionEvent *v3;

  -[BLSHBacklightOSInterfaceProvider setSuppressionServiceActive:]((uint64_t)self, 0);
  -[CMSuppressionManager stopSuppressionUpdates](self->_suppressionManager, "stopSuppressionUpdates");
  -[CMSuppressionManager stopService](self->_suppressionManager, "stopService");
  v3 = -[BLSHSuppressionEvent initWithType:reason:timestamp:]([BLSHSuppressionEvent alloc], "initWithType:reason:timestamp:", 2, 0, mach_continuous_time());
  -[BLSHBacklightOSInterfaceProvider setLastSuppressionEvent:]((uint64_t)self, v3);

}

- (void)didDetectSignificantUserInteraction
{
  -[CMSuppressionManager didDetectSignificantUserInteraction](self->_suppressionManager, "didDetectSignificantUserInteraction");
  -[BLSHWatchdogProvider didDetectSignificantUserInteraction](self->_watchdogProvider, "didDetectSignificantUserInteraction");
  -[BLSHCriticalAssertProvider didDetectSignificantUserInteraction](self->_criticalAssertProvider, "didDetectSignificantUserInteraction");
}

- (id)addSceneObserver:(id)a3 forSceneIdentityToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  BLSHBacklightOSInterfaceProvider *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[sceneIdentityToken isKindOfClass:[FBSSceneIdentityToken class]]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHBacklightOSInterfaceProvider addSceneObserver:forSceneIdentityToken:].cold.3();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145B3D14);
  }
  -[BLSHBacklightOSInterfaceProvider sceneWithIdentityToken:](self, "sceneWithIdentityToken:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[BLSHSceneEnvironmentObserverToken tokenWithObserver:sceneIdentityToken:](BLSHSceneEnvironmentObserverToken, "tokenWithObserver:sceneIdentityToken:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    +[BLSHSceneEnvironmentObserver observerWithObserver:](BLSHSceneEnvironmentObserver, "observerWithObserver:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_lock);
    bls_assertions_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[NSMutableDictionary objectForKey:](self->_lock_sceneObservers, "objectForKey:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v19 = self;
      v20 = 2114;
      v21 = v6;
      v22 = 2114;
      v23 = v7;
      v24 = 2114;
      v25 = v17;
      _os_log_debug_impl(&dword_2145AC000, v11, OS_LOG_TYPE_DEBUG, "OSIP:%p addSceneObserver:%{public}@ forSceneIdentityToken:%{public}@ existing:%{public}@", buf, 0x2Au);

    }
    -[NSMutableDictionary objectForKey:](self->_lock_sceneObservers, "objectForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cannot add the same observer twice for the same scene; observer:%@ scene:%@"),
        v6,
        v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BLSHBacklightOSInterfaceProvider addSceneObserver:forSceneIdentityToken:].cold.2();
      objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x2145B3D70);
    }
    -[NSMutableDictionary setObject:forKey:](self->_lock_sceneObservers, "setObject:forKey:", v10, v9);
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v8, "addObserver:", v10);
    objc_msgSend(v8, "backlightSceneHostEnvironment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    bls_assertions_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BLSHBacklightOSInterfaceProvider addSceneObserver:forSceneIdentityToken:].cold.1();
    v13 = 0;
  }

  return v13;
}

- (id)removeSceneObserver:(id)a3 forSceneIdentityToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  void *v16;
  uint8_t buf[4];
  BLSHBacklightOSInterfaceProvider *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[sceneIdentityToken isKindOfClass:[FBSSceneIdentityToken class]]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHBacklightOSInterfaceProvider removeSceneObserver:forSceneIdentityToken:].cold.1();
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145B3FBCLL);
  }
  -[BLSHBacklightOSInterfaceProvider sceneWithIdentityToken:](self, "sceneWithIdentityToken:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  +[BLSHSceneEnvironmentObserverToken tokenWithObserver:sceneIdentityToken:](BLSHSceneEnvironmentObserverToken, "tokenWithObserver:sceneIdentityToken:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_lock_sceneObservers, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  bls_assertions_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = 2 * (v8 != 0);
  if (os_log_type_enabled(v12, v13))
  {
    *(_DWORD *)buf = 134219010;
    v18 = self;
    v19 = 2114;
    v20 = v6;
    v21 = 2114;
    v22 = v7;
    v23 = 1024;
    v24 = v8 != 0;
    v25 = 2114;
    v26 = v11;
    _os_log_impl(&dword_2145AC000, v12, v13, "OSIP:%p removeSceneObserver:%{public}@ forSceneIdentityToken:%{public}@ foundScene:%{BOOL}u existing:%{public}@", buf, 0x30u);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_lock_sceneObservers, "removeObjectForKey:", v10);
  if (v8)
  {
    if (v11)
      objc_msgSend(v8, "removeObserver:", v11);
    objc_msgSend(v8, "backlightSceneHostEnvironment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v14;
}

- (double)timeoutForWatchdogType:(void *)a1
{
  void *v3;
  int v4;
  double result;
  uint64_t *v6;
  uint64_t *v7;
  BOOL v8;
  int has_internal_diagnostics;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "systemSleepMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSleepImminent");

  if (a2 < 2)
  {
    v6 = (uint64_t *)&BLSHBacklightCoreBrightnessCallbackSleepImminentWatchdogTimeout;
    v7 = (uint64_t *)&BLSHBacklightCoreBrightnessCallbackWatchdogTimeout;
    v8 = v4 == 0;
    goto LABEL_8;
  }
  if (a2 != 2)
    return result;
  if (!v4)
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v6 = (uint64_t *)&BLSHBacklightCoreAnimationCallbackWatchdogInternalInstallTimeout;
    v7 = (uint64_t *)&BLSHBacklightCoreAnimationCallbackWatchdogTimeout;
    v8 = has_internal_diagnostics == 0;
LABEL_8:
    if (v8)
      v6 = v7;
    return *(double *)v6;
  }
  v6 = &BLSHBacklightCoreAnimationCallbackSleepImminentWatchdogTimeout;
  return *(double *)v6;
}

- (void)didCompleteTransitionToDisplayMode:(int64_t)a3 withError:(id)a4
{
  id v6;
  NSObject *v7;
  const __CFString *v8;
  NSObject *v9;
  double cbTransitionsDelayForTesting;
  dispatch_time_t v11;
  _QWORD block[5];
  id v13;
  int64_t v14;
  uint8_t buf[4];
  BLSHBacklightOSInterfaceProvider *v16;
  __int16 v17;
  double v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  bls_backlight_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a3 > 4)
      v8 = CFSTR("Invalid");
    else
      v8 = off_24D1BC1B0[a3];
    *(_DWORD *)buf = 134218498;
    v16 = self;
    v17 = 2114;
    v18 = *(double *)&v8;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_2145AC000, v7, OS_LOG_TYPE_INFO, "OSIP:%p got didCompleteTransitionToDisplayMode:%{public}@ error:%@", buf, 0x20u);
  }

  if (self->_cbTransitionsDelayForTesting <= 0.1)
  {
    -[BLSHBacklightOSInterfaceProvider _didCompleteTransitionToDisplayMode:withError:]((uint64_t)self, a3, v6);
  }
  else
  {
    bls_diagnostics_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      cbTransitionsDelayForTesting = self->_cbTransitionsDelayForTesting;
      *(_DWORD *)buf = 134218240;
      v16 = self;
      v17 = 2048;
      v18 = cbTransitionsDelayForTesting;
      _os_log_impl(&dword_2145AC000, v9, OS_LOG_TYPE_DEFAULT, "OSIP:%p delayCompletionsForTesting:YES, delaying didCompleteCBTransitionToDisplayMode by %.2fs", buf, 0x16u);
    }

    v11 = dispatch_time(0, (uint64_t)(self->_cbTransitionsDelayForTesting * 1000000000.0));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__BLSHBacklightOSInterfaceProvider_didCompleteTransitionToDisplayMode_withError___block_invoke;
    block[3] = &unk_24D1BC070;
    block[4] = self;
    v14 = a3;
    v13 = v6;
    dispatch_after(v11, MEMORY[0x24BDAC9B8], block);

  }
}

void __81__BLSHBacklightOSInterfaceProvider_didCompleteTransitionToDisplayMode_withError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  bls_diagnostics_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __81__BLSHBacklightOSInterfaceProvider_didCompleteTransitionToDisplayMode_withError___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  -[BLSHBacklightOSInterfaceProvider _didCompleteTransitionToDisplayMode:withError:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(void **)(a1 + 40));
}

- (void)_didCompleteTransitionToDisplayMode:(void *)a3 withError:
{
  os_unfair_lock_s *v5;
  id v6;
  void *v7;
  id v8;

  if (a1)
  {
    v5 = (os_unfair_lock_s *)(a1 + 88);
    v6 = a3;
    os_unfair_lock_lock(v5);
    if (!*(_QWORD *)(a1 + 160))
    {
      objc_msgSend(*(id *)(a1 + 144), "invalidate:", 2);
      v7 = *(void **)(a1 + 144);
      *(_QWORD *)(a1 + 144) = 0;

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    objc_msgSend((id)a1, "displayStateDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "osInterfaceProvider:didCompleteTransitionToCBDisplayMode:withError:", a1, a2, v6);

  }
}

- (void)didCompleteSwitchToFlipbookState:(int64_t)a3 withError:(id)a4
{
  id v6;
  NSObject *v7;
  const __CFString *v8;
  BLSHWatchdogInvalidatable *lock_CBWatchdogTimer;
  void *v10;
  int v11;
  BLSHBacklightOSInterfaceProvider *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  bls_backlight_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a3 - 1) > 2)
      v8 = CFSTR("WillTurnOn");
    else
      v8 = off_24D1BC1D8[a3 - 1];
    v11 = 134218498;
    v12 = self;
    v13 = 2114;
    v14 = v8;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_2145AC000, v7, OS_LOG_TYPE_INFO, "OSIP:%p got didCompleteSwitchToFlipbookState:%{public}@ error:%@", (uint8_t *)&v11, 0x20u);
  }

  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_CBWatchdogType == 1)
  {
    -[BLSHWatchdogInvalidatable invalidate:](self->_lock_CBWatchdogTimer, "invalidate:", 2);
    lock_CBWatchdogTimer = self->_lock_CBWatchdogTimer;
    self->_lock_CBWatchdogTimer = 0;

  }
  os_unfair_lock_unlock(&self->_lock);
  -[BLSHBacklightOSInterfaceProvider displayStateDelegate](self, "displayStateDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "osInterfaceProvider:didCompleteSwitchToCBFlipbookState:withError:", self, a3, v6);

}

- (OS_dispatch_queue)delegateQueue
{
  OS_dispatch_queue *v2;
  id v3;

  v2 = (OS_dispatch_queue *)MEMORY[0x24BDAC9B8];
  v3 = MEMORY[0x24BDAC9B8];
  return v2;
}

- (BOOL)isFlipbookTransparent
{
  BLSHBacklightOSInterfaceProvider *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_flipbookTransparent;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setFlipbookTransparent:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  int lock_flipbookTransparent;
  int64_t lock_caDisplayState;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  CADisplayStateControl *displayStateControl;
  _QWORD v13[5];
  char v14;
  uint8_t buf[4];
  BLSHBacklightOSInterfaceProvider *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_flipbookTransparent = self->_lock_flipbookTransparent;
  self->_lock_flipbookTransparent = v3;
  lock_caDisplayState = self->_lock_caDisplayState;
  os_unfair_lock_unlock(p_lock);
  if (lock_flipbookTransparent != v3 && lock_caDisplayState == 2)
  {
    bls_backlight_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v10)
      {
        *(_DWORD *)buf = 134217984;
        v16 = self;
        v11 = 1;
        _os_log_impl(&dword_2145AC000, v9, OS_LOG_TYPE_INFO, "OSIP:%p flipbook set transparent, will transition to active", buf, 0xCu);
      }
      else
      {
        v11 = 1;
      }
    }
    else
    {
      if (v10)
      {
        *(_DWORD *)buf = 134217984;
        v16 = self;
        _os_log_impl(&dword_2145AC000, v9, OS_LOG_TYPE_INFO, "OSIP:%p flipbook no longer transparent, will transition to real flipbook", buf, 0xCu);
      }
      v11 = 2;
    }

    displayStateControl = self->_displayStateControl;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __59__BLSHBacklightOSInterfaceProvider_setFlipbookTransparent___block_invoke;
    v13[3] = &unk_24D1BC098;
    v13[4] = self;
    v14 = v3;
    -[CADisplayStateControl transitionToDisplayState:withCompletion:](displayStateControl, "transitionToDisplayState:withCompletion:", v11, v13);
  }
}

void __59__BLSHBacklightOSInterfaceProvider_setFlipbookTransparent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  bls_backlight_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(unsigned __int8 *)(a1 + 40);
    v9 = 134218496;
    v10 = v7;
    v11 = 1024;
    v12 = a3;
    v13 = 1024;
    v14 = v8;
    _os_log_impl(&dword_2145AC000, v6, OS_LOG_TYPE_INFO, "OSIP:%p completed(%d) setFlipbookTransparent:%{BOOL}u", (uint8_t *)&v9, 0x18u);
  }

  if (!a3)
    -[BLSHBacklightOSInterfaceProvider notifyDisplayBlankedIfChangedForCADisplayState:](*(_QWORD *)(a1 + 32), a2);
}

- (id)abortContextForTimer:(id)a3
{
  os_unfair_lock_s *p_lock;
  BLSHWatchdogInvalidatable *v5;
  BLSHWatchdogInvalidatable *lock_CAWatchdogTimer;
  int *v7;
  uint64_t v8;
  BLSHOSInterfaceProviderAbortContext *v9;
  double v10;
  BLSHOSInterfaceProviderAbortContext *v11;
  uint64_t v13;

  p_lock = &self->_lock;
  v5 = (BLSHWatchdogInvalidatable *)a3;
  os_unfair_lock_lock(p_lock);
  lock_CAWatchdogTimer = self->_lock_CAWatchdogTimer;

  v7 = &OBJC_IVAR___BLSHBacklightOSInterfaceProvider__lock_CBWatchdogType;
  if (lock_CAWatchdogTimer == v5)
    v7 = &OBJC_IVAR___BLSHBacklightOSInterfaceProvider__lock_CAWatchdogType;
  v8 = *(uint64_t *)((char *)&self->super.super.isa + *v7);
  v9 = [BLSHOSInterfaceProviderAbortContext alloc];
  *(float *)&v10 = self->_backlightDimmedFactor;
  BYTE4(v13) = self->_displayStateClientSupported;
  BYTE3(v13) = self->_lock_kernelSpecialMode;
  BYTE2(v13) = self->_deviceSupportsAlwaysOnFlipbook;
  LOWORD(v13) = *(_WORD *)&self->_lock_flipbookTransparent;
  v11 = -[BLSHOSInterfaceProviderAbortContext initWithWatchdogType:cbDisplayMode:cbFlipbookState:caDisplayState:completedCADisplayState:suppressionServiceActive:flipbookTransparent:deviceSupportsAlwaysOn:deviceSupportsAlwaysOnFlipbook:kernelSpecialMode:displayStateClientSupported:backlightDimmedFactor:](v9, "initWithWatchdogType:cbDisplayMode:cbFlipbookState:caDisplayState:completedCADisplayState:suppressionServiceActive:flipbookTransparent:deviceSupportsAlwaysOn:deviceSupportsAlwaysOnFlipbook:kernelSpecialMode:displayStateClientSupported:backlightDimmedFactor:", v8, self->_lock_cbDisplayMode, self->_lock_cbFlipbookState, self->_lock_caDisplayState, self->_lock_notifiedCADisplayState, self->_lock_suppressionServiceActive, v10, v13);
  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (id)identifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setCBTransitionsDelayForTesting:(double)a3
{
  NSObject *v5;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  bls_diagnostics_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_2145AC000, v5, OS_LOG_TYPE_DEFAULT, "OSIP: setCBTransitionsDelayForTesting:%.02fs", (uint8_t *)&v6, 0xCu);
  }

  self->_cbTransitionsDelayForTesting = a3;
}

- (void)setCATransitionsDelayForTesting:(double)a3
{
  NSObject *v5;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  bls_diagnostics_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_2145AC000, v5, OS_LOG_TYPE_DEFAULT, "OSIP: setCATransitionsDelayForTesting:%.02fs", (uint8_t *)&v6, 0xCu);
  }

  self->_caTransitionsDelayForTesting = a3;
}

- (void)abortForWatchdog:(unint64_t)a3 payload:(void *)a4 payloadSize:(unsigned int)a5 explanation:(id)a6
{
  BLSHBacklightOSInterfaceProvider *v8;
  SEL v9;
  id v10;
  id v11;

  objc_msgSend(objc_retainAutorelease(a6), "UTF8String");
  if (a4 && a5)
    abort_with_payload();
  v8 = (BLSHBacklightOSInterfaceProvider *)abort_with_reason();
  -[BLSHBacklightOSInterfaceProvider panicForWatchdog:completion:](v8, v9, v10, v11);
}

- (void)panicForWatchdog:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  bls_diagnostics_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[BLSHBacklightOSInterfaceProvider panicForWatchdog:completion:].cold.2(v7);

  v8 = OSLogFlushBuffers();
  bls_diagnostics_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[BLSHBacklightOSInterfaceProvider panicForWatchdog:completion:].cold.1(v8, v9);

  v10 = dispatch_time(0, 30000000000);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __64__BLSHBacklightOSInterfaceProvider_panicForWatchdog_completion___block_invoke;
  v13[3] = &unk_24D1BC0C0;
  v14 = v5;
  v15 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_after(v10, MEMORY[0x24BDAC9B8], v13);

}

uint64_t __64__BLSHBacklightOSInterfaceProvider_panicForWatchdog_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v5;
  NSObject *v6;
  uint64_t result;
  uint64_t (*v8)(void);

  bls_diagnostics_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __64__BLSHBacklightOSInterfaceProvider_panicForWatchdog_completion___block_invoke_cold_2(a1, v2, v3);

  v4 = MEMORY[0x2199D2DA0](3072, objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
  if (!v4)
  {
    result = *(_QWORD *)(a1 + 40);
    if (!result)
      return result;
    v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  v5 = v4;
  bls_diagnostics_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    __64__BLSHBacklightOSInterfaceProvider_panicForWatchdog_completion___block_invoke_cold_1(v5, v6);

  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

- (void)writeTailspinForWatchdog:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  BLSHTailspinLogWriter *v17;

  v5 = a3;
  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = -[BLSHTailspinLogWriter initWithReason:]([BLSHTailspinLogWriter alloc], "initWithReason:", v5);
  v7 = (void *)v13[5];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__BLSHBacklightOSInterfaceProvider_writeTailspinForWatchdog_completion___block_invoke;
  v9[3] = &unk_24D1BC0E8;
  v8 = v6;
  v10 = v8;
  v11 = &v12;
  objc_msgSend(v7, "writeTailspinLogWithCompletion:", v9);

  _Block_object_dispose(&v12, 8);
}

void __72__BLSHBacklightOSInterfaceProvider_writeTailspinForWatchdog_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (BOOL)isTailspinAvailable
{
  return +[BLSHTailspinLogWriter isTailspinAvailable](BLSHTailspinLogWriter, "isTailspinAvailable");
}

- (unint64_t)flipbookDiagnosticHistoryFrameLimit
{
  return self->_flipbookDiagnosticHistoryFrameLimit;
}

- (unint64_t)flipbookDiagnosticHistoryMemoryLimit
{
  return self->_flipbookDiagnosticHistoryMemoryLimit;
}

- (BLSDisplayStateDelegate)displayStateDelegate
{
  return (BLSDisplayStateDelegate *)objc_getProperty(self, a2, 208, 1);
}

- (void)setDisplayStateDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayStateDelegate, 0);
  objc_storeStrong((id *)&self->_lock_CAWatchdogTimer, 0);
  objc_storeStrong((id *)&self->_lock_CBWatchdogTimer, 0);
  objc_storeStrong((id *)&self->_setCBDisplayModeTimer, 0);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
  objc_storeStrong((id *)&self->_displayStateControl, 0);
  objc_storeStrong((id *)&self->_displayStateClient, 0);
  objc_storeStrong((id *)&self->_lock_lastSuppressionEvent, 0);
  objc_storeStrong((id *)&self->_lock_sceneWorkspaces, 0);
  objc_storeStrong((id *)&self->_lock_sceneObservers, 0);
  objc_storeStrong((id *)&self->_criticalAssertProvider, 0);
  objc_storeStrong((id *)&self->_watchdogProvider, 0);
  objc_storeStrong((id *)&self->_platformProvider, 0);
}

- (void)initWithPlatformProvider:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)sysctlKernSpecialMode
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  int v3;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_2145AC000, v0, v1, "OSIP:%p get kernel aotMode:%x", v2, v3);
  OUTLINED_FUNCTION_2();
}

- (void)registerHandlersForService:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)setKernelAlwaysOnMode:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  int v3;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_2145AC000, v0, v1, "OSIP:%p set kernel aotMode:%x", v2, v3);
  OUTLINED_FUNCTION_2();
}

- (void)transitionToDisplayMode:withDuration:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)switchToFlipbookState:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a2 - 1) > 2)
    v3 = CFSTR("WillTurnOn");
  else
    v3 = off_24D1BC1D8[a2 - 1];
  v4 = 134218242;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  _os_log_fault_impl(&dword_2145AC000, log, OS_LOG_TYPE_FAULT, "OSIP:%p unsupported call to switchToFlipbookState:%{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)transitionToCADisplayState:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_2145AC000, a2, a3, "%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __63__BLSHBacklightOSInterfaceProvider_transitionToCADisplayState___block_invoke_109_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  NSStringFromCADisplayState();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218242;
  v7 = v3;
  v8 = 2114;
  v9 = v4;
  OUTLINED_FUNCTION_4(&dword_2145AC000, a2, v5, "OSIP:%p delayCompletionsForTesting:YES, completing delayed CATransitionToDisplayState:%{public}@", (uint8_t *)&v6);

}

- (void)addSceneObserver:forSceneIdentityToken:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_12(&dword_2145AC000, v0, (uint64_t)v0, "OSIP:%p could not find scene for token:%{public}@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)addSceneObserver:forSceneIdentityToken:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)addSceneObserver:forSceneIdentityToken:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)removeSceneObserver:forSceneIdentityToken:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

void __81__BLSHBacklightOSInterfaceProvider_didCompleteTransitionToDisplayMode_withError___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_2145AC000, a2, a3, "OSIP:%p delayCompletionsForTesting:YES, completing delayed didCompleteCBTransitionToDisplayMode", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)panicForWatchdog:(uint64_t)a1 completion:(os_log_t)log .cold.1(uint64_t a1, os_log_t log)
{
  int v3;
  __CFString *v4;
  uint8_t buf[4];
  __CFString *v6;
  uint64_t v7;

  v3 = a1;
  v7 = *MEMORY[0x24BDAC8D0];
  if ((_DWORD)a1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed:%d"), a1);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("succeeded");
  }
  *(_DWORD *)buf = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_2145AC000, log, OS_LOG_TYPE_ERROR, "panicForWatchdog: OSLogFlushBuffers() %{public}@", buf, 0xCu);
  if (v3)

}

- (void)panicForWatchdog:(os_log_t)log completion:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2145AC000, log, OS_LOG_TYPE_ERROR, "panicForWatchdog: flushing os log buffers", v1, 2u);
}

void __64__BLSHBacklightOSInterfaceProvider_panicForWatchdog_completion___block_invoke_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_2145AC000, a2, OS_LOG_TYPE_FAULT, "attempt to panic failed:%d, falling through to abort", (uint8_t *)v2, 8u);
}

void __64__BLSHBacklightOSInterfaceProvider_panicForWatchdog_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 134218242;
  v5 = 0x403E000000000000;
  v6 = 2114;
  v7 = v3;
  OUTLINED_FUNCTION_12(&dword_2145AC000, a2, a3, "panicForWatchdog: triggering panic after %lfs delay: %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

@end
