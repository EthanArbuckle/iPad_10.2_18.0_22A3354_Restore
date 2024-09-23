@implementation CPLNetworkWatcher

- (CPLNetworkWatcher)initWithQueue:(id)a3
{
  id v5;
  CPLNetworkWatcher *v6;
  CPLNetworkWatcher *v7;
  CPLNetworkState *v8;
  CPLNetworkState *networkState;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLNetworkWatcher;
  v6 = -[CPLNetworkWatcher init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = -[CPLNetworkState initWithNetworkPath:cellularRestricted:inAirplaneMode:]([CPLNetworkState alloc], "initWithNetworkPath:cellularRestricted:inAirplaneMode:", 0, 0, 0);
    networkState = v7->_networkState;
    v7->_networkState = v8;

  }
  return v7;
}

- (BOOL)_isRestrictedPath:(id)a3 policies:(id)a4
{
  NSObject *v5;
  id v6;
  _BOOL4 v7;
  char cell_data_allowed_from_policy;
  void *v10;

  v5 = a3;
  v6 = a4;
  if (!v5)
  {
LABEL_5:
    cell_data_allowed_from_policy = 0;
    goto LABEL_6;
  }
  v7 = nw_path_uses_interface_type(v5, nw_interface_type_cellular);
  cell_data_allowed_from_policy = 0;
  if (v6 && v7)
  {
    if (MEMORY[0x1B5E09070](v6) == MEMORY[0x1E0C812C8] && xpc_array_get_count(v6))
    {
      xpc_array_get_value(v6, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      cell_data_allowed_from_policy = network_usage_policy_get_cell_data_allowed_from_policy();

      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_6:

  return cell_data_allowed_from_policy;
}

- (void)_updateNetworkState:(id)a3
{
  id v5;
  char v6;
  NSObject *v7;
  CPLNetworkState *networkState;
  id WeakRetained;
  int v10;
  CPLNetworkState *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "isFunctionallyEqual:", self->_networkState);
  objc_storeStrong((id *)&self->_networkState, a3);
  if ((v6 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLNetworkOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        networkState = self->_networkState;
        v10 = 138543362;
        v11 = networkState;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Network path did change to '%{public}@'", (uint8_t *)&v10, 0xCu);
      }

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "watcher:stateDidChangeToNetworkState:", self, self->_networkState);

  }
}

- (void)_updateCellularPolicy:(id)a3
{
  id v4;
  uint64_t bundle_from_policy;
  int cell_data_allowed_from_policy;
  NSObject *v7;
  const char *v8;
  CPLNetworkState *v9;
  void *v10;
  CPLNetworkState *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  bundle_from_policy = network_usage_policy_get_bundle_from_policy();
  cell_data_allowed_from_policy = network_usage_policy_get_cell_data_allowed_from_policy();

  if (!_CPLSilentLogging)
  {
    __CPLNetworkOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = "restricted";
      if (cell_data_allowed_from_policy)
        v8 = "not restricted";
      v12 = 136315394;
      v13 = bundle_from_policy;
      v14 = 2080;
      v15 = v8;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Updated cellular policy for %s: %s", (uint8_t *)&v12, 0x16u);
    }

  }
  v9 = [CPLNetworkState alloc];
  -[CPLNetworkState networkPath](self->_networkState, "networkPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CPLNetworkState initWithNetworkPath:cellularRestricted:inAirplaneMode:](v9, "initWithNetworkPath:cellularRestricted:inAirplaneMode:", v10, cell_data_allowed_from_policy ^ 1u, -[CPLNetworkState isInAirplaneMode](self->_networkState, "isInAirplaneMode"));

  -[CPLNetworkWatcher _updateNetworkState:](self, "_updateNetworkState:", v11);
}

- (void)_updateCellularPolicyFromPolicies:(id)a3
{
  void *v4;
  size_t count;
  void *v6;
  size_t v7;
  void *v8;
  const char *bundle_from_policy;
  xpc_object_t xarray;

  xarray = a3;
  v4 = (void *)MEMORY[0x1B5E08BF0]();
  if (xarray)
  {
    if (MEMORY[0x1B5E09070](xarray) == MEMORY[0x1E0C812C8])
    {
      count = xpc_array_get_count(xarray);
      v6 = xarray;
      if (count)
      {
        v7 = 0;
        while (1)
        {
          xpc_array_get_value(v6, v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          bundle_from_policy = (const char *)network_usage_policy_get_bundle_from_policy();
          if (bundle_from_policy)
          {
            if (!strcmp(bundle_from_policy, "com.apple.mobileslideshow"))
              break;
          }

          ++v7;
          v6 = xarray;
          if (count == v7)
            goto LABEL_3;
        }
        -[CPLNetworkWatcher _updateCellularPolicy:](self, "_updateCellularPolicy:", v8);

      }
    }
  }
LABEL_3:
  objc_autoreleasePoolPop(v4);

}

- (void)_getCellularPolicyWithClient:(network_usage_policy_client_s *)a3
{
  NSObject *v3;
  uint8_t buf[16];

  if (!_CPLSilentLogging)
  {
    __CPLNetworkOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Getting cellular policy", buf, 2u);
    }

  }
  network_usage_policy_get_for_bundle();
}

- (void)_updateAirplaneMode
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  CPLNetworkState *v6;
  void *v7;
  CPLNetworkState *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = -[RadiosPreferences airplaneMode](self->_radiosPreferences, "airplaneMode");
  if (!_CPLSilentLogging)
  {
    __CPLNetworkOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = "not in airplane mode";
      if ((_DWORD)v3)
        v5 = "in airplane mode";
      v9 = 136315138;
      v10 = v5;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Updated airplane mode: %s", (uint8_t *)&v9, 0xCu);
    }

  }
  v6 = [CPLNetworkState alloc];
  -[CPLNetworkState networkPath](self->_networkState, "networkPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CPLNetworkState initWithNetworkPath:cellularRestricted:inAirplaneMode:](v6, "initWithNetworkPath:cellularRestricted:inAirplaneMode:", v7, -[CPLNetworkState isCellularRestricted](self->_networkState, "isCellularRestricted"), v3);

  -[CPLNetworkWatcher _updateNetworkState:](self, "_updateNetworkState:", v8);
}

