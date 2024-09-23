@implementation FPDExtensionSession

- (void)_invalidateExtensionIfPossible
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] Terminating %@ because we only have inflight requests that timed out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_2_244(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a2;
  v9 = a4;
  v10 = a5;
  fpfs_adopt_log();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "monitorProgress:", v10);
  __fp_pop_log();

}

id __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  _FPDExtensionRequestRecord *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27[2];
  id location;
  id v29;

  v7 = a2;
  v8 = a4;
  fpfs_adopt_log();
  location = 0;
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, *(id *)(a1 + 32));
  v9 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_3;
  v25[3] = &unk_1E8C79350;
  objc_copyWeak(v27, &location);
  v27[1] = a3;
  v26 = *(id *)(a1 + 40);
  v10 = (void *)MEMORY[0x1D17D1C84](v25);
  v11 = -[_FPDExtensionRequestRecord initWithSelector:proxy:timeout:queue:log:timeoutHandler:]([_FPDExtensionRequestRecord alloc], "initWithSelector:proxy:timeout:queue:log:timeoutHandler:", a3, v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), v10, *(double *)(a1 + 56));
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = *(id *)(a1 + 32);
  objc_sync_enter(v14);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v8);
  objc_sync_exit(v14);

  LODWORD(v14) = *(_DWORD *)(a1 + 72);
  if ((_DWORD)v14 != objc_msgSend(v7, "requestEffectivePid"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "addPIDToObserveSync:", objc_msgSend(v7, "requestEffectivePid"));
    if (*(int *)(a1 + 72) >= 1)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "removePIDToObserve:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "addPIDToObserve:", objc_msgSend(v7, "requestEffectivePid"));
  }
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_238;
  v21[3] = &unk_1E8C793A0;
  v15 = *(_QWORD *)(a1 + 48);
  v21[4] = *(_QWORD *)(a1 + 32);
  v22 = v8;
  v16 = *(_QWORD *)(a1 + 64);
  v23 = v15;
  v24 = v16;
  v17 = v8;
  v18 = (void *)MEMORY[0x1D17D1C84](v21);
  v19 = (void *)MEMORY[0x1D17D1C84]();

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  __fp_pop_log();

  return v19;
}

void __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[6];
  _QWORD v17[5];
  id v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;

  fpfs_adopt_log();
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 132) && (*(_QWORD *)(v2 + 32) || *(_BYTE *)(a1 + 68)))
  {
    if (*(int *)(a1 + 64) >= 1)
    {
      objc_msgSend(*(id *)(v2 + 120), "addPIDToObserveSync:");
      v2 = *(_QWORD *)(a1 + 32);
    }
    v25 = 0;
    objc_msgSend((id)v2, "_connectionWithError:", &v25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v25;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__19;
    v23[4] = __Block_byref_object_dispose__19;
    v24 = 0;
    v8 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_2;
    v17[3] = &unk_1E8C793C8;
    v17[4] = *(_QWORD *)(a1 + 32);
    v9 = v7;
    v18 = v9;
    v19 = v23;
    v20 = *(_QWORD *)(a1 + 48);
    v22 = *(_DWORD *)(a1 + 64);
    v21 = *(_QWORD *)(a1 + 56);
    v10 = (void *)MEMORY[0x1D17D1C84](v17);
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_2_244;
    v16[3] = &unk_1E8C793F0;
    v16[4] = *(_QWORD *)(a1 + 32);
    v16[5] = v23;
    v11 = (void *)MEMORY[0x1D17D1C84](v16);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CAACE8]), "initWithConnection:protocol:orError:name:requestPid:requestWillBegin:requestDidBegin:", v9, &unk_1EFBBB940, v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), *(unsigned int *)(a1 + 64), v10, v11);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    fp_current_or_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_cold_1();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "suppress");
    objc_msgSend(*(id *)(a1 + 32), "_evaluateExtensionForegroundness");

    _Block_object_dispose(v23, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CAACE8]), "initWithConnection:protocol:orError:name:requestPid:", 0, &unk_1EFBBB940, v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), *(unsigned int *)(a1 + 64));
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  __fp_pop_log();

}

uint64_t __65__FPDExtensionSession_asyncUnregisterLifetimeExtensionForObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unregisterLifetimeExtensionForObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __60__FPDExtensionSession_unregisterLifetimeExtensionForObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unregisterLifetimeExtensionForObject:", *(_QWORD *)(a1 + 40));
}

void __58__FPDExtensionSession_registerLifetimeExtensionForObject___block_invoke(uint64_t a1)
{
  double v2;
  id v3;
  uint64_t v4;
  __CFString *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id from;
  id location;
  id v12;

  fpfs_adopt_log();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "suppress");
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(*(id *)(a1 + 40), "timeout"), v2 > 0.0))
  {
    location = 0;
    objc_initWeak(&location, *(id *)(a1 + 40));
    from = 0;
    objc_initWeak(&from, *(id *)(a1 + 32));
    v3 = objc_alloc(MEMORY[0x1E0CAAC50]);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__FPDExtensionSession_registerLifetimeExtensionForObject___block_invoke_2;
    v7[3] = &unk_1E8C764B8;
    objc_copyWeak(&v8, &location);
    objc_copyWeak(&v9, &from);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(*(id *)(a1 + 40), "timeout");
    v5 = (__CFString *)objc_msgSend(v3, "initWithAction:callbackQueue:delay:", v7, v4);
    -[__CFString arm](v5, "arm");
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    v5 = CFSTR("lifetime extender without timeout");
  }
  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));
  objc_sync_exit(v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "addPIDToObserve:", objc_msgSend(*(id *)(a1 + 40), "requestEffectivePID"));
  __fp_pop_log();

}

uint64_t __58__FPDExtensionSession_processMonitor_didBecomeForeground___block_invoke(uint64_t a1)
{
  unsigned __int8 *v2;
  int v3;
  int v4;
  uint64_t result;
  id *v6;

  v2 = *(unsigned __int8 **)(a1 + 32);
  v3 = v2[133];
  v4 = *(unsigned __int8 *)(a1 + 40);
  result = objc_msgSend(v2, "_evaluateExtensionForegroundness");
  if (v3 != v4)
  {
    v6 = *(id **)(a1 + 32);
    if (*(_BYTE *)(a1 + 40))
      return objc_msgSend(v6, "_notifyNetworkingProviderMonitorWithState:", 1);
    else
      return objc_msgSend(v6[14], "arm");
  }
  return result;
}

void __53__FPDExtensionSession__invalidateExtensionIfPossible__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(v5, "proxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "proxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "timeoutState");

    if (v8 == 2)
      v9 = a1[5];
    else
      v9 = a1[6];
    *(_BYTE *)(*(_QWORD *)(v9 + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1[4] + 56), "removeObjectForKey:", v10);
  }

}

- (void)unregisterLifetimeExtensionForObject:(id)a3
{
  id v4;
  NSObject *sessionQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__FPDExtensionSession_unregisterLifetimeExtensionForObject___block_invoke;
  block[3] = &unk_1E8C75850;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(sessionQueue, block);

}

- (void)registerLifetimeExtensionForObject:(id)a3
{
  id v4;
  NSObject *sessionQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__FPDExtensionSession_registerLifetimeExtensionForObject___block_invoke;
  block[3] = &unk_1E8C75850;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(sessionQueue, block);

}

- (void)processMonitor:(id)a3 didBecomeForeground:(BOOL)a4
{
  NSObject *sessionQueue;
  _QWORD v5[5];
  BOOL v6;

  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__FPDExtensionSession_processMonitor_didBecomeForeground___block_invoke;
  v5[3] = &unk_1E8C769A0;
  v5[4] = self;
  v6 = a4;
  dispatch_async(sessionQueue, v5);
}

