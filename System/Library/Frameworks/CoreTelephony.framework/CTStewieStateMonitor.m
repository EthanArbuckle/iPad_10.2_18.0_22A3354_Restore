@implementation CTStewieStateMonitor

- (BOOL)start
{
  xpc_object_t v3;
  xpc_object_t v4;
  nw_parameters_t secure_udp;
  NSObject *host;
  BOOL v7;
  NSObject *v8;

  v3 = xpc_array_create(0, 0);
  xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, "CoreTelephony");
  v4 = xpc_array_create(0, 0);
  xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, "Stewie");
  secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED20], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED18]);
  nw_parameters_set_allow_ultra_constrained();
  if (!secure_udp)
  {
    CTLogStewieMonitor();
    host = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(host, OS_LOG_TYPE_ERROR))
      -[CTStewieDataClient createConnectionPairIfRequired].cold.1();
    goto LABEL_10;
  }
  nw_parameters_set_required_netagent_classes();
  host = nw_endpoint_create_host("monitor", "42");
  if (!host)
  {
    CTLogStewieMonitor();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CTStewieStateMonitor start].cold.2();

LABEL_10:
    v7 = 0;
    goto LABEL_13;
  }
  os_unfair_lock_lock(&self->fLock);
  if (self->fStarted)
  {
    v7 = 1;
  }
  else
  {
    v7 = -[CTStewieStateMonitor startWithEndpoint:parameters:](self, "startWithEndpoint:parameters:", host, secure_udp);
    self->fStarted = v7;
  }
  os_unfair_lock_unlock(&self->fLock);
LABEL_13:

  return v7;
}

- (id)getState
{
  os_unfair_lock_s *p_fLock;
  CTStewieState *v4;

  p_fLock = &self->fLock;
  os_unfair_lock_lock(&self->fLock);
  v4 = self->fState;
  os_unfair_lock_unlock(p_fLock);
  return v4;
}

- (CTStewieStateMonitor)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  CTStewieStateMonitor *v8;
  CTStewieState *v9;
  CTStewieState *fState;
  CTStewieStateMonitor *v11;
  NSObject *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CTStewieStateMonitor;
  v8 = -[CTStewieStateMonitor init](&v14, sel_init);
  if (!v8)
    goto LABEL_10;
  if ((objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EDD26480) & 1) == 0)
  {
    CTLogStewieMonitor();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CTStewieStateMonitor initWithDelegate:queue:].cold.2();
    goto LABEL_9;
  }
  if (!v7)
  {
    CTLogStewieMonitor();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CTStewieStateMonitor initWithDelegate:queue:].cold.1();
LABEL_9:

LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  v8->fLock._os_unfair_lock_opaque = 0;
  v9 = objc_alloc_init(CTStewieState);
  fState = v8->fState;
  v8->fState = v9;

  objc_storeWeak((id *)&v8->fDelegate, v6);
  objc_storeStrong((id *)&v8->fDelegateQueue, a4);
  v8->fStarted = 0;
  v11 = v8;
LABEL_11:

  return v11;
}

- (BOOL)startWithEndpoint:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  OS_nw_path_evaluator *evaluator_for_endpoint;
  OS_nw_path_evaluator *fPathEvaluator;
  char updated;
  void *v11;
  CTStewieState *v12;
  CTStewieState *fState;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  evaluator_for_endpoint = (OS_nw_path_evaluator *)nw_path_create_evaluator_for_endpoint();
  fPathEvaluator = self->fPathEvaluator;
  self->fPathEvaluator = evaluator_for_endpoint;

  if (self->fPathEvaluator)
  {
    location = 0;
    objc_initWeak(&location, self);
    v18 = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v19, &location);
    updated = nw_path_evaluator_set_update_handler();
    v11 = self->fPathEvaluator;
    if ((updated & 1) != 0)
    {
      v11 = (void *)nw_path_evaluator_copy_path();
      if (v11)
      {
        -[CTStewieStateMonitor stateFromPath:](self, "stateFromPath:", v11, v18, 3221225472, __53__CTStewieStateMonitor_startWithEndpoint_parameters___block_invoke, &unk_1E1531E18);
        v12 = (CTStewieState *)objc_claimAutoreleasedReturnValue();
        fState = self->fState;
        self->fState = v12;

        v14 = 1;
      }
      else
      {
        CTLogStewieMonitor();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[CTStewieStateMonitor startWithEndpoint:parameters:].cold.2();

        nw_path_evaluator_cancel();
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
      self->fPathEvaluator = 0;
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    CTLogStewieMonitor();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CTStewieStateMonitor startWithEndpoint:parameters:].cold.1();

    v14 = 0;
  }

  return v14;
}

