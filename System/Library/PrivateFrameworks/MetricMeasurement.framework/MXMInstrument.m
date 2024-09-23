@implementation MXMInstrument

+ (void)load
{
  objc_storeWeak(&_activeInstrument, 0);
}

+ (MXMInstrument)activeInstrument
{
  return (MXMInstrument *)objc_loadWeakRetained(&_activeInstrument);
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  MXMInstrument *WeakRetained;
  void *v7;
  id obj;

  v3 = a3;
  obj = objc_loadWeakRetained(&_activeInstrument);
  objc_sync_enter(obj);
  WeakRetained = (MXMInstrument *)objc_loadWeakRetained(&_activeInstrument);

  if (v3)
  {
    if (WeakRetained)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMInstrument.m"), 93, CFSTR("Cannot activate instrument while another is already active."));
LABEL_8:

    }
  }
  else
  {
    if (WeakRetained != self)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMInstrument.m"), 97, CFSTR("Cannot deactivate the instrument if the active instrument is not self."));
      self = 0;
      goto LABEL_8;
    }
    self = 0;
  }
  objc_storeWeak(&_activeInstrument, self);
  objc_sync_exit(obj);

}

- (BOOL)active
{
  id WeakRetained;
  MXMInstrument *v4;

  WeakRetained = objc_loadWeakRetained(&_activeInstrument);
  objc_sync_enter(WeakRetained);
  v4 = (MXMInstrument *)objc_loadWeakRetained(&_activeInstrument);
  LOBYTE(self) = v4 == self;

  objc_sync_exit(WeakRetained);
  return (char)self;
}

+ (MXMInstrument)instrumentWithInstrumentals:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInstrumentals:", v4);

  return (MXMInstrument *)v5;
}

- (MXMInstrument)initWithInstrumentals:(id)a3
{
  id v6;
  MXMInstrument *v7;
  MXMInstrument *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *instrumentalsQueue;
  void *v11;
  uint64_t v12;
  void *v14;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MXMInstrument;
  v7 = -[MXMInstrument init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_instrumentals, a3);
    v9 = dispatch_queue_create("com.apple.metricmeasurement.instrument.instrumentals", MEMORY[0x24BDAC9C0]);
    instrumentalsQueue = v8->_instrumentalsQueue;
    v8->_instrumentalsQueue = (OS_dispatch_queue *)v9;

  }
  -[MXMInstrument instrumentals](v8, "instrumentals");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("MXMInstrument.m"), 121, CFSTR("Cannot initialize instrument without any instrumentals."));

  }
  return v8;
}

- (void)_prepareIteration:(id *)a3 options:(id)a4 instrumentals:(id)a5 errors:(id)a6
{
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  char v16;
  NSObject *v17;
  dispatch_time_t v18;
  id v21;
  id val;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id from;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id location;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v21 = a4;
  v8 = a5;
  val = a6;
  v9 = dispatch_group_create();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v15 = objc_initWeak(&location, v14);
        v16 = objc_opt_respondsToSelector();

        if ((v16 & 1) != 0)
        {
          objc_initWeak(&from, val);
          -[MXMInstrument instrumentalsQueue](self, "instrumentalsQueue");
          v17 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __64__MXMInstrument__prepareIteration_options_instrumentals_errors___block_invoke;
          block[3] = &unk_24D193478;
          objc_copyWeak(&v25, &location);
          v24 = v21;
          objc_copyWeak(&v26, &from);
          dispatch_group_async(v9, v17, block);

          objc_destroyWeak(&v26);
          objc_destroyWeak(&v25);
          objc_destroyWeak(&from);
        }
        objc_destroyWeak(&location);
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v11);
  }

  v18 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v9, v18);
  a3->var4 = 1;

}