- (id)newForegroundAssertion
{
  return -[FPDExtensionSession newAssertionWithAttributeName:reason:](self, "newAssertionWithAttributeName:reason:", CFSTR("FileProviderForeground"), CFSTR("foreground assertion from fileproviderd"));
}

- (id)newFileProviderProxyWithTimeoutValue:(double)a3 pid:(int)a4 createIfNeeded:(BOOL)a5
{
  NSObject *sessionQueue;
  id v6;
  _QWORD block[8];
  int v9;
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__19;
  v15 = __Block_byref_object_dispose__19;
  v16 = 0;
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke;
  block[3] = &unk_1E8C79418;
  v10 = a5;
  block[4] = self;
  block[5] = &v11;
  v9 = a4;
  *(double *)&block[6] = a3;
  block[7] = a2;
  dispatch_sync(sessionQueue, block);
  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)newFileProviderProxyWithTimeout:(double)a3 pid:(int)a4
{
  return -[FPDExtensionSession newFileProviderProxyWithTimeoutValue:pid:createIfNeeded:](self, "newFileProviderProxyWithTimeoutValue:pid:createIfNeeded:", *(_QWORD *)&a4, 1, a3);
}

- (id)newAssertionWithAttributeName:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  int IsEnabled;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  _EXExtensionProcess *sessionProcess;
  int pid;
  id v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  _BYTE location[12];
  __int16 v28;
  _BYTE v29[18];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  IsEnabled = FPFeatureFlagHelenaIsEnabled();
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (IsEnabled)
  {
    if (v10)
    {
      sessionProcess = self->_sessionProcess;
      *(_DWORD *)location = 138412802;
      *(_QWORD *)&location[4] = v6;
      v28 = 2112;
      *(_QWORD *)v29 = sessionProcess;
      *(_WORD *)&v29[8] = 2112;
      *(_QWORD *)&v29[10] = v7;
      _os_log_debug_impl(&dword_1CF55F000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] creating a new assertion %@ for %@ (%@)", location, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithProcessIdentifier:", self->_sessionProcess);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v10)
    {
      pid = self->_pid;
      *(_DWORD *)location = 138412802;
      *(_QWORD *)&location[4] = v6;
      v28 = 1024;
      *(_DWORD *)v29 = pid;
      *(_WORD *)&v29[4] = 2112;
      *(_QWORD *)&v29[6] = v7;
      _os_log_debug_impl(&dword_1CF55F000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] creating a new assertion %@ for %u (%@)", location, 0x1Cu);
    }

    objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", self->_pid);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
  v13 = objc_alloc(MEMORY[0x1E0D87C98]);
  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.FileProvider"), v6);
  v14 = objc_claimAutoreleasedReturnValue();
  v26 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithExplanation:target:attributes:", v7, v12, v15);

  *(_QWORD *)location = 0;
  objc_initWeak((id *)location, self);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __60__FPDExtensionSession_newAssertionWithAttributeName_reason___block_invoke;
  v24[3] = &unk_1E8C79480;
  objc_copyWeak(&v25, (id *)location);
  objc_msgSend(v16, "setInvalidationHandler:", v24);
  v23 = 0;
  LOBYTE(v14) = objc_msgSend(v16, "acquireWithError:", &v23);
  v17 = v23;
  if ((v14 & 1) != 0)
  {
    v18 = v16;
  }
  else
  {
    fp_current_or_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[FPDExtensionSession newAssertionWithAttributeName:reason:].cold.1();

    v18 = 0;
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)location);

  return v18;
}

- (void)asyncUnregisterLifetimeExtensionForObject:(id)a3
{
  id v4;
  NSObject *sessionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__FPDExtensionSession_asyncUnregisterLifetimeExtensionForObject___block_invoke;
  v7[3] = &unk_1E8C75850;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(sessionQueue, v7);

}

- (void)_unregisterLifetimeExtensionForObject:(id)a3
{
  id v4;
  FPDExtensionSession *v5;
  void *v6;
  void *v7;

  v4 = a3;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  v5 = self;
  objc_sync_enter(v5);
  -[NSMapTable objectForKey:](v5->_lifetimeExtenders, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](v5->_lifetimeExtenders, "removeObjectForKey:", v4);
  objc_sync_exit(v5);

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "suppress");
    -[FPDProcessMonitor removePIDToObserve:](v5->_processMonitor, "removePIDToObserve:", objc_msgSend(v4, "requestEffectivePID"));
  }
  -[FPDExtensionSession _invalidateExtensionIfPossible](v5, "_invalidateExtensionIfPossible");

  __fp_pop_log();
}