void __53__CTStewieStateMonitor_startWithEndpoint_parameters___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "stateFromPath:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)v4 + 2);
    if ((objc_msgSend(*((id *)v4 + 2), "isEqual:", v5) & 1) != 0)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)v4 + 2);
    }
    else
    {
      objc_storeStrong((id *)v4 + 2, v5);
      os_unfair_lock_unlock((os_unfair_lock_t)v4 + 2);
      v6 = objc_loadWeakRetained((id *)v4 + 3);
      objc_msgSend(v6, "stateChanged:", v5);

    }
  }

}

- (id)stateFromPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  CTStewieState *v7;
  void *v8;
  CTStewieState *v9;
  _QWORD applier[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a3;
  if (v3)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__18;
    v16 = __Block_byref_object_dispose__18;
    v17 = 0;
    v4 = (void *)nw_path_copy_netagent_dictionary();
    v5 = v4;
    if (v4)
    {
      applier[0] = MEMORY[0x1E0C809B0];
      applier[1] = 3221225472;
      applier[2] = __38__CTStewieStateMonitor_stateFromPath___block_invoke;
      applier[3] = &unk_1E1531E40;
      applier[4] = &v12;
      xpc_dictionary_apply(v4, applier);
    }
    v6 = (void *)v13[5];
    if (!v6)
    {
      v7 = objc_alloc_init(CTStewieState);
      v8 = (void *)v13[5];
      v13[5] = (uint64_t)v7;

      v6 = (void *)v13[5];
    }
    v9 = v6;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v9 = objc_alloc_init(CTStewieState);
  }

  return v9;
}

uint64_t __38__CTStewieStateMonitor_stateFromPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  const char *data;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  CTStewieState *v10;
  uint64_t v11;
  NSObject *v12;
  size_t length;

  v4 = a3;
  length = 0;
  data = (const char *)xpc_dictionary_get_data(v4, "data", &length);
  v6 = data;
  v7 = 1;
  if (data)
  {
    if (length >= 0xD8)
    {
      v8 = *((unsigned int *)data + 53);
      if (length == v8 + 216 && !strcmp(data + 16, "CoreTelephony"))
      {
        v9 = strcmp(v6 + 48, "Stewie");
        if (v8 >= 0xCD && !v9)
        {
          if (v8 == 226)
          {
            v10 = -[CTStewieState initWithStewieState:]([CTStewieState alloc], "initWithStewieState:", v6 + 420);
            v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
            v12 = *(NSObject **)(v11 + 40);
            *(_QWORD *)(v11 + 40) = v10;
          }
          else
          {
            CTLogStewieMonitor();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
              __38__CTStewieStateMonitor_stateFromPath___block_invoke_cold_1(v8 - 204, v12);
          }

          v7 = 0;
        }
      }
    }
  }

  return v7;
}

- (void)dealloc
{
  OS_nw_path_evaluator *fPathEvaluator;
  objc_super v4;

  nw_path_evaluator_cancel();
  fPathEvaluator = self->fPathEvaluator;
  self->fPathEvaluator = 0;

  v4.receiver = self;
  v4.super_class = (Class)CTStewieStateMonitor;
  -[CTStewieStateMonitor dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fPathEvaluator, 0);
  objc_storeStrong((id *)&self->fDelegateQueue, 0);
  objc_destroyWeak((id *)&self->fDelegate);
  objc_storeStrong((id *)&self->fState, 0);
}

- (void)initWithDelegate:queue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Must provide queue for initializing CTStewieStateMonitor", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDelegate:queue:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Delegate must conform to CTStewieStateMonitorDelegate protocol", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)startWithEndpoint:parameters:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Failed to create evaluator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)startWithEndpoint:parameters:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Failed to copy path from evaluator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)start
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Failed to create endpoint", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __38__CTStewieStateMonitor_stateFromPath___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134218240;
  v3 = a1;
  v4 = 2048;
  v5 = 22;
  _os_log_error_impl(&dword_18425C000, a2, OS_LOG_TYPE_ERROR, "Possible size mis-match for StewieState. Got: %lu bytes, was expecting %lu bytes", (uint8_t *)&v2, 0x16u);
}

@end