void __64__MXMInstrument__prepareIteration_options_instrumentals_errors___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v6 = 0;
  objc_msgSend(WeakRetained, "prepareWithOptions:error:", v3, &v6);
  v4 = v6;

  if (v4)
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (void)_setupAndRunWithIteration:(id *)a3 spawnThread:(BOOL)a4 attrs:(_opaque_pthread_attr_t *)a5 pthread:(_opaque_pthread_t *)a6 returnCode:(unint64_t *)a7
{
  _BOOL4 v10;
  void *v14;
  void *v15;
  void *v16;
  double var20;
  double var21;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD *v34;
  id v35;
  void *v36;
  int v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  void *v49;
  void *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;

  v10 = a4;
  v53 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMInstrument.m"), 480, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("iteration"));

  }
  if (a3->var3)
  {
    if (a3->var4
      || (objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"),
          v40 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMInstrument.m"), 486, CFSTR("Iteration is not in proper state.")), v40, a3->var3))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMInstrument.m"), 487, CFSTR("Iteration is not in proper state."));

    }
  }
  else if (!a3->var4)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("MXMInstrumentErrorDomain"), CFSTR("Iteration is uninitialized."), 0);
    v43 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v43);
  }
  a3->var4 = 1;
  a3->var3 = 1;
  if (!v10)
  {
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = 0;
    v15 = a3->var14;
    if (a3->var20 != 0.0 && a3->var21 != 0.0)
    {
      +[MXMProxyServiceManager shared](MXMProxyServiceManager, "shared");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      var20 = a3->var20;
      var21 = a3->var21;
      *(_QWORD *)&v48 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v48 + 1) = 3221225472;
      v49 = __MXMQuiesceBeforeIteration_block_invoke;
      v50 = &unk_24D1934C8;
      v51 = v15;
      v52 = &v44;
      objc_msgSend(v16, "_quiesceBeforeIteration:timeout:response:", &v48, var20, var21);

    }
    v19 = v45[3];
    _Block_object_dispose(&v44, 8);
    if (v19 == 6)
    {
      *a7 = 6;
      return;
    }
    v20 = a3->var22;
    _MXMGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v48) = 138412290;
      *(_QWORD *)((char *)&v48 + 4) = v20;
      _os_log_impl(&dword_214474000, v21, OS_LOG_TYPE_DEBUG, "Attempting to uncache before iteration with config: %@", (uint8_t *)&v48, 0xCu);
    }

    if (a3->var22 && objc_msgSend(v20, "count"))
    {
      +[MXMProxyServiceManager shared](MXMProxyServiceManager, "shared");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_uncacheBeforeIteration:response:", v20, &__block_literal_global_5);

    }
    v23 = a3->var23;
    _MXMGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v48) = 138412290;
      *(_QWORD *)((char *)&v48 + 4) = v23;
      _os_log_impl(&dword_214474000, v24, OS_LOG_TYPE_DEBUG, "Attempting to terminate before iteration with config: %@", (uint8_t *)&v48, 0xCu);
    }

    if (a3->var23 && objc_msgSend(v23, "count"))
    {
      +[MXMProxyServiceManager shared](MXMProxyServiceManager, "shared");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_terminateProcessesBeforeIteration:response:", v23, &__block_literal_global_213);

    }
    v26 = a3->var19;
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = 1;
    if (a3->var18)
    {
      +[MXMProxyServiceManager shared](MXMProxyServiceManager, "shared");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v48 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v48 + 1) = 3221225472;
      v49 = __MXMStartPerformanceTraceCollection_block_invoke;
      v50 = &unk_24D193530;
      v51 = &v44;
      objc_msgSend(v27, "_startPerformanceTrace:response:", v26, &v48);

      if (v45[3] == 1)
      {
        if (v26)
        {
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("requiredForTestContinuation"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v27)
            goto LABEL_40;
        }
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("requiredForTestContinuation"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "BOOLValue");

        if (v26)
        {

          if ((v29 & 1) == 0)
            goto LABEL_34;
LABEL_40:
          objc_msgSend(a3->var14, "setActive:", 0);
          objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("MXMInstrumentErrorDomain"), CFSTR("Unable to start performance trace collection. See error logs for more detail."), 0);
          v35 = (id)objc_claimAutoreleasedReturnValue();
          objc_exception_throw(v35);
        }
        if (v29)
          goto LABEL_40;
      }
    }
LABEL_34:
    v30 = v45[3];
    _Block_object_dispose(&v44, 8);

    *a7 = MXMRunBlockIteration((uint64_t)a3);
    if (!v30)
    {
      v31 = v26;
      v44 = 0;
      v45 = &v44;
      v46 = 0x2020000000;
      v47 = 0;
      v32 = a3->var14;
      +[MXMProxyServiceManager shared](MXMProxyServiceManager, "shared");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v48 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v48 + 1) = 3221225472;
      v49 = __MXMStopPerformanceTraceCollection_block_invoke;
      v50 = &unk_24D193558;
      v34 = v32;
      v51 = v34;
      v52 = &v44;
      objc_msgSend(v33, "_stopPerformanceTrace:", &v48);

      if (v45[3] == 3)
      {
        if (v31)
        {
          objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("requiredForTestContinuation"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v33)
          {
LABEL_47:
            objc_msgSend(v34, "setActive:", 0);
            objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("MXMInstrumentErrorDomain"), CFSTR("Unable to collect performance trace. See error logs for more detail."), 0);
            v38 = (id)objc_claimAutoreleasedReturnValue();
            objc_exception_throw(v38);
          }
        }
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("requiredForTestContinuation"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "BOOLValue");

        if (v31)
        {

          if ((v37 & 1) != 0)
            goto LABEL_47;
        }
        else if (v37)
        {
          goto LABEL_47;
        }
      }

      _Block_object_dispose(&v44, 8);
    }

    return;
  }
  *(_QWORD *)&v48 = 0;
  if (!a3->var16)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMInstrument.m"), 496, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("iteration->invocationBlock"));

  }
  if (pthread_create((pthread_t *)&v48, a5, (void *(__cdecl *)(void *))MXMRunBlockIteration, a3))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMInstrument.m"), 498, CFSTR("Failed to spawn posix thread!"));

  }
  else if (a6)
  {
    *a6 = (_opaque_pthread_t *)v48;
  }
}

- (id)_transitionWithState:(unint64_t)a3 iteration:(id *)a4 instrumentals:(id)a5
{
  id v8;
  unint64_t *p_var6;
  const $6284FEDF7B3A0B615FD11F40896223C5 *v10;
  unint64_t *p_var8;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  id obj;
  void *v28;
  _QWORD block[5];
  id v30[6];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id location;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMInstrument.m"), 530, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transState != MXMIterationStateUninitialized"));

    a3 = 0;
  }
  if (!a4->var4)
  {
    v21 = a3;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMInstrument.m"), 531, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("iteration->transitionCompleted == YES"));

    a3 = v21;
  }
  if (!a4->var3 && !a4->var4)
  {
    v24 = a3;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMInstrument.m"), 532, CFSTR("Internal Error: Cannot transition from an unintiailized state."));

    a3 = v24;
  }
  if (a3 == 4)
  {
    p_var6 = &a4->var6;
    goto LABEL_12;
  }
  if (a3 == 2)
  {
    p_var6 = &a4->var5;
LABEL_12:
    v28 = (void *)*p_var6;
    goto LABEL_14;
  }
  v28 = 0;
LABEL_14:
  if (a3 == 4)
  {
    v10 = a4;
    p_var8 = &a4->var8;
  }
  else
  {
    if (a3 != 2)
    {
      v10 = a4;
      v12 = 0;
      goto LABEL_20;
    }
    v10 = a4;
    p_var8 = &a4->var7;
  }
  v12 = (void *)*p_var8;