- (void)start
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __26__CPLNetworkWatcher_start__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_1672;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)dealloc
{
  NSObject *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  SEL v9;
  CPLNetworkWatcher *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_super v14;
  uint8_t buf[16];

  if (*(_OWORD *)&self->_monitor != 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "Network watcher has not been stopped before deallocation", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLNetworkWatcher.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("Network watcher has not been stopped before deallocation");
    v8 = v5;
    v9 = a2;
    v10 = self;
    v11 = v6;
    v12 = 199;
LABEL_14:
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, v11, v12, v7);

    abort();
  }
  if (self->_radiosPreferences)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_ERROR, "Radios preferences was not nullified before deallocation", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLNetworkWatcher.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("Radios preferences was not nullified before deallocation");
    v8 = v5;
    v9 = a2;
    v10 = self;
    v11 = v6;
    v12 = 200;
    goto LABEL_14;
  }
  v14.receiver = self;
  v14.super_class = (Class)CPLNetworkWatcher;
  -[CPLNetworkWatcher dealloc](&v14, sel_dealloc);
}

- (void)stop
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __25__CPLNetworkWatcher_stop__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_1672;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (NSString)endPoint
{
  return self->_endPoint;
}

- (CPLNetworkState)networkState
{
  return self->_networkState;
}