- (void)_notifyNetworkingProviderMonitorWithState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  int *p_notifyTokenForFramework;
  uint64_t v8;
  unsigned int notifyTokenForFramework;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  -[NSString stringByAppendingString:](self->_providerIdentifier, "stringByAppendingString:", CFSTR(".foreground"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fp_libnotifyPerUserNotificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  notifyTokenForFramework = self->_notifyTokenForFramework;
  p_notifyTokenForFramework = &self->_notifyTokenForFramework;
  v8 = notifyTokenForFramework;
  if (notifyTokenForFramework != -1)
    goto LABEL_2;
  v13 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v14 = getbrc_notify_register_checkSymbolLoc_ptr;
  v19 = getbrc_notify_register_checkSymbolLoc_ptr;
  if (!getbrc_notify_register_checkSymbolLoc_ptr)
  {
    v15 = (void *)CloudDocsLibrary();
    v14 = dlsym(v15, "brc_notify_register_check");
    v17[3] = (uint64_t)v14;
    getbrc_notify_register_checkSymbolLoc_ptr = v14;
  }
  _Block_object_dispose(&v16, 8);
  if (!v14)
    -[FPDExtensionSession _notifyNetworkingProviderMonitorWithState:].cold.1();
  if (!((unsigned int (*)(uint64_t, int *))v14)(v13, p_notifyTokenForFramework))
  {
    v8 = *p_notifyTokenForFramework;
LABEL_2:
    v10 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v11 = getbrc_notify_set_state_and_postSymbolLoc_ptr;
    v19 = getbrc_notify_set_state_and_postSymbolLoc_ptr;
    if (!getbrc_notify_set_state_and_postSymbolLoc_ptr)
    {
      v12 = (void *)CloudDocsLibrary();
      v11 = dlsym(v12, "brc_notify_set_state_and_post");
      v17[3] = (uint64_t)v11;
      getbrc_notify_set_state_and_postSymbolLoc_ptr = v11;
    }
    _Block_object_dispose(&v16, 8);
    if (!v11)
      -[FPDExtensionSession _notifyNetworkingProviderMonitorWithState:].cold.2();
    ((void (*)(uint64_t, _BOOL4, uint64_t))v11)(v8, v3, v10);
  }

}

- (void)_evaluateExtensionForegroundness
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] ┏%llx evaluating extension foregroundness", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (id)_connectionWithError:(id *)a3
{
  NSXPCConnection *connection;
  NSXPCConnection *v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  id v10;
  NSXPCConnection *v11;
  void *v12;
  NSObject *v13;
  char IsEnabled;
  RBSAssertion *foregroundAssertion;
  RBSAssertion *backgroundAssertion;
  FPDXPCDomainServicer *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSXPCConnection *v23;
  void *v24;
  uint64_t v25;
  NSXPCConnection *v26;
  id v27;
  NSXPCConnection *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  NSXPCConnection *v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  NSXPCConnection *v62;
  id v63;
  id v64;
  _QWORD v65[4];
  NSXPCConnection *v66;
  id v67;
  id v68;
  id location;
  id v70[2];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  connection = self->_connection;
  if (connection)
  {
    v6 = connection;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
    objc_msgSend(WeakRetained, "provider");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (WeakRetained && v8)
    {
      v70[0] = 0;
      -[FPDExtensionSession _setUpConnectionWithError:](self, "_setUpConnectionWithError:", v70);
      v10 = v70[0];
      v11 = self->_connection;
      if (self->_connection)
      {
        if (FPFeatureFlagHelenaIsEnabled())
        {
          if (!self->_sessionProcess)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ connection -> session process"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            fp_current_or_default_log();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
              __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

            __assert_rtn("-[FPDExtensionSession _connectionWithError:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionSession.m", 604, (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
          }
        }
        else if (!self->_pid)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ connection -> pid"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          fp_current_or_default_log();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
            __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

          __assert_rtn("-[FPDExtensionSession _connectionWithError:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionSession.m", 606, (const char *)objc_msgSend(objc_retainAutorelease(v51), "UTF8String"));
        }
        v56 = v10;
        IsEnabled = FPFeatureFlagHelenaIsEnabled();
        -[RBSAssertion invalidate](self->_foregroundAssertion, "invalidate");
        foregroundAssertion = self->_foregroundAssertion;
        self->_foregroundAssertion = 0;

        -[RBSAssertion invalidate](self->_backgroundAssertion, "invalidate");
        backgroundAssertion = self->_backgroundAssertion;
        self->_backgroundAssertion = 0;

        if ((IsEnabled & 1) == 0)
        {
          -[FPDExtensionSession _evaluateExtensionForegroundness](self, "_evaluateExtensionForegroundness");
          -[NSExtension _dropAssertion](self->_extension, "_dropAssertion");
        }
        v17 = [FPDXPCDomainServicer alloc];
        objc_msgSend(WeakRetained, "provider");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "manager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "server");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "providerDomainID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[FPDXPCDomainServicer initWithServer:providerDomainID:domain:connection:](v17, "initWithServer:providerDomainID:domain:connection:", v20, v21, WeakRetained, v11);
        v23 = v11;
        v24 = (void *)v22;

        location = 0;
        objc_initWeak(&location, self);
        v25 = MEMORY[0x1E0C809B0];
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v65[2] = __44__FPDExtensionSession__connectionWithError___block_invoke;
        v65[3] = &unk_1E8C792E0;
        objc_copyWeak(&v68, &location);
        v55 = v23;
        v26 = v23;
        v66 = v26;
        v27 = v24;
        v67 = v27;
        -[NSXPCConnection setInterruptionHandler:](v26, "setInterruptionHandler:", v65);
        v61[0] = v25;
        v61[1] = 3221225472;
        v61[2] = __44__FPDExtensionSession__connectionWithError___block_invoke_2;
        v61[3] = &unk_1E8C792E0;
        objc_copyWeak(&v64, &location);
        v28 = v26;
        v62 = v28;
        v57 = v27;
        v63 = v57;
        -[NSXPCConnection setInvalidationHandler:](v28, "setInvalidationHandler:", v61);
        v29 = objc_alloc(MEMORY[0x1E0CAACF8]);
        objc_msgSend(WeakRetained, "providerDomainID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v29, "initWithProviderDomainIdentifier:", v30);
        -[NSXPCConnection fp_annotateWithXPCSanitizer:](v28, "fp_annotateWithXPCSanitizer:", v31);

        objc_msgSend(WeakRetained, "nsDomainOrNilForDefault");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v32)
        {
          v58 = v32;
        }
        else
        {
          v34 = objc_alloc(MEMORY[0x1E0CAAD00]);
          v58 = (id)objc_msgSend(v34, "initWithIdentifier:displayName:pathRelativeToDocumentStorage:", *MEMORY[0x1E0CAAB38], &stru_1E8C795D8, &stru_1E8C795D8);
        }

        objc_msgSend(WeakRetained, "provider");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "descriptor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "personaIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setPersonaIdentifier:", v37);

        -[NSXPCConnection remoteObjectProxy](v28, "remoteObjectProxy");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v59[0] = v25;
        v59[1] = 3221225472;
        v59[2] = __44__FPDExtensionSession__connectionWithError___block_invoke_2_84;
        v59[3] = &unk_1E8C753A8;
        v39 = WeakRetained;
        v60 = v39;
        objc_msgSend(v38, "remoteObjectProxyWithErrorHandler:", v59);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "providerDomainForDomain:", v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v41, "isUsingFPFS"))
        {
          objc_msgSend(v39, "nsDomainOrNilForDefault");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
          {
            objc_msgSend(v39, "volume");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v43, "role");

            if (v44 != 3)
            {
              objc_msgSend(v41, "domain");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "backingStoreIdentity");
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v46)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ missing backing store identity for domain %@"), v39);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                fp_current_or_default_log();
                v54 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
                  __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

                __assert_rtn("-[FPDExtensionSession _connectionWithError:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionSession.m", 683, (const char *)objc_msgSend(objc_retainAutorelease(v53), "UTF8String"));
              }
            }
          }
        }
        -[FPDExtensionSession _alternateContentsDictionary](self, "_alternateContentsDictionary");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "defaultBackend");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "domainVersion");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "beginRequestWithDomain:alternateContentsDictionary:domainServicer:providerDomain:domainVersion:completionHandler:", v58, v47, v57, v41, v49, &__block_literal_global_89);

        v6 = v28;
        objc_destroyWeak(&v64);

        objc_destroyWeak(&v68);
        objc_destroyWeak(&location);

        v11 = v55;
        v10 = v56;
      }
      else
      {
        v6 = 0;
        if (a3)
          *a3 = objc_retainAutorelease(v10);
      }

    }
    else if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("nil domain %@ or provider %@"), WeakRetained, v8);
      v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (FPDExtensionSession)initWithDomain:(id)a3 extension:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  FPDExtensionSession *v11;
  FPDExtensionSession *v12;
  uint64_t v13;
  OS_os_log *log;
  void *v15;
  NSExtension *v16;
  NSExtension *extension;
  uint64_t v18;
  NSMutableDictionary *inflightProxies;
  uint64_t v20;
  NSMapTable *lifetimeExtenders;
  OS_dispatch_queue **p_sessionQueue;
  id WeakRetained;
  uint64_t v24;
  NSString *providerIdentifier;
  uint64_t v26;
  NSUUID *sessionUUID;
  id v28;
  const char *v29;
  NSObject *v30;
  dispatch_queue_t v31;
  OS_dispatch_queue *callbackQueue;
  NSCountedSet *v33;
  NSCountedSet *observingBundleIDs;
  void *v35;
  double v36;
  double v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  FPGracePeriodTimer *gracePeriodTimer;
  id v42;
  uint64_t v43;
  FPGracePeriodTimer *networkingGracePeriodTimer;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  id location;
  objc_super v51;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v51.receiver = self;
  v51.super_class = (Class)FPDExtensionSession;
  v11 = -[FPDExtensionSession init](&v51, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_domain, v8);
    objc_msgSend(v8, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    log = v12->_log;
    v12->_log = (OS_os_log *)v13;

    objc_storeWeak((id *)&v12->_fpdExtension, v9);
    if ((FPFeatureFlagHelenaIsEnabled() & 1) == 0)
    {
      objc_msgSend(v9, "extension");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSExtension _wantsProcessPerRequest](v12->_extension, "_wantsProcessPerRequest"))
      {
        objc_msgSend(v15, "_freshCopy");
        v16 = (NSExtension *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = v15;
      }
      extension = v12->_extension;
      v12->_extension = v16;

    }
    v18 = objc_opt_new();
    inflightProxies = v12->_inflightProxies;
    v12->_inflightProxies = (NSMutableDictionary *)v18;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v20 = objc_claimAutoreleasedReturnValue();
    lifetimeExtenders = v12->_lifetimeExtenders;
    v12->_lifetimeExtenders = (NSMapTable *)v20;

    p_sessionQueue = &v12->_sessionQueue;
    objc_storeStrong((id *)&v12->_sessionQueue, a5);
    WeakRetained = objc_loadWeakRetained((id *)&v12->_fpdExtension);
    objc_msgSend(WeakRetained, "identifier");
    v24 = objc_claimAutoreleasedReturnValue();
    providerIdentifier = v12->_providerIdentifier;
    v12->_providerIdentifier = (NSString *)v24;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v26 = objc_claimAutoreleasedReturnValue();
    sessionUUID = v12->_sessionUUID;
    v12->_sessionUUID = (NSUUID *)v26;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("extension session queue callback queue (%@)"), v12->_providerIdentifier);
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = (const char *)objc_msgSend(v28, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = dispatch_queue_create(v29, v30);
    callbackQueue = v12->_callbackQueue;
    v12->_callbackQueue = (OS_dispatch_queue *)v31;

    v12->_notifyTokenForFramework = -1;
    v33 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    observingBundleIDs = v12->_observingBundleIDs;
    v12->_observingBundleIDs = v33;

    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.fileproviderd"));
    objc_msgSend(v35, "doubleForKey:", CFSTR("session-grace-period-delay"));
    v37 = v36;
    location = 0;
    objc_initWeak(&location, v12);
    v38 = objc_alloc(MEMORY[0x1E0CAAC50]);
    if (v37 == 0.0)
      v37 = 5.0;
    v39 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __54__FPDExtensionSession_initWithDomain_extension_queue___block_invoke;
    v48[3] = &unk_1E8C75E70;
    objc_copyWeak(&v49, &location);
    v40 = objc_msgSend(v38, "initWithAction:callbackQueue:delay:", v48, *p_sessionQueue, v37);
    gracePeriodTimer = v12->_gracePeriodTimer;
    v12->_gracePeriodTimer = (FPGracePeriodTimer *)v40;

    v42 = objc_alloc(MEMORY[0x1E0CAAC50]);
    v46[0] = v39;
    v46[1] = 3221225472;
    v46[2] = __54__FPDExtensionSession_initWithDomain_extension_queue___block_invoke_14;
    v46[3] = &unk_1E8C75E70;
    objc_copyWeak(&v47, &location);
    v43 = objc_msgSend(v42, "initWithAction:callbackQueue:delay:", v46, *p_sessionQueue, 30.0);
    networkingGracePeriodTimer = v12->_networkingGracePeriodTimer;
    v12->_networkingGracePeriodTimer = (FPGracePeriodTimer *)v43;

    objc_destroyWeak(&v47);
    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);

  }
  return v12;
}