LABEL_20:
  v13 = (void *)a3;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 1 && !v28)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMInstrument.m"), 538, CFSTR("Couldn't acquire timestamp for transition state that is not 'did start -> will stop' or 'uninit -> will start'."));

  }
  v14 = dispatch_group_create();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v8;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v32;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(obj);
        objc_initWeak(&location, *(id *)(*((_QWORD *)&v31 + 1) + 8 * v17));
        -[MXMInstrument instrumentalsQueue](self, "instrumentalsQueue");
        v18 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __62__MXMInstrument__transitionWithState_iteration_instrumentals___block_invoke;
        block[3] = &unk_24D1934A0;
        v30[1] = v13;
        objc_copyWeak(v30, &location);
        v30[3] = (id)v10;
        v30[4] = (id)a2;
        v30[2] = v28;
        block[4] = self;
        v30[5] = v12;
        dispatch_group_async(v14, v18, block);

        objc_destroyWeak(v30);
        objc_destroyWeak(&location);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v15);
  }

  return v14;
}

void __62__MXMInstrument__transitionWithState_iteration_instrumentals___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;
  char v5;
  id v6;
  id *v7;
  id v8;
  char v9;
  id v10;
  char v11;
  id v12;
  char v13;
  id v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  switch(*(_QWORD *)(a1 + 48))
  {
    case 1:
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      v3 = objc_opt_respondsToSelector();

      if ((v3 & 1) != 0)
      {
        v20 = objc_loadWeakRetained((id *)(a1 + 40));
        objc_msgSend(v20, "willStartAtEstimatedTime:", *(_QWORD *)(a1 + 56));
        goto LABEL_23;
      }
      break;
    case 2:
      v4 = objc_loadWeakRetained((id *)(a1 + 40));
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) != 0)
      {
        v20 = *(id *)(*(_QWORD *)(a1 + 64) + 72);
        if (!v20)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("MXMInstrument.m"), 555, CFSTR("Failed to record start date."));

        }
        v6 = objc_loadWeakRetained((id *)(a1 + 40));
        objc_msgSend(v6, "didStartAtContinuousTime:absoluteTime:startDate:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56), v20);
        goto LABEL_22;
      }
      v12 = objc_loadWeakRetained((id *)(a1 + 40));
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        v20 = *(id *)(*(_QWORD *)(a1 + 64) + 72);
        if (!v20)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("MXMInstrument.m"), 559, CFSTR("Failed to record start date."));

        }
        v6 = objc_loadWeakRetained((id *)(a1 + 40));
        objc_msgSend(v6, "didStartAtTime:startDate:", *(_QWORD *)(a1 + 56), v20);
        goto LABEL_22;
      }
      break;
    case 3:
      v7 = (id *)(a1 + 40);
      v8 = objc_loadWeakRetained((id *)(a1 + 40));
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        v20 = objc_loadWeakRetained(v7);
        objc_msgSend(v20, "willStop");
        goto LABEL_23;
      }
      break;
    case 4:
      v10 = objc_loadWeakRetained((id *)(a1 + 40));
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        v20 = *(id *)(*(_QWORD *)(a1 + 64) + 80);
        if (!v20)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("MXMInstrument.m"), 571, CFSTR("Failed to record stop date."));

        }
        v6 = objc_loadWeakRetained((id *)(a1 + 40));
        objc_msgSend(v6, "didStopAtContinuousTime:absoluteTime:stopDate:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56), v20);
      }
      else
      {
        v14 = objc_loadWeakRetained((id *)(a1 + 40));
        v15 = objc_opt_respondsToSelector();

        if ((v15 & 1) == 0)
          return;
        v20 = *(id *)(*(_QWORD *)(a1 + 64) + 80);
        if (!v20)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("MXMInstrument.m"), 575, CFSTR("Failed to record stop date."));

        }
        v6 = objc_loadWeakRetained((id *)(a1 + 40));
        objc_msgSend(v6, "didStopAtTime:stopDate:", *(_QWORD *)(a1 + 56), v20);
      }
LABEL_22:

LABEL_23:
      break;
    default:
      return;
  }
}

- (void)start
{
  -[MXMInstrument startWithError:](self, "startWithError:", 0);
}