- (CPLNetworkWatcherDelegate)delegate
{
  return (CPLNetworkWatcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_networkState, 0);
  objc_storeStrong((id *)&self->_endPoint, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __25__CPLNetworkWatcher_stop__block_invoke(uint64_t a1)
{
  NSObject *v2;
  CPLNetworkState *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    if (!_CPLSilentLogging)
    {
      __CPLNetworkOSLogDomain();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEFAULT, "Stopping monitoring network path", v10, 2u);
      }

    }
    v3 = -[CPLNetworkState initWithNetworkPath:cellularRestricted:inAirplaneMode:]([CPLNetworkState alloc], "initWithNetworkPath:cellularRestricted:inAirplaneMode:", 0, 0, 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v3;

    nw_path_monitor_cancel(*(nw_path_monitor_t *)(*(_QWORD *)(a1 + 32) + 16));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = 0;

    network_usage_policy_destroy_client();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setDelegate:", 0);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = 0;

  }
}

void __26__CPLNetworkWatcher_start__block_invoke(uint64_t a1)
{
  nw_path_monitor_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t client;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint8_t buf[16];
  _QWORD update_handler[5];
  NSObject *v16;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = nw_path_monitor_create();
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = MEMORY[0x1E0C809B0];
    v5 = *(NSObject **)(v3 + 16);
    update_handler[0] = MEMORY[0x1E0C809B0];
    update_handler[1] = 3221225472;
    update_handler[2] = __26__CPLNetworkWatcher_start__block_invoke_2;
    update_handler[3] = &unk_1E60D7C40;
    update_handler[4] = v3;
    v6 = v2;
    v16 = v6;
    nw_path_monitor_set_update_handler(v5, update_handler);
    nw_path_monitor_set_queue(*(nw_path_monitor_t *)(*(_QWORD *)(a1 + 32) + 16), *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
    if (!_CPLSilentLogging)
    {
      __CPLNetworkOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Starting monitoring network path", buf, 2u);
      }

    }
    nw_path_monitor_start(*(nw_path_monitor_t *)(*(_QWORD *)(a1 + 32) + 16));
    client = network_usage_policy_create_client();
    v13 = *(_QWORD *)(a1 + 32);
    network_usage_policy_set_changed_handler();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = client;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFA9B8]), "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v4, 3221225472, __26__CPLNetworkWatcher_start__block_invoke_7, &unk_1E60D7C18, v13, client);
    objc_msgSend(v9, "setDelegate:", *(_QWORD *)(a1 + 32));
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 32);
    *(_QWORD *)(v10 + 32) = v9;
    v12 = v9;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "refresh");
    objc_msgSend(*(id *)(a1 + 32), "_updateAirplaneMode");

  }
}

void __26__CPLNetworkWatcher_start__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  CPLNetworkState *v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) == *(_QWORD *)(a1 + 40))
  {
    v3 = a2;
    v4 = -[CPLNetworkState initWithNetworkPath:cellularRestricted:inAirplaneMode:]([CPLNetworkState alloc], "initWithNetworkPath:cellularRestricted:inAirplaneMode:", v3, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isCellularRestricted"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isInAirplaneMode"));

    objc_msgSend(*(id *)(a1 + 32), "_updateNetworkState:", v4);
  }
}

_QWORD *__26__CPLNetworkWatcher_start__block_invoke_7(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = a1 + 32;
  result = *(_QWORD **)(a1 + 32);
  if (*(_QWORD *)(v3 + 8) == result[3])
    return (_QWORD *)objc_msgSend(result, "_updateCellularPolicyFromPolicies:", a2);
  return result;
}

void __50__CPLNetworkWatcher__getCellularPolicyWithClient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  size_t count;
  void *v7;
  xpc_object_t xarray;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
    {
      xarray = v3;
      v5 = MEMORY[0x1B5E09070](v3);
      v4 = xarray;
      if (v5 == MEMORY[0x1E0C812C8])
      {
        count = xpc_array_get_count(xarray);
        v4 = xarray;
        if (count)
        {
          xpc_array_get_value(xarray, 0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "_updateCellularPolicy:", v7);

          v4 = xarray;
        }
      }
    }
  }

}

@end