void __54__FPDExtensionSession_initWithDomain_extension_queue___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t buf[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    fpfs_adopt_log();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = WeakRetained[11];
      *(_DWORD *)buf = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_DEFAULT, "[WARNING] %@: extension request grace timer ran out", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "__invalidate");
    __fp_pop_log();

  }
}

void __54__FPDExtensionSession_initWithDomain_extension_queue___block_invoke_14(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_networkingGracePeriodOver");

}

- (void)dealloc
{
  int notifyTokenForFramework;
  void *v4;
  NSObject *v5;
  objc_super v6;

  notifyTokenForFramework = self->_notifyTokenForFramework;
  if (notifyTokenForFramework != -1)
    notify_cancel(notifyTokenForFramework);
  if (self->_processMonitor)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ someone forgot to tear this down"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDExtensionSession dealloc]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionSession.m", 211, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  }
  v6.receiver = self;
  v6.super_class = (Class)FPDExtensionSession;
  -[FPDExtensionSession dealloc](&v6, sel_dealloc);
}

- (void)_invalidate
{
  -[FPGracePeriodTimer suppress](self->_gracePeriodTimer, "suppress");
  -[FPDExtensionSession __invalidate](self, "__invalidate");
}

- (void)__invalidate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] Cancelling extension with request identifier %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (id)_alternateContentsDictionary
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  __int128 v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_fpdExtension);
  objc_msgSend(WeakRetained, "manager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alternateContentsDictionaryForProviderIdentifier:", self->_providerIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v24;
    *(_QWORD *)&v9 = 138412546;
    v19 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v13, v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        objc_msgSend(MEMORY[0x1E0CAACB8], "wrapperWithURL:extensionClass:error:", v14, "com.apple.fileprovider.read-write", &v22);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v22;
        if (v15)
        {
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v13);
        }
        else
        {
          fp_current_or_default_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v14, "fp_shortDescription");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "fp_prettyDescription");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v19;
            v28 = v21;
            v29 = 2112;
            v30 = v20;
            _os_log_error_impl(&dword_1CF55F000, v17, OS_LOG_TYPE_ERROR, "[ERROR] couldn't get a URL wrapper for URL %@: %@ - this means iWork forgot to remove the alternate URL", buf, 0x16u);

          }
        }

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v10);
  }

  return v6;
}

- (BOOL)terminateExtensionWithReason:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  int pid;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  BOOL v15;
  void *v16;
  NSExtension *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  id v30;
  uint8_t buf[4];
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (FPFeatureFlagHelenaIsEnabled())
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      pid = self->_pid;
      *(_DWORD *)buf = 67109120;
      v32 = pid;
      _os_log_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_INFO, "[INFO] Terminating session process for pid %u", buf, 8u);
    }

    if (!self->_sessionProcess)
    {
      v15 = 1;
LABEL_30:
      -[FPDExtensionSession __invalidate](self, "__invalidate");
      goto LABEL_31;
    }
    objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatching:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E00]), "initWithExplanation:", v6);
    objc_msgSend(v10, "setReportType:", 0);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E08]), "initWithPredicate:context:", v9, v10);
    v30 = 0;
    v12 = objc_msgSend(v11, "execute:", &v30);
    v13 = v30;
    v14 = v13;
    if ((v12 & 1) != 0)
    {
      v15 = 1;
LABEL_29:
      -[_EXExtensionProcess invalidate](self->_sessionProcess, "invalidate");

      goto LABEL_30;
    }
    objc_msgSend(v13, "domain");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0D87E40]))
    {
      v27 = objc_msgSend(v14, "code");

      if (v27 == 3)
      {
        fp_current_or_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CF55F000, v28, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to terminate the session, process was not found", buf, 2u);
        }
        v15 = 1;
LABEL_28:

        goto LABEL_29;
      }
    }
    else
    {

    }
    if (a4)
      *a4 = objc_retainAutorelease(v14);
    fp_current_or_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[FPDExtensionSession terminateExtensionWithReason:error:].cold.1();
    v15 = 0;
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0D7D430], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = self->_extension;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSExtension _plugIn](v17, "_plugIn");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "url");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v16, "terminatePlugInAtURL:withError:", v19, a4);

    if ((v20 & 1) == 0)
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      -[NSExtension identifier](v17, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("[ASSERT] ‼️ UNREACHABLE: failed to terminate extension %@: %@"), v22, *a4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

      __assert_rtn("-[FPDExtensionSession terminateExtensionWithReason:error:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionSession.m", 340, (const char *)objc_msgSend(objc_retainAutorelease(v23), "UTF8String"));
    }
  }
  else
  {
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[FPDExtensionSession terminateExtensionWithReason:error:].cold.3(v17, v25);

    -[NSExtension _kill:](v17, "_kill:", 9);
  }
  -[FPDExtensionSession __invalidate](self, "__invalidate");

  v15 = 1;