- (BOOL)startWithError:(id *)a3
{
  $6284FEDF7B3A0B615FD11F40896223C5 *v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  char *v10;
  $6284FEDF7B3A0B615FD11F40896223C5 *currentIteration;
  void *v12;
  NSArray *v13;
  NSArray *instrumentals;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  if (-[MXMInstrument active](self, "active")
    && -[MXMInstrument currentIteration](self, "currentIteration")
    && (_QWORD)-[MXMInstrument currentIteration](self, "currentIteration")[152])
  {
    v6 = -[MXMInstrument currentIteration](self, "currentIteration");
LABEL_17:
    v9 = 1;
    v6->var3 = 1;
    v6->var4 = 1;
    -[MXMInstrument _transitionWithState:iteration:instrumentals:](self, "_transitionWithState:iteration:instrumentals:", 1, v6, v6->var15);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    thread_selfcounts();
    v6->var7 = mach_continuous_time();
    v6->var5 = mach_absolute_time();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6->var9 = (void *)objc_claimAutoreleasedReturnValue();
    v6->var11 = 0uLL;
    goto LABEL_18;
  }
  if (!-[MXMInstrument active](self, "active") && !-[MXMInstrument currentIteration](self, "currentIteration"))
  {
    v10 = (char *)malloc_type_malloc(0xD0uLL, 0x10800409D133E64uLL);
    self->_currentIteration = ($6284FEDF7B3A0B615FD11F40896223C5 *)v10;
    *((_QWORD *)v10 + 3) = 0;
    v10[32] = 0;
    *((_DWORD *)v10 + 4) = 0;
    *(_QWORD *)v10 = 0;
    *((_QWORD *)v10 + 1) = 0;
    *((_QWORD *)v10 + 5) = 0;
    *((_QWORD *)v10 + 6) = 0;
    *((_QWORD *)v10 + 9) = 0;
    *((_QWORD *)v10 + 10) = 0;
    *((_QWORD *)v10 + 15) = 3;
    *((_OWORD *)v10 + 8) = 0u;
    *((_OWORD *)v10 + 9) = 0u;
    v10[160] = 0;
    *(_OWORD *)(v10 + 168) = 0u;
    *(_OWORD *)(v10 + 184) = 0u;
    *((_QWORD *)v10 + 25) = 0;
    currentIteration = self->_currentIteration;
    if (currentIteration->var3 || currentIteration->var4)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMInstrument.m"), 603, CFSTR("Failed to initialize internal state for instrument."));

    }
    -[MXMInstrument setActive:](self, "setActive:", 1);
    v6 = -[MXMInstrument currentIteration](self, "currentIteration");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    -[MXMInstrument instrumentals](self, "instrumentals");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MXMInstrument _makeInstrumentalsForIteration:shouldCopy:](self, "_makeInstrumentalsForIteration:shouldCopy:", v12, 0);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    instrumentals = self->_instrumentals;
    self->_instrumentals = v13;

    -[MXMInstrument instrumentals](self, "instrumentals");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MXMInstrument _prepareIteration:options:instrumentals:errors:](self, "_prepareIteration:options:instrumentals:errors:", v6, 0, v15, v8);

    v6->var2 = MEMORY[0x2199CE344]();
    *(_OWORD *)&v6->var0 = xmmword_21448F570;
    v6->var14 = self;
    -[MXMInstrument instrumentals](self, "instrumentals");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MXMInstrument _makeInstrumentalsForIteration:shouldCopy:](self, "_makeInstrumentalsForIteration:shouldCopy:", v16, 0);
    v6->var15 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NSObject count](v8, "count"))
    {
      if (a3)
      {
        v17 = (void *)MEMORY[0x24BDD1540];
        v23 = *MEMORY[0x24BDD0BA0];
        v24[0] = CFSTR("Failed to prepare all instrumentals.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("MXMInstrumentErrorDomain"), 1, v18);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      v9 = 0;
      goto LABEL_18;
    }

    goto LABEL_17;
  }
  if (a3)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BDD0BA0];
    v22 = CFSTR("Cannot start. Instrument already active.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("MXMInstrumentErrorDomain"), 1, v8);
    v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

    return v9;
  }
  return 0;
}

- (id)stop
{
  return -[MXMInstrument stopWithError:](self, "stopWithError:", 0);
}

