@implementation EKDiagnosticsCollector

- (EKDiagnosticsCollector)initWithEventStore:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  EKDiagnosticsCollector *v9;
  EKDiagnosticsCollector *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *files;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EKDiagnosticsCollector;
  v9 = -[EKDiagnosticsCollector init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v10->_trafficLogsCollectionMode = 2;
    v10->_lock._os_unfair_lock_opaque = 0;
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    files = v10->_files;
    v10->_files = v11;

  }
  return v10;
}

- (void)collectDiagnostics
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  uint64_t token;
  unint64_t v8;
  _QWORD v9[5];

  -[EKEventStore connection](self->_store, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_token = objc_msgSend(v3, "addCancellableRemoteOperation:", self);

  v4 = !self->_redactLogs;
  -[EKEventStore connection](self->_store, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CADOperationProxySync");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  token = self->_token;
  v8 = -[EKDiagnosticsCollector trafficLogsCollectionMode](self, "trafficLogsCollectionMode");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__EKDiagnosticsCollector_collectDiagnostics__block_invoke;
  v9[3] = &unk_1E47876F0;
  v9[4] = self;
  objc_msgSend(v6, "CADDiagnosticsCollectWithToken:options:trafficLogsCollectionMode:reply:", token, v4, v8, v9);

}

void __44__EKDiagnosticsCollector_collectDiagnostics__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  if ((_DWORD)a2)
  {
    v4 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __44__EKDiagnosticsCollector_collectDiagnostics__block_invoke_cold_1(v4, a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeCancellableRemoteOperation:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 16));

  }
}

- (void)cancelDiagnosticsCollection
{
  id v3;

  -[EKEventStore connection](self->_store, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRemoteOperation:", self->_token);

}

- (NSArray)files
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary allKeys](self->_files, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)cancel
{
  void *v3;
  id v4;

  -[EKEventStore connection](self->_store, "connection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CADOperationProxySync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CADDiagnosticsCancelCollectionWithToken:reply:", self->_token, &__block_literal_global_62);

}

void __32__EKDiagnosticsCollector_cancel__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  if ((_DWORD)a2)
  {
    v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __32__EKDiagnosticsCollector_cancel__block_invoke_cold_1(v3, a2);
  }
}

- (void)disconnected
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_finished)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_finished = 1;
    os_unfair_lock_unlock(p_lock);
    -[EKDiagnosticsCollector delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", 1015);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "diagnosticsCollector:finishedWithError:", self, v4);

    }
  }
}

- (void)receivedBatchResultsFromServer:(id)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  const __CFString *v19;
  void *v20;
  EKDiagnosticsCollector *v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  id v29;
  id v30;
  os_unfair_lock_t lock;
  uint64_t v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v4 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_finished)
  {
    os_unfair_lock_unlock(&self->_lock);
    v7 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKDiagnosticsCollector receivedBatchResultsFromServer:finished:].cold.1((uint64_t)v6, v7);
  }
  else
  {
    v28 = v4;
    if (v4)
      self->_finished = 1;
    lock = &self->_lock;
    os_unfair_lock_unlock(&self->_lock);
    v29 = v6;
    v30 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v35;
      v11 = CFSTR("file");
      do
      {
        v12 = 0;
        v32 = v9;
        do
        {
          if (*(_QWORD *)v35 != v10)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v12);
          objc_msgSend(v13, "objectForKeyedSubscript:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "url");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("status"));
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if (v15)
            v18 = v16 == 0;
          else
            v18 = 1;
          if (!v18)
          {
            v19 = v11;
            os_unfair_lock_lock(lock);
            -[NSMutableDictionary objectForKeyedSubscript:](self->_files, "objectForKeyedSubscript:", v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = self;
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_files, "setObject:forKeyedSubscript:", v17, v15);
            os_unfair_lock_unlock(lock);
            v22 = objc_msgSend(v20, "unsignedIntegerValue");
            v23 = objc_msgSend(v17, "unsignedIntegerValue");
            if (v22)
              v24 = 1;
            else
              v24 = (unint64_t)(v23 - 1) > 1;
            if (!v24)
              objc_msgSend(v30, "addObject:", v15);

            self = v21;
            v11 = v19;
            v9 = v32;
          }

          ++v12;
        }
        while (v9 != v12);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v9);
    }

    -[EKDiagnosticsCollector delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_determinedOutputFiles)
    {
      self->_determinedOutputFiles = 1;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[EKDiagnosticsCollector files](self, "files");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "diagnosticsCollector:determinedExpectedOutputFiles:", self, v26);

      }
    }
    if (objc_msgSend(v30, "count") && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v30, "allObjects");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "diagnosticsCollector:createdOutputFiles:", self, v27);

    }
    v6 = v29;
    if (v28 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v25, "diagnosticsCollector:finishedWithError:", self, 0);

  }
}

- (BOOL)redactLogs
{
  return self->_redactLogs;
}

- (void)setRedactLogs:(BOOL)a3
{
  self->_redactLogs = a3;
}

- (unint64_t)trafficLogsCollectionMode
{
  return self->_trafficLogsCollectionMode;
}

- (void)setTrafficLogsCollectionMode:(unint64_t)a3
{
  self->_trafficLogsCollectionMode = a3;
}

- (EKDiagnosticsCollectionDelegate)delegate
{
  return (EKDiagnosticsCollectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

void __44__EKDiagnosticsCollector_collectDiagnostics__block_invoke_cold_1(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = a1;
  objc_msgSend(v3, "errorWithCADResult:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v6, v7, "Error starting diagnostics collection: %@", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __32__EKDiagnosticsCollector_cancel__block_invoke_cold_1(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = a1;
  objc_msgSend(v3, "errorWithCADResult:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v6, v7, "Error stopping diagnostics collection: %@", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)receivedBatchResultsFromServer:(uint64_t)a1 finished:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A2318000, a2, OS_LOG_TYPE_ERROR, "Ignoring new results, because we're already finished: %@", (uint8_t *)&v2, 0xCu);
}

@end