LABEL_31:

  return v15;
}

- (BOOL)_setUpConnectionWithError:(id *)a3
{
  if (FPFeatureFlagHelenaIsEnabled())
    return -[FPDExtensionSession _setUpEXConnectionWithError:](self, "_setUpEXConnectionWithError:", a3);
  else
    return -[FPDExtensionSession _setUpPKConnectionWithError:](self, "_setUpPKConnectionWithError:", a3);
}

- (BOOL)_setUpEXConnectionWithError:(id *)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  _EXExtensionProcess *v22;
  _EXExtensionProcess *sessionProcess;
  NSObject *v24;
  id v25;
  NSXPCConnection *v26;
  NSXPCConnection *connection;
  void *v28;
  NSXPCConnection *v29;
  BOOL v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  dispatch_time_t v37;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  objc_msgSend(WeakRetained, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "personaIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isSharedIPad");

    if ((v10 & 1) == 0)
    {
      fp_current_or_default_log();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[FPDExtensionSession _setUpEXConnectionWithError:].cold.3();

      if (a3)
      {
        FPInvalidParameterError();
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "userPersonaUniqueString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        v30 = 0;
        goto LABEL_16;
      }
      fp_current_or_default_log();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
        -[FPDExtensionSession _setUpEXConnectionWithError:].cold.2();
      goto LABEL_27;
    }
  }
  v11 = objc_alloc(MEMORY[0x1E0CAA538]);
  v12 = objc_loadWeakRetained((id *)&self->_fpdExtension);
  objc_msgSend(v12, "extensionRecord");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithApplicationExtensionRecord:", v13);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA540]), "initWithIdentifier:", self->_sessionUUID);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA550]), "initWithExtensionIdentity:instanceIdentifier:", v14, v15);
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isSharedIPad");

  if ((v18 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CAA558], "personaWithPersonaUniqueString:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLaunchPersona:", v19);

  }
  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.extensionkit"), CFSTR("HandleMessage"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAssertionAttributes:", v21);

  objc_msgSend(MEMORY[0x1E0CAA548], "extensionProcessWithConfiguration:error:", v16, a3);
  v22 = (_EXExtensionProcess *)objc_claimAutoreleasedReturnValue();
  sessionProcess = self->_sessionProcess;
  self->_sessionProcess = v22;

  -[FPDExtensionSession _evaluateExtensionForegroundness](self, "_evaluateExtensionForegroundness");
  fp_current_or_default_log();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = objc_loadWeakRetained((id *)&self->_fpdExtension);
    *(_DWORD *)buf = 138412546;
    v44 = v25;
    v45 = 2114;
    v46 = v15;
    _os_log_impl(&dword_1CF55F000, v24, OS_LOG_TYPE_INFO, "[INFO] [helena] Creating new XPC connection for extension %@, instance %{public}@", buf, 0x16u);

  }
  v26 = (NSXPCConnection *)-[_EXExtensionProcess newXPCConnectionWithError:](self->_sessionProcess, "newXPCConnectionWithError:", a3);
  connection = self->_connection;
  self->_connection = v26;

  FPXVendorXPCInterface();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v28);

  -[NSXPCConnection resume](self->_connection, "resume");
  v29 = self->_connection;
  v30 = v29 != 0;
  if (!a3 || v29)
    goto LABEL_15;
  objc_msgSend(*a3, "domain");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v31, "isEqual:", *MEMORY[0x1E0CAA528]))
    goto LABEL_13;
  v32 = objc_msgSend(*a3, "code");

  if (v32 == 6)
  {
    v33 = (void *)MEMORY[0x1E0CB3940];
    v34 = objc_loadWeakRetained((id *)&self->_fpdExtension);
    objc_msgSend(v34, "identifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("Failed to create new XPC connection for provider %@\nError: %@"), v35, *a3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)objc_opt_new();
    objc_msgSend(v36, "requestTapToRadarWithTitle:description:keywords:attachments:displayReason:", CFSTR("Failed to create XPC connection"), v31, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], CFSTR("a problem launching an extension was detected"));

    if ((os_variant_has_internal_content() & 1) != 0)
    {
      v37 = dispatch_time(0, 30000000000);
      dispatch_after(v37, MEMORY[0x1E0C80D38], &__block_literal_global_26);
LABEL_13:

      goto LABEL_14;
    }
    fp_current_or_default_log();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[FPDExtensionSession _setUpEXConnectionWithError:].cold.1();
LABEL_27:

    exit(1);
  }
LABEL_14:
  FPProxyNotFoundError();
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

LABEL_16:
  return v30;
}

void __51__FPDExtensionSession__setUpEXConnectionWithError___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  fp_current_or_default_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_1CF55F000, v0, OS_LOG_TYPE_ERROR, "[ERROR] Exiting with delay after an unrecoverable extension launch error was detected.", v1, 2u);
  }

  exit(1);
}

- (BOOL)_setUpPKConnectionWithError:(id *)a3
{
  NSExtension *v5;
  qos_class_t v6;
  NSObject *v7;
  int pid;
  NSObject *v9;
  dispatch_time_t v10;
  uint64_t v11;
  NSExtension *v12;
  NSObject *v13;
  dispatch_block_t v14;
  dispatch_qos_class_t v15;
  NSObject *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  id v20;
  NSExtension *v21;
  void (**v22)(void);
  void *v23;
  FPDExtensionSession *v24;
  NSObject *v25;
  void *v26;
  _BOOL4 v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSXPCConnection *connection;
  NSXPCConnection *v34;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _QWORD v40[4];
  id v41;
  NSExtension *v42;
  uint8_t *v43;
  __int128 *v44;
  _QWORD block[5];
  NSObject *v46;
  NSExtension *v47;
  int v48;
  __int128 v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint8_t buf[8];
  __int128 v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = self->_extension;
  v6 = qos_class_self();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v6;
    LOWORD(v55) = 2048;
    *(_QWORD *)((char *)&v55 + 2) = 0x4072C00000000000;
    _os_log_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_INFO, "[INFO] connection QoS is %u, setting bringup watchdog timeout to %g", buf, 0x12u);
  }

  pid = self->_pid;
  v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_callbackQueue);
  dispatch_set_qos_class_fallback();
  v10 = dispatch_time(0, 300000000000);
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__FPDExtensionSession__setUpPKConnectionWithError___block_invoke;
  block[3] = &unk_1E8C79290;
  block[4] = self;
  v46 = v9;
  v12 = v5;
  v47 = v12;
  v48 = pid;
  v13 = v46;
  v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_source_set_event_handler(v13, v14);

  dispatch_resume(v13);
  if (v6 <= QOS_CLASS_UTILITY)
    v15 = QOS_CLASS_UTILITY;
  else
    v15 = v6;
  if (v6 <= 0x10)
  {
    fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[FPDExtensionSession _setUpPKConnectionWithError:].cold.2(v15, v6, v16);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&v55 = buf;
  *((_QWORD *)&v55 + 1) = 0x3032000000;
  v56 = __Block_byref_object_copy__19;
  v57 = __Block_byref_object_dispose__19;
  v58 = 0;
  *(_QWORD *)&v49 = 0;
  *((_QWORD *)&v49 + 1) = &v49;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__19;
  v52 = __Block_byref_object_dispose__19;
  v53 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  objc_msgSend(WeakRetained, "nsDomain");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "personaIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v40[0] = v11;
  v40[1] = 3221225472;
  v40[2] = __51__FPDExtensionSession__setUpPKConnectionWithError___block_invoke_65;
  v40[3] = &unk_1E8C792B8;
  v20 = v19;
  v41 = v20;
  v43 = buf;
  v21 = v12;
  v42 = v21;
  v44 = &v49;
  v22 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v15, 0, v40);
  v22[2]();
  if (a3)
  {
    v23 = *(void **)(*((_QWORD *)&v49 + 1) + 40);
    if (v23)
      *a3 = objc_retainAutorelease(v23);
  }

  _Block_object_dispose(&v49, 8);
  dispatch_suspend(v13);
  v24 = self;
  objc_sync_enter(v24);
  objc_msgSend(0, "invalidate");
  objc_sync_exit(v24);

  if (v24->_invalidated)
  {
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      -[NSExtension identifier](v21, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v49) = 138412290;
      *(_QWORD *)((char *)&v49 + 4) = v26;
      _os_log_impl(&dword_1CF55F000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] app extension for %@ has been invalidated during connection setup...", (uint8_t *)&v49, 0xCu);

    }
    goto LABEL_24;
  }
  if (a3 && !*(_QWORD *)(v55 + 40))
  {
    objc_msgSend(*a3, "domain");
    v25 = objc_claimAutoreleasedReturnValue();
    if (!-[NSObject isEqualToString:](v25, "isEqualToString:", *MEMORY[0x1E0D7D468]))
    {
LABEL_24:

      goto LABEL_25;
    }
    v27 = objc_msgSend(*a3, "code") == 16;

    if (v27)
    {
      fp_current_or_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        -[NSExtension identifier](v21, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v49) = 138543362;
        *(_QWORD *)((char *)&v49 + 4) = v29;
        _os_log_impl(&dword_1CF55F000, v28, OS_LOG_TYPE_DEFAULT, "[WARNING] encountered an app extension version conflict error, terminating the existing extension and retrying (%{public}@)...", (uint8_t *)&v49, 0xCu);

      }
      if (-[FPDExtensionSession terminateExtensionWithReason:error:](v24, "terminateExtensionWithReason:error:", CFSTR("app extension version conflict"), a3))
      {
        exit(0);
      }
      v36 = (void *)MEMORY[0x1E0CB3940];
      -[NSExtension identifier](v21, "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringWithFormat:", CFSTR("[ASSERT] ‼️ UNREACHABLE: failed to terminate extension %@"), v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

      __assert_rtn("-[FPDExtensionSession _setUpPKConnectionWithError:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionSession.m", 546, (const char *)objc_msgSend(objc_retainAutorelease(v38), "UTF8String"));
    }
  }