- (id)stopWithError:(id *)a3
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  $6284FEDF7B3A0B615FD11F40896223C5 *v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  MXMMutableSampleData *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  BOOL v23;
  void *v24;
  id *var17;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  SEL v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 v42;
  _BYTE v43[128];
  uint64_t v44;
  _QWORD v45[3];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v42 = ($7DEDF3842AEFB7F1E6DF5AF62E424A02)0;
  thread_selfcounts();
  v6 = mach_absolute_time();
  v7 = mach_continuous_time();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MXMInstrument active](self, "active"))
  {
    v8 = (int)-[MXMInstrument currentIteration](self, "currentIteration")[16];
    if (v8 != MEMORY[0x2199CE344]())
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMInstrument.m"), 684, CFSTR("Must start and stop from same thread."));

    }
    v31 = a2;
    v9 = -[MXMInstrument currentIteration](self, "currentIteration");
    v9->var12 = v42;
    v9->var8 = v7;
    v9->var6 = v6;
    v9->var10 = v35;
    v9->var3 = 2;
    v9->var4 = 1;
    -[MXMInstrument _transitionWithState:iteration:instrumentals:](self, "_transitionWithState:iteration:instrumentals:", 2, v9, v9->var15);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_time(0, 1000000000);
    v34 = v10;
    dispatch_group_wait(v10, v11);
    -[MXMInstrument _transitionWithState:iteration:instrumentals:](self, "_transitionWithState:iteration:instrumentals:", 3, v9, v9->var15);
    v12 = objc_claimAutoreleasedReturnValue();
    -[MXMInstrument _transitionWithState:iteration:instrumentals:](self, "_transitionWithState:iteration:instrumentals:", 4, v9, v9->var15);
    v32 = objc_claimAutoreleasedReturnValue();
    dispatch_group_wait(v32, 0xFFFFFFFFFFFFFFFFLL);
    v33 = v12;
    dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    v13 = objc_alloc_init(MXMMutableSampleData);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v14 = v9->var15;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v39;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v39 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v18);
          v36 = 0;
          v37 = 0;
          objc_msgSend(v19, "harvestData:error:", &v37, &v36);
          v20 = v37;
          v21 = v36;
          v22 = v21;
          if (v20)
            v23 = v21 == 0;
          else
            v23 = 0;
          if (!v23)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "description");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", v31, self, CFSTR("MXMInstrument.m"), 711);

          }
          -[MXMMutableSampleData appendData:](v13, "appendData:", v20);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v16);
    }

    var17 = v9->var17;
    if (var17)
    {
      objc_msgSend(*var17, "setObject:atIndexedSubscript:", v13, v9->var0);
    }
    else
    {
      CFRelease(v9->var15);
      CFRelease(v9->var9);
      -[MXMInstrument setActive:](self, "setActive:", 0);
      free(-[MXMInstrument currentIteration](self, "currentIteration"));
      -[MXMInstrument setCurrentIteration:](self, "setCurrentIteration:", 0);
    }

    v27 = v34;
  }
  else
  {
    if (!a3)
    {
      v13 = 0;
      goto LABEL_23;
    }
    v26 = (void *)MEMORY[0x24BDD1540];
    v44 = *MEMORY[0x24BDD0BA0];
    v45[0] = CFSTR("Cannot stop. Instrument is inactive.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("MXMInstrumentErrorDomain"), 1, v27);
    v13 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_23:
  return v13;
}

- (id)measureBlock:(id)a3
{
  return -[MXMInstrument measureAutomatically:options:block:](self, "measureAutomatically:options:block:", 3, 0, a3);
}

- (id)measureWithOptions:(id)a3 block:(id)a4
{
  return -[MXMInstrument measureAutomatically:options:block:](self, "measureAutomatically:options:block:", 3, a3, a4);
}

- (id)measureAutomatically:(unint64_t)a3 block:(id)a4
{
  return -[MXMInstrument measureAutomatically:options:block:](self, "measureAutomatically:options:block:", a3, 0, a4);
}

- (id)measureAutomatically:(unint64_t)a3 options:(id)a4 block:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  void *v30;
  int v31;
  unint64_t v32;
  unsigned int v33;
  unint64_t v34;
  size_t v35;
  uint64_t v36;
  MXMInstrument *v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  int v46;
  unint64_t v47;
  int v48;
  id v49;
  unsigned __int8 *v50;
  int v51;
  uint64_t v52;
  unint64_t v53;
  id v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  void *v61;
  id v62;
  id v63;
  void *v64;
  BOOL v65;
  void *v66;
  void *v67;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  uint64_t v79;
  void *v80;
  int v81;
  uint64_t v82;
  SEL v83;
  id v84;
  id v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  int v92;
  id v93;
  MXMInstrument *v94;
  unint64_t v95;
  char *v96;
  char *v97;
  unint64_t v98;
  id v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  id v106;
  _BYTE v107[128];
  pthread_attr_t buf;
  uint64_t v109;

  v98 = a3;
  v83 = a2;
  v109 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v89 = a5;
  if (!v89)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", v83, self, CFSTR("MXMInstrument.m"), 747, CFSTR("Cannot pass a nil measure block. Cannot measure nothing."));

  }
  if (-[MXMInstrument active](self, "active"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", v83, self, CFSTR("MXMInstrument.m"), 749, CFSTR("Cannot start instrument if it's already measuring."));

  }
  v8 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = self;
  -[MXMInstrument _validOptionKeys](self, "_validOptionKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isSubsetOfSet:", v11);

  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("MXMInstrument"), CFSTR("Invalid options"), 0);
    v78 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v78);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("com.apple.metricmeasurement.instrument.options.ThreadId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", v83, v94, CFSTR("MXMInstrument.m"), 755, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!options[MXMInstrumentOptionKickOffThreadIdentifier]"));

  }
  -[MXMInstrument _valueWithOption:userOptions:](v94, "_valueWithOption:userOptions:", CFSTR("com.apple.metricmeasurement.instrument.options.IterationCount"), v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", v83, v94, CFSTR("MXMInstrument.m"), 757, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("iterationCount > 0"));

  }
  -[MXMInstrument _valueWithOption:userOptions:](v94, "_valueWithOption:userOptions:", CFSTR("com.apple.metricmeasurement.instrument.options.PerformanceTraceEnabled"), v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v91) = objc_msgSend(v16, "BOOLValue");

  -[MXMInstrument _valueWithOption:userOptions:](v94, "_valueWithOption:userOptions:", CFSTR("com.apple.metricmeasurement.instrument.options.PerformanceTraceConfigurations"), v7);
  v85 = (id)objc_claimAutoreleasedReturnValue();
  -[MXMInstrument _valueWithOption:userOptions:](v94, "_valueWithOption:userOptions:", CFSTR("com.apple.metricmeasurement.instrument.options.PerfdataEnabled"), v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v17, "BOOLValue");

  -[MXMInstrument _valueWithOption:userOptions:](v94, "_valueWithOption:userOptions:", CFSTR("com.apple.metricmeasurement.instrument.options.PerfdataTestName"), v7);
  v82 = objc_claimAutoreleasedReturnValue();
  -[MXMInstrument _valueWithOption:userOptions:](v94, "_valueWithOption:userOptions:", CFSTR("com.apple.metricmeasurement.instrument.options.QuiesceCpuIdlePercent"), v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  -[MXMInstrument _valueWithOption:userOptions:](v94, "_valueWithOption:userOptions:", CFSTR("com.apple.metricmeasurement.instrument.options.QuiesceCpuIdleTimeLimit"), v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  v23 = v22;

  -[MXMInstrument _valueWithOption:userOptions:](v94, "_valueWithOption:userOptions:", CFSTR("com.apple.metricmeasurement.instrument.options.SkipMetricMeasurement"), v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "BOOLValue");

  -[MXMInstrument _valueWithOption:userOptions:](v94, "_valueWithOption:userOptions:", CFSTR("com.apple.metricmeasurement.instrument.options.UncacheBetweenIterations"), v7);
  v88 = (id)objc_claimAutoreleasedReturnValue();
  -[MXMInstrument _valueWithOption:userOptions:](v94, "_valueWithOption:userOptions:", CFSTR("com.apple.metricmeasurement.instrument.options.TerminateProcessBetweenIterations"), v7);
  v87 = (id)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    _MXMGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf.__sig) = 0;
      _os_log_impl(&dword_214474000, v26, OS_LOG_TYPE_DEBUG, "Skipping metric measurement as SkipMetricMeasurement was set to true.", (uint8_t *)&buf, 2u);
    }

  }
  if ((_DWORD)v91 && objc_msgSend(v85, "count"))
    v27 = objc_msgSend(v85, "count");
  else
    v27 = v91;
  -[MXMInstrument _valueWithOption:userOptions:](v94, "_valueWithOption:userOptions:", CFSTR("com.apple.metricmeasurement.instrument.options.ScheduleKickOffOnNewThread"), v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "BOOLValue");

  -[MXMInstrument _valueWithOption:userOptions:](v94, "_valueWithOption:userOptions:", CFSTR("com.apple.metricmeasurement.instrument.options.EnableThreadParallelization"), v7);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "BOOLValue");

  if ((v31 & v29 & 1) == 0 && v29)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", v83, v94, CFSTR("MXMInstrument.m"), 789, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(enableParallelizedSampling && shouldKickOffOnNewThread) || !shouldKickOffOnNewThread"));

  }
  if (v31)
    v32 = v15;
  else
    v32 = v29;
  if ((v98 & 3) != 0)
    v33 = v29;
  else
    v33 = 0;
  if (v33 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "handleFailureInMethod:object:file:lineNumber:description:", v83, v94, CFSTR("MXMInstrument.m"), 793, CFSTR("Can't manually start or stop and kick off on a new thread."));

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v93 = (id)objc_claimAutoreleasedReturnValue();
  v79 = (uint64_t)&v79;
  v80 = (void *)MEMORY[0x2199CE3C8]();
  MEMORY[0x24BDAC7A8](v80);
  v34 = (8 * v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (8 * v15 >= 0x200)
    v35 = 512;
  else
    v35 = 8 * v15;
  v97 = (char *)&v79 - v34;
  bzero((char *)&v79 - v34, v35);
  v90 = v7;
  if (v29)
  {
    v86 = malloc_type_malloc(8 * v32, 0x2004093837F09uLL);
    bzero(v86, 8 * v32);
  }
  else
  {
    v86 = 0;
  }
  MEMORY[0x24BDAC7A8](v36);
  v96 = (char *)&v79 - v34;
  memset((char *)&v79 - v34, 255, 8 * v15);
  v37 = v94;
  -[MXMInstrument setActive:](v94, "setActive:", 1);
  if (v15)
  {
    v92 = v29;
    v38 = 0;
    v39 = 0;
    v40 = v15 - v27;
    v95 = v15;
    do
    {
      v41 = (char *)malloc_type_malloc(0xD0uLL, 0x10800409D133E64uLL);
      -[MXMInstrument instrumentals](v37, "instrumentals");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[MXMInstrument _makeInstrumentalsForIteration:shouldCopy:](v37, "_makeInstrumentalsForIteration:shouldCopy:", v42, v15 != 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      *((_QWORD *)v41 + 3) = 0;
      v41[32] = 0;
      *((_DWORD *)v41 + 4) = 0;
      *((_QWORD *)v41 + 5) = 0;
      *((_QWORD *)v41 + 6) = 0;
      *((_QWORD *)v41 + 9) = 0;
      *((_QWORD *)v41 + 10) = 0;
      *(_OWORD *)(v41 + 168) = 0u;
      *((_QWORD *)v41 + 18) = 0;
      *((_QWORD *)v41 + 19) = 0;
      *((_QWORD *)v41 + 16) = v37;
      *((_QWORD *)v41 + 17) = 0;
      v41[160] = 0;
      *(_OWORD *)(v41 + 184) = 0u;
      *((_QWORD *)v41 + 25) = 0;
      *(_QWORD *)v41 = v38;
      *((_QWORD *)v41 + 1) = v15;
      *((_QWORD *)v41 + 15) = 3;
      v44 = v43;
      *((_QWORD *)v41 + 17) = v44;
      v45 = _Block_copy(v89);
      *((_QWORD *)v41 + 15) = v98;
      v106 = v93;
      *((_QWORD *)v41 + 18) = v45;
      *((_QWORD *)v41 + 19) = &v106;
      if (v38 >= v40)
        v46 = (int)v91;
      else
        v46 = 0;
      if (v46 == 1)
      {
        v41[160] = 1;
        v47 = objc_msgSend(v85, "count");
        v48 = v92;
        if (v47 > v39)
          *((_QWORD *)v41 + 21) = objc_msgSend(v85, "objectAtIndex:", v39);
        ++v39;
      }
      else
      {
        v48 = v92;
      }
      *((_QWORD *)v41 + 22) = v20;
      *((_QWORD *)v41 + 23) = v23;
      v49 = v87;
      *((_QWORD *)v41 + 24) = v88;
      *((_QWORD *)v41 + 25) = v49;
      v37 = v94;
      -[MXMInstrument _prepareIteration:options:instrumentals:errors:](v94, "_prepareIteration:options:instrumentals:errors:", v41, v90, v44, 0);
      if (v48)
      {
        memset(&buf, 0, sizeof(buf));
        pthread_attr_init(&buf);
        pthread_attr_setschedpolicy(&buf, 4);
        pthread_attr_set_qos_class_np(&buf, QOS_CLASS_USER_INTERACTIVE, 0);
        v105 = 0;
        -[MXMInstrument _setupAndRunWithIteration:spawnThread:attrs:pthread:returnCode:](v37, "_setupAndRunWithIteration:spawnThread:attrs:pthread:returnCode:", v41, 1, &buf, &v105, 0);
        *((_QWORD *)v86 + v38) = v105;
        pthread_attr_destroy(&buf);
      }
      else
      {
        -[MXMInstrument setCurrentIteration:](v37, "setCurrentIteration:", v41);
        -[MXMInstrument _setupAndRunWithIteration:spawnThread:attrs:pthread:returnCode:](v37, "_setupAndRunWithIteration:spawnThread:attrs:pthread:returnCode:", v41, 0, 0, 0, &v96[8 * v38]);
        -[MXMInstrument setCurrentIteration:](v37, "setCurrentIteration:", 0);
      }
      *(_QWORD *)&v97[8 * v38] = v41;
      if (*((double *)v41 + 22) == 0.0 || *((double *)v41 + 23) == 0.0)
      {

        ++v38;
        v15 = v95;
      }
      else
      {
        +[MXMInstrument activeInstrument](MXMInstrument, "activeInstrument");
        v50 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v51 = v50[8];

        v15 = v95;
        if (!v51)
          break;
        ++v38;
      }
    }
    while (v38 < v15);
    v52 = 0;
    v53 = 0x24D192000uLL;
    v29 = v92;
    do
    {
      v54 = objc_alloc_init(*(Class *)(v53 + 2376));
      v55 = *(void **)&v97[8 * v52];
      -[MXMInstrument setCurrentIteration:](v37, "setCurrentIteration:", v55);
      if (v29)
        pthread_join(*((pthread_t *)v86 + v52), (void **)&v96[8 * v52]);
      if (*(_QWORD *)&v96[8 * v52])
      {
        -[MXMInstrument setActive:](v37, "setActive:", 0);
        v75 = (void *)MEMORY[0x24BDBCE88];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Non-zero exit code from iteration [%i] code=%i"), *(_QWORD *)v55, *(_QWORD *)&v96[8 * v52]);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "exceptionWithName:reason:userInfo:", CFSTR("Failed to run Block"), v76, 0);
        v77 = (id)objc_claimAutoreleasedReturnValue();

        objc_exception_throw(v77);
      }
      if ((v98 & 2) != 0)
      {
        v103 = 0u;
        v104 = 0u;
        v101 = 0u;
        v102 = 0u;
        v56 = *((id *)v55 + 17);
        v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v101, v107, 16);
        if (v57)
        {
          v58 = v57;
          v59 = *(_QWORD *)v102;
          do
          {
            for (i = 0; i != v58; ++i)
            {
              if (*(_QWORD *)v102 != v59)
                objc_enumerationMutation(v56);
              v61 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
              v99 = 0;
              v100 = 0;
              objc_msgSend(v61, "harvestData:error:", &v100, &v99);
              v62 = v100;
              v63 = v99;
              v64 = v63;
              if (v62)
                v65 = v63 == 0;
              else
                v65 = 0;
              if (!v65)
              {
                objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                v91 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "description");
                v84 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v91, "handleFailureInMethod:object:file:lineNumber:description:", v83, v94, CFSTR("MXMInstrument.m"), 902, v84);

              }
              objc_msgSend(v54, "appendData:", v62);

            }
            v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v101, v107, 16);
          }
          while (v58);
        }

        objc_msgSend(v93, "setObject:atIndexedSubscript:", v54, v52);
        v37 = v94;
        v29 = v92;
        v53 = 0x24D192000;
      }
      _Block_release(*((const void **)v55 + 18));

      free(v55);
      -[MXMInstrument setCurrentIteration:](v37, "setCurrentIteration:", 0);

      ++v52;
    }
    while (v52 != v95);
  }
  -[MXMInstrument setCurrentIteration:](v37, "setCurrentIteration:", 0);
  if ((v29 & 1) != 0)
    free(v86);
  objc_autoreleasePoolPop(v80);
  v66 = v90;
  v67 = (void *)v82;
  if (v81)
    -[MXMInstrument _makePerfDataFromMXMResults:testName:](v37, "_makePerfDataFromMXMResults:testName:", v93, v82);
  if (-[MXMInstrument active](v37, "active"))
    -[MXMInstrument setActive:](v37, "setActive:", 0);

  return v93;
}

