@implementation MOConnection

- (MOConnection)initWithName:(id)a3
{
  id v5;
  MOConnection *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *pendingRequests;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MOConnection;
  v6 = -[MOConnection init](&v10, sel_init);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingRequests = v6->_pendingRequests;
    v6->_pendingRequests = v7;

    v6->_pendingRequestCounter = 0;
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v6;
}

- (void)callBlock:(id)a3 onInterruption:(id)a4
{
  void (**v6)(id, _QWORD *);
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = (void (**)(id, _QWORD *))a3;
  v7 = a4;
  -[MOConnection runBlockStarted:withConnectionError:](self, "runBlockStarted:withConnectionError:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__MOConnection_callBlock_onInterruption___block_invoke;
    v9[3] = &unk_1E8541EB8;
    objc_copyWeak(&v11, &location);
    v10 = v8;
    v6[2](v6, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

uint64_t __41__MOConnection_callBlock_onInterruption___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_msgSend(WeakRetained, "runBlockCompleted:", *(_QWORD *)(a1 + 32));

  return v3;
}

- (id)runBlockStarted:(id)a3 withConnectionError:(id)a4
{
  id v6;
  id v7;
  MOConnection *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = self;
    objc_sync_enter(v8);
    ++v8->_pendingRequestCounter;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = CFSTR("requestBlock");
    v10 = (void *)MEMORY[0x1D1799054](v6);
    v14[1] = CFSTR("interruptionBlock");
    v15[0] = v10;
    v11 = (void *)MEMORY[0x1D1799054](v7);
    v15[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_pendingRequests, "setObject:forKeyedSubscript:", v12, v9);

    objc_sync_exit(v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)runBlockCompleted:(id)a3
{
  id v4;
  MOConnection *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableDictionary objectForKeyedSubscript:](v5->_pendingRequests, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary removeObjectForKey:](v5->_pendingRequests, "removeObjectForKey:", v4);
    v7 = v6 != 0;
    objc_sync_exit(v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)onConnectionInterrupted
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__MOConnection_onConnectionInterrupted__block_invoke;
  v8[3] = &unk_1E8541EE0;
  objc_copyWeak(&v9, &location);
  v2 = (void *)MEMORY[0x1D1799054](v8);
  v6 = (void *)MEMORY[0x1D1799054](v2, v3, v4, v5);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __39__MOConnection_onConnectionInterrupted__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  id *obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  _QWORD v27[3];

  v27[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v19 = objc_msgSend(WeakRetained[1], "count");
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v19)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
        __39__MOConnection_onConnectionInterrupted__block_invoke_cold_1((uint64_t)v2, v19, v4);
    }
    else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      __39__MOConnection_onConnectionInterrupted__block_invoke_cold_2((uint64_t)v2, v4);
    }

    v5 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    v27[0] = CFSTR("remote process execution was interrupted");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 4097, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v2;
    objc_sync_enter(obj);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v2[1], "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x1D1798EEC]();
          objc_msgSend(v2[1], "objectForKeyedSubscript:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2[1], "removeObjectForKey:", v12);
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("interruptionBlock"));
          v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v15)[2](v15, v7);

          objc_autoreleasePoolPop(v13);
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    objc_sync_exit(obj);
    +[MODiagnosticReporter defaultReporter](MODiagnosticReporter, "defaultReporter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v19 == 0;
    if (!v16)
      v17 = 1;
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XPC Connection with %@ ended prematurely"), obj[4]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "reportIncident:subtype:context:", CFSTR("XPCInterruption"), CFSTR("Other"), v18);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_proxy, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
}

void __39__MOConnection_onConnectionInterrupted__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  v5 = 136315394;
  v6 = OUTLINED_FUNCTION_0_5(a1);
  v7 = 2048;
  v8 = a2;
  _os_log_fault_impl(&dword_1CAE42000, a3, OS_LOG_TYPE_FAULT, "[%s] The connection has been interrupted with %lu pending tasks", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_4();
}

void __39__MOConnection_onConnectionInterrupted__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v3;
  uint64_t v4;

  v3 = 136315138;
  v4 = OUTLINED_FUNCTION_0_5(a1);
  _os_log_error_impl(&dword_1CAE42000, a2, OS_LOG_TYPE_ERROR, "[%s] The connection has been interrupted with zero pending tasks", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_4();
}

@end