LABEL_25:
  v30 = *(void **)(v55 + 40);
  if (v30)
  {
    objc_storeStrong((id *)&v24->_requestIdentifier, v30);
    -[NSExtension _extensionContextForUUID:](self->_extension, "_extensionContextForUUID:", *(_QWORD *)(v55 + 40));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_auxiliaryConnection");
    v32 = objc_claimAutoreleasedReturnValue();
    connection = v24->_connection;
    v24->_connection = (NSXPCConnection *)v32;

    self->_pid = -[NSXPCConnection processIdentifier](v24->_connection, "processIdentifier");
  }
  v34 = v24->_connection;
  if (!v34 && a3)
  {
    FPProxyNotFoundError();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(buf, 8);

  return v34 != 0;
}

void __51__FPDExtensionSession__setUpPKConnectionWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  fpfs_adopt_log();
  objc_claimAutoreleasedReturnValue();
  dispatch_suspend(*(dispatch_object_t *)(a1 + 40));
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v3;
    _os_log_error_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_ERROR, "[ERROR] Extension bringup for %@ timed out.", buf, 0xCu);

  }
  if (!*(_DWORD *)(a1 + 56))
    goto LABEL_5;
  v4 = (void *)MEMORY[0x1E0D87D68];
  v5 = (void *)MEMORY[0x1E0D87DA0];
  objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateMatchingTarget:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleForPredicate:error:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "currentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (objc_msgSend(v9, "taskState") == 3)
      v10 = CFSTR("The extension is suspended.");
    else
      v10 = CFSTR("The extension is NOT suspended.");
  }
  else
  {
LABEL_5:
    v10 = CFSTR("Cannot determine a pid for the extension.");
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 132))
    v11 = CFSTR("This extension session had been invalidated.");
  else
    v11 = CFSTR("The extension session was ostensibly valid.");
  v12 = v11;
  fp_current_or_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = v14;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v10;
    _os_log_fault_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_FAULT, "[CRIT] Extension bringup for %@ timed out. %@ %@", buf, 0x20u);

  }
  exit(0);
}

void __51__FPDExtensionSession__setUpPKConnectionWithError___block_invoke_65(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id obj;
  id v18;
  id v19;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPersona");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  objc_msgSend(v3, "userPersonaUniqueString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 == (void *)a1[4]
    || (objc_msgSend(v4, "isEqualToString:") & 1) != 0
    || !voucher_process_can_use_arbitrary_personas())
  {
    v10 = 0;
  }
  else
  {
    v18 = 0;
    v6 = (void *)objc_msgSend(v3, "copyCurrentPersonaContextWithError:", &v18);
    v7 = v18;
    v8 = v19;
    v19 = v6;

    if (v7)
    {
      fp_current_or_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[FPDDomainExtensionBackend startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:].cold.2();

    }
    objc_msgSend(v3, "generateAndRestorePersonaContextWithPersonaUniqueString:", a1[4]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      fp_current_or_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __51__FPDExtensionSession__setUpPKConnectionWithError___block_invoke_65_cold_1();

    }
  }
  v12 = (void *)a1[5];
  v13 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v13 + 40);
  objc_msgSend(v12, "beginExtensionRequestWithOptions:inputItems:error:", 1, MEMORY[0x1E0C9AA60], &obj);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v13 + 40), obj);
  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  _FPRestorePersona();
}

void __44__FPDExtensionSession__connectionWithError___block_invoke(id *a1)
{
  _QWORD *WeakRetained;
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __44__FPDExtensionSession__connectionWithError___block_invoke_cold_1();

    v4 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__FPDExtensionSession__connectionWithError___block_invoke_78;
    block[3] = &unk_1E8C75240;
    block[4] = WeakRetained;
    v6 = a1[4];
    v7 = a1[5];
    dispatch_async(v4, block);

  }
}

_QWORD *__44__FPDExtensionSession__connectionWithError___block_invoke_78(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[4] == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(result, "_invalidate");
    return (_QWORD *)objc_msgSend(*(id *)(a1 + 48), "invalidate");
  }
  return result;
}

void __44__FPDExtensionSession__connectionWithError___block_invoke_2(id *a1)
{
  _QWORD *WeakRetained;
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __44__FPDExtensionSession__connectionWithError___block_invoke_2_cold_1();

    v4 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__FPDExtensionSession__connectionWithError___block_invoke_79;
    block[3] = &unk_1E8C75240;
    block[4] = WeakRetained;
    v6 = a1[4];
    v7 = a1[5];
    dispatch_async(v4, block);

  }
}

_QWORD *__44__FPDExtensionSession__connectionWithError___block_invoke_79(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[4] == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(result, "_invalidate");
    return (_QWORD *)objc_msgSend(*(id *)(a1 + 48), "invalidate");
  }
  return result;
}

void __44__FPDExtensionSession__connectionWithError___block_invoke_2_84(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __44__FPDExtensionSession__connectionWithError___block_invoke_2_84_cold_1(a1, v3, v4);

}

void __44__FPDExtensionSession__connectionWithError___block_invoke_88(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "fp_unwrappedInternalError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __44__FPDExtensionSession__connectionWithError___block_invoke_88_cold_2();

    if (objc_msgSend(v4, "fp_isFileProviderInternalError:", 18))
    {
      fp_current_or_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __44__FPDExtensionSession__connectionWithError___block_invoke_88_cold_1();

      exit(1);
    }

  }
}