- (void)_makePerfDataFromMXMResults:(id)a3 testName:(id)a4
{
  id v6;
  id v7;
  FILE *v8;
  FILE *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  NSData *perfMetricsPerfdata;
  NSObject *v28;
  NSData *v29;
  NSObject *v30;
  NSData *v31;
  MXMInstrument *v32;
  id v33;
  void *v34;
  uint64_t v35;
  id obj;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[16];
  size_t __sizep;
  char *__bufp;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  __sizep = 0;
  __bufp = 0;
  v8 = open_memstream(&__bufp, &__sizep);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    if (pdwriter_open_stream())
    {
      v32 = self;
      v33 = v7;
      if (objc_msgSend(v6, "count"))
      {
        v10 = 0;
        v34 = v6;
        do
        {
          v35 = v10;
          objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          obj = v11;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
          if (v12)
          {
            v13 = v12;
            v37 = *(_QWORD *)v39;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v39 != v37)
                  objc_enumerationMutation(obj);
                v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
                objc_msgSend(v15, "attributeWithName:", CFSTR("XCT Reporting Display Name"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "stringValue");
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v15, "samples");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "firstObject");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "asMeasurementValue");
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v20, "unit");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "measurementByConvertingToUnit:", v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_retainAutorelease(v17);
                objc_msgSend(v23, "UTF8String");
                objc_msgSend(v20, "unit");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "symbol");
                v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                objc_msgSend(v25, "UTF8String");
                objc_msgSend(v22, "doubleValue");
                pdwriter_new_value();

              }
              v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
            }
            while (v13);
          }

          v6 = v34;
          v10 = v35 + 1;
        }
        while (v35 + 1 < (unint64_t)objc_msgSend(v34, "count"));
      }
      pdwriter_close();
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", __bufp, __sizep, 1);
      v26 = objc_claimAutoreleasedReturnValue();
      perfMetricsPerfdata = v32->_perfMetricsPerfdata;
      v32->_perfMetricsPerfdata = (NSData *)v26;

      v7 = v33;
    }
    else
    {
      _MXMGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214474000, v30, OS_LOG_TYPE_ERROR, "unable to open stream to write perfdata", buf, 2u);
      }

      v31 = self->_perfMetricsPerfdata;
      self->_perfMetricsPerfdata = 0;

      fclose(v9);
      free(__bufp);
    }
  }
  else
  {
    _MXMGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214474000, v28, OS_LOG_TYPE_ERROR, "unable to open stream to write perfdata", buf, 2u);
    }

    v29 = self->_perfMetricsPerfdata;
    self->_perfMetricsPerfdata = 0;

  }
}

- (id)_makeInstrumentalsForIteration:(id)a3 shouldCopy:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * v11);
        v13 = v12;
        if (v4)
        {
          v14 = objc_msgSend(v12, "copy", (_QWORD)v16);

          v13 = (void *)v14;
        }
        objc_msgSend(v6, "addObject:", v13, (_QWORD)v16);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)_valueWithOption:(id)a3 userOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  else
    -[MXMInstrument _defaultValueWithOption:](self, "_defaultValueWithOption:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_defaultValueWithOption:(id)a3
{
  id v3;
  const __CFString *v4;
  char v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.metricmeasurement.instrument.options.QuiesceCpuIdlePercent")) & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.metricmeasurement.instrument.options.QuiesceCpuIdleTimeLimit")) & 1) != 0)
  {
    v4 = (const __CFString *)&unk_24D19CA90;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.metricmeasurement.instrument.options.PerformanceTraceConfigurations")) & 1) != 0)
  {
    v4 = (const __CFString *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.metricmeasurement.instrument.options.PerformanceTraceEnabled")) & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.metricmeasurement.instrument.options.PerfdataEnabled")) & 1) != 0)
    {
      goto LABEL_9;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.metricmeasurement.instrument.options.PerfdataTestName")) & 1) != 0)
    {
      v4 = CFSTR("unknownTest");
      goto LABEL_4;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.metricmeasurement.instrument.options.IterationCount")) & 1) != 0)
    {
      v4 = (const __CFString *)&unk_24D19CAA8;
      goto LABEL_4;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.metricmeasurement.instrument.options.ScheduleKickOffOnNewThread")) & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.metricmeasurement.instrument.options.EnableThreadParallelization")) & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.metricmeasurement.instrument.options.SkipMetricMeasurement")) & 1) != 0)
    {
LABEL_9:
      v4 = (const __CFString *)MEMORY[0x24BDBD1C0];
    }
    else
    {
      v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.metricmeasurement.instrument.options.UncacheBetweenIterations"));
      v4 = (const __CFString *)MEMORY[0x24BDBD1A8];
      if ((v6 & 1) == 0
        && !objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.metricmeasurement.instrument.options.TerminateProcessBetweenIterations")))
      {
        v4 = 0;
      }
    }
  }
LABEL_4:

  return (id)v4;
}