- (BOOL)hasFileProviderAttributionMDMAccess
{
  void *v3;
  id WeakRetained;
  void *v5;
  char v6;
  BOOL v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.fileproviderd"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  objc_msgSend(WeakRetained, "nsDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isContentManaged")
    || !objc_msgSend(v3, "objectIsForcedForKey:", CFSTR("AllowManagedFileProvidersToRequestAttribution")))
  {

    goto LABEL_6;
  }
  v6 = objc_msgSend(v3, "BOOLForKey:", CFSTR("AllowManagedFileProvidersToRequestAttribution"));

  if ((v6 & 1) == 0)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v7 = 1;
LABEL_7:

  return v7;
}

- (id)existingFileProviderProxyWithTimeout:(double)a3 onlyAlreadyLifetimeExtended:(BOOL)a4 pid:(int)a5
{
  uint64_t v5;
  FPDExtensionSession *v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;

  v5 = *(_QWORD *)&a5;
  if (a4)
  {
    v8 = self;
    objc_sync_enter(v8);
    -[NSMapTable keyEnumerator](v8->_lifetimeExtenders, "keyEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nextObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CAACE8]), "initWithConnection:protocol:orError:name:requestPid:", 0, &unk_1EFBBB940, v13, v8->_providerIdentifier, v5);

      objc_sync_exit(v8);
      return v11;
    }
    objc_sync_exit(v8);

  }
  v11 = -[FPDExtensionSession newFileProviderProxyWithTimeoutValue:pid:createIfNeeded:](self, "newFileProviderProxyWithTimeoutValue:pid:createIfNeeded:", v5, 0, a3);
  return v11;
}

void __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _xpc_connection_s *v3;
  pid_t pid;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_3_cold_1(a1, v2);

  if ((FPFeatureFlagHelenaIsEnabled() & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_xpcConnection");
    v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    pid = xpc_connection_get_pid(v3);

    if (pid)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("The process did not respond to a request %@ in time."), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      WriteStackshotReportWithPID();

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_invalidateExtensionIfPossible");

}

void __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_238(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  v8 = (void *)a1[5];
  v9 = *(NSObject **)(v7 + 16);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[2] = __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_2_239;
  v12[3] = &unk_1E8C79378;
  v16 = a1[6];
  v12[1] = 3221225472;
  v12[4] = v7;
  v13 = v5;
  v14 = v8;
  v15 = v6;
  v17 = a1[7];
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, v12);

}

void __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_2_239(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;

  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "cancelTimeout");
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_2_239_cold_2();

  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  v4 = *(_QWORD *)(a1 + 56);
  if (*(_QWORD *)(a1 + 48) != v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ begin and finished request IDs should match: %@ %@"), *(_QWORD *)(a1 + 48), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDExtensionSession newFileProviderProxyWithTimeoutValue:pid:createIfNeeded:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionSession.m", 862, (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObjectForKey:");
  objc_sync_exit(v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "removePIDToObserve:", objc_msgSend(*(id *)(a1 + 40), "requestEffectivePid"));
  objc_msgSend(*(id *)(a1 + 32), "_invalidateExtensionIfPossible");
  __fp_pop_log();

}

void __58__FPDExtensionSession_registerLifetimeExtensionForObject___block_invoke_2(uint64_t a1)
{
  id *v2;
  id v3;
  id v4;
  id v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (id *)(a1 + 40);
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(v2);

    if (v4)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "setTimeoutState:", 2);
      v5 = objc_loadWeakRetained(v2);
      objc_msgSend(v5, "_unregisterLifetimeExtensionForObject:", WeakRetained);

    }
  }

}

- (void)start
{
  NSObject *sessionQueue;
  _QWORD block[5];

  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__FPDExtensionSession_start__block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  dispatch_async(sessionQueue, block);
}

void __28__FPDExtensionSession_start__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  FPDProcessMonitor *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(*(_QWORD *)v2 + 88))
  {
    v8[0] = *(_QWORD *)(*(_QWORD *)v2 + 88);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  v4 = -[FPDProcessMonitor initWithExcludedBundleIDs:]([FPDProcessMonitor alloc], "initWithExcludedBundleIDs:", v3);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setDelegate:");
  __fp_pop_log();

}

- (void)terminateWithReason:(id)a3
{
  id v4;
  NSObject *sessionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__FPDExtensionSession_terminateWithReason___block_invoke;
  v7[3] = &unk_1E8C75850;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(sessionQueue, v7);

}

void __43__FPDExtensionSession_terminateWithReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  fpfs_adopt_log();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
    *(_DWORD *)buf = 138543618;
    v14 = v4;
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_DEFAULT, "[WARNING] %{public}@: terminating extension request for reason: %{public}@", buf, 0x16u);
  }

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v11 = 0;
  v7 = objc_msgSend(v5, "terminateExtensionWithReason:error:", v6, &v11);
  v8 = v11;
  if ((v7 & 1) == 0)
  {
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "fp_prettyDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPDExtensionSession _invalidateExtensionIfPossible].cold.2(v10, (uint64_t)buf, v9);
    }

  }
  __fp_pop_log();

}

- (void)cancelAsync
{
  NSObject *sessionQueue;
  _QWORD block[5];

  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__FPDExtensionSession_cancelAsync__block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  dispatch_async(sessionQueue, block);
}

void __34__FPDExtensionSession_cancelAsync__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t buf[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  fpfs_adopt_log();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
    *(_DWORD *)buf = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_DEFAULT, "[WARNING] %{public}@: cancelling extension request", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_invalidate");
  __fp_pop_log();

}

- (void)invalidate
{
  NSObject *sessionQueue;
  _QWORD block[5];

  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__FPDExtensionSession_invalidate__block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  dispatch_async(sessionQueue, block);
}

void __33__FPDExtensionSession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)v2 + 132) = 1;
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
    *(_DWORD *)buf = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_DEFAULT, "[WARNING] %{public}@: cancelling extension request", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "suppress");
  objc_msgSend(*(id *)(a1 + 32), "_notifyNetworkingProviderMonitorWithState:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "invalidate");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = 0;

  __fp_pop_log();
}

- (NSString)description
{
  FPDExtensionSession *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v15;

  v2 = self;
  objc_sync_enter(v2);
  v15 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&v2->_domain);
  objc_msgSend(WeakRetained, "providerDomainID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fp_obfuscatedProviderDomainID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allValues](v2->_inflightProxies, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable keyEnumerator](v2->_lifetimeExtenders, "keyEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fp_map:", &__block_literal_global_258);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@(%@): %p requests{%@}, extenders{%@}>"), v3, v5, v2, v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSString *)v12;
}

uint64_t __34__FPDExtensionSession_description__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "prettyDescription");
}

- (void)_networkingGracePeriodOver
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, v0, v1, "[ERROR] Networking grace period timer fired with foreground process for %@", v2);
  OUTLINED_FUNCTION_8_0();
}

void __60__FPDExtensionSession_newAssertionWithAttributeName_reason___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "assertionWasInvalidated:", v3);

}

- (id)newBackgroundAssertion
{
  return -[FPDExtensionSession newAssertionWithAttributeName:reason:](self, "newAssertionWithAttributeName:reason:", CFSTR("FileProviderBackground"), CFSTR("background assertion from fileproviderd"));
}

- (void)assertionWasInvalidated:(id)a3
{
  id v4;
  NSObject *sessionQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  FPDExtensionSession *v9;

  v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__FPDExtensionSession_assertionWasInvalidated___block_invoke;
  v7[3] = &unk_1E8C75850;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(sessionQueue, v7);

}