- (id)_validOptionKeys
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObjects:", CFSTR("com.apple.metricmeasurement.instrument.options.IterationCount"), CFSTR("com.apple.metricmeasurement.instrument.options.ThreadId"), CFSTR("com.apple.metricmeasurement.instrument.options.EnableThreadParallelization"), CFSTR("com.apple.metricmeasurement.instrument.options.ScheduleKickOffOnNewThread"), CFSTR("com.apple.metricmeasurement.instrument.options.PerformanceTraceEnabled"), CFSTR("com.apple.metricmeasurement.instrument.options.PerformanceTraceConfigurations"), CFSTR("com.apple.metricmeasurement.instrument.options.PerfdataEnabled"), CFSTR("com.apple.metricmeasurement.instrument.options.PerfdataTestName"), CFSTR("com.apple.metricmeasurement.instrument.options.QuiesceCpuIdlePercent"), CFSTR("com.apple.metricmeasurement.instrument.options.QuiesceCpuIdleTimeLimit"), CFSTR("com.apple.metricmeasurement.instrument.options.SkipMetricMeasurement"), CFSTR("com.apple.metricmeasurement.instrument.options.UncacheBetweenIterations"), CFSTR("com.apple.metricmeasurement.instrument.options.TerminateProcessBetweenIterations"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  if (-[MXMInstrument currentIteration](self, "currentIteration"))
    free(-[MXMInstrument currentIteration](self, "currentIteration"));
  v3.receiver = self;
  v3.super_class = (Class)MXMInstrument;
  -[MXMInstrument dealloc](&v3, sel_dealloc);
}

- (NSArray)instrumentals
{
  return self->_instrumentals;
}

- (NSURL)performanceTraceFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)perfMetricsPerfdata
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)performanceTraceFileSandboxExtensionToken
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- ($6284FEDF7B3A0B615FD11F40896223C5)currentIteration
{
  return self->_currentIteration;
}

- (void)setCurrentIteration:(id *)a3
{
  self->_currentIteration = a3;
}

- (OS_dispatch_queue)instrumentalsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)didQuiesce
{
  return self->_didQuiesce;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentalsQueue, 0);
  objc_storeStrong((id *)&self->_performanceTraceFileSandboxExtensionToken, 0);
  objc_storeStrong((id *)&self->_perfMetricsPerfdata, 0);
  objc_storeStrong((id *)&self->_performanceTraceFileURL, 0);
  objc_storeStrong((id *)&self->_instrumentals, 0);
}

@end