void __47__FPDExtensionSession_assertionWasInvalidated___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  char v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "explanation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_DEFAULT, "[WARNING] Extension assertion '%{public}@' for %@ was invalidated", (uint8_t *)&v9, 0x16u);

  }
  v5 = objc_msgSend(*(id *)(a1 + 40), "terminateExtensionWithReason:error:", CFSTR("run assertion was invalidated"), 0);
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __47__FPDExtensionSession_assertionWasInvalidated___block_invoke_cold_1();

    exit(0);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = *(void **)(a1 + 40);
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_INFO, "[INFO] Terminated extension %@", (uint8_t *)&v9, 0xCu);
  }

}

- (void)dumpStateTo:(id)a3
{
  id v4;
  NSObject *sessionQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__FPDExtensionSession_dumpStateTo___block_invoke;
  block[3] = &unk_1E8C75850;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(sessionQueue, block);

}

void __35__FPDExtensionSession_dumpStateTo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int IsEnabled;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 160))
  {
    v3 = CFSTR("foreground");
    v4 = 2;
  }
  else
  {
    if (!*(_QWORD *)(v2 + 168))
      goto LABEL_6;
    v3 = CFSTR("background");
    v4 = 3;
  }
  objc_msgSend(*(id *)(a1 + 40), "startFgColor:", v4);
  objc_msgSend(*(id *)(a1 + 40), "write:", v3);
  objc_msgSend(*(id *)(a1 + 40), "reset");
LABEL_6:
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v5 + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "startFgColor:", 3);
    objc_msgSend(*(id *)(a1 + 40), "write:", CFSTR(" request running;"));
    objc_msgSend(*(id *)(a1 + 40), "reset");
    v5 = *(_QWORD *)(a1 + 32);
  }
  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(v5 + 120), "prettyDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "prettyDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "write:", CFSTR(" %@; grace period timer %@\n"), v7, v8);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "keyEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    v11 = *(void **)(a1 + 40);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
    {
      objc_msgSend(v11, "startFgColor:", 3);
      IsEnabled = FPFeatureFlagHelenaIsEnabled();
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(a1 + 40);
      if (IsEnabled)
      {
        v29 = objc_msgSend(*(id *)(v13 + 152), "rbs_pid");
        v15 = CFSTR(" alive (%d) via ExtensionKit");
      }
      else
      {
        v29 = *(unsigned int *)(v13 + 136);
        v15 = CFSTR(" alive (%d) via PlugInKit");
      }
      v16 = v14;
    }
    else
    {
      objc_msgSend(v11, "startFgColor:", 1);
      v16 = *(void **)(a1 + 40);
      v15 = CFSTR(" without connection");
    }
    objc_msgSend(v16, "write:", v15, v29);
    objc_msgSend(*(id *)(a1 + 40), "reset");
    objc_msgSend(*(id *)(a1 + 40), "write:", CFSTR(" for:\n"));
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v17 = v10;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v35;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v35 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v21), "prettyDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "write:", CFSTR("     %@\n"), v23);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v19);
    }

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "startFgColor:", 3);
    objc_msgSend(*(id *)(a1 + 40), "write:", CFSTR(" alive"));
    objc_msgSend(*(id *)(a1 + 40), "reset");
    objc_msgSend(*(id *)(a1 + 40), "write:", CFSTR(" due to XPC calls\n"));
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allValues");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v31;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v31 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(a1 + 40), "write:", CFSTR("     %@\n"), *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v28++));
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v26);
    }

  }
}

- (int)test_pid
{
  _xpc_connection_s *v4;
  pid_t pid;

  if (FPFeatureFlagHelenaIsEnabled())
    return -[_EXExtensionProcess rbs_pid](self->_sessionProcess, "rbs_pid");
  -[NSXPCConnection _xpcConnection](self->_connection, "_xpcConnection");
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  pid = xpc_connection_get_pid(v4);

  return pid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundAssertion, 0);
  objc_storeStrong((id *)&self->_foregroundAssertion, 0);
  objc_storeStrong((id *)&self->_sessionProcess, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_networkingGracePeriodTimer, 0);
  objc_storeStrong((id *)&self->_gracePeriodTimer, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_destroyWeak((id *)&self->_domain);
  objc_destroyWeak((id *)&self->_fpdExtension);
  objc_storeStrong((id *)&self->_lifetimeExtenders, 0);
  objc_storeStrong((id *)&self->_inflightProxies, 0);
  objc_storeStrong((id *)&self->_observingBundleIDs, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

- (void)terminateExtensionWithReason:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, v0, v1, "[ERROR] Terminating session process failed (%@)", v2);
  OUTLINED_FUNCTION_8_0();
}

- (void)terminateExtensionWithReason:(void *)a1 error:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a2, v4, "[ERROR] encountered an app extension version conflict error, killing the existing extension and retrying (%{public}@)...", v5);

}

- (void)_setUpEXConnectionWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, v0, v1, "[ERROR] Exiting after an unrecoverable extension launch error was detected.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_setUpEXConnectionWithError:.cold.2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_9();
  _os_log_fault_impl(&dword_1CF55F000, v0, OS_LOG_TYPE_FAULT, "[CRIT] Exiting fileproviderd because we have a nil personal persona", v1, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)_setUpEXConnectionWithError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, v0, v1, "[ERROR] Attempting to create a connection without personaID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_setUpPKConnectionWithError:(os_log_t)log .cold.2(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_debug_impl(&dword_1CF55F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Enforcing QoS %u over requested QoS %u to ensure timely bringup", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_8_0();
}

void __51__FPDExtensionSession__setUpPKConnectionWithError___block_invoke_65_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v1, (uint64_t)v1, "[ERROR] Can't adopt persona %@: %@", v2);
  OUTLINED_FUNCTION_8_0();
}

void __44__FPDExtensionSession__connectionWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] %@: connection was interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __44__FPDExtensionSession__connectionWithError___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] %@: connection was invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __44__FPDExtensionSession__connectionWithError___block_invoke_2_84_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "fp_prettyDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_10(&dword_1CF55F000, a3, v7, "[ERROR] Failed to send initial bringup message to domain %@: %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_2();
}

void __44__FPDExtensionSession__connectionWithError___block_invoke_88_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, v0, v1, "[ERROR] Exiting fileproviderd because personas seem to have changed since it started", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __44__FPDExtensionSession__connectionWithError___block_invoke_88_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, v0, v1, "[ERROR] An error occured while beginning request: %@", v2);
  OUTLINED_FUNCTION_8_0();
}

void __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] %@: request starting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = WeakRetained;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_10(&dword_1CF55F000, a2, v6, "[ERROR] %{public}@ took too long to perform: %{public}@, killing it...", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2();
}

void __79__FPDExtensionSession_newFileProviderProxyWithTimeoutValue_pid_createIfNeeded___block_invoke_2_239_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] %@: request finished", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)_notifyNetworkingProviderMonitorWithState:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int _brc_notify_register_check(const char *, int *)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPDExtensionSession.m"), 80, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)_notifyNetworkingProviderMonitorWithState:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _brc_notify_set_state_and_post(int, uint64_t, const char *)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPDExtensionSession.m"), 79, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)newAssertionWithAttributeName:reason:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v1, (uint64_t)v1, "[ERROR] can't acquire %@ assertion: %@", v2);
  OUTLINED_FUNCTION_8_0();
}

void __47__FPDExtensionSession_assertionWasInvalidated___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, v0, v1, "[ERROR] Failed to terminate extension. Exiting to prevent invalid state.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
